@interface WBSFormDataController
+ (BOOL)_password:(id)a3 appearsToBeASixDigitCodeAppendedToPassword:(id)a4;
+ (BOOL)_password:(id)a3 appearsToBeMoreThanOneSymbolAppendedToPassword:(id)a4;
+ (BOOL)canAutocompleteTextField:(id)a3 inForm:(id)a4;
+ (BOOL)contactIsMe:(id)a3;
+ (BOOL)convertNumber:(id)a3 toAutoFillFormType:(unint64_t *)a4;
+ (BOOL)formContainsCreditCardData:(id)a3;
+ (BOOL)formContainsCreditCardNumberField:(id)a3;
+ (BOOL)formContainsCreditCardNumberOrCardSecurityCodeField:(id)a3;
+ (BOOL)formContainsDateFields:(id)a3 matchingAddressBookMatch:(id)a4;
+ (BOOL)isFieldUnidentified:(id)a3;
+ (BOOL)isNameProperty:(id)a3;
+ (BOOL)password:(id)a3 shouldBeConsideredEqualToExistingPassword:(id)a4;
+ (BOOL)shouldDisplayHideMyEmailForControl:(id)a3;
+ (BOOL)shouldDisplayOneTimeCodeForControl:(id)a3 inForm:(id)a4;
+ (BOOL)stringLooksLikeCreditCardNumber:(id)a3;
+ (BOOL)textFieldLooksLikeCreditCardFormField:(id)a3 inForm:(id)a4;
+ (BOOL)textFieldLooksLikeCreditCardNumericFormField:(id)a3;
+ (id)_metadataForControlWithUniqueID:(id)a3 inForm:(id)a4;
+ (id)addressBookAddressPropertyKey;
+ (id)allAddressBookAddressComponentKeys;
+ (id)allAddressBookNonAddressPropertyKeys;
+ (id)allSynonymsForMatch:(id)a3;
+ (id)contactKeyForString:(id)a3;
+ (id)continuingFieldsInFormControls:(id)a3 startingAtIndex:(unint64_t)a4 textFieldsOnly:(BOOL)a5 ignorePositioning:(BOOL)a6;
+ (id)controlsConsideredByAutoFillInForm:(id)a3;
+ (id)domainFromURL:(id)a3;
+ (id)dontSaveMarker;
+ (id)fieldToFocusBeforeSubmittingForm:(id)a3;
+ (id)lastFieldInControls:(id)a3 inForm:(id)a4;
+ (id)localizedLowercaseContactProperty:(id)a3;
+ (id)nextFieldAfterControls:(id)a3 inForm:(id)a4;
+ (id)specifierForAddressBookLabel:(id)a3;
+ (id)specifierForControl:(id)a3;
+ (id)stringWithAddressBookValue:(id)a3 key:(id)a4;
+ (id)valueOfControlWithUniqueID:(id)a3 inForm:(id)a4;
+ (id)valuesFromUser:(id)a3 password:(id)a4 forLoginOrChangePasswordForm:(id)a5;
+ (int64_t)availableManualAutoFillActionForTextField:(id)a3 form:(id)a4 outUsernameElementUniqueID:(id *)a5 outPasswordElementUniqueID:(id *)a6 outConfirmPasswordElementUniqueID:(id *)a7;
- (BOOL)_dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:(id)a3;
- (BOOL)_hasMatchingAutoFillEventForUsername:(id)a3 withinTimeInterval:(double)a4 inTabWithID:(id)a5 currentURL:(id)a6 shouldAllowPrivateTabs:(BOOL)a7 shouldRemoveMatchingEvent:(BOOL)a8 shouldIncludeExternalCredentialEvents:(BOOL)a9;
- (BOOL)_matchHasPreferredIdentifierOrShouldBeFilledInMultiRoundAutoFill:(id)a3 specifier:(id)a4 multiRoundAutoFillManager:(id)a5 contact:(id)a6;
- (BOOL)addressBookHasDataForLabel:(id)a3;
- (BOOL)canApplyAutoFillGracePeriodForUsername:(id)a3 inTabWithID:(id)a4 currentURL:(id)a5;
- (BOOL)frameIsKnownToAskForCredentialsFromOtherServicesFromAncestorFrameURLs:(id)a3;
- (BOOL)hasUserDeniedAccessToCredential:(id)a3 inProtectionSpace:(id)a4;
- (BOOL)isControlASelectElement:(id)a3;
- (BOOL)isPasswordFieldForUserCredentialsWithMetadata:(id)a3 formMetadata:(id)a4;
- (BOOL)preferredIdentifierExistsForProperty:(id)a3 withContact:(id)a4;
- (BOOL)shouldAutoFillFromAddressBook;
- (BOOL)shouldAutoFillFromPreviousData;
- (BOOL)shouldAutoFillPasswords;
- (BOOL)shouldForceUSLocaleForAutoFillFillingTest;
- (BOOL)shouldSubmitForm:(id)a3 withUser:(id)a4 password:(id)a5 onURL:(id)a6;
- (BOOL)textFieldIsEligibleForAutomaticStrongPassword:(id)a3 form:(id)a4 ignorePreviousDecision:(BOOL)a5 textFieldCurrentlyContainsStrongPassword:(BOOL *)a6;
- (BOOL)textFieldMetadataMeetsRequirementsForAutomaticStrongPasswordTreatment:(id)a3 form:(id)a4;
- (NSLocale)locale;
- (WBSAutoFillQuirksManager)autoFillQuirksManager;
- (WBSFormDataController)init;
- (WBSFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3;
- (id)_autoFillSetFromMatches:(id)a3 label:(id)a4 contact:(id)a5 form:(id)a6;
- (id)_cachedLocalizedStringsForBirthdate:(id)a3;
- (id)_completionDB;
- (id)_domainsWithPreviousDataOnInternalQueue;
- (id)_formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:(id)a3 formMetadata:(id)a4;
- (id)_keyToLookUpInAnnotationsForPasswordForFormMetadata:(id)a3;
- (id)_knownUsernamesWithPasswordsForURL:(id)a3 inContext:(id)a4;
- (id)_lastUsedUsernameForDomain:(id)a3;
- (id)_matchesForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8;
- (id)_matchesForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 contact:(id)a8 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a9;
- (id)_nextFieldToFocusAfterFillingFieldAtIndex:(unint64_t)a3 inForm:(id)a4;
- (id)_phoneNumberCandidates:(id)a3 fillingMultipleFields:(BOOL)a4;
- (id)_recentlyUsedAutoFillDictionaries;
- (id)_singleFieldPhoneNumberCandidates:(id)a3;
- (id)_valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8 wantAllMatches:(BOOL)a9 contact:(id)a10 existingMatches:(id)a11 shouldUseExistingMatchesToFillFocusedField:(BOOL)a12 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a13;
- (id)addressBookMatchesForFullNameForContact:(id)a3;
- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5;
- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 partialString:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8;
- (id)allFormDataForSaving;
- (id)annotationsFromUsername:(id)a3 forLoginOrChangePasswordForm:(id)a4;
- (id)autoGeneratedPasswordForURL:(id)a3 respectingPasswordRequirements:(id)a4 maxLength:(unint64_t)a5;
- (id)bestAddressBookLabelForFormMetadata:(id)a3 formControlValue:(id)a4;
- (id)bestMatchForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8;
- (id)bestMatchForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 contact:(id)a8 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a9;
- (id)cascadingAddressMatchesForMatch:(id)a3 contact:(id)a4;
- (id)completionDBPath;
- (id)contactAutoFillSetForRecentlyUsedAutoFillSet:(id)a3 contact:(id)a4 form:(id)a5;
- (id)domainsWithPreviousData;
- (id)encryptOrDecryptData:(id)a3 encrypt:(BOOL)a4;
- (id)exactFQDNAndOtherSavedAccountMatchesForForm:(id)a3 atURL:(id)a4 webFrameIdentifier:(id)a5 savedAccountContext:(id)a6;
- (id)infoForDomain:(id)a3;
- (id)lastUsedUsernameWithPasswordForURL:(id)a3 inContext:(id)a4;
- (id)matchesForControl:(id)a3 atURL:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a7;
- (id)matchesForControl:(id)a3 atURL:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8;
- (id)metadataOfActiveFormOrBestFormForPageLevelAutoFill:(id)a3 frame:(OpaqueFormAutoFillFrame *)a4;
- (id)metadataOfBestFormForStreamlinedLogin:(id)a3 frame:(OpaqueFormAutoFillFrame *)a4;
- (id)orderedHomeAndWorkSetsForContact:(id)a3 form:(id)a4;
- (id)preferredIdentifierForProperty:(id)a3 withContact:(id)a4;
- (id)recentlyUsedAutoFillSets;
- (id)savedAccountUsingDomainsToConsiderIdenticalWithUsername:(id)a3 url:(id *)a4 host:(id *)a5;
- (id)substituteCredential:(id)a3 inProtectionSpace:(id)a4;
- (id)uniqueIDOfContact:(id)a3;
- (id)valuesForContactFormWithMetadata:(id)a3 inDomain:(id)a4 matches:(id *)a5 multiRoundAutoFillManager:(id)a6;
- (id)valuesForContactFormWithMetadata:(id)a3 inDomain:(id)a4 matches:(id *)a5 multiRoundAutoFillManager:(id)a6 contact:(id)a7;
- (id)valuesForContactFormWithMetadata:(id)a3 matches:(id *)a4 multiRoundAutoFillManager:(id)a5 existingMatches:(id)a6 contact:(id)a7;
- (id)valuesForContactFormWithMetadata:(id)a3 matches:(id *)a4 multiRoundAutoFillManager:(id)a5 existingMatches:(id)a6 shouldUseExistingMatchesToFillFocusedField:(BOOL)a7 contact:(id)a8;
- (id)valuesForFormWithMetadata:(id)a3 hideMyEmailRecord:(id)a4;
- (id)valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8;
- (id)valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8 contact:(id)a9 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a10;
- (int64_t)autoFillActionForFormType:(unint64_t)a3 onURL:(id)a4 shouldSubmitAfterFilling:(BOOL)a5;
- (unint64_t)_addMatchesForControl:(id)a3 startingAtIndex:(unint64_t)a4 formMetadata:(id)a5 fromExistingMatches:(id)a6 fromAllMatchesIfNecessary:(id)a7 addToFoundMatches:(id)a8 addToAutoFillValues:(id)a9 multiRoundAutoFillManager:(id)a10 propertyToIdentifierMapForFoundMatches:(id)a11 shouldUseExistingMatchesToFillFocusedField:(BOOL)a12;
- (unint64_t)_indexForControlWithUniqueID:(id)a3 inForm:(id)a4;
- (unint64_t)addValuesForStandardFormControls:(id)a3 startingAtIndex:(unint64_t)a4 fromAutoFillItem:(id)a5 toDictionary:(id)a6 formTextSample:(id)a7 multiRoundAutoFillManager:(id)a8;
- (unint64_t)addValuesForStandardFormControlsInForm:(id)a3 startingAtIndex:(unint64_t)a4 fromAutoFillItem:(id)a5 toDictionary:(id)a6 multiRoundAutoFillManager:(id)a7;
- (void)_currentLocaleDidChange:(id)a3;
- (void)_fillPhoneNumber:(id)a3 intoValues:(id)a4 controls:(id)a5 formTextSample:(id)a6 multiRoundAutoFillManager:(id)a7;
- (void)_loadCompletionDBIfNeededOnInternalQueue;
- (void)_removeExpiredAutoFillEvents:(id)a3;
- (void)_removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission;
- (void)_setLastUsedUsername:(id)a3 andProtectionSpace:(id)a4 forDomain:(id)a5;
- (void)addABMatchesForValueSpecifier:(id)a3 matchingPartialString:(id)a4 toArray:(id)a5 preferredLabel:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8;
- (void)addAllAddressDataIfNecessary:(id)a3 contactLabel:(id)a4 contact:(id)a5;
- (void)addPreviousDataMatchesForFieldWithName:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 toArray:(id)a6;
- (void)addRecentlyUsedAutoFillSet:(id)a3 appendToTheEnd:(BOOL)a4;
- (void)allFormDataForSaving;
- (void)canAutomaticallyRegisterPasskeyForUsername:(id)a3 inTabWithID:(id)a4 currentURL:(id)a5 completionHandler:(id)a6;
- (void)clearPreviousDataDatabaseItemsAddedAfterDate:(id)a3;
- (void)clearPreviousDataForDomain:(id)a3;
- (void)dealloc;
- (void)didAutomaticallySubmitFormWhenFillingOnURL:(id)a3 formMetadata:(id)a4;
- (void)didFillPasswordForUsername:(id)a3 fromProviderWithBundleIdentifier:(id)a4 inTabWithID:(id)a5 currentURL:(id)a6 isPrivate:(BOOL)a7;
- (void)getFormFieldValues:(id *)a3 andFieldToFocus:(id *)a4 andCreditCardDataTypesThatWillBeFilled:(id *)a5 forCreditCardForm:(id)a6 fromCreditCardData:(id)a7;
- (void)getFormFieldValues:(id *)a3 andFieldToFocus:(id *)a4 withSingleCreditCardData:(id)a5 inField:(id)a6 inForm:(id)a7;
- (void)getSavedAccountMatchesWithCriteria:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)loadCompletionDBIfNeeded;
- (void)notifyKeychainWasDirectlyAffectedBySafari;
- (void)pruneCompletionDB;
- (void)saveRecentlyUsedAutoFillSetWithMatchesToFill:(id)a3 matchesForDoNotFill:(id)a4;
- (void)setInfo:(id)a3 forDomain:(id)a4;
- (void)setLocale:(id)a3;
- (void)setPreferredIdentifier:(id)a3 forProperty:(id)a4 withContact:(id)a5;
- (void)updateLastUsedUsernameAndExtractUsernameAndPasswordFromForm:(id)a3 shouldPreferAnnotatedCredentials:(BOOL)a4 atURL:(id)a5 username:(id *)a6 password:(id *)a7 inContext:(id)a8;
- (void)willSubmitFormWithCredentials:(id)a3 shouldPreferAnnotatedCredentials:(BOOL)a4 atURL:(id)a5 username:(id *)a6 password:(id *)a7 inContext:(id)a8 shouldShowPasswordsAppOnboarding:(BOOL)a9;
@end

@implementation WBSFormDataController

- (WBSFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)WBSFormDataController;
  v3 = [(WBSFormDataController *)&v24 init];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [v5 stringWithFormat:@"com.apple.Safari.%@.%p.internalQueue", v7, v3];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F97E58]);
    v12 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariCoreBundle");
    v13 = [v12 URLForResource:@"WBSAutoFillQuirks" withExtension:@"plist"];
    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    v15 = objc_msgSend(v14, "safari_autoFillQuirksDownloadDirectoryURL");
    uint64_t v16 = [v11 initWithBuiltInQuirksURL:v13 downloadsDirectoryURL:v15 resourceName:@"AutoFillQuirks" resourceVersion:@"1" updateDateDefaultsKey:*MEMORY[0x1E4F98178] updateInterval:86400.0];
    autoFillQuirksManager = v3->_autoFillQuirksManager;
    v3->_autoFillQuirksManager = (WBSAutoFillQuirksManager *)v16;

    [(WBSAutoFillQuirksManager *)v3->_autoFillQuirksManager beginLoadingQuirksFromDisk];
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapOfHighLevelDomainToLastAutomaticFormSubmission = v3->_mapOfHighLevelDomainToLastAutomaticFormSubmission;
    v3->_mapOfHighLevelDomainToLastAutomaticFormSubmission = v18;

    v20 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E4F97E50]);
    agentProxy = v3->_agentProxy;
    v3->_agentProxy = v20;

    v22 = v3;
  }

  return v3;
}

+ (id)dontSaveMarker
{
  return (id)[MEMORY[0x1E4F97E98] dontSaveMarker];
}

+ (BOOL)convertNumber:(id)a3 toAutoFillFormType:(unint64_t *)a4
{
  id v5 = a3;
  v6 = v5;
  BOOL v7 = 0;
  if (v5 && a4)
  {
    unint64_t v8 = [v5 unsignedIntegerValue];
    if (v8 > 5)
    {
      BOOL v7 = 0;
    }
    else
    {
      *a4 = v8;
      BOOL v7 = 1;
    }
  }

  return v7;
}

+ (id)_metadataForControlWithUniqueID:(id)a3 inForm:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(a4, "controls", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 uniqueID];
          char v12 = [v11 isEqualToString:v5];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

+ (id)valueOfControlWithUniqueID:(id)a3 inForm:(id)a4
{
  v4 = [a1 _metadataForControlWithUniqueID:a3 inForm:a4];
  id v5 = [v4 value];

  return v5;
}

- (int64_t)autoFillActionForFormType:(unint64_t)a3 onURL:(id)a4 shouldSubmitAfterFilling:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  int64_t v9 = 0;
  if (a3 == 3 && v5) {
    int64_t v9 = [(WBSAutoFillQuirksManager *)self->_autoFillQuirksManager isAutomaticLoginDisallowedOnURL:v8] ^ 1;
  }

  return v9;
}

- (BOOL)shouldSubmitForm:(id)a3 withUser:(id)a4 password:(id)a5 onURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(WBSFormDataController *)self _removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission];
  v13 = [v12 host];
  long long v14 = objc_msgSend(v13, "safari_highLevelDomainFromHost");

  if (v14)
  {
    long long v15 = [(WBSFormDataController *)self _formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:v12 formMetadata:v10];
    long long v16 = [(NSMutableDictionary *)self->_mapOfHighLevelDomainToLastAutomaticFormSubmission objectForKeyedSubscript:v15];
    if (v16
      && -[WBSFormDataController _dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:](self, "_dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:", v16)|| [v10 type] != 3)
    {
      goto LABEL_9;
    }
    int v17 = [v10 isEligibleForAutomaticLogin] ^ 1;
    if (!a5) {
      LOBYTE(v17) = 1;
    }
    if (v17) {
LABEL_9:
    }
      BOOL v18 = 0;
    else {
      BOOL v18 = [v11 length] != 0;
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (void)didAutomaticallySubmitFormWhenFillingOnURL:(id)a3 formMetadata:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 host];
  id v8 = objc_msgSend(v7, "safari_highLevelDomainFromHost");

  if (v8)
  {
    int64_t v9 = [(WBSFormDataController *)self _formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:v11 formMetadata:v6];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [(NSMutableDictionary *)self->_mapOfHighLevelDomainToLastAutomaticFormSubmission setObject:v10 forKeyedSubscript:v9];
  }
}

- (id)_formKeyForMapOfHighLevelDomainToLastAutomaticFormSubmission:(id)a3 formMetadata:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v22 = a4;
  BOOL v5 = [a3 host];
  v23 = objc_msgSend(v5, "safari_highLevelDomainFromHost");

  id v6 = [v22 userNameElementUniqueID];
  id v7 = [v22 passwordElementUniqueID];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [v22 controls];
  unsigned __int8 v9 = 0;
  unsigned __int8 v10 = 0;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v15 = [v14 uniqueID];
        if ([v6 length] && objc_msgSend(v15, "isEqualToString:", v6))
        {
          unsigned __int8 v9 = [v14 isVisible];
        }
        else if ([v7 length] && objc_msgSend(v15, "isEqualToString:", v7))
        {
          unsigned __int8 v10 = [v14 isVisible];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [v6 length];
  uint64_t v17 = [v7 length];
  if ((v17 != 0) & v10 | !((v16 != 0) & v9)) {
    BOOL v18 = @"%@|U|P";
  }
  else {
    BOOL v18 = @"%@|U";
  }
  if (!((v17 != 0) & v10) | (v16 != 0) & v9) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = @"%@|P";
  }
  v20 = objc_msgSend(NSString, "stringWithFormat:", v19, v23);

  return v20;
}

- (void)_removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission
{
  mapOfHighLevelDomainToLastAutomaticFormSubmission = self->_mapOfHighLevelDomainToLastAutomaticFormSubmission;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__WBSFormDataController__removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission__block_invoke;
  v7[3] = &unk_1E5C9B558;
  v7[4] = self;
  v4 = [(NSMutableDictionary *)mapOfHighLevelDomainToLastAutomaticFormSubmission safari_mapAndFilterKeysAndObjectsUsingBlock:v7];
  BOOL v5 = (NSMutableDictionary *)[v4 mutableCopy];
  id v6 = self->_mapOfHighLevelDomainToLastAutomaticFormSubmission;
  self->_mapOfHighLevelDomainToLastAutomaticFormSubmission = v5;
}

id __97__WBSFormDataController__removeStaleEntriesFromMapOfHighLevelDomainToLastAutomaticFormSubmission__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([*(id *)(a1 + 32) _dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:v4])BOOL v5 = v4; {
  else
  }
    BOOL v5 = 0;
  id v6 = v5;

  return v6;
}

