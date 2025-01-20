@interface WBUFormDataController
+ (BOOL)contactIsMe:(id)a3;
+ (BOOL)contactStoreHasMeCard:(id)a3;
+ (BOOL)keychainSyncEnabled;
+ (id)_meCard;
+ (id)_stringForCNContactObject:(id)a3 contactObjectComponent:(id)a4;
+ (id)localizedLowercaseContactProperty:(id)a3;
+ (id)valueStringForMatch:(id)a3;
- (BOOL)_saveUser:(id)a3 password:(id)a4 isGeneratedPassword:(BOOL)a5 forURL:(id)a6 inContext:(id)a7 formType:(unint64_t)a8 promptingPolicy:(int64_t)a9 webView:(id)a10 completionHandler:(id)a11;
- (BOOL)_shouldSaveCreditCardDataInWebView:(id)a3 frame:(id)a4;
- (BOOL)_shouldSaveUsernamesAndPasswordsForURL:(id)a3 inWebView:(id)a4;
- (BOOL)_shouldTryToSaveCredentialsFromLastForm:(id)a3 currentFormMetadata:(id)a4 frame:(id)a5;
- (BOOL)_updateCredentialsWithGeneratedPasswordForForm:(id)a3 inWebView:(id)a4 frame:(id)a5 context:(id)a6;
- (BOOL)_updatePasswordOfPreviouslySavedAccount:(id)a3 withPasswordEditedByUser:(id)a4;
- (BOOL)_webView:(id)a3 formSubmission:(BOOL)a4 willSubmitNewAccountOrChangePasswordFormWithMetadata:(id)a5 shouldPreferAnnotatedCredentials:(BOOL)a6 fromFrame:(id)a7 inContext:(id)a8 submissionHandler:(id)a9;
- (BOOL)_webView:(id)a3 saveCredentialsForURL:(id)a4 formSubmission:(BOOL)a5 formWithMetadata:(id)a6 fromFrame:(id)a7 username:(id)a8 password:(id)a9 inContext:(id)a10 submissionHandler:(id)a11;
- (BOOL)_webView:(id)a3 saveUsernameAndPasswordForURL:(id)a4 formType:(unint64_t)a5 inFrame:(id)a6 username:(id)a7 password:(id)a8 isGeneratedPassword:(BOOL)a9 confirmOverwritingCurrentPassword:(BOOL)a10 inContext:(id)a11 submissionHandler:(id)a12;
- (BOOL)_webView:(id)a3 saveUsernameAndPasswordFromForm:(id)a4 inFrame:(id)a5 context:(id)a6 confirmOverwritingCurrentPassword:(BOOL)a7 shouldPreferAnnotatedCredentials:(BOOL)a8 submissionHandler:(id)a9;
- (BOOL)_webView:(id)a3 willSubmitFormContainingCreditCardData:(id)a4 fromFrame:(id)a5 submissionHandler:(id)a6;
- (BOOL)_webView:(id)a3 willSubmitLoginFormWithMetadata:(id)a4 formSubmission:(BOOL)a5 fromFrame:(id)a6 inContext:(id)a7 submissionHandler:(id)a8;
- (BOOL)_webView:(id)a3 willSubmitStandardFormWithMetadata:(id)a4 fromFrame:(id)a5 submissionHandler:(id)a6;
- (BOOL)autoFillCorrectionManagerShouldProcessFeedback:(id)a3;
- (BOOL)formFieldClassificationCorrector:(id)a3 hasAddressBookDataForAddressBookLabel:(id)a4;
- (BOOL)mayFillCreditCardDataInFrame:(id)a3;
- (BOOL)mayPreFillInFrame:(id)a3;
- (BOOL)shouldAllowPasswordAutoFillOnURL:(id)a3 allowExternalCredentials:(BOOL)a4;
- (BOOL)shouldAutoFillFromAddressBook;
- (BOOL)shouldAutoFillFromCreditCardData;
- (BOOL)shouldAutoFillFromCreditCardDataInFrame:(id)a3;
- (BOOL)shouldAutoFillFromPreviousData;
- (BOOL)shouldAutoFillPasswords;
- (BOOL)shouldAutoGeneratePasswordsForURL:(id)a3 inWebView:(id)a4;
- (BOOL)webView:(id)a3 frame:(id)a4 willNavigateFromForm:(id)a5 inContext:(id)a6 bySubmitting:(BOOL)a7 processMetadataCorrections:(BOOL)a8 uniqueIDsOfControlsThatWereAutoFilled:(id)a9 submissionHandler:(id)a10;
- (BOOL)whiteListAllowsURL:(id)a3;
- (CNContact)me;
- (NSSet)previouslyFilledVirtualCardNumbers;
- (WBSCreditCardData)lastFilledCreditCardData;
- (WBSGeneratedPassword)generatedPassword;
- (WBUFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3;
- (id)_addressBookMatchesForFamilyNameForContact:(id)a3;
- (id)_addressBookMatchesForFullNameForContact:(id)a3;
- (id)_addressBookMatchesForGivenNameForContact:(id)a3;
- (id)_addressBookMatchesForMiddleNameForContact:(id)a3;
- (id)_autoFillCorrectionManager;
- (id)_credentialMatchesEligibleForUpdateForURL:(id)a3 username:(id)a4 oldPassword:(id)a5;
- (id)_detailTextForPromptToSaveCard:(id)a3;
- (id)_relatedCredentialMatchesToUpdateForUser:(id)a3 protectionSpace:(id)a4 oldSavedAccount:(id *)a5 matchesForCurrentHost:(id *)a6 matchesForAssociatedDomains:(id *)a7;
- (id)_relatedCredentialMatchesToUpdateForUser:(id)a3 protectionSpace:(id)a4 oldSavedAccount:(id *)a5 matchesForCurrentHost:(id *)a6 matchesForAssociatedDomains:(id *)a7 haveExistingCredentialWithSameUsernameAndDifferentPassword:(BOOL *)a8;
- (id)_titleTextForWarning:(id)a3;
- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5;
- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 contact:(id)a6;
- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 partialString:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8;
- (id)completionDBPath;
- (id)feedbackProcessorForAutoFillCorrectionManager:(id)a3;
- (id)formFieldClassificationCorrector:(id)a3 bestAddressBookLabelForControlValue:(id)a4;
- (id)savedAccountFromMatches:(id)a3 completingPartialUserInLoginForm:(id)a4;
- (id)uniqueIDOfContact:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_completePasswordsAppIntroduction;
- (void)_processCorrectionsForFormWithDomain:(id)a3 formMetadata:(id)a4 uniqueIDsOfControlsThatWereAutoFilled:(id)a5;
- (void)_promptToUpdateRelatedCredentials:(id)a3 urlHost:(id)a4 relatedCredentialsHighLevelDomain:(id)a5 webView:(id)a6 completionHandler:(id)a7;
- (void)_showCreditCardPromptForWebView:(id)a3 creditCard:(id)a4 completionHandler:(id)a5;
- (void)_showPasswordPromptForWebView:(id)a3 formType:(unint64_t)a4 username:(id)a5 host:(id)a6 hasCredentialForCurrentHost:(BOOL)a7 existingCredentialMatchesForCurrentHost:(id)a8 otherSubdomainCredentialMatches:(id)a9 haveExistingCredentialWithSameUsernameAndDifferentPassword:(BOOL)a10 completionHandler:(id)a11;
- (void)_showPromptToSaveCreditCardSecurityCodeForWebView:(id)a3 cardNumber:(id)a4 securityCode:(id)a5 completionHandler:(id)a6;
- (void)_warnAboutWeakPasswordIfNecessaryWithWebView:(id)a3 savedAccount:(id)a4 protectionSpace:(id)a5;
- (void)clearAllFormCredentials;
- (void)dealloc;
- (void)didFillFieldWithGeneratedPassword:(id)a3 inFrame:(id)a4 webView:(id)a5;
- (void)gatherAutoFillDisplayDataWithTextField:(id)a3 displayedInQuickType:(BOOL)a4 prefix:(id)a5 contact:(id)a6 completionHandler:(id)a7;
- (void)gatherValuesForForm:(id)a3 focusedTextFieldMetadata:(id)a4 inFrame:(id)a5 multiRoundAutoFillManager:(id)a6 completionHandler:(id)a7;
- (void)performWhenReady:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)saveCompletionDBSoon;
- (void)saveUnsubmittedGeneratedPasswordInFrame:(id)a3 form:(id)a4 context:(id)a5 closingWebView:(BOOL)a6;
- (void)saveUser:(id)a3 password:(id)a4 forURL:(id)a5 inContext:(id)a6 andPromptToUpdateRelatedCredentialsWithWebView:(id)a7;
- (void)setGeneratedPassword:(id)a3;
- (void)setLastFilledCreditCardData:(id)a3;
- (void)setPreviouslyFilledVirtualCardNumbers:(id)a3;
- (void)setShouldAutoFillFromAddressBook:(BOOL)a3;
- (void)setShouldAutoFillFromCreditCardData:(BOOL)a3;
- (void)setShouldAutoFillPasswords:(BOOL)a3;
- (void)showPasswordSavedPromptForSavedAccount:(id)a3 webView:(id)a4;
- (void)textDidChangeInForm:(id)a3 inWebView:(id)a4 frame:(id)a5 context:(id)a6;
@end

@implementation WBUFormDataController

- (WBUFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBUFormDataController;
  v3 = [(WBUFormDataController *)&v8 initWithAggressiveKeychainCaching:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F53C50] sharedConnection];
    if (objc_opt_respondsToSelector()) {
      [v4 registerObserver:v3];
    }
    else {
      [v4 addObserver:v3];
    }
    v3->_cachedAutoFillRestrictionValue = [v4 BOOLRestrictionForFeature:*MEMORY[0x263F53A30]];
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v3 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];

    v6 = v3;
  }

  return v3;
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_cachedAutoFillRestrictionValue = [v5 BOOLRestrictionForFeature:*MEMORY[0x263F53A30]];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_cachedAutoFillRestrictionValue = [v5 BOOLRestrictionForFeature:*MEMORY[0x263F53A30]];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  if (objc_opt_respondsToSelector()) {
    [v3 unregisterObserver:self];
  }
  else {
    [v3 removeObserver:self];
  }
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)WBUFormDataController;
  [(WBUFormDataController *)&v5 dealloc];
}

- (id)completionDBPath
{
  if (SafariCompletionsDBPath_onceToken != -1) {
    dispatch_once(&SafariCompletionsDBPath_onceToken, &__block_literal_global_562);
  }
  v2 = (void *)SafariCompletionsDBPath_path;
  return v2;
}

- (void)saveCompletionDBSoon
{
  if (!self->_savePending)
  {
    self->_savePending = 1;
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = *MEMORY[0x263F1D108];
    v3 = (void *)*MEMORY[0x263F1D020];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__WBUFormDataController_saveCompletionDBSoon__block_invoke;
    v12[3] = &unk_2643F0388;
    v12[4] = &v13;
    uint64_t v4 = [v3 beginBackgroundTaskWithName:@"AutofillCompletionDBWrite" expirationHandler:v12];
    v14[3] = v4;
    objc_super v5 = [(WBUFormDataController *)self allFormDataForSaving];
    self->_savePending = 0;
    v6 = dispatch_get_global_queue(-2, 0);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__WBUFormDataController_saveCompletionDBSoon__block_invoke_2;
    v8[3] = &unk_2643F03B0;
    id v9 = v5;
    v10 = self;
    v11 = &v13;
    id v7 = v5;
    dispatch_async(v6, v8);

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __45__WBUFormDataController_saveCompletionDBSoon__block_invoke(uint64_t a1)
{
  NSLog(&cfstr_BackgroundTask.isa);
  v2 = (void *)*MEMORY[0x263F1D020];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return [v2 endBackgroundTask:v3];
}

uint64_t __45__WBUFormDataController_saveCompletionDBSoon__block_invoke_2(uint64_t a1)
{
  v2 = NSURL;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) completionDBPath];
  objc_super v5 = [v2 fileURLWithPath:v4];
  [v3 writeToURL:v5 atomically:1];

  v6 = (void *)*MEMORY[0x263F1D020];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return [v6 endBackgroundTask:v7];
}

+ (id)_meCard
{
  v2 = (void *)_meCard_me;
  if (!_meCard_me)
  {
    uint64_t v3 = objc_alloc_init(_WBUDynamicMeCard);
    uint64_t v4 = (void *)_meCard_me;
    _meCard_me = (uint64_t)v3;

    v2 = (void *)_meCard_me;
  }
  return v2;
}

+ (id)valueStringForMatch:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stringValue];
  if (!v4)
  {
    uint64_t v4 = [v3 dateValue];

    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F08790]);
      [v5 setLocalizedDateFormatFromTemplate:@"dMy"];
      v6 = [v3 dateValue];
      uint64_t v4 = [v5 stringFromDate:v6];
    }
  }

  return v4;
}

- (void)gatherAutoFillDisplayDataWithTextField:(id)a3 displayedInQuickType:(BOOL)a4 prefix:(id)a5 contact:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke;
  v24[3] = &unk_2643F0428;
  id v16 = v15;
  id v28 = v16;
  id v17 = v12;
  id v25 = v17;
  v26 = self;
  id v18 = v13;
  id v27 = v18;
  BOOL v29 = a4;
  uint64_t v19 = MEMORY[0x21D4A5780](v24);
  v20 = (void *)v19;
  if (v14)
  {
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v14);
  }
  else if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
  {
    v21 = [(id)objc_opt_class() _meCard];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_4;
    v22[3] = &unk_2643F0450;
    v22[4] = self;
    id v23 = v20;
    [v21 performWhenReady:v22];
  }
  else
  {
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
}

void __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 56))
  {
    uint64_t v4 = [off_2643EFD90 specifierForControl:*(void *)(a1 + 32)];
    id v5 = [*(id *)(a1 + 32) ancestorFrameURLs];
    v6 = [v5 firstObject];

    uint64_t v7 = [*(id *)(a1 + 40) matchesForControl:*(void *)(a1 + 32) atURL:v6 matchingPartialString:*(void *)(a1 + 48) autoFillDataType:0 contact:v3 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:0];
    objc_super v8 = [MEMORY[0x263EFF9C0] set];
    if (*(unsigned char *)(a1 + 64))
    {
      id v9 = [v4 property];
      char v10 = [v9 isEqualToString:@"Address"];
    }
    else
    {
      char v10 = 0;
    }
    uint64_t v11 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_2;
    v15[3] = &unk_2643F0400;
    char v18 = v10;
    v15[4] = *(void *)(a1 + 40);
    id v12 = v3;
    char v19 = *(unsigned char *)(a1 + 64);
    id v16 = v12;
    id v17 = v8;
    id v13 = v8;
    id v14 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v15);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);
  }
}

WBUAutoFillDisplayData *__118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = [*(id *)(a1 + 32) cascadingAddressMatchesForMatch:v3 contact:*(void *)(a1 + 40)];
  }
  else
  {
    v13[0] = v3;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  v6 = v5;
  if (*(unsigned char *)(a1 + 57))
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_3;
    v12[3] = &unk_2643F03D8;
    v12[4] = *(void *)(a1 + 32);
    uint64_t v7 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v12);
    if ([*(id *)(a1 + 48) containsObject:v7])
    {

      objc_super v8 = 0;
      goto LABEL_9;
    }
    [*(id *)(a1 + 48) addObject:v7];
  }
  id v9 = [WBUAutoFillDisplayData alloc];
  char v10 = [v4 label];
  objc_super v8 = [(WBUAutoFillDisplayData *)v9 initWithLabel:v10 fillMatches:v6];

