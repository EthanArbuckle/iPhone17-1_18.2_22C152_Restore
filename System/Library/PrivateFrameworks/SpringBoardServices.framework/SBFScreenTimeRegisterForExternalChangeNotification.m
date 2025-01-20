@interface SBFScreenTimeRegisterForExternalChangeNotification
@end

@implementation SBFScreenTimeRegisterForExternalChangeNotification

void ___SBFScreenTimeRegisterForExternalChangeNotification_block_invoke_2(int a1, int token)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  notify_get_state(token, &v5);
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = @"SBScreenTimeCategory";
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"SBScreenTimeTrackingChanged" object:0 userInfo:v4];
}

uint64_t ___SBFScreenTimeRegisterForExternalChangeNotification_block_invoke()
{
  return notify_register_dispatch("com.apple.springboard.screenchanged", &_SBFScreenTimeRegisterForExternalChangeNotification___token, MEMORY[0x1E4F14428], &__block_literal_global_7_0);
}

@end