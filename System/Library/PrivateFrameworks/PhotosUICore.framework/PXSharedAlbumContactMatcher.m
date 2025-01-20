@interface PXSharedAlbumContactMatcher
+ (id)sharedMatcher;
- (PXSharedAlbumContactMatcher)init;
- (id)_fetchContactMatchingIdentifier:(id)a3 keysToFetch:(id)a4;
- (id)_fetchContactMatchingSubscriberInfo:(id)a3 keysToFetch:(id)a4;
- (id)_fetchContactsMatchingIdentifiers:(id)a3 keysToFetch:(id)a4;
- (id)contactsMatchingSubscriberInfos:(id)a3 keysToFetch:(id)a4;
- (void)_observeContactStoreNotifications;
- (void)contactsDidChange:(id)a3;
- (void)requestContactPhotoForContact:(id)a3 diameter:(double)a4 resultHandler:(id)a5;
@end

@implementation PXSharedAlbumContactMatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPhotosCache, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersBySubscriberIdentifiers, 0);
  objc_storeStrong((id *)&self->_avatarRendererByContactImageDiameter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)contactsDidChange:(id)a3
{
  [(NSCache *)self->_contactIdentifiersBySubscriberIdentifiers removeAllObjects];
  contactPhotosCache = self->_contactPhotosCache;
  [(NSCache *)contactPhotosCache removeAllObjects];
}

- (id)_fetchContactMatchingSubscriberInfo:(id)a3 keysToFetch:(id)a4
{
  return (id)[a3 matchingContactWithKeysToFetch:a4 outMatchingKey:0 outMatchingIdentifier:0];
}

- (id)_fetchContactsMatchingIdentifiers:(id)a3 keysToFetch:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F1B8F8];
  id v7 = a4;
  v8 = [v6 predicateForContactsWithIdentifiers:a3];
  contactStore = self->_contactStore;
  id v14 = 0;
  v10 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v8 keysToFetch:v7 error:&v14];

  id v11 = v14;
  if (v11)
  {
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[PXSharedAlbumContactMatcher _fetchContactsMatchingIdentifiers:keysToFetch:]";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "%s: Error while fetching contacts: %@", buf, 0x16u);
    }
  }
  return v10;
}

- (id)_fetchContactMatchingIdentifier:(id)a3 keysToFetch:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  contactStore = self->_contactStore;
  id v9 = 0;
  v5 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:a3 keysToFetch:a4 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[PXSharedAlbumContactMatcher _fetchContactMatchingIdentifier:keysToFetch:]";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "%s: Error while fetching contact: %@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)requestContactPhotoForContact:(id)a3 diameter:(double)a4 resultHandler:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  v10 = [v8 identifier];
  id v11 = objc_msgSend(v10, "stringByAppendingFormat:", @"-%d", (uint64_t)a4);

  __int16 v12 = [(NSCache *)self->_contactPhotosCache objectForKey:v11];
  if (v12)
  {
    v9[2](v9, v12);
  }
  else
  {
    id v13 = [NSNumber numberWithInteger:(uint64_t)a4];
    uint64_t v14 = [(NSCache *)self->_avatarRendererByContactImageDiameter objectForKey:v13];
    if (!v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1BB20]);
      v16 = [MEMORY[0x1E4F1BB28] defaultSettings];
      uint64_t v14 = (void *)[v15 initWithSettings:v16];

      [(NSCache *)self->_avatarRendererByContactImageDiameter setObject:v14 forKey:v13];
    }
    __int16 v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    double v19 = v18;

    v20 = [MEMORY[0x1E4FB1438] sharedApplication];
    BOOL v21 = [v20 userInterfaceLayoutDirection] == 1;

    v22 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v21, 0, a4, a4, v19);
    v28[0] = v8;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __84__PXSharedAlbumContactMatcher_requestContactPhotoForContact_diameter_resultHandler___block_invoke;
    v25[3] = &unk_1E5DB1738;
    v25[4] = self;
    id v26 = v11;
    v27 = v9;
    id v24 = (id)[v14 renderAvatarsForContacts:v23 scope:v22 imageHandler:v25];
  }
}

