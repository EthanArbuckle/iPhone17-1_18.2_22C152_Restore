@interface NTKPeopleComplication
+ (BOOL)_complicationPickerShouldShowMoreButtonForList:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
+ (id)allValidFavoriteContacts;
+ (id)complicationForContact:(id)a3 forPromotedSection:(BOOL)a4;
+ (id)localizedNameForContact:(id)a3;
+ (id)myCard;
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)isFavoritedPerson;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (NSString)abbreviation;
- (NSString)contactID;
- (NSString)fullName;
- (NSString)shortName;
- (NSString)storeBackedContactID;
- (NTKPeopleComplication)init;
- (NTKPeopleComplication)initWithCoder:(id)a3;
- (id)_complicationTypeString;
- (id)_generateUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)localizedDetailText;
- (id)localizedKeylineLabelText;
- (id)ntk_sectionIdentifier;
- (unint64_t)ntk_itemType;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)_complicationTypeString;
- (void)_contactsCacheDidChange;
- (void)_refreshContactInfoNotifyOfChange;
- (void)_registerWithSwitch:(BOOL)a3;
- (void)_updateStateWithContact:(id)a3 foundAsPrimaryId:(BOOL)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)storeBackedContactID;
@end

@implementation NTKPeopleComplication

- (unint64_t)ntk_itemType
{
  if ([(NTKPeopleComplication *)self isFavoritedPerson]) {
    return 2;
  }
  else {
    return 4;
  }
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  if (NTKDeviceIsGreenTea()
    && ([MEMORY[0x1E4F19A30] currentDevice],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isPaired],
        v4,
        !v5))
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v6 = [a1 allValidFavoriteContacts];
    if (![v6 count])
    {
      v7 = +[NTKPeopleComplicationContactsCache sharedCache];
      uint64_t v8 = [v7 nonFavoriteAllContactsWithCount:5];

      v6 = (void *)v8;
    }
    uint64_t v9 = _peopleComplicationsForContacts(v6, 0);
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      v11 = (void *)v9;
    }
    id v12 = v11;
  }

  return v12;
}

+ (BOOL)_complicationPickerShouldShowMoreButtonForList:(id)a3
{
  id v3 = a3;
  v4 = [v3 firstObject];
  if (([v4 isFavoritedPerson] & 1) != 0 && (unint64_t)objc_msgSend(v3, "count") <= 4)
  {
    int v5 = +[NTKPeopleComplicationContactsCache sharedCache];
    v6 = [v5 firstNonFavoriteAllContact];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = (unint64_t)[v3 count] > 4;
  }

  return v7;
}

+ (id)myCard
{
  v2 = +[NTKPeopleComplicationContactsCache sharedCache];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  id v12 = 0;
  id v3 = [v2 myCard];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__NTKPeopleComplication_myCard__block_invoke;
  v6[3] = &unk_1E62C8A18;
  v6[4] = &v7;
  [v2 checkValidityOfContact:v3 block:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__NTKPeopleComplication_myCard__block_invoke(uint64_t a1, void *a2)
{
}

+ (id)allValidFavoriteContacts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  id v3 = +[NTKPeopleComplicationContactsCache sharedCache];
  id v4 = [v3 favoriteContacts];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __49__NTKPeopleComplication_allValidFavoriteContacts__block_invoke;
        v12[3] = &unk_1E62C84E0;
        id v13 = v2;
        [v3 checkValidityOfContact:v9 block:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  [v2 sortUsingComparator:&__block_literal_global_149];
  v10 = (void *)[v2 copy];

  return v10;
}

uint64_t __49__NTKPeopleComplication_allValidFavoriteContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __49__NTKPeopleComplication_allValidFavoriteContacts__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[NTKPeopleComplication localizedNameForContact:a2];
  uint64_t v6 = +[NTKPeopleComplication localizedNameForContact:v4];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (NTKPeopleComplication)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplication;
  v2 = [(NTKPeopleComplication *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(NTKPeopleComplication *)v2 _registerWithSwitch:1];
  }
  return v3;
}

- (void)_registerWithSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];
  if (v3) {
    [v5 addObserver:self selector:sel__contactsCacheDidChange name:@"NTKPeopleComplicationContactsCacheDidChangeNotification" object:0];
  }
}

- (void)dealloc
{
  [(NTKPeopleComplication *)self _registerWithSwitch:0];
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplication;
  [(NTKPeopleComplication *)&v3 dealloc];
}

- (id)ntk_sectionIdentifier
{
  return @"com.apple.nanotimekit.contacts";
}

- (NSString)storeBackedContactID
{
  storeBackedContactID = self->_storeBackedContactID;
  if (!storeBackedContactID)
  {
    id v4 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(NTKPeopleComplication *)(uint64_t)self storeBackedContactID];
    }

    storeBackedContactID = self->_contactID;
  }
  id v5 = storeBackedContactID;

  return v5;
}

- (id)localizedDetailText
{
  return self->_shortName;
}

