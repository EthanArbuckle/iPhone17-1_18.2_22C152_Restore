@interface HAPService
- (BOOL)_updateCharacteristic:(id)a3;
- (BOOL)_validateMandatoryCharacteristics;
- (BOOL)_validateServiceCharacteristics;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeObject:(id)a3;
- (BOOL)shouldMergeObject:(id)a3;
- (BOOL)updateAndValidateCharacteristics;
- (CBService)cbService;
- (HAPAccessory)accessory;
- (HAPService)initWithType:(id)a3 instanceID:(id)a4;
- (HAPService)initWithType:(id)a3 instanceID:(id)a4 parsedCharacteristics:(id)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7;
- (NSArray)characteristics;
- (NSArray)linkedServices;
- (NSNumber)instanceID;
- (NSString)description;
- (NSString)type;
- (id)characteristicsOfType:(id)a3;
- (id)propertiesDescription;
- (unint64_t)hash;
- (unint64_t)serviceProperties;
- (void)setAccessory:(id)a3;
- (void)setCBService:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setServiceProperties:(unint64_t)a3;
- (void)setType:(id)a3;
@end

@implementation HAPService

- (CBService)cbService
{
  v2 = objc_getAssociatedObject(self, "cbService");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CBService *)v3;
}

- (void)setCBService:(id)a3
{
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4 parsedCharacteristics:(id)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (sub_100082A44(v12))
  {
    v16 = sub_100082BE4(v12);
    if (v16)
    {
      if (sub_100082EDC(v13))
      {
        v38.receiver = self;
        v38.super_class = (Class)HAPService;
        self = [(HAPService *)&v38 init];
        if (self)
        {
          id v36 = v15;
          +[HAPMetadata getSharedInstance];
          id v34 = v13;
          v18 = id v17 = v14;
          v19 = +[HMFObjectCacheNSString hmf_cachedInstanceForString:v16];
          type = self->_type;
          self->_type = v19;

          v35 = (void *)v18;
          v21 = (void *)v18;
          id v14 = v17;
          id v13 = v34;
          v37 = [v21 serviceUTIFromType:v16];
          if (v37)
          {
            log = sub_100083F74();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v22 = sub_100083FD0(0);
              v23 = self->_type;
              *(_DWORD *)buf = 138544130;
              uint64_t v40 = v22;
              v24 = (void *)v22;
              __int16 v41 = 2112;
              v42 = v23;
              __int16 v43 = 2112;
              v44 = v37;
              __int16 v45 = 2112;
              id v46 = v34;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);
            }
          }
          objc_storeStrong((id *)&self->_instanceID, a4);
          id v15 = v36;
          if (v14)
          {
            if ((unint64_t)[v14 count] >= 0x65)
            {
              v25 = sub_100083F74();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v26 = sub_100083FD0(0);
                *(_DWORD *)buf = 138543362;
                uint64_t v40 = (uint64_t)v26;
                v27 = "%{public}@### HAPService exceeds maximum number of allowed characteristics";
LABEL_28:
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);

                goto LABEL_29;
              }
              goto LABEL_29;
            }
            objc_storeStrong((id *)&self->_characteristics, a5);
            if (![(HAPService *)self updateAndValidateCharacteristics])
            {
              v25 = sub_100083F74();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v26 = sub_100083FD0(0);
                *(_DWORD *)buf = 138543362;
                uint64_t v40 = (uint64_t)v26;
                v27 = "%{public}@### HAPService failed updateAndValidateCharacteristics";
                goto LABEL_28;
              }
LABEL_29:

              goto LABEL_21;
            }
          }
          self->_serviceProperties = a6;
          objc_storeStrong((id *)&self->_linkedServices, a7);
        }
        self = self;
        v31 = self;
        goto LABEL_22;
      }
      v28 = sub_100083F74();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      v29 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = (uint64_t)v29;
      v30 = "%{public}@### Unable to initialize service because of invalid instance ID";
      goto LABEL_19;
    }
    v28 = sub_100083F74();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = (uint64_t)v29;
      v30 = "%{public}@### Unable to initialize service because type name is not a UUID";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
    }
LABEL_20:

    goto LABEL_21;
  }
  v16 = sub_100083F74();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v28 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = (uint64_t)v28;
    __int16 v41 = 2112;
    v42 = (NSString *)v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize service because of invalid service type name: %@", buf, 0x16u);
    goto LABEL_20;
  }
LABEL_21:
  v31 = 0;
LABEL_22:

  return v31;
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4
{
  return [(HAPService *)self initWithType:a3 instanceID:a4 parsedCharacteristics:0 serviceProperties:0 linkedServices:0];
}

