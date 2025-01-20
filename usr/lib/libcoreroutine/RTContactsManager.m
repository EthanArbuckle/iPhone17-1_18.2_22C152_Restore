@interface RTContactsManager
+ (id)addressDictionaryFromMapItem:(id)a3;
+ (id)addressLabelTypeToLabel:(unint64_t)a3;
+ (id)addressLabelTypeToString:(unint64_t)a3;
+ (id)formattedPostalAddressesForContact:(id)a3;
+ (unint64_t)labelStringToAddressLabelType:(id)a3;
- (BOOL)available;
- (BOOL)labelTypeValidForDonation:(unint64_t)a3;
- (BOOL)removeAddressOfContact:(id)a3 withAddressIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeAddressOfMeCardWithAddressIdentifier:(id)a3 error:(id *)a4;
- (BOOL)updateAddressLabelTypeOfContact:(id)a3 withAddressIdentifier:(id)a4 toAddressLabelType:(unint64_t)a5 error:(id *)a6;
- (BOOL)updateAddressLabelTypeOfMeCardWithAddressIdentifier:(id)a3 toAddressLabelType:(unint64_t)a4 error:(id *)a5;
- (BOOL)updateAddressOfContact:(id)a3 withAddressIdentifier:(id)a4 toAddressFromMapItem:(id)a5 error:(id *)a6;
- (BOOL)updateAddressOfMeCardWithAddressIdentifier:(id)a3 toAddressFromMapItem:(id)a4 error:(id *)a5;
- (CNContact)meCard;
- (RTContactsManager)init;
- (RTContactsManager)initWithDataProtectionManager:(id)a3 mapServiceManager:(id)a4 distanceCalculator:(id)a5;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTMapServiceManager)mapServiceManager;
- (id)_contactColumnKeysToFetch;
- (id)_favoriteEntries;
- (id)_getEmailAddressStringsUsingCNContactEmailAddresses:(id)a3;
- (id)_getMeCardWithError:(id *)a3;
- (id)_getPhoneNumberStringsUsingCNContactPhoneNumbers:(id)a3;
- (id)_getPostalAddressesUsingCNContactPostalAddresses:(id)a3;
- (id)_getRTContactFromCNContact:(id)a3;
- (id)_queryContactsForGivenName:(id)a3 error:(id *)a4;
- (id)addAddressToContact:(id)a3 addressLabelType:(unint64_t)a4 addressFromMapItem:(id)a5 error:(id *)a6;
- (id)addAddressToMeCardWithAddressLabelType:(unint64_t)a3 addressFromMapItem:(id)a4 error:(id *)a5;
- (id)addressIdentifierOfContact:(id)a3 withAddressFromMapItem:(id)a4 error:(id *)a5;
- (id)addressIdentifierOfMeCardWithAddressFromMapItem:(id)a3 error:(id *)a4;
- (void)__donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 donationStore:(id)a5 handler:(id)a6;
- (void)_donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 handler:(id)a5;
- (void)_fetchContactsFromEmailOrPhoneNumberString:(id)a3 handler:(id)a4;
- (void)_fetchContactsUsingContactIdentifiers:(id)a3 handler:(id)a4;
- (void)_fetchFavoriteContactsWithHandler:(id)a3;
- (void)_fetchFavoriteHandlesWithHandler:(id)a3;
- (void)_fetchMeCardWithHandler:(id)a3;
- (void)_fetchRelationshipContactsFromMeCardWithHandler:(id)a3;
- (void)_onContactStoreNotification:(id)a3;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 handler:(id)a5;
- (void)fetchContactsFromEmailOrPhoneNumberString:(id)a3 handler:(id)a4;
- (void)fetchContactsUsingContactIdentifiers:(id)a3 handler:(id)a4;
- (void)fetchFavoriteContactsWithHandler:(id)a3;
- (void)fetchFavoriteHandlesWithHandler:(id)a3;
- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3;
- (void)fetchMeCardWithHandler:(id)a3;
- (void)fetchRelationshipContactsFromMeCardWithHandler:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onContactStoreNotification:(id)a3;
- (void)onDataProtectionNotification:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setDataProtectionManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMeCard:(id)a3;
@end

@implementation RTContactsManager

+ (unint64_t)labelStringToAddressLabelType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1B700]])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B6F8]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B770]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B760]])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (RTContactsManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDataProtectionManager_mapServiceManager_distanceCalculator_);
}

- (RTContactsManager)initWithDataProtectionManager:(id)a3 mapServiceManager:(id)a4 distanceCalculator:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_12:
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTContactsManager initWithDataProtectionManager:mapServiceManager:distanceCalculator:]";
      __int16 v22 = 1024;
      int v23 = 143;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
    }

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTContactsManager initWithDataProtectionManager:mapServiceManager:distanceCalculator:]";
    __int16 v22 = 1024;
    int v23 = 142;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager (in %s:%d)", buf, 0x12u);
  }

  if (!v10) {
    goto LABEL_12;
  }
LABEL_3:
  if (v11)
  {
LABEL_4:
    v12 = 0;
    if (v9 && v10)
    {
      v19.receiver = self;
      v19.super_class = (Class)RTContactsManager;
      v13 = [(RTNotifier *)&v19 init];
      p_isa = (id *)&v13->super.super.super.isa;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_dataProtectionManager, a3);
        objc_storeStrong(p_isa + 6, a4);
        objc_storeStrong(p_isa + 7, a5);
        [p_isa setup];
      }
      self = p_isa;
      v12 = self;
    }
    goto LABEL_18;
  }
LABEL_15:
  v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTContactsManager initWithDataProtectionManager:mapServiceManager:distanceCalculator:]";
    __int16 v22 = 1024;
    int v23 = 144;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
  }

  v12 = 0;
LABEL_18:

  return v12;
}

- (void)_setup
{
  id v3 = [(RTContactsManager *)self dataProtectionManager];
  unint64_t v4 = +[RTNotification notificationName];
  [v3 addObserver:self selector:sel_onDataProtectionNotification_ name:v4];

  [(RTContactsManager *)self setAvailable:0];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(RTContactsManager *)self dataProtectionManager];
  [v4 removeObserver:self];

  [(RTContactsManager *)self setAvailable:0];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    v6 = v7;
  }
}

- (id)_contactColumnKeysToFetch
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1AEA0];
  v7[0] = *MEMORY[0x1E4F1ADF0];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AF10];
  v7[2] = *MEMORY[0x1E4F1ADE0];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v7[4] = *MEMORY[0x1E4F1AEE0];
  v7[5] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];

  return v5;
}

- (id)_getMeCardWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = [(RTContactsManager *)self _contactColumnKeysToFetch];
    id v12 = 0;
    id v7 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:&v12];
    id v8 = v12;

    if (a3)
    {
      id v8 = v8;
      *a3 = v8;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = @"Unable to create a contact store to get the 'Me' card.";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v8];
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = *a3;
      *(_DWORD *)buf = 138412290;
      id v14 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    id v7 = 0;
    goto LABEL_8;
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (void)setMeCard:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = (CNContact *)a3;
  p_meCard = &self->_meCard;
  if (*p_meCard != v5 && ([(CNContact *)*p_meCard isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)p_meCard, a3);
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(CNContact *)*p_meCard _rt_toString];
      id v9 = [(CNContact *)*p_meCard postalAddresses];
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = [v9 count];
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "set meCard, %@, postal addresses, %lu", (uint8_t *)&v11, 0x16u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v10 = [(CNContact *)*p_meCard postalAddresses];
      [v10 enumerateObjectsUsingBlock:&__block_literal_global_83];
    }
  }
}

void __31__RTContactsManager_setMeCard___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a3 + 1;
    id v7 = (void *)MEMORY[0x1E4F1BA20];
    id v8 = [v4 label];
    id v9 = [v7 localizedStringForLabel:v8];
    id v10 = [v4 value];
    int v11 = [v10 _rt_toString];
    int v12 = 134218498;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%lu, label, %@, address, %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(RTNotifier *)self getNumberOfObservers:v8] == 1)
  {
    id v9 = +[RTNotification notificationName];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v12 = v11;
      uint64_t v13 = (void *)MEMORY[0x1E4F1AF80];
LABEL_6:
      [v11 addObserver:self selector:sel_onContactStoreNotification_ name:*v13 object:0];

      goto LABEL_10;
    }
    __int16 v14 = +[RTNotification notificationName];
    int v15 = [v8 isEqualToString:v14];

    if (v15)
    {
      int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      int v12 = v11;
      uint64_t v13 = (void *)MEMORY[0x1E4F1AF88];
      goto LABEL_6;
    }
    __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = NSStringFromSelector(a2);
      uint64_t v18 = (objc_class *)objc_opt_class();
      objc_super v19 = NSStringFromClass(v18);
      int v20 = 138412802;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v20, 0x20u);
    }
  }
