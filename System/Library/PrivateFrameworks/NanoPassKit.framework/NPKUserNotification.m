@interface NPKUserNotification
+ (id)generateModelIdentifierWith:(id)a3;
- (BOOL)isSuppressed;
- (BOOL)wantsBadgedIcon;
- (NSArray)identifierHashComponents;
- (NSDictionary)userInfo;
- (NSString)body;
- (NSString)identifier;
- (NSString)notificationCategoryIdentifier;
- (NSString)title;
@end

@implementation NPKUserNotification

+ (id)generateModelIdentifierWith:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", PKCombinedHash());
}

- (NSString)title
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "-[NPKUserNotification title]";
      __int16 v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/User Notifications/NPKUserNotification.m";
      __int16 v9 = 2048;
      uint64_t v10 = 24;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (NSString)body
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "-[NPKUserNotification body]";
      __int16 v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/User Notifications/NPKUserNotification.m";
      __int16 v9 = 2048;
      uint64_t v10 = 29;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (NSString)notificationCategoryIdentifier
{
  return (NSString *)@"PDUserNotificationTypeWallet";
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (NSArray)identifierHashComponents
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(NPKUserNotification *)self title];
  [v3 safelyAddObject:v4];

  int v5 = [(NPKUserNotification *)self body];
  [v3 safelyAddObject:v5];

  v6 = [(NPKUserNotification *)self notificationCategoryIdentifier];
  [v3 safelyAddObject:v6];

  return (NSArray *)v3;
}

- (NSString)identifier
{
  id v3 = objc_opt_class();
  v4 = [(NPKUserNotification *)self identifierHashComponents];
  int v5 = [v3 generateModelIdentifierWith:v4];

  return (NSString *)v5;
}

- (BOOL)isSuppressed
{
  return 0;
}

- (BOOL)wantsBadgedIcon
{
  return 0;
}

@end