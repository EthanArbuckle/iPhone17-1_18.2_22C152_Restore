@interface BEDocumentExternalLoadApprovalCache
+ (BEDocumentExternalLoadApprovalCache)sharedInstance;
- (BEDocumentExternalLoadApprovalCache)init;
- (BOOL)didApproveLoadingExternalContentForBookID:(id)a3;
- (BOOL)hasCachedLoadExternalContentApprovalForBookID:(id)a3;
- (id)cachedApprovalForBookID:(id)a3;
- (void)_accessCacheIvar:(id)a3;
- (void)_ensureCacheLoaded;
- (void)cachedApproval:(BOOL)a3 forBookID:(id)a4;
- (void)removeCachedDisapprovalForBookID:(id)a3;
@end

@implementation BEDocumentExternalLoadApprovalCache

+ (BEDocumentExternalLoadApprovalCache)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14D18;
  block[3] = &unk_3C07E0;
  block[4] = a1;
  if (qword_409B30 != -1) {
    dispatch_once(&qword_409B30, block);
  }
  v2 = (void *)qword_409B28;

  return (BEDocumentExternalLoadApprovalCache *)v2;
}

- (BEDocumentExternalLoadApprovalCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)BEDocumentExternalLoadApprovalCache;
  result = [(BEDocumentExternalLoadApprovalCache *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)hasCachedLoadExternalContentApprovalForBookID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(BEDocumentExternalLoadApprovalCache *)self cachedApprovalForBookID:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)didApproveLoadingExternalContentForBookID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(BEDocumentExternalLoadApprovalCache *)self cachedApprovalForBookID:v4];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)cachedApprovalForBookID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_14FC8;
  v15 = sub_14FD8;
  id v16 = 0;
  if ([v4 length])
  {
    [(BEDocumentExternalLoadApprovalCache *)self _ensureCacheLoaded];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_14FE0;
    v8[3] = &unk_3C0320;
    v10 = &v11;
    v8[4] = self;
    id v9 = v4;
    [(BEDocumentExternalLoadApprovalCache *)self _accessCacheIvar:v8];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)v12[5];
      v12[5] = 0;
    }
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)cachedApproval:(BOOL)a3 forBookID:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    [(BEDocumentExternalLoadApprovalCache *)self _ensureCacheLoaded];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_150E8;
    v7[3] = &unk_3C0808;
    v7[4] = self;
    BOOL v9 = a3;
    id v8 = v6;
    [(BEDocumentExternalLoadApprovalCache *)self _accessCacheIvar:v7];
  }
}

- (void)removeCachedDisapprovalForBookID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(BEDocumentExternalLoadApprovalCache *)self _ensureCacheLoaded];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_15230;
    v5[3] = &unk_3C04B8;
    v5[4] = self;
    id v6 = v4;
    [(BEDocumentExternalLoadApprovalCache *)self _accessCacheIvar:v5];
  }
}

- (void)_ensureCacheLoaded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_15340;
  v2[3] = &unk_3C0830;
  v2[4] = self;
  [(BEDocumentExternalLoadApprovalCache *)self _accessCacheIvar:v2];
}

- (void)_accessCacheIvar:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_lock);
    v4[2](v4);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void).cxx_destruct
{
}

@end