@interface TypistKeyboardData
+ (BOOL)isKeyboardUIOutOfProcess;
+ (Class)keyboardData;
@end

@implementation TypistKeyboardData

+ (Class)keyboardData
{
  [a1 isKeyboardUIOutOfProcess];
  id v2 = (id)objc_opt_class();
  return (Class)v2;
}

+ (BOOL)isKeyboardUIOutOfProcess
{
  if (isKeyboardUIOutOfProcess_onceToken != -1) {
    dispatch_once(&isKeyboardUIOutOfProcess_onceToken, &__block_literal_global_5);
  }
  return isKeyboardUIOutOfProcess_oop;
}

uint64_t __46__TypistKeyboardData_isKeyboardUIOutOfProcess__block_invoke()
{
  uint64_t result = [MEMORY[0x263F1C710] usesInputSystemUI];
  isKeyboardUIOutOfProcess_oop = result;
  return result;
}

@end