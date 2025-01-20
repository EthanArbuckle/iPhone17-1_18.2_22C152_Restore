@interface PLCaptureSessionStateUnknown
- (PLCaptureSessionStateUnknown)init;
- (id)description;
@end

@implementation PLCaptureSessionStateUnknown

- (id)description
{
  return @"PLCaptureSessionStateUnknown";
}

- (PLCaptureSessionStateUnknown)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCaptureSessionStateUnknown;
  return [(PLCaptureSessionState *)&v3 initWithType:0];
}

@end