LABEL_9:
  return v8;
}

id __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() valueStringForMatch:v2];

  return v3;
}

void __118__WBUFormDataController_gatherAutoFillDisplayDataWithTextField_displayedInQuickType_prefix_contact_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) me];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_addressBookMatchesForFullNameForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFEA20] stringFromContact:v3 style:0];
  uint64_t v6 = [v5 length];
  uint64_t v7 = (void *)MEMORY[0x263F663F0];
  if (v6)
  {
    objc_super v8 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v5 property:*MEMORY[0x263F663F0] key:0 identifier:0];
    [v4 addObject:v8];
  }
  id v9 = [MEMORY[0x263EFEA20] stringFromContact:v3 style:1];
  if ([v9 length])
  {
    char v10 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v9 property:*v7 key:0 identifier:0];
    [v4 addObject:v10];
  }
  if ([v4 count]) {
    uint64_t v11 = v4;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)_addressBookMatchesForGivenNameForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 givenName];
  uint64_t v6 = [v5 length];
  uint64_t v7 = (void *)MEMORY[0x263F663D8];
  if (v6)
  {
    objc_super v8 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v5 property:*MEMORY[0x263F663D8] key:0 identifier:0];
    [v4 addObject:v8];
  }
  id v9 = [v3 phoneticGivenName];
  if ([v9 length])
  {
    char v10 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v9 property:*v7 key:0 identifier:0];
    [v4 addObject:v10];
  }
  if ([v4 count]) {
    uint64_t v11 = v4;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)_addressBookMatchesForMiddleNameForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 middleName];
  uint64_t v6 = [v5 length];
  uint64_t v7 = (void *)MEMORY[0x263F663E8];
  if (v6)
  {
    objc_super v8 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v5 property:*MEMORY[0x263F663E8] key:0 identifier:0];
    [v4 addObject:v8];
  }
  id v9 = [v3 phoneticMiddleName];
  if ([v9 length])
  {
    char v10 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v9 property:*v7 key:0 identifier:0];
    [v4 addObject:v10];
  }
  if ([v4 count]) {
    uint64_t v11 = v4;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)_addressBookMatchesForFamilyNameForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 familyName];
  uint64_t v6 = [v5 length];
  uint64_t v7 = (void *)MEMORY[0x263F663E0];
  if (v6)
  {
    objc_super v8 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v5 property:*MEMORY[0x263F663E0] key:0 identifier:0];
    [v4 addObject:v8];
  }
  id v9 = [v3 phoneticFamilyName];
  if ([v9 length])
  {
    char v10 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v9 property:*v7 key:0 identifier:0];
    [v4 addObject:v10];
  }
  if ([v4 count]) {
    uint64_t v11 = v4;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(WBUFormDataController *)self me];
  id v12 = [(WBUFormDataController *)self addressBookMatchesForProperty:v10 key:v9 label:v8 contact:v11];

  return v12;
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 partialString:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  return [(WBUFormDataController *)self addressBookMatchesForProperty:a3 key:a4 label:a5 contact:a7];
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 contact:(id)a6
{
  v51[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v42 = a5;
  id v12 = a6;
  if ([v10 isEqualToString:*MEMORY[0x263F663F0]])
  {
    uint64_t v13 = [(WBUFormDataController *)self _addressBookMatchesForFullNameForContact:v12];
LABEL_9:
    id v14 = (void *)v13;
    goto LABEL_10;
  }
  if ([v10 isEqualToString:*MEMORY[0x263F663D8]])
  {
    uint64_t v13 = [(WBUFormDataController *)self _addressBookMatchesForGivenNameForContact:v12];
    goto LABEL_9;
  }
  if ([v10 isEqualToString:*MEMORY[0x263F663E8]])
  {
    uint64_t v13 = [(WBUFormDataController *)self _addressBookMatchesForMiddleNameForContact:v12];
    goto LABEL_9;
  }
  if ([v10 isEqualToString:*MEMORY[0x263F663E0]])
  {
    uint64_t v13 = [(WBUFormDataController *)self _addressBookMatchesForFamilyNameForContact:v12];
    goto LABEL_9;
  }
  id v16 = [(id)objc_opt_class() _meCard];
  id v17 = [v16 valueForProperty:v10 contact:v12];

  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __73__WBUFormDataController_addressBookMatchesForProperty_key_label_contact___block_invoke;
      v47[3] = &unk_2643F0478;
      v47[4] = self;
      id v41 = v10;
      id v18 = v10;
      id v48 = v18;
      id v40 = v11;
      id v49 = v11;
      v38 = v17;
      char v19 = objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v47);
      id v14 = [MEMORY[0x263EFF980] array];
      id v39 = v12;
      v20 = [(WBUFormDataController *)self preferredIdentifierForProperty:v18 withContact:v12];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v50 count:16];
      id v23 = v42;
      if (!v22) {
        goto LABEL_29;
      }
      uint64_t v24 = v22;
      uint64_t v25 = *(void *)v44;
      while (1)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v21);
          }
          id v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v28 = [v27 label];
          if ([v23 isEqualToString:v28])
          {

LABEL_24:
            [v14 insertObject:v27 atIndex:0];
            continue;
          }
          if ([v20 length])
          {
            BOOL v29 = [v27 identifier];
            int v30 = [v29 isEqualToString:v20];

            id v23 = v42;
            if (v30) {
              goto LABEL_24;
            }
          }
          else
          {
          }
          [v14 addObject:v27];
        }
        uint64_t v24 = [v21 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (!v24)
        {
LABEL_29:

          id v11 = v40;
          id v10 = v41;
          id v17 = v38;
          id v12 = v39;
          goto LABEL_38;
        }
      }
    }
    id v31 = v12;
    id v32 = objc_alloc(MEMORY[0x263EFF8F0]);
    v33 = (void *)[v32 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = v11;
      v35 = v17;
      [v33 dateFromComponents:v17];
    }
    else
    {
      v35 = v17;
      id v34 = v11;
      +[WBSFormDataController stringWithAddressBookValue:v17 key:v11];
    v36 = };
    if (v36)
    {
      v37 = (void *)[objc_alloc((Class)off_2643EFD48) initWithValue:v36 property:v10 key:v34 identifier:&stru_26CC74200];
      v51[0] = v37;
      id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
    }
    else
    {
      id v14 = (void *)MEMORY[0x263EFFA68];
    }

    id v11 = v34;
    id v12 = v31;
    id v17 = v35;
  }
  else
  {
    id v14 = 0;
  }
LABEL_38:

LABEL_10:
  return v14;
}

id __73__WBUFormDataController_addressBookMatchesForProperty_key_label_contact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  id v5 = [(id)objc_opt_class() contactKeyForString:*(void *)(a1 + 40)];
  int v6 = [v5 isEqualToString:*MEMORY[0x263EFE010]];

  if (v6)
  {
    id v7 = v4;
    id v8 = [v7 service];
    id v9 = [v8 stringByAppendingString:@"Instant"];

    if ([v9 isEqualToString:*(void *)(a1 + 48)])
    {
      id v10 = [v7 username];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v7 = +[_WBUDynamicMeCard _contactObjectComponentForString:*(void *)(a1 + 48)];
    id v10 = +[WBUFormDataController _stringForCNContactObject:v4 contactObjectComponent:v7];
  }

  if (v10)
  {
    id v11 = objc_alloc((Class)off_2643EFD48);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v14 = [v3 identifier];
    id v15 = [v3 label];
    id v16 = (void *)[v11 initWithValue:v10 property:v13 key:v12 identifier:v14 label:v15];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)_stringForCNContactObject:(id)a3 contactObjectComponent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v5 valueForKey:v6];
        if ([v10 length]) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v8 = v11;
      }
      else
      {
        id v8 = 0;
      }
      goto LABEL_6;
    }
    id v7 = [v5 stringValue];
  }
  id v8 = v7;
LABEL_6:

  return v8;
}

- (BOOL)shouldAutoGeneratePasswordsForURL:(id)a3 inWebView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((![MEMORY[0x263F662A0] isPasswordsAppInstalled]
     || [MEMORY[0x263F662A0] isAutomaticStrongPasswordsEnabled])
    && [(WBUFormDataController *)self _shouldSaveUsernamesAndPasswordsForURL:v6 inWebView:v7])
  {
    BOOL v8 = ([MEMORY[0x263F662A0] isPasswordsAppInstalled] & 1) != 0
      || +[WBUFormDataController keychainSyncEnabled];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)keychainSyncEnabled
{
  id v2 = [MEMORY[0x263F662C8] sharedMonitor];
  char v3 = [v2 isKeychainSyncEnabled];

  return v3;
}

- (BOOL)whiteListAllowsURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[WBUFormAutoFillWhiteList sharedAutoFillWhiteList];
  char v5 = [v4 allowsURL:v3];

  return v5;
}

- (BOOL)_shouldSaveUsernamesAndPasswordsForURL:(id)a3 inWebView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5C9D8] shouldShowLoginIntroduction])
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
    if ([(WBUFormDataController *)self shouldAllowPasswordAutoFillOnURL:v6 allowExternalCredentials:0])
    {
      BOOL v8 = (objc_msgSend(v7, "webui_privateBrowsingEnabled") & 1) == 0
        && [(WBUFormDataController *)self whiteListAllowsURL:v6];
    }
  }

  return v8;
}

- (BOOL)_shouldSaveCreditCardDataInWebView:(id)a3 frame:(id)a4
{
  id v6 = a3;
  if ([(WBUFormDataController *)self shouldAutoFillFromCreditCardDataInFrame:a4])
  {
    int v7 = objc_msgSend(v6, "webui_privateBrowsingEnabled") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)shouldAutoFillFromPreviousData
{
  return 0;
}

- (BOOL)shouldAutoFillPasswords
{
  id v2 = [MEMORY[0x263F66550] sharedFeatureManager];
  char v3 = [v2 shouldAutoFillPasswordsFromKeychain];

  return v3;
}

- (void)setShouldAutoFillPasswords:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F66550] sharedFeatureManager];
  [v4 setShouldAutoFillPasswordsFromKeychain:v3];
}

- (BOOL)shouldAutoFillFromCreditCardData
{
  BOOL v3 = +[WBUFeatureManager webui_sharedFeatureManager];
  if ([v3 isAutoFillAvailable]
    && [v3 isCreditCardStorageAvailable]
    && self->_cachedAutoFillRestrictionValue != 2)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AutoFillCreditCards", (CFStringRef)[MEMORY[0x263F66550] autoFillPreferencesDomain], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      char v4 = AppBooleanValue != 0;
    }
    else {
      char v4 = [MEMORY[0x263F66550] defaultValueForPasswordAndCreditCardAutoFill];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)setShouldAutoFillFromCreditCardData:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"AutoFillCreditCards", *v3, (CFStringRef)[MEMORY[0x263F66550] autoFillPreferencesDomain]);
  char v4 = (void *)MEMORY[0x263F66550];
  [v4 autoFillPreferencesDidChange];
}

+ (BOOL)contactStoreHasMeCard:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
  {
    char v4 = objc_msgSend(v3, "_ios_meContactWithKeysToFetch:error:", MEMORY[0x263EFFA68], 0);
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldAutoFillFromAddressBook
{
  id v3 = +[WBUFeatureManager webui_sharedFeatureManager];
  int v4 = [v3 isAutoFillAvailable];

  if (!v4 || self->_cachedAutoFillRestrictionValue == 2) {
    return 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x263F665E8], (CFStringRef)[MEMORY[0x263F66550] autoFillPreferencesDomain], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    return AppBooleanValue != 0;
  }
  if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] != 3) {
    return 1;
  }
  BOOL v8 = [(id)objc_opt_class() _meCard];
  char v5 = [v8 meCardExists];

  return v5;
}

- (void)setShouldAutoFillFromAddressBook:(BOOL)a3
{
  if (a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  }
  else {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x263F665E8], *v3, (CFStringRef)[MEMORY[0x263F66550] autoFillPreferencesDomain]);
  int v4 = (void *)MEMORY[0x263F66550];
  [v4 autoFillPreferencesDidChange];
}

- (BOOL)shouldAutoFillFromCreditCardDataInFrame:(id)a3
{
  id v4 = a3;
  if ([(WBUFormDataController *)self shouldAutoFillFromCreditCardData]) {
    BOOL v5 = [(WBUFormDataController *)self mayFillCreditCardDataInFrame:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)mayFillCreditCardDataInFrame:(id)a3
{
  return frameHasTrustedCertificateChain(a3);
}

- (BOOL)mayPreFillInFrame:(id)a3
{
  return frameHasTrustedCertificateChain(a3);
}

+ (id)localizedLowercaseContactProperty:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F663F0]])
  {
    id v4 = _WBSLocalizedString();
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x263EFE9F8];
    id v6 = +[WBSFormDataController contactKeyForString:v3];
    int v7 = [v5 localizedStringForKey:v6];
    id v4 = [v7 localizedLowercaseString];
  }
  return v4;
}

- (id)uniqueIDOfContact:(id)a3
{
  return (id)[a3 identifier];
}

+ (BOOL)contactIsMe:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _meCard];
  BOOL v5 = [v4 me];
  char v6 = [v5 isEqual:v3];

  return v6;
}

- (CNContact)me
{
  id v2 = [(id)objc_opt_class() _meCard];
  id v3 = [v2 me];

  return (CNContact *)v3;
}

- (void)_applicationWillEnterForeground:(id)a3
{
}

- (id)savedAccountFromMatches:(id)a3 completingPartialUserInLoginForm:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 userNameElementUniqueID];
  if ([v7 length])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    BOOL v8 = [v6 controls];
    id v9 = (void *)[v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v13 = [v12 uniqueID];
          int v14 = [v13 isEqualToString:v7];

          if (v14)
          {
            id v9 = [v12 value];
            goto LABEL_12;
          }
        }
        id v9 = (void *)[v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        if (objc_msgSend(v9, "length", (void)v25))
        {
          id v21 = [v20 user];
          char v22 = objc_msgSend(v21, "safari_hasCaseInsensitivePrefix:", v9);

          if ((v22 & 1) == 0) {
            continue;
          }
        }
        id v23 = [v20 savedAccount];
        goto LABEL_26;
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      id v23 = 0;
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v23 = 0;
  }
LABEL_26:

  return v23;
}

- (BOOL)shouldAllowPasswordAutoFillOnURL:(id)a3 allowExternalCredentials:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    int v7 = [MEMORY[0x263F66550] sharedFeatureManager];
    if ([v7 shouldAutoFillPasswords])
    {
      BOOL v8 = [v6 host];
      char v9 = [off_2643EFDC0 mayAutoFillPasswordOnHost:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    if (![(WBUFormDataController *)self shouldAutoFillPasswords])
    {
      char v9 = 0;
      goto LABEL_9;
    }
    int v7 = [v6 host];
    char v9 = [off_2643EFDC0 mayAutoFillPasswordOnHost:v7];
  }

LABEL_9:
  return v9;
}

