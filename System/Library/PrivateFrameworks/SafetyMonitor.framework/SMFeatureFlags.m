@interface SMFeatureFlags
+ (BOOL)zelkovaBlastDoorEnabled;
+ (BOOL)zelkovaGroupEnabled;
+ (BOOL)zelkovaHandoffEnabled;
+ (BOOL)zelkovaOnWatchEnabled;
+ (BOOL)zelkovaRemoteControlEnabled;
+ (BOOL)zelkovaScheduledSendEnabled;
+ (BOOL)zelkovaWorkoutEnabled;
@end

@implementation SMFeatureFlags

+ (BOOL)zelkovaOnWatchEnabled
{
  return MEMORY[0x270ED8070]("Zelkova", "Zelkova_Watch");
}

+ (BOOL)zelkovaScheduledSendEnabled
{
  return MEMORY[0x270ED8070]("Zelkova", "Zelkova_ScheduledSend");
}

+ (BOOL)zelkovaHandoffEnabled
{
  return MEMORY[0x270ED8070]("Zelkova", "Zelkova_Handoff");
}

+ (BOOL)zelkovaRemoteControlEnabled
{
  return MEMORY[0x270ED8070]("Zelkova", "Zelkova_RemoteControl");
}

+ (BOOL)zelkovaWorkoutEnabled
{
  return MEMORY[0x270ED8070]("Zelkova", "Zelkova_Workout");
}

+ (BOOL)zelkovaBlastDoorEnabled
{
  return MEMORY[0x270ED8070]("Zelkova", "Zelkova_BlastDoor");
}

+ (BOOL)zelkovaGroupEnabled
{
  return MEMORY[0x270ED8070]("Zelkova", "Zelkova_Group");
}

@end