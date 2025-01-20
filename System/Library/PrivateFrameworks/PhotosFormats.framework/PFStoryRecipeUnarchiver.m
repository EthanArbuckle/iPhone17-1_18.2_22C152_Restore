@interface PFStoryRecipeUnarchiver
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unarchiveTimeWithJSONObject:(SEL)a3;
- ($3DBB98C272AC9B04202267094881960A)_unarchivedDurationInfoWithJSONObject:(SEL)a3;
- ($ECF0DC3627C094A9E203A2BE20E982F0)_unarchivedOverallDurationInfoWithJSONObject:(SEL)a3;
- (id)_existingKeyInDictionary:(id)a3 forObject:(id)a4;
- (id)_unarchivedClipWithJSONObject:(id)a3;
- (id)_unarchivedDecisionListWithJSONObject:(id)a3 songAssetIdentifier:(id)a4;
- (id)_unarchivedLibraryWithJSONObject:(id)a3 error:(id *)a4;
- (id)_unarchivedStyleWithJSONObject:(id)a3;
- (id)unarchivedAssetWithJSONObject:(id)a3 error:(id *)a4;
- (id)unarchivedRecipeWithData:(id)a3 error:(id *)a4;
- (id)unarchivedRecipeWithJSONObject:(id)a3 error:(id *)a4;
@end

@implementation PFStoryRecipeUnarchiver

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unarchiveTimeWithJSONObject:(SEL)a3
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"value"];
  int64_t v7 = [v6 longLongValue];

  v8 = [v5 objectForKeyedSubscript:@"timescale"];

  int32_t v9 = [v8 intValue];

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v7, v9);
}

- ($3DBB98C272AC9B04202267094881960A)_unarchivedDurationInfoWithJSONObject:(SEL)a3
{
  void (*v9)(long long *__return_ptr);
  void (*v10)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, void *, __CFString *, long long *);
  void (*v11)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, void *, __CFString *, long long *);
  $3DBB98C272AC9B04202267094881960A *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  long long v15;
  uint64_t v16;
  long long v17;
  int64_t v18;
  void v19[4];
  id v20;
  PFStoryRecipeUnarchiver *v21;

  id v6 = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PFStoryRecipeUnarchiver__unarchivedDurationInfoWithJSONObject___block_invoke;
  v19[3] = &unk_1E5B2E748;
  v20 = v6;
  v21 = self;
  id v7 = v6;
  v8 = (void *)MEMORY[0x1A6259AE0](v19);
  int32_t v9 = (void (*)(long long *__return_ptr))v8[2];
  v15 = *MEMORY[0x1E4F1FA48];
  v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v9(&v17);
  v10 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, void *, __CFString *, long long *))v8[2];
  v15 = *MEMORY[0x1E4F1F9F8];
  v16 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v10(&v14, v8, @"preferred", &v15);
  v11 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *__return_ptr, void *, __CFString *, long long *))v8[2];
  v15 = *MEMORY[0x1E4F1FA10];
  v16 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  v11(&v13, v8, @"maximum", &v15);
  *(_OWORD *)&retstr->var0.var0 = v17;
  retstr->var0.var3 = v18;
  retstr->var1 = v14;
  retstr->var2 = v13;

  return result;
}

uint64_t __65__PFStoryRecipeUnarchiver__unarchivedDurationInfoWithJSONObject___block_invoke@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  v8 = v7;
  if (v7)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v10 = v8;
      id v7 = (void *)[v7 unarchiveTimeWithJSONObject:v8];
      v8 = v10;
    }
    else
    {
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
    }
  }
  else
  {
    *(_OWORD *)a4 = *(_OWORD *)a3;
    a4[2] = *(void *)(a3 + 16);
  }

  return MEMORY[0x1F41817F8](v7, v8);
}

- (id)_unarchivedClipWithJSONObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"assetIdentifier"];
  id v6 = +[PFStoryRecipeArchiver stringByClipPlaybackStyle];
  id v7 = [v4 objectForKeyedSubscript:@"playbackStyle"];
  v8 = [(PFStoryRecipeUnarchiver *)self _existingKeyInDictionary:v6 forObject:v7];
  uint64_t v9 = [v8 integerValue];

  long long v40 = 0uLL;
  uint64_t v41 = 0;
  v10 = [v4 objectForKeyedSubscript:@"minimumDuration"];
  [(PFStoryRecipeUnarchiver *)self unarchiveTimeWithJSONObject:v10];

  long long v38 = 0uLL;
  uint64_t v39 = 0;
  v11 = [v4 objectForKeyedSubscript:@"idealDuration"];
  [(PFStoryRecipeUnarchiver *)self unarchiveTimeWithJSONObject:v11];

  long long v36 = 0uLL;
  uint64_t v37 = 0;
  v12 = [v4 objectForKeyedSubscript:@"maximumDuration"];
  [(PFStoryRecipeUnarchiver *)self unarchiveTimeWithJSONObject:v12];

  long long v34 = 0uLL;
  uint64_t v35 = 0;
  v13 = [v4 objectForKeyedSubscript:@"videoCueOffset"];
  [(PFStoryRecipeUnarchiver *)self unarchiveTimeWithJSONObject:v13];

  v14 = +[PFStoryRecipeArchiver stringByClipMotionStyle];
  v15 = [v4 objectForKeyedSubscript:@"motionStyle"];
  v16 = [(PFStoryRecipeUnarchiver *)self _existingKeyInDictionary:v14 forObject:v15];
  uint64_t v17 = [v16 integerValue];

  v18 = [v4 objectForKeyedSubscript:@"transition"];

  if (v18)
  {
    v19 = +[PFStoryRecipeArchiver stringByClipTransition];
    v20 = [v4 objectForKeyedSubscript:@"transition"];
    v21 = [(PFStoryRecipeUnarchiver *)self _existingKeyInDictionary:v19 forObject:v20];
    uint64_t v22 = [v21 integerValue];
  }
  else
  {
    uint64_t v22 = 1;
  }
  v23 = [PFStoryConcreteRecipeClip alloc];
  long long v32 = v40;
  uint64_t v33 = v41;
  long long v30 = v38;
  uint64_t v31 = v39;
  long long v28 = v36;
  uint64_t v29 = v37;
  long long v26 = v34;
  uint64_t v27 = v35;
  v24 = [(PFStoryConcreteRecipeClip *)v23 initWithAssetIdentifier:v5 playbackStyle:v9 minimumDuration:&v32 idealDuration:&v30 maximumDuration:&v28 videoCueOffset:&v26 motionStyle:v17 transition:v22];

  return v24;
}

- (id)_unarchivedDecisionListWithJSONObject:(id)a3 songAssetIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKeyedSubscript:@"clips"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PFStoryRecipeUnarchiver__unarchivedDecisionListWithJSONObject_songAssetIdentifier___block_invoke;
  v11[3] = &unk_1E5B2E720;
  v11[4] = self;
  v8 = PFMap(v7, v11);
  uint64_t v9 = [[PFStoryConcreteAutoEditDecisionList alloc] initWithSongAssetIdentifier:v6 clips:v8];

  return v9;
}

uint64_t __85__PFStoryRecipeUnarchiver__unarchivedDecisionListWithJSONObject_songAssetIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _unarchivedClipWithJSONObject:a2];
}

- (id)_unarchivedStyleWithJSONObject:(id)a3
{
  id v3 = a3;
  id v4 = [PFStoryConcreteStyle alloc];
  id v5 = [v3 objectForKeyedSubscript:@"id"];
  id v6 = [v3 objectForKeyedSubscript:@"originalColorGradeCategory"];
  id v7 = [v3 objectForKeyedSubscript:@"customColorGradeKind"];
  uint64_t v8 = PFStoryColorGradeKindNamed(v7);
  uint64_t v9 = [v3 objectForKeyedSubscript:@"songAsset"];
  v10 = [v3 objectForKeyedSubscript:@"isCustomized"];

  v11 = -[PFStoryConcreteStyle initWithIdentifier:originalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:](v4, "initWithIdentifier:originalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:", v5, v6, v8, v9, [v10 BOOLValue]);

  return v11;
}

- ($ECF0DC3627C094A9E203A2BE20E982F0)_unarchivedOverallDurationInfoWithJSONObject:(SEL)a3
{
  id v6 = a4;
  if (v6)
  {
    id v7 = +[PFStoryRecipeArchiver stringByOverallDurationKind];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"kind"];
    uint64_t v9 = [(PFStoryRecipeUnarchiver *)self _existingKeyInDictionary:v7 forObject:v8];
    int64_t v10 = [v9 integerValue];

    if (v10 == 2)
    {
      v11 = [v6 objectForKeyedSubscript:@"specificDuration"];
      [(PFStoryRecipeUnarchiver *)self _unarchivedDurationInfoWithJSONObject:v11];
    }
    *(_OWORD *)&retstr->var1.var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1.var1 = 0u;
    *(_OWORD *)&retstr->var1.var2.var0 = 0u;
    retstr->var1.var2.var3 = 0;
    *(_OWORD *)&retstr->var1.var0.var0 = 0u;
    retstr->var0 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->var1.var1.var3 = 0u;
    *(_OWORD *)&retstr->var1.var2.var1 = 0u;
    *(_OWORD *)&retstr->var1.var0.var1 = 0u;
    *(_OWORD *)&retstr->var1.var1.var0 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  return result;
}

