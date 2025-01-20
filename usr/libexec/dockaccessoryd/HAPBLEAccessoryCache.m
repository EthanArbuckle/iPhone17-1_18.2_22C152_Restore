@interface HAPBLEAccessoryCache
+ (BOOL)supportsSecureCoding;
+ (int64_t)currentDiscoveryVersion;
- (BOOL)isEqual:(id)a3;
- (HAPBLEAccessoryCache)initWithCoder:(id)a3;
- (HAPBLEAccessoryCache)initWithPairingIdentifier:(id)a3 saveBlock:(id)a4;
- (HAPBLEPeripheralInfo)peripheralInfo;
- (NSMutableArray)cachedServices;
- (NSNumber)lastKeyBagIdentityIndexFailingPV;
- (NSNumber)metadataVersion;
- (NSString)pairingIdentifier;
- (id)description;
- (id)getCachedServiceWithUUID:(id)a3;
- (id)saveBlock;
- (int64_t)discoveryVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setDiscoveryVersion:(int64_t)a3;
- (void)setLastKeyBagIdentityIndexFailingPV:(id)a3;
- (void)setPeripheralInfo:(id)a3;
- (void)setSaveBlock:(id)a3;
- (void)updateCurrentPairingIdentityIndexIfNeededForKeyBag:(id)a3;
- (void)updateWithPeripheralInfo:(id)a3;
- (void)updateWithService:(id)a3;
@end

@implementation HAPBLEAccessoryCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLEAccessoryCache)initWithPairingIdentifier:(id)a3 saveBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAPBLEAccessoryCache;
  v9 = [(HAPBLEAccessoryCache *)&v17 init];
  if (v9)
  {
    uint64_t v10 = sub_100017D84();
    metadataVersion = v9->_metadataVersion;
    v9->_metadataVersion = (NSNumber *)v10;

    objc_storeStrong((id *)&v9->_pairingIdentifier, a3);
    uint64_t v12 = +[NSMutableArray array];
    cachedServices = v9->_cachedServices;
    v9->_cachedServices = (NSMutableArray *)v12;

    id v14 = objc_retainBlock(v8);
    id saveBlock = v9->_saveBlock;
    v9->_id saveBlock = v14;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPBLEAccessoryCache *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HAPBLEAccessoryCache *)self pairingIdentifier];
      id v7 = [(HAPBLEAccessoryCache *)v5 pairingIdentifier];

      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HAPBLEAccessoryCache *)self pairingIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)updateWithPeripheralInfo:(id)a3
{
  id v4 = a3;
  v5 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  id v7 = [v5 accessoryName];

  [(HAPBLEAccessoryCache *)self setPeripheralInfo:v4];
  v6 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  [v6 updateAccessoryName:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(HAPBLEAccessoryCache *)self pairingIdentifier];
  [v9 encodeObject:v4 forKey:@"PI"];

  v5 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  [v9 encodeObject:v5 forKey:@"PIN"];

  v6 = [(HAPBLEAccessoryCache *)self cachedServices];
  [v9 encodeObject:v6 forKey:@"CS"];

  id v7 = [(HAPBLEAccessoryCache *)self metadataVersion];
  [v9 encodeObject:v7 forKey:@"MV"];

  unsigned __int8 v8 = [(HAPBLEAccessoryCache *)self lastKeyBagIdentityIndexFailingPV];
  [v9 encodeObject:v8 forKey:@"PVX"];

  [v9 encodeInteger:-[HAPBLEAccessoryCache discoveryVersion](self, "discoveryVersion") forKey:@"DV"];
}

