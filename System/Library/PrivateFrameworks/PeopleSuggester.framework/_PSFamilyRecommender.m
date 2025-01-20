@interface _PSFamilyRecommender
- (BOOL)regexMatchForRegex:(id)a3 string:(id)a4;
- (CNContactStore)contactStore;
- (HKMedicalIDStore)medicalIDStore;
- (OS_dispatch_queue)queue;
- (_CDInteractionStore)interactionStore;
- (_PSContactResolver)contactResolver;
- (_PSFamilyRecommender)init;
- (id)contactIdsFromContactNamesUsingMe:(id)a3;
- (id)contactIdsFromContactRelationsUsingMe:(id)a3;
- (id)contactIdsFromEmergencyContacts;
- (id)contactKeysToFetch;
- (id)currentFamily;
- (id)currentFamilyExcludingMe:(id)a3;
- (id)familyRecipientsForShareSheetWithPredictionContext:(id)a3;
- (id)familyRecommendationSuggestionsForShareSheetWithPredictionContext:(id)a3;
- (id)familyRecommendations;
- (id)fetchAllContactIdsFromContactStore:(id)a3;
- (id)handleAndBundleIdDictionaryForFamilyRecipientContact:(id)a3 lookBackDays:(int64_t)a4;
- (id)nonFamilyRelations;
- (id)personRelationshipVocabularyByLocaleDictionary;
- (id)recipientFromFamilyContactId:(id)a3 familySuggestions:(id)a4 me:(id)a5 currentFamilyIds:(id)a6;
- (id)relationshipRegularExpressionForRelationship;
- (id)rerankFamilyRecipients:(id)a3 usingPredictionContext:(id)a4;
- (id)suggestionsForPhotosContactInferencesWithPredictionContext:(id)a3;
- (id)suggestionsForPhotosRelationshipsWithPredictionContext:(id)a3;
- (id)suggestionsFromRecipients:(id)a3;
- (unint64_t)indexToInsertDate:(id)a3 array:(id)a4;
- (void)logFeedbackForFamilyRecommenderCallHasRecommendations:(BOOL)a3;
- (void)setContactResolver:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setInteractionStore:(id)a3;
- (void)setMedicalIDStore:(id)a3;
@end

@implementation _PSFamilyRecommender