LABEL_10:
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![(RTNotifier *)self getNumberOfObservers:v8])
  {
    id v9 = +[RTNotification notificationName];
    int v10 = [v8 isEqualToString:v9];

    if (v10
      || (+[RTNotification notificationName](RTContactsManagerContactStoreMeContactDidChangeNotification, "notificationName"), int v11 = objc_claimAutoreleasedReturnValue(), v12 = [v8 isEqualToString:v11], v11, v12))
    {
      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 removeObserver:self name:*MEMORY[0x1E4F1AF80] object:0];
    }
    else
    {
      __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = NSStringFromSelector(a2);
        __int16 v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        int v18 = 138412802;
        objc_super v19 = v15;
        __int16 v20 = 2112;
        id v21 = v8;
        __int16 v22 = 2112;
        id v23 = v17;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v18, 0x20u);
      }
    }
  }
}

- (void)onContactStoreNotification:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RTContactsManager_onContactStoreNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__RTContactsManager_onContactStoreNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onContactStoreNotification:*(void *)(a1 + 40)];
}

- (void)_onContactStoreNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = [v5 name];
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    __int16 v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, recieved notification, %@", buf, 0x16u);
  }
  id v9 = [v5 name];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F1AF80]];

  if (v10)
  {
    int v11 = objc_opt_new();
    [(RTNotifier *)self postNotification:v11];

    id v30 = 0;
    int v12 = [(RTContactsManager *)self _getMeCardWithError:&v30];
    uint64_t v13 = v30;
    if (v13) {
      goto LABEL_5;
    }
    uint64_t v25 = [(RTContactsManager *)self meCard];
    if ((void *)v25 == v12)
    {
    }
    else
    {
      uint64_t v26 = (void *)v25;
      v27 = [(RTContactsManager *)self meCard];
      int v28 = [v27 isEqual:v12];

      if (!v28) {
        goto LABEL_17;
      }
    }
LABEL_5:
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v12 _rt_toString];
      *(_DWORD *)buf = 138412546;
      v32 = v15;
      __int16 v33 = 2112;
      v34 = v13;
LABEL_22:
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "no change to meCard, %@, error, %@", buf, 0x16u);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  __int16 v16 = [v5 name];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F1AF88]];

  if (v17)
  {
    id v29 = 0;
    int v12 = [(RTContactsManager *)self _getMeCardWithError:&v29];
    int v18 = v29;
    uint64_t v13 = v18;
    if (!v18 || [v18 code] == 200)
    {
      uint64_t v19 = [(RTContactsManager *)self meCard];
      if ((void *)v19 == v12)
      {
      }
      else
      {
        __int16 v20 = (void *)v19;
        id v21 = [(RTContactsManager *)self meCard];
        int v22 = [v21 isEqual:v12];

        if (!v22)
        {
LABEL_17:
          [(RTContactsManager *)self setMeCard:v12];
          __int16 v14 = objc_opt_new();
          [(RTNotifier *)self postNotification:v14];
          goto LABEL_23;
        }
      }
    }
    __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v12 _rt_toString];
      *(_DWORD *)buf = 138412546;
      v32 = v15;
      __int16 v33 = 2112;
      v34 = v13;
      goto LABEL_22;
    }
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v23 = NSStringFromSelector(a2);
    uint64_t v24 = [v5 name];
    *(_DWORD *)buf = 138412546;
    v32 = v23;
    __int16 v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@", buf, 0x16u);
  }
LABEL_24:
}

- (void)_fetchMeCardWithHandler:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void))a3;
  if (v5)
  {
    if ([(RTContactsManager *)self available])
    {
      id v17 = 0;
      id v6 = [(RTContactsManager *)self _getMeCardWithError:&v17];
      id v7 = v17;
      id v8 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = NSStringFromSelector(a2);
        int v10 = [v6 _rt_toString];
        *(_DWORD *)buf = 138412802;
        uint64_t v19 = v9;
        __int16 v20 = 2112;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, meCard, %@, error, %@", buf, 0x20u);
      }
      [(RTContactsManager *)self setMeCard:v6];

      int v11 = [(RTContactsManager *)self meCard];

      if (v11)
      {
        int v12 = [(RTContactsManager *)self meCard];
        uint64_t v13 = [(RTContactsManager *)self _getRTContactFromCNContact:v12];
      }
      else
      {
        uint64_t v13 = 0;
      }
      v5[2](v5, v13, 0);
    }
    else
    {
      __int16 v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = @"resource temporarily unavailable.";
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      __int16 v16 = [v14 errorWithDomain:v15 code:5 userInfo:v13];
      ((void (**)(id, void *, void *))v5)[2](v5, 0, v16);
    }
  }
}

- (void)onDataProtectionNotification:(id)a3
{
  id v5 = a3;
  id v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTContactsManager_onDataProtectionNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  int v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __50__RTContactsManager_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4 && [*(id *)(a1 + 32) unlockedSinceBoot])
  {
    [*(id *)(a1 + 40) setAvailable:1];
    id v5 = *(void **)(a1 + 40);
    id v11 = 0;
    id v6 = [v5 _getMeCardWithError:&v11];
    id v7 = v11;
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v10 = [v6 _rt_toString];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, RTDataProtectionManagerNotificationUnlockedSinceBoot, meCard, %@, error, %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setMeCard:v6];
  }
}

- (BOOL)labelTypeValidForDonation:(unint64_t)a3
{
  return a3 - 1 < 3;
}

- (void)fetchMeCardWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RTContactsManager_fetchMeCardWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__RTContactsManager_fetchMeCardWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMeCardWithHandler:*(void *)(a1 + 40)];
}

- (void)__donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 donationStore:(id)a5 handler:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, void, void *))a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[RTContactsManager __donateAddressFromMapItem:addressLabelType:donationStore:handler:]";
      __int16 v45 = 1024;
      int v46 = 447;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v10) {
        goto LABEL_4;
      }
LABEL_13:
      if (!v12) {
        goto LABEL_21;
      }
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F5CFE8];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @"requires a map item.";
      int v28 = (void *)MEMORY[0x1E4F1C9E8];
      id v29 = &v42;
      id v30 = &v41;
LABEL_19:
      uint64_t v13 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:1];
      id v21 = [v26 errorWithDomain:v27 code:7 userInfo:v13];
      v12[2](v12, 0, v21);
      goto LABEL_20;
    }
  }
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[RTContactsManager __donateAddressFromMapItem:addressLabelType:donationStore:handler:]";
    __int16 v45 = 1024;
    int v46 = 448;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: donationStore (in %s:%d)", buf, 0x12u);
  }

  if (!v10) {
    goto LABEL_13;
  }
LABEL_4:
  if (![(RTContactsManager *)self labelTypeValidForDonation:a4])
  {
    if (!v12) {
      goto LABEL_21;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F5CFE8];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40 = @"donation is only supported for label type home, work, or school.";
    int v28 = (void *)MEMORY[0x1E4F1C9E8];
    id v29 = &v40;
    id v30 = &v39;
    goto LABEL_19;
  }
  if (v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = objc_alloc(MEMORY[0x1E4F5A188]);
    uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultsDomain];
    __int16 v16 = [(id)objc_opt_class() labelTypeToString:a4];
    id v17 = [v13 dateByAddingTimeInterval:259200.0];
    v31 = (void *)[v14 initWithBundleIdentifier:v15 donationIdentifier:v16 donationDate:v13 expirationDate:v17];

    id v18 = objc_alloc(MEMORY[0x1E4F5CE48]);
    uint64_t v19 = (objc_class *)objc_opt_class();
    __int16 v20 = NSStringFromClass(v19);
    id v21 = (void *)[v18 initWithUseBackgroundTraits:1 analyticsIdentifier:v20];

    __int16 v22 = [(RTContactsManager *)self mapServiceManager];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke;
    v32[3] = &unk_1E6B99D60;
    uint64_t v35 = v12;
    unint64_t v36 = a4;
    id v33 = v31;
    id v34 = v11;
    id v23 = v31;
    [v22 fetchPostalAddressForMapItem:v10 options:v21 handler:v32];

LABEL_20:
    goto LABEL_21;
  }
  if (v12)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F5CFE8];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38 = @"donation requires a valid donation store.";
    int v28 = (void *)MEMORY[0x1E4F1C9E8];
    id v29 = &v38;
    id v30 = &v37;
    goto LABEL_19;
  }
LABEL_21:
}