- (HAPBLEAccessoryCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAPBLEAccessoryCache;
  v5 = [(HAPBLEAccessoryCache *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MV"];
    metadataVersion = v5->_metadataVersion;
    v5->_metadataVersion = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PI"];
    pairingIdentifier = v5->_pairingIdentifier;
    v5->_pairingIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PIN"];
    peripheralInfo = v5->_peripheralInfo;
    v5->_peripheralInfo = (HAPBLEPeripheralInfo *)v10;

    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    uint64_t v12 = +[NSArray arrayWithObjects:v20 count:2];
    v13 = +[NSSet setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"CS"];
    cachedServices = v5->_cachedServices;
    v5->_cachedServices = (NSMutableArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PVX"];
    lastKeyBagIdentityIndexFailingPV = v5->_lastKeyBagIdentityIndexFailingPV;
    v5->_lastKeyBagIdentityIndexFailingPV = (NSNumber *)v16;

    v5->_discoveryVersion = (int64_t)[v4 decodeIntegerForKey:@"DV"];
  }

  return v5;
}

- (id)getCachedServiceWithUUID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HAPBLEAccessoryCache *)self cachedServices];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 serviceUUID];
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateWithService:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(HAPBLEAccessoryCache *)self cachedServices];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 isEqual:v4])
        {
          [v10 updateWithService:v4];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v5 = [(HAPBLEAccessoryCache *)self cachedServices];
  [v5 addObject:v4];
LABEL_11:
}

+ (int64_t)currentDiscoveryVersion
{
  return 0;
}

- (void)save
{
  v2 = [(HAPBLEAccessoryCache *)self saveBlock];
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (void)setLastKeyBagIdentityIndexFailingPV:(id)a3
{
  id v5 = a3;
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, a3);
    [(HAPBLEAccessoryCache *)self save];
  }
}

- (void)updateCurrentPairingIdentityIndexIfNeededForKeyBag:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPBLEAccessoryCache *)self lastKeyBagIdentityIndexFailingPV];

  if (v5)
  {
    id v6 = [(HAPBLEAccessoryCache *)self lastKeyBagIdentityIndexFailingPV];
    id v7 = (char *)[v6 longLongValue] + 1;

    if ([v4 isValidIndex:v7])
    {
      uint64_t v8 = self;
      id v9 = sub_100083F74();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = sub_100083FD0(v8);
        long long v11 = +[NSNumber numberWithInteger:v7];
        long long v12 = [(HAPBLEAccessoryCache *)v8 pairingIdentifier];
        int v15 = 138543874;
        long long v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Updating keybag identity index to %@ for %@.", (uint8_t *)&v15, 0x20u);
      }
      id v13 = [v4 getCurrentIndexInBag];
      [v4 setCurrentIndexInBag:v7];
      long long v14 = [v4 currentIdentity];

      if (!v14) {
        [v4 setCurrentIndexInBag:v13];
      }
    }
  }
}

- (id)description
{
  id v3 = [(HAPBLEAccessoryCache *)self cachedServices];
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\n\nList of Services: %tu\n", [v3 count]);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(HAPBLEAccessoryCache *)self cachedServices];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      uint64_t v10 = v4;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v4 = [v10 stringByAppendingFormat:@"%@", *(void *)(*((void *)&v14 + 1) + 8 * (void)v9)];

        id v9 = (char *)v9 + 1;
        uint64_t v10 = v4;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  long long v11 = [(HAPBLEAccessoryCache *)self peripheralInfo];
  long long v12 = +[NSString stringWithFormat:@"%@ %@", v11, v4];

  return v12;
}

- (NSNumber)metadataVersion
{
  return self->_metadataVersion;
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (HAPBLEPeripheralInfo)peripheralInfo
{
  return self->_peripheralInfo;
}

- (void)setPeripheralInfo:(id)a3
{
}

- (NSMutableArray)cachedServices
{
  return self->_cachedServices;
}

- (NSNumber)lastKeyBagIdentityIndexFailingPV
{
  return self->_lastKeyBagIdentityIndexFailingPV;
}

- (int64_t)discoveryVersion
{
  return self->_discoveryVersion;
}

- (void)setDiscoveryVersion:(int64_t)a3
{
  self->_discoveryVersion = a3;
}

- (id)saveBlock
{
  return self->_saveBlock;
}

- (void)setSaveBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveBlock, 0);
  objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, 0);
  objc_storeStrong((id *)&self->_cachedServices, 0);
  objc_storeStrong((id *)&self->_peripheralInfo, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);

  objc_storeStrong((id *)&self->_metadataVersion, 0);
}

@end