@interface NTKPeopleComplicationContactsCache
+ (id)sharedCache;
- (BOOL)checkValidityOfContact:(id)a3 block:(id)a4;
- (BOOL)contactIdentifierIsFavorited:(id)a3;
- (NTKPeopleComplicationContactsCache)init;
- (id)_contactKeysToFetchWithThumbnail;
- (id)_contactKeysToFetchWithoutThumbnail;
- (id)_favoritesMappingLocked;
- (id)_fetchContactForId:(id)a3;
- (id)_fetchMyCard;
- (id)_mappedFavoriteContacts;
- (id)abbreviatedNameForContact:(id)a3;
- (id)computeNonFavoriteAllContactsWithCount:(unint64_t)a3;
- (id)contactForId:(id)a3;
- (id)favoriteContacts;
- (id)firstNonFavoriteAllContact;
- (id)fullNameForContact:(id)a3;
- (id)myCard;
- (id)nonFavoriteAllContactsWithCount:(unint64_t)a3;
- (id)shortNameForContact:(id)a3;
- (void)_didReceiveContactStoreChangedNotification;
- (void)_didReceiveDeviceLockStateDidChangeNotification;
- (void)_didReceiveFavoritesChangeRelatedNotification;
- (void)_favoritesEntriesChangedExternally;
- (void)_fetchMyCard;
- (void)_locked_createFavorites;
- (void)_mappedFavoriteContacts;
- (void)_queue_findContactWithFullName:(id)a3 block:(id)a4;
- (void)_queue_flushCNFavoritesReload;
- (void)_queue_reloadContacts;
- (void)_queued_flushCNFavorites;
- (void)_queued_loadAllContacts;
- (void)_queued_loadFavoriteContacts;
- (void)_queued_loadMyCard;
- (void)_setupNotifications;
- (void)_tearDownNotifications;
- (void)dealloc;
- (void)findContactWithFullName:(id)a3 block:(id)a4;
- (void)setupNotificationsIfNecessary;
@end

@implementation NTKPeopleComplicationContactsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_3 != -1) {
    dispatch_once(&sharedCache_onceToken_3, &__block_literal_global_139);
  }
  v2 = (void *)sharedCache_cache_0;
  return v2;
}

void __49__NTKPeopleComplicationContactsCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(NTKPeopleComplicationContactsCache);
  v1 = (void *)sharedCache_cache_0;
  sharedCache_cache_0 = (uint64_t)v0;
}

- (NTKPeopleComplicationContactsCache)init
{
  v21.receiver = self;
  v21.super_class = (Class)NTKPeopleComplicationContactsCache;
  v2 = [(NTKPeopleComplicationContactsCache *)&v21 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    favoritesMappingLock = v2->_favoritesMappingLock;
    v2->_favoritesMappingLock = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    favoritesEntriesLock = v2->_favoritesEntriesLock;
    v2->_favoritesEntriesLock = v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    allContactsEntriesLock = v2->_allContactsEntriesLock;
    v2->_allContactsEntriesLock = v7;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    myCardEntryLock = v2->_myCardEntryLock;
    v2->_myCardEntryLock = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    hasSetupNotificationsLock = v2->_hasSetupNotificationsLock;
    v2->_hasSetupNotificationsLock = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1B990]);
    v14 = (void *)tcc_identity_create();
    [v13 setAssumedIdentity:v14];

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v13];
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v15;

    [(NTKPeopleComplicationContactsCache *)v2 _locked_createFavorites];
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v18 = dispatch_queue_create("loadFavoritesQueueIdentifier", v17);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v18;
  }
  return v2;
}

- (void)dealloc
{
  [(NTKPeopleComplicationContactsCache *)self _tearDownNotifications];
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationContactsCache;
  [(NTKPeopleComplicationContactsCache *)&v3 dealloc];
}

- (void)setupNotificationsIfNecessary
{
  [(NSLock *)self->_hasSetupNotificationsLock lock];
  BOOL hasSetupNotifications = self->_hasSetupNotifications;
  [(NSLock *)self->_hasSetupNotificationsLock unlock];
  if (!hasSetupNotifications)
  {
    [(NTKPeopleComplicationContactsCache *)self _setupNotifications];
    [(NSLock *)self->_hasSetupNotificationsLock lock];
    self->_BOOL hasSetupNotifications = 1;
    hasSetupNotificationsLock = self->_hasSetupNotificationsLock;
    [(NSLock *)hasSetupNotificationsLock unlock];
  }
}

