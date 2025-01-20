@interface PXStoryRecipe
- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo;
- (NSDictionary)autoEditDecisionListsBySong;
- (PFStoryRecipe)sourcePersistableRecipe;
- (PXDisplayAsset)keyAsset;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayAssetFetchResult)allAssets;
- (PXDisplayAssetFetchResult)curatedAssets;
- (PXDisplayAssetFetchResult)untruncatedCuratedAssets;
- (PXStoryChapterCollection)chapterCollection;
- (PXStoryMovieHighlightsCollection)movieHighlights;
- (PXStoryRecipe)init;
- (PXStoryRecipe)initWithAssetCollection:(id)a3 keyAsset:(id)a4 curatedAssets:(id)a5 untruncatedCuratedAssets:(id)a6 allAssets:(id)a7 movieHighlights:(id)a8 detailedSaliency:(id)a9 chapterCollection:(id)a10 overallDurationInfo:(id *)a11 styleConfigurationList:(id)a12 sourcePersistableRecipe:(id)a13 initialSongResource:(id)a14 fallbackSongResource:(id)a15 autoEditDecisionListsBySong:(id)a16;
- (PXStorySaliencyDataSource)detailedSaliency;
- (PXStorySongResource)fallbackSongResource;
- (PXStorySongResource)initialSongResource;
- (PXStoryStyleConfigurationList)styleConfigurationList;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
@end

@implementation PXStoryRecipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionListsBySong, 0);
  objc_storeStrong((id *)&self->_fallbackSongResource, 0);
  objc_storeStrong((id *)&self->_initialSongResource, 0);
  objc_storeStrong((id *)&self->_sourcePersistableRecipe, 0);
  objc_storeStrong((id *)&self->_styleConfigurationList, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_detailedSaliency, 0);
  objc_storeStrong((id *)&self->_movieHighlights, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_untruncatedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (NSDictionary)autoEditDecisionListsBySong
{
  return self->_autoEditDecisionListsBySong;
}

- (PXStorySongResource)fallbackSongResource
{
  return self->_fallbackSongResource;
}

- (PXStorySongResource)initialSongResource
{
  return self->_initialSongResource;
}

- (PFStoryRecipe)sourcePersistableRecipe
{
  return self->_sourcePersistableRecipe;
}

- (PXStoryStyleConfigurationList)styleConfigurationList
{
  return self->_styleConfigurationList;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo
{
  long long v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[2].var1.var0.var1;
  long long v4 = *(_OWORD *)&self[1].var1.var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1.var1.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
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

- (PXDisplayAssetFetchResult)allAssets
{
  return self->_allAssets;
}

- (PXDisplayAssetFetchResult)untruncatedCuratedAssets
{
  return self->_untruncatedCuratedAssets;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXStoryRecipe)initWithAssetCollection:(id)a3 keyAsset:(id)a4 curatedAssets:(id)a5 untruncatedCuratedAssets:(id)a6 allAssets:(id)a7 movieHighlights:(id)a8 detailedSaliency:(id)a9 chapterCollection:(id)a10 overallDurationInfo:(id *)a11 styleConfigurationList:(id)a12 sourcePersistableRecipe:(id)a13 initialSongResource:(id)a14 fallbackSongResource:(id)a15 autoEditDecisionListsBySong:(id)a16
{
  id v39 = a3;
  id v45 = a4;
  id v35 = a5;
  id v44 = a5;
  id v36 = a6;
  id v43 = a6;
  id v42 = a7;
  id v41 = a8;
  id v40 = a9;
  id v38 = a10;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  v46.receiver = self;
  v46.super_class = (Class)PXStoryRecipe;
  v26 = [(PXStoryRecipe *)&v46 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_assetCollection, a3);
    objc_storeStrong((id *)&v27->_keyAsset, a4);
    objc_storeStrong((id *)&v27->_curatedAssets, v35);
    objc_storeStrong((id *)&v27->_untruncatedCuratedAssets, v36);
    objc_storeStrong((id *)&v27->_allAssets, a7);
    objc_storeStrong((id *)&v27->_movieHighlights, a8);
    objc_storeStrong((id *)&v27->_detailedSaliency, a9);
    objc_storeStrong((id *)&v27->_chapterCollection, a10);
    *(_OWORD *)&v27->_overallDurationInfo.kind = *(_OWORD *)&a11->var0;
    long long v28 = *(_OWORD *)&a11->var1.var0.var1;
    long long v29 = *(_OWORD *)&a11->var1.var1.var0;
    long long v30 = *(_OWORD *)&a11->var1.var2.var1;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = *(_OWORD *)&a11->var1.var1.var3;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = v30;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v28;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v29;
    objc_storeStrong((id *)&v27->_styleConfigurationList, a12);
    objc_storeStrong((id *)&v27->_sourcePersistableRecipe, a13);
    objc_storeStrong((id *)&v27->_initialSongResource, a14);
    objc_storeStrong((id *)&v27->_fallbackSongResource, a15);
    uint64_t v31 = [v25 copy];
    autoEditDecisionListsBySong = v27->_autoEditDecisionListsBySong;
    v27->_autoEditDecisionListsBySong = (NSDictionary *)v31;
  }
  return v27;
}

- (PXStoryRecipe)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 48);
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 32);
  v5[3] = v2;
  v5[4] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 64);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 16);
  v5[0] = *MEMORY[0x1E4F8D288];
  v5[1] = v3;
  return [(PXStoryRecipe *)self initWithAssetCollection:0 keyAsset:0 curatedAssets:0 untruncatedCuratedAssets:0 allAssets:0 movieHighlights:0 detailedSaliency:0 chapterCollection:0 overallDurationInfo:v5 styleConfigurationList:0 sourcePersistableRecipe:0 initialSongResource:0 fallbackSongResource:0 autoEditDecisionListsBySong:0];
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v8 = a3;
  long long v4 = [(PXStoryRecipe *)self curatedAssets];
  v5 = [(PXStoryRecipe *)self chapterCollection];
  v6 = v5;
  if (v5)
  {
    v7 = PXStoryChapterCollectionDiagnosticDescptionWithAssets(v5, v4);
    [v8 addAttachmentWithText:v7 name:@"Chapters"];
  }
}

@end