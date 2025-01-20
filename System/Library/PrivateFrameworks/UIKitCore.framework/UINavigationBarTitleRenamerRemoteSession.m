@interface UINavigationBarTitleRenamerRemoteSession
@end

@implementation UINavigationBarTitleRenamerRemoteSession

void __70___UINavigationBarTitleRenamerRemoteSession__updateSessionWithAction___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 error];

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    [v4 cancelSessionAndNotify:0];
  }
}

void __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)qword_1EB258648;
  uint64_t v20 = qword_1EB258648;
  if (!qword_1EB258648)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getDOCFileRenamingSupportClass_block_invoke;
    v16[3] = &unk_1E52D9900;
    v16[4] = &v17;
    __getDOCFileRenamingSupportClass_block_invoke((uint64_t)v16);
    v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v15 = 0;
  v6 = [v3 fallbackRename:v4 toProposedName:v5 error:&v15];
  id v7 = v15;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke_2;
  block[3] = &unk_1E52E3968;
  id v8 = *(id *)(a1 + 48);
  id v13 = v7;
  id v14 = v8;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __84___UINavigationBarTitleRenamerRemoteSession__client_fileRenameDidFail_proposedName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) attachedRenamer];
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v9) {
    [v6 _session:v8 fileRenameDidEnd:v9];
  }
  else {
    [v6 _session:v8 fileRenameDidFail:v5];
  }
}

void __93___UINavigationBarTitleRenamerRemoteSession__server_willBeginRenamingWithText_selectedRange___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 text];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v3 selectedRange];
  uint64_t v9 = v8;

  uint64_t v10 = *(void *)(a1[6] + 8);
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v9;
  v11 = a1[4];
  dispatch_group_leave(v11);
}

void __87___UINavigationBarTitleRenamerRemoteSession__server_textFieldShouldEndEditingWithText___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 shouldEndEditing];
  id v3 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v3);
}

void __84___UINavigationBarTitleRenamerRemoteSession__server_textFieldDidEndEditingWithText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (v8) {
    objc_msgSend(WeakRetained, "fileRenameDidEnd:");
  }
  else {
    [WeakRetained fileRenameDidFail:v5 proposedName:*(void *)(a1 + 32)];
  }
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
  }
}

@end