void __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1BA80] _rt_labelStringWithAddressLabelType:*(void *)(a1 + 56)];
    id v9 = [MEMORY[0x1E4F5A198] donationValueWithPostalAddress:v5 style:1 label:v8 origin:*(void *)(a1 + 32)];
    id v10 = *(void **)(a1 + 40);
    v15[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke_2;
    v12[3] = &unk_1E6B91100;
    id v14 = *(id *)(a1 + 48);
    id v13 = v5;
    [v10 donateMeCardValues:v11 completionHandler:v12];
  }
}

void __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "error from contacts donating place, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, *(void *)(a1 + 32), v3);
  }
}

- (void)_donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 handler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[RTContactsManager _donateAddressFromMapItem:addressLabelType:handler:]";
      __int16 v14 = 1024;
      int v15 = 520;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }
  }
  id v11 = objc_opt_new();
  [(RTContactsManager *)self __donateAddressFromMapItem:v8 addressLabelType:a4 donationStore:v11 handler:v9];
}

- (void)donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(RTNotifier *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__RTContactsManager_donateAddressFromMapItem_addressLabelType_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __71__RTContactsManager_donateAddressFromMapItem_addressLabelType_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _donateAddressFromMapItem:*(void *)(a1 + 40) addressLabelType:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

+ (id)addressLabelTypeToLabel:(unint64_t)a3
{
  if (a3 > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_1E6B99E48 + a3);
  }
  return v4;
}

+ (id)addressLabelTypeToString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6B99E68[a3];
  }
}

+ (id)addressDictionaryFromMapItem:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  int v6 = [v4 address];
  id v7 = [v6 mergedThoroughfare];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1B7C8]];

  id v8 = [v4 address];
  id v9 = [v8 subLocality];
  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1B7D8]];

  id v10 = [v4 address];
  id v11 = [v10 locality];
  [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1B798]];

  id v12 = [v4 address];
  id v13 = [v12 subAdministrativeArea];
  [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1B7D0]];

  id v14 = [v4 address];
  id v15 = [v14 administrativeArea];
  [v5 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1B7C0]];

  unint64_t v16 = [v4 address];
  id v17 = [v16 postalCode];
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1B7B0]];

  id v18 = [v4 address];
  uint64_t v19 = [v18 country];
  [v5 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F1B7A0]];

  __int16 v20 = [v4 address];

  id v21 = [v20 countryCode];
  [v5 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F1B7A8]];

  return v5;
}

- (BOOL)removeAddressOfContact:(id)a3 withAddressIdentifier:(id)a4 error:(id *)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8)
    {
      id v10 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v34 = 0;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x2020000000;
      char v37 = 0;
      id v11 = [v7 postalAddresses];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __72__RTContactsManager_removeAddressOfContact_withAddressIdentifier_error___block_invoke;
      v30[3] = &unk_1E6B99D88;
      id v28 = v9;
      id v31 = v28;
      id v33 = &v34;
      id v12 = v10;
      id v32 = v12;
      [v11 enumerateObjectsUsingBlock:v30];

      if (*((unsigned char *)v35 + 24))
      {
        id v13 = (void *)[v7 mutableCopy];
        [v13 setPostalAddresses:v12];
        id v14 = objc_opt_new();
        [v14 updateContact:v13];
        id v15 = objc_opt_new();
        id v29 = 0;
        int v16 = [v15 executeSaveRequest:v14 error:&v29];
        id v17 = v29;
        id v18 = v17;
        if (a5) {
          *a5 = v17;
        }
        uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          [v13 _rt_toString];
          __int16 v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v21 = @"NO";
          *(_DWORD *)buf = 138413058;
          uint64_t v39 = v20;
          if (v16) {
            id v21 = @"YES";
          }
          __int16 v40 = 2112;
          id v41 = v28;
          __int16 v42 = 2112;
          v43 = v21;
          __int16 v44 = 2112;
          __int16 v45 = v18;
          _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "removed addess of contact, %@, with address identifier, %@, success, %@, error, %@", buf, 0x2Au);
        }
      }
      else
      {
        LOBYTE(v16) = 1;
      }

      _Block_object_dispose(&v34, 8);
      goto LABEL_23;
    }
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = @"cannot remove address of contact. address identifier required";
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      uint64_t v47 = @"cannot remove address of contact. address identifier required";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      id v24 = [v26 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v12];
      goto LABEL_19;
    }
  }
  else
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = @"cannot remove address of contact. contact required";
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49[0] = @"cannot remove address of contact. contact required";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
      id v24 = [v23 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v12];
LABEL_19:
      LOBYTE(v16) = 0;
      *a5 = v24;
LABEL_23:

      goto LABEL_24;
    }
  }
  LOBYTE(v16) = 0;
LABEL_24:

  return v16;
}

void __72__RTContactsManager_removeAddressOfContact_withAddressIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 identifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (BOOL)removeAddressOfMeCardWithAddressIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(RTContactsManager *)self meCard];

  if (v7)
  {
    id v8 = [(RTContactsManager *)self meCard];
    LOBYTE(a4) = [(RTContactsManager *)self removeAddressOfContact:v8 withAddressIdentifier:v6 error:a4];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v16 = @"cannot remove address. meCard required";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a4)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      id v14 = @"cannot remove address. meCard required";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a4 = [v10 errorWithDomain:@"RTContactsManagerErrorDomain" code:1 userInfo:v11];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (id)addressIdentifierOfMeCardWithAddressFromMapItem:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(RTContactsManager *)self meCard];

  if (v7)
  {
    id v8 = [(RTContactsManager *)self meCard];
    id v9 = [(RTContactsManager *)self addressIdentifierOfContact:v8 withAddressFromMapItem:v6 error:a4];
  }
  else
  {
    id v10 = NSString;
    id v11 = [v6 address];
    id v12 = [v10 stringWithFormat:@"cannot get address identifier, %@. no meCard", v11];

    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v20 = v12;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a4)
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      id v18 = v12;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a4 = [v14 errorWithDomain:@"RTContactsManagerErrorDomain" code:1 userInfo:v15];
    }
    id v9 = 0;
  }

  return v9;
}

- (id)addressIdentifierOfContact:(id)a3 withAddressFromMapItem:(id)a4 error:(id *)a5
{
  v74 = a5;
  v120[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v75 = v6;
  v86 = v7;
  if (!v6)
  {
    int v16 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(v111) = 138412290;
      *(void *)((char *)&v111 + 4) = @"cannot get address identifier. contact required";
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v111, 0xCu);
    }

    if (v74)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v118 = *MEMORY[0x1E4F28568];
      v119 = @"cannot get address identifier. contact required";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
      id v19 = [v17 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v18];
LABEL_19:
      id v12 = 0;
      id *v74 = v19;
LABEL_63:

      goto LABEL_64;
    }