- (_PSFamilyRecommender)init
{
  v9.receiver = self;
  v9.super_class = (Class)_PSFamilyRecommender;
  v2 = [(_PSFamilyRecommender *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, -15);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.PeopleSuggester.familyrecommender-task-queue", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (_CDInteractionStore)interactionStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionStore = self->_interactionStore;
  if (!interactionStore)
  {
    v5 = (void *)MEMORY[0x1E4F5B400];
    dispatch_queue_t v6 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    v7 = [v5 storeWithDirectory:v6 readOnly:1];
    v8 = self->_interactionStore;
    self->_interactionStore = v7;

    interactionStore = self->_interactionStore;
  }
  objc_super v9 = interactionStore;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (CNContactStore)contactStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v5 = (void *)getCNContactStoreClass_softClass_1;
    uint64_t v14 = getCNContactStoreClass_softClass_1;
    if (!getCNContactStoreClass_softClass_1)
    {
      ContactsLibraryCore_1();
      v12[3] = (uint64_t)objc_getClass("CNContactStore");
      getCNContactStoreClass_softClass_1 = v12[3];
      v5 = (void *)v12[3];
    }
    dispatch_queue_t v6 = v5;
    _Block_object_dispose(&v11, 8);
    v7 = (CNContactStore *)objc_alloc_init(v6);
    v8 = self->_contactStore;
    self->_contactStore = v7;

    contactStore = self->_contactStore;
  }
  objc_super v9 = contactStore;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (HKMedicalIDStore)medicalIDStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  medicalIDStore = self->_medicalIDStore;
  if (!medicalIDStore)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v5 = (void *)getHKMedicalIDStoreClass_softClass;
    uint64_t v18 = getHKMedicalIDStoreClass_softClass;
    if (!getHKMedicalIDStoreClass_softClass)
    {
      HealthKitLibraryCore();
      v16[3] = (uint64_t)objc_getClass("HKMedicalIDStore");
      getHKMedicalIDStoreClass_softClass = v16[3];
      v5 = (void *)v16[3];
    }
    dispatch_queue_t v6 = v5;
    _Block_object_dispose(&v15, 8);
    id v7 = [v6 alloc];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v8 = (void *)getHKHealthStoreClass_softClass;
    uint64_t v18 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      HealthKitLibraryCore();
      v16[3] = (uint64_t)objc_getClass("HKHealthStore");
      getHKHealthStoreClass_softClass = v16[3];
      v8 = (void *)v16[3];
    }
    objc_super v9 = v8;
    _Block_object_dispose(&v15, 8);
    id v10 = objc_alloc_init(v9);
    uint64_t v11 = (HKMedicalIDStore *)[v7 initWithHealthStore:v10];
    v12 = self->_medicalIDStore;
    self->_medicalIDStore = v11;

    medicalIDStore = self->_medicalIDStore;
  }
  uint64_t v13 = medicalIDStore;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (_PSContactResolver)contactResolver
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    v5 = objc_alloc_init(_PSContactResolver);
    dispatch_queue_t v6 = self->_contactResolver;
    self->_contactResolver = v5;

    contactResolver = self->_contactResolver;
  }
  id v7 = contactResolver;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)contactKeysToFetch
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass_0;
  uint64_t v47 = getCNContactFormatterClass_softClass_0;
  if (!getCNContactFormatterClass_softClass_0)
  {
    ContactsLibraryCore_1();
    v45[3] = (uint64_t)objc_getClass("CNContactFormatter");
    getCNContactFormatterClass_softClass_0 = v45[3];
    v2 = (void *)v45[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v44, 8);
  v43 = [v3 descriptorForRequiredKeysForStyle:0];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v4 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_1;
  uint64_t v47 = getCNContactIdentifierKeySymbolLoc_ptr_1;
  if (!getCNContactIdentifierKeySymbolLoc_ptr_1)
  {
    v5 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v5, "CNContactIdentifierKey");
    getCNContactIdentifierKeySymbolLoc_ptr_1 = v45[3];
    v4 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v4) {
    goto LABEL_42;
  }
  id v42 = *v4;
  v48[0] = v42;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  dispatch_queue_t v6 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr;
  uint64_t v47 = getCNContactNamePrefixKeySymbolLoc_ptr;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr)
  {
    id v7 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v7, "CNContactNamePrefixKey");
    getCNContactNamePrefixKeySymbolLoc_ptr = v45[3];
    dispatch_queue_t v6 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v6) {
    goto LABEL_42;
  }
  id v41 = *v6;
  v48[1] = v41;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v8 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_0;
  uint64_t v47 = getCNContactGivenNameKeySymbolLoc_ptr_0;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_0)
  {
    objc_super v9 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v9, "CNContactGivenNameKey");
    getCNContactGivenNameKeySymbolLoc_ptr_0 = v45[3];
    v8 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v8) {
    goto LABEL_42;
  }
  id v40 = *v8;
  v48[2] = v40;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  id v10 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_0;
  uint64_t v47 = getCNContactMiddleNameKeySymbolLoc_ptr_0;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_0)
  {
    uint64_t v11 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v11, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr_0 = v45[3];
    id v10 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v10) {
    goto LABEL_42;
  }
  id v12 = *v10;
  v48[3] = v12;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v13 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_0;
  uint64_t v47 = getCNContactFamilyNameKeySymbolLoc_ptr_0;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_0)
  {
    uint64_t v14 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v14, "CNContactFamilyNameKey");
    getCNContactFamilyNameKeySymbolLoc_ptr_0 = v45[3];
    uint64_t v13 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v13) {
    goto LABEL_42;
  }
  id v15 = *v13;
  v48[4] = v15;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v16 = (id *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  uint64_t v47 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr)
  {
    uint64_t v17 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v17, "CNContactPreviousFamilyNameKey");
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr = v45[3];
    v16 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v16) {
    goto LABEL_42;
  }
  id v18 = *v16;
  v48[5] = v18;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v19 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr;
  uint64_t v47 = getCNContactNameSuffixKeySymbolLoc_ptr;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr)
  {
    v20 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v20, "CNContactNameSuffixKey");
    getCNContactNameSuffixKeySymbolLoc_ptr = v45[3];
    v19 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v19) {
    goto LABEL_42;
  }
  id v21 = *v19;
  v48[6] = v21;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v22 = (id *)getCNContactNicknameKeySymbolLoc_ptr_0;
  uint64_t v47 = getCNContactNicknameKeySymbolLoc_ptr_0;
  if (!getCNContactNicknameKeySymbolLoc_ptr_0)
  {
    v23 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v23, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr_0 = v45[3];
    v22 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v22) {
    goto LABEL_42;
  }
  id v24 = *v22;
  v48[7] = v24;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v25 = (id *)getCNContactTypeKeySymbolLoc_ptr;
  uint64_t v47 = getCNContactTypeKeySymbolLoc_ptr;
  if (!getCNContactTypeKeySymbolLoc_ptr)
  {
    v26 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v26, "CNContactTypeKey");
    getCNContactTypeKeySymbolLoc_ptr = v45[3];
    v25 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v25) {
    goto LABEL_42;
  }
  id v27 = *v25;
  v48[8] = v27;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v28 = (id *)getCNContactRelationsKeySymbolLoc_ptr_0;
  uint64_t v47 = getCNContactRelationsKeySymbolLoc_ptr_0;
  if (!getCNContactRelationsKeySymbolLoc_ptr_0)
  {
    v29 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v29, "CNContactRelationsKey");
    getCNContactRelationsKeySymbolLoc_ptr_0 = v45[3];
    v28 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v28) {
    goto LABEL_42;
  }
  id v30 = *v28;
  v48[9] = v30;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v31 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_0;
  uint64_t v47 = getCNContactPhoneNumbersKeySymbolLoc_ptr_0;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_0)
  {
    v32 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v32, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr_0 = v45[3];
    v31 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v31) {
    goto LABEL_42;
  }
  id v33 = *v31;
  v48[10] = v33;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v34 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  uint64_t v47 = getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_0)
  {
    v35 = (void *)ContactsLibrary_0();
    v45[3] = (uint64_t)dlsym(v35, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr_0 = v45[3];
    v34 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v34)
  {
LABEL_42:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v49 = *v34;
  v50 = v43;
  v36 = (void *)MEMORY[0x1E4F1C978];
  id v37 = v49;
  v38 = [v36 arrayWithObjects:v48 count:13];

  return v38;
}

- (id)nonFamilyRelations
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v2 = (id *)getCNLabelContactRelationManagerSymbolLoc_ptr;
  uint64_t v29 = getCNLabelContactRelationManagerSymbolLoc_ptr;
  if (!getCNLabelContactRelationManagerSymbolLoc_ptr)
  {
    id v3 = (void *)ContactsLibrary_0();
    v27[3] = (uint64_t)dlsym(v3, "CNLabelContactRelationManager");
    getCNLabelContactRelationManagerSymbolLoc_ptr = v27[3];
    v2 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v2) {
    goto LABEL_25;
  }
  id v4 = *v2;
  v30[0] = v4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v5 = (id *)getCNLabelContactRelationAssistantSymbolLoc_ptr;
  uint64_t v29 = getCNLabelContactRelationAssistantSymbolLoc_ptr;
  if (!getCNLabelContactRelationAssistantSymbolLoc_ptr)
  {
    dispatch_queue_t v6 = (void *)ContactsLibrary_0();
    v27[3] = (uint64_t)dlsym(v6, "CNLabelContactRelationAssistant");
    getCNLabelContactRelationAssistantSymbolLoc_ptr = v27[3];
    v5 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v5) {
    goto LABEL_25;
  }
  id v7 = *v5;
  v30[1] = v7;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v8 = (id *)getCNLabelContactRelationColleagueSymbolLoc_ptr;
  uint64_t v29 = getCNLabelContactRelationColleagueSymbolLoc_ptr;
  if (!getCNLabelContactRelationColleagueSymbolLoc_ptr)
  {
    objc_super v9 = (void *)ContactsLibrary_0();
    v27[3] = (uint64_t)dlsym(v9, "CNLabelContactRelationColleague");
    getCNLabelContactRelationColleagueSymbolLoc_ptr = v27[3];
    v8 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v8) {
    goto LABEL_25;
  }
  id v10 = *v8;
  v30[2] = v10;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v11 = (id *)getCNLabelContactRelationTeacherSymbolLoc_ptr;
  uint64_t v29 = getCNLabelContactRelationTeacherSymbolLoc_ptr;
  if (!getCNLabelContactRelationTeacherSymbolLoc_ptr)
  {
    id v12 = (void *)ContactsLibrary_0();
    v27[3] = (uint64_t)dlsym(v12, "CNLabelContactRelationTeacher");
    getCNLabelContactRelationTeacherSymbolLoc_ptr = v27[3];
    uint64_t v11 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v11) {
    goto LABEL_25;
  }
  id v13 = *v11;
  v30[3] = v13;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v14 = (id *)getCNLabelContactRelationFriendSymbolLoc_ptr;
  uint64_t v29 = getCNLabelContactRelationFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFriendSymbolLoc_ptr)
  {
    id v15 = (void *)ContactsLibrary_0();
    v27[3] = (uint64_t)dlsym(v15, "CNLabelContactRelationFriend");
    getCNLabelContactRelationFriendSymbolLoc_ptr = v27[3];
    uint64_t v14 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v14) {
    goto LABEL_25;
  }
  id v16 = *v14;
  v30[4] = v16;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v17 = (id *)getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  uint64_t v29 = getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationMaleFriendSymbolLoc_ptr)
  {
    id v18 = (void *)ContactsLibrary_0();
    v27[3] = (uint64_t)dlsym(v18, "CNLabelContactRelationMaleFriend");
    getCNLabelContactRelationMaleFriendSymbolLoc_ptr = v27[3];
    uint64_t v17 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v17) {
    goto LABEL_25;
  }
  id v19 = *v17;
  v30[5] = v19;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v20 = (id *)getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  uint64_t v29 = getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFemaleFriendSymbolLoc_ptr)
  {
    id v21 = (void *)ContactsLibrary_0();
    v27[3] = (uint64_t)dlsym(v21, "CNLabelContactRelationFemaleFriend");
    getCNLabelContactRelationFemaleFriendSymbolLoc_ptr = v27[3];
    v20 = (id *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v20)
  {
LABEL_25:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v31 = *v20;
  v22 = (void *)MEMORY[0x1E4F1C978];
  id v23 = v31;
  id v24 = [v22 arrayWithObjects:v30 count:7];

  return v24;
}

- (BOOL)regexMatchForRegex:(id)a3 string:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));

  return v7 != 0;
}

