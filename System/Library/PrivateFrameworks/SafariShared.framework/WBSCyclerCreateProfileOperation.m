@interface WBSCyclerCreateProfileOperation
- (void)_createRandomProfileWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerCreateProfileOperation

- (void)_createRandomProfileWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 randomItemTitle];
  v8 = [v5 topLevelItem];
  uint64_t v9 = [v8 numberOfChildren];

  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Creating profile with title %{public}@ at index %lu", buf, 0x16u);
  }
  v11 = [v5 testTarget];
  v12 = [v5 topLevelItem];
  v13 = [v12 uniqueIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__WBSCyclerCreateProfileOperation__createRandomProfileWithContext_completionHandler___block_invoke;
  v17[3] = &unk_1E5C9A708;
  id v18 = v5;
  id v19 = v7;
  v20 = @"person";
  id v21 = v6;
  uint64_t v22 = v9;
  id v14 = v7;
  id v15 = v5;
  id v16 = v6;
  [v11 createProfileWithTitle:v14 symbolName:@"person" inListWithIdentifier:v13 reply:v17];
}

void __85__WBSCyclerCreateProfileOperation__createRandomProfileWithContext_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) topLevelItem];
    id v6 = (void *)[v5 copy];

    v7 = [(WBSCyclerItemRepresentation *)[WBSCyclerProfileRepresentation alloc] initWithTitle:*(void *)(a1 + 40) symbolImageName:*(void *)(a1 + 48) uniqueIdentifier:v9];
    [v6 insertChild:v7 atIndex:*(void *)(a1 + 64)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    id v6 = [*(id *)(a1 + 32) topLevelItem];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v6);
  }
}

@end