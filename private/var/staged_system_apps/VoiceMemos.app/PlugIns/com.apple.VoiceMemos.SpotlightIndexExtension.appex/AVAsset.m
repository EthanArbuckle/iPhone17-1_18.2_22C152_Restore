@interface AVAsset
+ (BOOL)rc_updateMetadataInFile:(id)a3 withMetadata:(id)a4 error:(id *)a5;
+ (BOOL)rc_updateMetadataInFile:(id)a3 withRecordingMetadata:(id)a4 error:(id *)a5;
- (NSDictionary)rc_recordingMetadata;
- (NSURL)rc_composedAVURL;
- (double)rc_durationInSeconds;
- (id)rc_audioTracks;
- (id)rc_playbackFormat;
- (void)rc_setComposedAVURL:(id)a3;
@end

@implementation AVAsset

- (void)rc_setComposedAVURL:(id)a3
{
}

- (NSURL)rc_composedAVURL
{
  v3 = objc_getAssociatedObject(self, "_AVAssetRCComposedAVURLKey");
  if (!v3)
  {
    if (objc_opt_respondsToSelector())
    {
      v3 = [(AVAsset *)self URL];
    }
    else
    {
      v3 = 0;
    }
  }

  return (NSURL *)v3;
}

- (NSDictionary)rc_recordingMetadata
{
  v3 = objc_opt_new();
  v4 = [(AVAsset *)self metadata];
  uint64_t v5 = AVMetadataKeySpaceiTunesLong;
  v6 = sub_100005528((uint64_t)v4, @"com.apple.iTunes.voice-memo-uuid", AVMetadataKeySpaceiTunesLong);
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"uniqueID"];
  }
  v7 = +[AVMetadataItem metadataItemsFromArray:v4 withKey:AVMetadataCommonKeyCreationDate keySpace:AVMetadataKeySpaceCommon];
  v8 = [v7 na_map:&stru_100008490];
  v9 = [v8 firstObject];

  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:@"date"];
  }
  v10 = sub_100005528((uint64_t)v4, (uint64_t)AVMetadataiTunesMetadataKeySongName, (uint64_t)AVMetadataKeySpaceiTunes);
  v11 = v10;
  if (v10 && [v10 length]) {
    [v3 setObject:v11 forKeyedSubscript:@"title"];
  }
  v12 = sub_100005528((uint64_t)v4, @"com.apple.iTunes.music-memo-note", v5);
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"musicMemoTextNote"];
  }
  v13 = +[AVMetadataItem metadataItemsFromArray:v4 withKey:@"com.apple.iTunes.music-memo-rating" keySpace:v5];
  v14 = [v13 na_map:&stru_1000084D0];
  v15 = [v14 firstObject];

  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:@"musicMemoStarRating"];
  }
  v16 = sub_100005528((uint64_t)v4, @"com.apple.iTunes.music-memo-tags", v5);
  if (v16) {
    [v3 setObject:v16 forKeyedSubscript:@"musicMemoTags"];
  }

  return (NSDictionary *)v3;
}

+ (BOOL)rc_updateMetadataInFile:(id)a3 withRecordingMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = +[RCCaptureFormat AVAssetAuthoringMetadataWithRecordingMetadata:a4];
  LOBYTE(a5) = [a1 rc_updateMetadataInFile:v8 withMetadata:v9 error:a5];

  return (char)a5;
}

+ (BOOL)rc_updateMetadataInFile:(id)a3 withMetadata:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[RCMutableMovie movieWithURL:a3 error:a5];
  v9 = v8;
  if (v8)
  {
    [v8 setMetadata:v7];
    unsigned __int8 v10 = [v9 rc_writeMovieHeaderWithOptions:0 error:a5];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (double)rc_durationInSeconds
{
  [(AVAsset *)self duration];
  return CMTimeGetSeconds(&time);
}

- (id)rc_audioTracks
{
  v2 = [(AVAsset *)self tracksWithMediaType:AVMediaTypeAudio];
  v3 = [v2 na_filter:&stru_100008390];

  return v3;
}

- (id)rc_playbackFormat
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(AVAsset *)self rc_audioTracks];
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v17;
    double mSampleRate = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) formatDescriptions];
        if ([v9 count])
        {
          unint64_t v10 = 0;
          do
          {
            v11 = [v9 objectAtIndexedSubscript:v10];

            StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)v11);
            if (StreamBasicDescription)
            {
              if (mSampleRate < StreamBasicDescription->mSampleRate) {
                double mSampleRate = StreamBasicDescription->mSampleRate;
              }
              unsigned int mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
              if (v5 <= mChannelsPerFrame) {
                uint64_t v5 = mChannelsPerFrame;
              }
              else {
                uint64_t v5 = v5;
              }
            }
            ++v10;
          }
          while ((unint64_t)[v9 count] > v10);
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);

    id v14 = 0;
    if (mSampleRate != 0.0 && v5) {
      id v14 = [objc_alloc((Class)AVAudioFormat) initStandardFormatWithSampleRate:v5 channels:mSampleRate];
    }
  }
  else
  {

    id v14 = 0;
  }

  return v14;
}

@end