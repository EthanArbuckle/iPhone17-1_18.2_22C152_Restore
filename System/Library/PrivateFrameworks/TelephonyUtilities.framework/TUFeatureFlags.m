@interface TUFeatureFlags
+ (BOOL)civicBlurAvatarsEnabled;
+ (BOOL)civicBlurPosterEnabled;
- (BOOL)FTUserScore;
- (BOOL)TTRBannerEnabled;
- (BOOL)aTVHandoff;
- (BOOL)announceCalls;
- (BOOL)appProtectionEnabled;
- (BOOL)appleAccountRebrandEnabled;
- (BOOL)aswanEnabled;
- (BOOL)audioCallUIModernizationEnabled;
- (BOOL)avLessSharePlayEnabled;
- (BOOL)avcCameraSelectionEnabled;
- (BOOL)btScanAbstraction;
- (BOOL)callHistorySearchEnabled;
- (BOOL)callManagementMuteControl;
- (BOOL)callManagerEnabled;
- (BOOL)callRecordingEnabled;
- (BOOL)callScreeningEnabled;
- (BOOL)callScreeningEnabledM3;
- (BOOL)callScreeningRTTEnabled;
- (BOOL)callTranscriptionExpansionEnabled;
- (BOOL)callsBusinessMetadataQuery;
- (BOOL)captionDraggingEnabled;
- (BOOL)collaborateTogetherEnabled;
- (BOOL)continuityCaptureEnabled;
- (BOOL)controlMessageOverQREnabled;
- (BOOL)conversationHandoffEnabled;
- (BOOL)conversationOneToOneModeEnabled;
- (BOOL)defaultAppsEnabled;
- (BOOL)defaultCallingAppsGracefulFallbackEnabled;
- (BOOL)deviceExpertMigrationEnabled;
- (BOOL)dualSIMRingtoneEnabled;
- (BOOL)embedSwapBannerEnabled;
- (BOOL)expanseBTSwitchingEnabled;
- (BOOL)expanseEnabled;
- (BOOL)expanseEnabledForMusic;
- (BOOL)expanseEnabledForTV;
- (BOOL)faceTimeLegacyAppEnabled;
- (BOOL)favoritesCallTapTargetsEnabled;
- (BOOL)filterGFTaaSCalls;
- (BOOL)ftAppDeletionEnabled;
- (BOOL)ftvSpatialAudioEnabled;
- (BOOL)fullScreenVoicemailDetailsEnabled;
- (BOOL)gameCenterSharePlayIntegration;
- (BOOL)gelatoEnabled;
- (BOOL)gftDowngradeToOneToOne;
- (BOOL)gftOnWatch;
- (BOOL)greenTeaLinksEnabled;
- (BOOL)groupConversations;
- (BOOL)groupFacetimeAsAServiceEnabled;
- (BOOL)incomingBannerOverSixUpEnabled;
- (BOOL)increaseCallHistoryEnabled;
- (BOOL)intelligentRoutingEnabled;
- (BOOL)keepCallsEnabled;
- (BOOL)lagunaAudioCallsEnabled;
- (BOOL)lagunaContinuityCompanionModeEnabled;
- (BOOL)lagunaContinuityCompanionModeMessageSupport;
- (BOOL)lagunaEnabled;
- (BOOL)lagunaIncomingCallsEnabled;
- (BOOL)lagunaLiveCaptionsEnabled;
- (BOOL)lagunaPullBackEnabled;
- (BOOL)linkNamesEnabled;
- (BOOL)liveIDLookupEnabled;
- (BOOL)livePhotoDonation;
- (BOOL)livePhotoXPCServiceEnabled;
- (BOOL)lvmExpansionLiveOnEnabled;
- (BOOL)memojiCameraEnabled;
- (BOOL)mochiEnabled;
- (BOOL)nameAndPhotoBackwardsCompatibilityEnabled;
- (BOOL)nameAndPhotoEnabled;
- (BOOL)nameAndPhotoEnabledC3;
- (BOOL)nonInterruptingCalls;
- (BOOL)offlineTranscriptionEnabled;
- (BOOL)offrampEnabled;
- (BOOL)oneToOneFaceTimeMyselfEnabled;
- (BOOL)participantIDToURIRemovedEnabled;
- (BOOL)phoneRecentsAvatarsCarplayEnabled;
- (BOOL)phoneRecentsAvatarsEnabled;
- (BOOL)previewMSROptimizationEnabled;
- (BOOL)qrPluginEncryptionEnabled;
- (BOOL)reactionsEnabled;
- (BOOL)recentsCallTapTargetsEnabled;
- (BOOL)requestA2DPOverIncomingCalls;
- (BOOL)requestToScreenShareEnabled;
- (BOOL)sckSystemPickerEnabled;
- (BOOL)screenSharingCALayerHostMode;
- (BOOL)screenSharingDeskViewEnabled;
- (BOOL)screenSharingDeskViewSqueegeeEnabled;
- (BOOL)screenSharingDrawToHighlightEnabled;
- (BOOL)screenSharingRemoteControlEnabled;
- (BOOL)screenSharingSpringBoardEssoniteEnabled;
- (BOOL)sessionBasedMutingEnabled;
- (BOOL)sharePlayCanEndWhenInitiatorLeaves;
- (BOOL)sharePlayDisabled;
- (BOOL)sharePlayDiscoverabilityEnabled;
- (BOOL)sharePlayInFaceTimeCanvasEnabled;
- (BOOL)sharePlayWithAirplayEnabled;
- (BOOL)shouldRingForIncomingCallEnabled;
- (BOOL)silencedCallNotificationBlockAndReportEnabled;
- (BOOL)simulatedModeEnabled;
- (BOOL)smartDialerEnabled;
- (BOOL)smartDialerExpandedSearchEnabled;
- (BOOL)smartDialerRankingEnabled;
- (BOOL)suggestionsReloadForSelectedRecipients;
- (BOOL)supportsScreenSharing;
- (BOOL)transcriptionEvaluationEnabled;
- (BOOL)uNNotificationsMacOSEnabled;
- (BOOL)uPlusNDowngrade;
- (BOOL)uPlusOneFullBleedHandoffEnabled;
- (BOOL)uPlusOneScreenSharing;
- (BOOL)uPlusOneSessionWithCapabilitiesEnabled;
- (BOOL)uninstalledAppStoreLockupEnabled;
- (BOOL)uniquelyFaceTimeEnabled;
- (BOOL)unknownInitiatorReportEnabled;
- (BOOL)unreliableMessengerEnabled;
- (BOOL)useSharedRecentsViewModel;
- (BOOL)usesMediaSafetyNetPillDataSource;
- (BOOL)usesModernScreenSharingFromMessages;
- (BOOL)videoMessagingEnabled;
- (BOOL)videoMessagingEnabledM3;
- (BOOL)videoMessagingSpamReportEnabled;
- (BOOL)vmCatchUpDonationEnabled;
- (BOOL)voicemailSearchEnabled;
- (BOOL)wombatWisdomEnabled;
@end