LABEL_20:
    id v12 = 0;
    goto LABEL_64;
  }
  if (!v7)
  {
    __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(v111) = 138412290;
      *(void *)((char *)&v111 + 4) = @"cannot get address identifier. mapItem required";
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v111, 0xCu);
    }

    if (v74)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v116 = *MEMORY[0x1E4F28568];
      v117 = @"cannot get address identifier. mapItem required";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      id v19 = [v21 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v18];
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v8 = [v7 extendedAttributes];
  id v9 = [v8 addressIdentifier];

  if (!v9) {
    goto LABEL_22;
  }
  *(void *)&long long v111 = 0;
  *((void *)&v111 + 1) = &v111;
  uint64_t v112 = 0x2020000000;
  LOBYTE(v113) = 0;
  id v10 = [v6 postalAddresses];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke;
  v101[3] = &unk_1E6B99DB0;
  id v11 = v86;
  id v102 = v11;
  v103 = &v111;
  [v10 enumerateObjectsUsingBlock:v101];

  id v12 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(*((void *)&v111 + 1) + 24)) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "addressIdentifier from mapItem's client attributes is still a valid handle to an address, %@", buf, 0xCu);
  }

  int v14 = *(unsigned __int8 *)(*((void *)&v111 + 1) + 24);
  if (*(unsigned char *)(*((void *)&v111 + 1) + 24))
  {
    id v15 = [v11 extendedAttributes];
    id v12 = [v15 addressIdentifier];
  }
  _Block_object_dispose(&v111, 8);
  if (!v14)
  {
LABEL_22:
    v82 = objc_opt_new();
    *(void *)&long long v111 = 0;
    *((void *)&v111 + 1) = &v111;
    uint64_t v112 = 0x3032000000;
    v113 = __Block_byref_object_copy__107;
    v114 = __Block_byref_object_dispose__107;
    id v115 = 0;
    dispatch_semaphore_t v81 = dispatch_semaphore_create(0);
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    __int16 v22 = [v6 postalAddresses];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v97 objects:v110 count:16];
    id obj = v22;
    id v24 = 0;
    if (v23)
    {
      uint64_t v80 = *(void *)v98;
      uint64_t v77 = *MEMORY[0x1E4F5CFE8];
      uint64_t v78 = *MEMORY[0x1E4F28568];
LABEL_24:
      uint64_t v25 = v23;
      uint64_t v26 = 0;
      v83 = v24;
      while (1)
      {
        if (*(void *)v98 != v80) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v97 + 1) + 8 * v26);
        id v28 = objc_alloc(MEMORY[0x1E4F5CE48]);
        id v29 = (objc_class *)objc_opt_class();
        id v30 = NSStringFromClass(v29);
        v84 = (void *)[v28 initWithUseBackgroundTraits:1 analyticsIdentifier:v30];

        mapServiceManager = self->_mapServiceManager;
        id v32 = [v27 value];
        id v33 = [v32 dictionaryRepresentation];
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke_114;
        v93[3] = &unk_1E6B94A68;
        v96 = &v111;
        id v94 = v82;
        uint64_t v34 = v81;
        v95 = v34;
        [(RTMapServiceManager *)mapServiceManager fetchMapItemsFromAddressDictionary:v33 options:v84 handler:v93];

        uint64_t v35 = v34;
        uint64_t v36 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v37 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v35, v37)) {
          goto LABEL_32;
        }
        v38 = [MEMORY[0x1E4F1C9C8] now];
        [v38 timeIntervalSinceDate:v36];
        double v40 = v39;
        id v41 = objc_opt_new();
        __int16 v42 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_269];
        v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v44 = [v43 filteredArrayUsingPredicate:v42];
        __int16 v45 = [v44 firstObject];

        [v41 submitToCoreAnalytics:v45 type:1 duration:v40];
        uint64_t v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        uint64_t v47 = (void *)MEMORY[0x1E4F28C58];
        v120[0] = v78;
        *(void *)buf = @"semaphore wait timeout";
        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v120 count:1];
        v49 = [v47 errorWithDomain:v77 code:15 userInfo:v48];

        if (v49)
        {
          id v50 = v49;

          char v51 = 0;
        }
        else
        {
LABEL_32:
          char v51 = 1;
          id v50 = v83;
        }

        id v24 = v50;
        if ((v51 & 1) == 0) {
          objc_storeStrong((id *)(*((void *)&v111 + 1) + 40), v50);
        }
        BOOL v52 = *(void *)(*((void *)&v111 + 1) + 40) == 0;

        if (!v52) {
          break;
        }
        ++v26;
        v83 = v24;
        if (v25 == v26)
        {
          uint64_t v23 = [obj countByEnumeratingWithState:&v97 objects:v110 count:16];
          if (v23) {
            goto LABEL_24;
          }
          break;
        }
      }
    }
    v79 = v24;

    v53 = *(void **)(*((void *)&v111 + 1) + 40);
    if (v53)
    {
      id v18 = 0;
      if (*v74) {
        id *v74 = v53;
      }
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v54 = v82;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v89 objects:v109 count:16];
      if (v55)
      {
        v85 = 0;
        uint64_t v56 = *(void *)v90;
        double v57 = INFINITY;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v90 != v56) {
              objc_enumerationMutation(v54);
            }
            v59 = *(void **)(*((void *)&v89 + 1) + 8 * i);
            distanceCalculator = self->_distanceCalculator;
            v61 = [v86 location:v74];
            v62 = [v59 location];
            id v88 = 0;
            [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v61 toLocation:v62 error:&v88];
            double v64 = v63;
            id v65 = v88;

            if (v65)
            {
              v66 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v86;
                __int16 v105 = 2112;
                id v106 = v65;
                _os_log_error_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_ERROR, "error determining distance for map item, %@, error, %@", buf, 0x16u);
              }
            }
            else if (v64 < 200.0 && v64 < v57)
            {
              v66 = [v59 extendedAttributes];
              uint64_t v72 = [v66 addressIdentifier];

              v85 = (void *)v72;
              double v57 = v64;
            }
            else
            {
              v66 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                v68 = [v59 extendedAttributes];
                v69 = [v68 addressIdentifier];
                v70 = [v59 address];
                v71 = [v86 address];
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v69;
                __int16 v105 = 2112;
                id v106 = v70;
                __int16 v107 = 2112;
                v108 = v71;
                _os_log_debug_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_DEBUG, "contact's address identifier, %@, address, \"%@\", too far from address of mapItem, %@", buf, 0x20u);
              }
            }
          }
          uint64_t v55 = [v54 countByEnumeratingWithState:&v89 objects:v109 count:16];
        }
        while (v55);
      }
      else
      {
        v85 = 0;
      }

      id v18 = v85;
    }

    _Block_object_dispose(&v111, 8);
    id v12 = v18;
    goto LABEL_63;
  }
LABEL_64:

  return v12;
}

void __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  id v7 = [*(id *)(a1 + 32) extendedAttributes];
  id v8 = [v7 addressIdentifier];
  int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke_114(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v7 = obj;
  id v6 = a2;
  [*(id *)(a1 + 32) addObjectsFromArray:v6];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)addAddressToContact:(id)a3 addressLabelType:(unint64_t)a4 addressFromMapItem:(id)a5 error:(id *)a6
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v10)
    {
      id v44 = v10;
      uint64_t v12 = [(id)objc_opt_class() addressDictionaryFromMapItem:v10];
      uint64_t v13 = [(id)objc_opt_class() addressLabelTypeToLabel:a4];
      v43 = (void *)v12;
      uint64_t v14 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v12];
      id v15 = (void *)[v9 mutableCopy];
      int v16 = [MEMORY[0x1E4F1CA48] array];
      __int16 v42 = (void *)v13;
      __int16 v45 = (void *)v14;
      uint64_t v17 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v13 value:v14];
      [v16 addObject:v17];
      id v18 = [v15 postalAddresses];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __83__RTContactsManager_addAddressToContact_addressLabelType_addressFromMapItem_error___block_invoke;
      v47[3] = &unk_1E6B99DD8;
      id v19 = v16;
      id v48 = v19;
      [v18 enumerateObjectsUsingBlock:v47];

      [v15 setPostalAddresses:v19];
      __int16 v20 = objc_opt_new();
      [v20 updateContact:v15];
      uint64_t v21 = objc_opt_new();
      id v46 = 0;
      int v41 = [v21 executeSaveRequest:v20 error:&v46];
      id v22 = v46;
      uint64_t v23 = v22;
      if (a6) {
        *a6 = v22;
      }
      id v24 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        [v17 identifier];
        id v39 = v19;
        uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        [v15 _rt_toString];
        uint64_t v26 = v40 = v9;
        uint64_t v27 = [(id)objc_opt_class() addressLabelTypeToString:a4];
        id v28 = (void *)v27;
        *(_DWORD *)buf = 138413570;
        id v29 = @"NO";
        id v50 = v25;
        __int16 v51 = 2112;
        if (v41) {
          id v29 = @"YES";
        }
        BOOL v52 = v26;
        __int16 v53 = 2112;
        uint64_t v54 = v27;
        __int16 v55 = 2112;
        uint64_t v56 = v45;
        __int16 v57 = 2112;
        v58 = v29;
        __int16 v59 = 2112;
        v60 = v23;
        _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "add address with identifier, %@, to contact, %@, address label type, %@, address, \"%@\", success, %@, error, %@", buf, 0x3Eu);

        id v19 = v39;
        id v9 = v40;
      }

      id v30 = [v17 identifier];

      id v31 = v43;
      id v11 = v44;
      goto LABEL_19;
    }
    dispatch_time_t v37 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = @"cannot add address. mapItem required";
      _os_log_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a6)
    {
      id v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = *MEMORY[0x1E4F28568];
      v62 = @"cannot add address. mapItem required";
      uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v35 = &v62;
      uint64_t v36 = &v61;
      goto LABEL_18;
    }
  }
  else
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = @"cannot add address. contact required";
      _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a6)
    {
      id v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      v64[0] = @"cannot add address. contact required";
      uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v35 = (__CFString **)v64;
      uint64_t v36 = &v63;
LABEL_18:
      id v31 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:1];
      [v33 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v31];
      id v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_21;
    }
  }
  id v30 = 0;
LABEL_21:

  return v30;
}

