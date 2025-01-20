@interface NTKFaceBundleContainer
+ (NSArray)faceBundleClasses;
@end

@implementation NTKFaceBundleContainer

+ (NSArray)faceBundleClasses
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

@end