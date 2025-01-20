@interface PXFlexMusicLibrary
+ (PXFlexMusicLibrary)sharedLibrary;
+ (id)_audioMixInputParametersForMixParameters:(id)a3 audioTrack:(id)a4 sampleRate:(int)a5;
+ (id)_mixParametersForAudioMixInputParameters:(id)a3 sampleRate:(int)a4;
+ (id)coalesceAudioMixInputParametersA:(id)a3 withAudioMixInputParametersB:(id)a4 audioTrack:(id)a5;
+ (void)purgeLocalFlexDataWithCompletion:(id)a3;
- (BOOL)hasLocalResourceForAsset:(id)a3 resourceType:(int64_t)a4;
- (PXFlexMusicLibrary)init;
- (double)downloadProgressForAsset:(id)a3 resourceType:(int64_t)a4;
- (id)_fetchAssetsWithOptions:(id)a3;
- (id)_queue_cueSourceFromRendition:(id)a3;
- (id)_queue_downloadableAssetForAsset:(id)a3 resourceType:(int64_t)a4;
- (id)_queue_fetchAssetsWithOptions:(id)a3;
- (id)_queue_flexMusicAssetWithSong:(id)a3;
- (id)_queue_renditionForSongID:(id)a3 preferredDuration:(id *)a4;
- (id)cuesForAsset:(id)a3;
- (id)fetchAllAssets;
- (id)fetchAssetsWithIdentifiers:(id)a3;
- (id)fetchLocalAssetForMood:(unint64_t)a3;
- (id)fetchSortedAssetsGroupedByMood;
- (id)localURLForAsset:(id)a3 resourceType:(int64_t)a4;
- (id)playableAssetForAsset:(id)a3 preferredDuration:(id *)a4 audioMix:(id *)a5 peakValue:(double *)a6 loudness:(double *)a7;
- (id)requestAssetsWithIdentifiers:(id)a3 resultHandler:(id)a4;
- (void)_handleDownloadProgressChangedNotification:(id)a3;
- (void)_handleSongAssetsChangedNotification:(id)a3;
- (void)cancelDownloadForAsset:(id)a3 resourceType:(int64_t)a4;
- (void)dealloc;
- (void)requestDownloadForAsset:(id)a3 resourceType:(int64_t)a4;
@end

@implementation PXFlexMusicLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_downloadingAssetsRequestCount, 0);
  objc_storeStrong((id *)&self->_queue_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_queue_renditionForSongID:(id)a3 preferredDuration:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = [(FMSongLibrary *)self->_queue_library fetchSongWithUID:a3];
  v6 = v5;
  int64_t var0 = a4->var0;
  unsigned int var2 = a4->var2;
  int var1 = a4->var1;
  if (var2)
  {
    int64_t var3 = a4->var3;
  }
  else
  {
    if (v5)
    {
      [v5 naturalDuration];
      unsigned int var2 = HIDWORD(v12);
      int64_t var3 = v13;
    }
    else
    {
      int64_t var3 = 0;
      unsigned int var2 = 0;
      int64_t v11 = 0;
      unint64_t v12 = 0;
      int64_t v13 = 0;
    }
    int64_t var0 = v11;
    int var1 = v12;
  }
  int64_t v11 = var0;
  unint64_t v12 = __PAIR64__(var2, var1);
  int64_t v13 = var3;
  v9 = [v6 renditionForDuration:&v11 withOptions:MEMORY[0x1E4F1CC08]];

  return v9;
}

