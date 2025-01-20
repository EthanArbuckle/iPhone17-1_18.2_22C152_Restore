@interface HAPAccessory
+ (BOOL)isAccessoryPrimaryWithUniqueIdentifier:(id)a3;
+ (id)instanceIDForUniqueIdentifier:(id)a3;
+ (id)logCategory;
+ (id)productDataStringFromData:(id)a3;
+ (id)serverIdentifierWithUniqueIdentifier:(id)a3;
- (BOOL)_updateAndValidateServices;
- (BOOL)_updateService:(id)a3;
- (BOOL)_validateCharacteristicValues;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)isPrimary;
- (BOOL)isReachable;
- (BOOL)mergeObject:(id)a3;
- (BOOL)shouldDisconnectOnIdle;
- (BOOL)shouldMergeObject:(id)a3;
- (BOOL)updateForAccessoryInformationService;
- (HAPAccessory)init;
- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4;
- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5;
- (HAPAccessoryDelegate)delegate;
- (HAPAccessoryServer)server;
- (HMFMACAddress)bluetoothClassicMacAddress;
- (NSArray)services;
- (NSDate)timeBecameReachable;
- (NSNumber)category;
- (NSNumber)instanceID;
- (NSNumber)sleepInterval;
- (NSString)description;
- (NSString)firmwareVersion;
- (NSString)identifier;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)productData;
- (NSString)serialNumber;
- (NSString)serverIdentifier;
- (NSString)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)characteristicOfType:(id)a3 serviceType:(id)a4;
- (id)characteristicsOfType:(id)a3;
- (id)servicesOfType:(id)a3;
- (id)shortDescription;
- (int)consecutiveFailedPingCount;
- (int64_t)communicationProtocol;
- (int64_t)linkType;
- (unint64_t)hash;
- (void)invalidate;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)readValueForCharacteristic:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)setBluetoothClassicMacAddress:(id)a3;
- (void)setConsecutiveFailedPingCount:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setProductData:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setServer:(id)a3;
- (void)setServerIdentifier:(id)a3;
- (void)setServices:(id)a3;
- (void)setShouldDisconnectOnIdle:(BOOL)a3;
- (void)setSleepInterval:(id)a3;
- (void)setTimeBecameReachable:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)writeCharacteristicValue:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation HAPAccessory

+ (id)productDataStringFromData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  v6 = [v5 hmf_hexadecimalStringWithOptions:2];

  return v6;
}

+ (id)serverIdentifierWithUniqueIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"+"];
  if ([v3 count] == (id)2)
  {
    v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)instanceIDForUniqueIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"+"];
  if ([v3 count] == (id)2)
  {
    id v4 = objc_alloc_init((Class)NSNumberFormatter);
    [v4 setNumberStyle:1];
    id v5 = [v3 objectAtIndexedSubscript:1];
    v6 = [v4 numberFromString:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isAccessoryPrimaryWithUniqueIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"+"];
  if ([v3 count] == (id)2)
  {
    id v4 = [v3 objectAtIndexedSubscript:1];
    unsigned __int8 v5 = [v4 isEqualToString:@"1"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (HAPAccessory)init
{
  v2 = NSStringFromSelector(a2);
  id v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (sub_100082EDC(v9))
  {
    v20.receiver = self;
    v20.super_class = (Class)HAPAccessory;
    v11 = [(HAPAccessory *)&v20 init];
    self = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_server, v8);
      self->_linkType = (int64_t)[v8 linkType];
      self->_communicationProtocol = (int64_t)[v8 communicationProtocol];
      objc_storeStrong((id *)&self->_instanceID, a4);
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.HAPAccessory", v12);
      workQueue = self->_workQueue;
      self->_workQueue = v13;

      if (v10)
      {
        if ((unint64_t)[v10 count] >= 0x65)
        {
          v15 = sub_100083F74();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = sub_100083FD0(0);
            *(_DWORD *)buf = 138543362;
            v22 = v16;
            v17 = "%{public}@### Accessory exceeds maximum number of allowed services";
LABEL_9:
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

            goto LABEL_10;
          }
          goto LABEL_10;
        }
        objc_storeStrong((id *)&self->_services, a5);
        if (![(HAPAccessory *)self _validateCharacteristicValues])
        {
          v15 = sub_100083F74();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          v16 = sub_100083FD0(0);
          *(_DWORD *)buf = 138543362;
          v22 = v16;
          v17 = "%{public}@### Accessory failed validateCharacteristicValues";
          goto LABEL_9;
        }
        if (![(HAPAccessory *)self _updateAndValidateServices])
        {
          v15 = sub_100083F74();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          v16 = sub_100083FD0(0);
          *(_DWORD *)buf = 138543362;
          v22 = v16;
          v17 = "%{public}@### Accessory failed _updateAndValidateServices";
          goto LABEL_9;
        }
      }
      self->_consecutiveFailedPingCount = 0;
      self->_primary = 1;
      self->_reachable = 1;
      self->_shouldDisconnectOnIdle = 0;
    }
    self = self;
    v18 = self;
    goto LABEL_15;
  }
  v15 = sub_100083F74();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543362;
    v22 = v16;
    v17 = "%{public}@### Unable to initialize accessory because of invalid arguments";
    goto LABEL_9;
  }
