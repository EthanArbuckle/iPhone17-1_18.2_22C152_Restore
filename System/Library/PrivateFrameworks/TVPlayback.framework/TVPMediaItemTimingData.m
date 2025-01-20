@interface TVPMediaItemTimingData
- (BOOL)initialLoadingComplete;
- (double)endTimeForAVPlayerItemLoading;
- (double)endTimeForBuffering;
- (double)endTimeForLoadingAVAssetKeys;
- (double)endTimeForPreparingForLoading;
- (double)endTimeForPreparingForPlaybackInitiation;
- (double)startTimeForAVPlayerItemLoading;
- (double)startTimeForBuffering;
- (double)startTimeForLoadingAVAssetKeys;
- (double)startTimeForPreparingForLoading;
- (double)startTimeForPreparingForPlaybackInitiation;
- (double)totalInitialLoadingTime;
- (void)setEndTimeForAVPlayerItemLoading:(double)a3;
- (void)setEndTimeForBuffering:(double)a3;
- (void)setEndTimeForLoadingAVAssetKeys:(double)a3;
- (void)setEndTimeForPreparingForLoading:(double)a3;
- (void)setEndTimeForPreparingForPlaybackInitiation:(double)a3;
- (void)setInitialLoadingComplete:(BOOL)a3;
- (void)setStartTimeForAVPlayerItemLoading:(double)a3;
- (void)setStartTimeForBuffering:(double)a3;
- (void)setStartTimeForLoadingAVAssetKeys:(double)a3;
- (void)setStartTimeForPreparingForLoading:(double)a3;
- (void)setStartTimeForPreparingForPlaybackInitiation:(double)a3;
- (void)setTotalInitialLoadingTime:(double)a3;
@end

@implementation TVPMediaItemTimingData

- (void)setInitialLoadingComplete:(BOOL)a3
{
  if (self->_initialLoadingComplete != a3)
  {
    self->_initialLoadingComplete = a3;
    double v4 = 0.0;
    if (a3)
    {
      [(TVPMediaItemTimingData *)self endTimeForPreparingForLoading];
      double v6 = v5;
      [(TVPMediaItemTimingData *)self startTimeForPreparingForLoading];
      double v8 = v6 - v7;
      [(TVPMediaItemTimingData *)self endTimeForLoadingAVAssetKeys];
      double v10 = v9;
      [(TVPMediaItemTimingData *)self startTimeForLoadingAVAssetKeys];
      double v12 = v8 + v10 - v11;
      [(TVPMediaItemTimingData *)self endTimeForPreparingForPlaybackInitiation];
      double v14 = v13;
      [(TVPMediaItemTimingData *)self startTimeForPreparingForPlaybackInitiation];
      double v16 = v12 + v14 - v15;
      [(TVPMediaItemTimingData *)self endTimeForAVPlayerItemLoading];
      double v18 = v17;
      [(TVPMediaItemTimingData *)self startTimeForAVPlayerItemLoading];
      double v20 = v16 + v18 - v19;
      [(TVPMediaItemTimingData *)self endTimeForBuffering];
      double v22 = v21;
      [(TVPMediaItemTimingData *)self startTimeForBuffering];
      double v4 = v20 + v22 - v23;
    }
    [(TVPMediaItemTimingData *)self setTotalInitialLoadingTime:v4];
  }
}

- (double)startTimeForPreparingForLoading
{
  return self->_startTimeForPreparingForLoading;
}

- (void)setStartTimeForPreparingForLoading:(double)a3
{
  self->_startTimeForPreparingForLoading = a3;
}

- (double)endTimeForPreparingForLoading
{
  return self->_endTimeForPreparingForLoading;
}

- (void)setEndTimeForPreparingForLoading:(double)a3
{
  self->_endTimeForPreparingForLoading = a3;
}

- (double)startTimeForLoadingAVAssetKeys
{
  return self->_startTimeForLoadingAVAssetKeys;
}

- (void)setStartTimeForLoadingAVAssetKeys:(double)a3
{
  self->_startTimeForLoadingAVAssetKeys = a3;
}

- (double)endTimeForLoadingAVAssetKeys
{
  return self->_endTimeForLoadingAVAssetKeys;
}

- (void)setEndTimeForLoadingAVAssetKeys:(double)a3
{
  self->_endTimeForLoadingAVAssetKeys = a3;
}

- (double)startTimeForPreparingForPlaybackInitiation
{
  return self->_startTimeForPreparingForPlaybackInitiation;
}

- (void)setStartTimeForPreparingForPlaybackInitiation:(double)a3
{
  self->_startTimeForPreparingForPlaybackInitiation = a3;
}

- (double)endTimeForPreparingForPlaybackInitiation
{
  return self->_endTimeForPreparingForPlaybackInitiation;
}

- (void)setEndTimeForPreparingForPlaybackInitiation:(double)a3
{
  self->_endTimeForPreparingForPlaybackInitiation = a3;
}

- (double)startTimeForAVPlayerItemLoading
{
  return self->_startTimeForAVPlayerItemLoading;
}

- (void)setStartTimeForAVPlayerItemLoading:(double)a3
{
  self->_startTimeForAVPlayerItemLoading = a3;
}

- (double)endTimeForAVPlayerItemLoading
{
  return self->_endTimeForAVPlayerItemLoading;
}

- (void)setEndTimeForAVPlayerItemLoading:(double)a3
{
  self->_endTimeForAVPlayerItemLoading = a3;
}

- (double)startTimeForBuffering
{
  return self->_startTimeForBuffering;
}

- (void)setStartTimeForBuffering:(double)a3
{
  self->_startTimeForBuffering = a3;
}

- (double)endTimeForBuffering
{
  return self->_endTimeForBuffering;
}

- (void)setEndTimeForBuffering:(double)a3
{
  self->_endTimeForBuffering = a3;
}

- (double)totalInitialLoadingTime
{
  return self->_totalInitialLoadingTime;
}

- (void)setTotalInitialLoadingTime:(double)a3
{
  self->_totalInitialLoadingTime = a3;
}

- (BOOL)initialLoadingComplete
{
  return self->_initialLoadingComplete;
}

@end