uint64_t __83__RTContactsManager_addAddressToContact_addressLabelType_addressFromMapItem_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)addAddressToMeCardWithAddressLabelType:(unint64_t)a3 addressFromMapItem:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(RTContactsManager *)self meCard];

  if (v9)
  {
    id v10 = [(RTContactsManager *)self meCard];
    a5 = [(RTContactsManager *)self addAddressToContact:v10 addressLabelType:a3 addressFromMapItem:v8 error:a5];
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = @"cannot add address. meCard required";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      int v16 = @"cannot add address. meCard required";
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      *a5 = [v12 errorWithDomain:@"RTContactsManagerErrorDomain" code:1 userInfo:v13];

      a5 = 0;
    }
  }

  return a5;
}

- (BOOL)updateAddressOfContact:(id)a3 withAddressIdentifier:(id)a4 toAddressFromMapItem:(id)a5 error:(id *)a6
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  dispatch_time_t v37 = v10;
  id v38 = a5;
  if (v9)
  {
    if (v10)
    {
      if (v38)
      {
        id v11 = [(id)objc_opt_class() addressDictionaryFromMapItem:v38];
        uint64_t v45 = 0;
        id v46 = &v45;
        uint64_t v47 = 0x3032000000;
        id v48 = __Block_byref_object_copy__107;
        v49 = __Block_byref_object_dispose__107;
        id v50 = 0;
        uint64_t v12 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v11];
        uint64_t v13 = (void *)[v9 mutableCopy];
        uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v15 = [v13 postalAddresses];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __93__RTContactsManager_updateAddressOfContact_withAddressIdentifier_toAddressFromMapItem_error___block_invoke;
        v40[3] = &unk_1E6B99E00;
        id v35 = v37;
        id v41 = v35;
        id v44 = &v45;
        id v16 = v14;
        id v42 = v16;
        id v36 = v12;
        id v43 = v36;
        [v15 enumerateObjectsUsingBlock:v40];

        [v13 setPostalAddresses:v16];
        uint64_t v17 = objc_opt_new();
        [v17 updateContact:v13];
        id v18 = objc_opt_new();
        id v39 = 0;
        int v19 = [v18 executeSaveRequest:v17 error:&v39];
        id v20 = v39;
        uint64_t v21 = v20;
        if (a6) {
          *a6 = v20;
        }
        id v22 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = [v13 _rt_toString];
          id v24 = (void *)v23;
          uint64_t v25 = v46[5];
          uint64_t v26 = @"NO";
          *(_DWORD *)buf = 138413570;
          if (v19) {
            uint64_t v26 = @"YES";
          }
          BOOL v52 = (__CFString *)v23;
          __int16 v53 = 2112;
          id v54 = v35;
          __int16 v55 = 2112;
          uint64_t v56 = v25;
          __int16 v57 = 2112;
          id v58 = v36;
          __int16 v59 = 2112;
          v60 = v26;
          __int16 v61 = 2112;
          v62 = v21;
          _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "updated address of contact, %@, with address identifier, %@, from address, \"%@\", to address, \"%@\", success, %@, error, %@", buf, 0x3Eu);
        }
        _Block_object_dispose(&v45, 8);

        goto LABEL_24;
      }
      id v32 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v52 = @"cannot update address. mapItem required";
        _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      if (a6)
      {
        id v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        double v64 = @"cannot update address. mapItem required";
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        id v29 = [v33 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v11];
        goto LABEL_23;
      }
LABEL_25:
      LOBYTE(v19) = 0;
      goto LABEL_26;
    }
    id v30 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v52 = @"cannot update address. address identifier required";
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (!a6) {
      goto LABEL_25;
    }
    id v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    v66 = @"cannot update address. address identifier required";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v29 = [v31 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v11];
  }
  else
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v52 = @"cannot update address. contact required";
      _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (!a6) {
      goto LABEL_25;
    }
    id v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v67 = *MEMORY[0x1E4F28568];
    v68[0] = @"cannot update address. contact required";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
    id v29 = [v28 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v11];
  }
LABEL_23:
  LOBYTE(v19) = 0;
  *a6 = v29;
LABEL_24:

LABEL_26:
  return v19;
}

void __93__RTContactsManager_updateAddressOfContact_withAddressIdentifier_toAddressFromMapItem_error___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 identifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = [v10 value];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = *(void **)(a1 + 40);
    id v9 = [v10 labeledValueBySettingValue:*(void *)(a1 + 48)];
    [v8 addObject:v9];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v10];
  }
}

- (BOOL)updateAddressOfMeCardWithAddressIdentifier:(id)a3 toAddressFromMapItem:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(RTContactsManager *)self meCard];

  if (v10)
  {
    id v11 = [(RTContactsManager *)self meCard];
    LOBYTE(a5) = [(RTContactsManager *)self updateAddressOfContact:v11 withAddressIdentifier:v8 toAddressFromMapItem:v9 error:a5];
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v19 = @"cannot set address label type. meCard required";
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      uint64_t v17 = @"cannot set address label type. meCard required";
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *a5 = [v13 errorWithDomain:@"RTContactsManagerErrorDomain" code:1 userInfo:v14];

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

- (BOOL)updateAddressLabelTypeOfContact:(id)a3 withAddressIdentifier:(id)a4 toAddressLabelType:(unint64_t)a5 error:(id *)a6
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v32 = v10;
  if (v9)
  {
    if (v10)
    {
      id v11 = (__CFString *)[v9 mutableCopy];
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v39 = 0;
      id v40 = &v39;
      uint64_t v41 = 0x3032000000;
      id v42 = __Block_byref_object_copy__107;
      id v43 = __Block_byref_object_dispose__107;
      id v44 = 0;
      uint64_t v13 = [(id)objc_opt_class() addressLabelTypeToLabel:a5];
      uint64_t v14 = [(__CFString *)v11 postalAddresses];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __100__RTContactsManager_updateAddressLabelTypeOfContact_withAddressIdentifier_toAddressLabelType_error___block_invoke;
      v34[3] = &unk_1E6B99E00;
      id v15 = v32;
      id v35 = v15;
      id v38 = &v39;
      id v16 = v12;
      id v36 = v16;
      id v17 = v13;
      id v37 = v17;
      [v14 enumerateObjectsUsingBlock:v34];

      [(__CFString *)v11 setPostalAddresses:v16];
      id v18 = objc_opt_new();
      [v18 updateContact:v11];
      int v19 = objc_opt_new();
      id v33 = 0;
      int v20 = [v19 executeSaveRequest:v18 error:&v33];
      id v21 = v33;
      id v22 = v21;
      if (a6) {
        *a6 = v21;
      }
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = v40[5];
        uint64_t v25 = @"NO";
        *(_DWORD *)buf = 138413570;
        if (v20) {
          uint64_t v25 = @"YES";
        }
        id v46 = v11;
        __int16 v47 = 2112;
        id v48 = v15;
        __int16 v49 = 2112;
        uint64_t v50 = v24;
        __int16 v51 = 2112;
        id v52 = v17;
        __int16 v53 = 2112;
        id v54 = v25;
        __int16 v55 = 2112;
        uint64_t v56 = v22;
        _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "updated address label type of contact, %@, with address identifier, %@, from address label type, %@, to address label type, %@, success, %@, error, %@", buf, 0x3Eu);
      }

      _Block_object_dispose(&v39, 8);
      goto LABEL_19;
    }
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = @"cannot update address label type. address identifier required";
      _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a6)
    {
      id v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      id v58 = @"cannot update address label type. address identifier required";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58, &v57, 1, v32];
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v28 = [v30 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v11];
      goto LABEL_18;
    }
LABEL_20:
    LOBYTE(v20) = 0;
    goto LABEL_21;
  }
  uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = @"cannot update address label type. contact required";
    _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  if (!a6) {
    goto LABEL_20;
  }
  uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  v60[0] = @"cannot update address label type. contact required";
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60, v59, 1, v32];
  id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v28 = [v27 errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v11];
LABEL_18:
  LOBYTE(v20) = 0;
  *a6 = v28;
LABEL_19:

LABEL_21:
  return v20;
}

void __100__RTContactsManager_updateAddressLabelTypeOfContact_withAddressIdentifier_toAddressLabelType_error___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 identifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = [v10 label];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = *(void **)(a1 + 40);
    id v9 = [v10 labeledValueBySettingLabel:*(void *)(a1 + 48)];
    [v8 addObject:v9];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v10];
  }
}

