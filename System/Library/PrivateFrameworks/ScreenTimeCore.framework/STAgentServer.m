@interface STAgentServer
- (STAgentServer)initWithScreenTimeStateManager:(id)a3;
- (STManagementStateServer)stateServer;
- (STRemoteUIPinService)remoteUIPINService;
- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3;
- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)authenticateRestrictionsPasscode:(id)a3 replyHandler:(id)a4;
- (void)clearRestrictionsPasscodeWithCompletionHandler:(id)a3;
- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4;
- (void)communicationPoliciesWithCompletionHandler:(id)a3;
- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4;
- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5;
- (void)deleteAllWebApplicationHistory:(id)a3 profileIdentifier:(id)a4 replyHandler:(id)a5;
- (void)deleteAllWebApplicationHistory:(id)a3 replyHandler:(id)a4;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 replyHandler:(id)a5;
- (void)enableRemoteManagementForDSID:(id)a3 completionHandler:(id)a4;
- (void)enableScreenTimeForDSID:(id)a3 completionHandler:(id)a4;
- (void)enableWebContentFilterWithCompletionHandler:(id)a3;
- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4;
- (void)isExplicitContentRestrictedWithCompletionHandler:(id)a3;
- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4;
- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3;
- (void)isWebContentRestrictedWithCompletionHandler:(id)a3;
- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4;
- (void)needsToSetRestrictionsPasscodeWithReplyHandler:(id)a3;
- (void)performMigrationFromMCXSettings:(id)a3 completionHandler:(id)a4;
- (void)permitWebFilterURL:(id)a3 pageTitle:(id)a4 completionHandler:(id)a5;
- (void)postNotificationForContext:(id)a3;
- (void)presentRemotePINControllerWithCompletionHandler:(id)a3;
- (void)primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:(id)a3;
- (void)requestConfigurationWithReplyHandler:(id)a3;
- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithReplyHandler:(id)a3;
- (void)screenTimeStateWithCompletionHandler:(id)a3;
- (void)screenTimeSyncStateWithCompletionHandler:(id)a3;
- (void)setContactManagementState:(int64_t)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5;
- (void)setRemoteUIPINService:(id)a3;
- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4;
- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setStateServer:(id)a3;
- (void)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 replyHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 replyHandler:(id)a4;
- (void)shouldAllowOneMoreMinuteForWebDomain:(id)a3 replyHandler:(id)a4;
- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3;
- (void)triggerDowngradeMigrationWithCompletionHandler:(id)a3;
@end

@implementation STAgentServer

- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 isRestrictionsPasscodeSetWithCompletionHandler:v4];
}

- (void)communicationPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 communicationPoliciesWithCompletionHandler:v4];
}

- (STManagementStateServer)stateServer
{
  return self->_stateServer;
}

- (STAgentServer)initWithScreenTimeStateManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STAgentServer;
  id v5 = [(STAgentServer *)&v11 init];
  if (v5)
  {
    v6 = [[STManagementStateServer alloc] initWithScreenTimeStateManager:v4];
    stateServer = v5->_stateServer;
    v5->_stateServer = v6;

    uint64_t v8 = objc_opt_new();
    remoteUIPINService = v5->_remoteUIPINService;
    v5->_remoteUIPINService = (STRemoteUIPinService *)v8;
  }
  return v5;
}

- (void)requestConfigurationWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007460;
  v7[3] = &unk_1002FB3D8;
  id v8 = v4;
  id v6 = v4;
  [v5 isRestrictionsPasscodeSetWithCompletionHandler:v7];
}

- (void)screenTimeStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 screenTimeStateWithCompletionHandler:v4];
}

- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STAgentServer *)self stateServer];
  [v7 setScreenTimeEnabled:v4 completionHandler:v6];
}

- (void)enableScreenTimeForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 enableScreenTimeForDSID:v7 completionHandler:v6];
}

- (void)enableRemoteManagementForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 enableRemoteManagementForDSID:v7 completionHandler:v6];
}

- (void)screenTimeSyncStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 screenTimeSyncStateWithCompletionHandler:v4];
}

- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STAgentServer *)self stateServer];
  [v7 setScreenTimeSyncingEnabled:v4 completionHandler:v6];
}

- (void)isContentPrivacyEnabledForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 isContentPrivacyEnabledForDSID:v7 completionHandler:v6];
}

- (void)clearRestrictionsPasscodeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 clearRestrictionsPasscodeWithCompletionHandler:v4];
}

- (void)needsToSetRestrictionsPasscodeWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 needsToSetRestrictionsPasscodeWithReplyHandler:v4];
}

- (void)setRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 setRestrictionsPasscode:v7 completionHandler:v6];
}

- (void)authenticateRestrictionsPasscode:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 authenticateRestrictionsPasscode:v7 replyHandler:v6];
}

- (void)shouldRequestMoreTimeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 shouldRequestMoreTimeWithCompletionHandler:v4];
}

- (void)communicationPoliciesForDSID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 communicationPoliciesForDSID:v7 withCompletionHandler:v6];
}

