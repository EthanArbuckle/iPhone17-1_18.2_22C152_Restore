@interface NSLayoutConstraint(UIKitSymbolicConstantResolution)
+ (uint64_t)_UIWantsMarginAttributeSupport;
@end

@implementation NSLayoutConstraint(UIKitSymbolicConstantResolution)

+ (uint64_t)_UIWantsMarginAttributeSupport
{
  return dyld_program_sdk_at_least();
}

@end