- (BOOL)updateAddressLabelTypeOfMeCardWithAddressIdentifier:(id)a3 toAddressLabelType:(unint64_t)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(RTContactsManager *)self meCard];

  if (v9)
  {
    id v10 = [(RTContactsManager *)self meCard];
    LOBYTE(a5) = [(RTContactsManager *)self updateAddressLabelTypeOfContact:v10 withAddressIdentifier:v8 toAddressLabelType:a4 error:a5];
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = @"cannot update address label type. meCard required";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      id v16 = @"cannot update address label type. meCard required";
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      *a5 = [v12 errorWithDomain:@"RTContactsManagerErrorDomain" code:1 userInfo:v13];

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[RTContactsManager fetchFormattedPostalAddressesFromMeCard:]";
      __int16 v12 = 1024;
      int v13 = 1133;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v6 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__RTContactsManager_fetchFormattedPostalAddressesFromMeCard___block_invoke;
  v8[3] = &unk_1E6B90CE0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __61__RTContactsManager_fetchFormattedPostalAddressesFromMeCard___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = 0;
  uint64_t v3 = [v2 _getMeCardWithError:&v6];
  id v4 = v6;
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = [(id)objc_opt_class() formattedPostalAddressesForContact:v3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)formattedPostalAddressesForContact:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v34 = a1;
    id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v6 = [v4 postalAddresses];
    id v35 = [v5 initWithCapacity:[v6 count]];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v32 = v4;
    id obj = [v4 postalAddresses];
    uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    uint64_t v10 = *MEMORY[0x1E4F1B6F8];
    uint64_t v37 = *MEMORY[0x1E4F1B770];
    unint64_t v11 = 0x1E4F28000uLL;
    uint64_t v33 = *MEMORY[0x1E4F1B6F8];
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v36 = v8;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
        uint64_t v14 = [v13 label];
        if ([v14 isEqualToString:v10])
        {
        }
        else
        {
          uint64_t v15 = [v13 label];
          int v16 = [v15 isEqualToString:v37];

          if (!v16) {
            goto LABEL_16;
          }
        }
        id v17 = (void *)MEMORY[0x1E4F1BA88];
        id v18 = [v13 value];
        uint64_t v19 = [v17 stringFromPostalAddress:v18 style:0];

        if (v19)
        {
          int v20 = *(void **)(v11 + 3792);
          id v21 = [v13 label];
          id v22 = [v20 numberWithUnsignedInteger:[v34 labelStringToAddressLabelType:v21]];
          uint64_t v23 = [v35 objectForKey:v22];

          if (v23)
          {
            [v23 addObject:v19];
          }
          else
          {
            id v24 = objc_alloc(MEMORY[0x1E4F1CA48]);
            uint64_t v25 = [v32 postalAddresses];
            uint64_t v26 = [v24 initWithCapacity:[v25 count]];

            [v26 addObject:v19];
            uint64_t v27 = *(void **)(v11 + 3792);
            id v28 = [v13 label];
            id v29 = [v27 numberWithUnsignedInteger:[v34 labelStringToAddressLabelType:v28]];
            [v35 setObject:v26 forKey:v29];
          }
          uint64_t v10 = v33;
          uint64_t v8 = v36;
          unint64_t v11 = 0x1E4F28000;
        }

LABEL_16:
        ++v12;
      }
      while (v8 != v12);
      uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (!v8)
      {
LABEL_18:

        id v4 = v32;
        id v30 = v35;
        goto LABEL_20;
      }
    }
  }
  id v30 = 0;
LABEL_20:

  return v30;
}

- (void)fetchContactsFromEmailOrPhoneNumberString:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
LABEL_3:
      uint64_t v9 = [(RTNotifier *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__RTContactsManager_fetchContactsFromEmailOrPhoneNumberString_handler___block_invoke;
      block[3] = &unk_1E6B90660;
      void block[4] = self;
      id v13 = v6;
      id v14 = v8;
      dispatch_async(v9, block);

      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[RTContactsManager fetchContactsFromEmailOrPhoneNumberString:handler:]";
      __int16 v17 = 1024;
      int v18 = 1186;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: emailOrPhoneNumberString (in %s:%d)", buf, 0x12u);
    }

    if (v8) {
      goto LABEL_3;
    }
  }
  unint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v16 = "-[RTContactsManager fetchContactsFromEmailOrPhoneNumberString:handler:]";
    __int16 v17 = 1024;
    int v18 = 1187;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

LABEL_10:
}

uint64_t __71__RTContactsManager_fetchContactsFromEmailOrPhoneNumberString_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchContactsFromEmailOrPhoneNumberString:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchContactsFromEmailOrPhoneNumberString:(id)a3 handler:(id)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8)
    {
      int IsEmail = IMStringIsEmail();
      int v11 = MEMORY[0x1E016CA60](v7);
      int v12 = v11;
      if ((IsEmail & 1) == 0 && (v11 & 1) == 0)
      {
        id v13 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          uint64_t v15 = (char *)objc_claimAutoreleasedReturnValue();
          int v16 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          double v64 = v15;
          __int16 v65 = 2112;
          v66 = v16;
          __int16 v67 = 2112;
          uint64_t v68 = (uint64_t)v7;
          _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, invalid string passed, %@,", buf, 0x20u);
        }
LABEL_11:
        v9[2](v9, 0, 0);
        goto LABEL_42;
      }
      uint64_t v19 = [(RTContactsManager *)self _contactColumnKeysToFetch];
      int v20 = objc_opt_new();
      if (!v20)
      {
        uint64_t v73 = *MEMORY[0x1E4F28568];
        v74[0] = @"Unable to create contacts store to get the 'Me' card.";
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
        uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v21];
        id v24 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v64 = v23;
          _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        ((void (**)(void, void, char *))v9)[2](v9, 0, v23);
        goto LABEL_41;
      }
      aSelector = a2;
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v19];
      if (IsEmail)
      {
        id v22 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v7];
        [v21 setPredicate:v22];
      }
      else
      {
        if (!v12)
        {
LABEL_24:
          id v61 = 0;
          uint64_t v26 = [v20 executeFetchRequest:v21 error:&v61];
          uint64_t v23 = (char *)v61;
          uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            id v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            __int16 v53 = v21;
            id v29 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            __int16 v55 = v19;
            v31 = id v30 = v23;
            [v26 value];
            __int16 v51 = v26;
            uint64_t v33 = v32 = v20;
            uint64_t v34 = [v33 count];
            *(_DWORD *)buf = 138413314;
            double v64 = v29;
            __int16 v65 = 2112;
            v66 = v31;
            __int16 v67 = 2112;
            uint64_t v68 = (uint64_t)v7;
            __int16 v69 = 2048;
            uint64_t v70 = v34;
            __int16 v71 = 2112;
            uint64_t v72 = v30;
            _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%@, %@, input string, %@, fetched contacts count, %lu, fetch request error, %@", buf, 0x34u);

            int v20 = v32;
            uint64_t v26 = v51;

            uint64_t v23 = v30;
            uint64_t v19 = v55;

            id v21 = v53;
          }

          if (v23)
          {
            ((void (**)(void, void, char *))v9)[2](v9, 0, v23);
          }
          else
          {
            __int16 v49 = v20;
            id v54 = v21;
            uint64_t v56 = v19;
            id v35 = objc_opt_new();
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v52 = v26;
            uint64_t v36 = [v26 value];
            uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v62 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v58 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  uint64_t v41 = *(void *)(*((void *)&v57 + 1) + 8 * i);
                  long long v42 = (void *)MEMORY[0x1E016D870]();
                  id v43 = [(RTContactsManager *)self _getRTContactFromCNContact:v41];
                  if (v43) {
                    [v35 addObject:v43];
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v57 objects:v62 count:16];
              }
              while (v38);
            }

            uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              uint64_t v45 = (objc_class *)objc_opt_class();
              NSStringFromClass(v45);
              id v46 = (char *)objc_claimAutoreleasedReturnValue();
              __int16 v47 = NSStringFromSelector(aSelector);
              uint64_t v48 = [v35 count];
              *(_DWORD *)buf = 138412802;
              double v64 = v46;
              __int16 v65 = 2112;
              v66 = v47;
              __int16 v67 = 2048;
              uint64_t v68 = v48;
              _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, %@, resultContacts count, %lu", buf, 0x20u);
            }
            ((void (**)(void, void *, void))v9)[2](v9, v35, 0);

            id v21 = v54;
            uint64_t v19 = v56;
            uint64_t v23 = 0;
            int v20 = v49;
            uint64_t v26 = v52;
          }

LABEL_41:
          goto LABEL_42;
        }
        id v22 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v7];
        uint64_t v25 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v22];
        [v21 setPredicate:v25];
      }
      goto LABEL_24;
    }
  }
  else
  {
    __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v64 = "-[RTContactsManager _fetchContactsFromEmailOrPhoneNumberString:handler:]";
      __int16 v65 = 1024;
      LODWORD(v66) = 1203;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: emailOrPhoneNumberString (in %s:%d)", buf, 0x12u);
    }

    if (v9) {
      goto LABEL_11;
    }
  }
  int v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    double v64 = "-[RTContactsManager _fetchContactsFromEmailOrPhoneNumberString:handler:]";
    __int16 v65 = 1024;
    LODWORD(v66) = 1204;
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