- (void)primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 primaryiCloudCardDAVAccountIdentifierWithCompletionHandler:v4];
}

- (void)setContactManagementState:(int64_t)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(STAgentServer *)self stateServer];
  [v10 setContactManagementState:a3 forDSID:v9 completionHandler:v8];
}

- (void)contactManagementStateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 contactManagementStateForDSID:v7 completionHandler:v6];
}

- (void)isExplicitContentRestrictedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 isExplicitContentRestrictedWithCompletionHandler:v4];
}

- (void)isWebContentRestrictedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 isWebContentRestrictedWithCompletionHandler:v4];
}

- (void)enableWebContentFilterWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 enableWebContentFilterWithCompletionHandler:v4];
}

- (void)presentRemotePINControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self remoteUIPINService];
  [v5 presentRemotePINControllerWithCompletionHandler:v4];
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:v4];
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 deleteWebHistoryForURL:v10 webApplication:v9 replyHandler:v8];
}

- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 deleteWebHistoryForURLs:v10 webApplication:v9 replyHandler:v8];
}

- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 deleteWebHistoryForDomain:v10 webApplication:v9 replyHandler:v8];
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 deleteWebHistoryDuringInterval:v10 webApplication:v9 replyHandler:v8];
}

- (void)deleteAllWebApplicationHistory:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 deleteAllWebApplicationHistory:v7 replyHandler:v6];
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STAgentServer *)self stateServer];
  [v14 deleteWebHistoryForURL:v13 webApplication:v12 profileIdentifier:v11 replyHandler:v10];
}

- (void)deleteWebHistoryForURLs:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STAgentServer *)self stateServer];
  [v14 deleteWebHistoryForURLs:v13 webApplication:v12 profileIdentifier:v11 replyHandler:v10];
}

- (void)deleteWebHistoryForDomain:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STAgentServer *)self stateServer];
  [v14 deleteWebHistoryForDomain:v13 webApplication:v12 profileIdentifier:v11 replyHandler:v10];
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STAgentServer *)self stateServer];
  [v14 deleteWebHistoryDuringInterval:v13 webApplication:v12 profileIdentifier:v11 replyHandler:v10];
}

- (void)deleteAllWebApplicationHistory:(id)a3 profileIdentifier:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 deleteAllWebApplicationHistory:v10 profileIdentifier:v9 replyHandler:v8];
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STAgentServer *)self stateServer];
  [v14 deleteWebHistoryForURL:v13 webApplication:v12 clientBundleURLWrapper:v11 replyHandler:v10];
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(STAgentServer *)self stateServer];
  [v14 deleteWebHistoryDuringInterval:v13 webApplication:v12 clientBundleURLWrapper:v11 replyHandler:v10];
}

- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 deleteAllWebApplicationHistory:v10 clientBundleURLWrapper:v9 replyHandler:v8];
}

- (void)performMigrationFromMCXSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 performMigrationFromMCXSettings:v7 completionHandler:v6];
}

- (void)applyDefaultUserPoliciesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 applyDefaultUserPoliciesWithCompletionHandler:v4];
}

- (void)permitWebFilterURL:(id)a3 pageTitle:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 permitWebFilterURL:v10 pageTitle:v9 completionHandler:v8];
}

- (void)shouldAllowOneMoreMinuteForBundleIdentifier:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 shouldAllowOneMoreMinuteForBundleIdentifier:v7 replyHandler:v6];
}

- (void)shouldAllowOneMoreMinuteForWebDomain:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 shouldAllowOneMoreMinuteForWebDomain:v7 replyHandler:v6];
}

- (void)shouldAllowOneMoreMinuteForCategoryIdentifier:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 shouldAllowOneMoreMinuteForCategoryIdentifier:v7 replyHandler:v6];
}

- (void)applyIntroductionModel:(id)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STAgentServer *)self stateServer];
  [v11 applyIntroductionModel:v10 forDSID:v9 completionHandler:v8];
}

- (void)isLocationSharingModificationAllowedForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 isLocationSharingModificationAllowedForDSID:v7 completionHandler:v6];
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forDSID:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(STAgentServer *)self stateServer];
  [v10 setLocationSharingModificationAllowed:v6 forDSID:v9 completionHandler:v8];
}

- (void)lastCommunicationLimitsModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 lastCommunicationLimitsModifcationDateForDSID:v7 completionHandler:v6];
}

- (void)lastModifcationDateForDSID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STAgentServer *)self stateServer];
  [v8 lastModifcationDateForDSID:v7 completionHandler:v6];
}

- (void)postNotificationForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 postNotificationForContext:v4];
}

- (void)triggerDowngradeMigrationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAgentServer *)self stateServer];
  [v5 triggerDowngradeMigrationWithCompletionHandler:v4];
}

- (void)setStateServer:(id)a3
{
}

- (STRemoteUIPinService)remoteUIPINService
{
  return self->_remoteUIPINService;
}

- (void)setRemoteUIPINService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIPINService, 0);
  objc_storeStrong((id *)&self->_stateServer, 0);
}

@end