@interface CSDSharedConversationServerBag
- (BOOL)faceTimeSpamReportingCheckPrefix;
- (BOOL)gftaasPseudonymsEnabled:(id)a3;
- (BOOL)isAutomaticUpgradingEnabled;
- (BOOL)isControlMessageOverQREnabled;
- (BOOL)isFaceTimeMyselfEnabled;
- (BOOL)isGFTDowngradeToOneToOneAvailable;
- (BOOL)isGuestModeSupported;
- (BOOL)isLetMeInRequestUIForUnknownParticipantEnabled;
- (BOOL)isMSNPillDataSourceEnabled;
- (BOOL)isModernGFTEnabled;
- (BOOL)isNoConversationParticipantEndCallEnabled;
- (BOOL)isParticipantIDToURIIncludedInPush;
- (BOOL)isSharePlayVersionCheckEnabled;
- (BOOL)isShortMKIEnabled;
- (BOOL)isUPlusNDowngradeAvailable;
- (BOOL)isUPlusOneSessionCapabilitiesEnabled;
- (BOOL)shouldRingForIncomingCallEnabled;
- (CSDSharedConversationServerBag)init;
- (NSDictionary)activityIdentifierBundleIDMapping;
- (double)liveLookupTimeoutSeconds;
- (float)answeringMachineAudioPowerLevelThreshold;
- (id)localBundleIDForActivityIdentifier:(id)a3;
- (id)stableBundleIdentifierForLocalBundleIdentifier:(id)a3;
- (int64_t)answeringMachineDidStopTimeout;
- (int64_t)maxVoicemailLengthFudgeSeconds;
- (int64_t)maxVoicemailLengthSeconds;
- (int64_t)voIPDOSCount;
- (unint64_t)AVCBlobRecoveryGracePeriod;
- (unint64_t)AVCBlobRecoveryTimeout;
- (unint64_t)activeParticipantPruningTimeout;
- (unint64_t)activeParticipantRefreshDelay;
- (unint64_t)addParticipantFromQRTime;
- (unint64_t)answeringMachineAudioPowerLevelCount;
- (unint64_t)clearMuteCacheDelay;
- (unint64_t)greenTeaHandoffTimeout;
- (unint64_t)groupFaceTimeTLESampleRate;
- (unint64_t)handoffAudioDeviceTimeout;
- (unint64_t)handoffUPlusOneLeaveDelay;
- (unint64_t)handoffUPlusOneLeaveTimeout;
- (unint64_t)idsFirewallBatchSize;
- (unint64_t)idsFirewallCHExpiryTimeDays;
- (unint64_t)inactiveLinkCacheLimit;
- (unint64_t)inactiveLinkPseudonymExpiry;
- (unint64_t)letMeInRequestNotificationTimeout;
- (unint64_t)letMeInRequestRecoveryTimeout;
- (unint64_t)letMeInRequestUINotificationGracePeriod;
- (unint64_t)linkPseudonymExpiry;
- (unint64_t)linkRemainingTimeBeforeAutoRenewal;
- (unint64_t)linkRenewalExtensionTime;
- (unint64_t)linkSyncRecoverFailureLimit;
- (unint64_t)linkSyncRecoverTimeLimit;
- (unint64_t)maxActiveParticipantFetchRetries;
- (unint64_t)maxIRSessionRetries;
- (unint64_t)maxKickMemberRetries;
- (unint64_t)maxRemoteSpatialPersonaParticipants;
- (unint64_t)messageRetryIntervalMillis;
- (unint64_t)messageRetryMaxAttempts;
- (unint64_t)noConversationParticipantTimeout;
- (unint64_t)rebroadcastTimeThreshold;
- (unint64_t)sessionCleanupTimeout;
- (unint64_t)uPlusOneAuthTagSampleRate;
- (unint64_t)voIPDOSMaxJailTimeSeconds;
- (unint64_t)voIPDOSMinJailTimeSeconds;
- (unint64_t)voIPDOSTimeSeconds;
- (unint64_t)watchInviteNotificationDelay;
- (unint64_t)watchLPMDialDelay;
- (unint64_t)webNicknameLengthLimit;
@end

@implementation CSDSharedConversationServerBag

- (unint64_t)activeParticipantPruningTimeout
{
  v2 = self;
  unint64_t v3 = sub_10025888C();

  return v3;
}

- (unint64_t)sessionCleanupTimeout
{
  v2 = self;
  unint64_t v3 = sub_1002588E4();

  return v3;
}

- (unint64_t)greenTeaHandoffTimeout
{
  v2 = self;
  unint64_t v3 = sub_10025893C();

  return v3;
}

