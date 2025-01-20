@interface PBFProactivePosterGalleryLayoutProvider
- (void)fetchGalleryLayoutWithCompletion:(id)a3;
- (void)handlePosterDescriptorsDidChange:(id)a3 withCompletion:(id)a4;
@end

@implementation PBFProactivePosterGalleryLayoutProvider

- (void)fetchGalleryLayoutWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F4B040] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PBFProactivePosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke;
  v6[3] = &unk_1E6982B68;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchFaceGalleryConfigurationWithCompletion:v6];
}

void __76__PBFProactivePosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 posterBoardRepresentation];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)handlePosterDescriptorsDidChange:(id)a3 withCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v8 objectForKeyedSubscript:v13];
        v15 = objc_msgSend(v14, "bs_map:", &__block_literal_global_11);
        [v7 setObject:v15 forKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v16 = [MEMORY[0x1E4F4B040] sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__PBFProactivePosterGalleryLayoutProvider_handlePosterDescriptorsDidChange_withCompletion___block_invoke_2;
  v18[3] = &unk_1E6982BB0;
  id v19 = v6;
  id v17 = v6;
  [v16 posterBoardDidUpdateDescriptors:v7 completion:v18];
}

uint64_t __91__PBFProactivePosterGalleryLayoutProvider_handlePosterDescriptorsDidChange_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 proactiveRepresentation];
}

uint64_t __91__PBFProactivePosterGalleryLayoutProvider_handlePosterDescriptorsDidChange_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end