@interface VKARWalkingElevationRequestFailureInfo
- (VKARWalkingElevationRequestFailureInfo)initWithReason:(int64_t)a3;
- (int64_t)reason;
@end

@implementation VKARWalkingElevationRequestFailureInfo

- (int64_t)reason
{
  return self->_reason;
}

- (VKARWalkingElevationRequestFailureInfo)initWithReason:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VKARWalkingElevationRequestFailureInfo;
  v4 = [(VKARWalkingElevationRequestFailureInfo *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_reason = a3;
    v6 = v4;
  }

  return v5;
}

@end