- (id)fetchAllContactIdsFromContactStore:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  id v21 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v5 = (void *)getCNContactFetchRequestClass_softClass;
  uint64_t v25 = getCNContactFetchRequestClass_softClass;
  if (!getCNContactFetchRequestClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v27 = __getCNContactFetchRequestClass_block_invoke;
    uint64_t v28 = &unk_1E5ADE858;
    uint64_t v29 = &v22;
    ContactsLibraryCore_1();
    Class Class = objc_getClass("CNContactFetchRequest");
    *(void *)(v29[1] + 24) = Class;
    getCNContactFetchRequestClass_softClass Class = *(void *)(v29[1] + 24);
    id v5 = (void *)v23[3];
  }
  uint64_t v7 = v5;
  _Block_object_dispose(&v22, 8);
  id v8 = [v7 alloc];
  objc_super v9 = [(_PSFamilyRecommender *)self contactKeysToFetch];
  id v10 = (void *)[v8 initWithKeysToFetch:v9];

  [v10 setContactBatchCount:25];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59___PSFamilyRecommender_fetchAllContactIdsFromContactStore___block_invoke;
  v15[3] = &unk_1E5ADF760;
  v15[4] = &v16;
  [v4 enumerateContactsWithFetchRequest:v10 error:0 usingBlock:v15];
  uint64_t v11 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [(id)v17[5] count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A314B000, v11, OS_LOG_TYPE_INFO, "_PSFamilyRecommender: Fetched %tu contact ids from contact store", (uint8_t *)&buf, 0xCu);
  }

  id v13 = [(id)v17[5] allObjects];

  _Block_object_dispose(&v16, 8);

  return v13;
}

- (id)relationshipRegularExpressionForRelationship
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = [(_PSFamilyRecommender *)self personRelationshipVocabularyByLocaleDictionary];
  v2 = [v17 allValues];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v2;
  uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        id v5 = [*(id *)(*((void *)&v27 + 1) + 8 * v4) allValues];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = NSString;
              uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v9), "_pas_componentsJoinedByString:", @"|");
              uint64_t v12 = [v10 stringWithFormat:@"^(%@)$", v11];

              id v22 = 0;
              id v13 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v12 options:1 error:&v22];
              id v14 = v22;
              if (v14)
              {
                id v15 = +[_PSLogging familyRecommenderChannel];
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v32 = v14;
                  _os_log_error_impl(&dword_1A314B000, v15, OS_LOG_TYPE_ERROR, "Error making regex from relationship plist %@", buf, 0xCu);
                }
              }
              if (v13) {
                [v3 addObject:v13];
              }

              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v20);
  }

  return v3;
}

- (id)personRelationshipVocabularyByLocaleDictionary
{
  return +[_PSConfig vocab];
}

- (unint64_t)indexToInsertDate:(id)a3 array:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v5, "count"), 1024, &__block_literal_global_7);

  return v7;
}

- (id)handleAndBundleIdDictionaryForFamilyRecipientContact:(id)a3 lookBackDays:(int64_t)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(_PSFamilyRecommender *)self contactResolver];
  uint64_t v8 = [v7 allEmailAndPhoneNumberHandlesForContact:v6];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [v6 identifier];
  uint64_t v11 = [v9 setWithObject:v10];

  uint64_t v12 = +[_PSConstants mobileMessagesBundleId];
  id v13 = (void *)v12;
  if (a4 == 56)
  {
    v47[0] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  }
  else
  {
    v46[0] = v12;
    id v15 = +[_PSConstants mobileMailBundleId];
    v46[1] = v15;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  }
  uint64_t v16 = [(_PSFamilyRecommender *)self interactionStore];
  uint64_t v17 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:v8 identifiers:v11 account:0 directions:&unk_1EF675F90 mechanisms:&unk_1EF675FA8 bundleIds:v14 store:v16 fetchLimit:1 messageInteractionCache:0];

  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = [v17 firstObject];
  uint64_t v20 = [v19 startDate];
  uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a4)];
  [v20 timeIntervalSinceDate:v21];
  double v23 = v22;

  if (v23 > 0.0)
  {
    v38 = v14;
    v39 = v11;
    id v40 = v6;
    long long v24 = [v17 firstObject];
    long long v25 = [v24 recipients];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v32 = [v31 identifier];
          int v33 = [v8 containsObject:v32];

          if (v33)
          {
            v34 = [v31 identifier];
            [v18 setObject:v34 forKeyedSubscript:@"handle"];

            uint64_t v35 = [v17 firstObject];
            v36 = [v35 bundleId];
            [v18 setObject:v36 forKeyedSubscript:@"bundleId"];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v28);
    }

    uint64_t v11 = v39;
    id v6 = v40;
    id v14 = v38;
  }

  return v18;
}