- (void)gatherValuesForForm:(id)a3 focusedTextFieldMetadata:(id)a4 inFrame:(id)a5 multiRoundAutoFillManager:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [v12 type];
  if (v17 <= 5
    && ((1 << v17) & 0x32) != 0
    && [(WBUFormDataController *)self shouldAutoFillFromAddressBook])
  {
    unint64_t v18 = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
    if (v18 >= 3)
    {
      if (v18 - 3 < 2)
      {
        v20 = [(id)objc_opt_class() _meCard];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __122__WBUFormDataController_gatherValuesForForm_focusedTextFieldMetadata_inFrame_multiRoundAutoFillManager_completionHandler___block_invoke;
        v21[3] = &unk_2643F04A0;
        v21[4] = self;
        id v22 = v12;
        id v23 = v14;
        id v24 = v15;
        id v25 = v16;
        [v20 performWhenReady:v21];
      }
    }
    else
    {
      char v19 = [v13 addressBookLabel];
      (*((void (**)(id, void, BOOL))v16 + 2))(v16, MEMORY[0x263EFFA78], v19 != 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }
}

void __122__WBUFormDataController_gatherValuesForForm_focusedTextFieldMetadata_inFrame_multiRoundAutoFillManager_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = objc_msgSend(*(id *)(a1 + 48), "webui_URL");
  id v5 = +[WBSFormDataController domainFromURL:v4];

  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = [*(id *)(a1 + 32) me];
  id v8 = [v2 valuesForContactFormWithMetadata:v3 inDomain:v5 matches:0 multiRoundAutoFillManager:v6 contact:v7];

  [v8 count];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)clearAllFormCredentials
{
  id v2 = [MEMORY[0x263EFC618] sharedCredentialStorage];
  uint64_t v3 = objc_msgSend(v2, "safari_allSafariCredentials");
  id v4 = (void *)[v3 copy];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WBUFormDataController_clearAllFormCredentials__block_invoke;
  v6[3] = &unk_2643F04F0;
  id v7 = v2;
  id v5 = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __48__WBUFormDataController_clearAllFormCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__WBUFormDataController_clearAllFormCredentials__block_invoke_2;
  v7[3] = &unk_2643F04C8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __48__WBUFormDataController_clearAllFormCredentials__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v8 = *MEMORY[0x263EFC5B0];
  v9[0] = MEMORY[0x263EFFA88];
  id v5 = NSDictionary;
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 removeCredential:v6 forProtectionSpace:v4 options:v7];
}

- (void)saveUnsubmittedGeneratedPasswordInFrame:(id)a3 form:(id)a4 context:(id)a5 closingWebView:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v10 = a4;
  id v11 = a5;
  v33 = v10;
  if ([v10 usesGeneratedPassword] && objc_msgSend(v10, "type") == 5)
  {
    id v30 = v11;
    long long v31 = objc_msgSend(v32, "webui_URL");
    id v48 = 0;
    id v47 = 0;
    [(WBUFormDataController *)self willSubmitFormWithCredentials:v10 shouldPreferAnnotatedCredentials:0 atURL:v31 username:&v48 password:&v47 inContext:v11];
    uint64_t v35 = (__CFString *)v48;
    id v12 = v47;
    if ([v12 length])
    {
      id v13 = v35;
      if (!v35) {
        id v13 = &stru_26CC74200;
      }
      uint64_t v35 = v13;
      long long v28 = objc_msgSend(MEMORY[0x263EFC620], "safari_HTMLFormProtectionSpaceForURL:", v31);
      id v34 = [MEMORY[0x263F663B0] sharedStore];
      long long v29 = [MEMORY[0x263F663A8] criteriaForExactFQDNPasswordMatchesOfURL:v31];
      id v14 = (void *)[objc_alloc(MEMORY[0x263F663C0]) initWithString:v35 matchingType:1];
      [v29 setUserNameQuery:v14];

      uint64_t v41 = 0;
      id v42 = &v41;
      uint64_t v43 = 0x3032000000;
      long long v44 = __Block_byref_object_copy_;
      long long v45 = __Block_byref_object_dispose_;
      id v46 = 0;
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __93__WBUFormDataController_saveUnsubmittedGeneratedPasswordInFrame_form_context_closingWebView___block_invoke;
      v40[3] = &unk_2643F0518;
      v40[4] = &v41;
      [v34 getSavedAccountsMatchingCriteria:v29 withSynchronousCompletionHandler:v40];
      long long v27 = [(id)v42[5] exactMatches];
      if ([v27 count])
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v15 = v27;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v49 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v15);
              }
              char v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              v20 = [v19 password];
              char v21 = [v20 isEqualToString:v12];

              if (v21)
              {
                id v22 = objc_alloc_init(MEMORY[0x263F66390]);
                id v23 = [v19 savedAccount];
                [v22 setSavedAccount:v23];

                [v22 setUser:v35];
                [v22 setPassword:v12];
                [v34 changeSavedAccountWithRequest:v22];
                id v24 = [MEMORY[0x263F66258] sharedLogger];
                [v24 generatedPasswordDidOverwriteExistingPasswordWithTrigger:v6];
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v49 count:16];
          }
          while (v16);
        }
      }
      else
      {
        id v25 = [v28 host];
        long long v26 = objc_msgSend(v25, "safari_highLevelDomainForPasswordManager");
        id v15 = [v34 saveUser:v35 password:v12 forProtectionSpace:v28 highLevelDomain:v26 groupID:*MEMORY[0x263F66440]];

        [v34 setSavedAccountAsDefault:v15 forProtectionSpace:v28 context:v30];
      }

      _Block_object_dispose(&v41, 8);
    }

    id v11 = v30;
  }
}

void __93__WBUFormDataController_saveUnsubmittedGeneratedPasswordInFrame_form_context_closingWebView___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_showCreditCardPromptForWebView:(id)a3 creditCard:(id)a4 completionHandler:(id)a5
{
  v20[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _WBSLocalizedString();
  id v12 = [(WBUFormDataController *)self _detailTextForPromptToSaveCard:v9];

  id v13 = _WBSLocalizedString();
  id v14 = _WBSLocalizedString();
  id v15 = _WBSLocalizedString();
  v20[0] = v14;
  v20[1] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__WBUFormDataController__showCreditCardPromptForWebView_creditCard_completionHandler___block_invoke;
  v18[3] = &unk_2643F0540;
  id v19 = v8;
  id v17 = v8;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:v10 title:v11 message:v12 cancelButtonTitle:v13 otherButtonTitles:v16 makeFirstButtonSuggestedAction:1 completionHandler:v18];
}

uint64_t __86__WBUFormDataController__showCreditCardPromptForWebView_creditCard_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_detailTextForPromptToSaveCard:(id)a3
{
  id v3 = a3;
  +[WBUFormDataController keychainSyncEnabled];
  uint64_t v4 = [v3 cardSecurityCode];

  [v4 length];
  id v5 = _WBSLocalizedString();
  return v5;
}

- (void)_showPromptToSaveCreditCardSecurityCodeForWebView:(id)a3 cardNumber:(id)a4 securityCode:(id)a5 completionHandler:(id)a6
{
  v18[2] = *MEMORY[0x263EF8340];
  id v7 = a6;
  id v8 = a3;
  id v9 = _WBSLocalizedString();
  +[WBUFormDataController keychainSyncEnabled];
  id v10 = _WBSLocalizedString();
  id v11 = _WBSLocalizedString();
  id v12 = _WBSLocalizedString();
  id v13 = _WBSLocalizedString();
  v18[0] = v12;
  v18[1] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __117__WBUFormDataController__showPromptToSaveCreditCardSecurityCodeForWebView_cardNumber_securityCode_completionHandler___block_invoke;
  v16[3] = &unk_2643F0540;
  id v17 = v7;
  id v15 = v7;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:v8 title:v9 message:v10 cancelButtonTitle:v11 otherButtonTitles:v14 makeFirstButtonSuggestedAction:1 completionHandler:v16];
}

uint64_t __117__WBUFormDataController__showPromptToSaveCreditCardSecurityCodeForWebView_cardNumber_securityCode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_webView:(id)a3 willSubmitFormContainingCreditCardData:(id)a4 fromFrame:(id)a5 submissionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(WBUFormDataController *)self _shouldSaveCreditCardDataInWebView:v10 frame:a5])
  {
    id v13 = [v11 cardNumber];
    id v14 = +[WBUCreditCardDataController sharedCreditCardDataController];
    id v15 = [v14 existingCardWithNumber:v13];
    uint64_t v16 = self->_previouslyFilledVirtualCardNumbers;
    if (v15)
    {
      [v14 tellWalletThatExistingCardWasFilledInForm:v15 previouslyFilledVirtualCardNumbers:v16];
      id v17 = [v11 cardSecurityCode];
      if ([v17 length])
      {
        [v15 cardSecurityCode];
        long long v26 = v14;
        id v18 = v12;
        id v19 = v16;
        char v21 = v20 = v13;
        uint64_t v22 = [v21 length];

        id v13 = v20;
        uint64_t v16 = v19;
        id v12 = v18;
        id v14 = v26;

        if (!v22) {
          goto LABEL_5;
        }
      }
      else
      {
      }
      BOOL v24 = 1;
      id v23 = [v15 creditCardDataByMergingOtherAttributesBesidesCardNumberFromCard:v11 mergeSecurityCode:1];

      [v14 replaceCreditCardData:v15 withCard:v23];
      goto LABEL_9;
    }
LABEL_5:
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke;
    v27[3] = &unk_2643F05B8;
    id v28 = v14;
    id v23 = v11;
    id v29 = v23;
    id v30 = self;
    id v34 = v12;
    BOOL v35 = v15 != 0;
    id v31 = v15;
    id v32 = v10;
    id v33 = v13;
    [v28 isVirtualCard:v23 previouslyFilledVirtualCardNumbers:v16 completion:v27];

    BOOL v24 = 0;
LABEL_9:

    id v11 = v23;
    goto LABEL_10;
  }
  BOOL v24 = 1;
LABEL_10:

  return v24;
}

void __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) sendCardholderNameEnteredInFormToWalletIfNecessary:*(void *)(a1 + 40) lastFilledVirtualCardData:*(void *)(*(void *)(a1 + 48) + 192)];
    if (*(void *)(a1 + 80))
    {
      id v3 = *(void **)(a1 + 80);
      uint64_t v4 = MEMORY[0x263EF83A0];
      dispatch_async(v4, v3);
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_2;
    v7[3] = &unk_2643F0590;
    char v15 = *(unsigned char *)(a1 + 88);
    id v8 = *(id *)(a1 + 56);
    id v5 = *(id *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 48);
    id v14 = v5;
    uint64_t v9 = v6;
    id v10 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 72);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 88))
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_4;
    v11[3] = &unk_2643F0568;
    uint64_t v9 = *(void *)(a1 + 64);
    id v12 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 80);
    [v7 _showCreditCardPromptForWebView:v8 creditCard:v9 completionHandler:v11];

    uint64_t v6 = v12;
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) promptToSaveSecurityCode])
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [*(id *)(a1 + 64) cardSecurityCode];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_3;
    v15[3] = &unk_2643F0568;
    id v16 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 80);
    [v2 _showPromptToSaveCreditCardSecurityCodeForWebView:v3 cardNumber:v4 securityCode:v5 completionHandler:v15];

    uint64_t v6 = v16;
LABEL_5:

    return;
  }
  id v10 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
  v10();
}

void __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) cardNumber];
  id v9 = [v4 existingCardWithNumber:v5];

  [*(id *)(a1 + 40) setPromptToSaveSecurityCode:a2 != 2];
  BOOL v6 = a2 == 0;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v9 creditCardDataByMergingOtherAttributesBesidesCardNumberFromCard:*(void *)(a1 + 40) mergeSecurityCode:v6];
  [v7 replaceCreditCardData:v9 withCard:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __101__WBUFormDataController__webView_willSubmitFormContainingCreditCardData_fromFrame_submissionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    [*(id *)(a1 + 32) neverSaveCreditCardData:*(void *)(a1 + 40)];
  }
  else if (!a2)
  {
    [*(id *)(a1 + 32) saveCreditCardDataIfAllowed:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (id)_credentialMatchesEligibleForUpdateForURL:(id)a3 username:(id)a4 oldPassword:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v22 = a4;
  id v9 = a5;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  char v21 = v8;
  id v10 = [MEMORY[0x263F663A8] criteriaForExactFQDNPasswordMatchesOfURL:v8];
  id v11 = (void *)[objc_alloc(MEMORY[0x263F663C0]) initWithString:v22 matchingType:1];
  [v10 setUserNameQuery:v11];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__WBUFormDataController__credentialMatchesEligibleForUpdateForURL_username_oldPassword___block_invoke;
  v27[3] = &unk_2643F0518;
  void v27[4] = &v28;
  [(WBUFormDataController *)self getSavedAccountMatchesWithCriteria:v10 synchronously:1 completionHandler:v27];
  id v12 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = (id)v29[5];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v18 = [v17 password];
        int v19 = [v18 isEqualToString:v9];

        if (v19) {
          [v12 addObject:v17];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(&v28, 8);
  return v12;
}

void __88__WBUFormDataController__credentialMatchesEligibleForUpdateForURL_username_oldPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 exactMatches];
  uint64_t v4 = [v3 potentialMatches];

  uint64_t v5 = [v8 arrayByAddingObjectsFromArray:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)_webView:(id)a3 saveUsernameAndPasswordForURL:(id)a4 formType:(unint64_t)a5 inFrame:(id)a6 username:(id)a7 password:(id)a8 isGeneratedPassword:(BOOL)a9 confirmOverwritingCurrentPassword:(BOOL)a10 inContext:(id)a11 submissionHandler:(id)a12
{
  v43[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  id v21 = a11;
  id v22 = a12;
  BOOL v23 = [(WBUFormDataController *)self _shouldSaveUsernamesAndPasswordsForURL:v18 inWebView:v17];
  BOOL v24 = 1;
  if (a5 && v23)
  {
    if (![MEMORY[0x263F662A0] isPasswordsAppInstalled]) {
      goto LABEL_11;
    }
    accountSavedWithGeneratedPassword = self->_accountSavedWithGeneratedPassword;
    if (!accountSavedWithGeneratedPassword) {
      goto LABEL_11;
    }
    long long v26 = [(WBSSavedAccount *)accountSavedWithGeneratedPassword user];
    int v40 = [v19 isEqualToString:v26];

    long long v38 = self->_accountSavedWithGeneratedPassword;
    long long v27 = objc_msgSend(MEMORY[0x263EFC620], "safari_HTMLFormProtectionSpaceForURL:", v18);
    int v39 = [(WBSSavedAccount *)v38 hasProtectionSpace:v27];

    uint64_t v28 = [(WBSSavedAccount *)self->_accountSavedWithGeneratedPassword password];
    char v29 = [v28 isEqualToString:v20];

    if (!v40) {
      goto LABEL_11;
    }
    if (v39 && (v29 & 1) == 0)
    {
      uint64_t v30 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C355000, v30, OS_LOG_TYPE_DEFAULT, "Updating password of account saved after user edited a strong password", buf, 2u);
      }
      [(WBUFormDataController *)self _updatePasswordOfPreviouslySavedAccount:self->_accountSavedWithGeneratedPassword withPasswordEditedByUser:v20];
      id v31 = [MEMORY[0x263F08A00] defaultCenter];
      id v32 = self->_accountSavedWithGeneratedPassword;
      id v42 = @"savedAccount";
      v43[0] = v32;
      BOOL v24 = 1;
      id v33 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
      [v31 postNotificationName:@"formDataControllerDidUpdatePasswordForPreviouslySavedAccount" object:self userInfo:v33];

      id v34 = self->_accountSavedWithGeneratedPassword;
      self->_accountSavedWithGeneratedPassword = 0;
    }
    else
    {
LABEL_11:
      uint64_t v35 = [v19 length];
      uint64_t v36 = 1;
      if (!a10) {
        uint64_t v36 = 2;
      }
      if (!a9) {
        uint64_t v36 = 0;
      }
      if (!v35) {
        uint64_t v36 = 3;
      }
      BOOL v24 = [(WBUFormDataController *)self _saveUser:v19 password:v20 isGeneratedPassword:a9 forURL:v18 inContext:v21 formType:a5 promptingPolicy:v36 webView:v17 completionHandler:v22];
    }
  }

  return v24;
}

