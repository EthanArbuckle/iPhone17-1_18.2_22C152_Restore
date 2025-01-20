@interface GKContactsIntegrationMigrator
- (GKContactsIntegrationMigrator)initWithUserDefaults:(id)a3;
- (NSUserDefaults)userDefaults;
- (void)performMigrationsWithContext:(id)a3 list:(id)a4;
- (void)setUserDefaults:(id)a3;
@end

@implementation GKContactsIntegrationMigrator

- (GKContactsIntegrationMigrator)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKContactsIntegrationMigrator;
  v6 = [(GKContactsIntegrationMigrator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
  }

  return v7;
}

- (void)performMigrationsWithContext:(id)a3 list:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 version];
  signed __int16 v9 = (unsigned __int16)[v8 intValue];

  if (GKCDContactInfoListCurrentVersion > v9)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    v11 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100118C50(v11);
    }
    [v7 setChangeHistoryToken:0];
  }
  v12 = [(GKContactsIntegrationMigrator *)self userDefaults];
  unsigned __int8 v13 = [v12 BOOLForKey:@"GKContactsIntegrationHasMigratedCredentials"];

  if ((v13 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    v15 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100118C0C(v15);
    }
    v16 = +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:v6];
    v17 = +[GKClientProxy gameCenterClient];
    v18 = +[GKPlayerCredentialController sharedController];
    v19 = [v16 contactsAssociationID];
    id v20 = [v16 contactsIntegrationConsent];
    v21 = [v16 serviceLastUpdatedTimestamp];
    [v18 setContactAssociationID:v19 contactIntegrationConsent:v20 serviceLastUpdateTimestamp:v21 forEnvironment:[v17 environment] forcefully:1 completionHandler:&stru_1002DB468];

    v22 = [(GKContactsIntegrationMigrator *)self userDefaults];
    [v22 setBool:1 forKey:@"GKContactsIntegrationHasMigratedCredentials"];
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end