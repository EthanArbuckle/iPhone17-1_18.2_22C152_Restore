@interface NRConcurrentPipe
- (NSUUID)uuid;
@end

@implementation NRConcurrentPipe

- (NSUUID)uuid
{
  v2 = [(EPResource *)self resourceManager];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

@end