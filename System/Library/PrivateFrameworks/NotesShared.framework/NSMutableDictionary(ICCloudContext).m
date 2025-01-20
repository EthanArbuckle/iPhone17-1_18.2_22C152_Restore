@interface NSMutableDictionary(ICCloudContext)
- (void)ic_addZoneID:()ICCloudContext forAccountID:;
- (void)ic_removeZoneID:()ICCloudContext forAccountID:;
@end

@implementation NSMutableDictionary(ICCloudContext)

- (void)ic_addZoneID:()ICCloudContext forAccountID:
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSMutableDictionary(ICCloudContext) ic_addZoneID:forAccountID:]();
    }
    goto LABEL_10;
  }
  if (!v6)
  {
    v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSMutableDictionary(ICCloudContext) ic_addZoneID:forAccountID:]();
    }
LABEL_10:

    goto LABEL_11;
  }
  v8 = [a1 objectForKeyedSubscript:v7];
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1CA80] set];
  }
  [a1 setObject:v8 forKeyedSubscript:v7];
  [v8 addObject:v6];

LABEL_11:
}

- (void)ic_removeZoneID:()ICCloudContext forAccountID:
{
  id v6 = a3;
  if (a4)
  {
    id v7 = [a1 objectForKeyedSubscript:a4];
    v8 = v7;
    if (v7) {
      [v7 removeObject:v6];
    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NSMutableDictionary(ICCloudContext) ic_removeZoneID:forAccountID:]();
    }
  }
}

- (void)ic_addZoneID:()ICCloudContext forAccountID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to add zoneID without an account ID", v2, v3, v4, v5, v6);
}

- (void)ic_addZoneID:()ICCloudContext forAccountID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to add nil zoneID.", v2, v3, v4, v5, v6);
}

- (void)ic_removeZoneID:()ICCloudContext forAccountID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to remove zoneID without an account ID", v2, v3, v4, v5, v6);
}

@end