- (BOOL)_updatePasswordOfPreviouslySavedAccount:(id)a3 withPasswordEditedByUser:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F66390];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setSavedAccount:v7];

  [v8 setPassword:v6];
  id v9 = [MEMORY[0x263F663B0] sharedStore];
  [v9 changeSavedAccountWithRequest:v8];

  return 1;
}

- (BOOL)_saveUser:(id)a3 password:(id)a4 isGeneratedPassword:(BOOL)a5 forURL:(id)a6 inContext:(id)a7 formType:(unint64_t)a8 promptingPolicy:(int64_t)a9 webView:(id)a10 completionHandler:(id)a11
{
  BOOL v14 = a5;
  id v70 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v67 = a10;
  id v66 = a11;
  id v20 = objc_msgSend(MEMORY[0x263EFC620], "safari_HTMLFormProtectionSpaceForURL:", v18);
  v69 = [MEMORY[0x263F663B0] sharedStore];
  uint64_t v120 = 0;
  v121 = (id *)&v120;
  uint64_t v122 = 0x3032000000;
  v123 = __Block_byref_object_copy_;
  v124 = __Block_byref_object_dispose_;
  id v125 = 0;
  id v21 = [MEMORY[0x263F663A8] criteriaForExactFQDNPasswordMatchesOfURL:v18];
  [v21 setContext:v19];
  v119[0] = MEMORY[0x263EF8330];
  v119[1] = 3221225472;
  v119[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke;
  v119[3] = &unk_2643F0518;
  v119[4] = &v120;
  [v69 getSavedAccountsMatchingCriteria:v21 withSynchronousCompletionHandler:v119];
  v62 = [v121[5] password];
  v68 = v19;
  unint64_t v59 = a8;
  v61 = self;
  char v118 = 0;
  id v22 = v121;
  id v23 = v121[5];
  id v116 = 0;
  id v117 = v23;
  id v115 = 0;
  v64 = [(WBUFormDataController *)self _relatedCredentialMatchesToUpdateForUser:v70 protectionSpace:v20 oldSavedAccount:&v117 matchesForCurrentHost:&v116 matchesForAssociatedDomains:&v115 haveExistingCredentialWithSameUsernameAndDifferentPassword:&v118];
  objc_storeStrong(v22 + 5, v117);
  id v63 = v116;
  id v65 = v115;
  id v24 = v121[5];
  long long v25 = [v24 password];
  int v26 = [v25 isEqualToString:v17];

  if (v24) {
    int v27 = v26;
  }
  else {
    int v27 = 0;
  }
  if (v27 == 1 && [v70 length])
  {
    id v28 = [MEMORY[0x263F663B0] sharedStore];
    [v28 setSavedAccountAsDefault:v121[5] forProtectionSpace:v20 context:v68];
    BOOL v29 = 1;
LABEL_30:

    goto LABEL_31;
  }
  if ([v17 length] && (objc_msgSend(v17, "safari_looksLikeObscuredPassword") & 1) == 0)
  {
    if (a9 == 3)
    {
      if (v14)
      {
        uint64_t v30 = NSString;
        id v31 = _WBSLocalizedString();
        id v32 = [v18 host];
        id v33 = objc_msgSend(v32, "safari_highLevelDomainFromHost");
        id v34 = objc_msgSend(v30, "stringWithFormat:", v31, v33);

        uint64_t v35 = &stru_26CC74200;
      }
      else
      {
        id v34 = titleTextForSavingNewPassword();
        _WBSLocalizedString();
        uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v103[0] = MEMORY[0x263EF8330];
      v103[1] = 3221225472;
      v103[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2;
      v103[3] = &unk_2643F0680;
      id v104 = v67;
      id v28 = v34;
      id v105 = v28;
      int v40 = v35;
      v106 = v40;
      id v107 = v17;
      BOOL v114 = v14;
      id v113 = v66;
      v108 = v61;
      id v109 = v18;
      id v110 = v69;
      id v111 = v20;
      id v112 = v68;
      [(WBUFormDataController *)v61 bestUsernameSuggestionForUsernamePromptOnURL:v109 inContext:v112 completionHandler:v103];

      BOOL v29 = 0;
      goto LABEL_30;
    }
    id v36 = v121[5];
    uint64_t v37 = [v65 count];
    v97[0] = MEMORY[0x263EF8330];
    v97[1] = 3221225472;
    v97[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_5;
    v97[3] = &unk_2643F06A8;
    v102 = &v120;
    id v56 = v69;
    id v98 = v56;
    id v55 = v70;
    id v99 = v55;
    id v38 = v17;
    id v100 = v38;
    id v39 = v20;
    id v101 = v39;
    v58 = (void *)MEMORY[0x21D4A5780](v97);
    if (!a9) {
      goto LABEL_23;
    }
    if (a9 == 2)
    {
      if (v37 || [v64 count]) {
        goto LABEL_23;
      }
    }
    else if (a9 == 1 && (v36 || v37))
    {
LABEL_23:
      uint64_t v41 = [v18 host];
      char v53 = v118;
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_6;
      v86[3] = &unk_2643F06D0;
      id v94 = v58;
      id v87 = v64;
      id v88 = v56;
      id v89 = v68;
      id v90 = v39;
      BOOL v96 = v36 != 0;
      id v91 = v38;
      id v92 = v65;
      id v93 = v67;
      id v95 = v66;
      LOBYTE(v52) = v53;
      [(WBUFormDataController *)v61 _showPasswordPromptForWebView:v93 formType:v59 username:v55 host:v41 hasCredentialForCurrentHost:v36 != 0 existingCredentialMatchesForCurrentHost:v63 otherSubdomainCredentialMatches:v87 haveExistingCredentialWithSameUsernameAndDifferentPassword:v52 completionHandler:v86];

      BOOL v29 = 0;
LABEL_29:

      id v28 = v98;
      goto LABEL_30;
    }
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x3032000000;
    v84[3] = __Block_byref_object_copy_;
    v84[4] = __Block_byref_object_dispose_;
    id v85 = 0;
    id v42 = [MEMORY[0x263F663A8] criteriaForExactFQDNPasswordMatchesOfURL:v18];
    [v42 setContext:v68];
    id v43 = objc_alloc(MEMORY[0x263F663C0]);
    long long v44 = [(id)objc_opt_class() dontSaveMarker];
    long long v45 = (void *)[v43 initWithString:v44 matchingType:1];
    [v42 setUserNameQuery:v45];

    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_7;
    v78[3] = &unk_2643F0720;
    id v46 = v56;
    id v79 = v46;
    id v57 = v58;
    id v82 = v57;
    v83 = v84;
    id v80 = v39;
    id v47 = v68;
    id v81 = v47;
    [v46 savedAccountsMatchingCriteria:v42 withCompletionHandler:v78];
    BOOL v29 = 1;
    if (v59 == 5 && v62 && [v64 count])
    {
      id v48 = [v18 host];
      v60 = [v64 firstObject];
      v54 = [v60 protectionSpace];
      id v49 = [v54 host];
      uint64_t v50 = objc_msgSend(v49, "safari_highLevelDomainFromHost");
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_9;
      v71[3] = &unk_2643F0748;
      id v75 = v57;
      v77 = v84;
      id v72 = v64;
      id v73 = v46;
      id v74 = v47;
      id v76 = v66;
      [(WBUFormDataController *)v61 _promptToUpdateRelatedCredentials:v55 urlHost:v48 relatedCredentialsHighLevelDomain:v50 webView:v67 completionHandler:v71];

      BOOL v29 = 0;
    }

    _Block_object_dispose(v84, 8);
    goto LABEL_29;
  }
  BOOL v29 = 1;
LABEL_31:

  _Block_object_dispose(&v120, 8);
  return v29;
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 exactMatches];
  id v3 = [v7 firstObject];
  uint64_t v4 = [v3 savedAccount];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(WBUFormAutoFillPrompt);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 112);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3;
  v13[3] = &unk_2643F0658;
  id v10 = *(id *)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 64);
  id v12 = *(void **)(a1 + 72);
  id v20 = v10;
  v13[4] = v11;
  id v14 = v12;
  id v15 = *(id *)(a1 + 56);
  char v21 = *(unsigned char *)(a1 + 112);
  id v16 = *(id *)(a1 + 80);
  id v17 = *(id *)(a1 + 88);
  id v18 = *(id *)(a1 + 96);
  id v19 = *(id *)(a1 + 32);
  [(WBUFormAutoFillPrompt *)v4 showAutoFillPromptForUsernameInWebView:v5 title:v6 message:v8 suggestedUsername:v3 password:v7 isGeneratedPassword:v9 completionHandler:v13];
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v40 = a2;
  if ([v40 length])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void **)(a1 + 56);
    uint64_t v5 = *(void **)(a1 + 64);
    uint64_t v6 = [v5 host];
    uint64_t v7 = objc_msgSend(v6, "safari_highLevelDomainForPasswordManager");
    uint64_t v8 = [v4 saveUser:v40 password:v3 forProtectionSpace:v5 highLevelDomain:v7 groupID:&stru_26CC74200];

    if (*(unsigned char *)(a1 + 96))
    {
      uint64_t v9 = [MEMORY[0x263F66258] sharedLogger];
      [v9 didUseGeneratedPassword];
    }
    id v39 = (void *)[objc_alloc(MEMORY[0x263EFC610]) initWithUser:&stru_26CC74200 password:*(void *)(a1 + 48) persistence:3];
    id v10 = [MEMORY[0x263F663B0] sharedStore];
    uint64_t v11 = [v10 savedAccountWithAllMetadataForURLCredential:v39 protectionSpace:*(void *)(a1 + 64)];

    id v12 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C355000, v12, OS_LOG_TYPE_DEFAULT, "Update existing saved account without a password", buf, 2u);
      }
      [*(id *)(a1 + 56) changeSavedAccount:v11 toUser:v40 password:*(void *)(a1 + 48)];
    }
    else
    {
      if (v13)
      {
        id v19 = v12;
        id v20 = [v8 user];
        char v21 = [*(id *)(a1 + 64) host];
        *(_DWORD *)buf = 138740227;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2117;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_21C355000, v19, OS_LOG_TYPE_DEFAULT, "Setting saved account for user %{sensitive}@ as default for %{sensitive}@", buf, 0x16u);
      }
      [*(id *)(a1 + 56) setSavedAccountAsDefault:v8 forProtectionSpace:*(void *)(a1 + 64) context:*(void *)(a1 + 72)];
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v60 = __Block_byref_object_copy_;
    v61 = __Block_byref_object_dispose_;
    id v62 = 0;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    id v56 = __Block_byref_object_copy_;
    id v57 = __Block_byref_object_dispose_;
    id v58 = 0;
    id v22 = [MEMORY[0x263F663A8] criteriaForExactFQDNPasswordMatchesOfURL:*(void *)(a1 + 40)];
    objc_msgSend(v22, "setOptions:", objc_msgSend(v22, "options") | 3);
    id v23 = *(void **)(a1 + 32);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_204;
    v52[3] = &unk_2643F05E0;
    v52[4] = buf;
    v52[5] = &v53;
    [v23 getSavedAccountMatchesWithCriteria:v22 synchronously:1 completionHandler:v52];
    id v24 = *(void **)(*(void *)&buf[8] + 40);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2_205;
    v50[3] = &unk_2643F0608;
    id v25 = v40;
    id v51 = v25;
    uint64_t v26 = objc_msgSend(v24, "safari_filterObjectsUsingBlock:", v50);
    int v27 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v26;

    id v28 = (void *)v54[5];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3_207;
    v48[3] = &unk_2643F0608;
    id v29 = v25;
    id v49 = v29;
    uint64_t v30 = objc_msgSend(v28, "safari_filterObjectsUsingBlock:", v48);
    id v31 = (void *)v54[5];
    v54[5] = v30;

    if ([*(id *)(*(void *)&buf[8] + 40) count] || objc_msgSend((id)v54[5], "count"))
    {
      if ([*(id *)(*(void *)&buf[8] + 40) count]) {
        [*(id *)(*(void *)&buf[8] + 40) firstObject];
      }
      else {
      id v32 = [(id)v54[5] firstObject];
      }
      id v33 = [v32 host];

      id v34 = *(void **)(a1 + 32);
      uint64_t v35 = [*(id *)(a1 + 40) host];
      id v36 = objc_msgSend(v33, "safari_highLevelDomainFromHost");
      uint64_t v37 = *(void *)(a1 + 80);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_4;
      v41[3] = &unk_2643F0630;
      id v46 = buf;
      id v42 = *(id *)(a1 + 56);
      id v43 = v8;
      id v44 = *(id *)(a1 + 72);
      id v47 = &v53;
      id v45 = *(id *)(a1 + 88);
      [v34 _promptToUpdateRelatedCredentials:v29 urlHost:v35 relatedCredentialsHighLevelDomain:v36 webView:v37 completionHandler:v41];
    }
    else
    {
      uint64_t v38 = *(void *)(a1 + 88);
      if (v38) {
        (*(void (**)(void))(v38 + 16))();
      }
    }

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 88);
    if (v14) {
      (*(void (**)(void))(v14 + 16))();
    }
    if (*(void *)(*(void *)(a1 + 32) + 208))
    {
      id v15 = [MEMORY[0x263F662B0] sharedStore];
      [v15 removeGeneratedPassword:*(void *)(*(void *)(a1 + 32) + 208) completionHandler:0];
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFC620], "safari_HTMLFormProtectionSpaceForURL:", *(void *)(a1 + 40));
    id v39 = (void *)[objc_alloc(MEMORY[0x263EFC610]) initWithUser:&stru_26CC74200 password:*(void *)(a1 + 48) persistence:3];
    id v16 = [MEMORY[0x263F663B0] sharedStore];
    uint64_t v11 = [v16 savedAccountWithAllMetadataForURLCredential:v39 protectionSpace:v8];

    if (*(unsigned char *)(a1 + 96) && v11 && ([v11 hasSidecarData] & 1) == 0)
    {
      id v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C355000, v17, OS_LOG_TYPE_INFO, "Deleting a password without a username because the user opted not to save an ASP from the username dialog", buf, 2u);
      }
      id v18 = [MEMORY[0x263F663B0] sharedStore];
      [v18 removeCredentialTypes:1 forSavedAccount:v11];
    }
  }
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_204(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 potentialMatches];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v3 associatedDomainMatches];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_2_205(uint64_t a1, void *a2)
{
  id v3 = [a2 user];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_3_207(uint64_t a1, void *a2)
{
  id v3 = [a2 user];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_4(void *a1, int a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v3 = *(id *)(*(void *)(a1[8] + 8) + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v25;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = (void *)a1[4];
          uint64_t v9 = a1[5];
          id v10 = [*(id *)(*((void *)&v24 + 1) + 8 * v7) protectionSpace];
          [v8 setSavedAccountAsDefault:v9 forProtectionSpace:v10 context:a1[6]];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v5);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = *(id *)(*(void *)(a1[9] + 8) + 40);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (void *)a1[4];
          uint64_t v17 = a1[5];
          id v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v15), "protectionSpace", (void)v20);
          [v16 setSavedAccountAsDefault:v17 forProtectionSpace:v18 context:a1[6]];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v13);
    }
  }
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_5(void *a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1[8] + 8) + 40);
  if (v3)
  {
    *a2 = v3;
  }
  else
  {
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = (void *)a1[7];
    uint64_t v8 = [v7 host];
    uint64_t v9 = objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");
    *a2 = [v4 saveUser:v5 password:v6 forProtectionSpace:v7 highLevelDomain:v9 groupID:&stru_26CC74200];
  }
  return v3 == 0;
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_6(uint64_t a1, unint64_t a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a2 > 1)
  {
    char v5 = 0;
    id v6 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 88);
    uint64_t v32 = 0;
    char v5 = (*(uint64_t (**)(void))(v4 + 16))();
    id v6 = 0;
  }
  switch(a2)
  {
    case 0uLL:
      goto LABEL_13;
    case 1uLL:
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(a1 + 40);
            uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) protectionSpace];
            [v12 setSavedAccountAsDefault:v6 forProtectionSpace:v13 context:*(void *)(a1 + 48)];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v9);
      }

