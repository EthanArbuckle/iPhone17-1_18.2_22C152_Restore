@interface UIContentInsetsEnvironment
@end

@implementation UIContentInsetsEnvironment

void __46___UIContentInsetsEnvironment_nullEnvironment__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "insetEnvironmentForInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0);
  v2 = (void *)qword_1EB25F4B0;
  qword_1EB25F4B0 = v1;
}

@end