- (id)_queue_flexMusicAssetWithSong:(id)a3
{
  id v3 = a3;
  v4 = [PXFlexMusicAsset alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PXFlexMusicLibrary__queue_flexMusicAssetWithSong___block_invoke;
  v8[3] = &unk_1E5DCB900;
  id v9 = v3;
  id v5 = v3;
  v6 = [(PXFlexMusicAsset *)v4 initWithConfiguration:v8];

  return v6;
}

void __52__PXFlexMusicLibrary__queue_flexMusicAssetWithSong___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) songName];
  [v3 setTitle:v4];

  id v5 = [*(id *)(a1 + 32) artistName];
  [v3 setArtistName:v5];

  v6 = [v3 artistName];
  [v3 setSubtitle:v6];

  v7 = [*(id *)(a1 + 32) uid];
  [v3 setIdentifier:v7];

  v8 = DictionaryFromFMSongTags(*(void **)(a1 + 32));
  id v9 = VisualTempoFromTagsDictionary(v8);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v11 = [v8 objectForKeyedSubscript:@"Valence"];
  if (!v11
    || (unint64_t v12 = (void *)v11,
        [v8 objectForKeyedSubscript:@"Arousal"],
        int64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        !v13))
  {
    [v10 appendString:@"(⚠️ Check VPN) "];
  }
  uint64_t v14 = [v8 objectForKeyedSubscript:@"Valence"];
  v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = @"--";
  }
  [v10 appendFormat:@"valence=%@", v16];

  uint64_t v17 = [v8 objectForKeyedSubscript:@"Arousal"];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"--";
  }
  [v10 appendFormat:@",arousal=%@", v19];

  if (v9)
  {
    v20 = NSString;
    [v9 doubleValue];
    v22 = objc_msgSend(v20, "stringWithFormat:", @"%0.2f", v21);
    [v10 appendFormat:@",visualTempo=%@", v22];
  }
  else
  {
    [v10 appendFormat:@",visualTempo=%@", @"--"];
  }
  uint64_t v23 = [v8 objectForKeyedSubscript:@"Genre"];
  v24 = (void *)v23;
  v25 = @"Unknown";
  if (v23) {
    v25 = (__CFString *)v23;
  }
  [v10 appendFormat:@",genre=%@", v25];

  [v3 setAssetTagsDescription:v10];
  id v26 = v8;
  v27 = [v26 objectForKeyedSubscript:@"Arousal"];
  v28 = [v26 objectForKeyedSubscript:@"Valence"];
  v29 = v28;
  if (v27 && v28)
  {
    [v28 doubleValue];
    [v27 doubleValue];
    uint64_t v30 = PFStoryColorGradeCategoryFromValenceArousal();
  }
  else
  {
    PHMemoryMoodFromTagsDictionary(v26);
    uint64_t v30 = PFStoryColorGradeCategoryNamed();
  }
  v31 = (void *)v30;

  [v3 setColorGradeCategory:v31];
  id v32 = v26;
  v33 = VisualTempoFromTagsDictionary(v32);
  if (v33)
  {
    v34 = [MEMORY[0x1E4F8CDA8] standardConfiguration];
    [v33 doubleValue];
    uint64_t v35 = PFStoryRecipeSongPaceFromVisualTempo();
  }
  else
  {
    v34 = [v32 objectForKeyedSubscript:@"SongPace"];
    if ([v34 isEqualToString:@"Slow"])
    {
      uint64_t v35 = 1;
    }
    else if ([v34 isEqualToString:@"Medium"])
    {
      uint64_t v35 = 2;
    }
    else if ([v34 isEqualToString:@"Fast"])
    {
      uint64_t v35 = 3;
    }
    else
    {
      uint64_t v35 = 2;
    }
  }

  [v3 setPace:v35];
  [v3 setFlags:0];
  long long v36 = *MEMORY[0x1E4F1F9F8];
  uint64_t v37 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [v3 setTargetDuration:&v36];
}

- (void)_handleSongAssetsChangedNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PXFlexMusicLibrary__handleSongAssetsChangedNotification___block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXFlexMusicLibrary *)self performChanges:v3];
}

uint64_t __59__PXFlexMusicLibrary__handleSongAssetsChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:2];
}

- (void)_handleDownloadProgressChangedNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PXFlexMusicLibrary__handleDownloadProgressChangedNotification___block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXFlexMusicLibrary *)self performChanges:v3];
}

uint64_t __65__PXFlexMusicLibrary__handleDownloadProgressChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (id)_queue_downloadableAssetForAsset:(id)a3 resourceType:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  queue_library = self->_queue_library;
  v8 = [v6 identifier];
  id v9 = [(FMSongLibrary *)queue_library fetchSongWithUID:v8];

  if (v9)
  {
    if (a4 == 2)
    {
      id v10 = (id *)MEMORY[0x1E4F62188];
    }
    else
    {
      if (a4 != 1)
      {
        id v13 = 0;
        goto LABEL_11;
      }
      id v10 = (id *)MEMORY[0x1E4F62170];
    }
    id v13 = *v10;
LABEL_11:
    unint64_t v12 = [v9 assetWithID:v13];

    goto LABEL_12;
  }
  uint64_t v11 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Unable to find resource for asset %@ because FlexMusic song cannot be fetched.", (uint8_t *)&v15, 0xCu);
  }

  unint64_t v12 = 0;