- (BOOL)_dateIsWithinGracePeriodForNotAutomaticallySubmittingLoginForms:(id)a3
{
  [a3 timeIntervalSinceNow];
  return v3 > -300.0;
}

+ (id)fieldToFocusBeforeSubmittingForm:(id)a3
{
  id v3 = a3;
  id v4 = [v3 passwordElementUniqueID];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 userNameElementUniqueID];
  }
  id v7 = v6;

  return v7;
}

- (WBSFormDataController)init
{
  return [(WBSFormDataController *)self initWithAggressiveKeychainCaching:0];
}

- (void)dealloc
{
  [(WBSKeychainCredentialNotificationMonitor *)self->_keychainMonitor removeObserverForToken:self->_keychainNotificationRegistrationToken];
  [(WBSAutoFillQuirksManager *)self->_autoFillQuirksManager prepareForTermination];
  if (self->_keybagCallbackToken)
  {
    id v3 = [MEMORY[0x1E4F97EC8] sharedManager];
    [v3 removeKeyBagLockStatusChangedObserver:self->_keybagCallbackToken];

    id keybagCallbackToken = self->_keybagCallbackToken;
    self->_id keybagCallbackToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WBSFormDataController;
  [(WBSFormDataController *)&v5 dealloc];
}

- (void)_loadCompletionDBIfNeededOnInternalQueue
{
}

- (void)loadCompletionDBIfNeeded
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WBSFormDataController_loadCompletionDBIfNeeded__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __49__WBSFormDataController_loadCompletionDBIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
}

- (void)pruneCompletionDB
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WBSFormDataController_pruneCompletionDB__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __42__WBSFormDataController_pruneCompletionDB__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v41 = 0;
  uint64_t v42 = 0;
  [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [*(id *)(v1 + 32) _domainsWithPreviousDataOnInternalQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v2)
  {
    uint64_t v25 = v1;
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v27 = v2;
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_super v5 = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 32), "safari_dictionaryForKey:", v4);
        if ([v5 count])
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v6 = v5;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v7; ++j)
              {
                if (*(void *)v34 != v8) {
                  objc_enumerationMutation(v6);
                }
                unsigned __int8 v10 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                id v30 = 0;
                id v31 = 0;
                id v30 = v4;
                objc_storeStrong(&v31, v10);
                objc_msgSend(v6, "safari_arrayForKey:", v10);
                uint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
                int v32 = timestampForCompletionValues(v11);

                if (HIDWORD(v42) == v42)
                {
                  WTF::Vector<SortEntry,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,SortEntry&>((uint64_t)&v41, (unint64_t)&v30);
                }
                else
                {
                  uint64_t v12 = &v41[3 * HIDWORD(v42)];
                  uint64_t *v12 = (uint64_t)v30;
                  v12[1] = (uint64_t)v31;
                  *((_DWORD *)v12 + 4) = v32;
                  ++HIDWORD(v42);
                }
              }
              uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v7);
          }
        }
        uint64_t v1 = v25;
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v2);
  }
  uint64_t v13 = v1;

  id v30 = &__block_literal_global_51;
  unint64_t v14 = 126 - 2 * __clz(HIDWORD(v42));
  if (HIDWORD(v42)) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(SortEntry const&,SortEntry const&),SortEntry*,false>(v41, &v41[3 * HIDWORD(v42)], (uint64_t *)&v30, v15, 1);

  LODWORD(v1) = vcvtps_s32_f32((float)HIDWORD(v42) * 0.1);
  if ((int)v1 < 1)
  {
    char v17 = 0;
  }
  else
  {
    unint64_t v16 = 0;
    char v17 = 0;
    uint64_t v18 = 1;
    do
    {
      if (v16 >= HIDWORD(v42)
        || (id v19 = (id)v41[v18 - 1],
            objc_msgSend(*(id *)(*(void *)(v13 + 32) + 32), "safari_dictionaryForKey:", v19),
            v20 = objc_claimAutoreleasedReturnValue(),
            v16 >= HIDWORD(v42)))
      {
        __break(0xC471u);
        JUMPOUT(0x1A6BF70A8);
      }
      v21 = v20;
      [v20 removeObjectForKey:v41[v18]];
      if (![v21 count])
      {
        [*(id *)(*(void *)(v13 + 32) + 32) removeObjectForKey:v19];
        char v17 = 1;
      }

      ++v16;
      v18 += 3;
    }
    while (v1 != v16);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WBSFormDataController_pruneCompletionDB__block_invoke_3;
  block[3] = &unk_1E5C8D4B0;
  char v29 = v17 & 1;
  block[4] = *(void *)(v13 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  return WTF::Vector<SortEntry,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v41, v22);
}

BOOL __42__WBSFormDataController_pruneCompletionDB__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_DWORD *)(a2 + 16) < *(_DWORD *)(a3 + 16);
}

uint64_t __42__WBSFormDataController_pruneCompletionDB__block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) domainsWithPreviousDataChanged];
  }
  return result;
}

- (id)_completionDB
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned __int8 v9 = __Block_byref_object_copy__13;
  unsigned __int8 v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__WBSFormDataController__completionDB__block_invoke;
  v5[3] = &unk_1E5C8E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__WBSFormDataController__completionDB__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)allFormDataForSaving
{
  if (self->_completionDBSize > 0x7D000) {
    [(WBSFormDataController *)self pruneCompletionDB];
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F28F98];
  id v4 = [(WBSFormDataController *)self _completionDB];
  id v17 = 0;
  objc_super v5 = [v3 dataWithPropertyList:v4 format:200 options:0 error:&v17];
  id v6 = v17;

  if (v5)
  {
    uint64_t v7 = [(WBSFormDataController *)self encryptOrDecryptData:v5 encrypt:1];
  }
  else
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(WBSFormDataController *)(uint64_t)v6 allFormDataForSaving];
    }
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] data];
  }
  uint64_t v15 = (void *)v7;

  return v15;
}

- (id)_domainsWithPreviousDataOnInternalQueue
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_valuesDB count];
  if (v3)
  {
    uint64_t v3 = [(NSMutableDictionary *)self->_valuesDB allKeys];
  }
  return v3;
}

- (id)domainsWithPreviousData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__13;
  uint64_t v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__WBSFormDataController_domainsWithPreviousData__block_invoke;
  v5[3] = &unk_1E5C8E1B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__WBSFormDataController_domainsWithPreviousData__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
  uint64_t v2 = [*(id *)(a1 + 32) _domainsWithPreviousDataOnInternalQueue];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)clearPreviousDataForDomain:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke_2;
    block[3] = &unk_1E5C8CA70;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__WBSFormDataController_clearPreviousDataForDomain___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) domainsWithPreviousDataChanged];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 saveCompletionDBSoon];
}

- (void)clearPreviousDataDatabaseItemsAddedAfterDate:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) _domainsWithPreviousDataOnInternalQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v2)
  {
    char v17 = 0;
    uint64_t v13 = *(void *)v25;
    uint64_t v14 = v2;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "safari_dictionaryForKey:");
        if ([v3 count])
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v4 = [v3 allKeys];
          uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v5)
          {
            uint64_t v6 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v5; ++j)
              {
                if (*(void *)v21 != v6) {
                  objc_enumerationMutation(v4);
                }
                uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * j);
                objc_msgSend(v3, "safari_arrayForKey:", v8);
                uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
                int v10 = timestampForCompletionValues(v9);

                id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v10];
                if ([v11 compare:*(void *)(a1 + 40)] == 1)
                {
                  [v3 removeObjectForKey:v8];
                  char v17 = 1;
                }
              }
              uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v5);
          }

          if (![v3 count]) {
            [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v15];
          }
        }
        else
        {
          [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v15];
          char v17 = 1;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v14);
  }
  else
  {
    char v17 = 0;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke_2;
  block[3] = &unk_1E5C8D4B0;
  char v19 = v17 & 1;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__WBSFormDataController_clearPreviousDataDatabaseItemsAddedAfterDate___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) saveCompletionDBSoon];
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 domainsWithPreviousDataChanged];
  }
  return result;
}

- (id)infoForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__13;
  unint64_t v16 = __Block_byref_object_dispose__13;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WBSFormDataController_infoForDomain___block_invoke;
  block[3] = &unk_1E5C9B5A0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __39__WBSFormDataController_infoForDomain___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "safari_dictionaryForKey:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setInfo:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WBSFormDataController_setInfo_forDomain___block_invoke;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __43__WBSFormDataController_setInfo_forDomain___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) setValue:a1[5] forKey:a1[6]];
}

- (id)uniqueIDOfContact:(id)a3
{
  uint64_t v3 = [a3 identifier];
  return v3;
}

- (void)setPreferredIdentifier:(id)a3 forProperty:(id)a4 withContact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__WBSFormDataController_setPreferredIdentifier_forProperty_withContact___block_invoke;
  v15[3] = &unk_1E5C9B5C8;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(internalQueue, v15);
}

void __72__WBSFormDataController_setPreferredIdentifier_forProperty_withContact___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
  id v5 = [*(id *)(a1 + 32) uniqueIDOfContact:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectForKeyedSubscript:");
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
  }
  else
  {
    id v4 = objc_opt_new();
    [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 56)];
    uint64_t v3 = v4;
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:v4 forKey:v5];
  }
}

- (id)preferredIdentifierForProperty:(id)a3 withContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__13;
  long long v21 = __Block_byref_object_dispose__13;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__WBSFormDataController_preferredIdentifierForProperty_withContact___block_invoke;
  v13[3] = &unk_1E5C9B5F0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __68__WBSFormDataController_preferredIdentifierForProperty_withContact___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[9];
  id v4 = [v2 uniqueIDOfContact:*(void *)(a1 + 40)];
  objc_msgSend(v3, "safari_dictionaryForKey:", v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = objc_msgSend(v8, "safari_stringForKey:", *(void *)(a1 + 48));
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)preferredIdentifierExistsForProperty:(id)a3 withContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__WBSFormDataController_preferredIdentifierExistsForProperty_withContact___block_invoke;
  v12[3] = &unk_1E5C9B5F0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(internalQueue, v12);
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

void __74__WBSFormDataController_preferredIdentifierExistsForProperty_withContact___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadCompletionDBIfNeededOnInternalQueue];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[9];
  id v4 = [v2 uniqueIDOfContact:*(void *)(a1 + 40)];
  objc_msgSend(v3, "safari_dictionaryForKey:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [v6 allKeys];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 containsObject:*(void *)(a1 + 48)];
}

- (id)_recentlyUsedAutoFillDictionaries
{
  [(WBSFormDataController *)self loadCompletionDBIfNeeded];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_recentlyUsedAutoFillSets copy];
  return v3;
}

- (void)addRecentlyUsedAutoFillSet:(id)a3 appendToTheEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(WBSFormDataController *)self loadCompletionDBIfNeeded];
  recentlyUsedAutoFillSets = self->_recentlyUsedAutoFillSets;
  if (v4)
  {
    [(NSMutableArray *)recentlyUsedAutoFillSets addObject:v7];
    if ((unint64_t)[(NSMutableArray *)self->_recentlyUsedAutoFillSets count] >= 2) {
      [(NSMutableArray *)self->_recentlyUsedAutoFillSets removeObjectAtIndex:0];
    }
  }
  else
  {
    [(NSMutableArray *)recentlyUsedAutoFillSets insertObject:v7 atIndex:0];
    if ((unint64_t)[(NSMutableArray *)self->_recentlyUsedAutoFillSets count] >= 2) {
      [(NSMutableArray *)self->_recentlyUsedAutoFillSets removeLastObject];
    }
    [(WBSFormDataController *)self saveCompletionDBSoon];
  }
}

- (id)recentlyUsedAutoFillSets
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v23 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v3 = [(WBSFormDataController *)self _recentlyUsedAutoFillDictionaries];
  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      uint64_t v24 = v4;
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v26 = [v6 objectForKeyedSubscript:@"recentlyUsedAutoFillSetArray"];
        long long v25 = [v6 objectForKeyedSubscript:@"recentlyUsedAutoFillSetDoNotFillArray"];
        long long v27 = [v6 objectForKeyedSubscript:@"recentlyUsedAutoFillSetLabel"];
        id v7 = [MEMORY[0x1E4F1CA48] array];
        id v8 = [MEMORY[0x1E4F1CA48] array];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v9 = v26;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = +[WBSAddressBookMatch addressBookMatchWithDictionaryRepresentation:*(void *)(*((void *)&v32 + 1) + 8 * j)];
              [v7 addObject:v13];
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v10);
        }

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = v25;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v29;
          do
          {
            for (uint64_t k = 0; k != v15; ++k)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = +[WBSAddressBookMatch addressBookMatchWithDictionaryRepresentation:*(void *)(*((void *)&v28 + 1) + 8 * k)];
              [v8 addObject:v18];
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v15);
        }

        char v19 = [[WBSRecentlyUsedAutoFillSet alloc] initWithFillMatches:v7 skipMatches:v8 label:v27];
        [v23 addObject:v19];
      }
      uint64_t v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v4);
  }

  return v23;
}

+ (BOOL)stringLooksLikeCreditCardNumber:(id)a3
{
  return WBSCreditCardTypeFromNumber() != 0;
}

+ (BOOL)formContainsCreditCardData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(a3, "controls", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 value];
        if ([v9 length]
          && (([v8 looksLikeCreditCardNumberField] & 1) != 0
           || ([v8 looksLikeCreditCardSecurityCodeField] & 1) != 0
           || [a1 stringLooksLikeCreditCardNumber:v9]))
        {

          BOOL v10 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_15:

  return v10;
}

+ (BOOL)formContainsCreditCardNumberField:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(a3, "controls", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) looksLikeCreditCardNumberField])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)formContainsCreditCardNumberOrCardSecurityCodeField:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(a3, "controls", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v7 looksLikeCreditCardNumberField] & 1) != 0
          || ([v7 looksLikeCreditCardSecurityCodeField] & 1) != 0)
        {
          BOOL v8 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)addPreviousDataMatchesForFieldWithName:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 toArray:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v20 length] && objc_msgSend(v10, "length"))
  {
    [(WBSFormDataController *)self loadCompletionDBIfNeeded];
    long long v13 = [(WBSFormDataController *)self infoForDomain:v10];
    long long v14 = objc_msgSend(v13, "safari_arrayForKey:", v20);
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 count];
      if (v16 - 2 >= 0)
      {
        uint64_t v17 = v16 - 1;
        do
        {
          uint64_t v18 = objc_msgSend(v15, "safari_stringAtIndex:", --v17);
          if (v18
            && !+[WBSFormDataController stringLooksLikeCreditCardNumber:](WBSFormDataController, "stringLooksLikeCreditCardNumber:", v18)&& ((objc_msgSend(v18, "safari_hasLocalizedCaseInsensitivePrefix:", v11) & 1) != 0|| !objc_msgSend(v11, "length")))
          {
            char v19 = [[WBSUserTypedFormString alloc] initWithUserTypedString:v18];
            [v12 insertObject:v19 atIndex:0];
          }
        }
        while (v17 > 0);
      }
    }
  }
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5
{
  uint64_t v5 = [(WBSFormDataController *)self addressBookMatchesForProperty:a3 key:a4 label:a5 partialString:0 contact:0 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:1];
  return v5;
}

- (id)addressBookMatchesForProperty:(id)a3 key:(id)a4 label:(id)a5 partialString:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  return 0;
}

- (void)addABMatchesForValueSpecifier:(id)a3 matchingPartialString:(id)a4 toArray:(id)a5 preferredLabel:(id)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v68 = a5;
  id v67 = a6;
  id v58 = a7;
  v64 = v13;
  uint64_t v15 = [v13 property];
  uint64_t v16 = [v15 length];

  if (!v16) {
    goto LABEL_58;
  }
  uint64_t v17 = [v64 label];
  uint64_t v18 = [v17 length];

  if (v18)
  {

    id v67 = 0;
  }
  char v19 = [v64 property];
  id v20 = [v64 component];
  long long v21 = [v64 label];
  uint64_t v22 = [(WBSFormDataController *)self addressBookMatchesForProperty:v19 key:v20 label:v21 partialString:v14 contact:v58 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v8];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v22;
  uint64_t v23 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v78;
    uint64_t v62 = *MEMORY[0x1E4F98048];
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v78 != v24) {
          objc_enumerationMutation(obj);
        }
        long long v26 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        long long v27 = [v26 stringValue];
        if (![v14 length]
          || (objc_msgSend(v27, "safari_hasLocalizedCaseInsensitivePrefix:", v14) & 1) != 0)
        {
LABEL_22:
          if ([v67 length])
          {
            long long v35 = [v26 label];
            if ([v35 length])
            {
              long long v36 = [v26 label];
              char v37 = [v36 isEqualToString:v67];

              if ((v37 & 1) == 0) {
                goto LABEL_30;
              }
            }
            else
            {
            }
          }
          id v38 = [v26 stringValue];
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = ___ZL17findLiteralStringP7NSArrayP8NSString_block_invoke;
          v81[3] = &unk_1E5C9B7B8;
          id v82 = v38;
          id v39 = v38;
          uint64_t v40 = [v68 indexOfObjectPassingTest:v81];

          if (v40 == 0x7FFFFFFFFFFFFFFFLL) {
            [v68 addObject:v26];
          }
          else {
            [v68 replaceObjectAtIndex:v40 withObject:v26];
          }
        }
        else
        {
          long long v28 = [v64 property];
          char v29 = [v28 isEqualToString:v62];

          if (v29)
          {
            long long v30 = [(WBSFormDataController *)self _singleFieldPhoneNumberCandidates:v27];
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v31 = v30;
            uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v86 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v74;
              while (2)
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v74 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  if (objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * j), "safari_hasLocalizedCaseInsensitivePrefix:", v14))
                  {

                    goto LABEL_22;
                  }
                }
                uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v86 count:16];
                if (v32) {
                  continue;
                }
                break;
              }
            }
          }
        }
LABEL_30:
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
    }
    while (v23);
  }

  v84[0] = @"_$!<Mobile>!$_";
  v84[1] = @"iPhone";
  v85[0] = &unk_1EFC22660;
  v85[1] = &unk_1EFC22678;
  v84[2] = @"_$!<Home>!$_";
  v84[3] = @"_$!<Work>!$_";
  v85[2] = &unk_1EFC22690;
  v85[3] = &unk_1EFC226A8;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:4];
  if ([v68 count]) {
    goto LABEL_57;
  }
  v41 = [v64 property];
  uint64_t v42 = [v41 isEqualToString:*MEMORY[0x1E4F98048]];

  if ((v42 & 1) == 0) {
    goto LABEL_57;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v59 = obj;
  uint64_t v43 = [v59 countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (!v43)
  {

    goto LABEL_55;
  }
  id v66 = 0;
  uint64_t v61 = *(void *)v70;
  do
  {
    uint64_t v44 = v43;
    for (uint64_t k = 0; k != v44; ++k)
    {
      if (*(void *)v70 != v61) {
        objc_enumerationMutation(v59);
      }
      v46 = *(void **)(*((void *)&v69 + 1) + 8 * k);
      uint64_t v47 = [v14 length];
      if (v47)
      {
        uint64_t v42 = [v46 stringValue];
        if (!objc_msgSend((id)v42, "safari_hasLocalizedCaseInsensitivePrefix:", v14))
        {
          v50 = (void *)v42;
LABEL_49:

          continue;
        }
      }
      v48 = [v46 label];
      v49 = [v63 objectForKeyedSubscript:v48];

      if (v47)
      {

        if (!v49) {
          continue;
        }
      }
      else if (!v49)
      {
        continue;
      }
      if (!v66) {
        goto LABEL_48;
      }
      v51 = [v46 label];
      v52 = [v63 objectForKeyedSubscript:v51];
      uint64_t v53 = [v52 integerValue];
      v54 = [v66 label];
      v55 = [v63 objectForKeyedSubscript:v54];
      LODWORD(v53) = v53 < [v55 integerValue];

      if (v53)
      {
LABEL_48:
        id v56 = v46;
        v50 = v66;
        id v66 = v56;
        goto LABEL_49;
      }
    }
    uint64_t v43 = [v59 countByEnumeratingWithState:&v69 objects:v83 count:16];
  }
  while (v43);

  if (v66)
  {
    objc_msgSend(v68, "addObject:");
    v57 = v66;
    goto LABEL_56;
  }
LABEL_55:
  v57 = 0;
LABEL_56:

LABEL_57:
LABEL_58:
}

+ (id)addressBookAddressPropertyKey
{
  return (id)*MEMORY[0x1E4F98020];
}

+ (id)allAddressBookAddressComponentKeys
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"City";
  v4[1] = @"State";
  v4[2] = @"Street";
  v4[3] = @"ZIP";
  v4[4] = @"Country";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

+ (id)allAddressBookNonAddressPropertyKeys
{
  v8[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F98058];
  v8[0] = *MEMORY[0x1E4F98050];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F98030];
  v8[2] = *MEMORY[0x1E4F98068];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F98038];
  v8[4] = *MEMORY[0x1E4F98048];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F98028];
  v8[6] = *MEMORY[0x1E4F98040];
  v8[7] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  return v6;
}