LABEL_13:
      [*(id *)(a1 + 40) setSavedAccountAsDefault:v6 forProtectionSpace:*(void *)(a1 + 56)];
      if (*(unsigned char *)(a1 + 104)) {
        char v14 = v5;
      }
      else {
        char v14 = 1;
      }
      if ((v14 & 1) == 0)
      {
        id v15 = objc_alloc_init(MEMORY[0x263F66390]);
        [v15 setSavedAccount:v6];
        [v15 setPassword:*(void *)(a1 + 64)];
        [*(id *)(a1 + 40) changeSavedAccountWithRequest:v15];
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v16 = *(id *)(a1 + 72);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(a1 + 40);
            long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "protectionSpace", (void)v24);
            [v21 setSavedAccountAsDefault:v6 forProtectionSpace:v22 context:*(void *)(a1 + 48)];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v18);
      }
      goto LABEL_28;
    case 2uLL:
      objc_msgSend(*(id *)(a1 + 80), "webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:", 0);
      break;
    case 3uLL:
      id v16 = [MEMORY[0x263F663B0] sharedStore];
      [v16 setDontSaveMarkerForSavedAccountsWithProtectionSpace:*(void *)(a1 + 56)];
LABEL_28:

      break;
    default:
      break;
  }
  uint64_t v23 = *(void *)(a1 + 96);
  if (v23) {
    (*(void (**)(void))(v23 + 16))();
  }
}

void __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_8;
  v7[3] = &unk_2643F06F8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v12 = v4;
  uint64_t v13 = v5;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [*(id *)(a1 + 32) exactMatches];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * v6) savedAccount];
        [v7 removeCredentialTypes:3 forSavedAccount:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  obuint64_t j = *(id *)(v10 + 40);
  (*(void (**)(void))(v9 + 16))();
  objc_storeStrong((id *)(v10 + 40), obj);
  return [*(id *)(a1 + 40) setSavedAccountAsDefault:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forProtectionSpace:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

uint64_t __132__WBUFormDataController__saveUser_password_isGeneratedPassword_forURL_inContext_formType_promptingPolicy_webView_completionHandler___block_invoke_9(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
    obuint64_t j = *(id *)(v4 + 40);
    (*(void (**)(void))(v3 + 16))();
    objc_storeStrong((id *)(v4 + 40), obj);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(a1 + 40);
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "protectionSpace", (void)v14);
          [v10 setSavedAccountAsDefault:v11 forProtectionSpace:v12 context:*(void *)(a1 + 48)];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_promptToUpdateRelatedCredentials:(id)a3 urlHost:(id)a4 relatedCredentialsHighLevelDomain:(id)a5 webView:(id)a6 completionHandler:(id)a7
{
  v28[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v25 = a6;
  id v14 = a4;
  +[WBUFormDataController keychainSyncEnabled];
  long long v15 = NSString;
  long long v16 = _WBSLocalizedString();
  long long v17 = objc_msgSend(v15, "localizedStringWithFormat:", v16, v11, v12);

  uint64_t v18 = NSString;
  uint64_t v19 = _WBSLocalizedString();
  uint64_t v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v14);

  long long v21 = _WBSLocalizedString();
  long long v22 = _WBSLocalizedString();
  v28[0] = v22;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __127__WBUFormDataController__promptToUpdateRelatedCredentials_urlHost_relatedCredentialsHighLevelDomain_webView_completionHandler___block_invoke;
  v26[3] = &unk_2643F0540;
  id v27 = v13;
  id v24 = v13;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:v25 title:v17 message:v20 cancelButtonTitle:v21 otherButtonTitles:v23 makeFirstButtonSuggestedAction:1 completionHandler:v26];
}

uint64_t __127__WBUFormDataController__promptToUpdateRelatedCredentials_urlHost_relatedCredentialsHighLevelDomain_webView_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != -1);
}

- (void)saveUser:(id)a3 password:(id)a4 forURL:(id)a5 inContext:(id)a6 andPromptToUpdateRelatedCredentialsWithWebView:(id)a7
{
}

- (void)didFillFieldWithGeneratedPassword:(id)a3 inFrame:(id)a4 webView:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x263EFC620];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(a4, "webui_URL");
  objc_msgSend(v7, "safari_HTMLFormProtectionSpaceForURL:", v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = objc_msgSend(MEMORY[0x263EFC610], "safari_credentialWithUser:password:persistence:", &stru_26CC74200, v9, 3);
  id v12 = [MEMORY[0x263EFC618] sharedCredentialStorage];
  [v12 setCredential:v11 forProtectionSpace:v13];

  objc_msgSend(v8, "webui_setLastGeneratedPasswordForCurrentBackForwardItem:", v9);
}

- (BOOL)_webView:(id)a3 saveUsernameAndPasswordFromForm:(id)a4 inFrame:(id)a5 context:(id)a6 confirmOverwritingCurrentPassword:(BOOL)a7 shouldPreferAnnotatedCredentials:(BOOL)a8 submissionHandler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  uint64_t v20 = objc_msgSend(v17, "webui_URL");
  if ([(WBUFormDataController *)self _shouldSaveUsernamesAndPasswordsForURL:v20 inWebView:v15])
  {
    BOOL v27 = a7;
    id v28 = 0;
    id v29 = 0;
    [(WBUFormDataController *)self willSubmitFormWithCredentials:v16 shouldPreferAnnotatedCredentials:v9 atURL:v20 username:&v29 password:&v28 inContext:v18];
    long long v21 = (__CFString *)v29;
    id v22 = v28;
    if (!v21) {
      long long v21 = &stru_26CC74200;
    }
    if (v9)
    {
      uint64_t v23 = 4;
    }
    else if (v16)
    {
      uint64_t v23 = [v16 type];
    }
    else
    {
      uint64_t v23 = 0;
    }
    BYTE1(v26) = v27;
    LOBYTE(v26) = [v16 usesGeneratedPassword];
    BOOL v24 = -[WBUFormDataController _webView:saveUsernameAndPasswordForURL:formType:inFrame:username:password:isGeneratedPassword:confirmOverwritingCurrentPassword:inContext:submissionHandler:](self, "_webView:saveUsernameAndPasswordForURL:formType:inFrame:username:password:isGeneratedPassword:confirmOverwritingCurrentPassword:inContext:submissionHandler:", v15, v20, v23, v17, v21, v22, v26, v18, v19);
  }
  else
  {
    BOOL v24 = 1;
  }

  return v24;
}

- (BOOL)_webView:(id)a3 formSubmission:(BOOL)a4 willSubmitNewAccountOrChangePasswordFormWithMetadata:(id)a5 shouldPreferAnnotatedCredentials:(BOOL)a6 fromFrame:(id)a7 inContext:(id)a8 submissionHandler:(id)a9
{
  BOOL v24 = a6;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = +[WBUCreditCardDataController sharedCreditCardDataController];
  uint64_t v20 = [v19 savableCreditCardDataInForm:v15];

  if (!v20) {
    goto LABEL_10;
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __173__WBUFormDataController__webView_formSubmission_willSubmitNewAccountOrChangePasswordFormWithMetadata_shouldPreferAnnotatedCredentials_fromFrame_inContext_submissionHandler___block_invoke;
  v25[3] = &unk_2643F0770;
  v25[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  BOOL v31 = v12;
  BOOL v32 = v24;
  id v30 = v18;
  BOOL v21 = [(WBUFormDataController *)self _webView:v26 willSubmitFormContainingCreditCardData:v20 fromFrame:v28 submissionHandler:v25];

  if (v21)
  {
LABEL_10:
    if ([v15 usesGeneratedPassword]
      && [MEMORY[0x263F662A0] isPasswordsAppInstalled])
    {
      id v22 = [MEMORY[0x263F66340] sharedNotificationManager];
      [v22 scheduleTakeATourNotificationIfNeededWithCompletionHandler:&__block_literal_global_3];
    }
    LOBYTE(v21) = [(WBUFormDataController *)self _webView:v14 saveUsernameAndPasswordFromForm:v15 inFrame:v16 context:v17 confirmOverwritingCurrentPassword:!v12 shouldPreferAnnotatedCredentials:v24 submissionHandler:v18];
  }

  return v21;
}

uint64_t __173__WBUFormDataController__webView_formSubmission_willSubmitNewAccountOrChangePasswordFormWithMetadata_shouldPreferAnnotatedCredentials_fromFrame_inContext_submissionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _webView:*(void *)(a1 + 40) saveUsernameAndPasswordFromForm:*(void *)(a1 + 48) inFrame:*(void *)(a1 + 56) context:*(void *)(a1 + 64) confirmOverwritingCurrentPassword:*(unsigned char *)(a1 + 80) == 0 shouldPreferAnnotatedCredentials:*(unsigned __int8 *)(a1 + 81) submissionHandler:*(void *)(a1 + 72)];
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v3();
  }
  return result;
}

- (BOOL)_webView:(id)a3 willSubmitStandardFormWithMetadata:(id)a4 fromFrame:(id)a5 submissionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(id)objc_opt_class() formContainsCreditCardData:v11])
  {
    id v14 = +[WBUCreditCardDataController sharedCreditCardDataController];
    id v15 = [v14 savableCreditCardDataInForm:v11];

    if (v15) {
      BOOL v16 = [(WBUFormDataController *)self _webView:v10 willSubmitFormContainingCreditCardData:v15 fromFrame:v12 submissionHandler:v13];
    }
    else {
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)_showPasswordPromptForWebView:(id)a3 formType:(unint64_t)a4 username:(id)a5 host:(id)a6 hasCredentialForCurrentHost:(BOOL)a7 existingCredentialMatchesForCurrentHost:(id)a8 otherSubdomainCredentialMatches:(id)a9 haveExistingCredentialWithSameUsernameAndDifferentPassword:(BOOL)a10 completionHandler:(id)a11
{
  BOOL v12 = a7;
  v69[2] = *MEMORY[0x263EF8340];
  id v16 = a5;
  id v17 = a6;
  id v65 = a8;
  id v18 = a9;
  id v19 = a11;
  id v62 = a3;
  uint64_t v20 = objc_msgSend(v17, "safari_highLevelDomainFromHost");
  BOOL v21 = [MEMORY[0x263EFF980] array];
  uint64_t v63 = v17;
  v64 = v16;
  if (v12)
  {
    if (a4 == 5)
    {
      id v22 = v17;
      id v23 = v16;
      +[WBUFormDataController keychainSyncEnabled];
      BOOL v24 = NSString;
      id v33 = _WBSLocalizedString();
      id v34 = objc_msgSend(v24, "localizedStringWithFormat:", v33, v23, v22);

      uint64_t v35 = v20;
      id v36 = v18;
      if ([v18 count])
      {
        if (a10)
        {
          uint64_t v37 = NSString;
          uint64_t v38 = _WBSLocalizedString();
          id v39 = objc_msgSend(v37, "localizedStringWithFormat:", v38, v35);
        }
        else
        {
          id v39 = 0;
        }
        v54 = _WBSLocalizedString();
        [v21 addObject:v54];

        id v44 = &unk_26CC77170;
      }
      else
      {
        id v49 = _WBSLocalizedString();
        [v21 addObject:v49];

        id v44 = &unk_26CC77188;
        id v39 = v34;
        id v34 = 0;
      }
    }
    else if ([v18 count])
    {
      id v27 = [v18 firstObject];
      id v28 = [v27 host];
      id v29 = objc_msgSend(v28, "safari_highLevelDomainFromHost");

      id v30 = v16;
      id v31 = v29;
      +[WBUFormDataController keychainSyncEnabled];
      BOOL v32 = NSString;
      uint64_t v50 = _WBSLocalizedString();
      id v34 = objc_msgSend(v32, "localizedStringWithFormat:", v50, v30, v31);

      id v51 = v31;
      if (a10)
      {
        id v36 = v18;
        uint64_t v52 = NSString;
        uint64_t v53 = _WBSLocalizedString();
        uint64_t v35 = v51;
        id v39 = objc_msgSend(v52, "localizedStringWithFormat:", v53, v51);
      }
      else
      {
        uint64_t v35 = v31;
        id v36 = v18;
        id v39 = 0;
      }
      uint64_t v55 = _WBSLocalizedString();
      [v21 addObject:v55];

      id v44 = &unk_26CC771A0;
    }
    else
    {
      id v45 = v17;
      uint64_t v35 = v20;
      id v46 = v45;
      id v47 = v16;
      +[WBUFormDataController keychainSyncEnabled];
      id v48 = NSString;
      id v36 = v18;
      id v56 = _WBSLocalizedString();
      id v39 = objc_msgSend(v48, "localizedStringWithFormat:", v56, v47, v46);

      id v57 = _WBSLocalizedString();
      [v21 addObject:v57];

      id v34 = 0;
      id v44 = &unk_26CC771B8;
    }
  }
  else
  {
    if ([MEMORY[0x263F5C9D8] shouldShowLoginIntroduction])
    {
      id v25 = NSString;
      id v26 = _WBSLocalizedString();
      id v34 = objc_msgSend(v25, "stringWithFormat:", v26, v20);
    }
    else
    {
      id v34 = titleTextForSavingNewPassword();
    }
    if (![MEMORY[0x263F5C9D8] shouldShowLoginIntroduction]) {
      [MEMORY[0x263F662A0] isPasswordsAppInstalled];
    }
    uint64_t v35 = v20;
    id v36 = v18;
    id v39 = _WBSLocalizedString();
    id v40 = _WBSLocalizedString();
    [v21 addObject:v40];

    uint64_t v41 = [v65 count];
    if (([MEMORY[0x263F5C9D8] shouldShowLoginIntroduction] & 1) == 0 && !v41)
    {
      id v42 = _WBSLocalizedString();
      [v21 addObject:v42];
    }
    id v43 = [NSNumber numberWithInteger:0];
    v69[0] = v43;
    v69[1] = &unk_26CC77158;
    id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
  }
  id v58 = _WBSLocalizedString();
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __255__WBUFormDataController__showPasswordPromptForWebView_formType_username_host_hasCredentialForCurrentHost_existingCredentialMatchesForCurrentHost_otherSubdomainCredentialMatches_haveExistingCredentialWithSameUsernameAndDifferentPassword_completionHandler___block_invoke;
  v66[3] = &unk_2643F0798;
  id v67 = v44;
  id v68 = v19;
  id v59 = v44;
  id v60 = v19;
  LOBYTE(v61) = 1;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:v62 title:v34 message:v39 cancelButtonTitle:v58 otherButtonTitles:v21 cancelWhenAppEntersBackground:0 makeFirstButtonSuggestedAction:v61 headerViewController:0 completionHandler:v66];
}

