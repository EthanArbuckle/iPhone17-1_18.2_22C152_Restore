@interface _PXStoryExport_VideoHighlightInfo
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)loadingVideoTimeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)storyPlaybackRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loadedVideoPlaybackStartTime;
- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfo;
- (PHAsset)asset;
- (_PXStoryExport_VideoHighlightInfo)initWithAsset:(id)a3 loadingVideoTimeRange:(id *)a4 loadedVideoPlaybackStartTime:(id *)a5 storyPlaybackRange:(id *)a6 audioInfo:(id *)a7;
- (id)description;
- (void)setAsset:(id)a3;
- (void)setAudioInfo:(id *)a3;
- (void)setLoadedVideoPlaybackStartTime:(id *)a3;
- (void)setLoadingVideoTimeRange:(id *)a3;
- (void)setStoryPlaybackRange:(id *)a3;
@end

@implementation _PXStoryExport_VideoHighlightInfo

- (void).cxx_destruct
{
}

- (void)setAudioInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  long long v5 = *(_OWORD *)&a3->var4;
  self->_audioInfo.fadeOut = a3->var6;
  *(_OWORD *)&self->_audioInfo.LCutLength = v5;
  *(_OWORD *)&self->_audioInfo.volume = v4;
  *(_OWORD *)&self->_audioInfo.mode = v3;
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfo
{
  long long v3 = *(_OWORD *)&self[2].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[3].var0;
  retstr->var6 = *(double *)&self[3].var2;
  return self;
}

- (void)setStoryPlaybackRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_storyPlaybackRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_storyPlaybackRange.start.epoch = v4;
  *(_OWORD *)&self->_storyPlaybackRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)storyPlaybackRange
{
  long long v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- (void)setLoadedVideoPlaybackStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_loadedVideoPlaybackStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_loadedVideoPlaybackStartTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loadedVideoPlaybackStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setLoadingVideoTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_loadingVideoTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_loadingVideoTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_loadingVideoTimeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)loadingVideoTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  v6 = [(_PXStoryExport_VideoHighlightInfo *)self asset];
  [(_PXStoryExport_VideoHighlightInfo *)self loadingVideoTimeRange];
  v7 = PXStoryTimeRangeDescription((uint64_t)v16);
  [(_PXStoryExport_VideoHighlightInfo *)self loadedVideoPlaybackStartTime];
  v8 = PXStoryTimeDescription(&v15);
  [(_PXStoryExport_VideoHighlightInfo *)self storyPlaybackRange];
  v9 = PXStoryTimeRangeDescription((uint64_t)v14);
  [(_PXStoryExport_VideoHighlightInfo *)self audioInfo];
  v10 = PXStoryClipAudioInfoDescription((uint64_t)v13);
  v11 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; asset: %@; loadingVideoTimeRange: %@; loadedVideoPlaybackStartTime: %@; storyPlaybackRange: %@ audio:%@>",
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10);

  return v11;
}

- (_PXStoryExport_VideoHighlightInfo)initWithAsset:(id)a3 loadingVideoTimeRange:(id *)a4 loadedVideoPlaybackStartTime:(id *)a5 storyPlaybackRange:(id *)a6 audioInfo:(id *)a7
{
  id v13 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_PXStoryExport_VideoHighlightInfo;
  v14 = [(_PXStoryExport_VideoHighlightInfo *)&v25 init];
  CMTime v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    long long v16 = *(_OWORD *)&a5->var0;
    v15->_loadedVideoPlaybackStartTime.epoch = a5->var3;
    *(_OWORD *)&v15->_loadedVideoPlaybackStartTime.value = v16;
    long long v17 = *(_OWORD *)&a4->var0.var0;
    long long v18 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v15->_loadingVideoTimeRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v15->_loadingVideoTimeRange.start.epoch = v18;
    *(_OWORD *)&v15->_loadingVideoTimeRange.start.value = v17;
    long long v19 = *(_OWORD *)&a6->var0.var0;
    long long v20 = *(_OWORD *)&a6->var0.var3;
    *(_OWORD *)&v15->_storyPlaybackRange.duration.timescale = *(_OWORD *)&a6->var1.var1;
    *(_OWORD *)&v15->_storyPlaybackRange.start.epoch = v20;
    *(_OWORD *)&v15->_storyPlaybackRange.start.value = v19;
    long long v21 = *(_OWORD *)&a7->var0;
    long long v22 = *(_OWORD *)&a7->var2;
    long long v23 = *(_OWORD *)&a7->var4;
    v15->_audioInfo.fadeOut = a7->var6;
    *(_OWORD *)&v15->_audioInfo.LCutLength = v23;
    *(_OWORD *)&v15->_audioInfo.volume = v22;
    *(_OWORD *)&v15->_audioInfo.mode = v21;
  }

  return v15;
}

@end