- (unint64_t)hash
{
  v2 = [(HAPService *)self instanceID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPService *)a3;
  if (self == v4)
  {
    unsigned __int8 v13 = 1;
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
    if (!v6) {
      goto LABEL_8;
    }
    v7 = [(HAPService *)self instanceID];
    v8 = [(HAPService *)v6 instanceID];
    char v9 = sub_100083128(v7, v8);

    if ((v9 & 1) != 0
      || ([(HAPService *)self type],
          v10 = objc_claimAutoreleasedReturnValue(),
          [(HAPService *)v6 type],
          v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = sub_1000830F4((unint64_t)v10, (uint64_t)v11),
          v11,
          v10,
          (v12 & 1) != 0))
    {
LABEL_8:
      unsigned __int8 v13 = 0;
    }
    else
    {
      uint64_t v15 = [(HAPService *)self accessory];
      if (v15)
      {
        v16 = (void *)v15;
        uint64_t v17 = [(HAPService *)v6 accessory];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          v19 = [(HAPService *)self accessory];
          v20 = [(HAPService *)v6 accessory];
          unsigned __int8 v13 = [v19 isEqual:v20];
        }
        else
        {
          unsigned __int8 v13 = 1;
        }
      }
      else
      {
        unsigned __int8 v13 = 1;
      }
    }
  }
  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(HAPService *)self instanceID];
  [v3 appendFormat:@"Instance ID: %@", v4];

  v5 = [(HAPService *)self type];
  [v3 appendFormat:@", Type: %@", v5];

  v6 = [(HAPService *)self propertiesDescription];
  [v3 appendFormat:@", Properties: %@", v6];

  v7 = [(HAPService *)self linkedServices];
  [v3 appendFormat:@", Linked Service: %@", v7];

  return (NSString *)v3;
}

- (id)propertiesDescription
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(HAPService *)self serviceProperties]) {
    [v3 addObject:@"primary"];
  }
  if (([(HAPService *)self serviceProperties] & 2) != 0) {
    [v3 addObject:@"hidden"];
  }
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableString);
    v5 = [v3 objectAtIndexedSubscript:0];
    [v4 appendString:v5];

    v6 = [v3 objectAtIndexedSubscript:0];
    [v3 removeObject:v6];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v4 appendFormat:@", %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)updateAndValidateCharacteristics
{
  v2 = self;
  if ([(HAPService *)self _validateServiceCharacteristics])
  {
    id v3 = objc_alloc((Class)NSMutableSet);
    id v4 = [v2 characteristics];
    id v5 = [v3 initWithCapacity:[v4 count]];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v6 = [v2 characteristics];
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v7)
    {
      BOOL v15 = 1;
      goto LABEL_23;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      char v12 = [v11 instanceID];
      unsigned int v13 = [v5 containsObject:v12];

      if (v13) {
        break;
      }
      long long v14 = [v11 instanceID];
      [v5 addObject:v14];

      if (([v2 _updateCharacteristic:v11] & 1) == 0)
      {
        id v20 = v2;
        uint64_t v17 = sub_100083F74();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = sub_100083FD0(v20);
          *(_DWORD *)buf = 138543362;
          v28 = v18;
          v19 = "%{public}@Failed to update characteristic";
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
        }
        goto LABEL_20;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        BOOL v15 = 1;
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_23;
      }
    }
    id v16 = v2;
    uint64_t v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = sub_100083FD0(v16);
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      v19 = "%{public}@Duplicate characteristic instance IDs";
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  id v5 = v2;
  v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v2 = sub_100083FD0(v5);
    *(_DWORD *)buf = 138543362;
    v28 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate characteristics", buf, 0xCu);
LABEL_21:
  }
  BOOL v15 = 0;
LABEL_23:

  return v15;
}

- (BOOL)_updateCharacteristic:(id)a3
{
  if (a3) {
    [a3 setService:self];
  }
  return 1;
}

- (BOOL)_validateServiceCharacteristics
{
  id v3 = [(HAPService *)self characteristics];
  id v4 = [v3 count];

  if (v4)
  {
    [(HAPService *)self _validateMandatoryCharacteristics];
  }
  else
  {
    id v5 = self;
    v6 = sub_100083F74();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = sub_100083FD0(v5);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@One or more characteristics are required", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4 != 0;
}

- (BOOL)_validateMandatoryCharacteristics
{
  id v3 = +[HAPMetadata getSharedInstance];
  id v4 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(HAPService *)self characteristics];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) type];
        [v4 addObject:v10];

        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v11 = [(HAPService *)self type];
  unsigned __int8 v12 = [v3 validateMandatoryCharacteristics:v4 forService:v11];

  return v12;
}

- (id)characteristicsOfType:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(HAPService *)self characteristics];
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
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned __int8 v12 = [v11 type];
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

