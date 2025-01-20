@interface HAPKeyBag
+ (id)logCategory;
- (BOOL)isEmpty;
- (BOOL)isValidIndex:(int64_t)a3;
- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4;
- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4 controllerKeyList:(id)a5;
- (HAPKeyStore)keyStore;
- (NSArray)availableKeysToTry;
- (NSString)accessoryIdentifier;
- (id)_populateBagWithPairingIdentitiesForAccessory:(id)a3 fromStore:(id)a4;
- (id)currentIdentity;
- (id)logIdentifier;
- (id)nextIdentity;
- (int64_t)currentIndexInBag;
- (int64_t)getCurrentIndexInBag;
- (unint64_t)totalIdentities;
- (void)refreshKeys;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAvailableKeysToTry:(id)a3;
- (void)setCurrentIndexInBag:(int64_t)a3;
@end

@implementation HAPKeyBag

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = v7;
    v9 = [(HAPKeyBag *)self _populateBagWithPairingIdentitiesForAccessory:v6 fromStore:v7];
    v10 = [(HAPKeyBag *)self initWithAccessoryIdentifier:v6 keyStore:v8 controllerKeyList:v9];

    return v10;
  }
  else
  {
    v12 = (HAPKeyBag *)_HMFPreconditionFailure();
    return [(HAPKeyBag *)v12 initWithAccessoryIdentifier:v14 keyStore:v15 controllerKeyList:v16];
  }
}

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4 controllerKeyList:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    _HMFPreconditionFailure();
  }
  v12 = v11;
  v24.receiver = self;
  v24.super_class = (Class)HAPKeyBag;
  SEL v13 = [(HAPKeyBag *)&v24 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryIdentifier, a3);
    objc_storeWeak((id *)&v14->_keyStore, v10);
    v14->_currentIndexInBag = -1;
    id v15 = (NSArray *)[v12 copy];
    availableKeysToTry = v14->_availableKeysToTry;
    v14->_availableKeysToTry = v15;

    v17 = v14;
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = sub_100083FD0(v17);
      accessoryIdentifier = v14->_accessoryIdentifier;
      v21 = +[NSNumber numberWithUnsignedInteger:[(NSArray *)v14->_availableKeysToTry count]];
      v22 = [(NSArray *)v14->_availableKeysToTry firstObject];
      *(_DWORD *)buf = 138544130;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = accessoryIdentifier;
      __int16 v29 = 2112;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@Initialized key bag for accessory [%@] with %@ keys and primary identity: [%@]", buf, 0x2Au);
    }
  }

  return v14;
}

- (void)refreshKeys
{
  v3 = [(HAPKeyBag *)self accessoryIdentifier];

  if (!v3)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  v4 = [(HAPKeyBag *)self keyStore];

  if (!v4) {
    goto LABEL_10;
  }
  v5 = [(HAPKeyBag *)self accessoryIdentifier];
  id v6 = [(HAPKeyBag *)self keyStore];
  id v7 = [(HAPKeyBag *)self _populateBagWithPairingIdentitiesForAccessory:v5 fromStore:v6];

  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    self->_currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v8 = (NSArray *)[v7 copy];
    availableKeysToTry = self->_availableKeysToTry;
    self->_availableKeysToTry = v8;

    self->_currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
    id v10 = self;
    id v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = sub_100083FD0(v10);
      SEL v13 = [(HAPKeyBag *)v10 accessoryIdentifier];
      int v14 = 138543874;
      id v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Refreshed key bag for accessory [%@] with identities: [%@]", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (id)_populateBagWithPairingIdentitiesForAccessory:(id)a3 fromStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = [v7 allAccessoryPairingKeys];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = &__NSArray0__struct;
  }
  v12 = +[NSMutableArray arrayWithArray:v11];

  SEL v13 = [v7 getAssociatedControllerKeyForAccessory:v6];
  if (v13
    || ([v7 readControllerPairingKeyForAccessory:v6 error:0],
        (SEL v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v12 removeObject:v13];
    [v12 insertObject:v13 atIndex:0];
  }
  if (objc_msgSend(v12, "hmf_isEmpty"))
  {
    int v14 = self;
    id v15 = sub_100083F74();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = sub_100083FD0(v14);
      int v19 = 138543362;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@This is strange. We do not have any controller keys in the key chain.", (uint8_t *)&v19, 0xCu);
    }
  }
  id v17 = [v12 copy];

  return v17;
}

