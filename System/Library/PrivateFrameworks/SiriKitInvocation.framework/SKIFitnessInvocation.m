@interface SKIFitnessInvocation
+ (id)announcePayloadFromUserData:(id)a3;
+ (id)announceWorkoutReminder:(id)a3 announcePayload:(id)a4;
+ (id)announceWorkoutVoiceFeedback:(id)a3 announcePayload:(id)a4;
+ (id)updateStartLocalRequest:(id)a3 withNewAnnouncePayload:(id)a4;
+ (id)workoutReminderFromPayload:(id)a3;
+ (void)updateDict:(id)a3 withAnnouncePayload:(id)a4;
@end

@implementation SKIFitnessInvocation

+ (id)announceWorkoutReminder:(id)a3 announcePayload:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithCapacity:8];
  v10 = [v8 predictionIdentifier];
  [v9 setValue:v10 forKey:@"predictionIdentifier"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "workoutType"));
  [v9 setValue:v11 forKey:@"workoutType"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "workoutActivityType"));
  [v9 setValue:v12 forKey:@"workoutActivityType"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "workoutLocationType"));
  [v9 setValue:v13 forKey:@"workoutLocationType"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "workoutSwimmingLocationType"));
  [v9 setValue:v14 forKey:@"workoutSwimmingLocationType"];

  v15 = NSNumber;
  uint64_t v16 = [v8 predictionType];

  v17 = [v15 numberWithInteger:v16];
  [v9 setValue:v17 forKey:@"predictionType"];

  [a1 updateDict:v9 withAnnouncePayload:v7];
  v18 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v19 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.fitness.announceWorkoutReminder"];
  [(SKIDirectInvocationPayload *)v19 setUserData:v9];
  v20 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v18 payload:v19];
  v21 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v20];

  return v21;
}

+ (id)workoutReminderFromPayload:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"predictionIdentifier"];
  v5 = [v4 stringValue];

  v6 = [v3 objectForKeyedSubscript:@"predictionType"];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v3 objectForKeyedSubscript:@"workoutType"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v3 objectForKeyedSubscript:@"workoutActivityType"];
  uint64_t v11 = [v10 integerValue];

  v12 = [v3 objectForKeyedSubscript:@"workoutLocationType"];
  uint64_t v13 = [v12 integerValue];

  v14 = [v3 objectForKeyedSubscript:@"workoutSwimmingLocationType"];

  uint64_t v15 = [v14 integerValue];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F28638]) initWithPredictionIdentifier:v5 predictionType:v7 workoutType:v9 workoutActivityType:v11 locationType:v13 swimmingLocationType:v15];

  return v16;
}

+ (id)announceWorkoutVoiceFeedback:(id)a3 announcePayload:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 mutableCopy];
  [a1 updateDict:v7 withAnnouncePayload:v6];

  id v8 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  uint64_t v9 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.fitness.announceWorkoutVoiceFeedback"];
  [(SKIDirectInvocationPayload *)v9 setUserData:v7];
  v10 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v8 payload:v9];
  uint64_t v11 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v10];

  return v11;
}

+ (id)updateStartLocalRequest:(id)a3 withNewAnnouncePayload:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 clientBoundCommands];
  id v8 = [v7 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 parse];
    v10 = [v9 directInvocation];

    uint64_t v11 = [v10 invocationIdentifier];
    if ([v11 isEqualToString:@"com.apple.siri.directInvocation.fitness.announceWorkoutReminder"] & 1) != 0|| (objc_msgSend(v11, "isEqualToString:", @"com.apple.siri.directInvocation.fitness.announceWorkoutVoiceFeedback"))
    {
      v12 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:v11];
      uint64_t v13 = [v10 data];

      if (v13)
      {
        v14 = (void *)MEMORY[0x263F08AC0];
        uint64_t v15 = [v10 data];
        id v24 = 0;
        uint64_t v16 = [v14 propertyListWithData:v15 options:0 format:0 error:&v24];
        v17 = v24;
        [(SKIDirectInvocationPayload *)v12 setUserData:v16];

        if (v17)
        {
          v18 = SKIDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:]();
          }
          v19 = 0;
        }
        else
        {
          v20 = [(SKIDirectInvocationPayload *)v12 userData];
          v18 = [v20 mutableCopy];

          [a1 updateDict:v18 withAnnouncePayload:v6];
          [(SKIDirectInvocationPayload *)v12 setUserData:v18];
          v21 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
          v22 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v21 payload:v12];
          v19 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v22];
        }
      }
      else
      {
        v17 = SKIDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:](v17);
        }
        v19 = 0;
      }
    }
    else
    {
      SKIDefaultLog();
      v12 = (SKIDirectInvocationPayload *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
        +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:]();
      }
      v19 = 0;
    }
  }
  else
  {
    v10 = SKIDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:].cold.4(v10);
    }
    v19 = 0;
  }

  return v19;
}

+ (void)updateDict:(id)a3 withAnnouncePayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 appBundleIdOfLastAnnouncement];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = [v6 appBundleIdOfLastAnnouncement];
    [v5 setValue:v9 forKey:@"appBundleIdOfLastAnnouncement"];
  }
  else
  {
    [v5 removeObjectForKey:@"appBundleIdOfLastAnnouncement"];
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "synchronousBurstIndex"));
  [v5 setValue:v10 forKey:@"synchronousBurstIndex"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isSameTypeAsLastAnnouncement"));
  [v5 setValue:v11 forKey:@"isSameTypeAsLastAnnouncement"];

  v12 = NSNumber;
  [v6 timeSinceLastAnnouncement];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  [v5 setValue:v13 forKey:@"timeSinceLastAnnouncement"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "announcementPlatform"));
  [v5 setValue:v14 forKey:@"announcePlatform"];

  id v18 = 0;
  uint64_t v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v18];
  id v16 = v18;
  if (v15)
  {
    [v5 setValue:v15 forKey:@"announcePayload"];
  }
  else
  {
    v17 = SKIDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[SKIFitnessInvocation updateDict:withAnnouncePayload:]();
    }
  }
}

+ (id)announcePayloadFromUserData:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"announcePayload"];
  id v8 = 0;
  v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    id v6 = SKIDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SKIFitnessInvocation announcePayloadFromUserData:]();
    }
  }

  return v4;
}

+ (void)updateStartLocalRequest:(os_log_t)log withNewAnnouncePayload:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D851000, log, OS_LOG_TYPE_ERROR, "Fitness SKIDirectInvocationPayload contains nil data", v1, 2u);
}

+ (void)updateStartLocalRequest:withNewAnnouncePayload:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "Error deserializing fitness SKIDirectInvocationPayload: %@", v2, v3, v4, v5, v6);
}

+ (void)updateStartLocalRequest:withNewAnnouncePayload:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "Unexpected identifier - not a known fitness direct invocation identifier: %@", v2, v3, v4, v5, v6);
}

+ (void)updateStartLocalRequest:(os_log_t)log withNewAnnouncePayload:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21D851000, log, OS_LOG_TYPE_ERROR, "startLocalRequest not an RSKE", v1, 2u);
}

+ (void)updateDict:withAnnouncePayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "error archiving SKIAnnounceNotificationDirectInvocationPayload for SKIFitnessInvocation: %@", v2, v3, v4, v5, v6);
}

+ (void)announcePayloadFromUserData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21D851000, v0, v1, "error unarchiving SKIAnnounceNotificationDirectInvocationPayload from userData for SKIFitnessInvocation: %@", v2, v3, v4, v5, v6);
}

@end