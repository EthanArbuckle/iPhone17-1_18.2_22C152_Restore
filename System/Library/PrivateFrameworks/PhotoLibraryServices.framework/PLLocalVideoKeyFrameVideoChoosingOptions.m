@interface PLLocalVideoKeyFrameVideoChoosingOptions
- (BOOL)hasValidTimeRange;
- (BOOL)isExplicitUserAction;
- (BOOL)isMediumHighQualityAllowed;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isStreamingAllowed;
- (BOOL)restrictToPlayableOnCurrentDevice;
- (BOOL)restrictToStreamable;
- (PLLocalVideoKeyFrameVideoChoosingOptions)initWithStreamingAllowed:(BOOL)a3;
- (int64_t)videoDeliveryMode;
- (int64_t)videoVersion;
@end

@implementation PLLocalVideoKeyFrameVideoChoosingOptions

- (BOOL)isExplicitUserAction
{
  return 0;
}

- (BOOL)hasValidTimeRange
{
  return 0;
}

- (int64_t)videoVersion
{
  return 0;
}

- (int64_t)videoDeliveryMode
{
  return 1;
}

- (BOOL)restrictToStreamable
{
  return 0;
}

- (BOOL)restrictToPlayableOnCurrentDevice
{
  return 1;
}

- (BOOL)isStreamingAllowed
{
  return self->_streamingAllowed;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_streamingAllowed;
}

- (BOOL)isMediumHighQualityAllowed
{
  return 0;
}

- (PLLocalVideoKeyFrameVideoChoosingOptions)initWithStreamingAllowed:(BOOL)a3
{
  result = [(PLLocalVideoKeyFrameVideoChoosingOptions *)self init];
  if (result) {
    result->_streamingAllowed = a3;
  }
  return result;
}

@end