@interface BKAudiobookBufferProducer
- (BKAudiobookBufferInfo)bufferInfo;
- (BKAudiobookChapter)chapter;
- (NSArray)trackDurations;
- (NSArray)trackPositions;
- (id)timeRemainingInBufferFromTrackPosition:(double)a3;
- (void)setBufferInfo:(id)a3;
- (void)setChapter:(id)a3;
- (void)setTrackDurations:(id)a3;
- (void)setTrackPositions:(id)a3;
- (void)updateWithChapter:(id)a3 bufferedTrackPositions:(id)a4 bufferedTrackDurations:(id)a5;
@end

@implementation BKAudiobookBufferProducer

- (void)updateWithChapter:(id)a3 bufferedTrackPositions:(id)a4 bufferedTrackDurations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && (id v11 = [v9 count], v11 == objc_msgSend(v10, "count")))
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = sub_24884;
    v47 = sub_24894;
    id v48 = +[NSMutableArray array];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = sub_24884;
    v41 = sub_24894;
    id v42 = +[NSMutableArray array];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_24884;
    v35 = sub_24894;
    id v36 = +[NSMutableArray array];
    [v8 timeRangeInTrack];
    CMTime time = v29;
    Float64 Seconds = CMTimeGetSeconds(&time);
    [v8 timeRangeInTrack];
    CMTime v28 = v27;
    Float64 v13 = CMTimeGetSeconds(&v28);
    [v8 timeRangeInAudiobook];
    CMTime v26 = v25;
    Float64 v14 = CMTimeGetSeconds(&v26);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_2489C;
    v17[3] = &unk_3D2E0;
    id v15 = v10;
    id v18 = v15;
    v19 = &v43;
    Float64 v22 = Seconds;
    Float64 v23 = v13;
    v20 = &v31;
    v21 = &v37;
    Float64 v24 = v14;
    [v9 enumerateObjectsUsingBlock:v17];
    [(BKAudiobookBufferProducer *)self setChapter:v8];
    v16 = +[BKAudiobookBufferInfo infoWithAudiobookPositions:v38[5] audiobookDurations:v15 chapterPositions:v44[5] chapterDurations:v32[5]];
    [(BKAudiobookBufferProducer *)self setBufferInfo:v16];

    [(BKAudiobookBufferProducer *)self setTrackPositions:v9];
    [(BKAudiobookBufferProducer *)self setTrackDurations:v15];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    [(BKAudiobookBufferProducer *)self setChapter:0];
    [(BKAudiobookBufferProducer *)self setBufferInfo:0];
    [(BKAudiobookBufferProducer *)self setTrackPositions:0];
    [(BKAudiobookBufferProducer *)self setTrackDurations:0];
  }
}

- (id)timeRemainingInBufferFromTrackPosition:(double)a3
{
  v5 = [(BKAudiobookBufferProducer *)self bufferInfo];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_24884;
  id v18 = sub_24894;
  v19 = &off_3E1A8;
  v6 = [(BKAudiobookBufferProducer *)self trackPositions];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_24B70;
  v10[3] = &unk_3D308;
  id v7 = v5;
  double v13 = a3;
  id v11 = v7;
  v12 = &v14;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (BKAudiobookChapter)chapter
{
  return self->_chapter;
}

- (void)setChapter:(id)a3
{
}

- (BKAudiobookBufferInfo)bufferInfo
{
  return self->_bufferInfo;
}

- (void)setBufferInfo:(id)a3
{
}

- (NSArray)trackPositions
{
  return self->_trackPositions;
}

- (void)setTrackPositions:(id)a3
{
}

- (NSArray)trackDurations
{
  return self->_trackDurations;
}

- (void)setTrackDurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackDurations, 0);
  objc_storeStrong((id *)&self->_trackPositions, 0);
  objc_storeStrong((id *)&self->_bufferInfo, 0);

  objc_storeStrong((id *)&self->_chapter, 0);
}

@end