LABEL_10:

  v18 = 0;
LABEL_15:

  return v18;
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4
{
  return [(HAPAccessory *)self initWithServer:a3 instanceID:a4 parsedServices:0];
}

- (unint64_t)hash
{
  id v3 = [(HAPAccessory *)self identifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  unsigned __int8 v5 = [(HAPAccessory *)self instanceID];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HAPAccessory *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v5 = v4;
    }
    else {
      unsigned __int8 v5 = 0;
    }
    unint64_t v6 = v5;
    if (!v6) {
      goto LABEL_10;
    }
    v7 = [(HAPAccessory *)self instanceID];
    id v8 = [(HAPAccessory *)v6 instanceID];
    unsigned int v9 = [v7 isEqualToNumber:v8];

    if (!v9) {
      goto LABEL_10;
    }
    id v10 = [(HAPAccessory *)self identifier];
    v11 = [(HAPAccessory *)v6 identifier];
    unsigned int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_10;
    }
    id v13 = [(HAPAccessory *)self linkType];
    if (v13 == (id)[(HAPAccessory *)v6 linkType])
    {
      id v14 = [(HAPAccessory *)self communicationProtocol];
      BOOL v15 = v14 == (id)[(HAPAccessory *)v6 communicationProtocol];
    }
    else
    {
LABEL_10:
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  unint64_t v4 = [(HAPAccessory *)self instanceID];
  [v3 appendFormat:@"Instance ID: %@    ", v4];

  unsigned __int8 v5 = [(HAPAccessory *)self server];
  unint64_t v6 = [v5 name];
  v7 = [(HAPAccessory *)self server];
  id v8 = [v7 identifier];
  [v3 appendFormat:@"Server: '%@' (%@)    ", v6, v8];

  if ([(HAPAccessory *)self isPrimary])
  {
    unsigned int v9 = [(HAPAccessory *)self category];
    [v3 appendFormat:@"Category: %@    ", v9];
  }
  id v10 = [(HAPAccessory *)self name];

  if (v10)
  {
    v11 = [(HAPAccessory *)self name];
    [v3 appendFormat:@"Name: %@    ", v11];
  }
  unsigned int v12 = [(HAPAccessory *)self model];
  if (v12
    || ([(HAPAccessory *)self manufacturer], (unsigned int v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    objc_super v20 = [(HAPAccessory *)self serialNumber];

    if (!v20) {
      goto LABEL_15;
    }
  }
  id v13 = [(HAPAccessory *)self model];

  if (v13)
  {
    id v14 = [(HAPAccessory *)self model];
    [v3 appendFormat:@"Model: %@    ", v14];
  }
  BOOL v15 = [(HAPAccessory *)self manufacturer];

  if (v15)
  {
    v16 = [(HAPAccessory *)self manufacturer];
    [v3 appendFormat:@"Manufacturer: %@    ", v16];
  }
  v17 = [(HAPAccessory *)self serialNumber];

  if (v17)
  {
    v18 = [(HAPAccessory *)self serialNumber];
    [v3 appendFormat:@"Serial Number: %@    ", v18];
  }
  [v3 appendFormat:@"\n"];
LABEL_15:

  return (NSString *)v3;
}

- (BOOL)isPaired
{
  v2 = [(HAPAccessory *)self server];
  unsigned __int8 v3 = [v2 isPaired];

  return v3;
}

- (BOOL)isReachable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    unint64_t v6 = [(HAPAccessory *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(HAPAccessory *)self delegate];
      [v8 accessory:self didUpdateReachabilityState:v3];
    }
  }
}

