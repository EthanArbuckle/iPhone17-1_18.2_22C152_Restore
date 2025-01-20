@interface WFP2PSignedShortcutFileExporter
- (WFFileRepresentation)signedShortcutFile;
- (void)exportWorkflowWithCompletion:(id)a3;
- (void)setSignedShortcutFile:(id)a3;
@end

@implementation WFP2PSignedShortcutFileExporter

- (void).cxx_destruct
{
}

- (void)setSignedShortcutFile:(id)a3
{
}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (void)exportWorkflowWithCompletion:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(WFShortcutExporter *)self workflowRecord];
  v6 = [v5 fileRepresentation];

  v7 = [(WFShortcutExporter *)self workflowRecord];
  v8 = [v7 name];
  [v6 setName:v8];

  id v39 = 0;
  v9 = [v6 fileDataWithError:&v39];
  id v10 = v39;
  if (v9)
  {
    v11 = [WFShortcutPackageFile alloc];
    v12 = [(WFShortcutExporter *)self workflowRecord];
    v13 = [v12 name];
    v14 = [(WFShortcutPackageFile *)v11 initWithShortcutData:v9 shortcutName:v13];

    id v15 = objc_alloc_init(MEMORY[0x1E4F9F668]);
    id v38 = v10;
    v16 = [v15 myAccountWithError:&v38];
    id v17 = v38;

    v36 = v14;
    if (v16)
    {
      id v37 = v17;
      v18 = [(WFShortcutPackageFile *)v14 generateSignedShortcutFileRepresentationWithAccount:v16 error:&v37];
      id v19 = v37;

      if (v18)
      {
        [(WFP2PSignedShortcutFileExporter *)self setSignedShortcutFile:v18];
        v20 = [v18 fileURL];
        v4[2](v4, v20, 0);
      }
      else
      {
        v34 = getWFGeneralLogObject();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[WFP2PSignedShortcutFileExporter exportWorkflowWithCompletion:]";
          __int16 v45 = 2112;
          id v46 = v19;
          _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_ERROR, "%s Failed to generate a signed shortcut with user's Apple Account: %@", buf, 0x16u);
        }

        ((void (**)(id, void *, id))v4)[2](v4, 0, v19);
        v18 = 0;
      }
      id v17 = v19;
    }
    else
    {
      id v35 = v15;
      v21 = getWFGeneralLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[WFP2PSignedShortcutFileExporter exportWorkflowWithCompletion:]";
        __int16 v45 = 2112;
        id v46 = v17;
        _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to retrieve the user's Apple Account for signing a shortcut: %@", buf, 0x16u);
      }

      v22 = WFLocalizedString(@"OK");
      v42[0] = v22;
      v23 = WFLocalizedString(@"Sign In");
      v42[1] = v23;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];

      v24 = (void *)[objc_alloc(MEMORY[0x1E4F5A7A8]) initWithHandlerBlock:&__block_literal_global_56053];
      v25 = (void *)MEMORY[0x1E4F28C58];
      v40[0] = *MEMORY[0x1E4F28588];
      v26 = WFLocalizedString(@"Sign In to iCloud to Share Shortcuts");
      v41[0] = v26;
      v40[1] = *MEMORY[0x1E4F28568];
      v27 = WFLocalizedString(@"Shortcuts are shared using iCloud. To share this shortcut, sign in to iCloud first.");
      uint64_t v28 = *MEMORY[0x1E4F28590];
      v41[1] = v27;
      v41[2] = v18;
      uint64_t v29 = *MEMORY[0x1E4F288B8];
      v40[2] = v28;
      v40[3] = v29;
      uint64_t v30 = *MEMORY[0x1E4F5ABC0];
      v41[3] = v24;
      v41[4] = v24;
      uint64_t v31 = *MEMORY[0x1E4F5ABA0];
      v40[4] = v30;
      v40[5] = v31;
      v40[6] = *MEMORY[0x1E4F28A50];
      v41[5] = &unk_1F2317178;
      v41[6] = v17;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:7];
      v33 = [v25 errorWithDomain:@"WFWorkflowErrorDomain" code:4 userInfo:v32];

      ((void (**)(id, void *, void *))v4)[2](v4, 0, v33);
      v16 = 0;
      id v15 = v35;
    }

    id v10 = v17;
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v10);
  }
}

void __64__WFP2PSignedShortcutFileExporter_exportWorkflowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if (a3 == 1)
  {
    v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ROOT"];
    v8 = [MEMORY[0x1E4F5A7A0] sharedContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__WFP2PSignedShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2;
    v9[3] = &unk_1E6558110;
    id v10 = v6;
    [v8 openURL:v7 completionHandler:v9];
  }
}

uint64_t __64__WFP2PSignedShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end