LABEL_42:
}

- (void)fetchContactsUsingContactIdentifiers:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (!v6)
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[RTContactsManager fetchContactsUsingContactIdentifiers:handler:]";
      __int16 v17 = 1024;
      int v18 = 1293;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIdentifiers (in %s:%d)", buf, 0x12u);
    }

    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[RTContactsManager fetchContactsUsingContactIdentifiers:handler:]";
      __int16 v17 = 1024;
      int v18 = 1294;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_11;
  }
  if (!v7) {
    goto LABEL_9;
  }
  if (![v6 count])
  {
LABEL_8:
    int v11 = [MEMORY[0x1E4F1C978] array];
    ((void (**)(void, NSObject *, void))v8)[2](v8, v11, 0);
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v9 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTContactsManager_fetchContactsUsingContactIdentifiers_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  dispatch_async(v9, block);

LABEL_12:
}

uint64_t __66__RTContactsManager_fetchContactsUsingContactIdentifiers_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchContactsUsingContactIdentifiers:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchContactsUsingContactIdentifiers:(id)a3 handler:(id)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8)
    {
      if ([v7 count])
      {
        uint64_t v10 = objc_opt_new();
        if (v10)
        {
          int v11 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            id v13 = (char *)objc_claimAutoreleasedReturnValue();
            id v14 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            uint64_t v50 = v13;
            __int16 v51 = 2112;
            id v52 = v14;
            __int16 v53 = 2048;
            uint64_t v54 = [v7 count];
            _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, %@, contact identifiers count, %lu,", buf, 0x20u);
          }
          id v15 = objc_alloc(MEMORY[0x1E4F1B908]);
          int v16 = [(RTContactsManager *)self _contactColumnKeysToFetch];
          __int16 v17 = (void *)[v15 initWithKeysToFetch:v16];

          int v18 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v7];
          [v17 setPredicate:v18];

          id v47 = 0;
          uint64_t v19 = [v10 executeFetchRequest:v17 error:&v47];
          int v20 = (char *)v47;
          id v21 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            uint64_t v23 = (char *)objc_claimAutoreleasedReturnValue();
            id v24 = NSStringFromSelector(a2);
            uint64_t v41 = v17;
            uint64_t v25 = [v7 count];
            uint64_t v39 = [v19 value];
            uint64_t v26 = [v39 count];
            *(_DWORD *)buf = 138413314;
            uint64_t v50 = v23;
            __int16 v51 = 2112;
            id v52 = v24;
            __int16 v53 = 2048;
            uint64_t v54 = v25;
            __int16 v17 = v41;
            __int16 v55 = 2048;
            uint64_t v56 = v26;
            __int16 v57 = 2112;
            long long v58 = v20;
            _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, %@, contact identifiers count, %lu, fetched contacts count, %lu, fetch request error, %@", buf, 0x34u);
          }
          if (v20)
          {
            ((void (**)(void, void, char *))v9)[2](v9, 0, v20);
          }
          else
          {
            id v40 = v7;
            long long v42 = v17;
            id v29 = objc_opt_new();
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            uint64_t v38 = v19;
            id v30 = [v19 value];
            uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v48 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v44 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                  uint64_t v36 = (void *)MEMORY[0x1E016D870]();
                  uint64_t v37 = [(RTContactsManager *)self _getRTContactFromCNContact:v35];
                  if (v37) {
                    [v29 addObject:v37];
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v48 count:16];
              }
              while (v32);
            }

            ((void (**)(void, void *, void))v9)[2](v9, v29, 0);
            id v7 = v40;
            __int16 v17 = v42;
            uint64_t v19 = v38;
            int v20 = 0;
          }
        }
        else
        {
          uint64_t v59 = *MEMORY[0x1E4F28568];
          v60[0] = @"Unable to create contacts store to get the 'Me' card.";
          __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
          int v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v17];
          id v28 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = v20;
            _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          ((void (**)(void, void, char *))v9)[2](v9, 0, v20);
        }

        goto LABEL_32;
      }
LABEL_14:
      uint64_t v10 = [MEMORY[0x1E4F1C978] array];
      ((void (**)(void, NSObject *, void))v9)[2](v9, v10, 0);
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v50 = "-[RTContactsManager _fetchContactsUsingContactIdentifiers:handler:]";
      __int16 v51 = 1024;
      LODWORD(v52) = 1315;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIdentifiers (in %s:%d)", buf, 0x12u);
    }

    if (v9) {
      goto LABEL_14;
    }
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v50 = "-[RTContactsManager _fetchContactsUsingContactIdentifiers:handler:]";
    __int16 v51 = 1024;
    LODWORD(v52) = 1316;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_32:
}

- (void)fetchFavoriteHandlesWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__RTContactsManager_fetchFavoriteHandlesWithHandler___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[RTContactsManager fetchFavoriteHandlesWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 1381;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __53__RTContactsManager_fetchFavoriteHandlesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFavoriteHandlesWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchFavoriteHandlesWithHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void))a3;
  if (v5)
  {
    aSelector = a2;
    id v6 = [(RTContactsManager *)self _favoriteEntries];
    id v7 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v14 = (void *)MEMORY[0x1E016D870]();
          id v15 = [v13 value];

          if (v15)
          {
            int v16 = [v13 value];
            [v7 addObject:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v10);
    }

    __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
      int v20 = NSStringFromSelector(aSelector);
      uint64_t v21 = [v7 count];
      *(_DWORD *)buf = 138412802;
      id v28 = v19;
      __int16 v29 = 2112;
      id v30 = v20;
      __int16 v31 = 2048;
      uint64_t v32 = v21;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, favorite handles count, %lu", buf, 0x20u);
    }
    v5[2](v5, v7, 0);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "-[RTContactsManager _fetchFavoriteHandlesWithHandler:]";
      __int16 v29 = 1024;
      LODWORD(v30) = 1394;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (void)fetchFavoriteContactsWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__RTContactsManager_fetchFavoriteContactsWithHandler___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[RTContactsManager fetchFavoriteContactsWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 1421;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __54__RTContactsManager_fetchFavoriteContactsWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFavoriteContactsWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchFavoriteContactsWithHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void))a3;
  if (v5)
  {
    id v6 = [(RTContactsManager *)self _favoriteEntries];
    id v7 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
          id v14 = (void *)MEMORY[0x1E016D870](v9);
          id v15 = [v13 contact:v21];
          if (v15) {
            [v7 addObject:v15];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
        uint64_t v10 = v9;
      }
      while (v9);
    }

    int v16 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      int v18 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = NSStringFromSelector(a2);
      uint64_t v20 = [v7 count];
      *(_DWORD *)buf = 138412802;
      long long v26 = v18;
      __int16 v27 = 2112;
      id v28 = v19;
      __int16 v29 = 2048;
      uint64_t v30 = v20;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, %@, favorite contacts count, %lu", buf, 0x20u);
    }
    v5[2](v5, v7, 0);
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v26 = "-[RTContactsManager _fetchFavoriteContactsWithHandler:]";
      __int16 v27 = 1024;
      LODWORD(v28) = 1435;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (id)_favoriteEntries
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1B9E8] sharedInstance];
  id v5 = v4;
  if (v4)
  {
    aSelector = a2;
    __int16 v27 = v4;
    id v6 = [v4 entries];
    id v7 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v13 = [v12 contactProperty];
          id v14 = [v13 contact];

          id v15 = [(RTContactsManager *)self _getRTContactFromCNContact:v14];
          int v16 = [RTFavoritesEntry alloc];
          __int16 v17 = [v12 value];
          int v18 = [(RTFavoritesEntry *)v16 initWithContact:v15 value:v17];

          [v7 addObject:v18];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v9);
    }

    uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (objc_class *)objc_opt_class();
      long long v21 = NSStringFromClass(v20);
      long long v22 = NSStringFromSelector(aSelector);
      uint64_t v23 = [v7 count];
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      __int16 v37 = 2048;
      uint64_t v38 = v23;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%@, %@, favorite entries count, %lu", buf, 0x20u);
    }
    id v5 = v27;
  }
  else
  {
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"Unable to create favorites store.";
    id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:nil];
    long long v24 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v19;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    id v7 = objc_opt_new();
  }

  return v7;
}