- (id)myCard
{
  [(NTKPeopleComplicationContactsCache *)self setupNotificationsIfNecessary];
  [(NSLock *)self->_myCardEntryLock lock];
  myCard = self->_myCard;
  if (!myCard)
  {
    v4 = [(NTKPeopleComplicationContactsCache *)self _fetchMyCard];
    v5 = self->_myCard;
    self->_myCard = v4;

    myCard = self->_myCard;
  }
  v6 = myCard;
  [(NSLock *)self->_myCardEntryLock unlock];
  return v6;
}

- (id)favoriteContacts
{
  [(NTKPeopleComplicationContactsCache *)self setupNotificationsIfNecessary];
  [(NSLock *)self->_favoritesMappingLock lock];
  id v3 = [(NTKPeopleComplicationContactsCache *)self _favoritesMappingLocked];
  v4 = [(NSDictionary *)self->_favoritesMapping allValues];
  [(NSLock *)self->_favoritesMappingLock unlock];
  return v4;
}

- (id)_favoritesMappingLocked
{
  p_favoritesMapping = &self->_favoritesMapping;
  favoritesMapping = self->_favoritesMapping;
  if (!favoritesMapping)
  {
    [(NSLock *)self->_favoritesMappingLock unlock];
    v5 = [(NTKPeopleComplicationContactsCache *)self _mappedFavoriteContacts];
    [(NSLock *)self->_favoritesMappingLock lock];
    if (!self->_favoritesMapping) {
      objc_storeStrong((id *)p_favoritesMapping, v5);
    }

    favoritesMapping = *p_favoritesMapping;
  }
  return favoritesMapping;
}

- (id)firstNonFavoriteAllContact
{
  [(NSLock *)self->_allContactsEntriesLock lock];
  nonFavoriteValidAllContacts = self->_nonFavoriteValidAllContacts;
  if (!nonFavoriteValidAllContacts || ![(NSArray *)nonFavoriteValidAllContacts count])
  {
    v4 = [(NTKPeopleComplicationContactsCache *)self computeNonFavoriteAllContactsWithCount:1];
    v5 = self->_nonFavoriteValidAllContacts;
    self->_nonFavoriteValidAllContacts = v4;
  }
  v6 = [(NSArray *)self->_nonFavoriteValidAllContacts firstObject];
  [(NSLock *)self->_allContactsEntriesLock unlock];
  return v6;
}

- (id)nonFavoriteAllContactsWithCount:(unint64_t)a3
{
  [(NTKPeopleComplicationContactsCache *)self setupNotificationsIfNecessary];
  [(NSLock *)self->_allContactsEntriesLock lock];
  nonFavoriteValidAllContacts = self->_nonFavoriteValidAllContacts;
  if (!nonFavoriteValidAllContacts || [(NSArray *)nonFavoriteValidAllContacts count] < a3)
  {
    v6 = [(NTKPeopleComplicationContactsCache *)self computeNonFavoriteAllContactsWithCount:a3];
    v7 = self->_nonFavoriteValidAllContacts;
    self->_nonFavoriteValidAllContacts = v6;
  }
  v8 = (void *)[(NSArray *)self->_nonFavoriteValidAllContacts copy];
  [(NSLock *)self->_allContactsEntriesLock unlock];
  return v8;
}

- (id)shortNameForContact:(id)a3
{
  uint64_t v3 = shortNameForContact__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shortNameForContact__onceToken, &__block_literal_global_10_0);
  }
  [(id)shortNameForContact__nameFormatterLock lock];
  v5 = [(id)shortNameForContact__nameFormatter stringFromContact:v4];

  [(id)shortNameForContact__nameFormatterLock unlock];
  return v5;
}

uint64_t __58__NTKPeopleComplicationContactsCache_shortNameForContact___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)shortNameForContact__nameFormatterLock;
  shortNameForContact__nameFormatterLock = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)shortNameForContact__nameFormatter;
  shortNameForContact__nameFormatter = v2;

  id v4 = (void *)shortNameForContact__nameFormatter;
  return [v4 setStyle:1000];
}

