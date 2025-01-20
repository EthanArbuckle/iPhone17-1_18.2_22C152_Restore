@interface CSDCallFilterController
- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)containsRecentsRestrictedHandle:(id)a3;
- (BOOL)containsRestrictedHandle:(id)a3;
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (CSDCallFilterController)init;
- (NSMutableArray)filters;
- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4;
- (os_unfair_lock_s)accessorLock;
- (void)addCallFilter:(id)a3;
- (void)removeCallFilter:(id)a3;
@end

@implementation CSDCallFilterController

- (CSDCallFilterController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSDCallFilterController;
  v2 = [(CSDCallFilterController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    filters = v3->_filters;
    v3->_filters = v4;
  }
  return v3;
}

- (void)addCallFilter:(id)a3
{
  id v6 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v5 = [(CSDCallFilterController *)self filters];
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeCallFilter:(id)a3
{
  id v6 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v5 = [(CSDCallFilterController *)self filters];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v11 = [(CSDCallFilterController *)self filters];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001C472C;
  v16[3] = &unk_100509FE8;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  BOOL v19 = a5;
  unsigned __int8 v14 = objc_msgSend(v11, "tu_containsObjectPassingTest:", v16);

  os_unfair_lock_unlock(p_accessorLock);
  return v14;
}

- (BOOL)containsRecentsRestrictedHandle:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [(CSDCallFilterController *)self filters];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C4820;
  v10[3] = &unk_10050A010;
  id v7 = v4;
  id v11 = v7;
  unsigned __int8 v8 = objc_msgSend(v6, "tu_containsObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (BOOL)containsRestrictedHandle:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [(CSDCallFilterController *)self filters];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C4910;
  v10[3] = &unk_10050A010;
  id v7 = v4;
  id v11 = v7;
  unsigned __int8 v8 = objc_msgSend(v6, "tu_containsObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [(CSDCallFilterController *)self filters];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) filterStatusForAddresses:v6 withBundleIdentifier:v7];
      if (v13) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v13 = 0;
  }

  os_unfair_lock_unlock(p_accessorLock);
  return (int64_t)v13;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v12 = [(CSDCallFilterController *)self filters];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C4BC0;
  v17[3] = &unk_10050A038;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  id v15 = v10;
  id v20 = v15;
  LOBYTE(v10) = objc_msgSend(v12, "tu_containsObjectPassingTest:", v17);

  os_unfair_lock_unlock(p_accessorLock);
  return (char)v10;
}

- (BOOL)isUnknownCaller:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = [(CSDCallFilterController *)self filters];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C4CB4;
  v10[3] = &unk_10050A010;
  id v7 = v4;
  id v11 = v7;
  unsigned __int8 v8 = objc_msgSend(v6, "tu_containsObjectPassingTest:", v10);

  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v9 = [(CSDCallFilterController *)self filters];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001C4EB0;
  v24[3] = &unk_10050A060;
  id v10 = v6;
  id v25 = v10;
  id v11 = v7;
  id v26 = v11;
  unsigned __int8 v12 = objc_msgSend(v9, "tu_containsObjectPassingTest:", v24);

  if (v12) {
    goto LABEL_2;
  }
  id v14 = [(CSDCallFilterController *)self filters];
  if (!objc_msgSend(v14, "tu_containsObjectPassingTest:", &stru_10050A0A0))
  {

LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  id v15 = [(CSDCallFilterController *)self filters];
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_1001C5010;
  v21 = &unk_10050A060;
  id v22 = v10;
  id v23 = v11;
  unsigned __int8 v16 = objc_msgSend(v15, "tu_containsObjectPassingTest:", &v18);

  if (v16) {
    goto LABEL_9;
  }
LABEL_2:
  if (!objc_msgSend(v10, "filteredOutReason", v18, v19, v20, v21)) {
    [v10 setFilteredOutReason:2];
  }
  BOOL v13 = 1;
LABEL_10:

  os_unfair_lock_unlock(p_accessorLock);
  return v13;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v11 = [(CSDCallFilterController *)self filters];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001C523C;
  v16[3] = &unk_100509FE8;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  BOOL v19 = a5;
  unsigned __int8 v14 = objc_msgSend(v11, "tu_containsObjectPassingTest:", v16);

  os_unfair_lock_unlock(p_accessorLock);
  return v14;
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v9 = [(CSDCallFilterController *)self filters];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C535C;
  v14[3] = &unk_10050A060;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  unsigned __int8 v12 = objc_msgSend(v9, "tu_containsObjectPassingTest:", v14);

  os_unfair_lock_unlock(p_accessorLock);
  return v12;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
}

@end