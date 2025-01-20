@interface AVAsset(RCAdditions)
+ (uint64_t)rc_updateMetadataInFile:()RCAdditions withMetadata:error:;
+ (uint64_t)rc_updateMetadataInFile:()RCAdditions withRecordingMetadata:error:;
- (Float64)rc_durationInSeconds;
- (id)rc_audioTracks;
- (id)rc_composedAVURL;
- (id)rc_playbackFormat;
- (id)rc_recordingMetadata;
- (void)rc_setComposedAVURL:()RCAdditions;
@end

@implementation AVAsset(RCAdditions)

- (void)rc_setComposedAVURL:()RCAdditions
{
}

- (id)rc_composedAVURL
{
  v2 = objc_getAssociatedObject(a1, "_AVAssetRCComposedAVURLKey");
  if (!v2)
  {
    if (objc_opt_respondsToSelector())
    {
      v2 = [a1 URL];
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)rc_recordingMetadata
{
  v2 = objc_opt_new();
  v3 = [a1 metadata];
  uint64_t v4 = *MEMORY[0x1E4F15E10];
  v5 = firstStringValue((uint64_t)v3, @"com.apple.iTunes.voice-memo-uuid", *MEMORY[0x1E4F15E10]);
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:@"uniqueID"];
  }
  v6 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v3 withKey:*MEMORY[0x1E4F15CA0] keySpace:*MEMORY[0x1E4F15DE0]];
  v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_114);
  v8 = [v7 firstObject];

  if (v8) {
    [v2 setObject:v8 forKeyedSubscript:@"date"];
  }
  v9 = firstStringValue((uint64_t)v3, *MEMORY[0x1E4F15EF0], *MEMORY[0x1E4F15E08]);
  v10 = v9;
  if (v9 && [v9 length]) {
    [v2 setObject:v10 forKeyedSubscript:@"title"];
  }
  v11 = firstStringValue((uint64_t)v3, @"com.apple.iTunes.music-memo-note", v4);
  if (v11) {
    [v2 setObject:v11 forKeyedSubscript:@"musicMemoTextNote"];
  }
  v12 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v3 withKey:@"com.apple.iTunes.music-memo-rating" keySpace:v4];
  v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_117);
  v14 = [v13 firstObject];

  if (v14) {
    [v2 setObject:v14 forKeyedSubscript:@"musicMemoStarRating"];
  }
  v15 = firstStringValue((uint64_t)v3, @"com.apple.iTunes.music-memo-tags", v4);
  if (v15) {
    [v2 setObject:v15 forKeyedSubscript:@"musicMemoTags"];
  }

  return v2;
}

+ (uint64_t)rc_updateMetadataInFile:()RCAdditions withRecordingMetadata:error:
{
  id v8 = a3;
  v9 = +[RCCaptureFormat AVAssetAuthoringMetadataWithRecordingMetadata:a4];
  uint64_t v10 = objc_msgSend(a1, "rc_updateMetadataInFile:withMetadata:error:", v8, v9, a5);

  return v10;
}

+ (uint64_t)rc_updateMetadataInFile:()RCAdditions withMetadata:error:
{
  id v7 = a4;
  id v8 = +[RCMutableMovie movieWithURL:a3 error:a5];
  v9 = v8;
  if (v8)
  {
    [v8 setMetadata:v7];
    uint64_t v10 = objc_msgSend(v9, "rc_writeMovieHeaderWithOptions:error:", 0, a5);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (Float64)rc_durationInSeconds
{
  [a1 duration];
  return CMTimeGetSeconds(&time);
}

- (id)rc_audioTracks
{
  v1 = [a1 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_19);

  return v2;
}

- (id)rc_playbackFormat
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v1 = objc_msgSend(a1, "rc_audioTracks", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v16;
    double mSampleRate = 0.0;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v1);
        }
        id v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) formatDescriptions];
        if ([v8 count])
        {
          unint64_t v9 = 0;
          do
          {
            uint64_t v10 = [v8 objectAtIndexedSubscript:v9];

            StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)v10);
            if (StreamBasicDescription)
            {
              if (mSampleRate < StreamBasicDescription->mSampleRate) {
                double mSampleRate = StreamBasicDescription->mSampleRate;
              }
              unsigned int mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
              if (v4 <= mChannelsPerFrame) {
                uint64_t v4 = mChannelsPerFrame;
              }
              else {
                uint64_t v4 = v4;
              }
            }
            ++v9;
          }
          while ([v8 count] > v9);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);

    v13 = 0;
    if (mSampleRate != 0.0 && v4) {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initStandardFormatWithSampleRate:v4 channels:mSampleRate];
    }
  }
  else
  {

    v13 = 0;
  }
  return v13;
}

@end