- (id)fullNameForContact:(id)a3
{
  uint64_t v3 = fullNameForContact__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&fullNameForContact__onceToken, &__block_literal_global_13_1);
  }
  [(id)fullNameForContact__nameFormatterLock lock];
  v5 = [(id)fullNameForContact__nameFormatter stringFromContact:v4];

  [(id)fullNameForContact__nameFormatterLock unlock];
  return v5;
}

uint64_t __57__NTKPeopleComplicationContactsCache_fullNameForContact___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)fullNameForContact__nameFormatterLock;
  fullNameForContact__nameFormatterLock = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)fullNameForContact__nameFormatter;
  fullNameForContact__nameFormatter = v2;

  id v4 = (void *)fullNameForContact__nameFormatter;
  return [v4 setStyle:0];
}

- (id)abbreviatedNameForContact:(id)a3
{
  id v4 = a3;
  if (abbreviatedNameForContact__onceToken != -1) {
    dispatch_once(&abbreviatedNameForContact__onceToken, &__block_literal_global_15_0);
  }
  [(id)abbreviatedNameForContact__nameFormatterLock lock];
  v5 = [(id)abbreviatedNameForContact__nameFormatter stringFromContact:v4];
  [(id)abbreviatedNameForContact__nameFormatterLock unlock];
  if (!v5)
  {
    v6 = [v4 givenName];
    if (![v6 isEqualToString:&stru_1F1635E90]) {
      goto LABEL_8;
    }
    v7 = [v4 familyName];
    int v8 = [v7 isEqualToString:&stru_1F1635E90];

    if (v8)
    {
      v6 = [(NTKPeopleComplicationContactsCache *)self fullNameForContact:v4];
      if ([v6 length] && (CNStringContainsNonLatinCharacters() & 1) == 0)
      {
        unint64_t v10 = [v6 length];
        if (v10 >= 2) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = v10;
        }
        uint64_t v12 = objc_msgSend(v6, "rangeOfComposedCharacterSequencesForRange:", 0, v11);
        v14 = objc_msgSend(v6, "substringWithRange:", v12, v13);
        uint64_t v15 = [MEMORY[0x1E4F1CA20] currentLocale];
        v5 = [v14 uppercaseStringWithLocale:v15];

        goto LABEL_9;
      }
LABEL_8:
      v5 = 0;
LABEL_9:

      goto LABEL_11;
    }
    v5 = 0;
  }
LABEL_11:

  return v5;
}

uint64_t __64__NTKPeopleComplicationContactsCache_abbreviatedNameForContact___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)abbreviatedNameForContact__nameFormatterLock;
  abbreviatedNameForContact__nameFormatterLock = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)abbreviatedNameForContact__nameFormatter;
  abbreviatedNameForContact__nameFormatter = v2;

  id v4 = (void *)abbreviatedNameForContact__nameFormatter;
  return [v4 setStyle:1002];
}

- (BOOL)checkValidityOfContact:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void *, __CFString *, uint64_t))a4;
  int v8 = [(NTKPeopleComplicationContactsCache *)self fullNameForContact:v6];
  v9 = [(NTKPeopleComplicationContactsCache *)self abbreviatedNameForContact:v6];
  uint64_t v10 = [(NTKPeopleComplicationContactsCache *)self shortNameForContact:v6];
  uint64_t v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = !v12;
  if (v12)
  {
    uint64_t v15 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NTKPeopleComplicationContactsCache checkValidityOfContact:block:]();
    }
  }
  else
  {
    if (v9) {
      v14 = v9;
    }
    else {
      v14 = &stru_1F1635E90;
    }
    v7[2](v7, v6, v8, v14, v10);
  }

  return v13;
}

