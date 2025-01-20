@interface _PSConstants
+ (id)CKTesterBundleId;
+ (id)ShareSheetDataHarvestingPluginCompletedNotificationName;
+ (id)appleNewsBundleId;
+ (id)booksBundleId;
+ (id)collaborationSuggestionBundleId;
+ (id)contactsAutocompleteBundleId;
+ (id)coreMLModel;
+ (id)eligibleShareSheetTargets;
+ (id)ensembleModel;
+ (id)facetimeBundleId;
+ (id)findMyBundleId;
+ (id)freeformBundleId;
+ (id)inCallCollaborationHeuristicReason;
+ (id)inCallHeuristicReason;
+ (id)inExpanseSessionHeuristicReason;
+ (id)instagramBundleId;
+ (id)journalBundleId;
+ (id)macCalendarBundleId;
+ (id)macFacetimeBundleId;
+ (id)macKnowledgeAgentBundleId;
+ (id)macMailBundleId;
+ (id)macMessagesBundleId;
+ (id)macSafariBundleId;
+ (id)macSafariPlatformSupportBundleId;
+ (id)macSafariTechnologyPreviewBundleId;
+ (id)macSharePlayPeoplePickerBundleId;
+ (id)mailBundleIds;
+ (id)messagesBundleIds;
+ (id)mobileCalendarBundleId;
+ (id)mobileCameraBundleId;
+ (id)mobileCoreDuetBundleId;
+ (id)mobileFacetimeBundleId;
+ (id)mobileMailAccountSettingsBundleId;
+ (id)mobileMailBundleId;
+ (id)mobileMessagesBundleId;
+ (id)mobileMessagesComposeBundleId;
+ (id)mobilePhoneBundleId;
+ (id)mobilePhotosBundleId;
+ (id)mobileSafariBundleId;
+ (id)mobileScreenshotsBundleId;
+ (id)mobileSharePlayPeoplePickerBundleId;
+ (id)notesBundleId;
+ (id)passwordsAppBundleId;
+ (id)peoplePickerBundleId;
+ (id)peoplePickerTesterBundleId;
+ (id)peopleSuggesterShareSheetProjectName;
+ (id)photoAssetPresenceHeuristicReason;
+ (id)preferencesBundleId;
+ (id)psDefaultsDomain;
+ (id)realityLauncherBundleId;
+ (id)remindersBundleId;
+ (id)returnToSenderReason;
+ (id)sharePlayBundleId;
+ (id)shareSheetTargetBundleIdMail;
+ (id)shareSheetTargetBundleIdMessages;
+ (id)shareplayBundleIds;
+ (id)suggestionPathBestEffort;
+ (id)suggestionPathCachedSuggestion;
+ (id)suggestionPathNormal;
+ (id)suggestionPathPopulateCache;
+ (id)suggestionPathXPCConnectionFailure;
+ (id)suggestionPathXPCError;
+ (id)systemBundleIds;
+ (id)twitterBundleId;
+ (id)whatsappBundleId;
@end

@implementation _PSConstants

+ (id)mobileMessagesBundleId
{
  return @"com.apple.MobileSMS";
}

+ (id)macMessagesBundleId
{
  return @"com.apple.iChat";
}

+ (id)mobilePhotosBundleId
{
  return @"com.apple.mobileslideshow";
}

+ (id)mobileScreenshotsBundleId
{
  return @"com.apple.ScreenshotServicesService";
}

+ (id)mobileCameraBundleId
{
  return @"com.apple.camera";
}

+ (id)twitterBundleId
{
  return @"com.atebits.Tweetie2";
}

+ (id)whatsappBundleId
{
  return @"net.whatsapp.WhatsApp";
}

+ (id)instagramBundleId
{
  return @"com.burbn.instagram";
}

+ (id)mobileMailBundleId
{
  return @"com.apple.mobilemail";
}

+ (id)mobileMailAccountSettingsBundleId
{
  return @"com.apple.mobilemail.accountsettings";
}

+ (id)macMailBundleId
{
  return @"com.apple.mail";
}

+ (id)mobileCalendarBundleId
{
  return @"com.apple.mobilecal";
}

+ (id)macCalendarBundleId
{
  return @"com.apple.iCal";
}

+ (id)mobilePhoneBundleId
{
  return @"com.apple.InCallService";
}

+ (id)mobileFacetimeBundleId
{
  return @"com.apple.facetime";
}

+ (id)macFacetimeBundleId
{
  return @"com.apple.FaceTime";
}

+ (id)appleNewsBundleId
{
  return @"com.apple.news";
}

+ (id)notesBundleId
{
  return @"com.apple.mobilenotes";
}

+ (id)remindersBundleId
{
  return @"com.apple.reminders";
}

+ (id)journalBundleId
{
  return @"com.apple.journal";
}

+ (id)freeformBundleId
{
  return @"com.apple.freeform";
}

+ (id)booksBundleId
{
  return @"com.apple.iBooks";
}

+ (id)facetimeBundleId
{
  return +[_PSConstants mobileFacetimeBundleId];
}

+ (id)shareSheetTargetBundleIdMessages
{
  return @"com.apple.UIKit.activity.Message";
}

+ (id)shareSheetTargetBundleIdMail
{
  return @"com.apple.UIKit.activity.Mail";
}

+ (id)mobileSafariBundleId
{
  return @"com.apple.mobilesafari";
}

+ (id)macSafariBundleId
{
  return @"com.apple.Safari";
}