LABEL_12:

  return v12;
}

- (id)_queue_fetchAssetsWithOptions:(id)a3
{
  id v4 = a3;
  queue_library = self->_queue_library;
  if (v4)
  {
    id v6 = [(FMSongLibrary *)self->_queue_library fetchSongsWithOptions:v4];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F621E8]);
    id v6 = [(FMSongLibrary *)queue_library fetchSongsWithOptions:v7];
  }
  uint64_t v8 = [v4 sortDescriptors];
  if (v8)
  {
    [v6 sortedArrayUsingDescriptors:v8];
    objc_claimAutoreleasedReturnValue();
  }
  PXMap();
}

id __52__PXFlexMusicLibrary__queue_fetchAssetsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PXAudioSettings sharedInstance];
  if ([v4 flexReturnOnlyLocalSongs])
  {
    id v5 = [v3 assetWithID:*MEMORY[0x1E4F62188]];
    int v6 = [v5 localURLExists];

    if (!v6)
    {
      id v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = objc_msgSend(*(id *)(a1 + 32), "_queue_flexMusicAssetWithSong:", v3);
LABEL_6:

  return v7;
}

- (id)_fetchAssetsWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__251217;
  queue = self->_queue;
  id v16 = __Block_byref_object_dispose__251218;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PXFlexMusicLibrary__fetchAssetsWithOptions___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__PXFlexMusicLibrary__fetchAssetsWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithOptions:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_cueSourceFromRendition:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F621D0];
  id v4 = a3;
  id v5 = [v4 timedMetadataItemsWithIdentifier:v3];
  id v6 = [v4 timedMetadataItemsWithIdentifier:*MEMORY[0x1E4F621C8]];
  id v7 = [v4 timedMetadataItemsWithIdentifier:*MEMORY[0x1E4F621E0]];
  uint64_t v8 = [v4 timedMetadataItemsWithIdentifier:*MEMORY[0x1E4F621D8]];

  uint64_t v9 = [v5 count];
  id v10 = [PXConcreteAudioCueSource alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke;
  v17[3] = &unk_1E5DCB8B0;
  id v18 = v5;
  id v19 = v6;
  id v20 = v7;
  id v21 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  id v14 = v5;
  int v15 = [(PXConcreteAudioCueSource *)v10 initWithNumberOfCues:v9 configuration:v17];

  return v15;
}

void __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke(uint64_t a1, uint64_t a2)
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke_2;
  v5[3] = &unk_1E5DCB888;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v9 = v15;
  id v7 = *(id *)(a1 + 48);
  id v10 = v14;
  id v8 = *(id *)(a1 + 56);
  id v11 = v13;
  uint64_t v12 = a2;
  [v4 enumerateObjectsUsingBlock:v5];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
}

double __52__PXFlexMusicLibrary__queue_cueSourceFromRendition___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    [a2 timeRange];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  *(_OWORD *)&v17.value = v14;
  v17.epoch = v15;
  v12.epoch = v15;
  uint64_t v13 = 1;
  id v5 = (void *)a1[4];
  id v6 = (unint64_t *)(*(void *)(a1[7] + 8) + 24);
  *(_OWORD *)&v12.value = v14;
  _PXTestBeatTimeMembership(&v12, v5, 2, v6, &v13);
  id v7 = (void *)a1[5];
  id v8 = (unint64_t *)(*(void *)(a1[8] + 8) + 24);
  CMTime v12 = v17;
  _PXTestBeatTimeMembership(&v12, v7, 4, v8, &v13);
  uint64_t v9 = (void *)a1[6];
  id v10 = (unint64_t *)(*(void *)(a1[9] + 8) + 24);
  CMTime v12 = v17;
  _PXTestBeatTimeMembership(&v12, v9, 3, v10, &v13);
  double result = *(double *)&v17.value;
  *(CMTime *)(a1[10] + 32 * a3) = v17;
  *(void *)(a1[10] + 32 * a3 + 24) = v13;
  return result;
}