- (id)localizedKeylineLabelText
{
  shortName = self->_shortName;
  objc_super v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [(NSString *)shortName capitalizedStringWithLocale:v3];

  return v4;
}

+ (id)localizedNameForContact:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKPeopleComplicationContactsCache sharedCache];
  id v5 = [v4 shortNameForContact:v3];

  return v5;
}

+ (id)complicationForContact:(id)a3 forPromotedSection:(BOOL)a4
{
  if (a4) {
    id v4 = 0;
  }
  else {
    id v4 = @"all";
  }
  return _peopleComplicationForContact(a3, v4);
}

- (BOOL)isFavoritedPerson
{
  id v3 = +[NTKPeopleComplicationContactsCache sharedCache];
  id v4 = [(NTKPeopleComplication *)self storeBackedContactID];
  char v5 = [v3 contactIdentifierIsFavorited:v4];

  return v5;
}

- (void)_contactsCacheDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NTKPeopleComplication__contactsCacheDidChange__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __48__NTKPeopleComplication__contactsCacheDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshContactInfoNotifyOfChange];
}

- (void)_refreshContactInfoNotifyOfChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(NTKComplication *)self complicationType])
  {
    id v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      fullName = self->_fullName;
      contactID = self->_contactID;
      *(_DWORD *)buf = 138412546;
      long long v17 = fullName;
      __int16 v18 = 2112;
      uint64_t v19 = contactID;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication doing refresh on instance [%@][%@] with complicationType == NTKComplicationTypeNone.", buf, 0x16u);
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F19A30] currentDevice];
  int v7 = [v6 isLocked];

  if (v7)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self->_fullName;
      v10 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      long long v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication skipping refresh contact [%@][%@] info due to device being locked.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = +[NTKPeopleComplicationContactsCache sharedCache];
    v11 = [(NTKPeopleComplication *)self contactID];
    id v12 = [v8 contactForId:v11];

    if (v12)
    {
      [(NTKPeopleComplication *)self _updateStateWithContact:v12 foundAsPrimaryId:1];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      id v13 = self->_fullName;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__NTKPeopleComplication__refreshContactInfoNotifyOfChange__block_invoke;
      v14[3] = &unk_1E62C8A60;
      objc_copyWeak(&v15, (id *)buf);
      [v8 findContactWithFullName:v13 block:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __58__NTKPeopleComplication__refreshContactInfoNotifyOfChange__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateStateWithContact:v5 foundAsPrimaryId:0];
  }
}

- (void)_updateStateWithContact:(id)a3 foundAsPrimaryId:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = +[NTKPeopleComplicationContactsCache sharedCache];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke;
  v23[3] = &unk_1E62C8A88;
  v23[4] = self;
  v23[5] = &v24;
  if ([v7 checkValidityOfContact:v6 block:v23])
  {
    if ([(NTKComplication *)self complicationType])
    {
      if (v4)
      {
LABEL_4:
        objc_storeStrong((id *)&self->_storeBackedContactID, self->_contactID);
        goto LABEL_15;
      }
    }
    else
    {
      v11 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        fullName = self->_fullName;
        contactID = self->_contactID;
        *(_DWORD *)buf = 138412546;
        v29 = fullName;
        __int16 v30 = 2112;
        v31 = contactID;
        _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication [%@][%@] valid but NTKComplicationTypeNone == self.complicationType so changing to NTKComplicationTypePeople.", buf, 0x16u);
      }

      [(NTKComplication *)self _setComplicationType:37];
      *((unsigned char *)v25 + 24) = 1;
      if (v4) {
        goto LABEL_4;
      }
    }
    long long v14 = [v6 identifier];
    storeBackedContactID = self->_storeBackedContactID;
    self->_storeBackedContactID = v14;

    *((unsigned char *)v25 + 24) = 1;
    long long v16 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v6 identifier];
      __int16 v18 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication valid but storeBackedContactID[%@] is being used now associated with primary[%@].", buf, 0x16u);
    }
  }
  else if ([(NTKComplication *)self complicationType] == 37)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self->_fullName;
      v10 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication [%@][%@] invalid so setting complicationtype to NTKComplicationTypeNone.", buf, 0x16u);
    }

    [(NTKComplication *)self _setComplicationType:0];
    *((unsigned char *)v25 + 24) = 1;
  }
LABEL_15:
  if (*((unsigned char *)v25 + 24))
  {
    uint64_t v19 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = self->_fullName;
      v21 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      __int16 v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication [%@][%@] did change in some way so sending notification.", buf, 0x16u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke_15;
    block[3] = &unk_1E62BFF20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  _Block_object_dispose(&v24, 8);
}