void __255__WBUFormDataController__showPasswordPromptForWebView_formType_username_host_hasCredentialForCurrentHost_existingCredentialMatchesForCurrentHost_otherSubdomainCredentialMatches_haveExistingCredentialWithSameUsernameAndDifferentPassword_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == -1)
  {
    [MEMORY[0x263F5C9D8] shouldShowLoginIntroduction];
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, [v5 unsignedIntegerValue]);
  }
}

- (void)_completePasswordsAppIntroduction
{
  objc_msgSend(MEMORY[0x263EFFA40], "pm_defaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setBool:1 forKey:*MEMORY[0x263F5C9E0]];
}

- (id)_relatedCredentialMatchesToUpdateForUser:(id)a3 protectionSpace:(id)a4 oldSavedAccount:(id *)a5 matchesForCurrentHost:(id *)a6 matchesForAssociatedDomains:(id *)a7
{
  return [(WBUFormDataController *)self _relatedCredentialMatchesToUpdateForUser:a3 protectionSpace:a4 oldSavedAccount:a5 matchesForCurrentHost:a6 matchesForAssociatedDomains:a7 haveExistingCredentialWithSameUsernameAndDifferentPassword:0];
}

- (id)_relatedCredentialMatchesToUpdateForUser:(id)a3 protectionSpace:(id)a4 oldSavedAccount:(id *)a5 matchesForCurrentHost:(id *)a6 matchesForAssociatedDomains:(id *)a7 haveExistingCredentialWithSameUsernameAndDifferentPassword:(BOOL *)a8
{
  id v14 = a3;
  id v29 = a4;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  id v66 = __Block_byref_object_copy_;
  id v67 = __Block_byref_object_dispose_;
  id v68 = 0;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = __Block_byref_object_copy_;
  uint64_t v61 = __Block_byref_object_dispose_;
  id v62 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy_;
  v55[4] = __Block_byref_object_dispose_;
  id v56 = 0;
  id v15 = objc_alloc(MEMORY[0x263F663A8]);
  id v16 = objc_msgSend(v29, "safari_URL");
  id v17 = [MEMORY[0x263F663C0] queryThatMatchesEverything];
  id v18 = (void *)[v15 initWithURL:v16 options:19 userNameQuery:v17 associatedDomainsManager:0 webFrameIdentifier:0];

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke;
  v50[3] = &unk_2643F07C0;
  uint64_t v52 = &v63;
  id v19 = v14;
  id v51 = v19;
  uint64_t v53 = &v57;
  v54 = v55;
  [(WBUFormDataController *)self getSavedAccountMatchesWithCriteria:v18 synchronously:1 completionHandler:v50];
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy_;
  id v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke_2;
  v30[3] = &unk_2643F07E8;
  BOOL v32 = &v40;
  id v20 = v19;
  id v31 = v20;
  id v33 = v55;
  id v34 = &v36;
  uint64_t v35 = &v44;
  BOOL v21 = (void *)MEMORY[0x21D4A5780](v30);
  id v22 = [(id)v64[5] potentialMatches];
  id v23 = objc_msgSend(v22, "safari_filterObjectsUsingBlock:", v21);

  if (*((unsigned char *)v41 + 24))
  {

    id v23 = (void *)MEMORY[0x263EFFA68];
  }
  BOOL v24 = (void *)MEMORY[0x263EFFA68];
  if (a6)
  {
    *((unsigned char *)v41 + 24) = 0;
    id v25 = [(id)v64[5] exactMatches];
    objc_msgSend(v25, "safari_filterObjectsUsingBlock:", v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    if (*((unsigned char *)v41 + 24)) {
      *a6 = v24;
    }
  }
  if (a7)
  {
    id v26 = (void *)v45[5];
    v45[5] = 0;

    *((unsigned char *)v41 + 24) = 0;
    id v27 = [(id)v64[5] associatedDomainMatches];
    objc_msgSend(v27, "safari_filterObjectsUsingBlock:", v21);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    if (*((unsigned char *)v41 + 24)) {
      *a7 = v24;
    }
  }
  if (a5) {
    *a5 = (id) v58[5];
  }
  if (a8) {
    *a8 = *((unsigned char *)v37 + 24);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v23;
}

void __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = [v4 exactMatches];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v11 = [v10 user];
        int v12 = [v11 isEqualToString:a1[4]];

        if (v12)
        {
          uint64_t v13 = [v10 savedAccount];
          uint64_t v14 = *(void *)(a1[6] + 8);
          id v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;

          uint64_t v16 = [v10 password];
          uint64_t v17 = *(void *)(a1[7] + 8);
          id v18 = *(void **)(v17 + 40);
          *(void *)(v17 + 40) = v16;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v19 = objc_msgSend(v4, "potentialMatches", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      while (2)
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          BOOL v24 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          id v25 = [v24 user];
          int v26 = [v25 isEqualToString:a1[4]];

          if (v26)
          {
            uint64_t v27 = [v24 password];
            uint64_t v28 = *(void *)(a1[7] + 8);
            id v29 = *(void **)(v28 + 40);
            *(void *)(v28 + 40) = v27;

            goto LABEL_22;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

uint64_t __207__WBUFormDataController__relatedCredentialMatchesToUpdateForUser_protectionSpace_oldSavedAccount_matchesForCurrentHost_matchesForAssociatedDomains_haveExistingCredentialWithSameUsernameAndDifferentPassword___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v6 = [v3 user];
    uint64_t v5 = [v6 isEqualToString:a1[4]];

    if (!v5) {
      goto LABEL_13;
    }
    uint64_t v7 = [v4 password];
    uint64_t v8 = v7;
    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      uint64_t v5 = 1;
      if ((objc_msgSend(v7, "isEqualToString:") & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
        uint64_t v5 = 0;
      }
      goto LABEL_12;
    }
    uint64_t v9 = *(void *)(a1[8] + 8);
    if (*(void *)(v9 + 40))
    {
      if (!objc_msgSend(v7, "isEqualToString:"))
      {
        uint64_t v5 = 0;
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
        goto LABEL_12;
      }
      uint64_t v9 = *(void *)(a1[8] + 8);
    }
    objc_storeStrong((id *)(v9 + 40), v8);
    uint64_t v5 = 1;
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v5 = 0;
LABEL_13:

  return v5;
}

- (BOOL)_webView:(id)a3 saveCredentialsForURL:(id)a4 formSubmission:(BOOL)a5 formWithMetadata:(id)a6 fromFrame:(id)a7 username:(id)a8 password:(id)a9 inContext:(id)a10 submissionHandler:(id)a11
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v60 = a6;
  id v54 = a7;
  id v58 = a8;
  id v18 = a9;
  id v57 = a10;
  id v55 = a11;
  id v56 = v16;
  uint64_t v53 = self;
  uint64_t v59 = v18;
  if (-[WBUFormDataController _shouldSaveUsernamesAndPasswordsForURL:inWebView:](self, "_shouldSaveUsernamesAndPasswordsForURL:inWebView:", v17, v16)&& (objc_msgSend(v18, "safari_looksLikeObscuredPassword") & 1) == 0&& (WBSCurrentPasswordSavingBehavior() != 1 || objc_msgSend(v60, "usesGeneratedPassword")))
  {
    id v51 = objc_msgSend(MEMORY[0x263EFC620], "safari_HTMLFormProtectionSpaceForURL:", v17);
    uint64_t v88 = 0;
    id v89 = &v88;
    uint64_t v90 = 0x2020000000;
    char v91 = 0;
    uint64_t v52 = [MEMORY[0x263F663B0] sharedStore];
    id v19 = [MEMORY[0x263F663A8] criteriaForExactFQDNPasswordMatchesOfURL:v17];
    objc_msgSend(v19, "setOptions:", objc_msgSend(v19, "options") | 4);
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke;
    v87[3] = &unk_2643F0518;
    v87[4] = &v88;
    [v52 getSavedAccountsMatchingCriteria:v19 withSynchronousCompletionHandler:v87];
    uint64_t v50 = v19;
    if (*((unsigned char *)v89 + 24))
    {
      a5 = 1;
LABEL_41:

      _Block_object_dispose(&v88, 8);
      goto LABEL_8;
    }
    char v86 = 0;
    id v84 = 0;
    id v85 = 0;
    id v83 = 0;
    uint64_t v46 = [(WBUFormDataController *)self _relatedCredentialMatchesToUpdateForUser:v58 protectionSpace:v51 oldSavedAccount:&v85 matchesForCurrentHost:&v84 matchesForAssociatedDomains:&v83 haveExistingCredentialWithSameUsernameAndDifferentPassword:&v86];
    id v21 = v85;
    id v45 = v84;
    id v44 = v83;
    id v49 = v21;
    id v47 = [v21 password];
    if (![v46 count]
      && ![v44 count]
      && [off_2643EFD90 password:v18 shouldBeConsideredEqualToExistingPassword:v47])
    {
      uint64_t v22 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_2;
      block[3] = &unk_2643F0810;
      id v23 = v21;
      id v77 = v23;
      id v24 = v51;
      id v78 = v24;
      id v79 = v52;
      id v80 = v57;
      id v81 = v58;
      id v82 = v59;
      dispatch_async(v22, block);

      [(WBUFormDataController *)self _warnAboutWeakPasswordIfNecessaryWithWebView:v16 savedAccount:v23 protectionSpace:v24];
      a5 = 1;
LABEL_40:

      goto LABEL_41;
    }
    __int16 v75 = 0;
    id v48 = v60;
    id v25 = [v48 userNameElementUniqueID];
    int v26 = [v48 passwordElementUniqueID];
    if (![v25 length] && !objc_msgSend(v26, "length"))
    {
LABEL_28:

      if ([v47 isEqualToString:v59])
      {
        long long v35 = [v51 host];
        long long v36 = objc_msgSend(v35, "safari_highLevelDomainForPasswordManager");
        long long v37 = [v49 sharedGroupID];
        uint64_t v38 = [v52 saveUser:v58 password:v59 forProtectionSpace:v51 highLevelDomain:v36 groupID:v37];

        [v52 setSavedAccountAsDefault:v38 forProtectionSpace:v51 context:v57];
        [(WBUFormDataController *)v53 _warnAboutWeakPasswordIfNecessaryWithWebView:v56 savedAccount:v49 protectionSpace:v51];
        a5 = 1;
      }
      else
      {
        if (v49)
        {
          uint64_t v39 = 1;
        }
        else
        {
          if (HIBYTE(v75)) {
            BOOL v40 = v75 == 0;
          }
          else {
            BOOL v40 = 0;
          }
          uint64_t v39 = v40;
        }
        uint64_t v41 = [v17 host];
        char v42 = v86;
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_3;
        v62[3] = &unk_2643F08B0;
        id v63 = v58;
        id v64 = v59;
        id v65 = v51;
        id v66 = v49;
        id v67 = v57;
        id v68 = v46;
        id v69 = v17;
        id v70 = v47;
        v71 = v53;
        id v72 = v56;
        BOOL v74 = a5;
        id v73 = v55;
        LOBYTE(v43) = v42;
        [(WBUFormDataController *)v53 _showPasswordPromptForWebView:v72 formType:3 username:v63 host:v41 hasCredentialForCurrentHost:v39 existingCredentialMatchesForCurrentHost:v45 otherSubdomainCredentialMatches:v68 haveExistingCredentialWithSameUsernameAndDifferentPassword:v43 completionHandler:v62];

        uint64_t v38 = v63;
      }

      goto LABEL_40;
    }
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v27 = [v48 controls];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v92 objects:v96 count:16];
    if (!v28) {
      goto LABEL_27;
    }
    uint64_t v29 = *(void *)v93;
LABEL_17:
    uint64_t v30 = 0;
    while (1)
    {
      id v31 = v17;
      if (*(void *)v93 != v29) {
        objc_enumerationMutation(v27);
      }
      long long v32 = *(void **)(*((void *)&v92 + 1) + 8 * v30);
      long long v33 = [v32 uniqueID];
      if ([v33 isEqualToString:v25]) {
        break;
      }
      if ([v33 isEqualToString:v26])
      {
        long long v34 = &v75;
        goto LABEL_24;
      }
LABEL_25:

      id v17 = v31;
      if (v28 == ++v30)
      {
        uint64_t v28 = [v27 countByEnumeratingWithState:&v92 objects:v96 count:16];
        if (!v28)
        {
LABEL_27:

          goto LABEL_28;
        }
        goto LABEL_17;
      }
    }
    long long v34 = (__int16 *)((char *)&v75 + 1);
LABEL_24:
    *(unsigned char *)long long v34 = [v32 isAutoFilledTextField];
    goto LABEL_25;
  }
  a5 = 1;
LABEL_8:

  return a5;
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a2, "exactMatches", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) savedAccount];
        uint64_t v9 = [v8 user];
        id v10 = +[WBSFormDataController dontSaveMarker];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) protectionSpaces];
  id v3 = [*(id *)(a1 + 32) protectionSpacesForAdditionalSites];
  id v13 = [v2 arrayByAddingObjectsFromArray:v3];

  int v4 = [v13 containsObject:*(void *)(a1 + 40)];
  uint64_t v5 = *(void **)(a1 + 48);
  if (v4)
  {
    [*(id *)(a1 + 48) setSavedAccountAsDefault:*(void *)(a1 + 32) forProtectionSpace:*(void *)(a1 + 40) context:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v8 host];
    id v10 = objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
    int v11 = [*(id *)(a1 + 32) sharedGroupID];
    id v12 = (id)[v5 saveUser:v6 password:v7 forProtectionSpace:v8 highLevelDomain:v10 groupID:v11];
  }
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  switch(a2)
  {
    case 0:
      objc_msgSend(MEMORY[0x263EFC620], "safari_HTMLFormProtectionSpaceForURL:", *(void *)(a1 + 80));
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [MEMORY[0x263F663B0] sharedStore];
      uint64_t v7 = [*(id *)(a1 + 56) protectionSpaces];
      int v8 = [v7 containsObject:v5];

      if (v8)
      {
        if (([*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 88)] & 1) == 0)
        {
          id v9 = objc_alloc_init(MEMORY[0x263F66390]);
          [v9 setSavedAccount:*(void *)(a1 + 56)];
          [v9 setPassword:*(void *)(a1 + 40)];
          [v6 changeSavedAccountWithRequest:v9];
        }
        [v6 setSavedAccountAsDefault:*(void *)(a1 + 56) forProtectionSpace:v5 context:*(void *)(a1 + 64)];
      }
      else
      {
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(a1 + 40);
        id v21 = [v5 host];
        uint64_t v22 = objc_msgSend(v21, "safari_highLevelDomainForPasswordManager");
        id v23 = [*(id *)(a1 + 56) sharedGroupID];
        id v24 = [v6 saveUser:v19 password:v20 forProtectionSpace:v5 highLevelDomain:v22 groupID:v23];

        [v6 setSavedAccountAsDefault:v24 forProtectionSpace:v5 context:*(void *)(a1 + 64)];
        if ([MEMORY[0x263F662A0] isPasswordsAppInstalled])
        {
          id v25 = [MEMORY[0x263F66340] sharedNotificationManager];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_5;
          v29[3] = &unk_2643F0888;
          id v26 = v24;
          uint64_t v27 = *(void *)(a1 + 96);
          uint64_t v28 = *(void **)(a1 + 104);
          id v30 = v26;
          uint64_t v31 = v27;
          id v32 = v28;
          [v25 requestStatusWithCompletionHandler:v29];
        }
      }
      goto LABEL_12;
    case 1:
      id v10 = [MEMORY[0x263F663B0] sharedStore];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = *(void **)(a1 + 48);
      long long v14 = [v13 host];
      long long v15 = objc_msgSend(v14, "safari_highLevelDomainForPasswordManager");
      id v16 = [*(id *)(a1 + 56) sharedGroupID];
      uint64_t v17 = [v10 saveUser:v11 password:v12 forProtectionSpace:v13 highLevelDomain:v15 groupID:v16];

      id v18 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_4;
      block[3] = &unk_2643F0838;
      id v34 = v10;
      id v35 = v17;
      id v36 = *(id *)(a1 + 48);
      id v37 = *(id *)(a1 + 64);
      id v38 = *(id *)(a1 + 72);
      id v6 = v17;
      id v5 = v10;
      dispatch_async(v18, block);