- (id)playableAssetForAsset:(id)a3 preferredDuration:(id *)a4 audioMix:(id *)a5 peakValue:(double *)a6 loudness:(double *)a7
{
  id v11 = a3;
  PLAudioPlaybackGetLog();
  CMTime v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXFlexMusicLibrary - playableAssetForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(void *)buf = 0;
  v47 = buf;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__251217;
  v50 = __Block_byref_object_dispose__251218;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__251217;
  v44 = __Block_byref_object_dispose__251218;
  id v45 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = (double *)&v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PXFlexMusicLibrary_playableAssetForAsset_preferredDuration_audioMix_peakValue_loudness___block_invoke;
  block[3] = &unk_1E5DCB860;
  block[4] = self;
  id v16 = v11;
  long long v30 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  id v25 = v16;
  id v26 = &v36;
  v27 = &v32;
  v28 = buf;
  v29 = &v40;
  dispatch_sync(queue, block);
  if (a5) {
    *a5 = (id) v41[5];
  }
  if (a6) {
    *a6 = v37[3];
  }
  if (a7) {
    *a7 = v33[3];
  }
  PLAudioPlaybackGetLog();
  CMTime v17 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, self);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v19 = v18;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_END, v19, "PXFlexMusicLibrary - playableAssetForAsset", " enableTelemetry=YES ", v23, 2u);
    }
  }

  id v20 = *((id *)v47 + 5);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(buf, 8);
  return v20;
}

void __90__PXFlexMusicLibrary_playableAssetForAsset_preferredDuration_audioMix_peakValue_loudness___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  long long v12 = *(_OWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 96);
  id v4 = objc_msgSend(v2, "_queue_renditionForSongID:preferredDuration:", v3, &v12);

  int v11 = 0;
  LODWORD(v12) = 0;
  [v4 _maxPeakAndLoudness:*(void *)(*(void *)(a1 + 56) + 8) + 24 missingPeakValueCount:&v12 missingLoudnessCount:&v11];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 avCompositionWithAudioMix:&obj includeShortenedOutroFadeOut:0];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)localURLForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6 = a3;
  PLAudioPlaybackGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXFlexMusicLibrary - localURLForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(void *)buf = 0;
  uint64_t v23 = buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__251217;
  id v26 = __Block_byref_object_dispose__251218;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PXFlexMusicLibrary_localURLForAsset_resourceType___block_invoke;
  block[3] = &unk_1E5DCB838;
  block[4] = self;
  id v11 = v6;
  id v20 = buf;
  int64_t v21 = a4;
  id v19 = v11;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  long long v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)CMTime v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXFlexMusicLibrary - localURLForAsset", " enableTelemetry=YES ", v17, 2u);
    }
  }

  id v15 = *((id *)v23 + 5);
  _Block_object_dispose(buf, 8);

  return v15;
}

void __52__PXFlexMusicLibrary_localURLForAsset_resourceType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 localURL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)downloadProgressForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6 = a3;
  PLAudioPlaybackGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXFlexMusicLibrary - downloadProgressForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(void *)buf = 0;
  uint64_t v23 = buf;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PXFlexMusicLibrary_downloadProgressForAsset_resourceType___block_invoke;
  block[3] = &unk_1E5DCB838;
  block[4] = self;
  id v11 = v6;
  id v20 = buf;
  int64_t v21 = a4;
  id v19 = v11;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  long long v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)CMTime v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXFlexMusicLibrary - downloadProgressForAsset", " enableTelemetry=YES ", v17, 2u);
    }
  }

  double v15 = *((double *)v23 + 3);
  _Block_object_dispose(buf, 8);

  return v15;
}

void __60__PXFlexMusicLibrary_downloadProgressForAsset_resourceType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 downloadProgress];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
}

- (void)cancelDownloadForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PXFlexMusicLibrary_cancelDownloadForAsset_resourceType___block_invoke;
  block[3] = &unk_1E5DD0D90;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __58__PXFlexMusicLibrary_cancelDownloadForAsset_resourceType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 112) removeObject:v2];
  if (![*(id *)(*(void *)(a1 + 32) + 112) countForObject:v2]) {
    [v2 cancelDownload];
  }
}