- (int)consecutiveFailedPingCount
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_consecutiveFailedPingCount;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setConsecutiveFailedPingCount:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_consecutiveFailedPingCount = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_uniqueIdentifier)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_server);
      unint64_t v6 = [v5 identifier];
      char v7 = [(NSNumber *)self->_instanceID stringValue];
      id v8 = +[NSString stringWithFormat:@"%@%@%@", v6, @"+", v7];
      uniqueIdentifier = self->_uniqueIdentifier;
      self->_uniqueIdentifier = v8;
    }
    else
    {
      sub_100083F74();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sub_100083FD0(0);
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543618;
        v16 = v11;
        __int16 v17 = 2112;
        v18 = identifier;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot create globally unique identifier because there is no server for accessory: %@", buf, 0x16u);
      }
    }
  }
  id v13 = self->_uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (NSNumber)category
{
  uint64_t v3 = [(HAPAccessory *)self server];
  if (v3 && (v4 = (void *)v3, unsigned int v5 = [(HAPAccessory *)self isPrimary], v4, v5))
  {
    unint64_t v6 = [(HAPAccessory *)self server];
    char v7 = [v6 category];
  }
  else
  {
    char v7 = 0;
  }

  return (NSNumber *)v7;
}

- (id)shortDescription
{
  if (sub_100017D90())
  {
    uint64_t v3 = [(HAPAccessory *)self name];
    unint64_t v4 = [(HAPAccessory *)self identifier];
    unsigned int v5 = [(HAPAccessory *)self instanceID];
    unint64_t v6 = +[NSString stringWithFormat:@"%@/%@+%@", v3, v4, v5];
  }
  else
  {
    uint64_t v3 = [(HAPAccessory *)self identifier];
    unint64_t v4 = [(HAPAccessory *)self instanceID];
    unint64_t v6 = +[NSString stringWithFormat:@"%@+%@", v3, v4];
  }

  return v6;
}

- (void)readValueForCharacteristic:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      v16 = [(HAPAccessory *)self server];
      if (v16)
      {
        id v38 = v10;
        objc_super v20 = +[NSArray arrayWithObjects:&v38 count:1];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10007CFF0;
        v26[3] = &unk_1002742C8;
        v21 = &v28;
        id v28 = v12;
        v22 = &v27;
        id v27 = v10;
        [v16 readCharacteristicValues:v20 timeout:v11 completionQueue:v26 completionHandler:a4];
      }
      else
      {
        v23 = self;
        v24 = sub_100083F74();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = sub_100083FD0(v23);
          *(_DWORD *)buf = 138543618;
          v40 = v25;
          __int16 v41 = 2112;
          id v42 = v10;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to read value for characteristic %@ because there is no server.", buf, 0x16u);
        }
        if (!v11 || !v12) {
          goto LABEL_21;
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10007CF70;
        v29[3] = &unk_1002733F0;
        v21 = &v31;
        id v31 = v12;
        v22 = &v30;
        id v30 = v10;
        dispatch_async(v11, v29);
      }

LABEL_21:
      goto LABEL_22;
    }
    id v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = sub_100083FD0(v13);
      *(_DWORD *)buf = 138543362;
      v40 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007CEF0;
      block[3] = &unk_1002733F0;
      id v34 = v12;
      id v33 = v10;
      dispatch_async(v11, block);

      v16 = v34;
      goto LABEL_21;
    }
  }
  else
  {
    __int16 v17 = self;
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic is a requried parameter", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10007CE70;
      v35[3] = &unk_1002733F0;
      id v36 = 0;
      id v37 = v12;
      dispatch_async(v11, v35);

      v16 = v37;
      goto LABEL_21;
    }
  }
