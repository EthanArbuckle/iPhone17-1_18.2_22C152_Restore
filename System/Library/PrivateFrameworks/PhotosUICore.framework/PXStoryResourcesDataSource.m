@interface PXStoryResourcesDataSource
- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo;
- (BOOL)hasSameResourcesOfKind:(int64_t)a3 as:(id)a4;
- (PXAudioAssetFetchResult)audioAssets;
- (PXDisplayAsset)keyAsset;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayAssetFetchResult)availableDisplayAssets;
- (PXDisplayAssetFetchResult)displayAssets;
- (PXStoryChapterCollection)chapterCollection;
- (PXStoryColorResource)backgroundColorResource;
- (PXStoryDisplayAssetCroppingContext)croppingContext;
- (PXStoryMovieHighlightsCollection)movieHighlights;
- (PXStoryResourcesDataSource)initWithKeyAsset:(id)a3 displayAssets:(id)a4 availableDisplayAssets:(id)a5 movieHighlights:(id)a6 detailedSaliency:(id)a7 chapterCollection:(id)a8 audioAssets:(id)a9 assetCollection:(id)a10 overallDurationInfo:(id *)a11 storyConfiguration:(id)a12;
- (PXStoryResourcesDataSource)initWithStoryConfiguration:(id)a3;
- (PXStorySaliencyDataSource)detailedSaliency;
- (id)_createTextResourceAtIndex:(int64_t)a3;
- (id)colorResourceAtIndex:(int64_t)a3;
- (id)displayAssetResourceAtIndex:(int64_t)a3;
- (id)frameFillingEffectResourceAtIndex:(int64_t)a3;
- (id)movieHighlightsForDisplayAssetAtIndex:(int64_t)a3;
- (id)resourceWithKind:(int64_t)a3 atIndex:(int64_t)a4;
- (id)songResourceAtIndex:(int64_t)a3;
- (id)textResourceAtIndex:(int64_t)a3;
- (int64_t)identifier;
- (int64_t)indexForDisplayAssetReference:(id)a3;
- (int64_t)initialSubtitleTextResourceIndex;
- (int64_t)initialTitleTextResourceIndex;
- (int64_t)numberOfColorResources;
- (int64_t)numberOfDisplayAssetResources;
- (int64_t)numberOfResourcesWithKind:(int64_t)a3;
- (int64_t)numberOfSongResources;
- (int64_t)numberOfTextResources;
- (void)enumerateTextResourcesForTitles:(unint64_t)a3 displayAssetResourceAtIndex:(int64_t)a4 usingBlock:(id)a5;
@end

@implementation PXStoryResourcesDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAssets, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_detailedSaliency, 0);
  objc_storeStrong((id *)&self->_movieHighlights, 0);
  objc_storeStrong((id *)&self->_availableDisplayAssets, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_croppingContext, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_lock_backgroundColorResource, 0);
  objc_storeStrong((id *)&self->_cachedTextResources, 0);
}

- (int64_t)initialSubtitleTextResourceIndex
{
  return self->_initialSubtitleTextResourceIndex;
}

- (int64_t)initialTitleTextResourceIndex
{
  return self->_initialTitleTextResourceIndex;
}

