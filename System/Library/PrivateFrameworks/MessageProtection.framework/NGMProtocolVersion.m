@interface NGMProtocolVersion
+ (BOOL)isVersionSupported:(unsigned int)a3;
+ (unsigned)supportedVersion;
@end

@implementation NGMProtocolVersion

+ (BOOL)isVersionSupported:(unsigned int)a3
{
  return a3 - 12 < 0x58;
}

+ (unsigned)supportedVersion
{
  return 13;
}

@end