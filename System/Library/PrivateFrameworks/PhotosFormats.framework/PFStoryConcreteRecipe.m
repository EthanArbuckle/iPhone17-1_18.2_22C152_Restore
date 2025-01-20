@interface PFStoryConcreteRecipe
- ($ECF0DC3627C094A9E203A2BE20E982F0)overallDurationInfo;
- (BOOL)_isArray:(id)a3 equalToArray:(id)a4 usingObjectEquality:(id)a5;
- (BOOL)_isDictionary:(id)a3 equalToDictionary:(id)a4 usingObjectEquality:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecipe:(id)a3;
- (NSArray)assets;
- (NSArray)libraries;
- (NSArray)presentations;
- (NSDictionary)autoEditDecisionLists;
- (NSDictionary)seedSongIdentifiersByCatalog;
- (NSString)contentIdentifier;
- (NSString)diagnosticDescription;
- (PFStoryConcreteRecipe)init;
- (PFStoryConcreteRecipe)initWithContentIdentifier:(id)a3 majorVersion:(int64_t)a4 minorVersion:(int64_t)a5 libraries:(id)a6 assets:(id)a7 overallDurationInfo:(id *)a8 currentStyle:(id)a9 seedSongIdentifiersByCatalog:(id)a10 autoDecisionLists:(id)a11 presentations:(id)a12;
- (PFStoryRecipeSongAsset)currentStyleSongAsset;
- (PFStoryRecipeStyle)currentStyle;
- (id)assetAtIndex:(int64_t)a3;
- (id)assetWithKind:(int64_t)a3 identifier:(id)a4;
- (id)libraryWithKind:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)presentationAtIndex:(int64_t)a3;
- (id)seedSongAssetForCatalog:(id)a3;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
- (int64_t)numberOfAssets;
- (int64_t)numberOfPresentations;
- (void)enumerateAssetsWithKind:(int64_t)a3 usingBlock:(id)a4;
@end

@implementation PFStoryConcreteRecipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedSongIdentifiersByCatalog, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionLists, 0);
  objc_storeStrong((id *)&self->_currentStyleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_presentations, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_libraries, 0);

  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

- (NSDictionary)seedSongIdentifiersByCatalog
{
  return self->_seedSongIdentifiersByCatalog;
}

- (NSArray)presentations
{
  return self->_presentations;
}

- (NSDictionary)autoEditDecisionLists
{
  return self->_autoEditDecisionLists;
}

- (PFStoryRecipeStyle)currentStyle
{
  return self->_currentStyle;
}

- ($ECF0DC3627C094A9E203A2BE20E982F0)overallDurationInfo
{
  long long v3 = *(_OWORD *)&self->var1.var2.var3;
  long long v4 = *(_OWORD *)&self[1].var1.var0.var3;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var0.var0;
  *(_OWORD *)&retstr->var1.var1.var3 = v4;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[1].var1.var1.var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var2.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  return self;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSArray)libraries
{
  return self->_libraries;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  long long v4 = [PFStoryConcreteMutableRecipe alloc];
  v5 = [(PFStoryConcreteRecipe *)self contentIdentifier];
  int64_t v6 = [(PFStoryConcreteRecipe *)self majorVersion];
  int64_t v7 = [(PFStoryConcreteRecipe *)self minorVersion];
  v8 = [(PFStoryConcreteRecipe *)self libraries];
  v9 = [(PFStoryConcreteRecipe *)self assets];
  [(PFStoryConcreteRecipe *)self overallDurationInfo];
  v10 = [(PFStoryConcreteRecipe *)self currentStyle];
  v11 = [(PFStoryConcreteRecipe *)self seedSongIdentifiersByCatalog];
  v12 = [(PFStoryConcreteRecipe *)self autoEditDecisionLists];
  v13 = [(PFStoryConcreteRecipe *)self presentations];
  v14 = [(PFStoryConcreteRecipe *)v4 initWithContentIdentifier:v5 majorVersion:v6 minorVersion:v7 libraries:v8 assets:v9 overallDurationInfo:v16 currentStyle:v10 seedSongIdentifiersByCatalog:v11 autoDecisionLists:v12 presentations:v13];

  return v14;
}

- (BOOL)_isDictionary:(id)a3 equalToDictionary:(id)a4 usingObjectEquality:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v7 != 0) != (v8 != 0) || (uint64_t v10 = [v7 count], v10 != objc_msgSend(v8, "count")))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PFStoryConcreteRecipe__isDictionary_equalToDictionary_usingObjectEquality___block_invoke;
    v13[3] = &unk_1E5B2EDC0;
    id v14 = v8;
    id v15 = v9;
    v16 = &v17;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

