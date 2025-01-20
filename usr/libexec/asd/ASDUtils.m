@interface ASDUtils
+ (NSString)daemonVersion;
@end

@implementation ASDUtils

+ (NSString)daemonVersion
{
  return +[NSString stringWithFormat:@"%d.%d.%d", 12, 60, 0];
}

@end