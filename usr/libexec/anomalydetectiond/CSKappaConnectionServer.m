@interface CSKappaConnectionServer
- (id)serviceName;
@end

@implementation CSKappaConnectionServer

- (id)serviceName
{
  return @"com.apple.anomalydetectiond.kappa";
}

@end