LABEL_12:
      goto LABEL_13;
    case 3:
      id v5 = [MEMORY[0x263F663B0] sharedStore];
      [v5 setDontSaveMarkerForSavedAccountsWithProtectionSpace:*(void *)(a1 + 48)];
LABEL_13:

      break;
    case 4:
      [*(id *)(a1 + 96) _completePasswordsAppIntroduction];
      break;
    default:
      break;
  }
  if (!*(unsigned char *)(a1 + 120)) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 112) + 16))(*(void *)(a1 + 112), a2, a3, a4);
  }
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setSavedAccountAsDefault:*(void *)(a1 + 40) forProtectionSpace:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        id v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "protectionSpace", (void)v10);
        [v7 setSavedAccountAsDefault:v8 forProtectionSpace:v9 context:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id v3 = [MEMORY[0x263F66340] sharedNotificationManager];
    [v3 schedulePasswordSavedNotificationForSavedAccount:*(void *)(a1 + 32) completionHandler:&__block_literal_global_264];
  }
  else if ([MEMORY[0x263F5C9D8] shouldShowLoginIntroduction])
  {
    [*(id *)(a1 + 40) showPasswordSavedPromptForSavedAccount:*(void *)(a1 + 32) webView:*(void *)(a1 + 48)];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_7;
    v4[3] = &unk_2643F0860;
    v4[4] = *(void *)(a1 + 40);
    [MEMORY[0x263EFC470] requestToTurnOnCredentialProviderExtensionWithCompletionHandler:v4];
  }
}

uint64_t __144__WBUFormDataController__webView_saveCredentialsForURL_formSubmission_formWithMetadata_fromFrame_username_password_inContext_submissionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completePasswordsAppIntroduction];
}

- (void)showPasswordSavedPromptForSavedAccount:(id)a3 webView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = NSString;
  uint64_t v8 = _WBSLocalizedString();
  id v9 = [v5 highLevelDomain];
  long long v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

  long long v11 = _WBSLocalizedString();
  long long v12 = _WBSLocalizedString();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke;
  block[3] = &unk_2643F0838;
  id v19 = v6;
  id v20 = v10;
  id v21 = v12;
  id v22 = v11;
  id v23 = v5;
  id v13 = v5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  id v17 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v9[0] = *(void *)(a1 + 56);
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke_2;
  v7[3] = &unk_2643F08D8;
  id v8 = *(id *)(a1 + 64);
  LOBYTE(v6) = 1;
  +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:v2 title:v3 message:0 cancelButtonTitle:v4 otherButtonTitles:v5 cancelWhenAppEntersBackground:0 makeFirstButtonSuggestedAction:v6 headerViewController:0 completionHandler:v7];
}

void __72__WBUFormDataController_showPasswordSavedPromptForSavedAccount_webView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a2 != -1)
  {
    id v3 = [NSString alloc];
    uint64_t v4 = [*(id *)(a1 + 32) stableID];
    id v5 = (void *)[v3 initWithData:v4 encoding:4];

    uint64_t v6 = (void *)*MEMORY[0x263F1D020];
    uint64_t v7 = (void *)MEMORY[0x263F662F8];
    uint64_t v10 = *MEMORY[0x263F664A8];
    v11[0] = v5;
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [v7 passwordManagerURLWithDictionary:v8];
    [v6 openURL:v9 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

- (void)_warnAboutWeakPasswordIfNecessaryWithWebView:(id)a3 savedAccount:(id)a4 protectionSpace:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v8, "webui_canPromptForAccountSecurityRecommendation"))
  {
    objc_initWeak(&location, v8);
    long long v11 = [MEMORY[0x263F663B0] sharedStore];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke;
    v19[3] = &unk_2643F0978;
    v19[4] = self;
    id v20 = v11;
    id v12 = v11;
    objc_copyWeak(&v22, &location);
    id v21 = v10;
    id v13 = (void *)MEMORY[0x21D4A5780](v19);
    id v14 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2_298;
    block[3] = &unk_2643F0450;
    id v18 = v13;
    id v17 = v9;
    id v15 = v13;
    dispatch_async(v14, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 persistentIdentifiersForWarningManager];
    uint64_t v6 = [v5 firstObject];

    if (v6)
    {
      uint64_t v7 = [a1[4] autoFillQuirksManager];
      id v8 = [MEMORY[0x263F66330] sharedStore];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_282;
      v12[3] = &unk_2643F0950;
      id v13 = a1[5];
      id v9 = v7;
      id v14 = v9;
      id v15 = v4;
      objc_copyWeak(&v19, a1 + 7);
      id v16 = a1[4];
      id v17 = a1[6];
      id v18 = v6;
      [v8 getContainsPersistentIdentifier:v18 completionHandler:v12];

      objc_destroyWeak(&v19);
    }
    else
    {
      long long v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_1();
    }
  }
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_282(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = objc_alloc(MEMORY[0x263F66328]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = +[WBSHistory existingSharedHistory];
    uint64_t v7 = (void *)[v3 initWithSavedAccountStore:v4 autoFillQuirksManager:v5 userDefaults:0 highLevelDomainsProvider:v6];

    uint64_t v8 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2;
    v11[3] = &unk_2643F0928;
    objc_copyWeak(&v15, (id *)(a1 + 80));
    int8x16_t v10 = *(int8x16_t *)(a1 + 48);
    id v9 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    id v13 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 72);
    [v7 getWarningForSavedAccount:v8 completionHandler:v11];

    objc_destroyWeak(&v15);
  }
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 shouldShowWarningsWhenLoggingIn])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_3;
    v4[3] = &unk_2643F0900;
    objc_copyWeak(&v9, (id *)(a1 + 64));
    v4[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v9);
  }
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_3(id *a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained)
  {
    id v3 = [a1[4] _titleTextForWarning:a1[5]];
    uint64_t v4 = [a1[5] localizedInformationTextForWarningWhenLoggingIn];
    id v5 = _WBSLocalizedString();
    id v6 = _WBSLocalizedString();
    v15[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_294;
    v10[3] = &unk_2643F0888;
    id v11 = a1[6];
    id v12 = a1[7];
    id v13 = a1[8];
    LOBYTE(v9) = 1;
    +[WBUFormAutoFillPrompt showAutoFillPromptInWebView:WeakRetained title:v3 message:v4 cancelButtonTitle:v5 otherButtonTitles:v7 cancelWhenAppEntersBackground:1 makeFirstButtonSuggestedAction:v9 headerViewController:0 completionHandler:v10];
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C355000, v8, OS_LOG_TYPE_INFO, "WebView disappeared before presenting weak password warning.", buf, 2u);
    }
  }
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_294(uint64_t a1, uint64_t a2)
{
  v12[2] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [MEMORY[0x263F66258] sharedLogger];
    [v3 reportWeakPasswordWarningEvent:2];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F662F8];
    v11[0] = *MEMORY[0x263F66478];
    id v5 = [*(id *)(a1 + 32) user];
    v12[0] = v5;
    v11[1] = *MEMORY[0x263F66470];
    id v6 = [*(id *)(a1 + 40) host];
    v12[1] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    id v3 = [v4 passwordManagerURLWithDictionary:v7];

    id v8 = [MEMORY[0x263F01880] defaultWorkspace];
    [v8 openSensitiveURL:v3 withOptions:0];

    uint64_t v9 = [MEMORY[0x263F66258] sharedLogger];
    [v9 reportWeakPasswordWarningEvent:3];
  }
  int8x16_t v10 = [MEMORY[0x263F66330] sharedStore];
  [v10 addPersistentIdentifier:*(void *)(a1 + 48)];
}

uint64_t __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_2_298(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_titleTextForWarning:(id)a3
{
  id v3 = [a3 localizedLongDescriptionForClient:2];
  uint64_t v4 = NSString;
  id v5 = _WBSLocalizedString();
  id v6 = [v4 stringWithFormat:@" %@", v5];
  id v7 = [v3 stringByAppendingString:v6];

  return v7;
}

- (BOOL)_webView:(id)a3 willSubmitLoginFormWithMetadata:(id)a4 formSubmission:(BOOL)a5 fromFrame:(id)a6 inContext:(id)a7 submissionHandler:(id)a8
{
  BOOL v27 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_msgSend(v15, "webui_URL");
  if ([MEMORY[0x263F5C9D8] shouldShowLoginIntroduction])
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    LOBYTE(v26) = 1;
    id v19 = (id *)&v31;
    id v20 = (id *)&v30;
    [(WBUFormDataController *)self willSubmitFormWithCredentials:v14 shouldPreferAnnotatedCredentials:0 atURL:v18 username:&v31 password:&v30 inContext:v16 shouldShowPasswordsAppOnboarding:v26];
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    id v19 = (id *)&v29;
    id v20 = (id *)&v28;
    [(WBUFormDataController *)self willSubmitFormWithCredentials:v14 shouldPreferAnnotatedCredentials:0 atURL:v18 username:&v29 password:&v28 inContext:v16];
  }
  id v21 = *v19;
  id v22 = *v20;
  if ([v14 usesGeneratedPassword]
    && [MEMORY[0x263F662A0] isPasswordsAppInstalled])
  {
    id v23 = [MEMORY[0x263F66340] sharedNotificationManager];
    [v23 scheduleTakeATourNotificationIfNeededWithCompletionHandler:&__block_literal_global_306];
  }
  BOOL v24 = !v21
     || ![v22 length]
     || [(WBUFormDataController *)self _webView:v13 saveCredentialsForURL:v18 formSubmission:v27 formWithMetadata:v14 fromFrame:v15 username:v21 password:v22 inContext:v16 submissionHandler:v17];

  return v24;
}