+ (id)specifierForAddressBookLabel:(id)a3
{
  uint64_t v3 = +[WBSFormToABBinder specifierForLabel:a3];
  return v3;
}

+ (id)allSynonymsForMatch:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stringValue];
  uint64_t v5 = +[WBSFormToABBinder allSynonymsForMatch:v3 formAppearsToBeChinese:languageOfTextIsChinese(v4)];

  return v5;
}

+ (BOOL)formContainsDateFields:(id)a3 matchingAddressBookMatch:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 controls];
  if (v7
    && ([v6 dateValue],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    long long v9 = [v5 controls];
    id v22 = 0;
    id v23 = 0;
    id v21 = 0;
    identifyDateFields(v9, &v23, &v22, &v21);
    id v10 = v23;
    id v11 = v22;
    id v12 = v21;

    id v13 = [v6 dateValue];
    id v14 = [v10 value];
    char v15 = stringContainsDateComponentValue(v14, 0, v13);

    if ((v15 & 1) != 0
      && ([v11 value],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          char v17 = stringContainsDateComponentValue(v16, 1, v13),
          v16,
          (v17 & 1) != 0))
    {
      uint64_t v18 = [v12 value];
      char v19 = stringContainsDateComponentValue(v18, 2, v13);
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (void)_currentLocaleDidChange:(id)a3
{
  cachedBirthdayAndLocalizedStrings = self->_cachedBirthdayAndLocalizedStrings;
  self->_cachedBirthdayAndLocalizedStrings = 0;
}

- (id)_cachedLocalizedStringsForBirthdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    cachedBirthdayAndLocalizedStrings = self->_cachedBirthdayAndLocalizedStrings;
    id v16 = 0;
    id v17 = 0;
    [(WBSPair *)cachedBirthdayAndLocalizedStrings getFirst:&v17 second:&v16];
    id v6 = v17;
    id v7 = v16;
    if ([v6 isEqualToDate:v4])
    {
      BOOL v8 = v7;
    }
    else
    {
      long long v9 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_localeIdentifiersForMostWidelyUsedLanguages");
      id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v11 = [v10 localeIdentifier];
      id v12 = [v9 setByAddingObject:v11];

      BOOL v8 = objc_msgSend(v4, "safari_stringsFromDateForLocaleIdentifiers:", v12);
      id v13 = (WBSPair *)[objc_alloc(MEMORY[0x1E4F97EE0]) initWithFirst:v4 second:v8];
      id v14 = self->_cachedBirthdayAndLocalizedStrings;
      self->_cachedBirthdayAndLocalizedStrings = v13;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)bestAddressBookLabelForFormMetadata:(id)a3 formControlValue:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v6 = a4;
  if (!v6)
  {
    long long v34 = 0;
    goto LABEL_50;
  }
  uint64_t v32 = [(id)objc_opt_class() addressBookAddressPropertyKey];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = [(id)objc_opt_class() allAddressBookAddressComponentKeys];
  uint64_t v28 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (!v28) {
    goto LABEL_19;
  }
  id v33 = *(id *)v53;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(id *)v53 != v33) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v30 = v7;
      -[WBSFormDataController addressBookMatchesForProperty:key:label:](self, "addressBookMatchesForProperty:key:label:", v32);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v39 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (!v8) {
        goto LABEL_17;
      }
      uint64_t v9 = *(void *)v49;
      while (2)
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v49 != v9) {
            objc_enumerationMutation(v39);
          }
          id v11 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          id v12 = [v11 stringValue];
          id v13 = v12;
          if (v12 && ![v12 caseInsensitiveCompare:v6])
          {
            long long v34 = [v30 lowercaseString];
LABEL_48:

            goto LABEL_49;
          }
          id v14 = [(id)objc_opt_class() allSynonymsForMatch:v11];
          char v15 = objc_msgSend(v14, "safari_setByApplyingBlock:", &__block_literal_global_206_0);

          id v16 = [v6 lowercaseString];
          id v17 = [v16 stringByReplacingOccurrencesOfString:@"." withString:&stru_1EFBE3CF8];
          int v18 = [v15 containsObject:v17];

          if (v18)
          {
            long long v34 = [v30 lowercaseString];
LABEL_47:

            goto LABEL_48;
          }
        }
        uint64_t v8 = [v39 countByEnumeratingWithState:&v48 objects:v58 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_17:
    }
    uint64_t v28 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  }
  while (v28);
LABEL_19:

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = [(id)objc_opt_class() allAddressBookNonAddressPropertyKeys];
  uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v27)
  {
    uint64_t v29 = *(void *)v45;
    uint64_t v37 = *MEMORY[0x1E4F98028];
    long long v34 = &stru_1EFBE3CF8;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(obj);
        }
        char v19 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v39 = [(WBSFormDataController *)self addressBookMatchesForProperty:v19 key:0 label:0];
        uint64_t v20 = [v39 countByEnumeratingWithState:&v40 objects:v56 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v41;
          while (2)
          {
            for (uint64_t m = 0; m != v20; ++m)
            {
              if (*(void *)v41 != v21) {
                objc_enumerationMutation(v39);
              }
              id v23 = *(void **)(*((void *)&v40 + 1) + 8 * m);
              uint64_t v24 = [v23 stringValue];
              id v13 = v24;
              if (v24 && ![v24 caseInsensitiveCompare:v6])
              {
                long long v34 = [v19 lowercaseString];
                goto LABEL_48;
              }
              char v15 = [v23 dateValue];
              if (v15 && [v19 isEqualToString:v37])
              {
                long long v25 = [(WBSFormDataController *)self _cachedLocalizedStringsForBirthdate:v15];
                if ([v25 containsObject:v6]
                  || ([(id)objc_opt_class() formContainsDateFields:v38 matchingAddressBookMatch:v23] & 1) != 0)
                {
                  long long v34 = [v19 lowercaseString];

                  goto LABEL_47;
                }
              }
            }
            uint64_t v20 = [v39 countByEnumeratingWithState:&v40 objects:v56 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v27);
  }
  else
  {
    long long v34 = &stru_1EFBE3CF8;
  }
LABEL_49:

LABEL_50:
  return v34;
}

id __78__WBSFormDataController_bestAddressBookLabelForFormMetadata_formControlValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 lowercaseString];
  return v2;
}

- (BOOL)addressBookHasDataForLabel:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_opt_class();
    id v6 = [v4 lowercaseString];
    id v7 = [v5 specifierForAddressBookLabel:v6];

    if (v7)
    {
      uint64_t v8 = [v7 property];
      uint64_t v9 = [v7 component];
      id v10 = [v7 label];
      id v11 = [(WBSFormDataController *)self addressBookMatchesForProperty:v8 key:v9 label:v10];

      BOOL v12 = [v11 count] != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)shouldDisplayOneTimeCodeForControl:(id)a3 inForm:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 value];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    if ([v5 looksLikeOneTimeCodeField])
    {
      char v9 = 1;
      goto LABEL_14;
    }
    id v10 = [v5 uniqueID];
    id v11 = [v6 userNameElementUniqueID];
    char v12 = [v10 isEqualToString:v11];

    if (v12) {
      goto LABEL_6;
    }
    id v13 = [v6 passwordElementUniqueID];
    if ([v10 isEqualToString:v13])
    {
      char v9 = 0;
    }
    else
    {
      id v14 = [v6 oldPasswordElementUniqueID];
      if ([v10 isEqualToString:v14]) {
        goto LABEL_10;
      }
      id v16 = [v6 confirmPasswordElementUniqueID];
      char v17 = [v10 isEqualToString:v16];

      if (v17)
      {
LABEL_6:
        char v9 = 0;
LABEL_13:

        goto LABEL_14;
      }
      id v13 = +[WBSFormDataController specifierForControl:v5];
      int v18 = [v13 property];
      char v19 = [v18 isEqualToString:*MEMORY[0x1E4F98048]];

      if (v19)
      {
        char v9 = 1;
        goto LABEL_12;
      }
      id v14 = [v13 property];
      if (![v14 isEqualToString:*MEMORY[0x1E4F98020]])
      {
LABEL_10:
        char v9 = 0;
      }
      else
      {
        uint64_t v20 = [v13 component];
        char v9 = [v20 isEqualToString:@"ZIP"];
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  char v9 = 0;
LABEL_14:

  return v9;
}

+ (BOOL)shouldDisplayHideMyEmailForControl:(id)a3
{
  id v3 = a3;
  id v4 = [v3 value];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    id v7 = +[WBSFormDataController specifierForControl:v3];
    uint64_t v8 = [v7 property];
    uint64_t v6 = [v8 isEqualToString:*MEMORY[0x1E4F98030]];
  }
  return v6;
}

+ (id)specifierForControl:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 classification];
  uint64_t v5 = [v3 classificationHints];
  uint64_t v6 = [v3 orderedParts];
  id v7 = +[WBSFormToABBinder specifierForClassification:v4 hints:v5 orderedParts:v6];

  if (!v7)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = objc_msgSend(v3, "autocompleteTokens", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        id v7 = +[WBSFormToABBinder specifierForAutocompleteToken:*(void *)(*((void *)&v13 + 1) + 8 * v11)];
        if (v7) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      uint64_t v8 = [v3 addressBookLabel];
      if (v8)
      {
        id v7 = +[WBSFormToABBinder specifierForLabel:v8];
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  return v7;
}

+ (id)stringWithAddressBookValue:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
LABEL_5:
    uint64_t v8 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 objectForKey:v6];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)matchesForControl:(id)a3 atURL:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  long long v14 = +[WBSFormDataController domainFromURL:a4];
  LOBYTE(v17) = a7;
  long long v15 = [(WBSFormDataController *)self _matchesForControl:v12 inDomain:v14 matchingPartialString:v13 autoFillDataType:a6 preferredLabel:0 contact:0 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v17];

  return v15;
}

- (id)matchesForControl:(id)a3 atURL:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 contact:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = +[WBSFormDataController domainFromURL:a4];
  LOBYTE(v20) = a8;
  uint64_t v18 = [(WBSFormDataController *)self _matchesForControl:v14 inDomain:v17 matchingPartialString:v15 autoFillDataType:a6 preferredLabel:0 contact:v16 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v20];

  return v18;
}

- (id)_matchesForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  LOBYTE(v10) = a8;
  uint64_t v8 = [(WBSFormDataController *)self _matchesForControl:a3 inDomain:a4 matchingPartialString:a5 autoFillDataType:a6 preferredLabel:a7 contact:0 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v10];
  return v8;
}

- (id)_matchesForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 contact:(id)a8 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  if (([v15 looksLikeCreditCardNumberField] & 1) != 0
    || ([v15 looksLikeCreditCardSecurityCodeField] & 1) != 0)
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    id v38 = [v15 fieldName];
    int v21 = ![(WBSFormDataController *)self shouldAutoFillFromPreviousData];
    if ((unint64_t)(a6 - 1) > 1) {
      LOBYTE(v21) = 1;
    }
    if ((v21 & 1) == 0) {
      [(WBSFormDataController *)self addPreviousDataMatchesForFieldWithName:v38 inDomain:v16 matchingPartialString:v17 toArray:v20];
    }
    int v22 = ![(WBSFormDataController *)self shouldAutoFillFromAddressBook];
    if ((a6 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      LOBYTE(v22) = 1;
    }
    if ((v22 & 1) == 0)
    {
      id v23 = [(id)objc_opt_class() specifierForControl:v15];
      uint64_t v24 = v23;
      if (v23)
      {
        uint64_t v37 = v23;
        long long v25 = [v23 property];
        int v26 = [v25 isEqualToString:*MEMORY[0x1E4F98030]];

        if (([v15 isLabeledUsernameField] ^ 1 | v26))
        {
          [(WBSFormDataController *)self addABMatchesForValueSpecifier:v37 matchingPartialString:v17 toArray:v20 preferredLabel:v18 contact:v19 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:a9];
          if (v26)
          {
            uint64_t v24 = v37;
            uint64_t v27 = objc_msgSend(v16, "safari_substringFromPrefix:", @".");
            uint64_t v28 = v27;
            if (!v27) {
              uint64_t v27 = v16;
            }
            long long v35 = objc_msgSend(v27, "safari_bestURLForUserTypedString");

            long long v36 = (void *)[objc_alloc(MEMORY[0x1E4F97FF0]) initWithString:v17 matchingType:0];
            id v29 = objc_alloc(MEMORY[0x1E4F97FC8]);
            long long v34 = [(WBSFormDataController *)self autoFillQuirksManager];
            long long v30 = [v34 associatedDomainsManager];
            id v33 = (void *)[v29 initWithURL:v35 options:35 userNameQuery:v36 associatedDomainsManager:v30 webFrameIdentifier:0];

            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __179__WBSFormDataController__matchesForControl_inDomain_matchingPartialString_autoFillDataType_preferredLabel_contact_allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier___block_invoke;
            v39[3] = &unk_1E5C9B638;
            id v31 = v20;
            id v40 = v31;
            [(WBSFormDataController *)self getSavedAccountMatchesWithCriteria:v33 synchronously:1 completionHandler:v39];

            uint64_t v20 = v31;
          }
          else
          {
            uint64_t v24 = v37;
          }
        }
        else
        {

          uint64_t v24 = v20;
          uint64_t v20 = 0;
        }
      }
    }
  }

  return v20;
}

void __179__WBSFormDataController__matchesForControl_inDomain_matchingPartialString_autoFillDataType_preferredLabel_contact_allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = objc_msgSend(a2, "matchesForPasswordAutoFill", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = *MEMORY[0x1E4F98030];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v8 user];
        if (objc_msgSend(v9, "safari_looksLikeEmailAddress"))
        {
          uint64_t v10 = [v8 savedAccount];
          uint64_t v11 = [v10 credentialTypes];

          if ((unint64_t)(v11 - 2) < 2 || v11 == 1)
          {
            id v12 = _WBSLocalizedString();
          }
          else
          {
            id v12 = 0;
          }
          id v13 = *(void **)(a1 + 32);
          id v14 = [[WBSAddressBookMatch alloc] initWithValue:v9 property:v6 key:0 identifier:0 label:v12];
          [v13 addObject:v14];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (id)cascadingAddressMatchesForMatch:(id)a3 contact:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 key];
  char v9 = [v8 isEqualToString:@"City"];

  if ((v9 & 1) != 0
    || ([v6 key],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqualToString:@"Street"],
        v10,
        (v11 & 1) != 0))
  {
    id v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    id v13 = [v6 label];
    [(WBSFormDataController *)self addAllAddressDataIfNecessary:v12 contactLabel:v13 contact:v7];

    id v14 = [v6 identifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__WBSFormDataController_cascadingAddressMatchesForMatch_contact___block_invoke;
    v18[3] = &unk_1E5C9B660;
    id v19 = v14;
    char v20 = v9;
    id v15 = v14;
    long long v16 = objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v18);
  }
  else
  {
    v21[0] = v6;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }

  return v16;
}

uint64_t __65__WBSFormDataController_cascadingAddressMatchesForMatch_contact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  char v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      id v6 = [v3 key];
      if (([v6 isEqualToString:@"City"] & 1) != 0
        || ([v6 isEqualToString:@"State"] & 1) != 0
        || ([v6 isEqualToString:@"ZIP"] & 1) != 0)
      {
        uint64_t v7 = 1;
      }
      else
      {
        uint64_t v7 = [v6 isEqualToString:@"Country"];
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)bestMatchForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a8
{
  LOBYTE(v10) = a8;
  uint64_t v8 = [(WBSFormDataController *)self bestMatchForControl:a3 inDomain:a4 matchingPartialString:a5 autoFillDataType:a6 preferredLabel:a7 contact:0 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v10];
  return v8;
}

- (id)bestMatchForControl:(id)a3 inDomain:(id)a4 matchingPartialString:(id)a5 autoFillDataType:(int64_t)a6 preferredLabel:(id)a7 contact:(id)a8 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a9
{
  LOBYTE(v12) = a9;
  char v9 = [(WBSFormDataController *)self _matchesForControl:a3 inDomain:a4 matchingPartialString:a5 autoFillDataType:a6 preferredLabel:a7 contact:a8 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v12];
  if ([v9 count])
  {
    uint64_t v10 = [v9 objectAtIndex:0];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)continuingFieldsInFormControls:(id)a3 startingAtIndex:(unint64_t)a4 textFieldsOnly:(BOOL)a5 ignorePositioning:(BOOL)a6
{
  BOOL v85 = a5;
  id v7 = a3;
  id v88 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];
  [v88 addObject:v8];

  uint64_t v82 = *MEMORY[0x1E4F98048];
  unint64_t v9 = a4 + 1;
  id v84 = v7;
  while (v9 < [v7 count])
  {
    unint64_t v92 = v9;
    uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
    char v11 = v10;
    if (v85 && ([v10 isTextField] & 1) == 0) {
      goto LABEL_68;
    }
    uint64_t v12 = v11;
    id v13 = v88;
    if (![(WBSFormControlMetadata *)v12 isTextField]
      && ([(WBSFormControlMetadata *)v12 tagName],
          id v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = objc_msgSend(v14, "safari_isCaseInsensitiveEqualToString:", @"select"),
          v14,
          (v15 & 1) == 0)
      || (uniqueIDForAutoFillOfControl(v12, 7),
          long long v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          !v16))
    {
LABEL_67:

LABEL_68:
      break;
    }
    v90 = v12;
    v91 = v11;
    long long v17 = v12;
    id v89 = v13;
    id v18 = v13;
    id v19 = [v18 lastObject];
    v93 = [(WBSFormControlMetadata *)v19 addressBookLabel];
    char v20 = [(WBSFormControlMetadata *)v17 addressBookLabel];
    int v21 = v93;
    id v22 = v20;
    id v23 = v22;
    v95 = v22;
    if (!v21 || !v22) {
      goto LABEL_20;
    }
    if ([(WBSFormControlMetadata *)v21 isEqualToString:v22])
    {
      BOOL v24 = 1;
      id v25 = v95;
      int v26 = v21;
LABEL_44:

      goto LABEL_45;
    }
    uint64_t v27 = +[WBSFormToABBinder specifierForLabel:v21];
    id v23 = v95;
    if (!v27) {
      goto LABEL_20;
    }
    uint64_t v28 = +[WBSFormToABBinder specifierForLabel:v95];
    if (!v28) {
      goto LABEL_42;
    }
    id v29 = [(WBSFormControlMetadata *)v27 property];
    long long v30 = [v28 property];
    char v31 = [v29 isEqualToString:v30];

    if ((v31 & 1) == 0)
    {

      id v23 = v95;
LABEL_20:

LABEL_21:
      if fieldLooksLikeDateField(v19) && (fieldLooksLikeDateField(v17)) {
        goto LABEL_32;
      }
      long long v35 = v17;
      id v36 = v18;
      if ((unint64_t)[v36 count] <= 4)
      {
        uint64_t v37 = [v36 objectAtIndexedSubscript:0];
        id v38 = [v37 addressBookLabel];

        id v39 = +[WBSFormToABBinder specifierForLabel:v38];
        id v40 = [v39 property];
        char v41 = [v40 isEqualToString:v82];

        if (v41)
        {
          BOOL v42 = fieldLooksLikeItExpectsDataOfSize(v35, 5);

          if (v42) {
            goto LABEL_32;
          }
          goto LABEL_29;
        }
      }
LABEL_29:
      long long v43 = v35;
      id v44 = v36;
      if ((unint64_t)[v44 count] > 2) {
        goto LABEL_34;
      }
      long long v45 = [v44 objectAtIndexedSubscript:0];
      long long v46 = [v45 addressBookLabel];

      long long v47 = +[WBSFormToABBinder specifierForLabel:v46];
      long long v48 = [v47 component];
      char v49 = [v48 isEqualToString:@"ZIP"];

      if ((v49 & 1) == 0)
      {

LABEL_34:
LABEL_35:
        int v26 = v43;
        id v25 = v44;
        if ((unint64_t)[v25 count] > 3
          || ([v25 firstObject],
              long long v51 = objc_claimAutoreleasedReturnValue(),
              char v52 = [v51 looksLikeCreditCardNumberField],
              v51,
              (v52 & 1) == 0)
          || [(WBSFormControlMetadata *)v26 maxLength] == 2)
        {
LABEL_38:
          BOOL v24 = 0;
          goto LABEL_44;
        }
        if ([(WBSFormControlMetadata *)v26 looksLikeCreditCardNumberField])
        {
          BOOL v24 = 1;
          goto LABEL_44;
        }
        if ([(WBSFormControlMetadata *)v26 looksLikeCreditCardSecurityCodeField]
          || [(WBSFormControlMetadata *)v26 looksLikeCreditCardCompositeExpirationDateField])
        {
          goto LABEL_38;
        }
        uint64_t v27 = [v25 lastObject];
        BOOL v24 = fieldLooksLikeItExpectsDataOfSize(v26, 6) && fieldLooksLikeItExpectsDataOfSize(v27, 6);
LABEL_43:

        goto LABEL_44;
      }
      BOOL v50 = fieldLooksLikeItExpectsDataOfSize(v43, 6);

      if (!v50) {
        goto LABEL_35;
      }
      goto LABEL_32;
    }
    uint64_t v32 = [(WBSFormControlMetadata *)v27 component];
    id v33 = [v28 component];
    if (![v32 length] || !objc_msgSend(v33, "length"))
    {

LABEL_42:
      BOOL v24 = 1;
      id v25 = v95;
      int v26 = v21;
      goto LABEL_43;
    }
    char v34 = [v32 isEqualToString:v33];

    if ((v34 & 1) == 0) {
      goto LABEL_21;
    }
LABEL_32:
    BOOL v24 = 1;
LABEL_45:

    if (!v24 || a6)
    {

      id v7 = v84;
      char v11 = v91;
      if (!v24) {
        goto LABEL_68;
      }
    }
    else
    {
      id v7 = v84;
      long long v53 = [v18 lastObject];
      id v13 = v89;
      uint64_t v12 = v90;
      double v54 = elementBounds(v53);
      CGFloat v94 = v56;
      CGFloat v96 = v55;
      CGFloat v57 = v54;
      CGFloat v59 = v58;

      char v11 = v91;
      double v60 = elementBounds(v17);
      CGFloat rect = v61;
      double v62 = v60;
      CGFloat v64 = v63;
      CGFloat v66 = v65;
      v98.origin.x = v57;
      v98.origin.y = v59;
      v98.size.height = v94;
      v98.size.width = v96;
      double MinY = CGRectGetMinY(v98);
      v99.origin.x = v62;
      v99.origin.y = v64;
      v99.size.width = v66;
      v99.size.height = rect;
      if (vabdd_f64(MinY, CGRectGetMinY(v99)) > 3.0) {
        goto LABEL_67;
      }
      double v86 = v57;
      v100.origin.x = v57;
      double v68 = v59;
      v100.origin.y = v59;
      v100.size.height = v94;
      v100.size.width = v96;
      double MinX = CGRectGetMinX(v100);
      v101.origin.x = v62;
      v101.origin.y = v64;
      v101.size.width = v66;
      v101.size.height = rect;
      double v70 = CGRectGetMinX(v101);
      double v71 = v86;
      if (MinX >= v70)
      {
        double v72 = v59;
      }
      else
      {
        double v71 = v62;
        double v72 = v64;
      }
      double v74 = v94;
      double v73 = v96;
      if (MinX < v70)
      {
        double v73 = v66;
        double v74 = rect;
      }
      double v75 = CGRectGetMinX(*(CGRect *)&v71);
      double v76 = v86;
      if (MinX < v70)
      {
        double v77 = v68;
      }
      else
      {
        double v76 = v62;
        double v77 = v64;
      }
      double v79 = v94;
      double v78 = v96;
      if (MinX >= v70)
      {
        double v78 = v66;
        double v79 = rect;
      }
      double v80 = v75 - CGRectGetMaxX(*(CGRect *)&v76);

      if (v80 > 60.0) {
        goto LABEL_68;
      }
    }
    [v18 addObject:v17];

    unint64_t v9 = v92 + 1;
  }

  return v88;
}