- (void)fetchRelationshipContactsFromMeCardWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__RTContactsManager_fetchRelationshipContactsFromMeCardWithHandler___block_invoke;
    v7[3] = &unk_1E6B90CE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[RTContactsManager fetchRelationshipContactsFromMeCardWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 1505;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __68__RTContactsManager_fetchRelationshipContactsFromMeCardWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRelationshipContactsFromMeCardWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchRelationshipContactsFromMeCardWithHandler:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void))a3;
  if (v5)
  {
    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    if (v7)
    {
      aSelector = a2;
      id v8 = [(RTContactsManager *)self _contactColumnKeysToFetch];
      uint64_t v9 = [v8 arrayByAddingObject:*MEMORY[0x1E4F1AF50]];
      id v46 = 0;
      uint64_t v10 = [v7 _crossPlatformUnifiedMeContactWithKeysToFetch:v9 error:&v46];
      __int16 v11 = v46;

      if (v10)
      {
        long long v32 = v7;
        uint64_t v33 = v5;
        long long v31 = v10;
        [v10 contactRelations];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v36 = *(void *)v43;
          do
          {
            uint64_t v14 = 0;
            id v15 = v11;
            do
            {
              if (*(void *)v43 != v36) {
                objc_enumerationMutation(obj);
              }
              int v16 = [*(id *)(*((void *)&v42 + 1) + 8 * v14) value];
              __int16 v17 = [v16 name];
              uint64_t v41 = v15;
              int v18 = [(RTContactsManager *)self _queryContactsForGivenName:v17 error:&v41];
              __int16 v11 = v41;

              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              id v19 = v18;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v53 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v38;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v38 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    long long v24 = [(RTContactsManager *)self _getRTContactFromCNContact:*(void *)(*((void *)&v37 + 1) + 8 * i)];
                    [v6 addObject:v24];
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v53 count:16];
                }
                while (v21);
              }

              ++v14;
              id v15 = v11;
            }
            while (v14 != v13);
            uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
          }
          while (v13);
        }

        id v7 = v32;
        id v5 = v33;
        uint64_t v10 = v31;
      }
      long long v25 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        long long v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        __int16 v27 = (char *)objc_claimAutoreleasedReturnValue();
        id v28 = NSStringFromSelector(aSelector);
        uint64_t v29 = [v6 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v48 = v27;
        __int16 v49 = 2112;
        uint64_t v50 = v28;
        __int16 v51 = 2048;
        uint64_t v52 = v29;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, %@, relation contacts count, %lu", buf, 0x20u);
      }
      v5[2](v5, v6, 0);
    }
    else
    {
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56[0] = @"Unable to create contacts store to get the 'Me' card.";
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      __int16 v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v10];
      long long v30 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v48 = (const char *)v11;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      ((void (**)(id, void *, NSObject *))v5)[2](v5, 0, v11);
    }
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v48 = "-[RTContactsManager _fetchRelationshipContactsFromMeCardWithHandler:]";
      __int16 v49 = 1024;
      LODWORD(v50) = 1519;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (id)_queryContactsForGivenName:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_opt_new();
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v6];
      uint64_t v9 = [(RTContactsManager *)self _contactColumnKeysToFetch];
      id v15 = 0;
      uint64_t v10 = [v7 unifiedContactsMatchingPredicate:v8 keysToFetch:v9 error:&v15];
      id v11 = v15;

      if (a4)
      {
        id v11 = v11;
        *a4 = v11;
      }
    }
    else
    {
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19[0] = @"Unable to create contacts store to get the 'Me' card.";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTContactsManagerErrorDomain" code:0 userInfo:v8];
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (a4) {
        *a4 = v11;
      }
      uint64_t v10 = [MEMORY[0x1E4F1C978] array];
    }
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"name");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = [MEMORY[0x1E4F1C978] array];
  }

  return v10;
}

- (id)_getRTContactFromCNContact:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];

  if (v5)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v25 = "-[RTContactsManager _getRTContactFromCNContact:]";
      __int16 v26 = 1024;
      int v27 = 1593;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.queue (in %s:%d)", buf, 0x12u);
    }

    if (v4)
    {
LABEL_3:
      if ([v4 isKeyAvailable:*MEMORY[0x1E4F1AF10]])
      {
        id v6 = [v4 postalAddresses];
        id v7 = [(RTContactsManager *)self _getPostalAddressesUsingCNContactPostalAddresses:v6];
      }
      else
      {
        id v7 = [MEMORY[0x1E4F1C978] array];
      }
      if ([v4 isKeyAvailable:*MEMORY[0x1E4F1AEE0]])
      {
        uint64_t v10 = [v4 phoneNumbers];
        id v11 = [(RTContactsManager *)self _getPhoneNumberStringsUsingCNContactPhoneNumbers:v10];
      }
      else
      {
        id v11 = [MEMORY[0x1E4F1C978] array];
      }
      if ([v4 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
      {
        uint64_t v12 = [v4 emailAddresses];
        uint64_t v13 = [(RTContactsManager *)self _getEmailAddressStringsUsingCNContactEmailAddresses:v12];
      }
      else
      {
        uint64_t v13 = [MEMORY[0x1E4F1C978] array];
      }
      uint64_t v14 = [RTContact alloc];
      uint64_t v23 = [v4 identifier];
      id v15 = [v4 givenName];
      int v16 = [v4 middleName];
      id v17 = [v4 familyName];
      uint64_t v18 = v7;
      if (!v7)
      {
        uint64_t v18 = [MEMORY[0x1E4F1C978] array];
      }
      id v19 = v11;
      if (v11)
      {
        if (v13) {
          goto LABEL_22;
        }
      }
      else
      {
        id v19 = [MEMORY[0x1E4F1C978] array];
        if (v13)
        {
LABEL_22:
          uint64_t v9 = [(RTContact *)v14 initWithIdentifier:v23 givenName:v15 middleName:v16 familyName:v17 postalAddresses:v18 phoneNumbers:v19 emailAddresses:v13];
          if (v11)
          {
LABEL_24:
            if (!v7) {

            }
            goto LABEL_27;
          }
LABEL_23:

          goto LABEL_24;
        }
      }
      [MEMORY[0x1E4F1C978] array];
      v21 = uint64_t v22 = v13;
      uint64_t v9 = [(RTContact *)v14 initWithIdentifier:v23 givenName:v15 middleName:v16 familyName:v17 postalAddresses:v18 phoneNumbers:v19 emailAddresses:v21];

      uint64_t v13 = v22;
      if (v11) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v25 = "-[RTContactsManager _getRTContactFromCNContact:]";
    __int16 v26 = 1024;
    int v27 = 1594;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contact (in %s:%d)", buf, 0x12u);
  }
  uint64_t v9 = 0;
LABEL_27:

  return v9;
}

- (id)_getPostalAddressesUsingCNContactPostalAddresses:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [v7 dateByAddingTimeInterval:4838400.0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __70__RTContactsManager__getPostalAddressesUsingCNContactPostalAddresses___block_invoke;
  v15[3] = &unk_1E6B99E28;
  v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  id v9 = v6;
  id v18 = v9;
  id v10 = v8;
  id v11 = v7;
  [v5 enumerateObjectsUsingBlock:v15];

  uint64_t v12 = v18;
  id v13 = v9;

  return v13;
}

void __70__RTContactsManager__getPostalAddressesUsingCNContactPostalAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [RTContactPostalAddress alloc];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = objc_opt_class();
  id v7 = [v3 label];
  id v9 = -[RTContactPostalAddress initWithIdentifier:CNPostalAddress:lableType:creationDate:expirationDate:](v4, "initWithIdentifier:CNPostalAddress:lableType:creationDate:expirationDate:", v5, v3, [v6 labelStringToAddressLabelType:v7], *(void *)(a1 + 40), *(void *)(a1 + 48));

  id v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 56) addObject:v9];
    id v8 = v9;
  }
}

- (id)_getPhoneNumberStringsUsingCNContactPhoneNumbers:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__RTContactsManager__getPhoneNumberStringsUsingCNContactPhoneNumbers___block_invoke;
  v7[3] = &unk_1E6B99DD8;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __70__RTContactsManager__getPhoneNumberStringsUsingCNContactPhoneNumbers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  id v5 = [v3 stringValue];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

- (id)_getEmailAddressStringsUsingCNContactEmailAddresses:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__RTContactsManager__getEmailAddressStringsUsingCNContactEmailAddresses___block_invoke;
  v7[3] = &unk_1E6B99DD8;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

uint64_t __73__RTContactsManager__getEmailAddressStringsUsingCNContactEmailAddresses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 value];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (CNContact)meCard
{
  return self->_meCard;
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);

  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
}

@end