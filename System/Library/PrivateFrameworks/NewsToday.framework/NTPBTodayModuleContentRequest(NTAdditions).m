@interface NTPBTodayModuleContentRequest(NTAdditions)
- (id)identifier;
@end

@implementation NTPBTodayModuleContentRequest(NTAdditions)

- (id)identifier
{
  v2 = NSString;
  uint64_t v3 = [a1 moduleDescriptorType];
  v4 = [a1 tagID];
  v5 = [v2 stringWithFormat:@"%d-%@", v3, v4];

  return v5;
}

@end