LABEL_22:
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  if ([v10 count])
  {
    if (a4 >= 0.0)
    {
      objc_super v20 = [(HAPAccessory *)self server];
      v16 = v20;
      if (v20)
      {
        [v20 readCharacteristicValues:v10 timeout:v11 completionQueue:v12 completionHandler:a4];
      }
      else
      {
        v21 = self;
        v22 = sub_100083F74();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = sub_100083FD0(v21);
          *(_DWORD *)buf = 138543618;
          id v31 = v23;
          __int16 v32 = 2112;
          id v33 = v10;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to read characteristics %@ because there is no server.", buf, 0x16u);
        }
        if (v11 && v12)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10007D6E0;
          v24[3] = &unk_100273330;
          id v25 = v12;
          dispatch_async(v11, v24);
        }
      }
      goto LABEL_20;
    }
    id v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = sub_100083FD0(v13);
      *(_DWORD *)buf = 138543362;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007D594;
      block[3] = &unk_100273330;
      id v27 = v12;
      dispatch_async(v11, block);
      v16 = v27;
LABEL_20:
    }
  }
  else
  {
    __int16 v17 = self;
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543362;
      id v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristics are required.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10007D448;
      v28[3] = &unk_100273330;
      id v29 = v12;
      dispatch_async(v11, v28);
      v16 = v29;
      goto LABEL_20;
    }
  }
}

- (void)writeCharacteristicValue:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      v16 = [(HAPAccessory *)self server];
      if (v16)
      {
        id v39 = v10;
        objc_super v20 = +[NSArray arrayWithObjects:&v39 count:1];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10007DE3C;
        v27[3] = &unk_1002742C8;
        v21 = &v29;
        id v29 = v12;
        v22 = &v28;
        id v28 = v10;
        [v16 writeCharacteristicValues:v20 timeout:v11 completionQueue:v27 completionHandler:a4];
      }
      else
      {
        v23 = self;
        v24 = sub_100083F74();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = sub_100083FD0(v23);
          v26 = [v10 characteristic];
          *(_DWORD *)buf = 138543618;
          __int16 v41 = v25;
          __int16 v42 = 2112;
          v43 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to write value for characteristic %@ because there is no server.", buf, 0x16u);
        }
        if (!v11 || !v12) {
          goto LABEL_21;
        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10007DDA4;
        v30[3] = &unk_1002733F0;
        v21 = &v32;
        id v32 = v12;
        v22 = &v31;
        id v31 = v10;
        dispatch_async(v11, v30);
      }

LABEL_21:
      goto LABEL_22;
    }
    id v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = sub_100083FD0(v13);
      *(_DWORD *)buf = 138543362;
      __int16 v41 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007DD0C;
      block[3] = &unk_1002733F0;
      id v35 = v12;
      id v34 = v10;
      dispatch_async(v11, block);

      v16 = v35;
      goto LABEL_21;
    }
  }
  else
  {
    __int16 v17 = self;
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543362;
      __int16 v41 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic write request is a requried parameter", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10007DC74;
      v36[3] = &unk_1002733F0;
      id v37 = 0;
      id v38 = v12;
      dispatch_async(v11, v36);

      v16 = v38;
      goto LABEL_21;
    }
  }
LABEL_22:
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  if ([v10 count])
  {
    if (a4 >= 0.0)
    {
      objc_super v20 = [(HAPAccessory *)self server];
      v16 = v20;
      if (v20)
      {
        [v20 writeCharacteristicValues:v10 timeout:v11 completionQueue:v12 completionHandler:a4];
      }
      else
      {
        v21 = self;
        v22 = sub_100083F74();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = sub_100083FD0(v21);
          *(_DWORD *)buf = 138543618;
          id v31 = v23;
          __int16 v32 = 2112;
          id v33 = v10;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to write characteristics %@ because there is no server.", buf, 0x16u);
        }
        if (v11 && v12)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10007E568;
          v24[3] = &unk_100273330;
          id v25 = v12;
          dispatch_async(v11, v24);
        }
      }
      goto LABEL_20;
    }
    id v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = sub_100083FD0(v13);
      *(_DWORD *)buf = 138543362;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007E41C;
      block[3] = &unk_100273330;
      id v27 = v12;
      dispatch_async(v11, block);
      v16 = v27;
LABEL_20:
    }
  }
  else
  {
    __int16 v17 = self;
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543362;
      id v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristic writes are required.", buf, 0xCu);
    }
    if (v11 && v12)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10007E2D0;
      v28[3] = &unk_100273330;
      id v29 = v12;
      dispatch_async(v11, v28);
      v16 = v29;
      goto LABEL_20;
    }
  }
}