+ (BOOL)canAutocompleteTextField:(id)a3 inForm:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isSecureTextField])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    unint64_t v8 = [v6 type];
    LOBYTE(v7) = 0;
    if (v8 <= 5 && ((1 << v8) & 0x3A) != 0) {
      int v7 = [v5 disallowsAutocomplete] ^ 1;
    }
  }

  return v7;
}

+ (int64_t)availableManualAutoFillActionForTextField:(id)a3 form:(id)a4 outUsernameElementUniqueID:(id *)a5 outPasswordElementUniqueID:(id *)a6 outConfirmPasswordElementUniqueID:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v27 = v11;
  int v13 = [v11 isSecureTextField];
  if (v13) {
    [v11 uniqueID];
  }
  else {
  uint64_t v14 = [v12 passwordElementUniqueID];
  }
  char v15 = [v12 userNameElementUniqueID];
  long long v16 = (void *)v14;
  long long v17 = objc_msgSend(v12, "passwordElementUniqueID", a1);
  int v18 = [v16 isEqualToString:v17];

  if (v18)
  {
    id v19 = [v12 confirmPasswordElementUniqueID];
    if (!v13) {
      goto LABEL_6;
    }
  }
  else
  {
    id v19 = 0;
    if (!v13)
    {
LABEL_6:
      int64_t v20 = 0;
      if (!a6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  id v22 = [v26 valueOfControlWithUniqueID:v16 inForm:v12];
  if ([v22 length])
  {
    if ([v16 length])
    {
      id v23 = [v26 _metadataForControlWithUniqueID:v16 inForm:v12];
      int v24 = [v23 isAutoFilledTextField];

      int64_t v20 = v24 ^ 1u;
    }
    else
    {
      int64_t v20 = 1;
    }
  }
  else
  {
    int64_t v20 = 2;
  }

  if (a6) {
LABEL_7:
  }
    *a6 = v16;
LABEL_8:
  if (a5) {
    *a5 = v15;
  }
  if (a7) {
    *a7 = v19;
  }

  return v20;
}

- (BOOL)shouldForceUSLocaleForAutoFillFillingTest
{
  return 0;
}

- (void)addAllAddressDataIfNecessary:(id)a3 contactLabel:(id)a4 contact:(id)a5
{
  v51[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v34 = a4;
  id v35 = a5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
  uint64_t v10 = v8;
  if (v9)
  {
    uint64_t v11 = *(void *)v45;
    obuint64_t j = @"th";
    uint64_t v12 = *MEMORY[0x1E4F98020];
    int v13 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        char v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "stringValue", obj);
        long long v17 = objc_msgSend((id)v16, "safari_bestLanguageTag");

        LODWORD(v16) = [v17 isEqualToString:obj];
        int v18 = [v15 property];
        char v19 = [v18 isEqualToString:v12];

        v13 &= v16 ^ 1;
        if (v19)
        {

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          if (v13) {
            int64_t v20 = @"City";
          }
          else {
            int64_t v20 = @"State";
          }
          v51[0] = @"Street";
          v51[1] = v20;
          if (v13) {
            int v21 = @"State";
          }
          else {
            int v21 = @"City";
          }
          v51[2] = v21;
          v51[3] = @"ZIP";
          v51[4] = @"Country";
          uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:5];
          uint64_t v22 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v22)
          {
            id obja = v10;
            id v23 = 0;
            uint64_t v24 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v41 != v24) {
                  objc_enumerationMutation(obja);
                }
                int v26 = -[WBSFormDataController addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "addressBookMatchesForProperty:key:label:partialString:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v12, *(void *)(*((void *)&v40 + 1) + 8 * j), v34, 0, v35, 1, obja);

                long long v38 = 0u;
                long long v39 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                id v23 = v26;
                uint64_t v27 = [v23 countByEnumeratingWithState:&v36 objects:v48 count:16];
                if (v27)
                {
                  uint64_t v28 = *(void *)v37;
                  do
                  {
                    for (uint64_t k = 0; k != v27; ++k)
                    {
                      if (*(void *)v37 != v28) {
                        objc_enumerationMutation(v23);
                      }
                      uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * k);
                      if (([v8 containsObject:v30] & 1) == 0) {
                        [v8 addObject:v30];
                      }
                    }
                    uint64_t v27 = [v23 countByEnumeratingWithState:&v36 objects:v48 count:16];
                  }
                  while (v27);
                }
              }
              uint64_t v22 = [obja countByEnumeratingWithState:&v40 objects:v49 count:16];
            }
            while (v22);

            uint64_t v10 = obja;
          }
          goto LABEL_33;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    uint64_t v10 = v8;
  }
LABEL_33:
}

- (id)_singleFieldPhoneNumberCandidates:(id)a3
{
  id v3 = (NSString *)a3;
  uint64_t v4 = objc_opt_new();
  phoneNumberWithoutFormatting(v3);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v6 = unprefixedPhoneNumber(v5);
  if (v6) {
    [v4 addObject:v6];
  }

  if ([(NSString *)v5 hasPrefix:@"+"])
  {
    id v7 = [(NSString *)v5 substringFromIndex:1];
    [v4 addObject:v7];
  }
  else
  {
    [v4 addObject:v5];
  }

  return v4;
}

- (id)_phoneNumberCandidates:(id)a3 fillingMultipleFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  {
    uint64_t v7 = -[WBSFormDataController _phoneNumberCandidates:fillingMultipleFields:]::extensionMarkers;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"xp-,"];
    -[WBSFormDataController _phoneNumberCandidates:fillingMultipleFields:]::extensionMarkers = v7;
  }
  uint64_t v8 = [v6 rangeOfCharacterFromSet:v7 options:4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
    if (v4)
    {
LABEL_5:
      uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      phoneNumberWithoutFormatting((NSString *)v6);
      uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = unprefixedPhoneNumber(v11);
      [v10 addObject:v12];

      if (!v9) {
        goto LABEL_11;
      }
      phoneNumberWithoutFormatting(v9);
      int v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = unprefixedPhoneNumber(v13);
      [v10 addObject:v14];

      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = [v6 substringToIndex:v8];
    if (v4) {
      goto LABEL_5;
    }
  }
  uint64_t v10 = [(WBSFormDataController *)self _singleFieldPhoneNumberCandidates:v6];
  if (!v9) {
    goto LABEL_11;
  }
  int v13 = [(WBSFormDataController *)self _singleFieldPhoneNumberCandidates:v9];
  [v10 addObjectsFromArray:v13];
LABEL_10:

LABEL_11:
  return v10;
}

- (void)_fillPhoneNumber:(id)a3 intoValues:(id)a4 controls:(id)a5 formTextSample:(id)a6 multiRoundAutoFillManager:(id)a7
{
  v72[1] = *MEMORY[0x1E4F143B8];
  CGFloat v66 = (NSString *)a3;
  uint64_t v12 = (NSMutableDictionary *)a4;
  id v13 = a5;
  CGFloat v64 = (NSString *)a6;
  id v65 = a7;
  int IsChinese = languageOfTextIsChinese(v64);
  if (IsChinese)
  {
    char v15 = phoneNumberWithoutFormatting(v66);
    v72[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
  }
  else
  {
    uint64_t v16 = -[WBSFormDataController _phoneNumberCandidates:fillingMultipleFields:](self, "_phoneNumberCandidates:fillingMultipleFields:", v66, (unint64_t)[v13 count] > 1);
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (!v18) {
    goto LABEL_33;
  }
  uint64_t v19 = *(void *)v68;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v68 != v19) {
        objc_enumerationMutation(v17);
      }
      int v21 = *(NSString **)(*((void *)&v67 + 1) + 8 * i);
      if ([v13 count] == 1)
      {
        uint64_t v22 = [v13 objectAtIndex:0];
        BOOL v23 = fillSingleFieldValue(v12, v21, v22);

        if (v23) {
          goto LABEL_33;
        }
      }
      if ((unint64_t)[v13 count] >= 2 && valueFitsInFields(v21, v13))
      {
        if (IsChinese)
        {
          uint64_t v24 = v12;
          id v25 = v21;
          id v61 = v13;
          int v26 = v25;
          if ([(NSString *)v26 hasPrefix:@"1"]
            && ![(NSString *)v26 hasPrefix:@"10"])
          {
          }
          else
          {

            uint64_t v27 = [v61 objectAtIndexedSubscript:1];
            unint64_t v28 = [v27 maxLength];

            if (v28 < 8) {
              uint64_t v29 = 7;
            }
            else {
              uint64_t v29 = 8;
            }
            uint64_t v30 = [(NSString *)v26 length] - v29;
            if (v30 > 1)
            {
              -[NSString substringWithRange:](v26, "substringWithRange:", 0, v30);
              char v31 = (NSString *)objc_claimAutoreleasedReturnValue();
              uint64_t v32 = [v61 objectAtIndexedSubscript:0];
              recordValueForTextField(v24, v31, v32);

              -[NSString substringWithRange:](v26, "substringWithRange:", v30, v29);
              id v33 = (NSString *)objc_claimAutoreleasedReturnValue();
              id v34 = [v61 objectAtIndexedSubscript:1];
              recordValueForTextField(v24, v33, v34);
              goto LABEL_24;
            }
          }
        }
        id v35 = v12;
        long long v36 = v21;
        id v37 = v13;
        long long v38 = v36;
        id v39 = v37;
        if ([v39 count] != 3 && objc_msgSend(v39, "count") != 4) {
          goto LABEL_31;
        }
        if ([(NSString *)v38 length] < 0xA) {
          goto LABEL_31;
        }
        long long v40 = [v39 objectAtIndexedSubscript:0];
        uint64_t v62 = [v40 maxLength];

        long long v41 = [v39 objectAtIndexedSubscript:1];
        uint64_t v60 = [v41 maxLength];

        long long v42 = [v39 objectAtIndexedSubscript:2];
        uint64_t v43 = [v42 maxLength];

        if (v62 < 3) {
          goto LABEL_31;
        }
        if (v60 >= 3
          && v43 >= 4
          && ([(NSString *)v38 length] < 0xB
           || [v39 count] == 4
           && ([v39 objectAtIndexedSubscript:3],
               long long v44 = objc_claimAutoreleasedReturnValue(),
               uint64_t v45 = [v44 maxLength],
               v44,
               v45 >= 1)
           && v45 >= [(NSString *)v38 length] - 10))
        {
          if (v62 == 3 && v60 == 3 && v43 == 4)
          {

LABEL_55:
            -[NSString substringWithRange:](v38, "substringWithRange:", 0, 3);
            double v54 = (NSString *)objc_claimAutoreleasedReturnValue();
            double v55 = [v39 objectAtIndex:0];
            recordValueForTextField(v35, v54, v55);

            -[NSString substringWithRange:](v38, "substringWithRange:", 3, 3);
            double v56 = (NSString *)objc_claimAutoreleasedReturnValue();
            CGFloat v57 = [v39 objectAtIndex:1];
            recordValueForTextField(v35, v56, v57);

            -[NSString substringWithRange:](v38, "substringWithRange:", 6, 4);
            double v58 = (NSString *)objc_claimAutoreleasedReturnValue();
            CGFloat v59 = [v39 objectAtIndex:2];
            recordValueForTextField(v35, v58, v59);

            if ([v39 count] != 4 || -[NSString length](v38, "length") < 0xB) {
              goto LABEL_25;
            }
            id v33 = [(NSString *)v38 substringFromIndex:10];
            id v34 = [v39 objectAtIndex:3];
            recordValueForTextField(v35, v33, v34);
LABEL_24:

LABEL_25:
            goto LABEL_33;
          }
          long long v46 = [v39 objectAtIndexedSubscript:0];
          uint64_t v63 = [v46 size];

          long long v47 = [v39 objectAtIndexedSubscript:1];
          uint64_t v48 = [v47 size];

          char v49 = [v39 objectAtIndexedSubscript:2];
          uint64_t v50 = [v49 size];

          BOOL v53 = v63 == 3 && v48 == 3 && v50 == 4;
          if (v53) {
            goto LABEL_55;
          }
        }
        else
        {
LABEL_31:
        }
        fillMultiFieldValue(v35, v38, v39, v65);
        goto LABEL_33;
      }
    }
    uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_33:
}

- (unint64_t)addValuesForStandardFormControlsInForm:(id)a3 startingAtIndex:(unint64_t)a4 fromAutoFillItem:(id)a5 toDictionary:(id)a6 multiRoundAutoFillManager:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v12 controls];
  id v17 = [v12 textSample];
  unint64_t v18 = [(WBSFormDataController *)self addValuesForStandardFormControls:v16 startingAtIndex:a4 fromAutoFillItem:v13 toDictionary:v14 formTextSample:v17 multiRoundAutoFillManager:v15];

  return v18;
}

- (unint64_t)addValuesForStandardFormControls:(id)a3 startingAtIndex:(unint64_t)a4 fromAutoFillItem:(id)a5 toDictionary:(id)a6 formTextSample:(id)a7 multiRoundAutoFillManager:(id)a8
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  uint64_t v16 = (NSMutableDictionary *)a6;
  long long v70 = (NSString *)a7;
  id v69 = a8;
  if (v15)
  {
    id v17 = [v14 objectAtIndexedSubscript:a4];
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v19 = v15;
    }
    else {
      uint64_t v19 = 0;
    }
    id v66 = v19;
    long long v68 = [(WBSFormControlMetadata *)v17 selectElementInfo];
    if (isKindOfClass)
    {
      int64_t v20 = [v15 property];
      int v21 = [v20 isEqualToString:*MEMORY[0x1E4F98028]];

      if (v21)
      {
        uint64_t v22 = [v15 dateValue];
        unint64_t v23 = fillDateUsingClassification(v16, v14, a4, v22);

LABEL_57:
        goto LABEL_58;
      }
    }
    long long v67 = [(WBSFormControlMetadata *)v17 tagName];
    BOOL v24 = [(WBSFormControlMetadata *)v17 isTextField];
    if ((objc_msgSend(v67, "safari_isCaseInsensitiveEqualToString:", @"input") & v24) == 1)
    {
      if (isKindOfClass)
      {
        id v25 = [v15 property];
        int v26 = [v25 isEqualToString:*MEMORY[0x1E4F98048]];

        if (v26) {
          goto LABEL_25;
        }
        uint64_t v27 = [v15 property];
        uint64_t v64 = *MEMORY[0x1E4F98020];
        if (objc_msgSend(v27, "isEqualToString:"))
        {
          unint64_t v28 = [v15 key];
          char v29 = [v28 isEqualToString:@"ZIP"];

          if (v29)
          {
            int v30 = 1;
LABEL_26:
            long long v41 = +[WBSFormDataController continuingFieldsInFormControls:v14 startingAtIndex:a4 textFieldsOnly:1 ignorePositioning:0];
            if (v26)
            {
              long long v42 = [v15 stringValue];
              [(WBSFormDataController *)self _fillPhoneNumber:v42 intoValues:v16 controls:v41 formTextSample:v70 multiRoundAutoFillManager:v69];
            }
            else
            {
              long long v42 = [v15 stringValue];
              if (v30) {
                fillPostCode(v16, v42, v41, v69);
              }
              else {
                fillInstantMessageUsername(v16, v42, v41);
              }
            }

            unint64_t v23 = [v41 count];
            goto LABEL_56;
          }
        }
        else
        {
        }
        id v39 = [v15 property];
        int v40 = [v39 isEqualToString:*MEMORY[0x1E4F98038]];

        if (v40)
        {
LABEL_25:
          int v30 = 0;
          goto LABEL_26;
        }
        uint64_t v43 = [v15 property];
        if ([v43 isEqualToString:v64])
        {
          long long v44 = [v15 key];
          int v45 = [v44 isEqualToString:@"Street"];

          if (v45)
          {
            long long v46 = [v15 stringValue];
            uint64_t v62 = v16;
            id v65 = v46;
            id v63 = v69;
            long long v47 = +[WBSFormDataController continuingFieldsInFormControls:v14 startingAtIndex:a4 textFieldsOnly:1 ignorePositioning:1];
            if ([v47 count] == 1)
            {
              [v47 objectAtIndex:0];
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              id v61 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v48 = [v61 autocompleteTokens];
              uint64_t v49 = [v48 countByEnumeratingWithState:&v71 objects:v75 count:16];
              if (v49)
              {
                uint64_t v50 = *(void *)v72;
                while (2)
                {
                  for (uint64_t i = 0; i != v49; ++i)
                  {
                    if (*(void *)v72 != v50) {
                      objc_enumerationMutation(v48);
                    }
                    char v52 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                    if ([v52 isEqualToString:@"street-address"])
                    {
                      int v55 = 4;
                      goto LABEL_72;
                    }
                    if ([v52 isEqualToString:@"address-line1"]) {
                      goto LABEL_67;
                    }
                    if ([v52 isEqualToString:@"address-line2"])
                    {
LABEL_64:
                      int v55 = 1;
                      goto LABEL_72;
                    }
                    if (([v52 isEqualToString:@"address-line3"] & 1) != 0
                      || ([v52 isEqualToString:@"address-level1"] & 1) != 0)
                    {
                      int v55 = 2;
                      goto LABEL_72;
                    }
                    if ([v52 isEqualToString:@"address-level2"]) {
                      goto LABEL_64;
                    }
                  }
                  uint64_t v49 = [v48 countByEnumeratingWithState:&v71 objects:v75 count:16];
                  if (v49) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v48 = [v61 fieldName];
              unint64_t v53 = [v48 rangeOfString:@"1"];
              unint64_t v54 = [v48 rangeOfString:@"2"];
              if (v53 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (v54 == 0x7FFFFFFFFFFFFFFFLL) {
                  int v55 = 4;
                }
                else {
                  int v55 = 3;
                }
              }
              else if (v54 == 0x7FFFFFFFFFFFFFFFLL)
              {
LABEL_67:
                int v55 = 0;
              }
              else if (v53 >= v54)
              {
                int v55 = 3;
              }
              else
              {
                int v55 = 0;
              }
LABEL_72:

              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, v55, v61, v63);
              goto LABEL_73;
            }
            if ([v47 count] == 2)
            {
              CGFloat v57 = [v47 objectAtIndexedSubscript:0];
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 0, v57, v63);

              double v58 = [v47 objectAtIndexedSubscript:1];
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 3, v58, v63);
            }
            else
            {
              if ((unint64_t)[v47 count] < 3)
              {
LABEL_73:
                unint64_t v23 = [v47 count];

                goto LABEL_56;
              }
              CGFloat v59 = [v47 objectAtIndexedSubscript:0];
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 0, v59, v63);

              uint64_t v60 = [v47 objectAtIndexedSubscript:1];
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 1, v60, v63);

              double v58 = [v47 objectAtIndexedSubscript:2];
              recordStreetAddressValueForFieldOrMarkAsIgnored(v62, v65, 2, v58, v63);
            }

            goto LABEL_73;
          }
        }
        else
        {
        }
      }
      long long v38 = [v15 completion];
      recordValueForTextField(v16, v38, v17);
    }
    else
    {
      if ((isKindOfClass & (v68 != 0)) == 1)
      {
        uint64_t IsChinese = languageOfTextIsChinese(v70);
        uint64_t v32 = v68;
        id v33 = v66;
        id v34 = +[WBSFormToABBinder allSynonymsForMatch:v33 formAppearsToBeChinese:IsChinese];
        if (!v34)
        {
          id v35 = (void *)MEMORY[0x1E4F1C978];
          long long v36 = [v33 stringValue];
          id v34 = [v35 arrayWithObject:v36];
        }
        unint64_t v37 = indexOfItemInSelectElement(v32, v34);

        if (v37 != 0x7FFFFFFFFFFFFFFFLL) {
          recordIndexForSelectElement(v16, v37, v17);
        }
        goto LABEL_55;
      }
      if ((isKindOfClass & 1) == 0
        || !objc_msgSend(v67, "safari_isCaseInsensitiveEqualToString:", @"textarea"))
      {
LABEL_55:
        unint64_t v23 = 1;
LABEL_56:

        goto LABEL_57;
      }
      long long v38 = [v15 completion];
      recordValueForTextarea(v16, v38, v17);
    }

    goto LABEL_55;
  }
  unint64_t v23 = 0;
