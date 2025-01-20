@interface BTSystemConfiguration
+ (BOOL)isBuddyComplete;
+ (BOOL)isFirstUnlocked;
+ (id)addBuddyCompleteObserver:(id)a3;
+ (id)addFirstUnlockObserver:(id)a3;
@end

@implementation BTSystemConfiguration

+ (BOOL)isBuddyComplete
{
  if (BYSetupAssistantNeedsToRun()) {
    char HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
  }
  else {
    char HasCompletedInitialRun = 1;
  }
  byte_100263F10 = HasCompletedInitialRun;
  v3 = qword_10026AAD8;
  if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEBUG)) {
    sub_1001B881C(v3);
  }
  return byte_100263F10;
}

+ (BOOL)isFirstUnlocked
{
  byte_100263F11 = MKBDeviceUnlockedSinceBoot() != 0;
  v2 = qword_10026AAD8;
  if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEBUG)) {
    sub_1001B88A0(v2);
  }
  return byte_100263F11;
}

+ (id)addBuddyCompleteObserver:(id)a3
{
  return +[BTStateWatcher monitorBuddyStateWithAction:a3];
}

+ (id)addFirstUnlockObserver:(id)a3
{
  return +[BTStateWatcher monitorFirstUnlockWithAction:a3];
}

@end