- (id)currentFamily
{
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v3 = (void *)getFAFetchFamilyCircleRequestClass_softClass;
  uint64_t v25 = getFAFetchFamilyCircleRequestClass_softClass;
  if (!getFAFetchFamilyCircleRequestClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = (uint64_t)__getFAFetchFamilyCircleRequestClass_block_invoke;
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5ADE858;
    uint64_t v20 = (void (*)(uint64_t))&v22;
    __getFAFetchFamilyCircleRequestClass_block_invoke((uint64_t)&v16);
    id v3 = (void *)v23[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v22, 8);
  id v5 = objc_alloc_init(v4);
  uint64_t v16 = 0;
  uint64_t v17 = (uint64_t)&v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37___PSFamilyRecommender_currentFamily__block_invoke;
  v13[3] = &unk_1E5ADF7A8;
  v13[4] = self;
  id v15 = &v16;
  unint64_t v7 = v6;
  id v14 = v7;
  [v5 startRequestWithCompletionHandler:v13];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v9;
  }
  uint64_t v11 = (void *)[*(id *)(v17 + 40) copy];

  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)currentFamilyExcludingMe:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_PSFamilyRecommender *)self currentFamily];
  dispatch_semaphore_t v6 = (void *)[v5 mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_msgSend(v4, "identifier", (void)v17);
        id v14 = [v12 identifier];
        int v15 = [v13 isEqualToString:v14];

        if (v15) {
          [v6 removeObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)familyRecommendations
{
  return [(_PSFamilyRecommender *)self familyRecipientsForShareSheetWithPredictionContext:0];
}

- (id)familyRecipientsForShareSheetWithPredictionContext:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    dispatch_semaphore_t v6 = [v4 seedContactIdentifiers];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v109 = (uint64_t)v6;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "Prediction context, seed contact identifiers %@", buf, 0xCu);
  }
  id v7 = [(_PSFamilyRecommender *)self contactStore];
  uint64_t v8 = [(_PSFamilyRecommender *)self contactKeysToFetch];
  id v105 = 0;
  uint64_t v9 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v8, &v105);
  id v10 = v105;

  if (v10)
  {
    uint64_t v11 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_PSFamilyRecommender familyRecipientsForShareSheetWithPredictionContext:]();
    }
  }
  v80 = v10;
  v91 = v4;
  v90 = [(_PSFamilyRecommender *)self currentFamilyExcludingMe:v9];
  uint64_t v12 = [v90 valueForKey:@"identifier"];
  id v13 = objc_opt_new();
  id v14 = [MEMORY[0x1E4F1CA48] array];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke;
  v101[3] = &unk_1E5ADF7D0;
  id v15 = v9;
  id v102 = v15;
  id v16 = v12;
  id v103 = v16;
  id v17 = v13;
  id v104 = v17;
  long long v18 = (void *)MEMORY[0x1A6243AD0](v101);
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_2;
  v95[3] = &unk_1E5ADF7F8;
  v95[4] = self;
  id v92 = v15;
  id v96 = v92;
  id v89 = v16;
  id v97 = v89;
  id v87 = v18;
  id v100 = v87;
  id v93 = v14;
  id v98 = v93;
  id v88 = v17;
  id v99 = v88;
  long long v19 = (void (**)(void, void, void))MEMORY[0x1A6243AD0](v95);
  long long v20 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_INFO, "Calculating heuristics", buf, 2u);
  }

  id v21 = [(_PSFamilyRecommender *)self contactIdsFromContactRelationsUsingMe:v92];
  uint64_t v22 = (void *)[v21 copy];

  double v23 = [(_PSFamilyRecommender *)self contactIdsFromEmergencyContacts];
  uint64_t v24 = (void *)[v23 copy];

  uint64_t v25 = objc_opt_new();
  v86 = v22;
  id v26 = [v22 allObjects];
  [v25 addObjectsFromArray:v26];

  v85 = v24;
  uint64_t v27 = [v24 allObjects];
  [v25 addObjectsFromArray:v27];

  v84 = v25;
  uint64_t v28 = [v25 allObjects];
  ((void (**)(void, void *, void *))v19)[2](v19, v28, &__block_literal_global_476);

  uint64_t v29 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v109 = (uint64_t)v93;
    _os_log_impl(&dword_1A314B000, v29, OS_LOG_TYPE_INFO, "Suggestions after heuristics %{private}@", buf, 0xCu);
  }

  long long v30 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = [v93 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v109 = v31;
    _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_INFO, "Suggestions after heuristics %tu", buf, 0xCu);
  }

  id v32 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v32, OS_LOG_TYPE_INFO, "Getting results from photos knowledge graph", buf, 2u);
  }

  int v33 = +[_PSLogging familyRecommenderChannel];
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoRelationshipSuggestions", " enableTelemetry=YES ", buf, 2u);
  }

  v83 = +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions];
  v34 = [v83 allObjects];
  ((void (**)(void, void *, void *))v19)[2](v19, v34, &__block_literal_global_480);

  uint64_t v35 = +[_PSLogging familyRecommenderChannel];
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoRelationshipSuggestions", (const char *)&unk_1A3274816, buf, 2u);
  }

  v36 = +[_PSLogging familyRecommenderChannel];
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v36, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoContactSuggestions", " enableTelemetry=YES ", buf, 2u);
  }

  v82 = +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions];
  id v37 = [v82 allObjects];
  ((void (**)(void, void *, void *))v19)[2](v19, v37, &__block_literal_global_483);

  v38 = +[_PSLogging familyRecommenderChannel];
  if (os_signpost_enabled(v38))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoContactSuggestions", (const char *)&unk_1A3274816, buf, 2u);
  }

  v39 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v109 = (uint64_t)v93;
    _os_log_impl(&dword_1A314B000, v39, OS_LOG_TYPE_INFO, "Suggestions after photos knowledge graph %{private}@", buf, 0xCu);
  }

  id v40 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    uint64_t v41 = [v93 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v109 = v41;
    _os_log_impl(&dword_1A314B000, v40, OS_LOG_TYPE_INFO, "Suggestions after photos knowledge graph %tu", buf, 0xCu);
  }

  long long v42 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v42, OS_LOG_TYPE_INFO, "Getting suggestions from on device models", buf, 2u);
  }

  long long v43 = [MEMORY[0x1E4F5B560] knowledgeStore];
  long long v44 = (void *)MEMORY[0x1E4F5B518];
  v45 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  uint64_t v46 = [MEMORY[0x1E4F5B5F8] familyPredictionStream];
  v107 = v46;
  uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  v48 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v106 = v48;
  id v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
  v50 = [v44 eventQueryWithPredicate:v45 eventStreams:v47 offset:0 limit:1 sortDescriptors:v49];

  uint64_t v51 = [NSString stringWithUTF8String:"_PSFamilyRecommender.m"];
  v52 = objc_msgSend(v51, "stringByAppendingFormat:", @":%d", 465);
  [v50 setClientName:v52];

  [v50 setTracker:&__block_literal_global_499];
  [v50 setExecuteConcurrently:1];

  id v94 = 0;
  v81 = v43;
  v53 = [v43 executeQuery:v50 error:&v94];
  id v54 = v94;
  if (v54)
  {
    v55 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      -[_PSFamilyRecommender familyRecipientsForShareSheetWithPredictionContext:]();
    }
  }
  v56 = [v53 firstObject];
  v57 = [v56 metadata];
  v58 = [MEMORY[0x1E4F5B530] suggestions];
  v59 = [v57 objectForKeyedSubscript:v58];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v60 = [v59 keysSortedByValueUsingComparator:&__block_literal_global_505];
    ((void (**)(void, void *, void *))v19)[2](v19, v60, &__block_literal_global_508);
  }
  v61 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v109 = (uint64_t)v93;
    _os_log_impl(&dword_1A314B000, v61, OS_LOG_TYPE_INFO, "Suggestions after on device models %{private}@", buf, 0xCu);
  }

  v62 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    uint64_t v63 = [v93 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v109 = v63;
    _os_log_impl(&dword_1A314B000, v62, OS_LOG_TYPE_INFO, "Suggestions after on device models %tu", buf, 0xCu);
  }

  v64 = [(_PSFamilyRecommender *)self contactIdsFromContactNamesUsingMe:v92];
  v65 = (void *)[v64 copy];

  v66 = [v65 allObjects];
  ((void (**)(void, void *, void *))v19)[2](v19, v66, &__block_literal_global_511);

  v67 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v109 = (uint64_t)v93;
    _os_log_impl(&dword_1A314B000, v67, OS_LOG_TYPE_INFO, "Suggestions after contact name regex match %{private}@", buf, 0xCu);
  }

  v68 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    uint64_t v69 = [v93 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v109 = v69;
    _os_log_impl(&dword_1A314B000, v68, OS_LOG_TYPE_INFO, "Suggestions after contact name regex match %tu", buf, 0xCu);
  }

  v70 = [v91 seedContactIdentifiers];

  if (v70)
  {
    uint64_t v71 = [(_PSFamilyRecommender *)self rerankFamilyRecipients:v93 usingPredictionContext:v91];
  }
  else
  {
    uint64_t v71 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v93];
  }
  v72 = (void *)v71;
  v73 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v109 = (uint64_t)v72;
    _os_log_impl(&dword_1A314B000, v73, OS_LOG_TYPE_INFO, "Suggestions after family reranking %{private}@", buf, 0xCu);
  }

  v74 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v72];
  v75 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v109 = (uint64_t)v74;
    _os_log_impl(&dword_1A314B000, v75, OS_LOG_TYPE_INFO, "Final results %{private}@", buf, 0xCu);
  }

  v76 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
  {
    uint64_t v77 = [v74 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v109 = v77;
    _os_log_impl(&dword_1A314B000, v76, OS_LOG_TYPE_INFO, "Final results %tu", buf, 0xCu);
  }

  v78 = [v74 array];

  return v78;
}

