@interface DistributedNotificationPoster
+ (void)postNotificationForAlarmActiveChanged;
+ (void)postNotificationForAlarmsEdited;
+ (void)postNotificationForUserPreferences:(BOOL)a3 localNotifications:(BOOL)a4;
@end

@implementation DistributedNotificationPoster

+ (void)postNotificationForAlarmsEdited
{
}

+ (void)postNotificationForAlarmActiveChanged
{
}

+ (void)postNotificationForUserPreferences:(BOOL)a3 localNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 bundleIdentifier];

  if (v7)
  {
    v12 = @"bundleIdentifier";
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    v8 = 0;
    if (!v5) {
      goto LABEL_7;
    }
  }
  if (v4)
  {
    v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    v10 = v9;
    v11 = @"com.apple.mobiletimer-framework.preferences-and-notifications-changed-externally";
LABEL_11:
    [v9 postNotificationName:v11 object:0 userInfo:v8 deliverImmediately:1];

    goto LABEL_12;
  }
LABEL_7:
  if (v5)
  {
    v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    v10 = v9;
    v11 = @"com.apple.mobiletimer-framework.preferences-changed-externally";
    goto LABEL_11;
  }
  if (v4)
  {
    v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    v10 = v9;
    v11 = @"com.apple.mobiletimer-framework.local-notifications-changed-externally";
    goto LABEL_11;
  }
LABEL_12:
}

@end