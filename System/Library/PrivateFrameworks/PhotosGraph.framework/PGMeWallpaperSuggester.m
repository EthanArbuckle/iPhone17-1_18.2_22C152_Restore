@interface PGMeWallpaperSuggester
+ (BOOL)enableSettlingEffect;
+ (id)suggestionSubtypes;
- (id)personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:(id)a3;
@end

@implementation PGMeWallpaperSuggester

+ (BOOL)enableSettlingEffect
{
  return 0;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:901];
}

- (id)personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGAbstractSuggester *)self session];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__38614;
  v15 = __Block_byref_object_dispose__38615;
  id v16 = 0;
  v6 = [v5 workingContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PGMeWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke;
  v10[3] = &unk_1E68F0A78;
  v10[4] = &v11;
  [v6 performSynchronousConcurrentGraphReadUsingBlock:v10];

  if (v12[5])
  {
    uint64_t v17 = v12[5];
    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    v18[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __92__PGMeWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke(uint64_t a1, void *a2)
{
  id v9 = [a2 graph];
  v3 = [v9 meNodeWithFallbackInferredMeNode];
  uint64_t v4 = [v3 localIdentifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (![*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

@end