- (int64_t)getCurrentIndexInBag
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t currentIndexInBag = self->_currentIndexInBag;
  os_unfair_lock_unlock(p_lock);
  return currentIndexInBag;
}

- (void)setCurrentIndexInBag:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t currentIndexInBag = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isValidIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  v4 = [(HAPKeyBag *)self availableKeysToTry];
  BOOL v5 = (unint64_t)[v4 count] > a3;

  return v5;
}

- (id)nextIdentity
{
  if ([(HAPKeyBag *)self isEmpty])
  {
    v3 = 0;
  }
  else
  {
    [(HAPKeyBag *)self setCurrentIndexInBag:(char *)[(HAPKeyBag *)self currentIndexInBag] + 1];
    v3 = [(HAPKeyBag *)self currentIdentity];
    v4 = self;
    BOOL v5 = sub_100083F74();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = sub_100083FD0(v4);
      id v7 = +[NSNumber numberWithInteger:[(HAPKeyBag *)v4 currentIndexInBag]];
      v8 = [(HAPKeyBag *)v4 availableKeysToTry];
      uint64_t v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
      int v11 = 138544130;
      v12 = v6;
      __int16 v13 = 2112;
      int v14 = v3;
      __int16 v15 = 2112;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching Identity [%@] at index : %@, total keys: [%@]", (uint8_t *)&v11, 0x2Au);
    }
  }

  return v3;
}

- (id)currentIdentity
{
  if ([(HAPKeyBag *)self currentIndexInBag] == -1) {
    [(HAPKeyBag *)self setCurrentIndexInBag:(char *)[(HAPKeyBag *)self currentIndexInBag] + 1];
  }
  if ([(HAPKeyBag *)self isValidIndex:[(HAPKeyBag *)self currentIndexInBag]])
  {
    v3 = [(HAPKeyBag *)self availableKeysToTry];
    v4 = [v3 objectAtIndex:-[HAPKeyBag currentIndexInBag](self, "currentIndexInBag")];

    BOOL v5 = self;
    id v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = sub_100083FD0(v5);
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2112;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Current Identity [%@]", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isEmpty
{
  v2 = [(HAPKeyBag *)self availableKeysToTry];
  unsigned __int8 v3 = [v2 hmf_isEmpty];

  return v3;
}

- (unint64_t)totalIdentities
{
  v2 = [(HAPKeyBag *)self availableKeysToTry];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)logIdentifier
{
  uint64_t v3 = objc_opt_class();
  v4 = [(HAPKeyBag *)self accessoryIdentifier];
  BOOL v5 = +[NSNumber numberWithInteger:[(HAPKeyBag *)self getCurrentIndexInBag]];
  id v6 = +[NSNumber numberWithUnsignedInteger:[(HAPKeyBag *)self totalIdentities]];
  id v7 = +[NSString stringWithFormat:@"%@ %@ (%@/%@)", v3, v4, v5, v6];

  return v7;
}

+ (id)logCategory
{
  if (qword_1002AD700 != -1) {
    dispatch_once(&qword_1002AD700, &stru_100274768);
  }
  v2 = (void *)qword_1002AD708;

  return v2;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSArray)availableKeysToTry
{
  return self->_availableKeysToTry;
}

- (void)setAvailableKeysToTry:(id)a3
{
}

- (HAPKeyStore)keyStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);

  return (HAPKeyStore *)WeakRetained;
}

- (int64_t)currentIndexInBag
{
  return self->_currentIndexInBag;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_availableKeysToTry, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end