- (void)requestDownloadForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PXFlexMusicLibrary_requestDownloadForAsset_resourceType___block_invoke;
  block[3] = &unk_1E5DD0D90;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __59__PXFlexMusicLibrary_requestDownloadForAsset_resourceType___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v3 = v2;
  if (v2)
  {
    id v6 = v2;
    int v4 = [v2 localURLExists];
    id v3 = v6;
    if (!v4 || (v5 = [v6 contentUpdateAvailable], id v3 = v6, v5))
    {
      [v3 requestDownload];
      [*(id *)(*(void *)(a1 + 32) + 112) addObject:v6];
      id v3 = v6;
    }
  }
}

- (BOOL)hasLocalResourceForAsset:(id)a3 resourceType:(int64_t)a4
{
  id v6 = a3;
  PLAudioPlaybackGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXFlexMusicLibrary - hasLocalResourceForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(void *)buf = 0;
  uint64_t v23 = buf;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PXFlexMusicLibrary_hasLocalResourceForAsset_resourceType___block_invoke;
  block[3] = &unk_1E5DCB838;
  block[4] = self;
  id v11 = v6;
  id v20 = buf;
  int64_t v21 = a4;
  id v19 = v11;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  long long v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)CMTime v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXFlexMusicLibrary - hasLocalResourceForAsset", " enableTelemetry=YES ", v17, 2u);
    }
  }

  uint8_t v15 = v23[24];
  _Block_object_dispose(buf, 8);

  return v15;
}

void __60__PXFlexMusicLibrary_hasLocalResourceForAsset_resourceType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_downloadableAssetForAsset:resourceType:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 localURLExists];
}

- (id)cuesForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__251217;
  uint64_t v23 = __Block_byref_object_dispose__251218;
  id v24 = 0;
  PLAudioPlaybackGetLog();
  int v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicLibrary - cuesForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PXFlexMusicLibrary_cuesForAsset___block_invoke;
  block[3] = &unk_1E5DCCA20;
  block[4] = self;
  id v9 = v4;
  id v16 = v9;
  CMTime v17 = &v19;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXFlexMusicLibrary - cuesForAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __35__PXFlexMusicLibrary_cuesForAsset___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 fetchSongWithUID:v3];

  long long v12 = 0uLL;
  uint64_t v13 = 0;
  int v5 = *(void **)(a1 + 40);
  if (!v5 || ([v5 targetDuration], (BYTE12(v12) & 1) == 0))
  {
    if (v4)
    {
      [v4 naturalDuration];
    }
    else
    {
      long long v10 = 0uLL;
      uint64_t v11 = 0;
    }
    long long v12 = v10;
    uint64_t v13 = v11;
  }
  long long v10 = v12;
  uint64_t v11 = v13;
  os_signpost_id_t v6 = [v4 renditionForDuration:&v10 withOptions:MEMORY[0x1E4F1CC08]];
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_queue_cueSourceFromRendition:", v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)fetchSortedAssetsGroupedByMood
{
  PLAudioPlaybackGetLog();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXFlexMusicLibrary - fetchSortedAssetsGroupedByMood", " enableTelemetry=YES ", buf, 2u);
    }
  }

  *(void *)buf = 0;
  uint8_t v15 = buf;
  uint64_t v16 = 0x3032000000;
  CMTime v17 = __Block_byref_object_copy__251217;
  os_signpost_id_t v18 = __Block_byref_object_dispose__251218;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PXFlexMusicLibrary_fetchSortedAssetsGroupedByMood__block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(queue, block);
  PLAudioPlaybackGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)long long v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXFlexMusicLibrary - fetchSortedAssetsGroupedByMood", " enableTelemetry=YES ", v12, 2u);
    }
  }

  id v10 = *((id *)v15 + 5);
  _Block_object_dispose(buf, 8);

  return v10;
}