- (id)contactForId:(id)a3
{
  id v4 = a3;
  [(NTKPeopleComplicationContactsCache *)self setupNotificationsIfNecessary];
  v5 = [MEMORY[0x1E4F19A30] currentDevice];
  int v6 = [v5 isLocked];

  if (v6)
  {
    v7 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NTKPeopleComplicationContactsCache contactForId:](v7);
    }

    int v8 = 0;
  }
  else
  {
    [(NSLock *)self->_favoritesMappingLock lock];
    v9 = [(NTKPeopleComplicationContactsCache *)self _favoritesMappingLocked];
    int v8 = [v9 objectForKeyedSubscript:v4];
    [(NSLock *)self->_favoritesMappingLock unlock];
    if (!v8)
    {
      int v8 = [(NTKPeopleComplicationContactsCache *)self _fetchContactForId:v4];
    }
  }
  return v8;
}

- (void)findContactWithFullName:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__NTKPeopleComplicationContactsCache_findContactWithFullName_block___block_invoke;
  v11[3] = &unk_1E62C84B8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __68__NTKPeopleComplicationContactsCache_findContactWithFullName_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_findContactWithFullName:block:", *(void *)(a1 + 32), *(void *)(a1 + 40));
    id WeakRetained = v3;
  }
}

- (BOOL)contactIdentifierIsFavorited:(id)a3
{
  favoritesMappingLock = self->_favoritesMappingLock;
  id v5 = a3;
  [(NSLock *)favoritesMappingLock lock];
  id v6 = [(NTKPeopleComplicationContactsCache *)self _favoritesMappingLocked];
  id v7 = [v6 objectForKeyedSubscript:v5];

  [(NSLock *)self->_favoritesMappingLock unlock];
  return v7 != 0;
}

- (id)_contactKeysToFetchWithThumbnail
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NTKPeopleComplicationContactsCache__contactKeysToFetchWithThumbnail__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (_contactKeysToFetchWithThumbnail_onceToken != -1) {
    dispatch_once(&_contactKeysToFetchWithThumbnail_onceToken, block);
  }
  return (id)_contactKeysToFetchWithThumbnail_keysToFetch;
}

void __70__NTKPeopleComplicationContactsCache__contactKeysToFetchWithThumbnail__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _contactKeysToFetchWithoutThumbnail];
  uint64_t v1 = [v3 arrayByAddingObject:*MEMORY[0x1E4F1AF98]];
  uint64_t v2 = (void *)_contactKeysToFetchWithThumbnail_keysToFetch;
  _contactKeysToFetchWithThumbnail_keysToFetch = v1;
}

- (id)_contactKeysToFetchWithoutThumbnail
{
  if (_contactKeysToFetchWithoutThumbnail_onceToken != -1) {
    dispatch_once(&_contactKeysToFetchWithoutThumbnail_onceToken, &__block_literal_global_23);
  }
  uint64_t v2 = (void *)_contactKeysToFetchWithoutThumbnail_keysToFetch;
  return v2;
}

void __73__NTKPeopleComplicationContactsCache__contactKeysToFetchWithoutThumbnail__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v1 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1002];
  uint64_t v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
  v5[0] = v1;
  v5[1] = v0;
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  id v4 = (void *)_contactKeysToFetchWithoutThumbnail_keysToFetch;
  _contactKeysToFetchWithoutThumbnail_keysToFetch = v3;
}

- (id)_fetchContactForId:(id)a3
{
  contactStore = self->_contactStore;
  id v5 = a3;
  id v6 = [(NTKPeopleComplicationContactsCache *)self _contactKeysToFetchWithThumbnail];
  id v13 = 0;
  id v7 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v5 keysToFetch:v6 error:&v13];

  id v8 = v13;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    id v10 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NTKPeopleComplicationContactsCache _fetchContactForId:]();
    }

    id v11 = 0;
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

