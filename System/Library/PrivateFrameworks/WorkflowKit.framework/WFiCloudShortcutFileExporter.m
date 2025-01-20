@interface WFiCloudShortcutFileExporter
- (WFFileRepresentation)signedShortcutFile;
- (void)exportWorkflowWithCompletion:(id)a3;
- (void)setSignedShortcutFile:(id)a3;
@end

@implementation WFiCloudShortcutFileExporter

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
  id v4 = a3;
  v5 = +[WFGallerySessionManager sharedManager];
  v6 = [(WFShortcutExporter *)self workflowRecord];
  v7 = [(WFShortcutExporter *)self workflowRecord];
  v8 = [v7 name];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke;
  v11[3] = &unk_1E65513C8;
  v13 = self;
  id v14 = v4;
  id v12 = v5;
  id v9 = v5;
  id v10 = v4;
  [v9 uploadWorkflow:v6 withName:v8 shortDescription:0 longDescription:0 private:1 completionHandler:v11];
}

void __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = [a2 pathComponents];
    v5 = [v3 arrayWithArray:v4];

    [v5 removeObject:@"/"];
    v6 = *(void **)(a1 + 32);
    v7 = [v5 objectAtIndexedSubscript:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2;
    v11[3] = &unk_1E65513A0;
    id v8 = *(id *)(a1 + 48);
    void v11[4] = *(void *)(a1 + 40);
    id v12 = v8;
    id v9 = (id)[v6 getWorkflowForIdentifier:v7 completionHandler:v11];
  }
  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v10();
  }
}

void __61__WFiCloudShortcutFileExporter_exportWorkflowWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  if (!v18)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v18;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 signedShortcutFile];
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    id v7 = v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    v6 = [v9 signedShortcutFile];

    if (!v6)
    {
      uint64_t v17 = *(void *)(a1 + 40);
      v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v6);
      goto LABEL_13;
    }
  }
  [*(id *)(a1 + 32) setSignedShortcutFile:v6];
  id v10 = [MEMORY[0x1E4F5AA28] temporaryDirectoryURL];
  v11 = [*(id *)(a1 + 32) workflowRecord];
  id v12 = [v11 name];
  v13 = [v10 URLByAppendingPathComponent:v12];
  id v14 = [v13 URLByAppendingPathExtension:@"shortcut"];

  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  v16 = [v6 fileURL];
  [v15 copyItemAtURL:v16 toURL:v14 error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_13:

LABEL_14:
}

@end