- (BOOL)webView:(id)a3 frame:(id)a4 willNavigateFromForm:(id)a5 inContext:(id)a6 bySubmitting:(BOOL)a7 processMetadataCorrections:(BOOL)a8 uniqueIDsOfControlsThatWereAutoFilled:(id)a9 submissionHandler:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[WBUFormDataController webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:]();
  }
  unsigned int v23 = v10 & ~objc_msgSend(v16, "webui_privateBrowsingEnabled");
  if ((v23 & 1) == 0
    && (BOOL v24 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill(), os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)))
  {
    -[WBUFormDataController webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:]();
    if (v18)
    {
LABEL_6:
      switch([v18 type])
      {
        case 1:
          if (v23)
          {
            uint64_t v28 = objc_msgSend(v17, "webui_URL");
            uint64_t v29 = [v28 host];
            [(WBUFormDataController *)self _processCorrectionsForFormWithDomain:v29 formMetadata:v18 uniqueIDsOfControlsThatWereAutoFilled:v20];
          }
          uint64_t v30 = [v18 annotations];
          uint64_t v31 = objc_msgSend(v30, "safari_stringForKey:", *(void *)off_2643EFED0);

          if ([v31 length]) {
            BOOL v32 = [(WBUFormDataController *)self _webView:v16 formSubmission:v11 willSubmitNewAccountOrChangePasswordFormWithMetadata:v18 shouldPreferAnnotatedCredentials:1 fromFrame:v17 inContext:v19 submissionHandler:v21];
          }
          else {
            BOOL v32 = [(WBUFormDataController *)self _webView:v16 willSubmitStandardFormWithMetadata:v18 fromFrame:v17 submissionHandler:v21];
          }
          goto LABEL_23;
        case 2:
          uint64_t v31 = objc_msgSend(v16, "webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v17);
          if ([(WBUFormDataController *)self _shouldTryToSaveCredentialsFromLastForm:v31 currentFormMetadata:v18 frame:v17])
          {
            BOOL v32 = [(WBUFormDataController *)self _webView:v16 formSubmission:v11 willSubmitNewAccountOrChangePasswordFormWithMetadata:v31 shouldPreferAnnotatedCredentials:0 fromFrame:v17 inContext:v19 submissionHandler:v21];
LABEL_23:
            BOOL v35 = v32;

            goto LABEL_28;
          }
          BOOL v40 = v31;
          id v36 = [v18 annotations];
          id v37 = objc_msgSend(v36, "safari_stringForKey:", *(void *)off_2643EFED0);

          if ([v37 length])
          {
            BOOL v35 = [(WBUFormDataController *)self _webView:v16 formSubmission:v11 willSubmitNewAccountOrChangePasswordFormWithMetadata:v18 shouldPreferAnnotatedCredentials:1 fromFrame:v17 inContext:v19 submissionHandler:v21];

            goto LABEL_28;
          }

          break;
        case 3:
          if (v23)
          {
            long long v33 = objc_msgSend(v17, "webui_URL");
            id v34 = [v33 host];
            [(WBUFormDataController *)self _processCorrectionsForFormWithDomain:v34 formMetadata:v18 uniqueIDsOfControlsThatWereAutoFilled:v20];
          }
          BOOL v27 = [(WBUFormDataController *)self _webView:v16 willSubmitLoginFormWithMetadata:v18 formSubmission:v11 fromFrame:v17 inContext:v19 submissionHandler:v21];
          goto LABEL_19;
        case 4:
        case 5:
          if (v23)
          {
            id v25 = objc_msgSend(v17, "webui_URL");
            uint64_t v26 = [v25 host];
            [(WBUFormDataController *)self _processCorrectionsForFormWithDomain:v26 formMetadata:v18 uniqueIDsOfControlsThatWereAutoFilled:v20];
          }
          BOOL v27 = [(WBUFormDataController *)self _webView:v16 formSubmission:v11 willSubmitNewAccountOrChangePasswordFormWithMetadata:v18 shouldPreferAnnotatedCredentials:0 fromFrame:v17 inContext:v19 submissionHandler:v21];
LABEL_19:
          BOOL v35 = v27;
          goto LABEL_28;
        default:
          goto LABEL_27;
      }
      goto LABEL_27;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  id v38 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[WBUFormDataController webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:]();
  }
LABEL_27:
  BOOL v35 = 1;
LABEL_28:

  return v35;
}

- (BOOL)_shouldTryToSaveCredentialsFromLastForm:(id)a3 currentFormMetadata:(id)a4 frame:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([a4 containsAtLeastOneSecureTextField]
    && (unint64_t)([v7 type] - 6) >= 0xFFFFFFFFFFFFFFFELL)
  {
    BOOL v10 = [v7 passwordElementUniqueID];
    if ([v10 length])
    {
      BOOL v11 = [v7 confirmPasswordElementUniqueID];
      if ([v11 length])
      {
        id v12 = [v7 oldPasswordElementUniqueID];
        if ([v12 length])
        {
          LOBYTE(v9) = 0;
        }
        else
        {
          id v13 = [(id)objc_opt_class() valueOfControlWithUniqueID:v10 inForm:v7];
          if ([v13 length])
          {
            id v14 = (void *)MEMORY[0x263EFC620];
            id v15 = objc_msgSend(v8, "webui_URL");
            id v16 = objc_msgSend(v14, "safari_HTMLFormProtectionSpaceForURL:", v15);

            id v17 = [MEMORY[0x263EFC618] sharedCredentialStorage];
            id v18 = [v17 defaultCredentialForProtectionSpace:v16];

            if ([v18 hasPassword])
            {
              id v19 = [v18 password];
              int v9 = [v19 isEqualToString:v13] ^ 1;
            }
            else
            {
              LOBYTE(v9) = 0;
            }
          }
          else
          {
            LOBYTE(v9) = 0;
          }
        }
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_updateCredentialsWithGeneratedPasswordForForm:(id)a3 inWebView:(id)a4 frame:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v55 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 type];
  id v54 = v10;
  id v13 = objc_msgSend(v10, "webui_URL");
  uint64_t v74 = 0;
  __int16 v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = __Block_byref_object_copy_;
  id v78 = __Block_byref_object_dispose_;
  id v79 = 0;
  uint64_t v49 = v12;
  if ([v9 usesGeneratedPassword])
  {
    int v14 = [MEMORY[0x263F5C9D8] shouldShowLoginIntroduction];
    id v16 = (id *)(v75 + 5);
    uint64_t v15 = v75[5];
    if (v14)
    {
      uint64_t v72 = 0;
      uint64_t v73 = v15;
      id v17 = (id *)&v72;
      id v18 = (id *)&v73;
      LOBYTE(v45) = 1;
      [(WBUFormDataController *)self willSubmitFormWithCredentials:v9 shouldPreferAnnotatedCredentials:0 atURL:v13 username:&v73 password:&v72 inContext:v11 shouldShowPasswordsAppOnboarding:v45];
    }
    else
    {
      uint64_t v70 = 0;
      uint64_t v71 = v15;
      id v17 = (id *)&v70;
      id v18 = (id *)&v71;
      [(WBUFormDataController *)self willSubmitFormWithCredentials:v9 shouldPreferAnnotatedCredentials:0 atURL:v13 username:&v71 password:&v70 inContext:v11];
    }
    objc_storeStrong(v16, *v18);
    id v19 = *v17;
  }
  else
  {
    id v19 = 0;
  }
  id v20 = objc_msgSend(MEMORY[0x263EFC620], "safari_HTMLFormProtectionSpaceForURL:", v13);
  id v21 = objc_msgSend(v55, "webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v10);
  uint64_t v52 = v11;
  if ([v21 usesGeneratedPassword])
  {
    id v22 = [v21 passwordElementUniqueID];
    if ([v22 length])
    {
      unsigned int v23 = [(id)objc_opt_class() valueOfControlWithUniqueID:v22 inForm:v21];
    }
    else
    {
      unsigned int v23 = 0;
    }
  }
  else
  {
    unsigned int v23 = 0;
  }
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke;
  v63[3] = &unk_2643F09C8;
  id v69 = &v74;
  id v24 = v19;
  id v64 = v24;
  id v25 = v23;
  id v65 = v25;
  id v26 = v13;
  id v66 = v26;
  id v51 = v20;
  id v67 = v51;
  id v68 = self;
  BOOL v27 = (void (**)(void, void))MEMORY[0x21D4A5780](v63);
  if ([v24 length])
  {
    objc_msgSend(v55, "webui_setFormMetadata:forLastPasswordGenerationOrSubmitEventInFrame:", v9, v10);
    id v50 = v25;
    if (!v75[5])
    {
      v75[5] = (uint64_t)&stru_26CC74200;
    }
    uint64_t v57 = 0;
    id v58 = &v57;
    uint64_t v59 = 0x3032000000;
    id v60 = __Block_byref_object_copy_;
    uint64_t v61 = __Block_byref_object_dispose_;
    id v62 = 0;
    uint64_t v28 = [MEMORY[0x263F663A8] criteriaForExactFQDNPasswordMatchesOfURL:v26];
    id v29 = objc_alloc(MEMORY[0x263F663C0]);
    uint64_t v30 = (void *)[v29 initWithString:v75[5] matchingType:1];
    [v28 setUserNameQuery:v30];

    uint64_t v31 = [MEMORY[0x263F663B0] sharedStore];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke_3;
    v56[3] = &unk_2643F0518;
    v56[4] = &v57;
    [v31 getSavedAccountsMatchingCriteria:v28 withSynchronousCompletionHandler:v56];

    BOOL v32 = (void *)v58[5];
    if (v32)
    {
      long long v33 = [v32 password];
      uint64_t v34 = [v33 length];

      if (v34)
      {
        v27[2](v27, 0);
        BOOL v35 = [(id)v58[5] password];
        char v36 = [v35 isEqualToString:v24];
LABEL_31:

        _Block_object_dispose(&v57, 8);
        id v25 = v50;
        goto LABEL_32;
      }
    }
    BOOL v35 = [v26 host];
    int v37 = [v21 usesGeneratedPassword];
    if (v35) {
      int v38 = v37;
    }
    else {
      int v38 = 1;
    }
    if (v38 == 1)
    {
      char v36 = 1;
      v27[2](v27, 1);
      goto LABEL_31;
    }
    uint64_t v39 = [(WBUFormDataController *)self autoFillQuirksManager];
    id v48 = [v39 associatedDomainsManager];

    BOOL v40 = [v48 domainsToConsiderIdenticalToDomain:v35];
    uint64_t v41 = [v40 count];

    char v36 = v41 == 0;
    if (v41)
    {
      char v42 = (void (*)(void, BOOL))v27[2];
    }
    else
    {
      id v47 = objc_msgSend(v35, "safari_stringByRemovingWwwDotPrefix");
      uint64_t v43 = [v48 domainsWithAssociatedCredentialsForDomain:v47];
      uint64_t v46 = [v43 count];

      char v42 = (void (*)(void, BOOL))v27[2];
      if (v46)
      {
        v42(v27, 0);
        -[WBUFormDataController _saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:](self, "_saveUser:password:isGeneratedPassword:forURL:inContext:formType:promptingPolicy:webView:completionHandler:", v75[5], v24, [v9 usesGeneratedPassword], v26, v52, v49, 2, v55, 0);
        goto LABEL_30;
      }
    }
    v42(v27, v41 == 0);
LABEL_30:

    goto LABEL_31;
  }
  v27[2](v27, 0);
  objc_msgSend(v55, "webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v10);
  char v36 = 0;
LABEL_32:

  _Block_object_dispose(&v74, 8);
  return v36;
}

void __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = +[WBUGeneratedPasswordCredentialUpdater sharedUpdater];
  uint64_t v5 = *(void *)(*(void *)(a1[9] + 8) + 40);
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke_2;
  v10[3] = &unk_2643F09A0;
  void v10[4] = a1[8];
  [v4 updateCredentialWithNewUsername:v5 newGeneratedPassword:v6 lastGeneratedPassword:v7 credentialURL:v8 protectionSpace:v9 shouldSaveNewCredential:a2 completionHandler:v10];
}

void __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a2;
  if ([MEMORY[0x263F662A0] isPasswordsAppInstalled])
  {
    if (v4)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), a2);
      uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v8 = @"savedAccount";
      v9[0] = v4;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [v5 postNotificationName:@"formDataControllerDidSaveAccountWithGeneratedPassword" object:v6 userInfo:v7];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 postNotificationName:@"formDataControllerDidSaveAccountWithGeneratedPassword" object:*(void *)(a1 + 32) userInfo:0];
    }
  }
}

void __96__WBUFormDataController__updateCredentialsWithGeneratedPasswordForForm_inWebView_frame_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = [a2 matchesForPasswordAutoFill];
  id v3 = [v7 firstObject];
  uint64_t v4 = [v3 savedAccount];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)textDidChangeInForm:(id)a3 inWebView:(id)a4 frame:(id)a5 context:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(v10, "webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:", v11);
  if ([v13 usesGeneratedPassword]) {
    [(WBUFormDataController *)self _updateCredentialsWithGeneratedPasswordForForm:v14 inWebView:v10 frame:v11 context:v12];
  }
}

- (void)performWhenReady:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
  {
    id v3 = [(id)objc_opt_class() _meCard];
    [v3 performWhenReady:v4];
  }
}

- (void)_processCorrectionsForFormWithDomain:(id)a3 formMetadata:(id)a4 uniqueIDsOfControlsThatWereAutoFilled:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 controls];
  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = [v9 annotations];
    uint64_t v15 = [v14 objectForKeyedSubscript:*(void *)off_2643EFEC8];

    if (v15
      && ([(WBUFormDataController *)self me],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [v16 identifier],
          id v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v15 isEqualToString:v17],
          v17,
          v16,
          (v18 & 1) == 0))
    {
      long long v33 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:]();
      }
    }
    else
    {
      uint64_t v34 = v15;
      BOOL v35 = self;
      id v36 = v8;
      id v19 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:](v13, v19);
      }
      id v20 = objc_opt_new();
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v21 = v11;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            BOOL v27 = objc_msgSend(v26, "fieldName", v34);
            if ([v27 length])
            {
              uint64_t v28 = [v26 value];
              id v29 = (void *)v28;
              if (v28) {
                uint64_t v30 = (__CFString *)v28;
              }
              else {
                uint64_t v30 = &stru_26CC74200;
              }
              [v20 setObject:v30 forKeyedSubscript:v27];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v23);
      }

      id v8 = v36;
      uint64_t v31 = (void *)[objc_alloc((Class)off_2643EFD98) initWithDomain:v36 formMetadata:v9 formValues:v20 uniqueIDsOfControlsThatWereAutoFilled:v10];
      [v31 setDelegate:v35];
      [v31 processCorrections];

      uint64_t v15 = v34;
    }
  }
  else
  {
    BOOL v32 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[WBUFormDataController _processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:]();
    }
  }
}

- (id)_autoFillCorrectionManager
{
  autoFillCorrectionManager = self->_autoFillCorrectionManager;
  if (!autoFillCorrectionManager)
  {
    id v4 = objc_alloc((Class)off_2643EFD70);
    uint64_t v5 = [off_2643EFD78 standardStore];
    uint64_t v6 = (WBSFormAutoFillCorrectionManager *)[v4 initWithCorrectionsStore:v5];
    id v7 = self->_autoFillCorrectionManager;
    self->_autoFillCorrectionManager = v6;

    [(WBSFormAutoFillCorrectionManager *)self->_autoFillCorrectionManager setDelegate:self];
    autoFillCorrectionManager = self->_autoFillCorrectionManager;
  }
  return autoFillCorrectionManager;
}

- (id)formFieldClassificationCorrector:(id)a3 bestAddressBookLabelForControlValue:(id)a4
{
  id v6 = a4;
  id v7 = [a3 formMetadata];
  id v8 = [(WBUFormDataController *)self bestAddressBookLabelForFormMetadata:v7 formControlValue:v6];

  return v8;
}

- (BOOL)formFieldClassificationCorrector:(id)a3 hasAddressBookDataForAddressBookLabel:(id)a4
{
  return [(WBUFormDataController *)self addressBookHasDataForLabel:a4];
}

- (id)feedbackProcessorForAutoFillCorrectionManager:(id)a3
{
  autoFillFeedbackProcessor = self->_autoFillFeedbackProcessor;
  if (!autoFillFeedbackProcessor)
  {
    id v4 = objc_alloc((Class)off_2643EFD88);
    WBSSharedParsecGlobalFeedbackDispatcher();
  }
  return autoFillFeedbackProcessor;
}

- (BOOL)autoFillCorrectionManagerShouldProcessFeedback:(id)a3
{
  return MEMORY[0x270F24B48](self, a2, a3);
}

- (WBSCreditCardData)lastFilledCreditCardData
{
  return self->_lastFilledCreditCardData;
}

- (void)setLastFilledCreditCardData:(id)a3
{
}

- (NSSet)previouslyFilledVirtualCardNumbers
{
  return self->_previouslyFilledVirtualCardNumbers;
}

- (void)setPreviouslyFilledVirtualCardNumbers:(id)a3
{
}

- (WBSGeneratedPassword)generatedPassword
{
  return self->_generatedPassword;
}

- (void)setGeneratedPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedPassword, 0);
  objc_storeStrong((id *)&self->_previouslyFilledVirtualCardNumbers, 0);
  objc_storeStrong((id *)&self->_lastFilledCreditCardData, 0);
  objc_storeStrong((id *)&self->_accountSavedWithGeneratedPassword, 0);
  objc_storeStrong((id *)&self->_autoFillFeedbackProcessor, 0);
  objc_storeStrong((id *)&self->_autoFillCorrectionManager, 0);
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21C355000, v0, OS_LOG_TYPE_ERROR, "Failed to find saved password. Skipping weak password warning.", v1, 2u);
}

void __99__WBUFormDataController__warnAboutWeakPasswordIfNecessaryWithWebView_savedAccount_protectionSpace___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21C355000, v0, OS_LOG_TYPE_ERROR, "Failed to find persistent identifier for credential. Skipping weak password warning.", v1, 2u);
}

- (void)webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C355000, v0, v1, "Not requesting AutoFill correction processing due to absence of form metadata", v2, v3, v4, v5, v6);
}

- (void)webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C355000, v0, v1, "Will not process AutoFill corrections since correction processing was not requested", v2, v3, v4, v5, v6);
}

- (void)webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C355000, v0, v1, "Form was submitted; will consider whether to process AutoFill corrections",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C355000, v0, v1, "Not processing AutoFill corrections since no form controls were supplied", v2, v3, v4, v5, v6);
}

- (void)_processCorrectionsForFormWithDomain:(uint64_t)a1 formMetadata:(NSObject *)a2 uniqueIDsOfControlsThatWereAutoFilled:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C355000, a2, OS_LOG_TYPE_DEBUG, "Processing AutoFill corrections for %lu controls", (uint8_t *)&v2, 0xCu);
}

- (void)_processCorrectionsForFormWithDomain:formMetadata:uniqueIDsOfControlsThatWereAutoFilled:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C355000, v0, v1, "Not processing AutoFill corrections since a contact card other than the Me card was used for AutoFill", v2, v3, v4, v5, v6);
}

@end