- (id)_mappedFavoriteContacts
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F19A30] currentDevice];
  int v4 = [v3 isLocked];

  if (v4)
  {
    id v5 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NTKPeopleComplicationContactsCache _mappedFavoriteContacts](v5);
    }
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSLock *)self->_favoritesEntriesLock lock];
    id v7 = [(CNFavorites *)self->_favorites entries];
    id v8 = (void *)[v7 copy];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v8;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v25;
      *(void *)&long long v10 = 138412290;
      long long v23 = v10;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v5);
          }
          id v14 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "contactProperty", v23, (void)v24);
          uint64_t v15 = [v14 contact];
          v16 = v15;
          if (v15)
          {
            v17 = [v15 identifier];
            dispatch_queue_t v18 = [(NTKPeopleComplicationContactsCache *)self _fetchContactForId:v17];

            if (!v18)
            {
              v19 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v20 = [0 identifier];
                *(_DWORD *)buf = v23;
                v29 = v20;
                _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "favorite[%@] not linked to database so reverting to favorite.", buf, 0xCu);
              }
              dispatch_queue_t v18 = [v16 copy];
            }
            objc_super v21 = [v18 identifier];
            [v6 setObject:v18 forKeyedSubscript:v21];
          }
          else
          {
            dispatch_queue_t v18 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "Missing contact property in favorite entry so skipping.", buf, 2u);
            }
          }
        }
        uint64_t v11 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v11);
    }

    [(NSLock *)self->_favoritesEntriesLock unlock];
  }

  return v6;
}

- (id)_fetchMyCard
{
  contactStore = self->_contactStore;
  uint64_t v3 = [(NTKPeopleComplicationContactsCache *)self _contactKeysToFetchWithoutThumbnail];
  id v8 = 0;
  int v4 = [(CNContactStore *)contactStore _crossPlatformUnifiedMeContactWithKeysToFetch:v3 error:&v8];
  id v5 = v8;

  if (v5)
  {
    id v6 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NTKPeopleComplicationContactsCache _fetchMyCard]();
    }
  }
  return v4;
}

- (id)computeNonFavoriteAllContactsWithCount:(unint64_t)a3
{
  id v5 = [(NTKPeopleComplicationContactsCache *)self _contactKeysToFetchWithoutThumbnail];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v5];
  [v6 setSortOrder:1];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(NTKPeopleComplicationContactsCache *)self favoriteContacts];
  contactStore = self->_contactStore;
  id v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke;
  v16[3] = &unk_1E62C8508;
  id v10 = v8;
  id v17 = v10;
  dispatch_queue_t v18 = self;
  id v11 = (id)v7;
  id v19 = v11;
  unint64_t v20 = a3;
  LOBYTE(v7) = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v6 error:&v21 usingBlock:v16];
  id v12 = v21;
  if ((v7 & 1) == 0)
  {
    id v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NTKPeopleComplicationContactsCache computeNonFavoriteAllContactsWithCount:]();
    }
  }
  id v14 = (void *)[v11 copy];

  return v14;
}

void __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke_2;
    v7[3] = &unk_1E62C84E0;
    id v6 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    [v6 checkValidityOfContact:v5 block:v7];
  }
  *a3 = (unint64_t)[*(id *)(a1 + 48) count] >= *(void *)(a1 + 56);
}

uint64_t __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_queue_reloadContacts
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F19A30] currentDevice];
  int v4 = [v3 isLocked];

  if (v4)
  {
    id v5 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ skipping reload due to device being locked.", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NTKPeopleComplicationContactsCache__queue_reloadContacts__block_invoke;
    block[3] = &unk_1E62BFF20;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __59__NTKPeopleComplicationContactsCache__queue_reloadContacts__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queued_loadMyCard");
  objc_msgSend(*(id *)(a1 + 32), "_queued_loadFavoriteContacts");
  objc_msgSend(*(id *)(a1 + 32), "_queued_loadAllContacts");
  uint64_t v2 = MEMORY[0x1E4F14428];
  dispatch_async(v2, &__block_literal_global_31);
}

void __59__NTKPeopleComplicationContactsCache__queue_reloadContacts__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"NTKPeopleComplicationContactsCacheDidChangeNotification" object:0];
}

- (void)_queue_flushCNFavoritesReload
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__NTKPeopleComplicationContactsCache__queue_flushCNFavoritesReload__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(queue, block);
}

void __67__NTKPeopleComplicationContactsCache__queue_flushCNFavoritesReload__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_queued_flushCNFavorites");
  uint64_t v2 = [MEMORY[0x1E4F19A30] currentDevice];
  char v3 = [v2 isLocked];

  if (v3)
  {
    int v4 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "%@ skipping reload due to device being locked.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queued_loadFavoriteContacts");
    uint64_t v7 = MEMORY[0x1E4F14428];
    dispatch_async(v7, &__block_literal_global_34);
  }
}