LABEL_58:

  return v23;
}

+ (BOOL)textFieldLooksLikeCreditCardFormField:(id)a3 inForm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 formContainsCreditCardNumberOrCardSecurityCodeField:v7])
  {
    if ([v6 looksLikeCreditCardCardholderField]) {
      char v8 = 1;
    }
    else {
      char v8 = [a1 textFieldLooksLikeCreditCardNumericFormField:v6];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)textFieldLooksLikeCreditCardNumericFormField:(id)a3
{
  id v3 = a3;
  if ([v3 looksLikeCreditCardNumberField]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 looksLikeCreditCardSecurityCodeField];
  }

  return v4;
}

- (void)getFormFieldValues:(id *)a3 andFieldToFocus:(id *)a4 andCreditCardDataTypesThatWillBeFilled:(id *)a5 forCreditCardForm:(id)a6 fromCreditCardData:(id)a7
{
  long long v73 = a3;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v76 = a6;
  id v86 = a7;
  id v88 = [MEMORY[0x1E4F1CA60] dictionary];
  id v87 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v82 = [v76 controls];
  uint64_t v8 = [v82 count];
  if (!v8)
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    *long long v73 = v88;
    long long v70 = a4;
    if (!a4) {
      goto LABEL_80;
    }
    goto LABEL_78;
  }
  unint64_t v81 = v8;
  int v9 = 0;
  uint64_t v77 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  uint64_t v78 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v79 = 0;
  do
  {
    unint64_t v85 = v12;
    id v84 = [v82 objectAtIndexedSubscript:v73];
    id v13 = uniqueIDForAutoFillOfControl(v84, 7);
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      v83 = [(WBSFormControlMetadata *)v84 classification];
      if ((v9 & 1) != 0 || ![v83 isEqualToString:@"cc-name"])
      {
        if ((v79 & 0x100000000) != 0 || ![v83 isEqualToString:@"cc-number"])
        {
          if ((v79 & 1) != 0 || ![v83 isEqualToString:@"cc-exp"])
          {
            if ((v77 & 0x100000000) != 0 || ![v83 isEqualToString:@"cc-csc"])
            {
              if ((v77 & 1) != 0 || ![v83 isEqualToString:@"cc-type"])
              {
                if (v78 == 0x7FFFFFFFFFFFFFFFLL && ((v9 | HIDWORD(v79)) & 1) != 0)
                {
                  if (![(WBSFormControlMetadata *)v84 isTextField]
                    || ([(WBSFormControlMetadata *)v84 value],
                        long long v51 = objc_claimAutoreleasedReturnValue(),
                        BOOL v52 = [v51 length] == 0,
                        v51,
                        v52))
                  {
                    uint64_t v53 = v85;
                  }
                  else
                  {
                    uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  uint64_t v78 = v53;
                }
              }
              else
              {
                uint64_t v48 = [v86 cardNumber];
                BOOL v49 = fillCreditCardType(v88, v84, v48);

                if (v49)
                {
                  uint64_t v50 = [(WBSFormControlMetadata *)v84 uniqueID];
                  recordTypeForFieldIfFilled(v88, v87, v50, 4);

                  LOBYTE(v77) = 1;
                }
                else
                {
                  LOBYTE(v77) = 0;
                }
              }
            }
            else
            {
              long long v44 = [v86 cardSecurityCode];
              BOOL v45 = [v44 length] == 0;

              if (!v45)
              {
                long long v46 = [v86 cardSecurityCode];
                recordValueForTextField(v88, v46, v84);

                long long v47 = [(WBSFormControlMetadata *)v84 uniqueID];
                recordTypeForFieldIfFilled(v88, v87, v47, 1);
              }
              BYTE4(v77) = 1;
            }
          }
          else
          {
            id v34 = allControlsContinuationStartingAtIndex(v82, v85);
            id v35 = [v86 expirationDate];
            BOOL v36 = v35 == 0;

            if (!v36)
            {
              unint64_t v37 = [v86 expirationDate];
              fillDateUsingClassification(v88, v34, 0, v37);

              long long v91 = 0u;
              long long v92 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              id v38 = v34;
              uint64_t v39 = [v38 countByEnumeratingWithState:&v89 objects:v101 count:16];
              if (v39)
              {
                uint64_t v40 = *(void *)v90;
                do
                {
                  for (uint64_t i = 0; i != v39; ++i)
                  {
                    if (*(void *)v90 != v40) {
                      objc_enumerationMutation(v38);
                    }
                    long long v42 = [*(id *)(*((void *)&v89 + 1) + 8 * i) uniqueID];
                    recordTypeForFieldIfFilled(v88, v87, v42, 2);
                  }
                  uint64_t v39 = [v38 countByEnumeratingWithState:&v89 objects:v101 count:16];
                }
                while (v39);
              }
            }
            uint64_t v43 = [v34 count];

            unint64_t v85 = v85 + v43 - 1;
            LOBYTE(v79) = 1;
          }
        }
        else
        {
          BOOL v24 = allControlsContinuationStartingAtIndex(v82, v85);
          id v25 = [v86 cardNumber];
          int v26 = valueFitsInFields(v25, v24);

          if (v26)
          {
            uint64_t v27 = [v86 cardNumber];
            fillMultiFieldValue(v88, v27, v24, 0);

            long long v95 = 0u;
            long long v96 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v28 = v24;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v93 objects:v102 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v94;
              do
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v94 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v32 = [*(id *)(*((void *)&v93 + 1) + 8 * j) uniqueID];
                  recordTypeForFieldIfFilled(v88, v87, v32, 0);
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v93 objects:v102 count:16];
              }
              while (v29);
            }
          }
          uint64_t v33 = [v24 count];

          unint64_t v85 = v85 + v33 - 1;
          HIDWORD(v79) = 1;
        }
      }
      else
      {
        double v80 = allControlsContinuationStartingAtIndex(v82, v85);
        id v15 = [v86 cardholderName];
        BOOL v16 = [v15 length] == 0;

        if (v16)
        {
          uint64_t v68 = v78;
          if (v78 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v68 = v85;
          }
          uint64_t v78 = v68;
        }
        else if ([v80 count] == 1 {
               && ([v80 firstObject],
        }
                   id v17 = objc_claimAutoreleasedReturnValue(),
                   [v17 orderedParts],
                   unint64_t v18 = objc_claimAutoreleasedReturnValue(),
                   BOOL v19 = [v18 count] == 3,
                   v18,
                   v17,
                   v19))
        {
          int64_t v20 = [v86 cardholderName];
          int v21 = [v80 firstObject];
          recordValueForTextField(v88, v20, v21);

          uint64_t v22 = [v80 firstObject];
          unint64_t v23 = [v22 uniqueID];
          recordTypeForFieldIfFilled(v88, v87, v23, 3);
        }
        else
        {
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v54 = v80;
          uint64_t v55 = [v54 countByEnumeratingWithState:&v97 objects:v103 count:16];
          if (v55)
          {
            uint64_t v56 = *(void *)v98;
            do
            {
              for (uint64_t k = 0; k != v55; ++k)
              {
                if (*(void *)v98 != v56) {
                  objc_enumerationMutation(v54);
                }
                double v58 = *(WBSFormControlMetadata **)(*((void *)&v97 + 1) + 8 * k);
                if (!v10 || !v11)
                {
                  id v59 = objc_alloc_init(MEMORY[0x1E4F28F38]);

                  [v59 setStyle:3];
                  uint64_t v60 = [v86 cardholderName];
                  uint64_t v61 = [v59 personNameComponentsFromString:v60];

                  uint64_t v11 = (void *)v61;
                  uint64_t v10 = v59;
                }
                id v62 = objc_alloc_init(MEMORY[0x1E4F28F30]);
                id v63 = [(WBSFormControlMetadata *)v58 orderedParts];
                if ([v63 containsObject:@"cc-given-name"])
                {
                  uint64_t v64 = [v11 givenName];
                  [v62 setGivenName:v64];
                }
                if ([v63 containsObject:@"cc-additional-name"])
                {
                  id v65 = [v11 middleName];
                  [v62 setMiddleName:v65];
                }
                if ([v63 containsObject:@"cc-family-name"])
                {
                  id v66 = [v11 familyName];
                  [v62 setFamilyName:v66];
                }
                long long v67 = [v10 stringFromPersonNameComponents:v62];
                recordValueForTextField(v88, v67, v58);
              }
              uint64_t v55 = [v54 countByEnumeratingWithState:&v97 objects:v103 count:16];
            }
            while (v55);
          }
        }
        uint64_t v69 = [v80 count];

        unint64_t v85 = v85 + v69 - 1;
        int v9 = 1;
      }
    }
    unint64_t v12 = v85 + 1;
  }
  while (v85 + 1 < v81);
  *long long v73 = v88;
  if (a4)
  {
    if (v78 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v70 = a4;
LABEL_78:
      *long long v70 = 0;
      goto LABEL_80;
    }
    long long v71 = objc_msgSend(v82, "objectAtIndexedSubscript:");
    id v72 = [v71 uniqueID];
    *a4 = v72;
  }
LABEL_80:
  if (a5) {
    *a5 = v87;
  }
}

- (unint64_t)_indexForControlWithUniqueID:(id)a3 inForm:(id)a4
{
  id v5 = a3;
  id v6 = [a4 controls];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    unint64_t v8 = 0;
    while (1)
    {
      int v9 = [v6 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v9 uniqueID];
      char v11 = [v10 isEqualToString:v5];

      if (v11) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)_nextFieldToFocusAfterFillingFieldAtIndex:(unint64_t)a3 inForm:(id)a4
{
  id v5 = [a4 controls];
  unint64_t v6 = [v5 count];
  unint64_t v7 = a3 + 1;
  if (a3 + 1 >= v6)
  {
LABEL_4:
    char v11 = 0;
  }
  else
  {
    while (1)
    {
      unint64_t v8 = [v5 objectAtIndexedSubscript:v7];
      int v9 = [v8 value];
      uint64_t v10 = [v9 length];

      if (!v10) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_4;
      }
    }
    char v11 = [v8 uniqueID];
  }
  return v11;
}

- (void)getFormFieldValues:(id *)a3 andFieldToFocus:(id *)a4 withSingleCreditCardData:(id)a5 inField:(id)a6 inForm:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = (WBSFormControlMetadata *)a6;
  id v14 = a7;
  id v15 = [v14 controls];
  BOOL v16 = [(WBSFormControlMetadata *)v13 uniqueID];
  uint64_t v17 = [(WBSFormDataController *)self _indexForControlWithUniqueID:v16 inForm:v14];

  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3) {
      *a3 = (id)MEMORY[0x1E4F1CC08];
    }
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_27;
  }
  id v66 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v67 = [v12 value];
  switch([v12 type])
  {
    case 0:
      id v18 = v67;
      BOOL v19 = [(id)objc_opt_class() continuingFieldsInFormControls:v15 startingAtIndex:v17 textFieldsOnly:1 ignorePositioning:0];
      if (valueFitsInFields(v18, v19)) {
        fillMultiFieldValue(v66, v18, v19, 0);
      }
      uint64_t v17 = v17 + [v19 count] - 1;

      goto LABEL_23;
    case 1:
    case 3:
      int64_t v20 = v66;
      recordValueForTextField(v66, (NSString *)v67, v13);
      goto LABEL_24;
    case 2:
      id v60 = v67;
      int v21 = WBSLocaleForCreditCardExpirationDate();
      id v62 = v66;
      id v22 = v15;
      id v64 = v60;
      id v63 = v21;
      uint64_t v61 = v22;
      id v65 = +[WBSFormDataController continuingFieldsInFormControls:v22 startingAtIndex:v17 textFieldsOnly:0 ignorePositioning:0];
      if ((unint64_t)[v65 count] >= 4)
      {
        unint64_t v23 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[WBSFormDataController getFormFieldValues:andFieldToFocus:withSingleCreditCardData:inField:inForm:](buf, [v65 count], v23);
        }

        goto LABEL_21;
      }
      if (!v64)
      {
LABEL_21:
        uint64_t v28 = [v65 count];
        goto LABEL_22;
      }
      if ([v65 count] == 1)
      {
        double v58 = [v65 objectAtIndexedSubscript:0];
        if ([(WBSFormControlMetadata *)v58 isTextField])
        {
          id v56 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          BOOL v24 = [(WBSFormControlMetadata *)v58 requiredFormatForDateTimeInput];
          uint64_t v25 = [v24 length];

          if (v25)
          {
            int v26 = [(WBSFormControlMetadata *)v58 requiredFormatForDateTimeInput];
            [v56 setDateFormat:v26];

            uint64_t v27 = [v56 stringFromDate:v64];
            recordValueForTextField(v62, v27, v58);
          }
          else
          {
            unint64_t v50 = [(WBSFormControlMetadata *)v58 maxLength];
            uint64_t v32 = [(WBSFormControlMetadata *)v58 placeholder];
            canonicalizedDateTemplate(v32);
            uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

            BOOL v49 = v33;
            uint64_t v34 = [(__CFString *)v33 length];
            id v35 = @"MMyy";
            if (v34) {
              id v35 = v33;
            }
            uint64_t v55 = v35;
            long long v51 = objc_msgSend(MEMORY[0x1E4F28C10], "dateFormatFromTemplate:options:locale:");
            objc_msgSend(v56, "setDateFormat:");
            BOOL v52 = [v56 stringFromDate:v64];
            if ([(NSString *)v52 length] <= v50)
            {
              uint64_t v40 = v52;
            }
            else
            {

              BOOL v36 = objc_msgSend(MEMORY[0x1E4F28C10], "dateFormatFromTemplate:options:locale:");

              [v56 setDateFormat:v36];
              unint64_t v37 = [v56 stringFromDate:v64];

              if ([(NSString *)v37 length] <= v50)
              {
                uint64_t v55 = @"MMyy";
                long long v51 = v36;
                uint64_t v40 = v37;
              }
              else
              {
                uint64_t v48 = v37;
                uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28C10], "dateFormatFromTemplate:options:locale:");

                [v56 setDateFormat:v38];
                uint64_t v39 = [v56 stringFromDate:v64];

                uint64_t v55 = @"Myy";
                long long v51 = (void *)v38;
                uint64_t v40 = (NSString *)v39;
              }
            }
            uint64_t v53 = v40;
            if ([(NSString *)v40 length] <= v50)
            {
              recordValueForTextField(v62, v53, v58);
            }
            else
            {
              long long v41 = WBS_LOG_CHANNEL_PREFIXAutoFill();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                -[WBSFormDataController getFormFieldValues:andFieldToFocus:withSingleCreditCardData:inField:inForm:](v50, v41, v42, v43, v44, v45, v46, v47);
              }
            }
          }
        }
        else
        {
          char v31 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[WBSFormDataController getFormFieldValues:andFieldToFocus:withSingleCreditCardData:inField:inForm:](v31);
          }
        }

        uint64_t v28 = 1;
      }
      else
      {
        id v69 = 0;
        *(void *)buf = 0;
        id v68 = 0;
        BOOL v30 = identifyDateFields(v65, buf, &v69, &v68);
        id v59 = (WBSFormControlMetadata *)*(id *)buf;
        id v57 = v69;
        id v54 = v68;
        if (v30 && (!v59 || v57))
        {
          if (v59) {
            recordValueForDateField(v62, 0, v64, v59);
          }
          if (v57) {
            recordValueForDateField(v62, 1, v64, v57);
          }
          if (v54) {
            recordValueForDateField(v62, 2, v64, v54);
          }
        }
        uint64_t v28 = [v65 count];
      }
LABEL_22:

      uint64_t v17 = v17 + v28 - 1;
LABEL_23:
      int64_t v20 = v66;
LABEL_24:
      uint64_t v29 = v20;
      *a3 = v29;
      if (a4)
      {
        *a4 = [(WBSFormDataController *)self _nextFieldToFocusAfterFillingFieldAtIndex:v17 inForm:v14];
      }

LABEL_27:
      return;
    case 4:
      int64_t v20 = v66;
      fillCreditCardType(v66, v13, (NSString *)v67);
      goto LABEL_24;
    default:
      goto LABEL_23;
  }
}

- (BOOL)isControlASelectElement:(id)a3
{
  id v3 = [a3 tagName];
  char v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", @"select");

  return v4;
}

- (NSLocale)locale
{
  locale = self->_locale;
  if (!locale)
  {
    char v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v5 = self->_locale;
    self->_locale = v4;

    locale = self->_locale;
  }
  return locale;
}

+ (id)domainFromURL:(id)a3
{
  id v3 = [a3 host];
  char v4 = objc_msgSend(v3, "_web_domainFromHost");
  id v5 = [v4 lowercaseString];

  return v5;
}

+ (id)nextFieldAfterControls:(id)a3 inForm:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v5 = [a4 controls];
  unint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v7 = [v5 reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v7);
      }
      char v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
      id v12 = [v11 nextControlUniqueID];
      if (([v6 containsObject:v12] & 1) == 0)
      {
        id v13 = [v11 uniqueID];
        char v14 = [v6 containsObject:v13];

        if (v14)
        {
          id v15 = v12;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = ___ZL43controlsContainTextFieldWithControlUniqueIDP7NSArrayIP22WBSFormControlMetadataEP8NSString_block_invoke;
          v24[3] = &unk_1E5C9B808;
          id v25 = v15;
          id v16 = v15;
          BOOL v17 = [v5 indexOfObjectPassingTest:v24] == 0x7FFFFFFFFFFFFFFFLL;

          if (!v17) {
            break;
          }
        }
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    id v16 = 0;
  }

  return v16;
}

