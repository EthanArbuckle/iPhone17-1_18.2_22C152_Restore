@interface NSString(VideosUI)
- (uint64_t)vui_stringWithFirstStrongDirectionalIsolates;
@end

@implementation NSString(VideosUI)

- (uint64_t)vui_stringWithFirstStrongDirectionalIsolates
{
  return [NSString stringWithFormat:@"⁨%@⁩", a1];
}

@end