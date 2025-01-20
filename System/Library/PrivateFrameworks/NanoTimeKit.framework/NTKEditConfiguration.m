@interface NTKEditConfiguration
+ (Class)classForKeyedUnarchiver;
@end

@implementation NTKEditConfiguration

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end