void __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v11 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([*(id *)(*(void *)(a1 + 32) + 64) isEqualToString:v9] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 56) isEqualToString:v11] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 48) isEqualToString:v10] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke_15(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NTKComplicationDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)_complicationTypeString
{
  unint64_t v2 = [(NTKComplication *)self complicationType];
  if (!v2) {
    return @"NONE";
  }
  if (v2 == 37) {
    return @"PEOPLE";
  }
  BOOL v4 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[NTKPeopleComplication _complicationTypeString](v4);
  }

  return &stru_1F1635E90;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  id v5 = NSString;
  id v6 = [(NTKPeopleComplication *)self contactID];
  int v7 = [(NTKPeopleComplication *)self abbreviation];
  uint64_t v8 = [(NTKPeopleComplication *)self fullName];
  id v9 = [(NTKPeopleComplication *)self shortName];
  id v10 = [(NTKPeopleComplication *)self _complicationTypeString];
  id v11 = [v5 stringWithFormat:@"%@-%@-%@-%@-%@", v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return [a3 localeMatchesContext:a4] ^ 1;
}

- (id)_generateUniqueIdentifier
{
  id v3 = NSString;
  BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  id v5 = [v4 stringValue];
  id v6 = [v3 stringWithFormat:@"%@-%@", v5, self->_contactID];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKPeopleComplication;
  BOOL v4 = [(NTKComplication *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_contactID copy];
  id v6 = (void *)v4[5];
  v4[5] = v5;

  uint64_t v7 = [(NSString *)self->_fullName copy];
  uint64_t v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_abbreviation copy];
  id v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_shortName copy];
  id v12 = (void *)v4[6];
  v4[6] = v11;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKPeopleComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKPeopleComplication;
  uint64_t v5 = [(NTKComplication *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPeopleComplicationContactIDKey"];
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPeopleComplicationFullNameKey"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPeopleComplicationAbbreviationKey"];
    abbreviation = v5->_abbreviation;
    v5->_abbreviation = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPeopleComplicationShortNameKey"];
    shortName = v5->_shortName;
    v5->_shortName = (NSString *)v12;

    if (!v5->_contactID) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil _contactID", objc_opt_class() format];
    }
    if (!v5->_fullName) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil _fullName", objc_opt_class() format];
    }
    if (!v5->_abbreviation) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil _abbreviation", objc_opt_class() format];
    }
    if (!v5->_shortName) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil _shortName", objc_opt_class() format];
    }
    objc_super v14 = [(NTKPeopleComplication *)v5 _generateUniqueIdentifier];
    [(NTKComplication *)v5 setUniqueIdentifier:v14];

    [(NTKPeopleComplication *)v5 _refreshContactInfoNotifyOfChange];
    [(NTKPeopleComplication *)v5 _registerWithSwitch:1];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplication;
  id v4 = a3;
  [(NTKComplication *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactID, @"kPeopleComplicationContactIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fullName forKey:@"kPeopleComplicationFullNameKey"];
  [v4 encodeObject:self->_abbreviation forKey:@"kPeopleComplicationAbbreviationKey"];
  [v4 encodeObject:self->_shortName forKey:@"kPeopleComplicationShortNameKey"];
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplication;
  id v4 = a3;
  [(NTKComplication *)&v5 _addKeysToJSONDictionary:v4];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_contactID, @"people ID", v5.receiver, v5.super_class);
  [v4 setObject:self->_fullName forKeyedSubscript:@"people full name"];
  [v4 setObject:self->_abbreviation forKeyedSubscript:@"people Abbreviation"];
  [v4 setObject:self->_shortName forKeyedSubscript:@"people short name"];
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKPeopleComplication;
  uint64_t v7 = [(NTKComplication *)&v18 _initWithComplicationType:a3 JSONDictionary:v6];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"people ID"];
    uint64_t v9 = (void *)v7[5];
    v7[5] = v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"people full name"];
    uint64_t v11 = (void *)v7[7];
    v7[7] = v10;

    uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:");
    id v13 = (void *)v7[8];
    v7[8] = v12;

    uint64_t v14 = objc_msgSend(v6, "objectForKeyedSubscript:");
    id v15 = (void *)v7[6];
    v7[6] = v14;

    if (!v7[5]) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"missing value for key '%@'", @"people ID" format];
    }
    if (!v7[7]) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"missing value for key '%@'", @"people full name" format];
    }
    if (!v7[8]) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"missing value for key '%@'", @"people Abbreviation" format];
    }
    if (!v7[6]) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"missing value for key '%@'", @"people short name" format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for key '%@' must be String - invalid value: %@", @"people ID", v7[5] format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for key '%@' must be String - invalid value: %@", @"people full name", v7[7] format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for key '%@' must be String - invalid value: %@", @"people Abbreviation", v7[8] format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for key '%@' must be String - invalid value: %@", @"people short name", v7[6] format];
    }
    objc_super v16 = [v7 _generateUniqueIdentifier];
    [v7 setUniqueIdentifier:v16];
  }
  return v7;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_contactID, 0);

  objc_storeStrong((id *)&self->_storeBackedContactID, 0);
}

- (void)storeBackedContactID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "People Complication:[%@] no storeBackedContactID defaulting to[%@]", (uint8_t *)&v4, 0x16u);
}

- (void)_complicationTypeString
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKPeopleComplication invalid complicationType.", v1, 2u);
}

@end