@implementation TUFeatureFlags

- (BOOL)callHistorySearchEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)phoneRecentsAvatarsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)recentsCallTapTargetsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)videoMessagingEnabledM3
{
  return _os_feature_enabled_impl();
}

- (BOOL)wombatWisdomEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)useSharedRecentsViewModel
{
  return _os_feature_enabled_impl();
}

- (BOOL)videoMessagingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)increaseCallHistoryEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)previewMSROptimizationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)nameAndPhotoEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)lvmExpansionLiveOnEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)screenSharingDrawToHighlightEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)nameAndPhotoEnabledC3
{
  return _os_feature_enabled_impl();
}

- (BOOL)callScreeningEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)announceCalls
{
  return _os_feature_enabled_impl();
}

- (BOOL)conversationOneToOneModeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)conversationHandoffEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)lagunaEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)lagunaPullBackEnabled
{
  int v2 = [(TUFeatureFlags *)self lagunaEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)lagunaIncomingCallsEnabled
{
  int v2 = [(TUFeatureFlags *)self lagunaEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)lagunaLiveCaptionsEnabled
{
  int v2 = [(TUFeatureFlags *)self lagunaEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)lagunaAudioCallsEnabled
{
  int v2 = [(TUFeatureFlags *)self lagunaEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)lagunaContinuityCompanionModeEnabled
{
  int v2 = [(TUFeatureFlags *)self lagunaEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)lagunaContinuityCompanionModeMessageSupport
{
  int v2 = [(TUFeatureFlags *)self lagunaEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)intelligentRoutingEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)callsBusinessMetadataQuery
{
  return _os_feature_enabled_impl();
}

- (BOOL)callScreeningEnabledM3
{
  return _os_feature_enabled_impl();
}

- (BOOL)callScreeningRTTEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)participantIDToURIRemovedEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)uPlusOneSessionWithCapabilitiesEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)controlMessageOverQREnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)shouldRingForIncomingCallEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)groupFacetimeAsAServiceEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)filterGFTaaSCalls
{
  return _os_feature_enabled_impl();
}

