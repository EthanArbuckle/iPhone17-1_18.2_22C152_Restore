@interface BCCacheProductProfiles
- (BCCacheProductProfiles)init;
- (BUCoalescingCallBlock)coalescedFetch;
- (NSMutableDictionary)completions;
- (NSMutableSet)profilesToFetch;
- (id)describedImagesFromProductProfile:(id)a3;
- (os_unfair_lock_s)accessLock;
- (void)_fetchedProfile:(id)a3 withIdentifier:(id)a4;
- (void)batchFetchCoverURLsFor:(id)a3 completion:(id)a4;
- (void)fetchCoverURLsFor:(id)a3 immediately:(BOOL)a4 completion:(id)a5;
- (void)performFetch:(id)a3;
- (void)setAccessLock:(os_unfair_lock_s)a3;
- (void)setCoalescedFetch:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setProfilesToFetch:(id)a3;
@end

@implementation BCCacheProductProfiles

- (BCCacheProductProfiles)init
{
  v15.receiver = self;
  v15.super_class = (Class)BCCacheProductProfiles;
  v2 = [(BCCacheProductProfiles *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    completions = v3->_completions;
    v3->_completions = (NSMutableDictionary *)v4;

    uint64_t v6 = +[NSMutableSet set];
    profilesToFetch = v3->_profilesToFetch;
    v3->_profilesToFetch = (NSMutableSet *)v6;

    id v8 = objc_alloc((Class)BUCoalescingCallBlock);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_6D54;
    v13[3] = &unk_2C3A18;
    v9 = v3;
    v14 = v9;
    id v10 = [v8 initWithNotifyBlock:v13 blockDescription:@"BCCacheProductProfiles"];
    id v11 = v9[4];
    v9[4] = v10;

    [v9[4] setCoalescingDelay:0.2];
    [v9[4] setMaximumDelay:0.4];
  }
  return v3;
}

- (void)fetchCoverURLsFor:(id)a3 immediately:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7078;
  v13[3] = &unk_2C3A40;
  void v13[4] = self;
  id v10 = v8;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  os_unfair_lock_lock(&self->_accessLock);
  sub_7078((uint64_t)v13);
  os_unfair_lock_unlock(&self->_accessLock);
  if (v6)
  {
    v12 = +[NSMutableSet setWithObject:v10];
    [(BCCacheProductProfiles *)self performFetch:v12];
  }
  else
  {
    v12 = [(BCCacheProductProfiles *)self coalescedFetch];
    [v12 signalWithCompletion:&stru_2C3A80];
  }
}

- (id)describedImagesFromProductProfile:(id)a3
{
  return &__NSArray0__struct;
}

- (void)batchFetchCoverURLsFor:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[AEUserPublishing sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7240;
  v10[3] = &unk_2C3AA8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 profilesForStoreIDs:v9 keyProfile:@"kAEUserPublishingLookProfileProduct" completion:v10];
}

- (void)_fetchedProfile:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_6EA8;
  v31 = sub_6EB8;
  id v32 = 0;
  p_accessLock = &self->_accessLock;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v22 = sub_776C;
  v23 = &unk_2C3AD0;
  v26 = &v27;
  v24 = self;
  id v8 = a4;
  id v25 = v8;
  id v9 = v21;
  os_unfair_lock_lock(p_accessLock);
  v22((uint64_t)v9);
  os_unfair_lock_unlock(p_accessLock);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = (id)v28[5];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v13);
        id v15 = [v6 expiration:v17];
        v16 = [v6 error];
        (*(void (**)(uint64_t, id, void *, void *))(v14 + 16))(v14, v6, v15, v16);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v33 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v27, 8);
}

- (void)performFetch:(id)a3
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_6EA8;
  v21 = sub_6EB8;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_79D0;
  uint64_t v14 = &unk_2C39F0;
  v16 = &v17;
  id v4 = a3;
  id v15 = v4;
  id v5 = v12;
  os_unfair_lock_lock(&self->_accessLock);
  v13((uint64_t)v5);
  os_unfair_lock_unlock(&self->_accessLock);

  id v6 = +[AEUserPublishing sharedInstance];
  uint64_t v7 = v18[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7A1C;
  v9[3] = &unk_2C3B48;
  id v11 = &v17;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  [v6 profilesForStoreIDs:v7 keyProfile:@"kAEUserPublishingLookProfileProduct" completion:v9];

  _Block_object_dispose(&v17, 8);
}

- (NSMutableDictionary)completions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableSet)profilesToFetch
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProfilesToFetch:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedFetch
{
  return (BUCoalescingCallBlock *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCoalescedFetch:(id)a3
{
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedFetch, 0);
  objc_storeStrong((id *)&self->_profilesToFetch, 0);

  objc_storeStrong((id *)&self->_completions, 0);
}

@end