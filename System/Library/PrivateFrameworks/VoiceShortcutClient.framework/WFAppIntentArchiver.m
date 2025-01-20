@interface WFAppIntentArchiver
- (LNActionMetadata)actionMetadata;
- (LNFullyQualifiedActionIdentifier)actionIdentifier;
- (WFAppIntentArchiver)initWithIdentifier:(id)a3 actionMetadata:(id)a4;
- (id)archiveAction:(id)a3 error:(id *)a4;
- (id)resolvedActionMetadataWithError:(id *)a3;
- (id)unarchiveActionFromData:(id)a3 error:(id *)a4;
- (void)archiveAction:(id)a3 completion:(id)a4;
- (void)setActionMetadata:(id)a3;
- (void)unarchiveActionFromData:(id)a3 completion:(id)a4;
@end

@implementation WFAppIntentArchiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setActionMetadata:(id)a3
{
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (id)resolvedActionMetadataWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v5 = [(WFAppIntentArchiver *)self actionMetadata];

  if (v5)
  {
    v6 = [(WFAppIntentArchiver *)self actionMetadata];
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F72CE0]) initWithOptions:2];
    v8 = [(WFAppIntentArchiver *)self actionIdentifier];
    v9 = [v8 bundleIdentifier];

    v10 = [(WFAppIntentArchiver *)self actionIdentifier];
    v11 = [v10 actionIdentifier];

    v12 = [(WFAppIntentArchiver *)self actionIdentifier];
    v22[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v14 = [v7 actionsWithFullyQualifiedIdentifiers:v13 error:a3];
    v15 = [v14 objectForKeyedSubscript:v9];
    v6 = [v15 objectForKeyedSubscript:v11];

    [(WFAppIntentArchiver *)self setActionMetadata:v6];
    if (a3 && !v6 && !*a3)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F728C8];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21 = @"Intent not found";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      *a3 = [v16 errorWithDomain:v17 code:9004 userInfo:v18];
    }
  }
  return v6;
}

- (void)unarchiveActionFromData:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [(WFAppIntentArchiver *)self resolvedActionMetadataWithError:&v12];
  id v9 = v12;
  if (v8)
  {
    v10 = +[VCVoiceShortcutClient standardClient];
    [v10 unarchiveActionFromData:v6 withActionMetadata:v8 completion:v7];
  }
  else
  {
    v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFAppIntentArchiver unarchiveActionFromData:completion:]";
      _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for unarchived action", buf, 0xCu);
    }

    v10 = WFAppIntentArchiverErrorWithLocalizedErrorDescription(@"Failed to unarchive App Intent", v9);
    v7[2](v7, 0, v10);
  }
}

- (void)archiveAction:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [(WFAppIntentArchiver *)self resolvedActionMetadataWithError:&v12];
  id v9 = v12;
  if (v8)
  {
    v10 = +[VCVoiceShortcutClient standardClient];
    [v10 archiveAction:v6 withActionMetadata:v8 completion:v7];
  }
  else
  {
    v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFAppIntentArchiver archiveAction:completion:]";
      _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for archived action", buf, 0xCu);
    }

    v10 = WFAppIntentArchiverErrorWithLocalizedErrorDescription(@"Failed to archive App Intent", v9);
    v7[2](v7, 0, v10);
  }
}

- (id)unarchiveActionFromData:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v13 = 0;
  v7 = [(WFAppIntentArchiver *)self resolvedActionMetadataWithError:&v13];
  id v8 = v13;
  if (v7)
  {
    id v9 = +[VCVoiceShortcutClient standardClient];
    v10 = [v9 unarchiveActionFromData:v6 withActionMetadata:v7 error:a4];
  }
  else
  {
    v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[WFAppIntentArchiver unarchiveActionFromData:error:]";
      _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for unarchived action", buf, 0xCu);
    }

    if (a4)
    {
      WFAppIntentArchiverErrorWithLocalizedErrorDescription(@"Failed to unarchive App Intent", v8);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)archiveAction:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v13 = 0;
  v7 = [(WFAppIntentArchiver *)self resolvedActionMetadataWithError:&v13];
  id v8 = v13;
  if (v7)
  {
    id v9 = +[VCVoiceShortcutClient standardClient];
    v10 = [v9 archiveAction:v6 withActionMetadata:v7 error:a4];
  }
  else
  {
    v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[WFAppIntentArchiver archiveAction:error:]";
      _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Could not retrieve Action Metadata for archived action", buf, 0xCu);
    }

    if (a4)
    {
      WFAppIntentArchiverErrorWithLocalizedErrorDescription(@"Failed to archive App Intent", v8);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (WFAppIntentArchiver)initWithIdentifier:(id)a3 actionMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFAppIntentArchiver;
  id v8 = [(WFAppIntentArchiver *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    actionIdentifier = v8->_actionIdentifier;
    v8->_actionIdentifier = (LNFullyQualifiedActionIdentifier *)v9;

    uint64_t v11 = [v7 copy];
    actionMetadata = v8->_actionMetadata;
    v8->_actionMetadata = (LNActionMetadata *)v11;

    id v13 = v8;
  }

  return v8;
}

@end