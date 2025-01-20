@interface NSString(MSMSStringUtilities)
+ (__CFString)MSMSUserDirectory;
@end

@implementation NSString(MSMSStringUtilities)

+ (__CFString)MSMSUserDirectory
{
  return @"/var/mobile";
}

@end