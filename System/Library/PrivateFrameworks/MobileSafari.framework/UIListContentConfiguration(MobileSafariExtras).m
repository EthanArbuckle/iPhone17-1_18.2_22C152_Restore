@interface UIListContentConfiguration(MobileSafariExtras)
- (uint64_t)safari_usesWhiteText;
@end

@implementation UIListContentConfiguration(MobileSafariExtras)

- (uint64_t)safari_usesWhiteText
{
  v1 = [a1 textProperties];
  v2 = [v1 resolvedColor];
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

@end