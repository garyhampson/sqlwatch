﻿CREATE TABLE [dbo].[sqlwatch_config_check_action_template]
(
	[action_template_id] smallint identity(1,1) not null,
	[action_template_description] varchar(1024) null,
	[action_template_fail_subject] nvarchar(max) not null,
	[action_template_fail_body] nvarchar(max) not null,
	[action_template_repeat_subject] nvarchar(max) not null,
	[action_template_repeat_body] nvarchar(max) not null,
	[action_template_recover_subject] nvarchar(max) not null,
	[action_template_recover_body] nvarchar(max) not null,
	[date_added] datetime default getdate() not null,
	[date_updated] datetime null,

	/*	primary key */
	constraint pk_sqlwatch_config_action_template primary key clustered (
		[action_template_id]
	)
)

GO

CREATE TRIGGER [dbo].[trg_sqlwatch_config_check_action_template_modify]
    ON [dbo].[sqlwatch_config_check_action_template]
    FOR UPDATE
    AS
    BEGIN
        SET NoCount ON
		update t
			set [date_updated] = getdate()
		from [dbo].[sqlwatch_config_check_action_template] t
		inner join inserted u
		on u.[action_template_id] = t.[action_template_id]
    END