- (BOOL)_updateAndValidateServices
{
  uint64_t v3 = +[NSMutableSet set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v4 = [(HAPAccessory *)self services];
  id v5 = [v4 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v40;
    id v33 = self;
    id v34 = v4;
    uint64_t v31 = *(void *)v40;
    while (2)
    {
      id v8 = 0;
      id v32 = v6;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v8);
        id v10 = [v9 instanceID:v31];
        unsigned int v11 = [v3 containsObject:v10];

        if (v11)
        {
          id v13 = sub_100083F74();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          id v28 = sub_100083FD0(0);
          id v29 = [v9 instanceID];
          id v30 = [v29 stringValue];
          *(_DWORD *)buf = 138543618;
          v45 = v28;
          __int16 v46 = 2112;
          v47 = v30;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has service with duplicate instance ID '%@'", buf, 0x16u);

LABEL_32:
          goto LABEL_23;
        }
        id v12 = [v9 instanceID];
        [v3 addObject:v12];

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v13 = [v9 characteristics];
        id v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v36;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              v19 = [v18 instanceID];
              unsigned int v20 = [v3 containsObject:v19];

              if (v20)
              {
                v23 = sub_100083F74();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  v24 = sub_100083FD0(0);
                  id v25 = [v18 instanceID];
                  v26 = [v25 stringValue];
                  *(_DWORD *)buf = 138543618;
                  v45 = v24;
                  __int16 v46 = 2112;
                  v47 = v26;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has characteristic with duplicate instance ID '%@'", buf, 0x16u);
                }
                unint64_t v4 = v34;
                goto LABEL_23;
              }
              v21 = [v18 instanceID];
              [v3 addObject:v21];
            }
            id v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        self = v33;
        if (![(HAPAccessory *)v33 _updateService:v9])
        {
          id v13 = sub_100083F74();
          unint64_t v4 = v34;
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          id v28 = sub_100083FD0(0);
          *(_DWORD *)buf = 138543362;
          v45 = v28;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateService", buf, 0xCu);
          goto LABEL_32;
        }
        id v8 = (char *)v8 + 1;
        uint64_t v7 = v31;
        unint64_t v4 = v34;
      }
      while (v8 != v32);
      id v6 = [v34 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if ([(HAPAccessory *)self updateForAccessoryInformationService])
  {
    BOOL v22 = 1;
  }
  else
  {
    unint64_t v4 = sub_100083F74();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v13 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v45 = v13;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateForAccessoryInformationService", buf, 0xCu);
LABEL_23:
    }
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_updateService:(id)a3
{
  if (a3) {
    [a3 setAccessory:self];
  }
  return 1;
}

- (BOOL)updateForAccessoryInformationService
{
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v2 = [(HAPAccessory *)self services];
  id v3 = [v2 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v48 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        unsigned int v9 = [v8 type];
        unsigned int v10 = [v9 isEqualToString:@"0000003E-0000-1000-8000-4D69736D6574"];

        if (v10)
        {
          if (v5)
          {
            long long v38 = sub_100083F74();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              long long v39 = sub_100083FD0(0);
              *(_DWORD *)buf = 138543362;
              v53 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has more than one Accessory Information Service", buf, 0xCu);
            }
            goto LABEL_43;
          }
          id v5 = v8;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v47 objects:v54 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    if (v5)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      unsigned int v11 = [v5 characteristics];
      id v12 = [v11 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v44;
        do
        {
          for (j = 0; j != v13; j = (char *)j + 1)
          {
            if (*(void *)v44 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
            __int16 v17 = [v16 value];

            if (v17)
            {
              v18 = [v16 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v19 = v18;
              }
              else {
                v19 = 0;
              }
              id v20 = v19;

              v21 = +[HMFObjectCacheNSString hmf_cachedInstanceForString:v20];

              BOOL v22 = [v16 type];
              unsigned int v23 = [v22 isEqualToString:@"00000023-0000-1000-8000-4D69736D6574"];

              if (v23)
              {
                [(HAPAccessory *)self setName:v21];
              }
              else
              {
                v24 = [v16 type];
                unsigned int v25 = [v24 isEqualToString:@"00000020-0000-1000-8000-4D69736D6574"];

                if (v25)
                {
                  [(HAPAccessory *)self setManufacturer:v21];
                }
                else
                {
                  v26 = [v16 type];
                  unsigned int v27 = [v26 isEqualToString:@"00000021-0000-1000-8000-4D69736D6574"];

                  if (v27)
                  {
                    [(HAPAccessory *)self setModel:v21];
                  }
                  else
                  {
                    id v28 = [v16 type];
                    unsigned int v29 = [v28 isEqualToString:@"00000030-0000-1000-8000-4D69736D6574"];

                    if (v29)
                    {
                      [(HAPAccessory *)self setSerialNumber:v21];
                    }
                    else
                    {
                      id v30 = [v16 type];
                      unsigned int v31 = [v30 isEqualToString:@"00000052-0000-1000-8000-4D69736D6574"];

                      if (v31)
                      {
                        [(HAPAccessory *)self setFirmwareVersion:v21];
                      }
                      else
                      {
                        id v32 = [v16 type];
                        unsigned int v33 = [v32 isEqualToString:@"00000220-0000-1000-8000-4D69736D6574"];

                        if (v33)
                        {
                          id v34 = objc_opt_class();
                          long long v35 = [v16 value];
                          long long v36 = [v34 productDataStringFromData:v35];
                          [(HAPAccessory *)self setProductData:v36];
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v13);
      }

      BOOL v37 = 1;
      goto LABEL_44;
    }
  }
  else
  {
  }
  id v5 = sub_100083F74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    long long v40 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543362;
    v53 = v40;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@### Accessory is missing an Accessory Information Service", buf, 0xCu);
  }
LABEL_43:
  BOOL v37 = 0;
LABEL_44:

  return v37;
}

- (void)invalidate
{
  v2 = self;
  id v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = sub_100083FD0(v2);
    int v8 = 138543618;
    unsigned int v9 = v4;
    __int16 v10 = 2112;
    unsigned int v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@Invalidating and updating connection state for HAP Accessory: %@", (uint8_t *)&v8, 0x16u);
  }
  id v5 = [(HAPAccessory *)v2 delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(HAPAccessory *)v2 delegate];
    [v7 accessory:v2 didUpdateConnectionState:0];
  }
}

- (BOOL)_validateCharacteristicValues
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v2 = [(HAPAccessory *)self services];
  id v3 = [v2 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v30;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        int v8 = [v7 characteristics];
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v39 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v26;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
              if ([v13 shouldValidateValueAfterReading])
              {
                uint64_t v14 = [v13 value];
                if (v14)
                {
                  id v15 = (void *)v14;
                  unsigned __int8 v16 = [v13 properties];

                  if ((v16 & 2) != 0)
                  {
                    __int16 v17 = [v13 value];
                    v18 = [v13 validateValue:v17 outValue:0];

                    if (v18)
                    {
                      id v20 = sub_100083F74();
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                      {
                        v21 = sub_100083FD0(0);
                        BOOL v22 = [v13 type];
                        *(_DWORD *)buf = 138543874;
                        id v34 = v21;
                        __int16 v35 = 2112;
                        long long v36 = v22;
                        __int16 v37 = 2112;
                        long long v38 = v18;
                        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@[HAP Accessory] ### Failed to validate value with type %@ with error %@", buf, 0x20u);
                      }
                      BOOL v19 = 0;
                      goto LABEL_24;
                    }
                  }
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v25 objects:v39 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v24;
      }
      id v4 = [v2 countByEnumeratingWithState:&v29 objects:v40 count:16];
      BOOL v19 = 1;
    }
    while (v4);
  }
  else
  {
    BOOL v19 = 1;
  }
LABEL_24:

  return v19;
}

- (id)servicesOfType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v6 = [(HAPAccessory *)self services];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 type];
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)characteristicsOfType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v6 = [(HAPAccessory *)self services];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) characteristicsOfType:v4];
        [v5 addObjectsFromArray:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)characteristicOfType:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v9 = 0;
  if (!v6 || !v7) {
    goto LABEL_9;
  }
  id v10 = [(HAPAccessory *)self servicesOfType:v7];
  uint64_t v11 = [v10 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  id v12 = [(HAPAccessory *)self servicesOfType:v8];
  long long v13 = [v12 firstObject];

  if (v13)
  {
    uint64_t v11 = [v13 characteristicsOfType:v6];
    uint64_t v9 = [v11 firstObject];
    id v10 = v13;
LABEL_7:

    goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_9:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v14 = v9;
  }
  else {
    long long v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (BOOL)shouldMergeObject:(id)a3
{
  id v4 = a3;
  if ([(HAPAccessory *)self isEqual:v4])
  {
    uint64_t v5 = [(HAPAccessory *)self services];
    id v6 = +[NSSet setWithArray:v5];

    id v23 = v4;
    id v7 = [v4 services];
    id v8 = +[NSSet setWithArray:v7];

    BOOL v22 = v6;
    id v9 = [v6 mutableCopy];
    [v9 intersectSet:v8];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (!v11)
    {
      char v14 = 1;
      goto LABEL_18;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    char v14 = 1;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v17 = [v8 member:v16];
        if (v17)
        {
          if ([v16 shouldMergeObject:v17]) {
            goto LABEL_13;
          }
          long long v18 = self;
          BOOL v19 = sub_100083F74();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = sub_100083FD0(v18);
            *(_DWORD *)buf = 138543874;
            long long v29 = v20;
            __int16 v30 = 2112;
            long long v31 = v17;
            __int16 v32 = 2112;
            id v33 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge service, %@, with existing service: %@", buf, 0x20u);
          }
        }
        char v14 = 0;
LABEL_13:
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (!v12)
      {
LABEL_18:

        id v4 = v23;
        goto LABEL_19;
      }
    }
  }
  char v14 = 0;
LABEL_19:

  return v14 & 1;
}

- (BOOL)mergeObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    if ([(HAPAccessory *)self shouldMergeObject:v6])
    {
      v75 = v6;
      id v7 = [(HAPAccessory *)self services];
      id v8 = +[NSSet setWithArray:v7];

      id v76 = v4;
      id v9 = [v4 services];
      id v10 = +[NSSet setWithArray:v9];

      v77 = v8;
      id v11 = [(HAPAccessory *)v8 mutableCopy];
      [v11 minusSet:v10];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id obj = v11;
      id v12 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
      BOOL v78 = v12 != 0;
      v82 = v10;
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v92;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v92 != v14) {
              objc_enumerationMutation(obj);
            }
            long long v16 = *(void **)(*((void *)&v91 + 1) + 8 * i);
            long long v17 = self;
            long long v18 = sub_100083F74();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              BOOL v19 = sub_100083FD0(v17);
              *(_DWORD *)buf = 138543618;
              v99 = v19;
              __int16 v100 = 2112;
              id v101 = v16;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@Removed service: %@", buf, 0x16u);

              id v10 = v82;
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
        }
        while (v13);
      }

      id v20 = [v10 mutableCopy];
      v21 = v77;
      [v20 minusSet:v77];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v80 = v20;
      id v22 = [v80 countByEnumeratingWithState:&v87 objects:v96 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v88;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v88 != v24) {
              objc_enumerationMutation(v80);
            }
            long long v26 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
            long long v27 = self;
            long long v28 = sub_100083F74();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              long long v29 = sub_100083FD0(v27);
              *(_DWORD *)buf = 138543618;
              v99 = v29;
              __int16 v100 = 2112;
              id v101 = v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}@Added service: %@", buf, 0x16u);
            }
            [v26 setAccessory:v27];
          }
          id v23 = [v80 countByEnumeratingWithState:&v87 objects:v96 count:16];
        }
        while (v23);
        BOOL v78 = 1;
        v21 = v77;
        id v10 = v82;
      }

      id v30 = [(HAPAccessory *)v21 mutableCopy];
      [v30 minusSet:obj];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v79 = v30;
      id v31 = [v79 countByEnumeratingWithState:&v83 objects:v95 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v84;
        do
        {
          for (k = 0; k != v32; k = (char *)k + 1)
          {
            if (*(void *)v84 != v33) {
              objc_enumerationMutation(v79);
            }
            __int16 v35 = *(void **)(*((void *)&v83 + 1) + 8 * (void)k);
            long long v36 = self;
            __int16 v37 = sub_100083F74();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              long long v38 = sub_100083FD0(v36);
              *(_DWORD *)buf = 138543618;
              v99 = v38;
              __int16 v100 = 2112;
              id v101 = v35;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing service: %@", buf, 0x16u);
            }
            long long v39 = [v10 member:v35];
            if (v39 && [v35 mergeObject:v39])
            {
              long long v40 = v36;
              long long v41 = sub_100083F74();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                long long v42 = sub_100083FD0(v40);
                *(_DWORD *)buf = 138543618;
                v99 = v42;
                __int16 v100 = 2112;
                id v101 = v35;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%{public}@Updated service: %@", buf, 0x16u);

                id v10 = v82;
              }

              BOOL v78 = 1;
            }
          }
          id v32 = [v79 countByEnumeratingWithState:&v83 objects:v95 count:16];
        }
        while (v32);
      }

      long long v43 = [v79 allObjects];
      long long v44 = +[NSMutableArray arrayWithArray:v43];

      long long v45 = [v80 allObjects];
      [v44 addObjectsFromArray:v45];

      id v46 = [v44 copy];
      [(HAPAccessory *)self setServices:v46];

      long long v47 = [(HAPAccessory *)self name];
      id v6 = v75;
      long long v48 = [v75 name];
      unsigned __int8 v49 = [v47 isEqualToString:v48];

      char v50 = v78;
      if ((v49 & 1) == 0)
      {
        v51 = [v75 name];
        [(HAPAccessory *)self setName:v51];

        char v50 = 1;
      }
      v52 = [(HAPAccessory *)self manufacturer];
      v53 = [v75 manufacturer];
      unsigned __int8 v54 = [v52 isEqualToString:v53];

      id v4 = v76;
      if ((v54 & 1) == 0)
      {
        v55 = [v75 manufacturer];
        [(HAPAccessory *)self setManufacturer:v55];

        char v50 = 1;
      }
      v56 = [(HAPAccessory *)self model];
      v57 = [v75 model];
      unsigned __int8 v58 = [v56 isEqualToString:v57];

      if ((v58 & 1) == 0)
      {
        v59 = [v75 model];
        [(HAPAccessory *)self setModel:v59];

        char v50 = 1;
      }
      v60 = [(HAPAccessory *)self serialNumber];
      v61 = [v75 serialNumber];
      unsigned __int8 v62 = [v60 isEqualToString:v61];

      if ((v62 & 1) == 0)
      {
        v63 = [v75 serialNumber];
        [(HAPAccessory *)self setSerialNumber:v63];

        char v50 = 1;
      }
      v64 = [(HAPAccessory *)self firmwareVersion];
      v65 = [v75 firmwareVersion];
      unsigned __int8 v66 = [v64 isEqualToString:v65];

      if ((v66 & 1) == 0)
      {
        v67 = [v75 firmwareVersion];
        [(HAPAccessory *)self setFirmwareVersion:v67];

        char v50 = 1;
      }
      v68 = [(HAPAccessory *)self productData];
      v69 = [v75 productData];
      unsigned __int8 v70 = [v68 isEqualToString:v69];

      if ((v70 & 1) == 0)
      {
        v71 = [v75 productData];
        [(HAPAccessory *)self setProductData:v71];

        char v50 = 1;
      }

      v72 = v77;
    }
    else
    {
      v72 = self;
      id v10 = sub_100083F74();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v73 = sub_100083FD0(v72);
        *(_DWORD *)buf = 138543618;
        v99 = v73;
        __int16 v100 = 2112;
        id v101 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Not merging with accessory: %@", buf, 0x16u);
      }
      char v50 = 0;
    }
  }
  else
  {
    char v50 = 0;
  }

  return v50 & 1;
}

+ (id)logCategory
{
  if (qword_1002AD6C0 != -1) {
    dispatch_once(&qword_1002AD6C0, &stru_1002742E8);
  }
  v2 = (void *)qword_1002AD6C8;

  return v2;
}

- (BOOL)shouldDisconnectOnIdle
{
  return self->_shouldDisconnectOnIdle;
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  self->_shouldDisconnectOnIdle = a3;
}

- (HAPAccessoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAccessoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HAPAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (HAPAccessoryServer *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (void)setServerIdentifier:(id)a3
{
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (HMFMACAddress)bluetoothClassicMacAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBluetoothClassicMacAddress:(id)a3
{
}

- (NSDate)timeBecameReachable
{
  return self->_timeBecameReachable;
}

- (void)setTimeBecameReachable:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (NSNumber)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepInterval, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeBecameReachable, 0);
  objc_storeStrong((id *)&self->_bluetoothClassicMacAddress, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_server);

  objc_destroyWeak((id *)&self->_delegate);
}

@end