void __77__PFStoryConcreteRecipe__isDictionary_equalToDictionary_usingObjectEquality___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v7 || ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)_isArray:(id)a3 equalToArray:(id)a4 usingObjectEquality:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v7 != 0) != (v8 != 0) || (uint64_t v10 = [v7 count], v10 != objc_msgSend(v8, "count")))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__PFStoryConcreteRecipe__isArray_equalToArray_usingObjectEquality___block_invoke;
    v13[3] = &unk_1E5B2ED98;
    id v14 = v8;
    id v15 = v9;
    v16 = &v17;
    [v7 enumerateObjectsUsingBlock:v13];
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

void __67__PFStoryConcreteRecipe__isArray_equalToArray_usingObjectEquality___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  if (!v7 || ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)isEqualToRecipe:(id)a3
{
  long long v4 = (PFStoryConcreteRecipe *)a3;
  if (v4 != self)
  {
    v5 = [(PFStoryConcreteRecipe *)self contentIdentifier];
    int64_t v6 = [(PFStoryConcreteRecipe *)v4 contentIdentifier];
    int v7 = [v5 isEqualToString:v6];

    if (!v7) {
      goto LABEL_15;
    }
    int64_t v8 = [(PFStoryConcreteRecipe *)self majorVersion];
    if (v8 != [(PFStoryConcreteRecipe *)v4 majorVersion]) {
      goto LABEL_15;
    }
    int64_t v9 = [(PFStoryConcreteRecipe *)self minorVersion];
    if (v9 != [(PFStoryConcreteRecipe *)v4 minorVersion]) {
      goto LABEL_15;
    }
    int64_t v10 = [(PFStoryConcreteRecipe *)self numberOfAssets];
    if (v10 != [(PFStoryConcreteRecipe *)v4 numberOfAssets]) {
      goto LABEL_15;
    }
    int64_t v11 = [(PFStoryConcreteRecipe *)self numberOfPresentations];
    if (v11 != [(PFStoryConcreteRecipe *)v4 numberOfPresentations]) {
      goto LABEL_15;
    }
    [(PFStoryConcreteRecipe *)self overallDurationInfo];
    if (v4)
    {
      [(PFStoryConcreteRecipe *)v4 overallDurationInfo];
      uint64_t v12 = *(void *)&v43[0];
    }
    else
    {
      uint64_t v12 = 0;
      memset(v43, 0, sizeof(v43));
    }
    if (v44 != v12) {
      goto LABEL_15;
    }
    CMTime v54 = v48;
    CMTime v51 = *(CMTime *)((char *)&v43[3] + 8);
    *(_OWORD *)&v53[16] = v47;
    long long v52 = v45;
    *(_OWORD *)v53 = v46;
    *(_OWORD *)&v50[16] = *(_OWORD *)((char *)&v43[2] + 8);
    long long v49 = *(_OWORD *)((char *)v43 + 8);
    *(_OWORD *)v50 = *(_OWORD *)((char *)&v43[1] + 8);
    *(_OWORD *)&time1.value = v45;
    time1.epoch = v46;
    CMTime time2 = *(CMTime *)((char *)v43 + 8);
    if (CMTimeCompare(&time1, &time2)
      || (time1 = *(CMTime *)&v53[8], CMTime time2 = *(CMTime *)&v50[8], CMTimeCompare(&time1, &time2))
      || (time1 = v54, CMTime time2 = v51, CMTimeCompare(&time1, &time2)))
    {
LABEL_15:
      BOOL v13 = 0;
      goto LABEL_16;
    }
    *(void *)&long long v52 = 0;
    *((void *)&v52 + 1) = &v52;
    *(void *)v53 = 0x2020000000;
    v53[8] = 1;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __41__PFStoryConcreteRecipe_isEqualToRecipe___block_invoke;
    v40[3] = &unk_1E5B2ED50;
    v40[4] = self;
    id v15 = v4;
    v41 = v15;
    v42 = &v52;
    PFStoryRecipeLibraryKindEnumerateSupportedValuesUsingBlock(v40);
    if (!*(unsigned char *)(*((void *)&v52 + 1) + 24)) {
      goto LABEL_32;
    }
    uint64_t v16 = [(PFStoryConcreteRecipe *)self numberOfAssets];
    if (v16 >= 1)
    {
      uint64_t v17 = 0;
      do
      {
        v18 = [(PFStoryConcreteRecipe *)self assetAtIndex:v17];
        uint64_t v19 = [(PFStoryConcreteRecipe *)v15 assetAtIndex:v17];
        char v20 = [v18 isEqualToAsset:v19];

        if ((v20 & 1) == 0) {
          goto LABEL_32;
        }
      }
      while (v16 != ++v17);
    }
    uint64_t v21 = [(PFStoryConcreteRecipe *)self numberOfPresentations];
    if (v21 >= 1)
    {
      uint64_t v22 = 0;
      do
      {
        v23 = [(PFStoryConcreteRecipe *)self presentationAtIndex:v22];
        v24 = [(PFStoryConcreteRecipe *)v15 presentationAtIndex:v22];
        char v25 = [v23 isEqualToPresentation:v24];

        if ((v25 & 1) == 0) {
          goto LABEL_32;
        }
      }
      while (v21 != ++v22);
    }
    v26 = [(PFStoryConcreteRecipe *)self currentStyle];
    v27 = [(PFStoryConcreteRecipe *)v15 currentStyle];
    id v28 = v26;
    id v29 = v27;
    if (v28 == v29)
    {
    }
    else
    {
      v30 = v29;
      char v31 = [v28 isEqual:v29];

      if ((v31 & 1) == 0) {
        goto LABEL_32;
      }
    }
    v32 = [(PFStoryConcreteRecipe *)self seedSongIdentifiersByCatalog];
    v33 = [(PFStoryConcreteRecipe *)v15 seedSongIdentifiersByCatalog];
    id v34 = v32;
    id v35 = v33;
    if (v34 == v35)
    {
    }
    else
    {
      v36 = v35;
      char v37 = [v34 isEqual:v35];

      if ((v37 & 1) == 0)
      {
LABEL_32:
        BOOL v13 = 0;
LABEL_33:

        _Block_object_dispose(&v52, 8);
        goto LABEL_16;
      }
    }
    v38 = [(PFStoryConcreteRecipe *)self autoEditDecisionLists];
    v39 = [(PFStoryConcreteRecipe *)v15 autoEditDecisionLists];
    BOOL v13 = [(PFStoryConcreteRecipe *)self _isDictionary:v38 equalToDictionary:v39 usingObjectEquality:&__block_literal_global_10860];

    goto LABEL_33;
  }
  BOOL v13 = 1;
LABEL_16:

  return v13;
}