- (PXAudioAssetFetchResult)audioAssets
{
  return self->_audioAssets;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (PXStorySaliencyDataSource)detailedSaliency
{
  return self->_detailedSaliency;
}

- (PXStoryMovieHighlightsCollection)movieHighlights
{
  return self->_movieHighlights;
}

- (PXDisplayAssetFetchResult)availableDisplayAssets
{
  return self->_availableDisplayAssets;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXStoryDisplayAssetCroppingContext)croppingContext
{
  return self->_croppingContext;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo
{
  long long v3 = *(_OWORD *)&self[2].var1.var1.var1;
  long long v4 = *(_OWORD *)&self[2].var1.var2.var3;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[2].var1.var2.var0;
  *(_OWORD *)&retstr->var1.var1.var3 = v4;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[3].var1.var0.var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1.var0.var3;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  return self;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (int64_t)numberOfColorResources
{
  return self->_numberOfColorResources;
}

- (int64_t)numberOfTextResources
{
  return self->_numberOfTextResources;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (BOOL)hasSameResourcesOfKind:(int64_t)a3 as:(id)a4
{
  id v7 = a4;
  switch(a3)
  {
    case 0:
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"PXStoryResourcesDataSource.m" lineNumber:317 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      id v15 = [(PXStoryResourcesDataSource *)self keyAsset];
      id v16 = [v7 keyAsset];
      if (v15 == v16)
      {
      }
      else
      {
        int v13 = [v15 isEqual:v16];

        if (!v13) {
          goto LABEL_24;
        }
      }
      v19 = [(PXStoryResourcesDataSource *)self displayAssets];
      v20 = [v7 displayAssets];
      if (v19 == v20) {
        LOBYTE(v13) = 1;
      }
      else {
        LOBYTE(v13) = [v19 isEqual:v20];
      }

LABEL_24:
LABEL_25:

      return v13;
    case 2:
      v17 = [(PXStoryResourcesDataSource *)self audioAssets];
      v18 = [v7 audioAssets];
      if (v17 == v18) {
        LOBYTE(v13) = 1;
      }
      else {
        LOBYTE(v13) = [v17 isEqual:v18];
      }

      goto LABEL_25;
    case 3:
    case 4:
      uint64_t v8 = [(PXStoryResourcesDataSource *)self numberOfResourcesWithKind:a3];
      if ([v7 numberOfResourcesWithKind:a3] != v8) {
        goto LABEL_9;
      }
      uint64_t v9 = v8 - 1;
      if (v8 < 1)
      {
        LOBYTE(v13) = 1;
      }
      else
      {
        uint64_t v10 = 0;
        do
        {
          v11 = [(PXStoryResourcesDataSource *)self resourceWithKind:a3 atIndex:v10];
          v12 = [v7 resourceWithKind:a3 atIndex:v10];
          int v13 = [v11 isEqual:v12];

          if (!v13) {
            break;
          }
        }
        while (v9 != v10++);
      }
      goto LABEL_25;
    case 5:
      LOBYTE(v13) = [(PXStoryResourcesDataSource *)self hasSameResourcesOfKind:1 as:v7];
      goto LABEL_25;
    default:
LABEL_9:
      LOBYTE(v13) = 0;
      goto LABEL_25;
  }
}

- (id)resourceWithKind:(int64_t)a3 atIndex:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = v8;
      SEL v10 = a2;
      v11 = self;
      uint64_t v12 = 298;
      goto LABEL_12;
    case 1:
      long long v4 = [(PXStoryResourcesDataSource *)self displayAssetResourceAtIndex:a4];
      goto LABEL_7;
    case 2:
      long long v4 = [(PXStoryResourcesDataSource *)self songResourceAtIndex:a4];
      goto LABEL_7;
    case 3:
      long long v4 = [(PXStoryResourcesDataSource *)self textResourceAtIndex:a4];
      goto LABEL_7;
    case 4:
      long long v4 = [(PXStoryResourcesDataSource *)self colorResourceAtIndex:a4];
      goto LABEL_7;
    case 5:
      long long v4 = [(PXStoryResourcesDataSource *)self frameFillingEffectResourceAtIndex:a4];
LABEL_7:
      return v4;
    default:
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = v8;
      SEL v10 = a2;
      v11 = self;
      uint64_t v12 = 310;
LABEL_12:
      [v8 handleFailureInMethod:v10 object:v11 file:@"PXStoryResourcesDataSource.m" lineNumber:v12 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

- (int64_t)numberOfResourcesWithKind:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = v6;
      SEL v8 = a2;
      uint64_t v9 = self;
      uint64_t v10 = 280;
      goto LABEL_19;
    case 1:
      return [(PXStoryResourcesDataSource *)self numberOfDisplayAssetResources];
    case 2:
      return [(PXStoryResourcesDataSource *)self numberOfSongResources];
    case 3:
      return [(PXStoryResourcesDataSource *)self numberOfTextResources];
    case 4:
      return [(PXStoryResourcesDataSource *)self numberOfColorResources];
    case 5:
      return [(PXStoryResourcesDataSource *)self numberOfFrameFillingEffectResources];
    default:
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = v6;
      SEL v8 = a2;
      uint64_t v9 = self;
      uint64_t v10 = 292;
LABEL_19:
      [v6 handleFailureInMethod:v8 object:v9 file:@"PXStoryResourcesDataSource.m" lineNumber:v10 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

- (id)frameFillingEffectResourceAtIndex:(int64_t)a3
{
  long long v3 = [(PXStoryResourcesDataSource *)self displayAssetResourceAtIndex:a3];
  long long v4 = [PXStoryConcreteFrameFillingEffectResource alloc];
  v5 = objc_msgSend(v3, "px_storyResourceDisplayAsset");
  v6 = +[PXStorySettings sharedInstance];
  id v7 = -[PXStoryConcreteFrameFillingEffectResource initWithDisplayAsset:useSmartColor:](v4, "initWithDisplayAsset:useSmartColor:", v5, [v6 smartGradientUseSmartColor]);

  return v7;
}

- (PXStoryColorResource)backgroundColorResource
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backgroundColorResource = self->_lock_backgroundColorResource;
  if (!lock_backgroundColorResource)
  {
    v5 = +[PXStorySettings sharedInstance];
    if ([v5 wantsHighContrastColors]) {
      [MEMORY[0x1E4FB1618] magentaColor];
    }
    else {
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    }

    id v7 = [[PXStoryConcreteColorResource alloc] initWithColor:v6 type:1];
    SEL v8 = self->_lock_backgroundColorResource;
    self->_lock_backgroundColorResource = (PXStoryColorResource *)v7;

    lock_backgroundColorResource = self->_lock_backgroundColorResource;
  }
  uint64_t v9 = lock_backgroundColorResource;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)colorResourceAtIndex:(int64_t)a3
{
  if ([(PXStoryResourcesDataSource *)self numberOfColorResources] <= a3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryResourcesDataSource.m", 247, @"index %li out of bounds 0 ..< %li", a3, -[PXStoryResourcesDataSource numberOfColorResources](self, "numberOfColorResources"));
  }
  if (a3 != 1)
  {
    SEL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryResourcesDataSource.m", 251, @"invalid color resource index %li", a3);

    abort();
  }
  return [(PXStoryResourcesDataSource *)self backgroundColorResource];
}

- (id)songResourceAtIndex:(int64_t)a3
{
  long long v4 = [(PXStoryResourcesDataSource *)self audioAssets];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)numberOfSongResources
{
  v2 = [(PXStoryResourcesDataSource *)self audioAssets];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)movieHighlightsForDisplayAssetAtIndex:(int64_t)a3
{
  if (a3 == -1)
  {
    v6 = [(PXStoryResourcesDataSource *)self keyAsset];
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v5 = [(PXStoryResourcesDataSource *)self displayAssets];
    v6 = [v5 objectAtIndexedSubscript:a3];

    if (v6)
    {
LABEL_3:
      id v7 = [(PXStoryResourcesDataSource *)self movieHighlights];
      SEL v8 = [v7 movieHighlightsForDisplayAsset:v6];

      goto LABEL_6;
    }
  }
  SEL v8 = 0;
LABEL_6:

  return v8;
}

- (int64_t)indexForDisplayAssetReference:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryResourcesDataSource *)self displayAssets];
  long long v7 = 0u;
  if (v4) {
    objc_msgSend(v4, "indexPath", (unsigned __int128)0);
  }
  v9.length = objc_msgSend(v5, "count", v7);
  v8.location = 0;
  v8.length = 11;
  v9.location = 0;
  if (NSIntersectionRange(v8, v9).length)
  {
    [v4 asset];
    objc_claimAutoreleasedReturnValue();
    PXSectionedFetchResultIndexOfObjectInRange();
  }
  [v4 asset];
  objc_claimAutoreleasedReturnValue();
  PXSectionedFetchResultIndexOfObject();
}

- (id)displayAssetResourceAtIndex:(int64_t)a3
{
  if (a3 != -1)
  {
    v5 = [(PXStoryResourcesDataSource *)self displayAssets];
    v6 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:

    goto LABEL_5;
  }
  v6 = [(PXStoryResourcesDataSource *)self keyAssetResource];
  if (!v6)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXStoryResourcesDataSource.m" lineNumber:198 description:@"key asset resource doesn't exist"];
    goto LABEL_3;
  }
LABEL_5:
  return v6;
}

- (int64_t)numberOfDisplayAssetResources
{
  v2 = [(PXStoryResourcesDataSource *)self displayAssets];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)enumerateTextResourcesForTitles:(unint64_t)a3 displayAssetResourceAtIndex:(int64_t)a4 usingBlock:(id)a5
{
  char v6 = a3;
  id v8 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PXStoryResourcesDataSource_enumerateTextResourcesForTitles_displayAssetResourceAtIndex_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5DCDA90;
  v20 = v26;
  id v9 = v8;
  id v19 = v9;
  v21 = &v22;
  uint64_t v10 = (void (**)(void *, int64_t, void))_Block_copy(aBlock);
  if ((v6 & 1) != 0 && self->_initialDisplayAssetIndex == a4)
  {
    v10[2](v10, [(PXStoryResourcesDataSource *)self initialTitleTextResourceIndex], 0);
    v10[2](v10, [(PXStoryResourcesDataSource *)self initialSubtitleTextResourceIndex], 1);
  }
  if (!*((unsigned char *)v23 + 24))
  {
    uint64_t v11 = [(PXStoryResourcesDataSource *)self chapterCollection];
    uint64_t v12 = (void *)v11;
    if ((v6 & 2) != 0 && v11)
    {
      int v13 = [(PXStoryResourcesDataSource *)self displayAssetResourceAtIndex:a4];
      v14 = objc_msgSend(v13, "px_storyResourceDisplayAsset");

      if ([v12 containsChapterBeginningWithAsset:v14])
      {
        id v15 = [v12 chapterContainingAsset:v14];
        id v16 = [v15 identifier];

        uint64_t v17 = [v12 indexOfChapterWithIdentifier:v16];
        v10[2](v10, self->_chapterTitleTextResourceIndexes.location + v17, 0);
        v10[2](v10, self->_chapterSubtitleTextResourceIndexes.location + v17, 1);
      }
    }
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
}

uint64_t __101__PXStoryResourcesDataSource_enumerateTextResourcesForTitles_displayAssetResourceAtIndex_usingBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 != 0x7FFFFFFFFFFFFFFFLL && *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) == 0)
  {
    uint64_t v3 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v3 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (id)_createTextResourceAtIndex:(int64_t)a3
{
  if ([(PXStoryResourcesDataSource *)self initialTitleTextResourceIndex] == a3)
  {
    char v6 = [PXStoryConcreteTextResource alloc];
    long long v7 = [(PXStoryResourcesDataSource *)self assetCollection];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = 0;
LABEL_5:
    uint64_t v12 = [(PXStoryConcreteTextResource *)v8 initWithAssetCollection:v9 type:v10];
    goto LABEL_16;
  }
  if ([(PXStoryResourcesDataSource *)self initialSubtitleTextResourceIndex] == a3)
  {
    uint64_t v11 = [PXStoryConcreteTextResource alloc];
    long long v7 = [(PXStoryResourcesDataSource *)self assetCollection];
    id v8 = v11;
    id v9 = v7;
    uint64_t v10 = 1;
    goto LABEL_5;
  }
  NSUInteger location = self->_chapterTitleTextResourceIndexes.location;
  BOOL v15 = a3 >= location;
  NSUInteger v14 = a3 - location;
  BOOL v15 = !v15 || v14 >= self->_chapterTitleTextResourceIndexes.length;
  if (v15)
  {
    NSUInteger v16 = self->_chapterSubtitleTextResourceIndexes.location;
    BOOL v15 = a3 >= v16;
    NSUInteger v17 = a3 - v16;
    if (!v15 || v17 >= self->_chapterSubtitleTextResourceIndexes.length)
    {
      char v25 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryResourcesDataSource.m", 156, @"invalid text resource index %li", a3);

      abort();
    }
    v18 = [(PXStoryResourcesDataSource *)self chapterCollection];
    long long v7 = [v18 chapterAtIndex:a3 - self->_chapterSubtitleTextResourceIndexes.location];

    v20 = [PXStoryConcreteTextResource alloc];
    v21 = v7;
    uint64_t v22 = 1;
  }
  else
  {
    id v19 = [(PXStoryResourcesDataSource *)self chapterCollection];
    long long v7 = [v19 chapterAtIndex:a3 - self->_chapterTitleTextResourceIndexes.location];

    v20 = [PXStoryConcreteTextResource alloc];
    v21 = v7;
    uint64_t v22 = 0;
  }
  uint64_t v12 = [(PXStoryConcreteTextResource *)v20 initWithChapter:v21 type:v22];
LABEL_16:
  v23 = (void *)v12;

  return v23;
}

- (id)textResourceAtIndex:(int64_t)a3
{
  if ([(PXStoryResourcesDataSource *)self numberOfTextResources] <= a3)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryResourcesDataSource.m", 127, @"index %li out of bounds 0 ..< %li", a3, -[PXStoryResourcesDataSource numberOfTextResources](self, "numberOfTextResources"));
  }
  char v6 = self;
  objc_sync_enter(v6);
  long long v7 = [NSNumber numberWithInteger:a3];
  id v8 = [(NSMutableDictionary *)v6->_cachedTextResources objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = [(PXStoryResourcesDataSource *)v6 _createTextResourceAtIndex:a3];
    cachedTextResources = v6->_cachedTextResources;
    if (!cachedTextResources)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v11 = v6->_cachedTextResources;
      v6->_cachedTextResources = v10;

      cachedTextResources = v6->_cachedTextResources;
    }
    [(NSMutableDictionary *)cachedTextResources setObject:v8 forKeyedSubscript:v7];
  }

  objc_sync_exit(v6);
  return v8;
}

