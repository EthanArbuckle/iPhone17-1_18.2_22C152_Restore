@interface NSString(VKFoundationInterning)
- (VKInternedString)_vk_internedString;
@end

@implementation NSString(VKFoundationInterning)

- (VKInternedString)_vk_internedString
{
  return +[VKInternedString stringWithString:a1];
}

@end