void __84__PXSharedAlbumContactMatcher_requestContactPhotoForContact_diameter_resultHandler___block_invoke(void *a1, id a2)
{
  id v5 = a2;
  v3 = (CGImage *)[v5 CGImage];
  size_t Height = CGImageGetHeight(v3);
  [*(id *)(a1[4] + 32) setObject:v5 forKey:a1[5] cost:CGImageGetBytesPerRow(v3) * Height];
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)contactsMatchingSubscriberInfos:(id)a3 keysToFetch:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v47 = a4;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v59 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v14 = [v13 identifier];
        if (v14)
        {
          id v15 = [(NSCache *)self->_contactIdentifiersBySubscriberIdentifiers objectForKey:v14];
          v16 = v15;
          if (v15) {
            BOOL v17 = v15 == @"PXSharedAlbumContactNotFoundIdentifier";
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            [v6 addObject:v15];
            [v7 addObject:v13];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v10);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v19 = self;
  v43 = v6;
  v20 = [(PXSharedAlbumContactMatcher *)self _fetchContactsMatchingIdentifiers:v6 keysToFetch:v47];
  uint64_t v21 = [v7 count];
  if (v21 == [v20 count])
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __75__PXSharedAlbumContactMatcher_contactsMatchingSubscriberInfos_keysToFetch___block_invoke;
    v54[3] = &unk_1E5DB1710;
    id v55 = v18;
    id v56 = v7;
    id v57 = v20;
    [v57 enumerateObjectsUsingBlock:v54];
  }
  v41 = v20;
  v42 = v7;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v22 = v8;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v62 count:16];
  id v24 = v46;
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v49 = *(void *)v51;
    id v44 = v22;
    id v45 = v18;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v51 != v49) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        v28 = [v27 identifier];
        v29 = [v18 objectForKeyedSubscript:v28];
        v30 = [(NSCache *)v19->_contactIdentifiersBySubscriberIdentifiers objectForKey:v28];
        v31 = v30;
        if (v29)
        {
          [v24 addObject:v29];
        }
        else if (v30 != @"PXSharedAlbumContactNotFoundIdentifier")
        {
          v32 = [(PXSharedAlbumContactMatcher *)v19 _fetchContactMatchingSubscriberInfo:v27 keysToFetch:v47];
          if (v32) {
            [v24 addObject:v32];
          }
          contactIdentifiersBySubscriberIdentifiers = v19->_contactIdentifiersBySubscriberIdentifiers;
          uint64_t v34 = [v32 identifier];
          v35 = (void *)v34;
          if (v34) {
            v36 = (__CFString *)v34;
          }
          else {
            v36 = @"PXSharedAlbumContactNotFoundIdentifier";
          }
          v37 = [v27 identifier];
          v38 = contactIdentifiersBySubscriberIdentifiers;
          id v24 = v46;
          v39 = v36;
          double v19 = self;
          [(NSCache *)v38 setObject:v39 forKey:v37];

          id v22 = v44;
          id v18 = v45;
        }
      }
      uint64_t v25 = [v22 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v25);
  }

  return v24;
}

void __75__PXSharedAlbumContactMatcher_contactsMatchingSubscriberInfos_keysToFetch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  id v7 = [v6 identifier];
  [v5 setObject:v8 forKeyedSubscript:v7];
}

- (void)_observeContactStoreNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_contactsDidChange_ name:*MEMORY[0x1E4F1AF80] object:self->_contactStore];
}

- (PXSharedAlbumContactMatcher)init
{
  v12.receiver = self;
  v12.super_class = (Class)PXSharedAlbumContactMatcher;
  v2 = [(PXSharedAlbumContactMatcher *)&v12 init];
  if (v2)
  {
    id v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    contactIdentifiersBySubscriberIdentifiers = v2->_contactIdentifiersBySubscriberIdentifiers;
    v2->_contactIdentifiersBySubscriberIdentifiers = v3;

    id v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    contactPhotosCache = v2->_contactPhotosCache;
    v2->_contactPhotosCache = v5;

    [(NSCache *)v2->_contactPhotosCache setTotalCostLimit:0x200000];
    id v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    avatarRendererByContactImageDiameter = v2->_avatarRendererByContactImageDiameter;
    v2->_avatarRendererByContactImageDiameter = v7;

    uint64_t v9 = +[PXPeopleUtilities sharedContactStore];
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v9;

    [(PXSharedAlbumContactMatcher *)v2 _observeContactStoreNotifications];
  }
  return v2;
}

+ (id)sharedMatcher
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PXSharedAlbumContactMatcher_sharedMatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMatcher_onceToken != -1) {
    dispatch_once(&sharedMatcher_onceToken, block);
  }
  v2 = (void *)sharedMatcher_sharedMatcher;
  return v2;
}

void __44__PXSharedAlbumContactMatcher_sharedMatcher__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMatcher_sharedMatcher;
  sharedMatcher_sharedMatcher = (uint64_t)v1;
}

@end