void __52__PXFlexMusicLibrary_fetchSortedAssetsGroupedByMood__block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F621E8]);
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"hidden == NO"];
  [v2 setPredicate:v3];

  uint64_t v23 = v2;
  os_signpost_id_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) fetchSongsWithOptions:v2];
  os_signpost_id_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"songName" ascending:1];
  v29[0] = v5;
  os_signpost_id_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v22 = v4;
  uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        os_signpost_id_t v14 = [v13 keywords];
        char v15 = [v14 containsObject:@"_MSpecial"];

        uint64_t v16 = @"Special";
        if ((v15 & 1) == 0)
        {
          CMTime v17 = DictionaryFromFMSongTags(v13);
          PHMemoryMoodFromTagsDictionary(v17);
          PHStringForMemoryMood();
          uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!v16) {
            continue;
          }
        }
        os_signpost_id_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v16];

        if (!v18)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v19 forKeyedSubscript:v16];
        }
        id v20 = objc_msgSend(*(id *)(a1 + 32), "_queue_flexMusicAssetWithSong:", v13);
        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v16];
        [v21 addObject:v20];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }
}

- (id)fetchLocalAssetForMood:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  PLAudioPlaybackGetLog();
  os_signpost_id_t v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicLibrary - fetchLocalAssetForMood", " enableTelemetry=YES ", buf, 2u);
    }
  }

  id v8 = 0;
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 > 255)
    {
      switch(a3)
      {
        case 0x100uLL:
          id v8 = @"Party";
          break;
        case 0x200uLL:
          id v8 = @"Action";
          break;
        case 0x3FFuLL:
LABEL_17:
          id v8 = @"Neutral";
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x20uLL:
          id v8 = @"Happy";
          break;
        case 0x40uLL:
          id v8 = @"Uplifting";
          break;
        case 0x80uLL:
          id v8 = @"Epic";
          break;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        goto LABEL_17;
      case 1uLL:
        id v8 = @"Ethereal";
        break;
      case 2uLL:
        id v8 = @"Sentimental";
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        id v8 = @"Gentle";
        break;
      case 8uLL:
        id v8 = @"Chill";
        break;
      default:
        if (a3 == 16) {
          goto LABEL_17;
        }
        break;
    }
  }
  uint64_t v9 = [NSString stringWithFormat:@"%@%@", *MEMORY[0x1E4F621B8], v8];
  uint64_t v10 = PLStoryGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v27 = v9;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) Looking for bestLocallyAvailableAudioAsset with mood tag: %@", buf, 0xCu);
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F621E8]);
  long long v12 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"canPlay == YES"];
  v25[0] = v13;
  os_signpost_id_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"tagIDs CONTAINS %@", v9];
  v25[1] = v14;
  char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v16 = [v12 andPredicateWithSubpredicates:v15];
  [v11 setPredicate:v16];

  CMTime v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uid" ascending:1];
  long long v24 = v17;
  os_signpost_id_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v11 setSortDescriptors:v18];

  id v19 = [(PXFlexMusicLibrary *)self _fetchAssetsWithOptions:v11];
  PLAudioPlaybackGetLog();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v20, OS_SIGNPOST_INTERVAL_END, v22, "PXFlexMusicLibrary - fetchLocalAssetForMood", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v19;
}

- (id)requestAssetsWithIdentifiers:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  PLAudioPlaybackGetLog();
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXFlexMusicLibrary - requestAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PXFlexMusicLibrary_requestAssetsWithIdentifiers_resultHandler___block_invoke;
  v19[3] = &unk_1E5DD2BB8;
  id v20 = v6;
  os_signpost_id_t v21 = self;
  id v13 = v8;
  id v22 = v13;
  id v23 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(queue, v19);
  uint64_t v16 = v23;
  id v17 = v13;

  return v17;
}