- (id)suggestionsForPhotosRelationshipsWithPredictionContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = [(_PSFamilyRecommender *)self contactStore];
  dispatch_semaphore_t v6 = [(_PSFamilyRecommender *)self contactKeysToFetch];
  id v7 = objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v6, 0);

  uint64_t v8 = [(_PSFamilyRecommender *)self currentFamilyExcludingMe:v7];
  uint64_t v9 = [v8 valueForKey:@"identifier"];
  id v10 = +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [(_PSFamilyRecommender *)self recipientFromFamilyContactId:*(void *)(*((void *)&v19 + 1) + 8 * i) familySuggestions:0 me:v7 currentFamilyIds:v9];
        id v16 = v15;
        if (v15)
        {
          [v15 setPhotosInference:1];
          [v16 setFamilyHeuristic:0];
          [v4 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  id v17 = [(_PSFamilyRecommender *)self suggestionsFromRecipients:v4];

  return v17;
}

- (id)suggestionsForPhotosContactInferencesWithPredictionContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = [(_PSFamilyRecommender *)self contactStore];
  dispatch_semaphore_t v6 = [(_PSFamilyRecommender *)self contactKeysToFetch];
  id v7 = objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v6, 0);

  uint64_t v8 = [(_PSFamilyRecommender *)self currentFamilyExcludingMe:v7];
  uint64_t v9 = [v8 valueForKey:@"identifier"];
  id v10 = +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [(_PSFamilyRecommender *)self recipientFromFamilyContactId:*(void *)(*((void *)&v19 + 1) + 8 * i) familySuggestions:0 me:v7 currentFamilyIds:v9];
        id v16 = v15;
        if (v15)
        {
          [v15 setPhotosInference:1];
          [v16 setFamilyHeuristic:0];
          [v4 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  id v17 = [(_PSFamilyRecommender *)self suggestionsFromRecipients:v4];

  return v17;
}

- (id)rerankFamilyRecipients:(id)a3 usingPredictionContext:(id)a4
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v94 = a3;
  id v6 = a4;
  id v7 = [(_PSFamilyRecommender *)self contactStore];
  uint64_t v110 = self;
  uint64_t v8 = [(_PSFamilyRecommender *)self contactKeysToFetch];
  id v97 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v8, 0);

  uint64_t v109 = objc_opt_new();
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v93 = v6;
  uint64_t v9 = [v6 seedContactIdentifiers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v145 objects:v158 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v146;
    uint64_t v114 = *(void *)v146;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        id v15 = v12;
        if (*(void *)v146 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v145 + 1) + 8 * i);
        id v17 = [(_PSFamilyRecommender *)v110 contactStore];
        long long v18 = [(_PSFamilyRecommender *)v110 contactKeysToFetch];
        id v144 = v12;
        long long v19 = [v17 unifiedContactWithIdentifier:v16 keysToFetch:v18 error:&v144];
        id v12 = v144;

        if (v12)
        {
          long long v20 = +[_PSLogging familyRecommenderChannel];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v157 = v12;
            _os_log_error_impl(&dword_1A314B000, v20, OS_LOG_TYPE_ERROR, "Error querying contacts %@ while resolving seeded contact Ids", buf, 0xCu);
          }
        }
        else
        {
          long long v21 = [_PSRecipient alloc];
          long long v22 = [v19 identifier];
          long long v20 = [(_PSRecipient *)v21 initWithIdentifier:v22 handle:0 contact:v19];

          [v20 setFamilyHeuristic:0];
          [v20 setPhotosInference:0];
          if (v20)
          {
            double v23 = [v97 identifier];
            uint64_t v24 = [v19 identifier];
            char v25 = [v23 isEqualToString:v24];

            if ((v25 & 1) == 0) {
              [v109 addObject:v20];
            }
            id v12 = 0;
            uint64_t v13 = v114;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v145 objects:v158 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  id v26 = v109;
  if (![v109 count])
  {
    v81 = v94;
    id v98 = v94;
    goto LABEL_89;
  }
  uint64_t v27 = [v109 count];
  uint64_t v28 = [v93 seedContactIdentifiers];
  uint64_t v29 = [v28 count];

  if (v27 != v29)
  {
    long long v30 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_DEFAULT, "Dropped a few contact ids from seedContactIdentifiers since a recipient could not be generated", buf, 2u);
    }
  }
  id v105 = v12;
  id v98 = (id)objc_opt_new();
  v115 = objc_opt_new();
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v31 = v94;
  id v106 = (id)[v31 countByEnumeratingWithState:&v140 objects:v155 count:16];
  if (v106)
  {
    uint64_t v99 = *(void *)v141;
    id v102 = v31;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v141 != v99) {
          objc_enumerationMutation(v31);
        }
        uint64_t v111 = v32;
        int v33 = *(void **)(*((void *)&v140 + 1) + 8 * v32);
        long long v136 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v34 = v109;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v136 objects:v154 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v137;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v137 != v37) {
                objc_enumerationMutation(v34);
              }
              v39 = *(void **)(*((void *)&v136 + 1) + 8 * j);
              uint64_t v40 = [v33 contact];
              if (v40)
              {
                uint64_t v41 = (void *)v40;
                long long v42 = [v39 contact];

                if (v42)
                {
                  long long v43 = [v33 contact];
                  long long v44 = [v43 identifier];
                  v45 = [v39 contact];
                  uint64_t v46 = [v45 identifier];
                  int v47 = [v44 isEqualToString:v46];

                  if (v47) {
                    [v115 addObject:v33];
                  }
                }
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v136 objects:v154 count:16];
          }
          while (v36);
        }

        uint64_t v32 = v111 + 1;
        id v31 = v102;
      }
      while ((id)(v111 + 1) != v106);
      id v106 = (id)[v102 countByEnumeratingWithState:&v140 objects:v155 count:16];
    }
    while (v106);
  }

  if ([v115 count])
  {
    [v98 addObjectsFromArray:v115];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id obj = v31;
    id v12 = v105;
    uint64_t v103 = [obj countByEnumeratingWithState:&v132 objects:v153 count:16];
    if (v103)
    {
      uint64_t v100 = *(void *)v133;
      do
      {
        v48 = 0;
        do
        {
          if (*(void *)v133 != v100) {
            objc_enumerationMutation(obj);
          }
          v107 = v48;
          id v49 = *(void **)(*((void *)&v132 + 1) + 8 * (void)v48);
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id v112 = v109;
          uint64_t v50 = [v112 countByEnumeratingWithState:&v128 objects:v152 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v129;
            while (2)
            {
              for (uint64_t k = 0; k != v51; ++k)
              {
                if (*(void *)v129 != v52) {
                  objc_enumerationMutation(v112);
                }
                id v54 = *(void **)(*((void *)&v128 + 1) + 8 * k);
                uint64_t v55 = [v49 contact];
                if (v55)
                {
                  v56 = (void *)v55;
                  v57 = [v49 contact];
                  v58 = [v57 identifier];
                  v59 = [v54 contact];
                  v60 = [v59 identifier];
                  char v61 = [v58 isEqualToString:v60];

                  if (v61)
                  {

                    goto LABEL_57;
                  }
                }
              }
              uint64_t v51 = [v112 countByEnumeratingWithState:&v128 objects:v152 count:16];
              if (v51) {
                continue;
              }
              break;
            }
          }

          [v98 addObject:v49];
LABEL_57:
          id v12 = v105;
          v48 = v107 + 1;
        }
        while (v107 + 1 != (char *)v103);
        uint64_t v103 = [obj countByEnumeratingWithState:&v132 objects:v153 count:16];
      }
      while (v103);
    }

    uint64_t v62 = [v115 count];
    unint64_t v63 = [v115 count];
    if (v63 >= [v109 count]) {
      goto LABEL_88;
    }
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v108 = v109;
    uint64_t v104 = [v108 countByEnumeratingWithState:&v124 objects:v151 count:16];
    if (v104)
    {
      obja = (char *)(v62 + 1);
      uint64_t v101 = *(void *)v125;
      do
      {
        uint64_t v64 = 0;
        do
        {
          if (*(void *)v125 != v101) {
            objc_enumerationMutation(v108);
          }
          uint64_t v113 = v64;
          v65 = *(void **)(*((void *)&v124 + 1) + 8 * v64);
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          id v66 = v115;
          uint64_t v67 = [v66 countByEnumeratingWithState:&v120 objects:v150 count:16];
          if (v67)
          {
            uint64_t v68 = v67;
            uint64_t v69 = *(void *)v121;
            while (2)
            {
              for (uint64_t m = 0; m != v68; ++m)
              {
                if (*(void *)v121 != v69) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v71 = [*(id *)(*((void *)&v120 + 1) + 8 * m) contact];
                v72 = [v71 identifier];
                v73 = [v65 contact];
                v74 = [v73 identifier];
                char v75 = [v72 isEqualToString:v74];

                if (v75)
                {

                  id v12 = v105;
                  goto LABEL_75;
                }
              }
              uint64_t v68 = [v66 countByEnumeratingWithState:&v120 objects:v150 count:16];
              id v12 = v105;
              if (v68) {
                continue;
              }
              break;
            }
          }

          v76 = [(_PSFamilyRecommender *)v110 contactResolver];
          uint64_t v77 = [v65 contact];
          v78 = [v76 allEmailAndPhoneNumberHandlesForContact:v77];
          v79 = [v78 firstObject];
          [v65 setHandle:v79];

          v80 = +[_PSConstants mobileMessagesBundleId];
          [v65 setMostRecentTransportBundleId:v80];

          [v98 insertObject:v65 atIndex:obja++];
LABEL_75:
          uint64_t v64 = v113 + 1;
        }
        while (v113 + 1 != v104);
        uint64_t v104 = [v108 countByEnumeratingWithState:&v124 objects:v151 count:16];
      }
      while (v104);
    }
  }
  else
  {
    [v98 addObjectsFromArray:v31];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v108 = v115;
    uint64_t v82 = [v108 countByEnumeratingWithState:&v116 objects:v149 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v117;
      uint64_t v85 = 2;
      do
      {
        for (uint64_t n = 0; n != v83; ++n)
        {
          if (*(void *)v117 != v84) {
            objc_enumerationMutation(v108);
          }
          id v87 = *(void **)(*((void *)&v116 + 1) + 8 * n);
          id v88 = [(_PSFamilyRecommender *)v110 contactResolver];
          id v89 = [v87 contact];
          v90 = [v88 allEmailAndPhoneNumberHandlesForContact:v89];
          v91 = [v90 firstObject];
          [v87 setHandle:v91];

          [v98 insertObject:v87 atIndex:v85 + n];
        }
        uint64_t v83 = [v108 countByEnumeratingWithState:&v116 objects:v149 count:16];
        v85 += n;
      }
      while (v83);
    }
    id v12 = v105;
  }