void __67__NTKPeopleComplicationContactsCache__queue_flushCNFavoritesReload__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"NTKPeopleComplicationContactsCacheDidChangeNotification" object:0];
}

- (void)_locked_createFavorites
{
  char v3 = (CNFavorites *)[objc_alloc(MEMORY[0x1E4F1B9E8]) initWithContactStore:self->_contactStore];
  favorites = self->_favorites;
  self->_favorites = v3;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v6 = self->_favorites;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1AFE8];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v6, v7, 0);
}

- (void)_queued_flushCNFavorites
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSLock *)self->_favoritesEntriesLock lock];
  favorites = self->_favorites;
  self->_favorites = 0;

  [(NTKPeopleComplicationContactsCache *)self _locked_createFavorites];
  [(NSLock *)self->_favoritesEntriesLock unlock];
  [(NSLock *)self->_favoritesMappingLock lock];
  favoritesMapping = self->_favoritesMapping;
  self->_favoritesMapping = 0;

  favoritesMappingLock = self->_favoritesMappingLock;
  [(NSLock *)favoritesMappingLock unlock];
}

- (void)_queued_loadMyCard
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSLock *)self->_myCardEntryLock lock];
  char v3 = [(NTKPeopleComplicationContactsCache *)self _fetchMyCard];
  myCard = self->_myCard;
  self->_myCard = v3;

  myCardEntryLock = self->_myCardEntryLock;
  [(NSLock *)myCardEntryLock unlock];
}

- (void)_queued_loadFavoriteContacts
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v3 = [(NTKPeopleComplicationContactsCache *)self _mappedFavoriteContacts];
  [(NSLock *)self->_favoritesMappingLock lock];
  favoritesMapping = self->_favoritesMapping;
  self->_favoritesMapping = v3;
  id v5 = v3;

  [(NSLock *)self->_favoritesMappingLock unlock];
}

- (void)_queued_loadAllContacts
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSLock *)self->_allContactsEntriesLock lock];
  NSUInteger v3 = [(NSArray *)self->_nonFavoriteValidAllContacts count];
  if (v3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  [(NSLock *)self->_allContactsEntriesLock unlock];
  id v5 = [(NTKPeopleComplicationContactsCache *)self computeNonFavoriteAllContactsWithCount:v4];
  [(NSLock *)self->_allContactsEntriesLock lock];
  nonFavoriteValidAllContacts = self->_nonFavoriteValidAllContacts;
  self->_nonFavoriteValidAllContacts = v5;
  CFStringRef v7 = v5;

  [(NSLock *)self->_allContactsEntriesLock unlock];
}

- (void)_queue_findContactWithFullName:(id)a3 block:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFStringRef v7 = (void (**)(id, void))a4;
  [(NSLock *)self->_favoritesEntriesLock lock];
  int v8 = [(CNFavorites *)self->_favorites entries];
  uint64_t v9 = (void *)[v8 copy];

  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__42;
  v30 = __Block_byref_object_dispose__42;
  id v31 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__NTKPeopleComplicationContactsCache__queue_findContactWithFullName_block___block_invoke;
  v23[3] = &unk_1E62C8530;
  v23[4] = self;
  id v10 = v6;
  id v24 = v10;
  long long v25 = &v26;
  [v9 enumerateObjectsUsingBlock:v23];
  [(NSLock *)self->_favoritesEntriesLock unlock];
  uint64_t v11 = v27[5];
  if (!v11)
  {
    uint64_t v12 = [(NTKPeopleComplicationContactsCache *)self _contactKeysToFetchWithThumbnail];
    contactStore = self->_contactStore;
    id v14 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v10];
    id v22 = 0;
    uint64_t v15 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v14 keysToFetch:v12 error:&v22];
    id v16 = v22;
    uint64_t v17 = [v15 firstObject];
    dispatch_queue_t v18 = (void *)v27[5];
    v27[5] = v17;

    if (v27[5])
    {
      id v19 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = [(id)v27[5] identifier];
        uint64_t v21 = v27[5];
        *(_DWORD *)buf = 138412802;
        id v33 = v10;
        __int16 v34 = 2112;
        v35 = v20;
        __int16 v36 = 2112;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplicationContactsCache _queue_findContactWithFullName found all contacts for name[%@] with id[%@] [%@]", buf, 0x20u);
      }
    }

    uint64_t v11 = v27[5];
  }
  v7[2](v7, v11);

  _Block_object_dispose(&v26, 8);
}

