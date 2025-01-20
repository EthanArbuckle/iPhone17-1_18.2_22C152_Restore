@interface HAPBLEPeripheral
+ (id)uuidForBTLEPeripheral:(id)a3;
- (BOOL)isCached;
- (BOOL)isEqual:(id)a3;
- (CBPeripheral)cbPeripheral;
- (HAPBLEPeripheral)initWithName:(id)a3 peripheralUUID:(id)a4 identifier:(id)a5;
- (NSArray)peripheralUUIDs;
- (NSMutableArray)cbPeripheralUUIDs;
- (NSString)identifier;
- (NSString)name;
- (NSUUID)uniqueBTIdentifier;
- (double)lastSeen;
- (id)shortDescription;
- (unint64_t)hash;
- (void)connectedToCBPeripheral:(id)a3 error:(id)a4;
- (void)disconnectedFromCBPeripheral:(id)a3 shouldRemove:(BOOL)a4;
- (void)mergeWithPeripheral:(id)a3;
- (void)setCbPeripheral:(id)a3;
- (void)setCbPeripheralUUIDs:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCached:(BOOL)a3;
- (void)setLastSeen:(double)a3;
- (void)setName:(id)a3;
@end

@implementation HAPBLEPeripheral

- (HAPBLEPeripheral)initWithName:(id)a3 peripheralUUID:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HAPBLEPeripheral;
  v12 = [(HAPBLEPeripheral *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_identifier, a5);
    id v21 = v10;
    v14 = +[NSArray arrayWithObjects:&v21 count:1];
    v15 = (NSMutableArray *)[v14 mutableCopy];
    cbPeripheralUUIDs = v13->_cbPeripheralUUIDs;
    v13->_cbPeripheralUUIDs = v15;

    uint64_t v17 = [(id)objc_opt_class() uuidForBTLEPeripheral:v13];
    uniqueBTIdentifier = v13->_uniqueBTIdentifier;
    v13->_uniqueBTIdentifier = (NSUUID *)v17;

    v13->_lastSeen = CFAbsoluteTimeGetCurrent();
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPBLEPeripheral *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6
      && ([(HAPBLEPeripheral *)self identifier],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(HAPBLEPeripheral *)v6 identifier],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      id v10 = [(HAPBLEPeripheral *)self uniqueBTIdentifier];
      id v11 = [(HAPBLEPeripheral *)v6 uniqueBTIdentifier];
      char v12 = HMFEqualObjects();
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(HAPBLEPeripheral *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)shortDescription
{
  v13 = [(HAPBLEPeripheral *)self name];
  id v3 = [(HAPBLEPeripheral *)self identifier];
  [(HAPBLEPeripheral *)self isCached];
  v4 = HMFBooleanToString();
  v14 = [(HAPBLEPeripheral *)self peripheralUUIDs];
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
  v6 = [(HAPBLEPeripheral *)self cbPeripheral];
  v7 = [v6 identifier];
  v8 = [(HAPBLEPeripheral *)self cbPeripheral];
  int v9 = [(HAPBLEPeripheral *)self cbPeripheral];
  id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 state]);
  id v11 = +[NSString stringWithFormat:@"%@/%@ (%@) periph[%@] -> %@ (%p: %@)", v13, v3, v4, v5, v7, v8, v10];

  return v11;
}

