@interface ResetLocalOnlyMode
@end

@implementation ResetLocalOnlyMode

uint64_t ___ResetLocalOnlyMode_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F39110];
  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___ResetLocalOnlyMode_block_invoke_2;
  v8[3] = &unk_1E5DD3158;
  id v9 = v3;
  id v6 = v3;
  [v4 resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary:v5 completion:v8];

  return 1;
}

void ___ResetLocalOnlyMode_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ResetLocalOnlyMode_block_invoke_3;
    block[3] = &unk_1E5DD0F30;
    v11 = @"Successfully reset local-only LibraryScopes";
    v12 = @"All local-only LibraryScopes were deleted and libraryScopeShareStates were reset on all Assets";
    id v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);

    v4 = v11;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"Reset action failed: %@", a3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ___ResetLocalOnlyMode_block_invoke_4;
    v6[3] = &unk_1E5DD0F30;
    v7 = @"Failed to reset local-only LibraryScopes";
    id v8 = v5;
    id v9 = *(id *)(a1 + 32);
    v4 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void ___ResetLocalOnlyMode_block_invoke_3(uint64_t a1)
{
}

void ___ResetLocalOnlyMode_block_invoke_4(uint64_t a1)
{
}

@end