LABEL_88:
  v81 = v94;
  id v26 = v109;
LABEL_89:

  return v98;
}

- (id)suggestionsFromRecipients:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v38 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v41;
    uint64_t v36 = *(void *)v41;
    uint64_t v37 = self;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v10 = [v9 mostRecentTransportBundleId];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          char v12 = [v9 photosInference];

          if ((v12 & 1) == 0)
          {
            long long v22 = [_PSSuggestion alloc];
            double v23 = [v9 mostRecentTransportBundleId];
            v45 = v9;
            uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
            LOBYTE(v35) = 1;
            id v14 = [(_PSSuggestion *)v22 initWithBundleID:v23 conversationIdentifier:0 groupName:0 recipients:v24 derivedIntentIdentifier:0 image:0 reason:@"iCloudFamily - Model" reasonType:0 score:0 familySuggestion:v35];

            [v38 addObject:v14];
            goto LABEL_31;
          }
        }
        if (([v9 familyHeuristic] & 1) != 0 || objc_msgSend(v9, "photosInference"))
        {
          uint64_t v13 = [v9 contact];
          id v14 = [(_PSFamilyRecommender *)self handleAndBundleIdDictionaryForFamilyRecipientContact:v13 lookBackDays:168];

          id v15 = [(_PSSuggestion *)v14 objectForKeyedSubscript:@"handle"];
          uint64_t v16 = [(_PSSuggestion *)v14 objectForKeyedSubscript:@"bundleId"];
          id v17 = (void *)v16;
          if (v15) {
            BOOL v18 = v16 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            char v25 = v15;
            goto LABEL_22;
          }
          long long v19 = [(_PSFamilyRecommender *)self contactResolver];
          long long v20 = [v9 contact];
          long long v21 = [v19 allEmailAndPhoneNumberHandlesForContact:v20];
          char v25 = [v21 firstObject];

          if (![(_PSSuggestion *)v25 length])
          {
            id v26 = v25;
            char v25 = v15;
            goto LABEL_29;
          }
          if ([(_PSSuggestion *)v25 containsString:@"@"]) {
            +[_PSConstants mobileMailBundleId];
          }
          else {
          uint64_t v27 = +[_PSConstants mobileMessagesBundleId];
          }
          uint64_t v7 = v36;
          self = v37;

          id v17 = (void *)v27;
LABEL_22:
          if (v25) {
            BOOL v28 = v17 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28)
          {
            [v9 setHandle:v25];
            int v29 = [v9 familyHeuristic];
            long long v30 = @"iCloudFamily - PhotosInference";
            if (v29) {
              long long v30 = @"iCloudFamily - Heuristic";
            }
            id v31 = v30;
            uint64_t v32 = [_PSSuggestion alloc];
            long long v44 = v9;
            int v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
            LOBYTE(v35) = 1;
            id v26 = [(_PSSuggestion *)v32 initWithBundleID:v17 conversationIdentifier:0 groupName:0 recipients:v33 derivedIntentIdentifier:0 image:0 reason:v31 reasonType:0 score:0 familySuggestion:v35];

            [v38 addObject:v26];
LABEL_29:

            uint64_t v7 = v36;
            self = v37;
          }

LABEL_31:
          continue;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v6);
  }

  return v38;
}

- (id)familyRecommendationSuggestionsForShareSheetWithPredictionContext:(id)a3
{
  id v4 = [(_PSFamilyRecommender *)self familyRecipientsForShareSheetWithPredictionContext:a3];
  uint64_t v5 = [(_PSFamilyRecommender *)self suggestionsFromRecipients:v4];

  return v5;
}

