@interface PXAppleMusicCuration
+ (id)_parseAppleMusicCurationInfoFromJSONDictionary:(id)a3;
+ (id)curationFromDictionary:(id)a3 photoLibrary:(id)a4;
+ (id)parseAppleMusicAssetsFromJSONArray:(id)a3 photoLibrary:(id)a4;
- (PXAppleMusicCuration)init;
- (PXAppleMusicCuration)initWithBestMusicSuggestions:(id)a3 musicForYou:(id)a4 musicForLocation:(id)a5 musicForTime:(id)a6 musicForPerformer:(id)a7 musicCurationInfo:(id)a8;
- (PXAppleMusicCurationInfo)musicCurationInfo;
- (PXAudioAssetFetchResult)bestMusicSuggestions;
- (PXAudioAssetFetchResult)musicForLocation;
- (PXAudioAssetFetchResult)musicForPerformer;
- (PXAudioAssetFetchResult)musicForTime;
- (PXAudioAssetFetchResult)musicForYou;
@end

@implementation PXAppleMusicCuration

+ (id)_parseAppleMusicCurationInfoFromJSONDictionary:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"performerNames"];
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    v5 = (void *)v3;
  }
  id v6 = v5;

  v7 = [[PXAppleMusicCurationInfo alloc] initWithPerformerNames:v6];
  return v7;
}

+ (id)parseAppleMusicAssetsFromJSONArray:(id)a3 photoLibrary:(id)a4
{
  id v4 = a4;
  PXMap();
}

PXAppleMusicAsset *__82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"adamID"];
  if (v4)
  {
    uint64_t v57 = a1;
    v5 = [v3 objectForKeyedSubscript:@"isExplicit"];
    char v55 = [v5 BOOLValue];

    v68 = [v3 objectForKeyedSubscript:@"title"];
    v67 = [v3 objectForKeyedSubscript:@"artist"];
    id v6 = [v3 objectForKeyedSubscript:@"album"];
    v66 = [v3 objectForKeyedSubscript:@"artworkURLFormat"];
    uint64_t v7 = [v3 objectForKeyedSubscript:@"songURLPath"];
    v63 = (void *)v7;
    if (v7)
    {
      v65 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      v65 = 0;
    }
    uint64_t v9 = [v3 objectForKeyedSubscript:@"introPreviewPath"];
    v62 = (void *)v9;
    if (v9)
    {
      v52 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    }
    else
    {
      v52 = 0;
    }
    v49 = [v3 objectForKeyedSubscript:@"contentProvider"];
    if (!v49)
    {
      v10 = PLStoryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) Song JSON is missing contentProvider.", (uint8_t *)&buf, 2u);
      }
    }
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    v11 = [v3 objectForKeyedSubscript:@"duration"];
    v12 = v11;
    if (v11)
    {
      [v11 doubleValue];
      CMTimeMakeWithSeconds(&buf, v13, 300);
    }
    v61 = v12;
    v47 = [v3 objectForKeyedSubscript:@"arousal"];
    v46 = [v3 objectForKeyedSubscript:@"valence"];
    v44 = [v3 objectForKeyedSubscript:@"loudnessMainPeak"];
    v42 = [v3 objectForKeyedSubscript:@"loudnessMainValue"];
    v14 = [v3 objectForKeyedSubscript:@"flexMLAnalysis"];
    v59 = [v14 objectForKeyedSubscript:@"entryPoints"];
    if ([v59 count]) {
      PXMap();
    }
    v15 = [v14 objectForKeyedSubscript:@"videoEvents"];
    v40 = [v15 objectForKeyedSubscript:@"score"];
    v54 = v15;
    v16 = [v15 objectForKeyedSubscript:@"timeInSeconds"];
    v60 = v14;
    v17 = [v14 objectForKeyedSubscript:@"visualTempo"];
    v18 = [v17 objectForKeyedSubscript:@"value"];

    v64 = v4;
    v51 = v18;
    id v43 = v3;
    if ([v18 count])
    {
      long long v92 = 0u;
      long long v91 = 0u;
      long long v90 = 0u;
      long long v89 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v89 objects:v94 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v90;
        float v23 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v90 != v22) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v89 + 1) + 8 * i) floatValue];
            float v23 = v23 + v25;
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v89 objects:v94 count:16];
        }
        while (v21);
      }
      else
      {
        float v23 = 0.0;
      }

      v27 = NSNumber;
      *(float *)&double v28 = v23 / (float)(unint64_t)[v19 count];
      v26 = [v27 numberWithFloat:v28];
      id v4 = v64;
    }
    else
    {
      v26 = 0;
    }
    v38 = v6;
    v39 = [PXAppleMusicAsset alloc];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke_2;
    v69[3] = &unk_1E5DAF2D0;
    id v70 = v4;
    id v71 = v68;
    id v72 = v67;
    id v73 = v6;
    id v74 = v66;
    id v75 = v65;
    id v76 = v52;
    id v77 = v49;
    CMTime v87 = buf;
    id v78 = v47;
    id v79 = v46;
    id v80 = v26;
    id v81 = v44;
    char v88 = v55;
    id v82 = v42;
    id v83 = v16;
    id v84 = v40;
    id v85 = 0;
    id v86 = *(id *)(v57 + 32);
    id v58 = 0;
    id v56 = v40;
    id v41 = v16;
    id v29 = v42;
    id v30 = v44;
    id v45 = v26;
    id v31 = v46;
    id v48 = v47;
    id v50 = v49;
    id v53 = v52;
    id v32 = v65;
    id v33 = v66;
    id v34 = v38;
    id v35 = v67;
    id v36 = v68;
    v8 = [(PXAppleMusicAsset *)v39 initWithConfiguration:v69];

    id v4 = v64;
    id v3 = v43;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStoreID:v3];
  [v4 setTitle:*(void *)(a1 + 40)];
  [v4 setArtistName:*(void *)(a1 + 48)];
  [v4 setAlbumTitle:*(void *)(a1 + 56)];
  [v4 setArtworkURLFormat:*(void *)(a1 + 64)];
  [v4 setSongURL:*(void *)(a1 + 72)];
  [v4 setIntroPreviewURL:*(void *)(a1 + 80)];
  [v4 setContentProvider:*(void *)(a1 + 88)];
  long long v5 = *(_OWORD *)(a1 + 168);
  uint64_t v6 = *(void *)(a1 + 184);
  [v4 setDuration:&v5];
  [v4 setEnergy:*(void *)(a1 + 96)];
  [v4 setValence:*(void *)(a1 + 104)];
  [v4 setVisualTempo:*(void *)(a1 + 112)];
  [v4 setLoudnessMainPeak:*(void *)(a1 + 120)];
  [v4 setLoudnessMainValue:*(void *)(a1 + 128)];
  [v4 setFlags:*(unsigned __int8 *)(a1 + 192)];
  [v4 configureCuesWithVideoEventTimestampsInSeconds:*(void *)(a1 + 136) videoEventScores:*(void *)(a1 + 144)];
  [v4 setEntryPoints:*(void *)(a1 + 152)];
  [v4 setPhotoLibrary:*(void *)(a1 + 160)];
}

