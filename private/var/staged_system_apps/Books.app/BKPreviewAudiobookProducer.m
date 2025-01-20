@interface BKPreviewAudiobookProducer
- (void)_previewAudiobookForIdentifier:(id)a3 completion:(id)a4;
- (void)audiobookForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation BKPreviewAudiobookProducer

- (void)audiobookForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [(BKPreviewAudiobookProducer *)self _previewAudiobookForIdentifier:v9 completion:v6];
  }
  else
  {
    id v8 = objc_retainBlock(v6);

    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
    id v6 = v8;
  }
}

- (void)_previewAudiobookForIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [BKAVAudiobook alloc];
  id v8 = [v6 storeID];
  id v9 = [(BKAVAudiobook *)v7 initWithAssetID:v8];

  v10 = [v6 title];
  [(BKAVAudiobook *)v9 setTitle:v10];

  v11 = [v6 author];
  [(BKAVAudiobook *)v9 setAuthor:v11];

  [(BKAVAudiobook *)v9 setAudiobookPreview:1];
  v12 = [BKAVAudiobookTrack alloc];
  v13 = [v6 previewURL];
  v14 = [(BKAVAudiobookTrack *)v12 initWithAssetURL:v13];

  v15 = [v6 title];
  [(BKAVAudiobookTrack *)v14 setTitle:v15];

  v16 = [v6 author];
  [(BKAVAudiobookTrack *)v14 setAuthor:v16];

  [v6 duration];
  -[BKAVAudiobookTrack setDuration:](v14, "setDuration:");
  [(BKAVAudiobookTrack *)v14 setAudiobook:v9];
  v17 = objc_opt_new();
  [v6 duration];
  [v17 setDuration:];
  [v6 duration];
  Float64 v19 = v18;

  CMTimeMakeWithSeconds(&duration, v19, 1000000);
  CMTime start = kCMTimeZero;
  CMTimeRangeMake(&v28, &start, &duration);
  CMTimeRange v25 = v28;
  [v17 setTimeRangeInTrack:&v25];
  if (v17)
  {
    [v17 timeRangeInTrack];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  [v17 setTimeRangeInAudiobook:v21];
  [v17 setTrack:v14];
  [(BKAVAudiobookTrack *)v14 addChapter:v17];
  [(BKAVAudiobook *)v9 addTrack:v14];
  v20 = (void (**)(id, id, void))objc_retainBlock(v5);

  if (v20) {
    v20[2](v20, v9, 0);
  }
}

@end