- (id)_existingKeyInDictionary:(id)a3 forObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8297;
  uint64_t v17 = __Block_byref_object_dispose__8298;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PFStoryRecipeUnarchiver__existingKeyInDictionary_forObject___block_invoke;
  v10[3] = &unk_1E5B2E6F8;
  id v7 = v6;
  id v11 = v7;
  v12 = &v13;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __62__PFStoryRecipeUnarchiver__existingKeyInDictionary_forObject___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)unarchivedAssetWithJSONObject:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__8297;
  v23 = __Block_byref_object_dispose__8298;
  id v24 = 0;
  id v7 = [v6 objectForKeyedSubscript:@"id"];
  id v8 = +[PFStoryRecipeArchiver stringByAssetKind];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"kind"];
  int64_t v10 = [(PFStoryRecipeUnarchiver *)self _existingKeyInDictionary:v8 forObject:v9];
  uint64_t v11 = [v10 integerValue];

  v12 = [v6 objectForKeyedSubscript:@"url"];
  if (v11 == 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    v14 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke;
    v18[3] = &unk_1E5B2E6D0;
    v18[4] = self;
    v18[5] = v6;
    v18[7] = &v19;
    v18[6] = v7;
    +[PFStoryConcreteRecipeDisplayAsset decomposeURL:v13 usingBlock:v18];
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_6;
    }
    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    v14 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke_2;
    v17[3] = &unk_1E5B2E6D0;
    v17[4] = self;
    v17[5] = v6;
    v17[7] = &v19;
    v17[6] = v7;
    +[PFStoryConcreteRecipeSongAsset decomposeURL:v13 usingBlock:v17];
  }

LABEL_6:
  if (a4) {
    *a4 = 0;
  }
  id v15 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v15;
}

void __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = +[PFStoryRecipeArchiver stringByDisplayAssetCategory];
  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"category"];
  int64_t v10 = [v5 _existingKeyInDictionary:v8 forObject:v9];
  uint64_t v11 = [v10 integerValue];

  v12 = [[PFStoryConcreteRecipeDisplayAsset alloc] initWithIdentifier:*(void *)(a1 + 48) category:v11 scheme:v7 cloudIdentifier:v6];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __63__PFStoryRecipeUnarchiver_unarchivedAssetWithJSONObject_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = +[PFStoryRecipeArchiver stringBySongCategory];
  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"category"];
  int64_t v10 = [v5 _existingKeyInDictionary:v8 forObject:v9];
  uint64_t v11 = [v10 integerValue];

  v12 = *(void **)(a1 + 32);
  uint64_t v13 = +[PFStoryRecipeArchiver stringBySongSubcategory];
  v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"subcategory"];
  id v15 = [v12 _existingKeyInDictionary:v13 forObject:v14];
  uint64_t v16 = [v15 integerValue];

  id v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"title"];
  uint64_t v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"subtitle"];
  id v18 = [[PFStoryConcreteRecipeSongAsset alloc] initWithIdentifier:*(void *)(a1 + 48) category:v11 subcategory:v16 catalog:v7 songID:v6 title:v22 subtitle:v17];

  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  uint64_t v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"colorGradeCategory"];
  if (v21) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setColorGradeCategory:v21];
  }
}

