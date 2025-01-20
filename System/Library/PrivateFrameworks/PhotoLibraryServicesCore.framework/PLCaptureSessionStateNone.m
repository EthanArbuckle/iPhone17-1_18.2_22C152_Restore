@interface PLCaptureSessionStateNone
- (PLCaptureSessionStateNone)init;
- (id)description;
@end

@implementation PLCaptureSessionStateNone

- (id)description
{
  return @"PLCaptureSessionStateNone";
}

- (PLCaptureSessionStateNone)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCaptureSessionStateNone;
  return [(PLCaptureSessionState *)&v3 initWithType:1];
}

@end