- (BOOL)shouldMergeObject:(id)a3
{
  id v4 = a3;
  if ([(HAPService *)self isEqual:v4])
  {
    id v5 = [(HAPService *)self characteristics];
    id v6 = +[NSSet setWithArray:v5];

    id v23 = v4;
    id v7 = [v4 characteristics];
    id v8 = +[NSSet setWithArray:v7];

    long long v22 = v6;
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
          v19 = sub_100083F74();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = sub_100083FD0(v18);
            *(_DWORD *)buf = 138543874;
            v29 = v20;
            __int16 v30 = 2112;
            v31 = v17;
            __int16 v32 = 2112;
            id v33 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge characteristic, %@, with existing characteristic: %@", buf, 0x20u);
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
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    if ([(HAPService *)self shouldMergeObject:v6])
    {
      v57 = v6;
      id v7 = [(HAPService *)self characteristics];
      id v8 = +[NSSet setWithArray:v7];

      id v58 = v4;
      id v9 = [v4 characteristics];
      id v10 = +[NSSet setWithArray:v9];

      v59 = v8;
      id v11 = [(HAPService *)v8 mutableCopy];
      v60 = v10;
      [v11 minusSet:v10];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id obj = v11;
      id v12 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
      BOOL v61 = v12 != 0;
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v74;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v74 != v14) {
              objc_enumerationMutation(obj);
            }
            long long v16 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            long long v17 = self;
            long long v18 = sub_100083F74();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = sub_100083FD0(v17);
              *(_DWORD *)buf = 138543618;
              v81 = v19;
              __int16 v82 = 2112;
              id v83 = v16;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@Removed characteristic: %@", buf, 0x16u);
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
        }
        while (v13);
      }

      id v20 = [v10 mutableCopy];
      v21 = v59;
      [v20 minusSet:v59];
      long long v22 = [(HAPService *)self characteristics];
      id v23 = [v22 firstObject];
      id v24 = [v23 shouldValidateValueAfterReading];

      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v63 = v20;
      id v25 = [v63 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v70;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v70 != v27) {
              objc_enumerationMutation(v63);
            }
            v29 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
            __int16 v30 = self;
            v31 = sub_100083F74();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              __int16 v32 = sub_100083FD0(v30);
              *(_DWORD *)buf = 138543618;
              v81 = v32;
              __int16 v82 = 2112;
              id v83 = v29;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%{public}@Added characteristic: %@", buf, 0x16u);
            }
            [v29 setService:v30];
            [v29 setShouldValidateValueAfterReading:v24];
          }
          id v26 = [v63 countByEnumeratingWithState:&v69 objects:v78 count:16];
        }
        while (v26);
        BOOL v61 = 1;
        v21 = v59;
      }

      id v33 = [(HAPService *)v21 mutableCopy];
      [v33 minusSet:obj];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v62 = v33;
      id v34 = [v62 countByEnumeratingWithState:&v65 objects:v77 count:16];
      v35 = v60;
      if (v34)
      {
        id v36 = v34;
        uint64_t v37 = *(void *)v66;
        do
        {
          for (k = 0; k != v36; k = (char *)k + 1)
          {
            if (*(void *)v66 != v37) {
              objc_enumerationMutation(v62);
            }
            v39 = *(void **)(*((void *)&v65 + 1) + 8 * (void)k);
            uint64_t v40 = self;
            __int16 v41 = sub_100083F74();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v42 = sub_100083FD0(v40);
              *(_DWORD *)buf = 138543618;
              v81 = v42;
              __int16 v82 = 2112;
              id v83 = v39;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing characteristic: %@", buf, 0x16u);
            }
            __int16 v43 = [v35 member:v39];
            if (v43 && [v39 mergeObject:v43])
            {
              v44 = v40;
              __int16 v45 = sub_100083F74();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                id v46 = sub_100083FD0(v44);
                *(_DWORD *)buf = 138543618;
                v81 = v46;
                __int16 v82 = 2112;
                id v83 = v39;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%{public}@Updated characteristic: %@", buf, 0x16u);

                v35 = v60;
              }

              BOOL v61 = 1;
            }
          }
          id v36 = [v62 countByEnumeratingWithState:&v65 objects:v77 count:16];
        }
        while (v36);
      }

      v47 = [v62 allObjects];
      v48 = +[NSMutableArray arrayWithArray:v47];

      v49 = [v63 allObjects];
      [v48 addObjectsFromArray:v49];

      id v50 = [v48 copy];
      [(HAPService *)self setCharacteristics:v50];

      id v6 = v57;
      -[HAPService setServiceProperties:](self, "setServiceProperties:", [v57 serviceProperties]);
      v51 = [v57 linkedServices];
      [(HAPService *)self setLinkedServices:v51];

      id v4 = v58;
      v52 = v59;
      BOOL v53 = v61;
    }
    else
    {
      v52 = self;
      v54 = sub_100083F74();
      v60 = v54;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v55 = sub_100083FD0(v52);
        *(_DWORD *)buf = 138543618;
        v81 = v55;
        __int16 v82 = 2112;
        id v83 = v6;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%{public}@Not merging with service: %@", buf, 0x16u);
      }
      BOOL v53 = 0;
    }
  }
  else
  {
    BOOL v53 = 0;
  }

  return v53;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
}

- (HAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HAPAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_instanceID, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end