id __82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke_65(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 objectForKeyedSubscript:@"timeInSeconds"];
  [v3 doubleValue];
  double v5 = v4;
  uint64_t v6 = [v2 objectForKeyedSubscript:@"gainTimeInSeconds"];
  uint64_t v7 = [v2 objectForKeyedSubscript:@"gainValue"];

  v8 = PXAudioAssetEntryPointMake(v6, v7, v5);

  return v8;
}

+ (id)curationFromDictionary:(id)a3 photoLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"bestMusicSuggestions"];
  uint64_t v9 = [a1 parseAppleMusicAssetsFromJSONArray:v8 photoLibrary:v6];

  v10 = [v7 objectForKeyedSubscript:@"musicForYou"];
  v11 = [a1 parseAppleMusicAssetsFromJSONArray:v10 photoLibrary:v6];

  v12 = [v7 objectForKeyedSubscript:@"musicForLocation"];
  Float64 v13 = [a1 parseAppleMusicAssetsFromJSONArray:v12 photoLibrary:v6];

  v14 = [v7 objectForKeyedSubscript:@"musicForTime"];
  v15 = [a1 parseAppleMusicAssetsFromJSONArray:v14 photoLibrary:v6];

  v16 = [v7 objectForKeyedSubscript:@"musicForPerformer"];
  v17 = [a1 parseAppleMusicAssetsFromJSONArray:v16 photoLibrary:v6];

  v18 = [v7 objectForKeyedSubscript:@"musicCurationInfo"];

  id v19 = [a1 _parseAppleMusicCurationInfoFromJSONDictionary:v18];

  uint64_t v20 = [[PXAppleMusicCuration alloc] initWithBestMusicSuggestions:v9 musicForYou:v11 musicForLocation:v13 musicForTime:v15 musicForPerformer:v17 musicCurationInfo:v19];
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicCurationInfo, 0);
  objc_storeStrong((id *)&self->_musicForPerformer, 0);
  objc_storeStrong((id *)&self->_musicForTime, 0);
  objc_storeStrong((id *)&self->_musicForLocation, 0);
  objc_storeStrong((id *)&self->_musicForYou, 0);
  objc_storeStrong((id *)&self->_bestMusicSuggestions, 0);
}

- (PXAppleMusicCurationInfo)musicCurationInfo
{
  return self->_musicCurationInfo;
}

- (PXAudioAssetFetchResult)musicForPerformer
{
  return self->_musicForPerformer;
}

- (PXAudioAssetFetchResult)musicForTime
{
  return self->_musicForTime;
}

- (PXAudioAssetFetchResult)musicForLocation
{
  return self->_musicForLocation;
}

- (PXAudioAssetFetchResult)musicForYou
{
  return self->_musicForYou;
}

- (PXAudioAssetFetchResult)bestMusicSuggestions
{
  return self->_bestMusicSuggestions;
}

- (PXAppleMusicCuration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAppleMusicCuration.m", 59, @"%s is not available as initializer", "-[PXAppleMusicCuration init]");

  abort();
}

- (PXAppleMusicCuration)initWithBestMusicSuggestions:(id)a3 musicForYou:(id)a4 musicForLocation:(id)a5 musicForTime:(id)a6 musicForPerformer:(id)a7 musicCurationInfo:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PXAppleMusicCuration;
  v18 = [(PXAppleMusicCuration *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bestMusicSuggestions, a3);
    objc_storeStrong((id *)&v19->_musicForYou, a4);
    objc_storeStrong((id *)&v19->_musicForLocation, a5);
    objc_storeStrong((id *)&v19->_musicForTime, a6);
    objc_storeStrong((id *)&v19->_musicForPerformer, a7);
    objc_storeStrong((id *)&v19->_musicCurationInfo, a8);
  }

  return v19;
}

@end