- (NSArray)peripheralUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableArray *)self->_cbPeripheralUUIDs copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)mergeWithPeripheral:(id)a3
{
  id v4 = (HAPBLEPeripheral *)a3;
  if (self == v4) {
    goto LABEL_38;
  }
  v5 = [(HAPBLEPeripheral *)self identifier];
  v6 = [(HAPBLEPeripheral *)v4 identifier];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_38;
  }
  [(HAPBLEPeripheral *)v4 lastSeen];
  double v9 = v8;
  [(HAPBLEPeripheral *)self lastSeen];
  double v11 = v9 - v10;
  if (v11 > 0.0)
  {
    [(HAPBLEPeripheral *)v4 lastSeen];
    -[HAPBLEPeripheral setLastSeen:](self, "setLastSeen:");
    [(HAPBLEPeripheral *)self setIsCached:[(HAPBLEPeripheral *)v4 isCached]];
    uint64_t v12 = [(HAPBLEPeripheral *)v4 cbPeripheral];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(HAPBLEPeripheral *)self cbPeripheral];

      if (!v14)
      {
        v15 = self;
        v16 = sub_100083F74();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = sub_100083FD0(v15);
          v18 = [(HAPBLEPeripheral *)v15 shortDescription];
          v19 = [(HAPBLEPeripheral *)v4 cbPeripheral];
          *(_DWORD *)buf = 138543874;
          v59 = v17;
          __int16 v60 = 2112;
          v61 = v18;
          __int16 v62 = 2112;
          v63 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Updating the BLE peripheral: %@ with CBPeripheral: %@", buf, 0x20u);
        }
        objc_super v20 = [(HAPBLEPeripheral *)v4 cbPeripheral];
        [(HAPBLEPeripheral *)v15 setCbPeripheral:v20];
      }
    }
  }
  id v21 = [(HAPBLEPeripheral *)v4 identifier];
  v22 = v21;
  if (v11 <= 0.0 && v21 != 0)
  {
    v52 = [(HAPBLEPeripheral *)self identifier];

    if (v52) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  if (v22)
  {
LABEL_15:
    v24 = [(HAPBLEPeripheral *)v4 identifier];
    [(HAPBLEPeripheral *)self setIdentifier:v24];
  }
LABEL_16:
  v25 = [(HAPBLEPeripheral *)self name];
  id v26 = [v25 length];
  v27 = [(HAPBLEPeripheral *)v4 name];
  id v28 = [v27 length];

  if (v26 < v28)
  {
    v29 = [(HAPBLEPeripheral *)v4 name];
    [(HAPBLEPeripheral *)self setName:v29];
  }
  uint64_t v30 = [(HAPBLEPeripheral *)v4 peripheralUUIDs];
  if (v30)
  {
    v31 = (void *)v30;
    v32 = [(HAPBLEPeripheral *)self peripheralUUIDs];
    v33 = [(HAPBLEPeripheral *)v4 peripheralUUIDs];
    unsigned __int8 v34 = [v32 isEqual:v33];

    if ((v34 & 1) == 0)
    {
      if (v11 <= 0.0) {
        v35 = v4;
      }
      else {
        v35 = self;
      }
      if (v11 <= 0.0) {
        v36 = self;
      }
      else {
        v36 = v4;
      }
      v37 = [(HAPBLEPeripheral *)v35 peripheralUUIDs];
      v38 = (NSMutableArray *)[v37 mutableCopy];

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v39 = [(HAPBLEPeripheral *)v36 peripheralUUIDs];
      id v40 = [v39 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v54;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v54 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            [(NSMutableArray *)v38 removeObject:v44];
            [(NSMutableArray *)v38 addObject:v44];
          }
          id v41 = [v39 countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v41);
      }

      v45 = [(HAPBLEPeripheral *)self cbPeripheral];
      id v46 = [v45 state];

      if (v46)
      {
        v47 = [(HAPBLEPeripheral *)self cbPeripheral];
        v48 = [v47 identifier];
        [(NSMutableArray *)v38 removeObject:v48];

        v49 = [(HAPBLEPeripheral *)self cbPeripheral];
        v50 = [v49 identifier];
        [(NSMutableArray *)v38 addObject:v50];
      }
      if ((unint64_t)[(NSMutableArray *)v38 count] >= 6) {
        -[NSMutableArray removeObjectsInRange:](v38, "removeObjectsInRange:", 0, (char *)[(NSMutableArray *)v38 count] - 5);
      }
      os_unfair_lock_lock_with_options();
      cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
      self->_cbPeripheralUUIDs = v38;

      os_unfair_lock_unlock(&self->_lock);
    }
  }
LABEL_38:
}

- (void)connectedToCBPeripheral:(id)a3 error:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = v14;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    double v8 = [(HAPBLEPeripheral *)self cbPeripheral];

    if (v8)
    {
      cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
      double v10 = [(HAPBLEPeripheral *)self cbPeripheral];
      double v11 = [v10 identifier];
      [(NSMutableArray *)cbPeripheralUUIDs removeObject:v11];
    }
    if (v14)
    {
      uint64_t v12 = self->_cbPeripheralUUIDs;
      v13 = [v14 identifier];
      [(NSMutableArray *)v12 removeObject:v13];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v7 = 0;
  }
  [(HAPBLEPeripheral *)self setCbPeripheral:v7];
}

- (void)disconnectedFromCBPeripheral:(id)a3 shouldRemove:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  [(HAPBLEPeripheral *)self setCbPeripheral:0];
  if (v9 && v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
    double v8 = [v9 identifier];
    [(NSMutableArray *)cbPeripheralUUIDs removeObject:v8];

    os_unfair_lock_unlock(p_lock);
  }
}

+ (id)uuidForBTLEPeripheral:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 uniqueBTIdentifier];

  if (v4)
  {
    v5 = [v3 uniqueBTIdentifier];
  }
  else
  {
    id v6 = [v3 peripheralUUIDs];

    v5 = [v6 lastObject];
    id v3 = v6;
  }

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)uniqueBTIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (CBPeripheral)cbPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCbPeripheral:(id)a3
{
}

- (NSMutableArray)cbPeripheralUUIDs
{
  return self->_cbPeripheralUUIDs;
}

- (void)setCbPeripheralUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbPeripheralUUIDs, 0);
  objc_storeStrong((id *)&self->_cbPeripheral, 0);
  objc_storeStrong((id *)&self->_uniqueBTIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end