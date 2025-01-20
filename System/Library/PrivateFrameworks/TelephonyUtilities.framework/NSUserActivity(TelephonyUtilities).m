@interface NSUserActivity(TelephonyUtilities)
+ (id)makeActivityWithIntent:()TelephonyUtilities dialRequestAttachment:;
+ (id)makeActivityWithIntent:()TelephonyUtilities joinRequestAttachment:;
+ (uint64_t)_isActivityTypeAllowedForDialRequest:()TelephonyUtilities;
+ (uint64_t)_isActivityTypeAllowedForJoinRequest:()TelephonyUtilities;
- (id)dialRequestAttachment;
- (id)joinRequestAttachment;
- (id)tu_dynamicIdentifier;
- (void)dialRequestAttachment;
- (void)joinRequestAttachment;
@end

@implementation NSUserActivity(TelephonyUtilities)

+ (id)makeActivityWithIntent:()TelephonyUtilities dialRequestAttachment:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F22488];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] _initWithIntent:v7];

  v9 = (void *)MEMORY[0x1E4F22488];
  v10 = [v8 activityType];
  char v11 = [v9 _isActivityTypeAllowedForDialRequest:v10];

  id v18 = 0;
  v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v18];

  id v13 = v18;
  if (v13)
  {
    v14 = TUDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:dialRequestAttachment:]();
    }
  }
  else if (v11)
  {
    if (!v12) {
      goto LABEL_12;
    }
    v15 = TUDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "Attaching TUDialRequest to UserActivity", v17, 2u);
    }

    v19 = @"dialRequest";
    v20[0] = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v8 setUserInfo:v14];
  }
  else
  {
    v14 = TUDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:dialRequestAttachment:](v8);
    }
  }

LABEL_12:

  return v8;
}

+ (id)makeActivityWithIntent:()TelephonyUtilities joinRequestAttachment:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F22488];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] _initWithIntent:v7];

  v9 = (void *)MEMORY[0x1E4F22488];
  v10 = [v8 activityType];
  char v11 = [v9 _isActivityTypeAllowedForJoinRequest:v10];

  id v18 = 0;
  v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v18];

  id v13 = v18;
  if (v13)
  {
    v14 = TUDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:joinRequestAttachment:]();
    }
  }
  else if (v11)
  {
    if (!v12) {
      goto LABEL_12;
    }
    v15 = TUDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "Attaching TUJoinConversationRequest to UserActivity", v17, 2u);
    }

    v19 = @"joinRequest";
    v20[0] = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v8 setUserInfo:v14];
  }
  else
  {
    v14 = TUDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[NSUserActivity(TelephonyUtilities) makeActivityWithIntent:joinRequestAttachment:](v8);
    }
  }

LABEL_12:

  return v8;
}

- (id)dialRequestAttachment
{
  v2 = (void *)MEMORY[0x1E4F22488];
  v3 = [a1 activityType];
  LODWORD(v2) = [v2 _isActivityTypeAllowedForDialRequest:v3];

  v4 = [a1 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"dialRequest"];

  if (v2) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Unarchiving TUDialRequest from UserActivity", buf, 2u);
    }

    id v13 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
    id v10 = v13;
    if (v10)
    {
      char v11 = TUDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[NSUserActivity(TelephonyUtilities) dialRequestAttachment]();
      }
    }
  }

  return v7;
}

- (id)joinRequestAttachment
{
  v2 = (void *)MEMORY[0x1E4F22488];
  v3 = [a1 activityType];
  LODWORD(v2) = [v2 _isActivityTypeAllowedForJoinRequest:v3];

  v4 = [a1 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"joinRequest"];

  if (v2) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Unarchiving TUJoinConversationRequest from UserActivity", buf, 2u);
    }

    id v13 = 0;
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
    id v10 = v13;
    if (v10)
    {
      char v11 = TUDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[NSUserActivity(TelephonyUtilities) joinRequestAttachment]();
      }
    }
  }

  return v7;
}

- (id)tu_dynamicIdentifier
{
  v2 = [a1 _internalUserActivity];
  v3 = [v2 dynamicIdentifier];

  if (v3)
  {
    v4 = [a1 _internalUserActivity];
    v5 = [v4 dynamicIdentifier];
    BOOL v6 = (void *)[v5 copy];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (uint64_t)_isActivityTypeAllowedForDialRequest:()TelephonyUtilities
{
  return [a3 isEqualToString:@"INStartCallIntent"];
}

+ (uint64_t)_isActivityTypeAllowedForJoinRequest:()TelephonyUtilities
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INStartCallIntent"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqualToString:@"INJoinCallIntent"];
  }

  return v4;
}

+ (void)makeActivityWithIntent:()TelephonyUtilities dialRequestAttachment:.cold.1(void *a1)
{
  v1 = [a1 activityType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_19C496000, v2, v3, "Trying to attach TUDialRequest to a UserActivity with an unsupported activityType: %@", v4, v5, v6, v7, v8);
}

+ (void)makeActivityWithIntent:()TelephonyUtilities dialRequestAttachment:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Encountered an error while serializing TUDialRequest: %@", v2, v3, v4, v5, v6);
}

+ (void)makeActivityWithIntent:()TelephonyUtilities joinRequestAttachment:.cold.1(void *a1)
{
  uint64_t v1 = [a1 activityType];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_19C496000, v2, v3, "Trying to attach TUJoinConversationRequest to a UserActivity with an unsupported activityType: %@", v4, v5, v6, v7, v8);
}

+ (void)makeActivityWithIntent:()TelephonyUtilities joinRequestAttachment:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Encountered an error while serializing TUJoinConversationRequest: %@", v2, v3, v4, v5, v6);
}

- (void)dialRequestAttachment
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error unarchiving TUDialRequest: %@", v2, v3, v4, v5, v6);
}

- (void)joinRequestAttachment
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error unarchiving TUJoinConversationRequest: %@", v2, v3, v4, v5, v6);
}

@end