- (id)recipientFromFamilyContactId:(id)a3 familySuggestions:(id)a4 me:(id)a5 currentFamilyIds:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_opt_new();
  id v15 = [(_PSFamilyRecommender *)self contactStore];
  uint64_t v16 = [(_PSFamilyRecommender *)self contactKeysToFetch];
  id v61 = 0;
  id v17 = [v15 unifiedContactWithIdentifier:v10 keysToFetch:v16 error:&v61];
  id v18 = v61;

  if (!v17)
  {
    id v60 = v18;
    long long v22 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[_PSFamilyRecommender recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:]();
    }
    long long v21 = 0;
    goto LABEL_35;
  }
  long long v19 = [v17 identifier];
  char v20 = [v13 containsObject:v19];

  if (v20)
  {
    long long v21 = 0;
    goto LABEL_36;
  }
  double v23 = [(_PSFamilyRecommender *)self handleAndBundleIdDictionaryForFamilyRecipientContact:v17 lookBackDays:56];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"handle"];
  v57 = [v23 objectForKeyedSubscript:@"bundleId"];
  v59 = (void *)v24;
  id v60 = v18;
  if (v24)
  {
    if (([v14 containsObject:v24] & 1) == 0)
    {
      char v25 = [_PSRecipient alloc];
      id v26 = [v17 identifier];
      uint64_t v27 = [(_PSRecipient *)v25 initWithIdentifier:v26 handle:v59 contact:v17];

      [(_PSRecipient *)v27 setMostRecentTransportBundleId:v57];
      BOOL v28 = +[_PSLogging familyRecommenderChannel];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v63 = v27;
        _os_log_impl(&dword_1A314B000, v28, OS_LOG_TYPE_INFO, "Recipient from model: %@", buf, 0xCu);
      }

      [v14 addObject:v59];
LABEL_28:
      id v49 = [(_PSRecipient *)v27 handle];
      if ([v49 length])
      {
        id v54 = v12;
        id v56 = v11;
        uint64_t v50 = [v12 identifier];
        uint64_t v51 = [v17 identifier];
        char v52 = [v50 isEqualToString:v51];

        if (v52)
        {
          long long v21 = 0;
          long long v22 = v23;
          uint64_t v37 = v57;
        }
        else
        {
          uint64_t v27 = v27;
          long long v22 = v23;
          uint64_t v37 = v57;
          long long v21 = v27;
        }
        id v12 = v54;
        id v11 = v56;
      }
      else
      {

        long long v21 = 0;
        long long v22 = v23;
        uint64_t v37 = v57;
      }
      goto LABEL_34;
    }
  }
  else
  {
    int v29 = [v11 objectForKeyedSubscript:v10];
    [v29 doubleValue];
    double v31 = v30;

    if (v31 > 1.0)
    {
      long long v22 = [(_PSFamilyRecommender *)self handleAndBundleIdDictionaryForFamilyRecipientContact:v17 lookBackDays:168];

      uint64_t v32 = [v22 objectForKeyedSubscript:@"handle"];
      uint64_t v33 = [v22 objectForKeyedSubscript:@"bundleId"];

      v59 = (void *)v32;
      uint64_t v55 = (void *)v33;
      if (v32)
      {
        if ([v14 containsObject:v32])
        {
          uint64_t v27 = 0;
        }
        else
        {
          long long v41 = [_PSRecipient alloc];
          long long v42 = [v17 identifier];
          uint64_t v43 = [(_PSRecipient *)v41 initWithIdentifier:v42 handle:v32 contact:v17];
          uint64_t v44 = v32;
          uint64_t v27 = (_PSRecipient *)v43;

          [(_PSRecipient *)v27 setMostRecentTransportBundleId:v55];
          [v14 addObject:v44];
        }
      }
      else
      {
        id v38 = [(_PSFamilyRecommender *)self contactResolver];
        v39 = [v38 allEmailAndPhoneNumberHandlesForContact:v17];
        long long v40 = [v39 firstObject];

        if (![v40 length] || (objc_msgSend(v14, "containsObject:", v40) & 1) != 0)
        {

          v59 = 0;
          uint64_t v27 = 0;
          long long v21 = 0;
          uint64_t v37 = v55;
          goto LABEL_34;
        }
        int v58 = [v40 containsString:@"@"];
        v45 = [_PSRecipient alloc];
        uint64_t v46 = [v17 identifier];
        uint64_t v27 = [(_PSRecipient *)v45 initWithIdentifier:v46 handle:0 contact:v17];

        if (v58) {
          +[_PSConstants mobileMailBundleId];
        }
        else {
        uint64_t v47 = +[_PSConstants mobileMessagesBundleId];
        }
        [(_PSRecipient *)v27 setMostRecentTransportBundleId:v47];
      }
      v48 = +[_PSLogging familyRecommenderChannel];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v63 = v27;
        _os_log_impl(&dword_1A314B000, v48, OS_LOG_TYPE_INFO, "Recipient from heuristic: %@", buf, 0xCu);
      }

      double v23 = v22;
      v57 = v55;
      goto LABEL_28;
    }
  }
  id v34 = [_PSRecipient alloc];
  uint64_t v35 = [v17 identifier];
  uint64_t v36 = [(_PSRecipient *)v34 initWithIdentifier:v35 handle:0 contact:v17];

  uint64_t v27 = v36;
  long long v22 = v23;
  uint64_t v37 = v57;
  long long v21 = v27;
LABEL_34:

LABEL_35:
  id v18 = v60;
LABEL_36:

  return v21;
}

- (id)contactIdsFromContactRelationsUsingMe:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v30 = [(_PSFamilyRecommender *)self contactStore];
  BOOL v28 = [MEMORY[0x1E4F1CA80] set];
  int v29 = self;
  uint64_t v5 = [(_PSFamilyRecommender *)self nonFamilyRelations];
  uint64_t v27 = v4;
  uint64_t v6 = [v4 contactRelations];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v13 = [v12 label];
        char v14 = [v5 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          id CNContactClass_1 = getCNContactClass_1();
          uint64_t v16 = [v12 value];
          id v17 = [v16 name];
          id v18 = [CNContactClass_1 predicateForContactsMatchingName:v17];

          long long v19 = [(_PSFamilyRecommender *)v29 contactKeysToFetch];
          id v31 = v9;
          char v20 = [v30 unifiedContactsMatchingPredicate:v18 keysToFetch:v19 error:&v31];
          id v21 = v31;

          if (v21)
          {
            long long v22 = +[_PSLogging familyRecommenderChannel];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v37 = v21;
              _os_log_error_impl(&dword_1A314B000, v22, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
            }
          }
          if ([v20 count])
          {
            double v23 = [v20 firstObject];
            uint64_t v24 = [v23 identifier];
            [v28 addObject:v24];
          }
          uint64_t v9 = v21;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  char v25 = (void *)[v28 copy];

  return v25;
}

