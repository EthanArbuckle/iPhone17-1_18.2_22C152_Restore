@interface NSBundle(MNExtras)
+ (id)_navigationBundle;
+ (uint64_t)_navigation_implementsSiriMethod;
+ (uint64_t)_navigation_isRunningInSiri;
- (id)_navigation_localizedStringForKey:()MNExtras value:table:;
@end

@implementation NSBundle(MNExtras)

+ (uint64_t)_navigation_isRunningInSiri
{
  if (qword_1EB59C128 != -1) {
    dispatch_once(&qword_1EB59C128, &__block_literal_global_21);
  }
  return _MergedGlobals_29;
}

+ (uint64_t)_navigation_implementsSiriMethod
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NSBundle_MNExtras___navigation_implementsSiriMethod__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB59C130 != -1) {
    dispatch_once(&qword_1EB59C130, block);
  }
  return byte_1EB59C121;
}

+ (id)_navigationBundle
{
  if (qword_1EB59C140 != -1) {
    dispatch_once(&qword_1EB59C140, &__block_literal_global_9);
  }
  v0 = (void *)qword_1EB59C138;
  return v0;
}

- (id)_navigation_localizedStringForKey:()MNExtras value:table:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(MEMORY[0x1E4F28B50], "_navigation_isRunningInSiri")
    && objc_msgSend(MEMORY[0x1E4F28B50], "_navigation_implementsSiriMethod"))
  {
    uint64_t v11 = [a1 siriUILocalizedStringForKey:v8 value:v9 table:v10];
  }
  else
  {
    uint64_t v11 = [a1 localizedStringForKey:v8 value:v9 table:v10];
  }
  v12 = (void *)v11;

  return v12;
}

@end