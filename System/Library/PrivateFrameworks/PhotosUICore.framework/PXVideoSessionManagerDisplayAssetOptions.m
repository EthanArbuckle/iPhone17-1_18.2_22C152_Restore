@interface PXVideoSessionManagerDisplayAssetOptions
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)livePhotoLoopTimeRange;
- (BOOL)isAudioAllowed;
- (BOOL)shouldCreateUniqueVideoSession;
- (BOOL)shouldCrossfadeLivePhotosWhenLooping;
- (BOOL)shouldPlayLivePhotosWithSettlingEffectIfPossible;
- (BOOL)shouldStabilizeLivePhotosIfPossible;
- (ISWrappedAVAudioSession)audioSession;
- (NSArray)strategies;
- (NSMutableArray)strategiesStore;
- (PXVideoSessionManagerDisplayAssetOptions)init;
- (void)addContentDeliveryStrategyWithDeliveryQuality:(int64_t)a3 segmentTimeRange:(id *)a4 streamingAllowed:(BOOL)a5;
- (void)addContentDeliveryStrategyWithDeliveryQuality:(int64_t)a3 segmentTimeRange:(id *)a4 streamingAllowed:(BOOL)a5 networkAccessAllowed:(BOOL)a6;
- (void)setAudioSession:(id)a3;
- (void)setIsAudioAllowed:(BOOL)a3;
- (void)setLivePhotoLoopTimeRange:(id *)a3;
- (void)setShouldCreateUniqueVideoSession:(BOOL)a3;
- (void)setShouldCrossfadeLivePhotosWhenLooping:(BOOL)a3;
- (void)setShouldPlayLivePhotosWithSettlingEffectIfPossible:(BOOL)a3;
- (void)setShouldStabilizeLivePhotosIfPossible:(BOOL)a3;
@end

@implementation PXVideoSessionManagerDisplayAssetOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategiesStore, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (NSMutableArray)strategiesStore
{
  return self->_strategiesStore;
}

- (void)setAudioSession:(id)a3
{
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setIsAudioAllowed:(BOOL)a3
{
  self->_isAudioAllowed = a3;
}

- (BOOL)isAudioAllowed
{
  return self->_isAudioAllowed;
}

- (void)setLivePhotoLoopTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_livePhotoLoopTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_livePhotoLoopTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_livePhotoLoopTimeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)livePhotoLoopTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setShouldCrossfadeLivePhotosWhenLooping:(BOOL)a3
{
  self->_shouldCrossfadeLivePhotosWhenLooping = a3;
}

- (BOOL)shouldCrossfadeLivePhotosWhenLooping
{
  return self->_shouldCrossfadeLivePhotosWhenLooping;
}

- (void)setShouldPlayLivePhotosWithSettlingEffectIfPossible:(BOOL)a3
{
  self->_shouldPlayLivePhotosWithSettlingEffectIfPossible = a3;
}

- (BOOL)shouldPlayLivePhotosWithSettlingEffectIfPossible
{
  return self->_shouldPlayLivePhotosWithSettlingEffectIfPossible;
}

- (void)setShouldStabilizeLivePhotosIfPossible:(BOOL)a3
{
  self->_shouldStabilizeLivePhotosIfPossible = a3;
}

- (BOOL)shouldStabilizeLivePhotosIfPossible
{
  return self->_shouldStabilizeLivePhotosIfPossible;
}

- (void)setShouldCreateUniqueVideoSession:(BOOL)a3
{
  self->_shouldCreateUniqueVideoSession = a3;
}

- (BOOL)shouldCreateUniqueVideoSession
{
  return self->_shouldCreateUniqueVideoSession;
}

- (void)addContentDeliveryStrategyWithDeliveryQuality:(int64_t)a3 segmentTimeRange:(id *)a4 streamingAllowed:(BOOL)a5 networkAccessAllowed:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v11 = objc_alloc_init(PXDisplayAssetVideoContentDeliveryStrategy);
  [(PXDisplayAssetVideoContentDeliveryStrategy *)v11 setQuality:a3];
  long long v12 = *(_OWORD *)&a4->var0.var3;
  v14[0] = *(_OWORD *)&a4->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a4->var1.var1;
  [(PXDisplayAssetVideoContentDeliveryStrategy *)v11 setSegmentTimeRange:v14];
  [(PXDisplayAssetVideoContentDeliveryStrategy *)v11 setIsStreamingAllowed:v7];
  [(PXDisplayAssetVideoContentDeliveryStrategy *)v11 setIsNetworkAccessAllowed:v6];
  [(PXDisplayAssetVideoContentDeliveryStrategy *)v11 setIsAudioAllowed:[(PXVideoSessionManagerDisplayAssetOptions *)self isAudioAllowed]];
  v13 = [(PXVideoSessionManagerDisplayAssetOptions *)self strategiesStore];
  [v13 addObject:v11];
}

- (void)addContentDeliveryStrategyWithDeliveryQuality:(int64_t)a3 segmentTimeRange:(id *)a4 streamingAllowed:(BOOL)a5
{
  long long v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  [(PXVideoSessionManagerDisplayAssetOptions *)self addContentDeliveryStrategyWithDeliveryQuality:a3 segmentTimeRange:v6 streamingAllowed:a5 networkAccessAllowed:1];
}

- (NSArray)strategies
{
  v2 = [(PXVideoSessionManagerDisplayAssetOptions *)self strategiesStore];
  long long v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (PXVideoSessionManagerDisplayAssetOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXVideoSessionManagerDisplayAssetOptions;
  v2 = [(PXVideoSessionManagerDisplayAssetOptions *)&v7 init];
  long long v3 = v2;
  if (v2)
  {
    v2->_isAudioAllowed = 1;
    long long v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    strategiesStore = v3->_strategiesStore;
    v3->_strategiesStore = v4;
  }
  return v3;
}

@end