void __65__PXFlexMusicLibrary_requestAssetsWithIdentifiers_resultHandler___block_invoke(uint64_t a1)
{
  id v2 = +[PXAudioSettings sharedInstance];
  int v3 = [v2 flexSimulateAssetFetchFailure];

  if (v3)
  {
    id v6 = PXAudioAssetFetchResultWithArray(MEMORY[0x1E4F1CBF0]);
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F621E8]);
    os_signpost_id_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uid in %@", *(void *)(a1 + 32)];
    [v4 setPredicate:v5];

    id v6 = objc_msgSend(*(id *)(a1 + 40), "_queue_fetchAssetsWithOptions:", v4);
  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  PLAudioPlaybackGetLog();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 40));
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXFlexMusicLibrary - requestAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)fetchAssetsWithIdentifiers:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PLAudioPlaybackGetLog();
  os_signpost_id_t v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicLibrary - fetchAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  os_signpost_id_t v8 = +[PXAudioSettings sharedInstance];
  int v9 = [v8 flexSimulateAssetFetchFailure];

  if (v9)
  {
    uint64_t v16 = PXAudioAssetFetchResultWithArray(MEMORY[0x1E4F1CBF0]);
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F621E8]);
    os_signpost_id_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uid in %@", v4];
    [v10 setPredicate:v11];

    if ((unint64_t)[v4 count] >= 2)
    {
      long long v12 = (void *)MEMORY[0x1E4F29008];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      id v23 = __49__PXFlexMusicLibrary_fetchAssetsWithIdentifiers___block_invoke;
      long long v24 = &unk_1E5DCB810;
      id v25 = v4;
      id v13 = [v12 sortDescriptorWithKey:@"uid" ascending:1 comparator:&v21];
      v27[0] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v10 setSortDescriptors:v14];
    }
    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uid in %@", v4, v21, v22, v23, v24];
    [v10 setPredicate:v15];

    uint64_t v16 = [(PXFlexMusicLibrary *)self _fetchAssetsWithOptions:v10];
  }
  PLAudioPlaybackGetLog();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, self);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v19 = v18;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_END, v19, "PXFlexMusicLibrary - fetchAssetsWithIdentifiers", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v16;
}

uint64_t __49__PXFlexMusicLibrary_fetchAssetsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  os_signpost_id_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 indexOfObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];

  if (v7 < v8) {
    return -1;
  }
  else {
    return v7 > v8;
  }
}

- (id)fetchAllAssets
{
  PLAudioPlaybackGetLog();
  int v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXFlexMusicLibrary - fetchAllAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  id v6 = +[PXAudioSettings sharedInstance];
  int v7 = [v6 flexSimulateAssetFetchFailure];

  if (v7) {
    PXAudioAssetFetchResultWithArray(MEMORY[0x1E4F1CBF0]);
  }
  else {
  unint64_t v8 = [(PXFlexMusicLibrary *)self _fetchAssetsWithOptions:0];
  }
  PLAudioPlaybackGetLog();
  int v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)id v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXFlexMusicLibrary - fetchAllAssets", " enableTelemetry=YES ", v13, 2u);
    }
  }

  return v8;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXFlexMusicLibrary;
  [(PXFlexMusicLibrary *)&v4 dealloc];
}

- (PXFlexMusicLibrary)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)PXFlexMusicLibrary;
  if ([(PXFlexMusicLibrary *)&v3 init]) {
    px_dispatch_queue_create_serial();
  }
  return 0;
}

+ (id)_audioMixInputParametersForMixParameters:(id)a3 audioTrack:(id)a4 sampleRate:(int)a5
{
  id v7 = a3;
  unint64_t v8 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:a4];
  int v9 = [v7 volumeKeyFrames];
  uint64_t v10 = [v9 count];
  uint64_t v11 = v10 - 1;
  if (v10 >= 1)
  {
    uint64_t v12 = v10;
    uint64_t v13 = 0;
    do
    {
      id v14 = [v9 objectAtIndexedSubscript:v13];
      uint64_t v15 = v13 + 1;
      if (v13 < v11
        && ([v9 objectAtIndexedSubscript:v13 + 1], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v17 = (void *)v16;
        memset(&v30, 0, sizeof(v30));
        CMTimeMake(&start, [v14 sampleTime], a5);
        CMTimeMake(&duration, [v17 sampleTime] - objc_msgSend(v14, "sampleTime"), a5);
        CMTimeRangeMake(&v30, &start, &duration);
        [v14 value];
        unsigned int v19 = v18;
        [v17 value];
        LODWORD(v21) = v20;
        CMTimeRange v27 = v30;
        objc_msgSend(v8, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v27, COERCE_DOUBLE(__PAIR64__(HIDWORD(v30.start.value), v19)), v21);
      }
      else
      {
        [v14 value];
        int v23 = v22;
        CMTimeMake(&v26, [v14 sampleTime], a5);
        LODWORD(v24) = v23;
        [v8 setVolume:&v26 atTime:v24];
      }

      uint64_t v13 = v15;
    }
    while (v12 != v15);
  }

  return v8;
}