+ (id)lastFieldInControls:(id)a3 inForm:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v7 = objc_msgSend(v5, "controls", 0);
  uint64_t v8 = [v7 reverseObjectEnumerator];

  uint64_t v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 uniqueID];
        int v14 = [v6 containsObject:v13];

        if (v14)
        {
          uint64_t v9 = [v12 uniqueID];
          goto LABEL_11;
        }
      }
      uint64_t v9 = (void *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (id)controlsConsideredByAutoFillInForm:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(v3, "controls", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = uniqueIDForAutoFillOfControl(*(WBSFormControlMetadata **)(*((void *)&v11 + 1) + 8 * i), 3);
        if (v9) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)isNameProperty:(id)a3
{
  id v3 = a3;
  {
    char v4 = (void *)+[WBSFormDataController isNameProperty:]::namePropertiesSet;
  }
  else
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F98050], *MEMORY[0x1E4F98060], *MEMORY[0x1E4F98058], *MEMORY[0x1E4F98068], 0);
    +[WBSFormDataController isNameProperty:]::namePropertiesSet = (uint64_t)v4;
  }
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (id)localizedLowercaseContactProperty:(id)a3
{
  return 0;
}

- (id)_autoFillSetFromMatches:(id)a3 label:(id)a4 contact:(id)a5 form:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v28 = a4;
  id v26 = a5;
  id v27 = a6;
  uint64_t v29 = v10;
  if (![v10 count])
  {
    BOOL v24 = 0;
    goto LABEL_18;
  }
  long long v11 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = [MEMORY[0x1E4F1CA80] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    char v15 = 0;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "property", v26);
        [v12 addObject:v18];
        if (!+[WBSFormDataController isNameProperty:v18])
        {
          long long v19 = [(id)objc_opt_class() localizedLowercaseContactProperty:v18];
          [v11 addObject:v19];

          char v15 = 1;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);

    if ((v15 & 1) == 0)
    {
      BOOL v24 = 0;
      goto LABEL_17;
    }
    long long v20 = [WBSRecentlyUsedAutoFillSet alloc];
    uint64_t v21 = [(WBSRecentlyUsedAutoFillSet *)v20 initWithFillMatches:v13 skipMatches:MEMORY[0x1E4F1CBF0] label:v28];
    id v13 = [(WBSFormDataController *)self valuesForContactFormWithMetadata:v27 matches:0 multiRoundAutoFillManager:0 existingMatches:v21 contact:v26];

    long long v22 = [WBSContactAutoFillSet alloc];
    long long v23 = [v11 allObjects];
    BOOL v24 = [(WBSContactAutoFillSet *)v22 initWithControlIDToValueMap:v13 label:v28 fillDisplayProperties:v23 skipDisplayProperties:0 propertiesToFillOrSkip:v12];
  }
  else
  {
    BOOL v24 = 0;
  }

LABEL_17:
LABEL_18:

  return v24;
}

- (id)orderedHomeAndWorkSetsForContact:(id)a3 form:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v30 = a4;
  id v38 = 0;
  id v6 = [(WBSFormDataController *)self valuesForContactFormWithMetadata:v30 matches:&v38 multiRoundAutoFillManager:0 existingMatches:0 contact:v29];
  id v27 = self;
  id v28 = v38;
  long long v33 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v28;
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v35;
    uint64_t v10 = *MEMORY[0x1E4F98028];
    uint64_t v31 = *MEMORY[0x1E4F98040];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
        id v13 = [v12 property];
        if (+[WBSFormDataController isNameProperty:v13])
        {

LABEL_9:
          [v33 addObject:v12];
LABEL_10:
          [v7 addObject:v12];
          goto LABEL_11;
        }
        uint64_t v14 = [v12 property];
        int v15 = [v14 isEqualToString:v10];

        if (v15) {
          goto LABEL_9;
        }
        uint64_t v16 = [v12 label];
        int v17 = [v16 isEqualToString:@"_$!<Home>!$_"];

        if (v17) {
          [v33 addObject:v12];
        }
        long long v18 = [v12 label];
        if ([v18 isEqualToString:@"_$!<Work>!$_"])
        {

          goto LABEL_10;
        }
        long long v19 = [v12 property];
        int v20 = [v19 isEqualToString:v31];

        if (v20) {
          goto LABEL_10;
        }
LABEL_11:
        ++v11;
      }
      while (v8 != v11);
      uint64_t v21 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      uint64_t v8 = v21;
    }
    while (v21);
  }

  long long v22 = [(WBSFormDataController *)v27 _autoFillSetFromMatches:v33 label:@"_$!<Home>!$_" contact:v29 form:v30];
  long long v23 = [(WBSFormDataController *)v27 _autoFillSetFromMatches:v7 label:@"_$!<Work>!$_" contact:v29 form:v30];
  BOOL v24 = [MEMORY[0x1E4F1CA48] array];
  id v25 = v24;
  if (v22) {
    [v24 addObject:v22];
  }
  if (v23) {
    [v25 addObject:v23];
  }

  return v25;
}

- (id)contactAutoFillSetForRecentlyUsedAutoFillSet:(id)a3 contact:(id)a4 form:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a4;
  id v23 = a5;
  BOOL v24 = [v8 fillMatches];
  uint64_t v9 = [v8 skipMatches];
  [v8 label];
  id v26 = v34 = 0;
  id v27 = [(WBSFormDataController *)self valuesForContactFormWithMetadata:v23 matches:&v34 multiRoundAutoFillManager:0 existingMatches:v8 contact:v22];
  id v10 = v34;
  id v28 = +[WBSContactAutoFillSet displayStringsForFillMatches:v24 skipMatches:v9 matchesForForm:v10 label:v26 formDataController:self];
  id v29 = +[WBSContactAutoFillSet displayStringsForSkipMatches:v9 matchesForForm:v10 formDataController:self];
  id v25 = [v9 valueForKeyPath:@"@distinctUnionOfObjects.property"];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [*(id *)(*((void *)&v30 + 1) + 8 * i) property];
        [v11 addObject:v16];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v13);
  }

  int v17 = [WBSContactAutoFillSet alloc];
  long long v18 = [v28 allObjects];
  long long v19 = [v29 allObjects];
  int v20 = [(WBSContactAutoFillSet *)v17 initWithControlIDToValueMap:v27 label:v26 fillDisplayProperties:v18 skipDisplayProperties:v19 propertiesToFillOrSkip:v11];

  return v20;
}

- (id)valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8 contact:(id)a9 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a10
{
  BYTE1(v13) = a10;
  LOBYTE(v13) = 0;
  LOBYTE(v12) = 0;
  id v10 = -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, a6, a7, a8, v12, a9, 0, v13);
  return v10;
}

- (id)valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8
{
  LOWORD(v11) = 256;
  LOBYTE(v10) = 0;
  id v8 = -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, a5, a6, a7, a8, v10, 0, 0, v11);
  return v8;
}

- (id)_valuesForStandardForm:(id)a3 inDomain:(id)a4 autoFillDataType:(int64_t)a5 matches:(id *)a6 preferredLabel:(id)a7 multiRoundAutoFillManager:(id)a8 wantAllMatches:(BOOL)a9 contact:(id)a10 existingMatches:(id)a11 shouldUseExistingMatchesToFillFocusedField:(BOOL)a12 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:(BOOL)a13
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v66 = a4;
  id v67 = a7;
  id v18 = a8;
  id v71 = a10;
  id v70 = a11;
  long long v19 = [MEMORY[0x1E4F1CA60] dictionary];
  int v20 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = v20;
  if (a6) {
    *a6 = v20;
  }
  uint64_t v69 = [v81 type];
  id v65 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v77 = [v81 controls];
  unint64_t v76 = [v77 count];
  id v22 = [v70 fillMatches];
  uint64_t v23 = [v22 count];
  BOOL v24 = (uint64_t *)MEMORY[0x1E4F98048];
  if (v23 == 1)
  {
    id v25 = [v70 fillMatches];
    id v26 = [v25 objectAtIndexedSubscript:0];
    id v27 = [v26 property];
    int v75 = [v27 isEqualToString:*v24];
  }
  else
  {
    int v75 = 0;
  }

  if (v76)
  {
    int v63 = 0;
    unint64_t v28 = 0;
    uint64_t v72 = *v24;
    uint64_t v64 = *MEMORY[0x1E4F98030];
    while (1)
    {
      id v29 = [v77 objectAtIndexedSubscript:v28];
      double v80 = v29;
      uint64_t v79 = [(id)objc_opt_class() specifierForControl:v29];
      if (v75)
      {
        long long v30 = [v79 property];
        int v31 = [v30 isEqualToString:v72];

        if (v31) {
          int v32 = 7;
        }
        else {
          int v32 = 3;
        }
      }
      else
      {
        int v32 = 3;
      }
      uint64_t v78 = uniqueIDForAutoFillOfControl(v29, v32);
      if (!v78
        || [v18 currentAutoFillAttemptTrigger] == 1
        && ([v18 shouldControlBeIgnoredByFollowUpAutoFill:v78] & 1) != 0)
      {
        goto LABEL_22;
      }
      if (v69 != 4) {
        goto LABEL_23;
      }
      long long v33 = [(WBSFormControlMetadata *)v29 classification];
      if ([v33 isEqualToString:@"username"]) {
        break;
      }
      BOOL v34 = [(WBSFormControlMetadata *)v29 isLabeledUsernameField];

      if (v34) {
        goto LABEL_20;
      }
LABEL_21:
      long long v37 = [(WBSFormControlMetadata *)v29 classification];
      char v38 = [v37 isEqualToString:@"new-password"];

      if ((v38 & 1) == 0)
      {
LABEL_23:
        long long v74 = [(WBSFormControlMetadata *)v29 tagName];
        if ((objc_msgSend(v74, "safari_isCaseInsensitiveEqualToString:", @"input") & 1) != 0
          || (int v40 = objc_msgSend(v74, "safari_isCaseInsensitiveEqualToString:", @"textarea"),
              long long v41 = &stru_1EFBE3CF8,
              v40))
        {
          long long v41 = [(WBSFormControlMetadata *)v29 value];
        }
        long long v73 = v41;
        if (a9)
        {
          LOBYTE(v60) = a13;
          -[WBSFormDataController _matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_matchesForControl:inDomain:matchingPartialString:autoFillDataType:preferredLabel:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v29, v66, v60);
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v61) = a13;
          uint64_t v43 = [(WBSFormDataController *)self _matchesForControl:v29 inDomain:v66 matchingPartialString:&stru_1EFBE3CF8 autoFillDataType:a5 preferredLabel:v67 contact:v71 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v61];
          id v44 = v43;
          if (v42)
          {
            uint64_t v45 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v42];
            [v45 addObjectsFromArray:v44];
            uint64_t v46 = [v45 array];
          }
          else
          {
            id v44 = v43;
            uint64_t v46 = v44;
          }
          goto LABEL_43;
        }
        uint64_t v47 = [v18 addressSetLabelUsedDuringFirstAutoFillPass];
        uint64_t v48 = (void *)v47;
        BOOL v49 = v67;
        if (v47) {
          BOOL v49 = (void *)v47;
        }
        id v42 = v49;

        LOBYTE(v60) = a13;
        id v44 = [(WBSFormDataController *)self bestMatchForControl:v29 inDomain:v66 matchingPartialString:v73 autoFillDataType:a5 preferredLabel:v42 contact:v71 allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:v60];
        unint64_t v50 = [(id)objc_opt_class() specifierForControl:v80];
        long long v51 = v50;
        if (!a13)
        {
          BOOL v52 = [v50 property];
          int v53 = [v52 isEqualToString:v72];

          if (v63 & 1 | ((v53 & 1) == 0))
          {
            if (v53 & v63)
            {
              int v63 = 1;
              goto LABEL_40;
            }
          }
          else
          {
            int v63 = 1;
          }
        }
        if ([(WBSFormDataController *)self _matchHasPreferredIdentifierOrShouldBeFilledInMultiRoundAutoFill:v44 specifier:v51 multiRoundAutoFillManager:v18 contact:v71])
        {
          if (v44)
          {
            v87[0] = v44;
            uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
          }
          else
          {
            uint64_t v46 = 0;
          }

LABEL_43:
          if (v70)
          {
            LOBYTE(v62) = a12;
            unint64_t v39 = [(WBSFormDataController *)self _addMatchesForControl:v80 startingAtIndex:v28 formMetadata:v81 fromExistingMatches:v70 fromAllMatchesIfNecessary:v46 addToFoundMatches:v21 addToAutoFillValues:v19 multiRoundAutoFillManager:v18 propertyToIdentifierMapForFoundMatches:v65 shouldUseExistingMatchesToFillFocusedField:v62];
LABEL_56:

            goto LABEL_57;
          }
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v42 = v46;
          uint64_t v54 = [v42 countByEnumeratingWithState:&v82 objects:v86 count:16];
          if (v54)
          {
            uint64_t v55 = *(void *)v83;
            do
            {
              for (uint64_t i = 0; i != v54; ++i)
              {
                if (*(void *)v83 != v55) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v57 = *(void *)(*((void *)&v82 + 1) + 8 * i);
                [v21 addObject:v57];
                unint64_t v58 = [(WBSFormDataController *)self addValuesForStandardFormControlsInForm:v81 startingAtIndex:v28 fromAutoFillItem:v57 toDictionary:v19 multiRoundAutoFillManager:v18];
              }
              unint64_t v39 = v58;
              uint64_t v54 = [v42 countByEnumeratingWithState:&v82 objects:v86 count:16];
            }
            while (v54);
          }
          else
          {
            unint64_t v39 = 1;
          }
          uint64_t v46 = v42;
        }
        else
        {
LABEL_40:

          uint64_t v46 = 0;
          unint64_t v39 = 1;
        }

        goto LABEL_56;
      }
LABEL_22:
      unint64_t v39 = 1;
LABEL_57:

      v28 += v39;
      if (v28 >= v76) {
        goto LABEL_58;
      }
    }

LABEL_20:
    long long v35 = [v79 property];
    char v36 = [v35 isEqualToString:v64];

    if ((v36 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_58:

  return v19;
}

- (BOOL)_matchHasPreferredIdentifierOrShouldBeFilledInMultiRoundAutoFill:(id)a3 specifier:(id)a4 multiRoundAutoFillManager:(id)a5 contact:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v10;
    int v15 = [v12 addressBookPropertiesThatCanBeFilled];
    if (v15)
    {
      uint64_t v16 = [v12 addressBookPropertiesThatCanBeFilled];
      int v17 = [v14 property];
      char v18 = [v16 containsObject:v17];

      if ((v18 & 1) == 0)
      {
        BOOL v25 = 0;
        goto LABEL_14;
      }
    }
    long long v19 = [v12 addressSetLabelUsedDuringFirstAutoFillPass];
    if (v19
      && ([v14 property],
          int v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = [v20 isEqualToString:*MEMORY[0x1E4F98020]],
          v20,
          v19,
          v21))
    {
      id v22 = [v14 label];
      uint64_t v23 = [v12 addressSetLabelUsedDuringFirstAutoFillPass];
      char v24 = [v22 isEqualToString:v23];
    }
    else
    {
      if (!v11
        || ([v11 property],
            id v26 = objc_claimAutoreleasedReturnValue(),
            BOOL v27 = [(WBSFormDataController *)self preferredIdentifierExistsForProperty:v26 withContact:v13], v26, !v27))
      {
        BOOL v25 = 1;
        goto LABEL_14;
      }
      unint64_t v28 = [v11 property];
      id v22 = [(WBSFormDataController *)self preferredIdentifierForProperty:v28 withContact:v13];

      uint64_t v23 = [v14 identifier];
      char v24 = [v23 isEqualToString:v22];
    }
    BOOL v25 = v24;

LABEL_14:
    goto LABEL_15;
  }
  BOOL v25 = 1;
LABEL_15:

  return v25;
}

- (unint64_t)_addMatchesForControl:(id)a3 startingAtIndex:(unint64_t)a4 formMetadata:(id)a5 fromExistingMatches:(id)a6 fromAllMatchesIfNecessary:(id)a7 addToFoundMatches:(id)a8 addToAutoFillValues:(id)a9 multiRoundAutoFillManager:(id)a10 propertyToIdentifierMapForFoundMatches:(id)a11 shouldUseExistingMatchesToFillFocusedField:(BOOL)a12
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v18 = a5;
  id v73 = a6;
  id v70 = a7;
  id v67 = a8;
  id v71 = a9;
  id v68 = a10;
  id v69 = a11;
  id v65 = v18;
  if (a12)
  {
    id v19 = v18;
    if ([v19 containsActiveElement])
    {
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v74 = v19;
      int v20 = [v19 controls];
      int v21 = (void *)[v20 countByEnumeratingWithState:&v110 objects:&v117 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v111;
        while (2)
        {
          for (uint64_t i = 0; i != v21; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v111 != v22) {
              objc_enumerationMutation(v20);
            }
            char v24 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            if ([v24 isActive])
            {
              int v21 = (void *)[v24 copy];
              goto LABEL_15;
            }
          }
          int v21 = (void *)[v20 countByEnumeratingWithState:&v110 objects:&v117 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      id v19 = v74;
    }
    else
    {
      int v21 = 0;
    }

    BOOL v25 = [v21 uniqueID];
  }
  else
  {
    BOOL v25 = 0;
  }
  *(void *)&long long v110 = 0;
  *((void *)&v110 + 1) = &v110;
  *(void *)&long long v111 = 0x2020000000;
  *((void *)&v111 + 1) = 1;
  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0x3032000000;
  v120 = __Block_byref_object_copy__13;
  v121 = __Block_byref_object_dispose__13;
  id v122 = 0;
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __268__WBSFormDataController__addMatchesForControl_startingAtIndex_formMetadata_fromExistingMatches_fromAllMatchesIfNecessary_addToFoundMatches_addToAutoFillValues_multiRoundAutoFillManager_propertyToIdentifierMapForFoundMatches_shouldUseExistingMatchesToFillFocusedField___block_invoke;
  v99[3] = &unk_1E5C9B688;
  v106 = &v117;
  v107 = &v110;
  v99[4] = self;
  id v63 = v65;
  id v100 = v63;
  unint64_t v108 = a4;
  id v64 = v68;
  id v101 = v64;
  BOOL v109 = a12;
  id v76 = v66;
  id v102 = v76;
  id v75 = v25;
  id v103 = v75;
  id v77 = v67;
  id v104 = v77;
  id v72 = v69;
  id v105 = v72;
  uint64_t v78 = (unsigned int (**)(void, void))MEMORY[0x1AD0C4F80](v99);
  id v26 = [(id)objc_opt_class() specifierForControl:v76];
  if (!v26
    || (id v86 = v26,
        [v26 property],
        BOOL v27 = objc_claimAutoreleasedReturnValue(),
        BOOL v28 = v27 == 0,
        v27,
        id v26 = v86,
        v28))
  {
    unint64_t v50 = *(void *)(*((void *)&v110 + 1) + 24);
  }
  else
  {
    uint64_t v62 = [v73 fillMatches];
    uint64_t v61 = [v73 skipMatches];
    double v80 = [v73 label];
    id v29 = [MEMORY[0x1E4F1CA80] set];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v30 = v61;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v95 objects:v116 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v96;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v96 != v32) {
            objc_enumerationMutation(v30);
          }
          BOOL v34 = [*(id *)(*((void *)&v95 + 1) + 8 * j) property];
          [v29 addObject:v34];
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v95 objects:v116 count:16];
      }
      while (v31);
    }

    long long v35 = [v86 property];
    long long v83 = [v72 objectForKeyedSubscript:v35];

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    obuint64_t j = v62;
    uint64_t v36 = [obj countByEnumeratingWithState:&v91 objects:v115 count:16];
    if (v36)
    {
      id v81 = 0;
      uint64_t v82 = *(void *)v92;
LABEL_28:
      id v84 = (id)v36;
      uint64_t v37 = 0;
      while (1)
      {
        if (*(void *)v92 != v82) {
          objc_enumerationMutation(obj);
        }
        char v38 = *(void **)(*((void *)&v91 + 1) + 8 * v37);
        unint64_t v39 = [v86 property];
        int v40 = [v38 property];
        char v41 = [v39 isEqualToString:v40];

        if ((v41 & 1) == 0) {
          goto LABEL_41;
        }
        id v42 = [v38 identifier];
        uint64_t v43 = v42;
        if (!v83 || ([v42 isEqualToString:v83] & 1) != 0)
        {
          id v44 = v43;

          id v81 = v44;
          uint64_t v45 = [v86 component];
          if (!v45) {
            goto LABEL_39;
          }
          uint64_t v46 = [v38 key];
          if (!v46)
          {

LABEL_39:
            if (((unsigned int (**)(void, void *))v78)[2](v78, v38))
            {
              [v71 addEntriesFromDictionary:v118[5]];
              unint64_t v50 = *(void *)(*((void *)&v110 + 1) + 24);

              goto LABEL_67;
            }
            goto LABEL_40;
          }
          uint64_t v47 = [v86 component];
          uint64_t v48 = [v38 key];
          char v49 = [v47 isEqualToString:v48];

          if (v49) {
            goto LABEL_39;
          }
        }
LABEL_40:

LABEL_41:
        if (v84 == (id)++v37)
        {
          uint64_t v36 = [obj countByEnumeratingWithState:&v91 objects:v115 count:16];
          if (v36) {
            goto LABEL_28;
          }
          goto LABEL_47;
        }
      }
    }
    id v81 = 0;