- (BOOL)uNNotificationsMacOSEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)gelatoEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)collaborateTogetherEnabled
{
  int v2 = [(TUFeatureFlags *)self gelatoEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)offrampEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)livePhotoDonation
{
  return _os_feature_enabled_impl();
}

- (BOOL)expanseEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayDisabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayDiscoverabilityEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayWithAirplayEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)expanseEnabledForTV
{
  return _os_feature_enabled_impl();
}

- (BOOL)expanseEnabledForMusic
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)aTVHandoff
{
  int v2 = [(TUFeatureFlags *)self expanseEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)ftvSpatialAudioEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)nonInterruptingCalls
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportsScreenSharing
{
  return _os_feature_enabled_impl();
}

- (BOOL)livePhotoXPCServiceEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)FTUserScore
{
  int v2 = _TUIsInternalInstall();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)qrPluginEncryptionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)expanseBTSwitchingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)TTRBannerEnabled
{
  int v2 = _TUIsInternalInstall();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)suggestionsReloadForSelectedRecipients
{
  return _os_feature_enabled_impl();
}

- (BOOL)gftDowngradeToOneToOne
{
  return _os_feature_enabled_impl();
}

- (BOOL)uPlusOneScreenSharing
{
  return _os_feature_enabled_impl();
}

- (BOOL)uPlusOneFullBleedHandoffEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)uPlusNDowngrade
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)requestA2DPOverIncomingCalls
{
  return _os_feature_enabled_impl();
}

- (BOOL)nameAndPhotoBackwardsCompatibilityEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)incomingBannerOverSixUpEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = MEMORY[0x1F415C3A0]();
  }
  return v2;
}

- (BOOL)embedSwapBannerEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)callManagerEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = MEMORY[0x1F415C3A0]();
  }
  return v2;
}

- (BOOL)fullScreenVoicemailDetailsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)mochiEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)unreliableMessengerEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sckSystemPickerEnabled
{
  return 0;
}

- (BOOL)avLessSharePlayEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)continuityCaptureEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)avcCameraSelectionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)greenTeaLinksEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)linkNamesEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)captionDraggingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)screenSharingCALayerHostMode
{
  return _os_feature_enabled_impl();
}

- (BOOL)screenSharingDeskViewEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)screenSharingDeskViewSqueegeeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)faceTimeLegacyAppEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)gameCenterSharePlayIntegration
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayInFaceTimeCanvasEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)memojiCameraEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)callManagementMuteControl
{
  return _os_feature_enabled_impl();
}

- (BOOL)groupConversations
{
  return _os_feature_enabled_impl();
}

- (BOOL)gftOnWatch
{
  return _os_feature_enabled_impl();
}

- (BOOL)dualSIMRingtoneEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)smartDialerEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)smartDialerRankingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)smartDialerExpandedSearchEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)favoritesCallTapTargetsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)voicemailSearchEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)phoneRecentsAvatarsCarplayEnabled
{
  int v2 = [(TUFeatureFlags *)self phoneRecentsAvatarsEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)reactionsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)videoMessagingSpamReportEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)unknownInitiatorReportEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)silencedCallNotificationBlockAndReportEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)liveIDLookupEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)uninstalledAppStoreLockupEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)ftAppDeletionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)vmCatchUpDonationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)civicBlurAvatarsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)civicBlurPosterEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)appleAccountRebrandEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)uniquelyFaceTimeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)requestToScreenShareEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)usesModernScreenSharingFromMessages
{
  return _os_feature_enabled_impl();
}

- (BOOL)usesMediaSafetyNetPillDataSource
{
  return _os_feature_enabled_impl();
}

- (BOOL)simulatedModeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)screenSharingRemoteControlEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)screenSharingSpringBoardEssoniteEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)audioCallUIModernizationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sessionBasedMutingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)deviceExpertMigrationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)defaultAppsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)appProtectionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)callRecordingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)callTranscriptionExpansionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayCanEndWhenInitiatorLeaves
{
  return _os_feature_enabled_impl();
}

- (BOOL)aswanEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)btScanAbstraction
{
  return _os_feature_enabled_impl();
}

- (BOOL)keepCallsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)transcriptionEvaluationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)oneToOneFaceTimeMyselfEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)offlineTranscriptionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)defaultCallingAppsGracefulFallbackEnabled
{
  return _os_feature_enabled_impl();
}

@end