void __75__NTKPeopleComplicationContactsCache__queue_findContactWithFullName_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = [a2 contactProperty];
  CFStringRef v7 = *(void **)(a1 + 32);
  int v8 = [v6 contact];
  uint64_t v9 = [v7 fullNameForContact:v8];

  if ([*(id *)(a1 + 40) isEqualToString:v9])
  {
    uint64_t v10 = [v6 contact];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
    id v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v17 = 138412802;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      unint64_t v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplicationContactsCache _queue_findContactWithFullName found favorite contact matching name[%@] with id[%@] [%@]", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (void)_setupNotifications
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__didReceiveContactStoreChangedNotification name:*MEMORY[0x1E4F1AF80] object:0];
  [v3 addObserver:self selector:sel__didReceiveFavoritesChangeRelatedNotification name:*MEMORY[0x1E4F1AFF0] object:0];
  uint64_t v4 = +[NTKDarwinNotificationCenter defaultCenter];
  [v4 addObserver:self notificationName:*MEMORY[0x1E4F1AFE8] selector:sel__favoritesEntriesChangedExternally];

  id v5 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    CFStringRef v7 = NSStringFromClass(v6);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ _setupNotifications and addObserver", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_tearDownNotifications
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = +[NTKDarwinNotificationCenter defaultCenter];
  [v4 removeObserver:self notificationName:*MEMORY[0x1E4F1AFE8]];

  id v5 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    CFStringRef v7 = NSStringFromClass(v6);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ _tearDownNotifications and removeObserver", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_didReceiveContactStoreChangedNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveContactStoreChangedNotification", (uint8_t *)&v6, 0xCu);
  }
  [(NTKPeopleComplicationContactsCache *)self _queue_reloadContacts];
}

- (void)_didReceiveFavoritesChangeRelatedNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveFavoritesChangeRelatedNotification", (uint8_t *)&v6, 0xCu);
  }
  [(NTKPeopleComplicationContactsCache *)self _queue_reloadContacts];
}

- (void)_didReceiveDeviceLockStateDidChangeNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveDeviceLockStateDidChangeNotification", (uint8_t *)&v6, 0xCu);
  }
  [(NTKPeopleComplicationContactsCache *)self _queue_reloadContacts];
}

- (void)_favoritesEntriesChangedExternally
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ _favoritesEntriesChangedExternally", (uint8_t *)&v6, 0xCu);
  }
  [(NTKPeopleComplicationContactsCache *)self _queue_flushCNFavoritesReload];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nonFavoriteValidAllContacts, 0);
  objc_storeStrong((id *)&self->_myCard, 0);
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_hasSetupNotificationsLock, 0);
  objc_storeStrong((id *)&self->_myCardEntryLock, 0);
  objc_storeStrong((id *)&self->_allContactsEntriesLock, 0);
  objc_storeStrong((id *)&self->_favoritesEntriesLock, 0);
  objc_storeStrong((id *)&self->_favoritesMappingLock, 0);
  objc_storeStrong((id *)&self->_favoritesMapping, 0);
}

- (void)checkValidityOfContact:block:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1BC5A9000, v1, OS_LOG_TYPE_ERROR, "People Complication: Missing names in contacts: %@ %@", v2, 0x16u);
}

- (void)contactForId:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "People Complication: Cannot retreive contact for id because device is locked.", v1, 2u);
}

- (void)_fetchContactForId:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "People Complication: Failed to load contact with error: %@", v2, v3, v4, v5, v6);
}

- (void)_mappedFavoriteContacts
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "People Complication: Cannot _loadFavoriteContacts becuase device is locked.", v1, 2u);
}

- (void)_fetchMyCard
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Failed to fetch my card: %@", v2, v3, v4, v5, v6);
}

- (void)computeNonFavoriteAllContactsWithCount:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Failed to enumerate All Contacts: %@", v2, v3, v4, v5, v6);
}

@end