- (PXStoryResourcesDataSource)initWithKeyAsset:(id)a3 displayAssets:(id)a4 availableDisplayAssets:(id)a5 movieHighlights:(id)a6 detailedSaliency:(id)a7 chapterCollection:(id)a8 audioAssets:(id)a9 assetCollection:(id)a10 overallDurationInfo:(id *)a11 storyConfiguration:(id)a12
{
  id v60 = a3;
  id v59 = a4;
  id v58 = a5;
  id v57 = a6;
  unint64_t v61 = (unint64_t)a7;
  id obj = a8;
  id v56 = a8;
  id v55 = a9;
  unint64_t v19 = (unint64_t)a10;
  id v20 = a12;
  v64.receiver = self;
  v64.super_class = (Class)PXStoryResourcesDataSource;
  v21 = [(PXStoryResourcesDataSource *)&v64 init];
  uint64_t v22 = v21;
  if (v21)
  {
    v54 = v20;
    objc_storeStrong((id *)&v21->_keyAsset, a3);
    objc_storeStrong((id *)&v22->_displayAssets, a4);
    objc_storeStrong((id *)&v22->_availableDisplayAssets, a5);
    objc_storeStrong((id *)&v22->_audioAssets, a9);
    objc_storeStrong((id *)&v22->_assetCollection, a10);
    objc_storeStrong((id *)&v22->_movieHighlights, a6);
    objc_storeStrong((id *)&v22->_detailedSaliency, a7);
    objc_storeStrong((id *)&v22->_chapterCollection, obj);
    *(_OWORD *)&v22->_overallDurationInfo.kind = *(_OWORD *)&a11->var0;
    long long v23 = *(_OWORD *)&a11->var1.var0.var1;
    long long v24 = *(_OWORD *)&a11->var1.var1.var0;
    long long v25 = *(_OWORD *)&a11->var1.var1.var3;
    *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = *(_OWORD *)&a11->var1.var2.var1;
    *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v25;
    *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v24;
    *(_OWORD *)&v22->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v23;
    v22->_lock._os_unfair_lock_opaque = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke;
    aBlock[3] = &unk_1E5DCDA40;
    v26 = v22;
    void aBlock[4] = v26;
    char v27 = (uint64_t (**)(void *))_Block_copy(aBlock);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke_2;
    v62[3] = &unk_1E5DCDA68;
    v28 = v26;
    v62[4] = v28;
    v29 = (uint64_t (**)(void *, uint64_t))_Block_copy(v62);
    if (v19)
    {
      v28->_initialTitleTextResourceIndex = v27[2](v27);
      uint64_t v30 = v27[2](v27);
    }
    else
    {
      uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
      v28->_initialTitleTextResourceIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    v28->_initialSubtitleTextResourceIndex = v30;
    uint64_t v31 = [(PXStoryChapterCollection *)v22->_chapterCollection numberOfChapters];
    v28->_chapterTitleTextResourceIndexes.NSUInteger location = v29[2](v29, v31);
    v28->_chapterTitleTextResourceIndexes.length = v32;
    v28->_chapterSubtitleTextResourceIndexes.NSUInteger location = v29[2](v29, v31);
    v28->_chapterSubtitleTextResourceIndexes.length = v33;
    v28->_numberOfColorResources = 2;
    v34 = [v54 userInfo];
    v35 = v34;
    if (!(v61 | v19) || !v34)
    {
      v42 = objc_alloc_init(PXStoryBaseDisplayAssetCroppingContext);
      croppingContext = v28->_croppingContext;
      v28->_croppingContext = (PXStoryDisplayAssetCroppingContext *)v42;
      goto LABEL_17;
    }
    obja = (id *)&v22->_detailedSaliency;
    croppingContext = [v34 objectForKeyedSubscript:@"defaultCroppingContext"];
    uint64_t v51 = [v35 objectForKeyedSubscript:@"cachingCroppingContext"];
    v37 = [croppingContext assetCollection];
    v38 = v22->_assetCollection;
    if (v37 == v38)
    {
    }
    else
    {
      v39 = v38;
      char v40 = [(PXDisplayAssetCollection *)v37 isEqual:v38];

      if ((v40 & 1) == 0)
      {

        v41 = (PXStoryDisplayAssetCroppingContext *)v51;
        goto LABEL_14;
      }
    }
    id v43 = [croppingContext detailedSaliency];
    id v44 = *obja;
    if (v43 == v44)
    {

      v41 = (PXStoryDisplayAssetCroppingContext *)v51;
      goto LABEL_16;
    }
    v45 = v44;
    char v50 = [v43 isEqual:v44];

    v41 = (PXStoryDisplayAssetCroppingContext *)v51;
    if (v50)
    {
LABEL_16:
      v48 = v28->_croppingContext;
      v28->_croppingContext = v41;

LABEL_17:
      sub_1AB2347DC();
    }
LABEL_14:
    v46 = [[PXStoryDefaultDisplayAssetCroppingContext alloc] initWithAssetCollection:v22->_assetCollection detailedSaliency:*obja];

    v47 = [[PXStoryCachingDisplayAssetCroppingContext alloc] initWithCroppingContext:v46];
    [v35 setObject:v47 forKeyedSubscript:@"cachingCroppingContext"];
    [v35 setObject:v46 forKeyedSubscript:@"defaultCroppingContext"];
    croppingContext = v46;
    v41 = (PXStoryDisplayAssetCroppingContext *)v47;
    goto LABEL_16;
  }

  return 0;
}

uint64_t __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v1 + 80);
  *(void *)(v1 + 80) = result + 1;
  return result;
}

uint64_t __202__PXStoryResourcesDataSource_initWithKeyAsset_displayAssets_availableDisplayAssets_movieHighlights_detailedSaliency_chapterCollection_audioAssets_assetCollection_overallDurationInfo_storyConfiguration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = result + a2;
  return result;
}

- (PXStoryResourcesDataSource)initWithStoryConfiguration:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 32);
  v6[3] = v3;
  v6[4] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 64);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 16);
  v6[0] = *MEMORY[0x1E4F8D288];
  v6[1] = v4;
  return [(PXStoryResourcesDataSource *)self initWithKeyAsset:0 displayAssets:0 availableDisplayAssets:0 movieHighlights:0 detailedSaliency:0 chapterCollection:0 audioAssets:0 assetCollection:0 overallDurationInfo:v6 storyConfiguration:a3];
}

@end