void __41__PFStoryConcreteRecipe_isEqualToRecipe___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v7 = [*(id *)(a1 + 32) libraryWithKind:a2];
  id v6 = [*(id *)(a1 + 40) libraryWithKind:a2];
  if (v7 != v6 && ([v7 isEqualToLibrary:v6] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
}

uint64_t __41__PFStoryConcreteRecipe_isEqualToRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToAutoEditDecisionList:");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualToRecipe:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSString)diagnosticDescription
{
  long long v3 = objc_alloc_init(PFStoryRecipeArchiver);
  id v4 = [(PFStoryRecipeArchiver *)v3 archivedJSONDataWithRecipe:self options:1];

  char v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];

  return (NSString *)v5;
}

- (id)presentationAtIndex:(int64_t)a3
{
  id v4 = [(PFStoryConcreteRecipe *)self presentations];
  char v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)numberOfPresentations
{
  v2 = [(PFStoryConcreteRecipe *)self presentations];
  int64_t v3 = [v2 count];

  return v3;
}

- (PFStoryRecipeSongAsset)currentStyleSongAsset
{
  uint64_t v10 = 0;
  int64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy__10866;
  id v14 = __Block_byref_object_dispose__10867;
  id v15 = 0;
  int64_t v3 = [(PFStoryConcreteRecipe *)self currentStyle];
  id v4 = [v3 songAssetIdentifier];

  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__PFStoryConcreteRecipe_currentStyleSongAsset__block_invoke;
    v7[3] = &unk_1E5B2ECD8;
    id v8 = v4;
    int64_t v9 = &v10;
    [(PFStoryConcreteRecipe *)self enumerateAssetsWithKind:2 usingBlock:v7];
  }
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return (PFStoryRecipeSongAsset *)v5;
}