LABEL_47:

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v85 = v70;
    uint64_t v51 = [v85 countByEnumeratingWithState:&v87 objects:v114 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v88;
      while (2)
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v88 != v52) {
            objc_enumerationMutation(v85);
          }
          uint64_t v54 = *(void **)(*((void *)&v87 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v55 = v54;
            if (![v80 length])
            {
              id v56 = [v55 property];
              int v57 = [v29 containsObject:v56];

              if (v57)
              {
                [v77 addObject:v55];
              }
              else
              {
                unint64_t v58 = [v55 identifier];
                id v59 = v58;
                if (!v81 || ([v58 isEqualToString:v81])
                  && (!v83 || [v59 isEqualToString:v83])
                  && ((unsigned int (**)(void, id))v78)[2](v78, v55))
                {
                  [v71 addEntriesFromDictionary:v118[5]];
                  unint64_t v50 = *(void *)(*((void *)&v110 + 1) + 24);

                  goto LABEL_67;
                }
              }
            }
          }
        }
        uint64_t v51 = [v85 countByEnumeratingWithState:&v87 objects:v114 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }

    unint64_t v50 = *(void *)(*((void *)&v110 + 1) + 24);
LABEL_67:

    id v26 = v86;
  }

  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v110, 8);

  return v50;
}

uint64_t __268__WBSFormDataController__addMatchesForControl_startingAtIndex_formMetadata_fromExistingMatches_fromAllMatchesIfNecessary_addToFoundMatches_addToAutoFillValues_multiRoundAutoFillManager_propertyToIdentifierMapForFoundMatches_shouldUseExistingMatchesToFillFocusedField___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(a1 + 32) addValuesForStandardFormControlsInForm:*(void *)(a1 + 40) startingAtIndex:*(void *)(a1 + 104) fromAutoFillItem:v3 toDictionary:*(void *)(*(void *)(*(void *)(a1 + 88) + 8)+ 40) multiRoundAutoFillManager:*(void *)(a1 + 48)];
  if (![*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count])
  {
    if (!*(unsigned char *)(a1 + 112)
      || ([*(id *)(a1 + 56) uniqueID],
          id v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v11 isEqualToString:*(void *)(a1 + 64)],
          v11,
          (v12 & 1) != 0))
    {
      uint64_t v7 = 0;
      goto LABEL_13;
    }
    uint64_t v7 = 0;
LABEL_12:
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    goto LABEL_13;
  }
  if (*(unsigned char *)(a1 + 112))
  {
    if (*(void *)(a1 + 64))
    {
      uint64_t v7 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "objectForKeyedSubscript:");

      if (!v7) {
        goto LABEL_12;
      }
    }
  }
  [*(id *)(a1 + 72) addObject:v3];
  id v8 = [v3 identifier];
  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 80);
    id v10 = [v3 property];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  uint64_t v7 = 1;
LABEL_13:

  return v7;
}

- (void)saveRecentlyUsedAutoFillSetWithMatchesToFill:(id)a3 matchesForDoNotFill:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * v12) dictionaryRepresentation];
        [v8 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v10);
  }

  id v14 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = [*(id *)(*((void *)&v21 + 1) + 8 * v18) dictionaryRepresentation];
        [v14 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v16);
  }

  v29[0] = @"recentlyUsedAutoFillSetArray";
  v29[1] = @"recentlyUsedAutoFillSetDoNotFillArray";
  v30[0] = v8;
  v30[1] = v14;
  int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  [(WBSFormDataController *)self addRecentlyUsedAutoFillSet:v20 appendToTheEnd:0];
}

- (id)valuesForContactFormWithMetadata:(id)a3 inDomain:(id)a4 matches:(id *)a5 multiRoundAutoFillManager:(id)a6
{
  id v6 = [(WBSFormDataController *)self valuesForContactFormWithMetadata:a3 inDomain:a4 matches:a5 multiRoundAutoFillManager:a6 contact:0];
  return v6;
}

- (id)valuesForContactFormWithMetadata:(id)a3 inDomain:(id)a4 matches:(id *)a5 multiRoundAutoFillManager:(id)a6 contact:(id)a7
{
  LOWORD(v10) = 0;
  LOBYTE(v9) = 1;
  id v7 = -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, a4, 0, a5, 0, a6, v9, a7, 0, v10);
  return v7;
}

- (id)valuesForContactFormWithMetadata:(id)a3 matches:(id *)a4 multiRoundAutoFillManager:(id)a5 existingMatches:(id)a6 contact:(id)a7
{
  id v7 = [(WBSFormDataController *)self valuesForContactFormWithMetadata:a3 matches:a4 multiRoundAutoFillManager:a5 existingMatches:a6 shouldUseExistingMatchesToFillFocusedField:0 contact:a7];
  return v7;
}

- (id)valuesForContactFormWithMetadata:(id)a3 matches:(id *)a4 multiRoundAutoFillManager:(id)a5 existingMatches:(id)a6 shouldUseExistingMatchesToFillFocusedField:(BOOL)a7 contact:(id)a8
{
  LOWORD(v11) = a7;
  LOBYTE(v10) = 1;
  id v8 = -[WBSFormDataController _valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:](self, "_valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:wantAllMatches:contact:existingMatches:shouldUseExistingMatchesToFillFocusedField:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", a3, 0, 0, a4, 0, a5, v10, a8, a6, v11);
  return v8;
}

- (id)exactFQDNAndOtherSavedAccountMatchesForForm:(id)a3 atURL:(id)a4 webFrameIdentifier:(id)a5 savedAccountContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 userNameElementUniqueID];
  if (!v14)
  {
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  id v15 = [(id)objc_opt_class() _metadataForControlWithUniqueID:v14 inForm:v10];
  uint64_t v16 = v15;
  if (!v15)
  {
LABEL_9:
    int v20 = &stru_1EFBE3CF8;
    goto LABEL_10;
  }
  uint64_t v17 = [v15 value];
  int v18 = [v16 isVisible];
  int v19 = [v16 isReadOnly];
  if ((v18 ^ 1 | v19 | [v16 claimsToBeUsernameViaAutocompleteAttribute]) == 1
    && [v17 length]
    && ([v17 hasPrefix:@"@"] & 1) == 0)
  {
    int v20 = v17;
  }
  else
  {
    int v20 = &stru_1EFBE3CF8;
  }

LABEL_10:
  uint64_t v33 = 0;
  BOOL v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__13;
  uint64_t v37 = __Block_byref_object_dispose__13;
  id v38 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__13;
  uint64_t v31 = __Block_byref_object_dispose__13;
  id v32 = 0;
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F97FF0]) initWithString:v20 matchingType:0];
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F97FC8]) initWithURL:v11 options:3 userNameQuery:v21 associatedDomainsManager:0 webFrameIdentifier:v12];
  [v22 setContext:v13];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __114__WBSFormDataController_exactFQDNAndOtherSavedAccountMatchesForForm_atURL_webFrameIdentifier_savedAccountContext___block_invoke;
  v26[3] = &unk_1E5C9B6B0;
  v26[4] = &v33;
  v26[5] = &v27;
  [(WBSFormDataController *)self getSavedAccountMatchesWithCriteria:v22 synchronously:1 completionHandler:v26];
  id v23 = objc_alloc(MEMORY[0x1E4F97EE0]);
  long long v24 = (void *)[v23 initWithFirst:v34[5] second:v28[5]];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v24;
}

void __114__WBSFormDataController_exactFQDNAndOtherSavedAccountMatchesForForm_atURL_webFrameIdentifier_savedAccountContext___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 exactMatches];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [v11 potentialMatches];
  id v7 = [v11 associatedDomainMatches];
  uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)valuesFromUser:(id)a3 password:(id)a4 forLoginOrChangePasswordForm:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = a4;
  id v18 = a5;
  id v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v18 controls];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 classification];
        if ([v13 isEqualToString:@"username"])
        {
          BOOL v14 = [v7 length] == 0;

          if (!v14)
          {
            id v15 = [v12 uniqueID];
            [v19 setObject:v7 forKeyedSubscript:v15];
            goto LABEL_14;
          }
        }
        else
        {
        }
        id v15 = [v12 classification];
        if ([v15 isEqualToString:@"current-password"]
          && [v20 length])
        {
          int v16 = [v12 isSecureTextField];

          if (!v16) {
            continue;
          }
          id v15 = [v12 uniqueID];
          [v19 setObject:v20 forKeyedSubscript:v15];
        }
LABEL_14:
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  return v19;
}

- (id)valuesForFormWithMetadata:(id)a3 hideMyEmailRecord:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7 && ![v7 state])
  {
    uint64_t v10 = [v8 privateEmailAddress];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    id v11 = objc_alloc(MEMORY[0x1E4F1BA20]);
    uint64_t v12 = *MEMORY[0x1E4F1B700];
    v25[0] = [v11 initWithLabel:*MEMORY[0x1E4F1B700] value:v10];
    long long v22 = (void *)v25[0];
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v23 setEmailAddresses:v13];

    id v14 = v23;
    id v15 = [WBSAddressBookMatch alloc];
    int v16 = [v14 identifier];
    uint64_t v17 = [(WBSAddressBookMatch *)v15 initWithValue:v10 property:*MEMORY[0x1E4F98030] key:0 identifier:v16 label:v12];

    id v18 = [WBSRecentlyUsedAutoFillSet alloc];
    long long v24 = v17;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v20 = [(WBSRecentlyUsedAutoFillSet *)v18 initWithFillMatches:v19 skipMatches:MEMORY[0x1E4F1CBF0] label:v12];
    id v9 = [(WBSFormDataController *)self valuesForContactFormWithMetadata:v6 matches:0 multiRoundAutoFillManager:0 existingMatches:v20 shouldUseExistingMatchesToFillFocusedField:1 contact:v14];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }

  return v9;
}

- (id)annotationsFromUsername:(id)a3 forLoginOrChangePasswordForm:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a3;
  id v6 = a4;
  id v7 = [v6 userNameElementUniqueID];

  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (v5) {
      id v9 = v5;
    }
    else {
      id v9 = &stru_1EFBE3CF8;
    }
    id v11 = @"Username";
    v12[0] = v9;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }

  return v8;
}

- (id)_lastUsedUsernameForDomain:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_domainToLastUsedUsernameAndProtectionSpace objectForKey:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectAtIndex:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_setLastUsedUsername:(id)a3 andProtectionSpace:(id)a4 forDomain:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  domainToLastUsedUsernameAndProtectionSpace = self->_domainToLastUsedUsernameAndProtectionSpace;
  if (!domainToLastUsedUsernameAndProtectionSpace)
  {
    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = self->_domainToLastUsedUsernameAndProtectionSpace;
    self->_domainToLastUsedUsernameAndProtectionSpace = v12;

    domainToLastUsedUsernameAndProtectionSpace = self->_domainToLastUsedUsernameAndProtectionSpace;
  }
  v15[0] = v8;
  v15[1] = v9;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [(NSMutableDictionary *)domainToLastUsedUsernameAndProtectionSpace setObject:v14 forKey:v10];
}

- (id)lastUsedUsernameWithPasswordForURL:(id)a3 inContext:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(WBSFormDataController *)self shouldAutoFillPasswords])
  {
    id v9 = 0;
    goto LABEL_25;
  }
  id v8 = +[WBSFormDataController domainFromURL:v6];
  if ([v8 length])
  {
    id v9 = [(WBSFormDataController *)self _lastUsedUsernameForDomain:v8];
    if (!v9)
    {
      uint64_t v33 = 0;
      BOOL v34 = &v33;
      uint64_t v35 = 0x3032000000;
      uint64_t v36 = __Block_byref_object_copy__13;
      uint64_t v37 = __Block_byref_object_dispose__13;
      id v38 = 0;
      uint64_t v27 = 0;
      long long v28 = &v27;
      uint64_t v29 = 0x3032000000;
      id v30 = __Block_byref_object_copy__13;
      uint64_t v31 = __Block_byref_object_dispose__13;
      id v32 = 0;
      id v10 = objc_alloc(MEMORY[0x1E4F97FC8]);
      id v11 = [MEMORY[0x1E4F97FF0] queryThatMatchesEverything];
      long long v21 = (void *)[v10 initWithURL:v6 options:17 userNameQuery:v11 associatedDomainsManager:0 webFrameIdentifier:0];

      [v21 setContext:v7];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __70__WBSFormDataController_lastUsedUsernameWithPasswordForURL_inContext___block_invoke;
      v26[3] = &unk_1E5C9B6B0;
      v26[4] = &v33;
      v26[5] = &v27;
      [(WBSFormDataController *)self getSavedAccountMatchesWithCriteria:v21 synchronously:1 completionHandler:v26];
      if ((unint64_t)[(id)v34[5] count] > 1)
      {
LABEL_5:
        id v9 = 0;
LABEL_23:

        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v33, 8);

        goto LABEL_24;
      }
      if ([(id)v34[5] count] == 1)
      {
        id v20 = [(id)v34[5] objectAtIndexedSubscript:0];
        uint64_t v12 = [v20 user];
        id v9 = (void *)[v12 copy];
      }
      else
      {
        if (![(id)v28[5] count]) {
          goto LABEL_5;
        }
        id v20 = [(id)v28[5] objectAtIndexedSubscript:0];
        uint64_t v12 = [v20 user];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v13 = (id)v28[5];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v23;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) user];
              char v18 = [v17 isEqualToString:v12];

              if ((v18 & 1) == 0)
              {
                id v9 = 0;
                goto LABEL_21;
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v39 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        id v13 = [v20 user];
        id v9 = (void *)[v13 copy];
LABEL_21:
      }
      goto LABEL_23;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_24:

LABEL_25:
  return v9;
}

void __70__WBSFormDataController_lastUsedUsernameWithPasswordForURL_inContext___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 exactMatches];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [v9 potentialMatches];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_knownUsernamesWithPasswordsForURL:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__13;
  char v18 = __Block_byref_object_dispose__13;
  id v19 = 0;
  id v8 = objc_alloc(MEMORY[0x1E4F97FC8]);
  id v9 = [MEMORY[0x1E4F97FF0] queryThatMatchesEverything];
  id v10 = (void *)[v8 initWithURL:v6 options:17 userNameQuery:v9 associatedDomainsManager:0 webFrameIdentifier:0];

  [v10 setContext:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__WBSFormDataController__knownUsernamesWithPasswordsForURL_inContext___block_invoke;
  v13[3] = &unk_1E5C9B6D8;
  v13[4] = &v14;
  [(WBSFormDataController *)self getSavedAccountMatchesWithCriteria:v10 synchronously:1 completionHandler:v13];
  id v11 = objc_msgSend((id)v15[5], "safari_setByApplyingBlock:", &__block_literal_global_246);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __70__WBSFormDataController__knownUsernamesWithPasswordsForURL_inContext___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 exactMatches];
  uint64_t v4 = [v8 potentialMatches];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id __70__WBSFormDataController__knownUsernamesWithPasswordsForURL_inContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 user];
  return v2;
}

- (void)didFillPasswordForUsername:(id)a3 fromProviderWithBundleIdentifier:(id)a4 inTabWithID:(id)a5 currentURL:(id)a6 isPrivate:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!self->_recentAutoFillEvents)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    recentAutoFillEvents = self->_recentAutoFillEvents;
    self->_recentAutoFillEvents = v16;
  }
  if (!self->_keybagCallbackToken)
  {
    char v18 = [MEMORY[0x1E4F97EC8] sharedManager];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke;
    v26[3] = &unk_1E5C8CA70;
    v26[4] = self;
    id v19 = [v18 addKeyBagLockStatusChangedObserverWithHandler:v26];
    id keybagCallbackToken = self->_keybagCallbackToken;
    self->_id keybagCallbackToken = v19;
  }
  [(WBSFormDataController *)self _removeExpiredAutoFillEvents:self->_recentAutoFillEvents];
  long long v21 = self->_recentAutoFillEvents;
  long long v22 = [[WBSAutoFillEvent alloc] initWithUsername:v12 tabID:v14 isPrivateTab:v7 url:v15 providerBundleIdentifier:v13];
  [(NSMutableArray *)v21 addObject:v22];

  agentProxy = self->_agentProxy;
  long long v24 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v25 = [v24 bundleIdentifier];
  [(WBSAuthenticationServicesAgentProxy *)agentProxy didFillCredentialForUsername:v12 forURL:v15 fromProviderWithBundleIdentifier:v13 inBrowserWithBundleIdentifier:v25];
}

void __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke_2;
  block[3] = &unk_1E5C8CA70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __118__WBSFormDataController_didFillPasswordForUsername_fromProviderWithBundleIdentifier_inTabWithID_currentURL_isPrivate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F97EC8] sharedManager];
  uint64_t v3 = [v2 keyBagLockStatus];

  if ((unint64_t)(v3 - 1) <= 1)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 104);
    [v4 removeAllObjects];
  }
}

- (void)canAutomaticallyRegisterPasskeyForUsername:(id)a3 inTabWithID:(id)a4 currentURL:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t))a6;
  if ([(WBSFormDataController *)self _hasMatchingAutoFillEventForUsername:v10 withinTimeInterval:v11 inTabWithID:v12 currentURL:0 shouldAllowPrivateTabs:1 shouldRemoveMatchingEvent:1 shouldIncludeExternalCredentialEvents:300.0])
  {
    v13[2](v13, 1);
  }
  else
  {
    id v14 = [(NSMutableArray *)self->_recentAutoFillEvents lastObject];
    if (v14)
    {
      id v15 = [v12 host];
      uint64_t v16 = objc_msgSend(v15, "safari_highLevelDomainForPasswordManager");

      agentProxy = self->_agentProxy;
      char v18 = [v14 url];
      id v19 = [v18 absoluteString];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __109__WBSFormDataController_canAutomaticallyRegisterPasskeyForUsername_inTabWithID_currentURL_completionHandler___block_invoke;
      v20[3] = &unk_1E5C9B720;
      long long v21 = v13;
      [(WBSAuthenticationServicesAgentProxy *)agentProxy isOrigin:v19 relatedToRelyingPartyIdentifier:v16 completionHandler:v20];
    }
    else
    {
      v13[2](v13, 0);
    }
  }
}

uint64_t __109__WBSFormDataController_canAutomaticallyRegisterPasskeyForUsername_inTabWithID_currentURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canApplyAutoFillGracePeriodForUsername:(id)a3 inTabWithID:(id)a4 currentURL:(id)a5
{
  return [(WBSFormDataController *)self _hasMatchingAutoFillEventForUsername:a3 withinTimeInterval:a4 inTabWithID:a5 currentURL:1 shouldAllowPrivateTabs:0 shouldRemoveMatchingEvent:0 shouldIncludeExternalCredentialEvents:60.0];
}

- (BOOL)_hasMatchingAutoFillEventForUsername:(id)a3 withinTimeInterval:(double)a4 inTabWithID:(id)a5 currentURL:(id)a6 shouldAllowPrivateTabs:(BOOL)a7 shouldRemoveMatchingEvent:(BOOL)a8 shouldIncludeExternalCredentialEvents:(BOOL)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  if ([(NSMutableArray *)self->_recentAutoFillEvents count])
  {
    [(WBSFormDataController *)self _removeExpiredAutoFillEvents:self->_recentAutoFillEvents];
    recentAutoFillEvents = self->_recentAutoFillEvents;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __191__WBSFormDataController__hasMatchingAutoFillEventForUsername_withinTimeInterval_inTabWithID_currentURL_shouldAllowPrivateTabs_shouldRemoveMatchingEvent_shouldIncludeExternalCredentialEvents___block_invoke;
    v23[3] = &unk_1E5C9B748;
    id v24 = v16;
    id v25 = v17;
    id v26 = v18;
    unint64_t v27 = (unint64_t)(a4 * 1000000000.0);
    BOOL v28 = a7;
    BOOL v29 = a9;
    uint64_t v20 = [(NSMutableArray *)recentAutoFillEvents indexOfObjectPassingTest:v23];
    BOOL v21 = v20 != 0x7FFFFFFFFFFFFFFFLL;
    if (v20 != 0x7FFFFFFFFFFFFFFFLL && a8) {
      [(NSMutableArray *)self->_recentAutoFillEvents removeObjectAtIndex:v20];
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

BOOL __191__WBSFormDataController__hasMatchingAutoFillEventForUsername_withinTimeInterval_inTabWithID_currentURL_shouldAllowPrivateTabs_shouldRemoveMatchingEvent_shouldIncludeExternalCredentialEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 username];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [v3 tabID];
    if (v5 == *(void **)(a1 + 40))
    {
      BOOL v7 = [v3 url];
      id v8 = [v7 host];
      id v9 = objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");
      id v10 = [*(id *)(a1 + 48) host];
      id v11 = objc_msgSend(v10, "safari_highLevelDomainForPasswordManager");
      if ([v9 isEqualToString:v11]
        && (unint64_t)[v3 timeIntervalSinceTimestamp] <= *(void *)(a1 + 56)
        && (*(unsigned char *)(a1 + 64) || ([v3 isPrivateTab] & 1) == 0))
      {
        if ([v3 isExternalCredentialProviderEvent]) {
          BOOL v6 = *(unsigned char *)(a1 + 65) != 0;
        }
        else {
          BOOL v6 = 1;
        }
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_removeExpiredAutoFillEvents:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__WBSFormDataController__removeExpiredAutoFillEvents___block_invoke;
  v3[3] = &__block_descriptor_40_e33_B32__0__WBSAutoFillEvent_8Q16_B24l;
  v3[4] = 300000000000;
  objc_msgSend(a3, "safari_removeObjectsPassingTest:", v3);
}

BOOL __54__WBSFormDataController__removeExpiredAutoFillEvents___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 timeIntervalSinceTimestamp] > *(void *)(a1 + 32);
}