+ (id)_mixParametersForAudioMixInputParameters:(id)a3 sampleRate:(int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F621F8]);
  CMTime v23 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  long long v21 = *MEMORY[0x1E4F1FA30];
  *(_OWORD *)int v22 = v7;
  *(_OWORD *)&v22[16] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  float v19 = -1.0;
  float v20 = -1.0;
  while (1)
  {
    while (1)
    {
      CMTime v18 = v23;
      char v8 = [v5 getVolumeRampForTime:&v18 startVolume:&v20 endVolume:&v19 timeRange:&v21];
      memset(&v18, 0, sizeof(v18));
      CMTime time = v23;
      CMTimeConvertScale(&v18, &time, a4, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      CMTime time = v23;
      *(_OWORD *)&v16.value = v21;
      v16.epoch = *(void *)v22;
      if (CMTimeCompare(&time, &v16)) {
        break;
      }
      if (v20 > -1.0)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F621F0]);
        *(float *)&double v10 = v20;
        uint64_t v11 = (void *)[v9 initWithValue:v18.value atTime:v10];
        [v6 appendVolumeKeyframe:v11];
      }
      CMTime time = v23;
      CMTime v16 = *(CMTime *)&v22[8];
      CMTimeAdd(&v23, &time, &v16);
      if ((v8 & 1) == 0) {
        goto LABEL_11;
      }
    }
    if ((v8 & 1) == 0) {
      break;
    }
    *(_OWORD *)&v23.value = v21;
    v23.epoch = *(void *)v22;
  }
  if (v19 > -1.0)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F621F0]);
    *(float *)&double v13 = v19;
    id v14 = (void *)[v12 initWithValue:v18.value atTime:v13];
    [v6 appendVolumeKeyframe:v14];
  }
LABEL_11:

  return v6;
}

+ (id)coalesceAudioMixInputParametersA:(id)a3 withAudioMixInputParametersB:(id)a4 audioTrack:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 naturalTimeScale];
  id v12 = [a1 _mixParametersForAudioMixInputParameters:v10 sampleRate:v11];

  double v13 = [a1 _mixParametersForAudioMixInputParameters:v9 sampleRate:v11];

  id v14 = [MEMORY[0x1E4F62218] coalesceMixParamsA:v12 withMixParamsB:v13];
  uint64_t v15 = [a1 _audioMixInputParametersForMixParameters:v14 audioTrack:v8 sampleRate:v11];

  return v15;
}

+ (void)purgeLocalFlexDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Purging local flex data…", buf, 2u);
  }

  id v6 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PXFlexMusicLibrary_purgeLocalFlexDataWithCompletion___block_invoke;
  v8[3] = &unk_1E5DCE5C8;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __55__PXFlexMusicLibrary_purgeLocalFlexDataWithCompletion___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(*(Class *)(a1 + 40));
  objc_super v3 = (void *)v2[13];
  uint64_t v4 = *MEMORY[0x1E4F62170];
  v9[0] = *MEMORY[0x1E4F62188];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v3 purgeAllLocalCachedAssetsWithIDs:v5];

  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = *(id *)(a1 + 32);
  MAPurgeCatalogsWithPurpose();
}

void __55__PXFlexMusicLibrary_purgeLocalFlexDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "Finished purging local flex data with error %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

+ (PXFlexMusicLibrary)sharedLibrary
{
  if (sharedLibrary_onceToken_251369 != -1) {
    dispatch_once(&sharedLibrary_onceToken_251369, &__block_literal_global_251370);
  }
  id v2 = (void *)sharedLibrary_library;
  return (PXFlexMusicLibrary *)v2;
}

void __35__PXFlexMusicLibrary_sharedLibrary__block_invoke()
{
  v0 = objc_alloc_init(PXFlexMusicLibrary);
  v1 = (void *)sharedLibrary_library;
  sharedLibrary_library = (uint64_t)v0;
}

@end