- (unint64_t)AVCBlobRecoveryGracePeriod
{
  v2 = self;
  unint64_t v3 = sub_100258994();

  return v3;
}

- (unint64_t)AVCBlobRecoveryTimeout
{
  v2 = self;
  unint64_t v3 = sub_1002589EC();

  return v3;
}

- (unint64_t)noConversationParticipantTimeout
{
  v2 = self;
  unint64_t v3 = sub_100258A44();

  return v3;
}

- (unint64_t)rebroadcastTimeThreshold
{
  v2 = self;
  unint64_t v3 = sub_100258A9C();

  return v3;
}

- (unint64_t)activeParticipantRefreshDelay
{
  v2 = self;
  unint64_t v3 = sub_100258AF4();

  return v3;
}

- (BOOL)isAutomaticUpgradingEnabled
{
  v2 = self;
  char v3 = sub_100258B4C();

  return v3 & 1;
}

- (unint64_t)uPlusOneAuthTagSampleRate
{
  v2 = self;
  unint64_t v3 = sub_100258BA4();

  return v3;
}

- (unint64_t)groupFaceTimeTLESampleRate
{
  v2 = self;
  unint64_t v3 = sub_100258BFC();

  return v3;
}

- (BOOL)isShortMKIEnabled
{
  v2 = self;
  char v3 = sub_100258C54();

  return v3 & 1;
}

- (BOOL)isParticipantIDToURIIncludedInPush
{
  v2 = self;
  char v3 = sub_100258CAC();

  return v3 & 1;
}

- (BOOL)isModernGFTEnabled
{
  v2 = self;
  char v3 = sub_100258D04();

  return v3 & 1;
}

- (BOOL)isSharePlayVersionCheckEnabled
{
  v2 = self;
  char v3 = sub_100258D5C();

  return v3 & 1;
}

- (BOOL)isLetMeInRequestUIForUnknownParticipantEnabled
{
  v2 = self;
  char v3 = sub_100258DB4();

  return v3 & 1;
}

- (BOOL)isNoConversationParticipantEndCallEnabled
{
  v2 = self;
  char v3 = sub_100258E0C();

  return v3 & 1;
}

- (BOOL)isUPlusOneSessionCapabilitiesEnabled
{
  v2 = self;
  char v3 = sub_100258E64();

  return v3 & 1;
}

- (BOOL)isControlMessageOverQREnabled
{
  v2 = self;
  char v3 = sub_100258EBC();

  return v3 & 1;
}

- (BOOL)shouldRingForIncomingCallEnabled
{
  v2 = self;
  char v3 = sub_100258F14();

  return v3 & 1;
}

- (BOOL)isFaceTimeMyselfEnabled
{
  v2 = self;
  char v3 = sub_100258F6C();

  return v3 & 1;
}

- (unint64_t)maxActiveParticipantFetchRetries
{
  v2 = self;
  unint64_t v3 = sub_100258FC4();

  return v3;
}

- (unint64_t)maxKickMemberRetries
{
  v2 = self;
  unint64_t v3 = sub_10025901C();

  return v3;
}

- (unint64_t)linkPseudonymExpiry
{
  v2 = self;
  unint64_t v3 = sub_100259074();

  return v3;
}

- (unint64_t)addParticipantFromQRTime
{
  v2 = self;
  unint64_t v3 = sub_1002590CC();

  return v3;
}

- (unint64_t)linkRenewalExtensionTime
{
  v2 = self;
  unint64_t v3 = sub_100259124();

  return v3;
}

- (unint64_t)linkRemainingTimeBeforeAutoRenewal
{
  v2 = self;
  unint64_t v3 = sub_10025917C();

  return v3;
}

- (unint64_t)inactiveLinkPseudonymExpiry
{
  v2 = self;
  unint64_t v3 = sub_1002591D4();

  return v3;
}

- (unint64_t)inactiveLinkCacheLimit
{
  v2 = self;
  unint64_t v3 = sub_10025922C();

  return v3;
}

- (unint64_t)webNicknameLengthLimit
{
  v2 = self;
  unint64_t v3 = sub_100259284();

  return v3;
}

- (unint64_t)linkSyncRecoverFailureLimit
{
  v2 = self;
  unint64_t v3 = sub_1002592DC();

  return v3;
}

- (unint64_t)linkSyncRecoverTimeLimit
{
  v2 = self;
  unint64_t v3 = sub_100259334();

  return v3;
}

- (unint64_t)letMeInRequestNotificationTimeout
{
  v2 = self;
  unint64_t v3 = sub_10025938C();

  return v3;
}

- (BOOL)isMSNPillDataSourceEnabled
{
  v2 = self;
  char v3 = sub_1002593E4();

  return v3 & 1;
}