- (BOOL)shouldAutoFillFromAddressBook
{
  return 0;
}

- (BOOL)shouldAutoFillFromPreviousData
{
  return 0;
}

- (BOOL)shouldAutoFillPasswords
{
  return 0;
}

- (BOOL)hasUserDeniedAccessToCredential:(id)a3 inProtectionSpace:(id)a4
{
  return 0;
}

- (id)completionDBPath
{
  return 0;
}

- (id)encryptOrDecryptData:(id)a3 encrypt:(BOOL)a4
{
  uint64_t v4 = (void *)[a3 copy];
  return v4;
}

- (void)getSavedAccountMatchesWithCriteria:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = (void (**)(id, void))a5;
  if ([(WBSFormDataController *)self shouldAutoFillPasswords])
  {
    id v9 = [(WBSAutoFillQuirksManager *)self->_autoFillQuirksManager associatedDomainsManager];
    [v11 setAssociatedDomainsManager:v9];

    [MEMORY[0x1E4F97FD0] sharedStore];
    if (v6) {
      id v10 = {;
    }
      [v10 getSavedAccountsMatchingCriteria:v11 withSynchronousCompletionHandler:v8];
    }
    else {
      id v10 = {;
    }
      [v10 savedAccountsMatchingCriteria:v11 withCompletionHandler:v8];
    }
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (id)metadataOfActiveFormOrBestFormForPageLevelAutoFill:(id)a3 frame:(OpaqueFormAutoFillFrame *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__13;
  id v12 = __Block_byref_object_dispose__13;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__WBSFormDataController_metadataOfActiveFormOrBestFormForPageLevelAutoFill_frame___block_invoke;
  v7[3] = &unk_1E5C9B790;
  v7[4] = &v8;
  void v7[5] = &v14;
  [a3 enumerateFormsUsingBlock:v7];
  if (a4) {
    *a4 = (OpaqueFormAutoFillFrame *)v15[3];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __82__WBSFormDataController_metadataOfActiveFormOrBestFormForPageLevelAutoFill_frame___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([v8 containsActiveElement])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  else if ([v8 isBestForPageLevelAutoFill])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (id)metadataOfBestFormForStreamlinedLogin:(id)a3 frame:(OpaqueFormAutoFillFrame *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__13;
  id v12 = __Block_byref_object_dispose__13;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__WBSFormDataController_metadataOfBestFormForStreamlinedLogin_frame___block_invoke;
  v7[3] = &unk_1E5C9B790;
  v7[4] = &v8;
  void v7[5] = &v14;
  [a3 enumerateFormsUsingBlock:v7];
  if (a4) {
    *a4 = (OpaqueFormAutoFillFrame *)v15[3];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __69__WBSFormDataController_metadataOfBestFormForStreamlinedLogin_frame___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([v8 isBestForStreamlinedLogin])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

- (BOOL)isPasswordFieldForUserCredentialsWithMetadata:(id)a3 formMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 type];
  if ((unint64_t)(v7 - 6) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v9 = [v5 uniqueID];
    uint64_t v10 = [v6 passwordElementUniqueID];
    char v11 = [v10 isEqualToString:v9];

    if (v11)
    {
      char v8 = 1;
    }
    else if (v7 == 3)
    {
      char v8 = 0;
    }
    else
    {
      id v12 = [v6 confirmPasswordElementUniqueID];
      char v8 = [v12 isEqualToString:v9];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)willSubmitFormWithCredentials:(id)a3 shouldPreferAnnotatedCredentials:(BOOL)a4 atURL:(id)a5 username:(id *)a6 password:(id *)a7 inContext:(id)a8 shouldShowPasswordsAppOnboarding:(BOOL)a9
{
  self->_shouldShowPasswordsAppOnboarding = a9;
  [(WBSFormDataController *)self updateLastUsedUsernameAndExtractUsernameAndPasswordFromForm:a3 shouldPreferAnnotatedCredentials:a4 atURL:a5 username:a6 password:a7 inContext:a8];
}

- (void)updateLastUsedUsernameAndExtractUsernameAndPasswordFromForm:(id)a3 shouldPreferAnnotatedCredentials:(BOOL)a4 atURL:(id)a5 username:(id *)a6 password:(id *)a7 inContext:(id)a8
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v64 = a5;
  id v62 = a8;
  id v63 = a6;
  *a6 = 0;
  id v55 = a7;
  *a7 = 0;
  id v65 = self;
  if (![(WBSFormDataController *)self shouldAutoFillPasswords]
    && !self->_shouldShowPasswordsAppOnboarding)
  {
    goto LABEL_70;
  }
  uint64_t v61 = [v66 userNameElementUniqueID];
  int v57 = [(id)objc_opt_class() domainFromURL:v64];
  if (![v57 length]) {
    goto LABEL_69;
  }
  uint64_t v60 = [MEMORY[0x1E4F1CA80] set];
  id v56 = [v66 annotations];
  objc_msgSend(v56, "safari_stringForKey:", @"Username");
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  if (v59) {
    [v60 addObject:v59];
  }
  id v13 = [(WBSFormDataController *)self _knownUsernamesWithPasswordsForURL:v64 inContext:v62];
  [v60 unionSet:v13];

  if (![v61 length]) {
    goto LABEL_45;
  }
  id v69 = [(id)objc_opt_class() _metadataForControlWithUniqueID:v61 inForm:v66];
  id v70 = [v69 value];
  if (objc_msgSend(v60, "containsObject:"))
  {
    uint64_t v14 = v70;
    goto LABEL_42;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v60;
  uint64_t v15 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (!v15)
  {
    id v18 = v70;
    goto LABEL_41;
  }
  uint64_t v68 = *(void *)v73;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v73 != v68) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v72 + 1) + 8 * v16);
      id v18 = v70;
      id v19 = v17;
      id v20 = v69;
      if (([v18 isEqualToString:v19] & 1) != 0
        || (v21 = [v18 length], uint64_t v22 = objc_msgSend(v19, "length"), !v21)
        || (uint64_t v23 = v22) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      if (v21 == v22)
      {
        uint64_t v24 = 0;
        char v25 = 0;
        do
        {
          int v26 = [v18 characterAtIndex:v24];
          int v27 = [v19 characterAtIndex:v24];
          if ((v26 != 42 || v27 == 42) && (v26 != 8226 || v27 == 8226))
          {
            if (v26 != v27) {
              goto LABEL_15;
            }
          }
          else
          {
            char v25 = 1;
          }
          ++v24;
        }
        while (v21 != v24);

        if (v25)
        {
LABEL_39:
          id v33 = v19;

          id v18 = v33;
          goto LABEL_41;
        }
      }
      else
      {
        char v28 = [v20 isUserEditedTextField];
        if (v21 <= v23 + 1) {
          char v29 = 1;
        }
        else {
          char v29 = v28;
        }
        if (v29) {
          goto LABEL_15;
        }
        id v30 = [@"_" stringByAppendingString:v19];
        char v31 = [v18 hasSuffix:v30];

        if (v31) {
          goto LABEL_39;
        }
      }
LABEL_16:
      ++v16;
    }
    while (v16 != v15);
    uint64_t v32 = [obj countByEnumeratingWithState:&v72 objects:v77 count:16];
    uint64_t v15 = v32;
  }
  while (v32);
LABEL_41:

  uint64_t v14 = v18;
LABEL_42:
  id v71 = v14;
  if ([v14 length])
  {
    BOOL v34 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", v64);
    [(WBSFormDataController *)v65 _setLastUsedUsername:v71 andProtectionSpace:v34 forDomain:v57];

    id *v63 = v71;
  }

LABEL_45:
  uint64_t v35 = [*v63 length];
  if (v59 && !v35) {
    id *v63 = v59;
  }
  uint64_t v36 = [v66 passwordElementUniqueID];
  uint64_t v37 = [(id)objc_opt_class() _metadataForControlWithUniqueID:v36 inForm:v66];
  if (![*v63 length])
  {
    id v38 = [v37 associatedUsername];
    if ([v38 length]) {
      id *v63 = v38;
    }
  }
  if (![*v63 length] && objc_msgSend(v66, "type") != 4)
  {
    id *v63 = [(WBSFormDataController *)v65 lastUsedUsernameWithPasswordForURL:v64 inContext:v62];
  }
  unint64_t v39 = [v37 value];
  if (a4)
  {
    uint64_t v40 = @"NewPassword";
  }
  else
  {
    uint64_t v40 = [(WBSFormDataController *)v65 _keyToLookUpInAnnotationsForPasswordForFormMetadata:v66];
  }
  char v41 = v40;
  id v42 = objc_msgSend(v56, "safari_stringForKey:", v40);
  id v43 = v39;
  id v44 = v42;
  id v45 = v37;
  if (([v43 isEqualToString:v44] & 1) != 0
    || (uint64_t v50 = [v43 length], v51 = objc_msgSend(v44, "length"), !v50)
    || !v51
    || v50 != v51)
  {

    id v46 = v43;
    goto LABEL_60;
  }
  if (([v45 isUserEditedTextField] & 1) == 0)
  {
    uint64_t v76 = 0;
    uint64_t v52 = [MEMORY[0x1E4F28FE8] scannerWithString:v43];
    [v52 scanInteger:&v76];
    int v53 = [v52 isAtEnd];

    if (v53)
    {

      goto LABEL_78;
    }
  }
  int v54 = objc_msgSend(v43, "safari_looksLikeObscuredPassword");

  if (v54)
  {
LABEL_78:
    id v46 = v44;
LABEL_60:

    id v43 = v46;
  }
  uint64_t v47 = v44;
  if (!a4)
  {
    uint64_t v48 = [v43 length];
    if (v44) {
      BOOL v49 = v48 == 0;
    }
    else {
      BOOL v49 = 0;
    }
    if (v49) {
      uint64_t v47 = v44;
    }
    else {
      uint64_t v47 = v43;
    }
  }
  id *v55 = v47;

LABEL_69:
LABEL_70:
}

- (id)_keyToLookUpInAnnotationsForPasswordForFormMetadata:(id)a3
{
  if (([a3 type] & 0xFFFFFFFFFFFFFFFELL) == 4) {
    id v3 = WBSFormAnnotationNewPasswordKey;
  }
  else {
    id v3 = WBSFormAnnotationCurrentPasswordKey;
  }
  uint64_t v4 = *v3;
  return v4;
}

- (id)substituteCredential:(id)a3 inProtectionSpace:(id)a4
{
  id v4 = a3;
  return v4;
}

- (id)savedAccountUsingDomainsToConsiderIdenticalWithUsername:(id)a3 url:(id *)a4 host:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = [(WBSFormDataController *)self autoFillQuirksManager];
  uint64_t v7 = [v6 associatedDomainsManager];
  char v8 = [v7 domainsToConsiderIdenticalToDomain:*a5];

  unint64_t v21 = [MEMORY[0x1E4F29088] componentsWithURL:*a4 resolvingAgainstBaseURL:1];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [MEMORY[0x1E4F97FD0] sharedStore];
  uint64_t v10 = [v9 savedAccounts];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v16 = [v14 sites];
        [v15 addObjectsFromArray:v16];

        [v15 intersectSet:v8];
        if ([v15 count])
        {
          id v18 = [v15 anyObject];
          [v21 setHost:v18];
          *a4 = [v21 URL];
          id v19 = v18;
          *a5 = v19;
          id v17 = v14;

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_11:

  return v17;
}

- (id)autoGeneratedPasswordForURL:(id)a3 respectingPasswordRequirements:(id)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(WBSFormDataController *)self autoFillQuirksManager];
  uint64_t v11 = [v10 passwordGenerationManager];

  if ([v9 count])
  {
    id v12 = v9;
  }
  else
  {
    id v12 = [v11 defaultRequirementsForURL:v8];
  }
  id v13 = v12;
  uint64_t v14 = [v11 updatedRequirements:v12 respectingMaxLength:a5];

  if ([v11 passwordGenerationIsDisallowedByRequirements:v14])
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = [v11 generatedPasswordMatchingRequirements:v14];
  }

  return v15;
}

+ (BOOL)contactIsMe:(id)a3
{
  return 0;
}

+ (id)contactKeyForString:(id)a3
{
  v20[12] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  {
    id v4 = (void *)+[WBSFormDataController contactKeyForString:]::map;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F1AF10];
    v19[0] = @"Address";
    v19[1] = @"Birthday";
    uint64_t v8 = *MEMORY[0x1E4F1AD90];
    v20[0] = v7;
    v20[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1ADC8];
    v19[2] = @"Email";
    v19[3] = @"First";
    uint64_t v10 = *MEMORY[0x1E4F1ADF0];
    v20[2] = v9;
    v20[3] = v10;
    uint64_t v11 = *MEMORY[0x1E4F1AE60];
    v19[4] = @"InstantMessage";
    v19[5] = @"JobTitle";
    uint64_t v12 = *MEMORY[0x1E4F1AE78];
    void v20[4] = v11;
    v20[5] = v12;
    uint64_t v13 = *MEMORY[0x1E4F1ADE0];
    v19[6] = @"Last";
    v19[7] = @"Middle";
    uint64_t v14 = *MEMORY[0x1E4F1AEA0];
    v20[6] = v13;
    v20[7] = v14;
    uint64_t v15 = *MEMORY[0x1E4F1AED8];
    v19[8] = @"Organization";
    v19[9] = @"Phone";
    uint64_t v16 = *MEMORY[0x1E4F1AEE0];
    v20[8] = v15;
    v20[9] = v16;
    uint64_t v17 = *MEMORY[0x1E4F1AFB0];
    uint64_t v18 = *MEMORY[0x1E4F98068];
    v19[10] = @"URLs";
    v19[11] = v18;
    v20[10] = v17;
    v20[11] = v18;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:12];
    +[WBSFormDataController contactKeyForString:]::map = (uint64_t)v4;
  }
  id v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (id)addressBookMatchesForFullNameForContact:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
  if ([v4 length])
  {
    id v5 = [WBSAddressBookMatch alloc];
    id v6 = [v3 identifier];
    uint64_t v7 = [(WBSAddressBookMatch *)v5 initWithValue:v4 property:*MEMORY[0x1E4F98068] key:0 identifier:0 label:0 uniqueID:v6];
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)notifyKeychainWasDirectlyAffectedBySafari
{
}

- (BOOL)textFieldMetadataMeetsRequirementsForAutomaticStrongPasswordTreatment:(id)a3 form:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v5 classification];
    char v10 = [v9 isEqualToString:@"new-password"];

    if ((v10 & 1) != 0
      && (unint64_t v11 = [v5 maxLength], v11 >= objc_msgSend(MEMORY[0x1E4F97F60], "minimumPasswordLength")))
    {
      uint64_t v12 = [v5 value];
      BOOL v8 = [v12 length] == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)textFieldIsEligibleForAutomaticStrongPassword:(id)a3 form:(id)a4 ignorePreviousDecision:(BOOL)a5 textFieldCurrentlyContainsStrongPassword:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 autoFillButtonType];
  if (a6) {
    *a6 = v12 == 3;
  }
  if (v12 == 3)
  {
    a5 = 1;
  }
  else if ([(WBSFormDataController *)self textFieldMetadataMeetsRequirementsForAutomaticStrongPasswordTreatment:v10 form:v11])
  {
    if ([v10 lastAutoFillButtonType] != 3) {
      a5 = 1;
    }
  }
  else
  {
    a5 = 0;
  }

  return a5;
}

- (BOOL)frameIsKnownToAskForCredentialsFromOtherServicesFromAncestorFrameURLs:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    id v6 = [v4 firstObject];
    uint64_t v7 = [v4 lastObject];
    BOOL v8 = [v6 host];
    uint64_t v9 = objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");

    id v10 = [v7 host];
    id v11 = objc_msgSend(v10, "safari_highLevelDomainForPasswordManager");
    char v12 = [v9 isEqualToString:v11];

    if (v12) {
      char v5 = 0;
    }
    else {
      char v5 = [(WBSAutoFillQuirksManager *)self->_autoFillQuirksManager isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty:v9];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)password:(id)a3 shouldBeConsideredEqualToExistingPassword:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = ([v5 isEqualToString:v6] & 1) != 0
    || +[WBSFormDataController _password:appearsToBeASixDigitCodeAppendedToPassword:](WBSFormDataController, "_password:appearsToBeASixDigitCodeAppendedToPassword:", v5, v6)|| +[WBSFormDataController _password:v5 appearsToBeMoreThanOneSymbolAppendedToPassword:v6];

  return v7;
}

+ (BOOL)_password:(id)a3 appearsToBeASixDigitCodeAppendedToPassword:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && !objc_msgSend(v5, "rangeOfString:", v6))
  {
    uint64_t v9 = [v5 substringFromIndex:v7];
    if ([v9 length] == 6)
    {
      id v10 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      id v11 = [v10 invertedSet];

      BOOL v8 = [v9 rangeOfCharacterFromSet:v11] == 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)_password:(id)a3 appearsToBeMoreThanOneSymbolAppendedToPassword:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length") && !objc_msgSend(v5, "rangeOfString:", v6))
  {
    id v10 = [v5 substringFromIndex:v7];
    if ((unint64_t)[v10 length] >= 2)
    {
      id v11 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"@"];
      v24[0] = v11;
      char v12 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*"];
      v24[1] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v14 = v13;
      uint64_t v8 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v15 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v14);
            }
            uint64_t v17 = objc_msgSend(v10, "stringByTrimmingCharactersInSet:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
            BOOL v18 = [v17 length] == 0;

            if (v18)
            {
              LOBYTE(v8) = 1;
              goto LABEL_18;
            }
          }
          uint64_t v8 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)isFieldUnidentified:(id)a3
{
  id v3 = a3;
  id v4 = [v3 addressBookLabel];
  if (v4 || ([v3 looksLikePasswordCredentialField] & 1) != 0) {
    LOBYTE(v5) = 0;
  }
  else {
    int v5 = [v3 looksLikeIgnoredDataTypeField] ^ 1;
  }

  return v5;
}

- (WBSAutoFillQuirksManager)autoFillQuirksManager
{
  return self->_autoFillQuirksManager;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_agentProxy, 0);
  objc_storeStrong(&self->_keybagCallbackToken, 0);
  objc_storeStrong((id *)&self->_recentAutoFillEvents, 0);
  objc_storeStrong((id *)&self->_mapOfHighLevelDomainToLastAutomaticFormSubmission, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cachedBirthdayAndLocalizedStrings, 0);
  objc_storeStrong((id *)&self->_preferredLabelForUniqueIDOfPersonMap, 0);
  objc_storeStrong((id *)&self->_recentlyUsedAutoFillSets, 0);
  objc_storeStrong((id *)&self->_domainToLastUsedUsernameAndProtectionSpace, 0);
  objc_storeStrong((id *)&self->_preferredLabelsMap, 0);
  objc_storeStrong((id *)&self->_valuesDB, 0);
  objc_storeStrong((id *)&self->_completionDB, 0);
  objc_storeStrong(&self->_keychainNotificationRegistrationToken, 0);
  objc_storeStrong((id *)&self->_keychainMonitor, 0);
}

- (void)allFormDataForSaving
{
}

- (void)getFormFieldValues:(os_log_t)log andFieldToFocus:withSingleCreditCardData:inField:inForm:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Found %lu controls, but expected 3 or fewer.", buf, 0xCu);
}

- (void)getFormFieldValues:(uint64_t)a3 andFieldToFocus:(uint64_t)a4 withSingleCreditCardData:(uint64_t)a5 inField:(uint64_t)a6 inForm:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getFormFieldValues:(os_log_t)log andFieldToFocus:withSingleCreditCardData:inField:inForm:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Could not fill date into single non-text field", v1, 2u);
}

@end