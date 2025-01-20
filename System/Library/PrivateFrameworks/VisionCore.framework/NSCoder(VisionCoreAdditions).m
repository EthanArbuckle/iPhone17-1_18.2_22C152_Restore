@interface NSCoder(VisionCoreAdditions)
- (void)VisionCoreEncodeNSData:()VisionCoreAdditions forKey:;
@end

@implementation NSCoder(VisionCoreAdditions)

- (void)VisionCoreEncodeNSData:()VisionCoreAdditions forKey:
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [a1 encodeObject:v7 forKey:v6];
}

@end