+ (id)macSafariTechnologyPreviewBundleId
{
  return @"com.apple.SafariTechnologyPreview";
}

+ (id)macSafariPlatformSupportBundleId
{
  return @"com.apple.SafariPlatformSupport.Helper";
}

+ (id)mobileMessagesComposeBundleId
{
  return @"com.apple.mobilesms.compose";
}

+ (id)eligibleShareSheetTargets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___PSConstants_eligibleShareSheetTargets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (eligibleShareSheetTargets__pasOnceToken2 != -1) {
    dispatch_once(&eligibleShareSheetTargets__pasOnceToken2, block);
  }
  v2 = (void *)eligibleShareSheetTargets__pasExprOnceResult;

  return v2;
}

+ (id)photoAssetPresenceHeuristicReason
{
  return @"Person in photo suggestions heuristic (asset presence)";
}

+ (id)inCallHeuristicReason
{
  return @"In-call heuristic";
}

+ (id)inCallCollaborationHeuristicReason
{
  return @"In-call collaboration heuristic";
}

+ (id)inExpanseSessionHeuristicReason
{
  return @"In-expanse session heuristic";
}

+ (id)mobileCoreDuetBundleId
{
  return @"com.apple.coreduetd";
}

+ (id)macKnowledgeAgentBundleId
{
  return @"com.apple.knowledge-agent";
}

+ (id)preferencesBundleId
{
  return @"com.apple.Preferences";
}

+ (id)passwordsAppBundleId
{
  return @"com.apple.Passwords";
}

+ (id)sharePlayBundleId
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v2 = (id *)getTUBundleIdentifierCallServicesDaemonSymbolLoc_ptr;
  uint64_t v12 = getTUBundleIdentifierCallServicesDaemonSymbolLoc_ptr;
  if (!getTUBundleIdentifierCallServicesDaemonSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getTUBundleIdentifierCallServicesDaemonSymbolLoc_block_invoke;
    v8[3] = &unk_1E5ADE858;
    v8[4] = &v9;
    __getTUBundleIdentifierCallServicesDaemonSymbolLoc_block_invoke((uint64_t)v8);
    v2 = (id *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    v7 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU]();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  id v3 = *v2;
  v4 = v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"com.apple.telephonyutilities.callservicesd";
  }

  return v5;
}

+ (id)mobileSharePlayPeoplePickerBundleId
{
  return @"com.apple.InCallService.RemotePeoplePicker";
}

+ (id)collaborationSuggestionBundleId
{
  return @"com.apple.InCallService.ShareExtension";
}

+ (id)macSharePlayPeoplePickerBundleId
{
  return @"com.apple.FaceTime.RemotePeoplePicker";
}

+ (id)contactsAutocompleteBundleId
{
  return @"com.apple.Contacts.Autocomplete";
}

+ (id)findMyBundleId
{
  return @"com.apple.findmy";
}

+ (id)realityLauncherBundleId
{
  return @"com.apple.RealityLauncher";
}

+ (id)peoplePickerBundleId
{
  return @"com.apple.PeoplePicker";
}

+ (id)peoplePickerTesterBundleId
{
  return @"com.apple.PeoplePickerTester";
}

+ (id)CKTesterBundleId
{
  return @"com.apple.CKTester";
}

+ (id)ensembleModel
{
  return @"ensembleModel";
}

+ (id)coreMLModel
{
  return @"coreMLModel";
}

+ (id)psDefaultsDomain
{
  return @"com.apple.PeopleSuggester.SeedSuggestions";
}

+ (id)returnToSenderReason
{
  return @"ReturnToSender";
}

+ (id)messagesBundleIds
{
  if (messagesBundleIds__pasOnceToken3 != -1) {
    dispatch_once(&messagesBundleIds__pasOnceToken3, &__block_literal_global_5);
  }
  v2 = (void *)messagesBundleIds__pasExprOnceResult;

  return v2;
}

+ (id)mailBundleIds
{
  if (mailBundleIds__pasOnceToken4 != -1) {
    dispatch_once(&mailBundleIds__pasOnceToken4, &__block_literal_global_154);
  }
  v2 = (void *)mailBundleIds__pasExprOnceResult;

  return v2;
}

+ (id)shareplayBundleIds
{
  if (shareplayBundleIds__pasOnceToken5 != -1) {
    dispatch_once(&shareplayBundleIds__pasOnceToken5, &__block_literal_global_156);
  }
  v2 = (void *)shareplayBundleIds__pasExprOnceResult;

  return v2;
}

+ (id)systemBundleIds
{
  if (systemBundleIds_onceToken != -1) {
    dispatch_once(&systemBundleIds_onceToken, &__block_literal_global_158);
  }
  v2 = (void *)systemBundleIds_systemBundleIds;

  return v2;
}

+ (id)ShareSheetDataHarvestingPluginCompletedNotificationName
{
  return @"ShareSheetDataHarvestingPluginCompletedNotificationName";
}

+ (id)suggestionPathNormal
{
  return @"Normal";
}

+ (id)suggestionPathBestEffort
{
  return @"BestEffort";
}

+ (id)suggestionPathCachedSuggestion
{
  return @"CachedSuggestion";
}

+ (id)suggestionPathXPCConnectionFailure
{
  return @"XPCConnectionFailure";
}

+ (id)suggestionPathXPCError
{
  return @"XPCError";
}

+ (id)suggestionPathPopulateCache
{
  return @"PopulateCache";
}

+ (id)peopleSuggesterShareSheetProjectName
{
  return @"PeopleSuggester_ShareSheet";
}

@end