- (id)_unarchivedLibraryWithJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[PFStoryRecipeArchiver stringByLibraryKind];
  id v8 = [v6 objectForKeyedSubscript:@"kind"];
  uint64_t v9 = [(PFStoryRecipeUnarchiver *)self _existingKeyInDictionary:v7 forObject:v8];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"url"];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
  uint64_t v13 = +[PFStoryRecipeLibraryFactory createLibraryWithKind:v10 url:v12];

  if (a4) {
    *a4 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)unarchivedRecipeWithJSONObject:(id)a3 error:(id *)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__8297;
  v69 = __Block_byref_object_dispose__8298;
  id v70 = 0;
  id v5 = [v47 objectForKeyedSubscript:@"header"];
  v45 = [v5 objectForKeyedSubscript:@"content"];
  v44 = [v5 objectForKeyedSubscript:@"version"];
  id v6 = [v44 componentsSeparatedByString:@"."];
  id v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v8 = [v7 integerValue];

  uint64_t v9 = [v6 objectAtIndexedSubscript:1];
  uint64_t v10 = [v9 integerValue];

  if (v8 == 1)
  {
    uint64_t v11 = [v47 objectForKeyedSubscript:@"resources"];
    v12 = [v11 objectForKeyedSubscript:@"assets"];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke;
    v64[3] = &unk_1E5B2E658;
    v64[4] = self;
    v64[5] = &v65;
    uint64_t v13 = PFMap(v12, v64);
    id v14 = [v47 objectForKeyedSubscript:@"libraries"];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_2;
    v63[3] = &unk_1E5B2E680;
    v63[4] = self;
    v63[5] = &v65;
    id v15 = PFMap(v14, v63);
    long long v38 = v14;
    uint64_t v39 = (void *)v13;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v58 = 0u;
    uint64_t v16 = [v47 objectForKeyedSubscript:@"overallDuration"];
    [(PFStoryRecipeUnarchiver *)self _unarchivedOverallDurationInfoWithJSONObject:v16];

    uint64_t v17 = [v47 objectForKeyedSubscript:@"currentStyle"];
    v42 = [(PFStoryRecipeUnarchiver *)self _unarchivedStyleWithJSONObject:v17];

    v43 = [v47 objectForKeyedSubscript:@"autoEditDecisionLists"];
    uint64_t v41 = [v47 objectForKeyedSubscript:@"seedSongIdentifiers"];
    if (v43)
    {
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_3;
      v57[3] = &unk_1E5B2E6A8;
      v57[4] = self;
      long long v40 = PFMapDictionary(v43, v57);
    }
    else
    {
      long long v40 = 0;
    }
    uint64_t v25 = +[PFStoryRecipeFactory createRecipe];
    long long v26 = (void *)[v25 mutableCopyWithZone:0];

    [v26 setContentIdentifier:v45];
    [v26 setMajorVersion:1];
    [v26 setMinorVersion:v10];
    uint64_t v27 = v11;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v28 = v15;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v72 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v54 != v30) {
            objc_enumerationMutation(v28);
          }
          [v26 addLibrary:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v72 count:16];
      }
      while (v29);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v32 = v39;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v71 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(v32);
          }
          [v26 addAsset:*(void *)(*((void *)&v49 + 1) + 8 * j)];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v71 count:16];
      }
      while (v33);
    }

    v20 = v27;
    v48[2] = v60;
    v48[3] = v61;
    v48[4] = v62;
    v48[0] = v58;
    v48[1] = v59;
    [v26 setOverallDurationInfo:v48];
    [v26 setCurrentStyle:v42];
    [v26 setSeedSongIdentifiersByCatalog:v41];
    [v26 setAutoEditDecisionLists:v40];
    id v24 = (void *)[v26 copyWithZone:0];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v73 = *MEMORY[0x1E4F28568];
    id v19 = [NSString alloc];
    v20 = [v5 objectForKeyedSubscript:@"version"];
    v12 = (void *)[v19 initWithFormat:@"Unsupported recipe version %@", v20];
    v74[0] = v12;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
    uint64_t v22 = [v18 errorWithDomain:@"PFStoryRecipeErrorDomain" code:2 userInfo:v21];
    v23 = (void *)v66[5];
    v66[5] = v22;

    id v24 = 0;
  }

  if (a4) {
    *a4 = (id) v66[5];
  }
  id v36 = v24;
  _Block_object_dispose(&v65, 8);

  return v36;
}

id __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  id v4 = [v2 unarchivedAssetWithJSONObject:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);

  return v4;
}

id __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  id v4 = [v2 _unarchivedLibraryWithJSONObject:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);

  return v4;
}

uint64_t __64__PFStoryRecipeUnarchiver_unarchivedRecipeWithJSONObject_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _unarchivedDecisionListWithJSONObject:a3 songAssetIdentifier:a2];
}

- (id)unarchivedRecipeWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v14 = 0;
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v14];
    id v8 = v14;
    uint64_t v9 = v8;
    if (v7)
    {
      id v13 = v8;
      uint64_t v10 = [(PFStoryRecipeUnarchiver *)self unarchivedRecipeWithJSONObject:v7 error:&v13];
      id v11 = v13;

      uint64_t v9 = v11;
    }
    else
    {
      uint64_t v10 = 0;
    }

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v9;
LABEL_9:

  return v10;
}

@end