- (unint64_t)letMeInRequestRecoveryTimeout
{
  v2 = self;
  unint64_t v3 = sub_10025943C();

  return v3;
}

- (unint64_t)letMeInRequestUINotificationGracePeriod
{
  v2 = self;
  unint64_t v3 = sub_100259494();

  return v3;
}

- (NSDictionary)activityIdentifierBundleIDMapping
{
  v2 = self;
  sub_100259530();

  sub_1001F081C((uint64_t *)&unk_100586440);
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

- (id)localBundleIDForActivityIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_10025958C(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (unint64_t)idsFirewallCHExpiryTimeDays
{
  v2 = self;
  unint64_t v3 = sub_100259878();

  return v3;
}

- (unint64_t)idsFirewallBatchSize
{
  v2 = self;
  unint64_t v3 = sub_1002598D0();

  return v3;
}

- (unint64_t)handoffAudioDeviceTimeout
{
  v2 = self;
  unint64_t v3 = sub_100259928();

  return v3;
}

- (id)stableBundleIdentifierForLocalBundleIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_10025994C(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (unint64_t)messageRetryMaxAttempts
{
  v2 = self;
  unint64_t v3 = sub_100259B44();

  return v3;
}

- (unint64_t)messageRetryIntervalMillis
{
  v2 = self;
  unint64_t v3 = sub_100259B9C();

  return v3;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  v2 = self;
  char v3 = sub_100259BF4();

  return v3 & 1;
}

- (unint64_t)maxRemoteSpatialPersonaParticipants
{
  v2 = self;
  unint64_t v3 = sub_100259C4C();

  return v3;
}

- (BOOL)isUPlusNDowngradeAvailable
{
  v2 = self;
  char v3 = sub_100259CA4();

  return v3 & 1;
}

- (BOOL)isGuestModeSupported
{
  v2 = self;
  char v3 = sub_100259CFC();

  return v3 & 1;
}

- (BOOL)gftaasPseudonymsEnabled:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_100259D20(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (unint64_t)handoffUPlusOneLeaveTimeout
{
  v2 = self;
  unint64_t v3 = sub_100259DF4();

  return v3;
}

- (unint64_t)handoffUPlusOneLeaveDelay
{
  v2 = self;
  unint64_t v3 = sub_100259E4C();

  return v3;
}

- (unint64_t)watchInviteNotificationDelay
{
  v2 = self;
  unint64_t v3 = sub_100259EA4();

  return v3;
}

- (unint64_t)maxIRSessionRetries
{
  v2 = self;
  unint64_t v3 = sub_100259EFC();

  return v3;
}

- (unint64_t)watchLPMDialDelay
{
  v2 = self;
  unint64_t v3 = sub_100259F54();

  return v3;
}

- (float)answeringMachineAudioPowerLevelThreshold
{
  v2 = self;
  float v3 = sub_100259FB4();

  return v3;
}

- (unint64_t)answeringMachineAudioPowerLevelCount
{
  v2 = self;
  unint64_t v3 = sub_10025A034();

  return v3;
}

- (int64_t)answeringMachineDidStopTimeout
{
  v2 = self;
  int64_t v3 = sub_10025A08C();

  return v3;
}

- (int64_t)maxVoicemailLengthSeconds
{
  v2 = self;
  int64_t v3 = sub_10025A0E4();

  return v3;
}

- (int64_t)maxVoicemailLengthFudgeSeconds
{
  v2 = self;
  int64_t v3 = sub_10025A13C();

  return v3;
}

- (unint64_t)clearMuteCacheDelay
{
  v2 = self;
  unint64_t v3 = sub_10025A194();

  return v3;
}

- (int64_t)voIPDOSCount
{
  v2 = self;
  int64_t v3 = sub_10025A1EC();

  return v3;
}

- (unint64_t)voIPDOSTimeSeconds
{
  v2 = self;
  unint64_t v3 = sub_10025A244();

  return v3;
}

- (unint64_t)voIPDOSMaxJailTimeSeconds
{
  v2 = self;
  unint64_t v3 = sub_10025A29C();

  return v3;
}

- (unint64_t)voIPDOSMinJailTimeSeconds
{
  v2 = self;
  unint64_t v3 = sub_10025A2F4();

  return v3;
}

- (double)liveLookupTimeoutSeconds
{
  v2 = self;
  double v3 = sub_10025A390();

  return v3;
}

- (BOOL)faceTimeSpamReportingCheckPrefix
{
  v2 = self;
  char v3 = sub_10025A410();

  return v3 & 1;
}

- (CSDSharedConversationServerBag)init
{
  return (CSDSharedConversationServerBag *)sub_10025A470();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end