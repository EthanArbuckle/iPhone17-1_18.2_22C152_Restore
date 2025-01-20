@interface CSDUserConfigurationMigrator
- (CSDUserConfigurationMigrator)init;
- (TUUserConfiguration)userConfiguration;
- (void)migrateAnnounceCalls;
- (void)migrateConversationLinkBaseURL;
- (void)perform;
@end

@implementation CSDUserConfigurationMigrator

- (CSDUserConfigurationMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSDUserConfigurationMigrator;
  v2 = [(CSDUserConfigurationMigrator *)&v6 init];
  if (v2)
  {
    v3 = (TUUserConfiguration *)objc_alloc_init((Class)TUUserConfiguration);
    userConfiguration = v2->_userConfiguration;
    v2->_userConfiguration = v3;
  }
  return v2;
}

- (void)perform
{
  [(CSDUserConfigurationMigrator *)self migrateAnnounceCalls];

  [(CSDUserConfigurationMigrator *)self migrateConversationLinkBaseURL];
}

- (void)migrateAnnounceCalls
{
  v3 = [(CSDUserConfigurationMigrator *)self userConfiguration];
  id v4 = [v3 announceCalls];

  if (!v4)
  {
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.InCallService"];
    objc_super v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migrator is looking for legacy Announce Calls setting in %@", (uint8_t *)&v13, 0xCu);
    }

    v7 = [v5 objectForKey:@"announcements"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v9 = sub_100008DCC();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (isKindOfClass)
    {
      if (v10)
      {
        int v13 = 138412290;
        id v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrator found legacy Announce Calls setting %@", (uint8_t *)&v13, 0xCu);
      }

      unint64_t v11 = (unint64_t)[v7 unsignedIntegerValue] - 1;
      if (v11 > 3) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = qword_10048DA08[v11];
      }
      v9 = [(CSDUserConfigurationMigrator *)self userConfiguration];
      [v9 setAnnounceCalls:v12];
    }
    else if (v10)
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrator did not find legacy Announce Calls setting in %@", (uint8_t *)&v13, 0xCu);
    }

    [v5 removeObjectForKey:@"announcements"];
  }
}

- (void)migrateConversationLinkBaseURL
{
  v3 = [(CSDUserConfigurationMigrator *)self userConfiguration];
  id v4 = [v3 conversationLinkBaseURL];

  if (v4)
  {
    id v5 = +[NSUserDefaults tu_defaults];
    objc_super v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migrator is looking for legacy Conversation Link Base URL setting in %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = [v5 stringForKey:@"GondolaLinkOverrideBaseURL"];
    v8 = sub_100008DCC();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v11 = 138412290;
        uint64_t v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Migrator found legacy Conversation Link Base URL setting %@", (uint8_t *)&v11, 0xCu);
      }

      v8 = [objc_alloc((Class)NSURL) initWithString:v7];
      BOOL v10 = [(CSDUserConfigurationMigrator *)self userConfiguration];
      [v10 setConversationLinkBaseURL:v8];
    }
    else if (v9)
    {
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Migrator did not find legacy Conversation Link Base URL setting in %@", (uint8_t *)&v11, 0xCu);
    }

    [v5 removeObjectForKey:@"GondolaLinkOverrideBaseURL"];
  }
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void).cxx_destruct
{
}

@end