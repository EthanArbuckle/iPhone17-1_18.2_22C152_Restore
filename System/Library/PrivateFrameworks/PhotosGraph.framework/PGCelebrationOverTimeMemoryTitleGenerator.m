@interface PGCelebrationOverTimeMemoryTitleGenerator
- (PGCelebrationOverTimeMemoryTitleGenerator)initWithMomentNodes:(id)a3 titleGenerationContext:(id)a4;
- (id)_celebrationSubtitle;
- (id)_celebrationTitle;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGCelebrationOverTimeMemoryTitleGenerator

- (id)_celebrationSubtitle
{
  v2 = objc_alloc_init(PGTimeTitleOptions);
  [(PGTimeTitleOptions *)v2 setAllowedFormats:16];
  v3 = +[PGTimeTitleUtility timeTitleWithOptions:v2];
  v4 = +[PGTitle titleWithString:v3 category:5];

  return v4;
}

- (id)_celebrationTitle
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__36851;
  v19 = __Block_byref_object_dispose__36852;
  id v20 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(PGTitleGenerator *)self momentNodes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v12 != v4) {
        objc_enumerationMutation(v2);
      }
      v6 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62__PGCelebrationOverTimeMemoryTitleGenerator__celebrationTitle__block_invoke;
      v10[3] = &unk_1E68EBA98;
      v10[4] = &v15;
      [v6 enumerateCelebratedHolidayNodesUsingBlock:v10];
      if ([(id)v16[5] length]) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v7 = v16[5];
  if (v7)
  {
    v8 = +[PGTitle titleWithString:v7 category:5];
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __62__PGCelebrationOverTimeMemoryTitleGenerator__celebrationTitle__block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5 = [a2 name];
  if (v5)
  {
    v10 = v5;
    uint64_t v6 = [MEMORY[0x1E4F76CA8] localizedNameForName:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length];
    uint64_t v5 = v10;
    *a3 = v9 != 0;
  }
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, void *))a3;
  uint64_t v4 = [(PGCelebrationOverTimeMemoryTitleGenerator *)self _celebrationTitle];
  uint64_t v5 = [(PGCelebrationOverTimeMemoryTitleGenerator *)self _celebrationSubtitle];
  if (v6) {
    v6[2](v6, v4, v5);
  }
}

- (PGCelebrationOverTimeMemoryTitleGenerator)initWithMomentNodes:(id)a3 titleGenerationContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGCelebrationOverTimeMemoryTitleGenerator;
  return [(PGTitleGenerator *)&v5 initWithMomentNodes:a3 referenceDateInterval:0 keyAsset:0 curatedAssetCollection:0 assetCollection:0 type:0 titleGenerationContext:a4];
}

@end