- (id)contactIdsFromContactNamesUsingMe:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57 = [(_PSFamilyRecommender *)self contactStore];
  uint64_t v5 = -[_PSFamilyRecommender fetchAllContactIdsFromContactStore:](self, "fetchAllContactIdsFromContactStore:");
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  id v66 = [(_PSFamilyRecommender *)self nonFamilyRelations];
  id v54 = [(_PSFamilyRecommender *)self relationshipRegularExpressionForRelationship];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v5;
  uint64_t v55 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
  uint64_t v7 = 0;
  if (v55)
  {
    uint64_t v53 = *(void *)v82;
    uint64_t v67 = self;
    do
    {
      uint64_t v8 = 0;
      do
      {
        uint64_t v62 = v7;
        if (*(void *)v82 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v8;
        uint64_t v9 = *(void **)(*((void *)&v81 + 1) + 8 * v8);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v64 = v54;
        uint64_t v10 = [v64 countByEnumeratingWithState:&v77 objects:v89 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v78 != v12) {
                objc_enumerationMutation(v64);
              }
              uint64_t v14 = *(void *)(*((void *)&v77 + 1) + 8 * i);
              id v15 = [v9 givenName];
              if (![(_PSFamilyRecommender *)self regexMatchForRegex:v14 string:v15])
              {
                uint64_t v16 = [v9 familyName];
                if (![(_PSFamilyRecommender *)self regexMatchForRegex:v14 string:v16])
                {
                  long long v22 = [v9 nickname];
                  BOOL v23 = [(_PSFamilyRecommender *)v67 regexMatchForRegex:v14 string:v22];

                  self = v67;
                  if (!v23) {
                    continue;
                  }
                  goto LABEL_15;
                }
              }
LABEL_15:
              uint64_t v17 = [v9 identifier];
              if (v17)
              {
                id v18 = (void *)v17;
                long long v19 = [v9 identifier];
                char v20 = [v6 containsObject:v19];

                if ((v20 & 1) == 0)
                {
                  id v21 = [v9 identifier];
                  [v6 addObject:v21];
                }
              }
            }
            uint64_t v11 = [v64 countByEnumeratingWithState:&v77 objects:v89 count:16];
          }
          while (v11);
        }

        uint64_t v24 = [v9 contactRelations];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v60 = v24;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v73 objects:v88 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v74;
          uint64_t v7 = v62;
          uint64_t v58 = *(void *)v74;
          do
          {
            id v28 = 0;
            uint64_t v59 = v26;
            do
            {
              if (*(void *)v74 != v27) {
                objc_enumerationMutation(v60);
              }
              int v29 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v28);
              double v30 = [v29 label];
              char v31 = [v66 containsObject:v30];

              if ((v31 & 1) == 0)
              {
                id v65 = v28;
                id CNContactClass_1 = getCNContactClass_1();
                long long v33 = [v29 value];
                long long v34 = [v33 name];
                uint64_t v35 = [CNContactClass_1 predicateForContactsMatchingName:v34];

                uint64_t v36 = [(_PSFamilyRecommender *)v67 contactKeysToFetch];
                id v72 = v7;
                unint64_t v63 = (void *)v35;
                id v37 = [v57 unifiedContactsMatchingPredicate:v35 keysToFetch:v36 error:&v72];
                id v38 = v72;

                if (v38)
                {
                  uint64_t v39 = +[_PSLogging familyRecommenderChannel];
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    id v87 = v38;
                    _os_log_error_impl(&dword_1A314B000, v39, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
                  }
                }
                id v61 = v38;
                long long v70 = 0u;
                long long v71 = 0u;
                long long v68 = 0u;
                long long v69 = 0u;
                id v40 = v37;
                uint64_t v41 = [v40 countByEnumeratingWithState:&v68 objects:v85 count:16];
                if (v41)
                {
                  uint64_t v42 = v41;
                  uint64_t v43 = *(void *)v69;
                  do
                  {
                    for (uint64_t j = 0; j != v42; ++j)
                    {
                      if (*(void *)v69 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      v45 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                      uint64_t v46 = [v4 identifier];
                      uint64_t v47 = [v45 identifier];
                      int v48 = [v46 isEqualToString:v47];

                      if (v48)
                      {
                        id v49 = [v9 identifier];
                        [v6 addObject:v49];
                      }
                    }
                    uint64_t v42 = [v40 countByEnumeratingWithState:&v68 objects:v85 count:16];
                  }
                  while (v42);
                }

                uint64_t v7 = v61;
                uint64_t v27 = v58;
                uint64_t v26 = v59;
                id v28 = v65;
              }
              id v28 = (char *)v28 + 1;
            }
            while (v28 != (id)v26);
            uint64_t v26 = [v60 countByEnumeratingWithState:&v73 objects:v88 count:16];
          }
          while (v26);
        }
        else
        {
          uint64_t v7 = v62;
        }

        uint64_t v8 = v56 + 1;
        self = v67;
      }
      while (v56 + 1 != v55);
      uint64_t v55 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
    }
    while (v55);
  }

  uint64_t v50 = (void *)[v6 copy];

  return v50;
}

- (id)contactIdsFromEmergencyContacts
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = [(_PSFamilyRecommender *)self medicalIDStore];
  id v38 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v39 = [(_PSFamilyRecommender *)self nonFamilyRelations];
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  char v52 = __Block_byref_object_copy__3;
  uint64_t v53 = __Block_byref_object_dispose__3;
  id v54 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  void v46[2] = __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke;
  v46[3] = &unk_1E5ADF860;
  int v48 = &v49;
  dispatch_semaphore_t dsema = v2;
  dispatch_semaphore_t v47 = dsema;
  [v35 fetchMedicalIDEmergencyContactsWithCompletion:v46];
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(dsema, v3))
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];

    id v38 = (void *)v4;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)v50[5];
  id v5 = 0;
  uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v10 = [v9 relationship];
        char v11 = [v39 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [v9 nameContactIdentifier];
          if (v12
            && ([v9 nameContactIdentifier],
                id v13 = objc_claimAutoreleasedReturnValue(),
                char v14 = [v38 containsObject:v13],
                v13,
                v12,
                (v14 & 1) == 0))
          {
            uint64_t v16 = [(_PSFamilyRecommender *)self contactStore];
            uint64_t v17 = [v9 nameContactIdentifier];
            id v18 = [(_PSFamilyRecommender *)self contactKeysToFetch];
            id v41 = v5;
            long long v19 = [v16 unifiedContactWithIdentifier:v17 keysToFetch:v18 error:&v41];
            id v15 = v41;

            if (v15)
            {
              char v20 = +[_PSLogging familyRecommenderChannel];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                id v56 = v15;
                _os_log_error_impl(&dword_1A314B000, v20, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
              }
            }
            if (v19)
            {
              id v21 = [v9 nameContactIdentifier];
              [v38 addObject:v21];

              long long v22 = [v19 identifier];
              [v38 addObject:v22];
            }
          }
          else
          {
            id v15 = v5;
          }
          BOOL v23 = [v9 phoneNumberContactIdentifier];
          if (v23
            && ([v9 phoneNumberContactIdentifier],
                uint64_t v24 = objc_claimAutoreleasedReturnValue(),
                char v25 = [v38 containsObject:v24],
                v24,
                v23,
                (v25 & 1) == 0))
          {
            uint64_t v26 = [(_PSFamilyRecommender *)self contactStore];
            uint64_t v27 = [v9 phoneNumberContactIdentifier];
            id v28 = [(_PSFamilyRecommender *)self contactKeysToFetch];
            id v40 = v15;
            int v29 = [v26 unifiedContactWithIdentifier:v27 keysToFetch:v28 error:&v40];
            id v5 = v40;

            if (v5)
            {
              double v30 = +[_PSLogging familyRecommenderChannel];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                id v56 = v5;
                _os_log_error_impl(&dword_1A314B000, v30, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
              }
            }
            if (v29)
            {
              char v31 = [v9 phoneNumberContactIdentifier];
              [v38 addObject:v31];
            }
          }
          else
          {
            id v5 = v15;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v57 count:16];
    }
    while (v6);
  }

  long long v32 = (void *)[v38 copy];
  _Block_object_dispose(&v49, 8);

  return v32;
}

- (void)logFeedbackForFamilyRecommenderCallHasRecommendations:(BOOL)a3
{
  dispatch_time_t v3 = [NSNumber numberWithBool:a3];
  uint64_t v4 = +[_PSFeedbackUtils feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:](_PSFeedbackUtils, "feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:", @"default", &unk_1EF674FD0, &unk_1EF674FD0, &unk_1EF674FE8, 3, @"default");

  if ([v4 count])
  {
    id v5 = v4;
    AnalyticsSendEventLazy();
  }
}

- (void)setInteractionStore:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (void)setMedicalIDStore:(id)a3
{
}

- (void)setContactResolver:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_interactionStore, 0);
}

- (void)familyRecipientsForShareSheetWithPredictionContext:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error querying knowledge store for predictions: %@", v2, v3, v4, v5, v6);
}

- (void)familyRecipientsForShareSheetWithPredictionContext:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error querying for me contact card: %@", v2, v3, v4, v5, v6);
}

- (void)recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error querying contacts %@", v2, v3, v4, v5, v6);
}

@end