void __46__PFStoryConcreteRecipe_currentStyleSongAsset__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v6 = [v10 identifier];
  id v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  id v8 = v7;
  int v9 = [v6 isEqualToString:v7];

  if (v9)
  {
LABEL_5:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)seedSongAssetForCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [(PFStoryConcreteRecipe *)self seedSongIdentifiersByCatalog];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(PFStoryConcreteRecipe *)self assetWithKind:2 identifier:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)assetWithKind:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__10866;
  uint64_t v17 = __Block_byref_object_dispose__10867;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PFStoryConcreteRecipe_assetWithKind_identifier___block_invoke;
  v10[3] = &unk_1E5B2ECD8;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [(PFStoryConcreteRecipe *)self enumerateAssetsWithKind:a3 usingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __50__PFStoryConcreteRecipe_assetWithKind_identifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v6 = [v10 identifier];
  id v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  id v8 = v7;
  int v9 = [v6 isEqualToString:v7];

  if (v9)
  {
LABEL_5:
    *a3 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)enumerateAssetsWithKind:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PFStoryConcreteRecipe *)self assets];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PFStoryConcreteRecipe_enumerateAssetsWithKind_usingBlock___block_invoke;
  v9[3] = &unk_1E5B2ED28;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __60__PFStoryConcreteRecipe_enumerateAssetsWithKind_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 kind] == *(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)assetAtIndex:(int64_t)a3
{
  id v4 = [(PFStoryConcreteRecipe *)self assets];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)numberOfAssets
{
  v2 = [(PFStoryConcreteRecipe *)self assets];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)libraryWithKind:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PFStoryConcreteRecipe *)self libraries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 kind] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (PFStoryConcreteRecipe)initWithContentIdentifier:(id)a3 majorVersion:(int64_t)a4 minorVersion:(int64_t)a5 libraries:(id)a6 assets:(id)a7 overallDurationInfo:(id *)a8 currentStyle:(id)a9 seedSongIdentifiersByCatalog:(id)a10 autoDecisionLists:(id)a11 presentations:(id)a12
{
  id v41 = a3;
  id v18 = a6;
  id v19 = a7;
  id v40 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  v42.receiver = self;
  v42.super_class = (Class)PFStoryConcreteRecipe;
  v23 = [(PFStoryConcreteRecipe *)&v42 init];
  if (v23)
  {
    uint64_t v24 = objc_msgSend(v41, "copy", v40);
    char v25 = (void *)*((void *)v23 + 1);
    *((void *)v23 + 1) = v24;

    *((void *)v23 + 2) = a4;
    *((void *)v23 + 3) = a5;
    uint64_t v26 = [v18 copy];
    v27 = (void *)*((void *)v23 + 4);
    *((void *)v23 + 4) = v26;

    uint64_t v28 = [v19 copy];
    id v29 = (void *)*((void *)v23 + 5);
    *((void *)v23 + 5) = v28;

    *(_OWORD *)(v23 + 56) = *(_OWORD *)&a8->var0;
    long long v30 = *(_OWORD *)&a8->var1.var0.var1;
    long long v31 = *(_OWORD *)&a8->var1.var1.var0;
    long long v32 = *(_OWORD *)&a8->var1.var1.var3;
    *(_OWORD *)(v23 + 120) = *(_OWORD *)&a8->var1.var2.var1;
    *(_OWORD *)(v23 + 104) = v32;
    *(_OWORD *)(v23 + 88) = v31;
    *(_OWORD *)(v23 + 72) = v30;
    objc_storeStrong((id *)v23 + 17, a9);
    uint64_t v33 = [v20 copy];
    id v34 = (void *)*((void *)v23 + 20);
    *((void *)v23 + 20) = v33;

    uint64_t v35 = [v21 copy];
    v36 = (void *)*((void *)v23 + 19);
    *((void *)v23 + 19) = v35;

    uint64_t v37 = [v22 copy];
    v38 = (void *)*((void *)v23 + 6);
    *((void *)v23 + 6) = v37;
  }
  return (PFStoryConcreteRecipe *)v23;
}

- (PFStoryConcreteRecipe)init
{
  memset(v3, 0, sizeof(v3));
  return [(PFStoryConcreteRecipe *)self initWithContentIdentifier:@"com.apple.photos.storyPlaybackRecipe" majorVersion:1 minorVersion:1 libraries:0 assets:0 overallDurationInfo:v3 currentStyle:0 seedSongIdentifiersByCatalog:0 autoDecisionLists:0 presentations:0];
}

@end