@interface HAPMetadata
+ (id)getSharedInstance;
+ (id)shortenHAPType:(id)a3 baseUUIDSuffix:(id)a4;
+ (void)setCurrentMetadataHook:(id)a3;
- (BOOL)allowAssociatedService:(id)a3;
- (BOOL)isMandatoryCharacteristic:(id)a3 forService:(id)a4;
- (BOOL)isStandardHAPCharacteristic:(id)a3;
- (BOOL)isStandardHAPCharacteristicName:(id)a3;
- (BOOL)isStandardHAPService:(id)a3;
- (BOOL)isStandardHAPServiceName:(id)a3;
- (BOOL)isStandardHAPUnitName:(id)a3;
- (BOOL)parseMetadata:(id)a3;
- (BOOL)parseVersion:(id)a3;
- (BOOL)supportsAdditionalAuthorizationData:(id)a3 forService:(id)a4;
- (BOOL)updateRawPlist;
- (BOOL)validateMandatoryCharacteristics:(id)a3 forService:(id)a4;
- (HAPMetadata)initWithDictionary:(id)a3 error:(id *)a4;
- (HAPMetadata)initWithServices:(id)a3 characteristics:(id)a4 units:(id)a5 properties:(id)a6 addAuthDataTuples:(id)a7 hapBaseUUIDSuffix:(id)a8;
- (NSArray)hapCharacteristics;
- (NSArray)hapProperties;
- (NSArray)hapServices;
- (NSArray)hapSupportsAuthDataTuples;
- (NSArray)hapValueUnits;
- (NSDictionary)hapCharacteristicMap;
- (NSDictionary)hapCharacteristicNameTypeMap;
- (NSDictionary)hapPropertyMap;
- (NSDictionary)hapServiceMap;
- (NSDictionary)hapServiceNameTypeMap;
- (NSDictionary)hapUnitMap;
- (NSDictionary)rawPlist;
- (NSMutableArray)parsedUUIDs;
- (NSNumber)schemaVersion;
- (NSNumber)version;
- (NSSet)hapSupportsAuthDataSet;
- (NSString)hapBaseUUIDSuffix;
- (id)btleToServiceType:(id)a3;
- (id)characteristicTypeFromUTI:(id)a3;
- (id)characteristicUTIFromType:(id)a3;
- (id)characteristicValueUnitOfType:(id)a3;
- (id)descriptionFromCharacteristicType:(id)a3;
- (id)descriptionFromServiceType:(id)a3;
- (id)generateDictionary;
- (id)generateHAPMetadataTuplesDictionary:(id)a3;
- (id)getDefaultCharacteristicMetadata:(id)a3;
- (id)getDefaultCharacteristicProperties:(id)a3;
- (id)getDefaultServiceProperties:(id)a3;
- (id)hapCharacteristicFromName:(id)a3;
- (id)hapCharacteristicFromType:(id)a3;
- (id)hapServiceFromName:(id)a3;
- (id)hapServiceFromType:(id)a3;
- (id)hapUnitFromName:(id)a3;
- (id)parseCharacteristicServiceTuples:(id)a3;
- (id)parseCharacteristicValue:(id)a3;
- (id)parseCharacteristics:(id)a3;
- (id)parseProperties:(id)a3;
- (id)parseServiceCharacteristics:(id)a3;
- (id)parseServices:(id)a3;
- (id)parseUnits:(id)a3;
- (id)serviceTypeFromUTI:(id)a3;
- (id)serviceTypeToBTLE:(id)a3;
- (id)serviceUTIFromType:(id)a3;
- (void)setHapBaseUUIDSuffix:(id)a3;
- (void)setHapCharacteristicMap:(id)a3;
- (void)setHapCharacteristicNameTypeMap:(id)a3;
- (void)setHapPropertyMap:(id)a3;
- (void)setHapServiceMap:(id)a3;
- (void)setHapServiceNameTypeMap:(id)a3;
- (void)setHapSupportsAuthDataSet:(id)a3;
- (void)setHapUnitMap:(id)a3;
- (void)setParsedUUIDs:(id)a3;
- (void)setSchemaVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation HAPMetadata

- (HAPMetadata)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HAPMetadata;
  v7 = [(HAPMetadata *)&v24 init];
  if (!v7) {
    goto LABEL_6;
  }
  v8 = +[NSMutableArray array];
  [(HAPMetadata *)v7 setParsedUUIDs:v8];

  if (![(HAPMetadata *)v7 parseVersion:v6])
  {
    v15 = sub_100083F74();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse version information", buf, 0xCu);
    }
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v17 = 23;
    goto LABEL_15;
  }
  v9 = [(HAPMetadata *)v7 schemaVersion];
  id v10 = [v9 unsignedIntegerValue];
  uint64_t v11 = qword_1002A72C8;

  if (v10 != (id)v11)
  {
    v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(0);
      v20 = [(HAPMetadata *)v7 schemaVersion];
      *(_DWORD *)buf = 138543874;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = v20;
      __int16 v29 = 2048;
      uint64_t v30 = qword_1002A72C8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Newer schema version %@, current %lu", buf, 0x20u);
    }
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v17 = 25;
LABEL_15:
    +[NSError errorWithDomain:@"DKErrorDomain" code:v17 userInfo:0];
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  [v6 hmf_dictionaryForKey:@"HAP"];
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (![(HAPMetadata *)v7 parseMetadata:v12])
  {
    v21 = sub_100083F74();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata", buf, 0xCu);
    }
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:@"DKErrorDomain" code:23 userInfo:0];
    }

LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  [(HAPMetadata *)v7 setParsedUUIDs:0];
  rawPlist = v7->_rawPlist;
  v7->_rawPlist = v12;

LABEL_6:
  v14 = v7;
LABEL_22:

  return v14;
}

+ (void)setCurrentMetadataHook:(id)a3
{
  id v3 = objc_retainBlock(a3);
  v4 = (void *)qword_1002AD630;
  qword_1002AD630 = (uint64_t)v3;
}

+ (id)getSharedInstance
{
  v2 = (void *)qword_1002AD630;
  if (qword_1002AD630)
  {
    v2 = (*(void (**)(void))(qword_1002AD630 + 16))();
  }

  return v2;
}

- (BOOL)parseVersion:(id)a3
{
  id v4 = a3;
  v5 = [v4 hmf_numberForKey:@"Version"];
  [(HAPMetadata *)self setVersion:v5];

  id v6 = [v4 hmf_numberForKey:@"SchemaVersion"];

  [(HAPMetadata *)self setSchemaVersion:v6];
  v7 = [(HAPMetadata *)self version];
  if (v7)
  {
    v8 = [(HAPMetadata *)self schemaVersion];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)parseUnits:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v5 hmf_dictionaryForKey:v10, (void)v19];
        v12 = [v11 hmf_stringForKey:@"DefaultDescription"];
        v13 = [[HAPMetadataUnit alloc] initWithName:v10 description:v12];
        if (!v13)
        {
          v16 = sub_100083F74();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = sub_100083FD0(0);
            *(_DWORD *)buf = 138543874;
            objc_super v24 = v17;
            __int16 v25 = 2112;
            uint64_t v26 = v10;
            __int16 v27 = 2112;
            v28 = v12;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP unit %@  description %@", buf, 0x20u);
          }
          id v15 = 0;
          goto LABEL_13;
        }
        v14 = v13;
        [v4 setObject:v13 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v15 = [v4 copy];
LABEL_13:

  return v15;
}

- (id)parseProperties:(id)a3
{
  id v3 = a3;
  v23 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = v3;
  id v25 = [v4 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v27;
    CFStringRef v6 = @"Position";
    CFStringRef v7 = @"DefaultDescription";
    uint64_t v8 = &OBJC_IVAR___HAPAccessory__serverIdentifier;
    *(void *)&long long v5 = 138544130;
    long long v21 = v5;
    id v22 = v4;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [v4 hmf_dictionaryForKey:v10, v21];
        v12 = [v11 hmf_numberForKey:v6];
        v13 = [v11 hmf_stringForKey:v7];
        id v14 = [objc_alloc((Class)(v8 + 426)) initWithType:v10 bitPosition:v12 description:v13];
        if (v14)
        {
          [v23 setObject:v14 forKey:v10];
        }
        else
        {
          CFStringRef v15 = v7;
          CFStringRef v16 = v6;
          uint64_t v17 = sub_100083F74();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = sub_100083FD0(0);
            *(_DWORD *)buf = v21;
            v31 = v18;
            __int16 v32 = 2112;
            uint64_t v33 = v10;
            __int16 v34 = 2112;
            v35 = v12;
            __int16 v36 = 2112;
            v37 = v13;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP property %@  bitPosition %@ description %@", buf, 0x2Au);

            id v4 = v22;
          }

          CFStringRef v6 = v16;
          CFStringRef v7 = v15;
          uint64_t v8 = &OBJC_IVAR___HAPAccessory__serverIdentifier;
        }

        if (!v14)
        {

          id v19 = 0;
          goto LABEL_16;
        }
      }
      id v25 = [v4 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v19 = [v23 copy];
LABEL_16:

  return v19;
}

- (id)parseCharacteristicValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 hmf_numberForKey:@"MinLength"];
  uint64_t v5 = [v3 hmf_numberForKey:@"MaxLength"];
  if (v4 | v5) {
    CFStringRef v6 = [[HAPMetadataCharacteristicValue alloc] initWithMinLength:v4 maxLength:v5];
  }
  else {
    CFStringRef v6 = 0;
  }
  CFStringRef v7 = [v3 hmf_numberForKey:@"MinValue"];
  uint64_t v8 = [v3 hmf_numberForKey:@"MaxValue"];
  BOOL v9 = [v3 hmf_numberForKey:@"StepValue"];
  uint64_t v10 = [v3 hmf_arrayForKey:@"ValidValues"];
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      uint64_t v11 = sub_100083F74();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v15 = sub_100083FD0(0);
        [v3 hmf_stringForKey:@"ShortUUID"];
        *(_DWORD *)buf = 138544898;
        uint64_t v17 = v15;
        uint64_t v19 = v18 = 2112;
        v12 = (void *)v19;
        __int16 v20 = 2112;
        uint64_t v21 = v4;
        __int16 v22 = 2112;
        uint64_t v23 = v5;
        __int16 v24 = 2112;
        id v25 = v7;
        __int16 v26 = 2112;
        uint64_t v27 = v5;
        __int16 v28 = 2112;
        long long v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);
      }
    }
    v13 = [[HAPMetadataCharacteristicValue alloc] initWithMinValue:v7 maxValue:v8 stepValue:v9 validValues:v10];

    CFStringRef v6 = v13;
  }

  return v6;
}

- (id)parseCharacteristics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  CFStringRef v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v7 = v4;
  id v40 = [v7 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v44;
    *(void *)&long long v8 = 138544130;
    long long v34 = v8;
    __int16 v36 = v6;
    v37 = v5;
    v38 = self;
    v39 = v7;
LABEL_3:
    BOOL v9 = 0;
    while (1)
    {
      if (*(void *)v44 != v41) {
        objc_enumerationMutation(v7);
      }
      uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v9);
      uint64_t v11 = [v7 hmf_dictionaryForKey:v10, v34];
      v12 = [v11 hmf_stringForKey:@"ShortUUID"];
      id v13 = [v12 length];
      if (v13 != (id)kMetadataShortUUIDLength) {
        break;
      }
      id v14 = [(HAPMetadata *)self parsedUUIDs];
      unsigned int v15 = [v14 containsObject:v12];

      if (v15)
      {
        __int16 v28 = sub_100083F74();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          long long v29 = sub_100083FD0(0);
          *(_DWORD *)buf = 138543874;
          v48 = v29;
          __int16 v49 = 2112;
          uint64_t v50 = v10;
          __int16 v51 = 2112;
          v52 = v12;
          uint64_t v30 = "%{public}@characteristic %@: UUID %@ is already defined in the metadata";
          v31 = v28;
          uint32_t v32 = 32;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
        }
        goto LABEL_24;
      }
      CFStringRef v16 = [(HAPMetadata *)self parsedUUIDs];
      [v16 addObject:v12];

      uint64_t v17 = [v11 hmf_stringForKey:@"DefaultDescription"];
      uint64_t v18 = [v11 hmf_stringForKey:@"Format"];
      uint64_t v19 = [v11 hmf_numberForKey:@"Properties"];
      __int16 v20 = [(HAPMetadata *)self hapBaseUUIDSuffix];
      uint64_t v21 = [v12 stringByAppendingString:v20];

      v42 = (void *)v18;
      __int16 v22 = [[HAPMetadataCharacteristic alloc] initWithName:v10 uuid:v21 description:v17 format:v18 properties:v19];
      uint64_t v23 = [v11 hmf_stringForKey:@"Units"];
      [(HAPMetadataCharacteristic *)v22 setUnits:v23];

      __int16 v24 = [(HAPMetadata *)self parseCharacteristicValue:v11];
      if (v24) {
        [(HAPMetadataCharacteristic *)v22 setValueMetadata:v24];
      }
      if (v22)
      {
        [v37 setObject:v22 forKey:v21];
        [v36 setObject:v21 forKey:v10];
      }
      else
      {
        id v25 = sub_100083F74();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v35 = sub_100083FD0(0);
          *(_DWORD *)buf = v34;
          v48 = v35;
          __int16 v49 = 2112;
          uint64_t v50 = v10;
          __int16 v51 = 2112;
          v52 = v12;
          __int16 v53 = 2112;
          uint64_t v54 = (uint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@characteristic %@: Failed to parse - UUID %@  description %@", buf, 0x2Au);
        }
      }

      id v7 = v39;
      if (!v22) {
        goto LABEL_25;
      }
      BOOL v9 = (char *)v9 + 1;
      self = v38;
      if (v40 == v9)
      {
        CFStringRef v6 = v36;
        uint64_t v5 = v37;
        id v40 = [v39 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v40) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    __int16 v28 = sub_100083F74();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = sub_100083FD0(0);
      *(_DWORD *)buf = v34;
      v48 = v29;
      __int16 v49 = 2112;
      uint64_t v50 = v10;
      __int16 v51 = 2112;
      v52 = v12;
      __int16 v53 = 2048;
      uint64_t v54 = kMetadataShortUUIDLength;
      uint64_t v30 = "%{public}@characteristic %@: UUID '%@' length needs to be %lu";
      v31 = v28;
      uint32_t v32 = 42;
      goto LABEL_23;
    }
LABEL_24:

LABEL_25:
    id v27 = 0;
    CFStringRef v6 = v36;
    uint64_t v5 = v37;
    goto LABEL_26;
  }
LABEL_18:

  id v26 = [v6 copy];
  [(HAPMetadata *)self setHapCharacteristicNameTypeMap:v26];

  id v27 = [v5 copy];
LABEL_26:

  return v27;
}

- (id)parseServiceCharacteristics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = -[HAPMetadata characteristicTypeFromUTI:](self, "characteristicTypeFromUTI:", v11, (void)v18);
        if (!v12)
        {
          unsigned int v15 = sub_100083F74();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v16 = sub_100083FD0(0);
            *(_DWORD *)buf = 138543618;
            uint64_t v23 = v16;
            __int16 v24 = 2112;
            uint64_t v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Undefined characteristic %@ referenced", buf, 0x16u);
          }
          id v14 = 0;
          goto LABEL_13;
        }
        id v13 = (void *)v12;
        [v5 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = [v5 copy];
LABEL_13:

  return v14;
}

- (id)parseServices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPMetadata *)self hapCharacteristicMap];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    id v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obj = v4;
    id v70 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v77;
      *(void *)&long long v9 = 138543874;
      long long v62 = v9;
      id v63 = v4;
      v65 = v8;
      v66 = v7;
      v69 = self;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v77 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v76 + 1) + 8 * v10);
        uint64_t v12 = [obj hmf_dictionaryForKey:v11, v62];
        id v13 = [v12 hmf_stringForKey:@"ShortUUID"];
        id v14 = [v13 length];
        if (v14 != (id)kMetadataShortUUIDLength)
        {
          v56 = sub_100083F74();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v57 = sub_100083FD0(0);
            *(_DWORD *)buf = 138544130;
            v81 = v57;
            __int16 v82 = 2112;
            uint64_t v83 = v11;
            __int16 v84 = 2112;
            v85 = v13;
            __int16 v86 = 2048;
            uint64_t v87 = kMetadataShortUUIDLength;
            v58 = "%{public}@service %@: UUID '%@' length needs to be %lu";
            v59 = v56;
            uint32_t v60 = 42;
            goto LABEL_49;
          }
LABEL_50:

LABEL_51:
          id v54 = 0;
          id v4 = v63;
          id v8 = v65;
          id v7 = v66;
          goto LABEL_52;
        }
        unsigned int v15 = [(HAPMetadata *)self parsedUUIDs];
        unsigned int v16 = [v15 containsObject:v13];

        if (v16)
        {
          v56 = sub_100083F74();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v57 = sub_100083FD0(0);
            *(_DWORD *)buf = v62;
            v81 = v57;
            __int16 v82 = 2112;
            uint64_t v83 = v11;
            __int16 v84 = 2112;
            v85 = v13;
            v58 = "%{public}@service %@: UUID %@ is already defined in the metadata";
            v59 = v56;
            uint32_t v60 = 32;
LABEL_49:
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, v58, buf, v60);
          }
          goto LABEL_50;
        }
        uint64_t v17 = [(HAPMetadata *)self parsedUUIDs];
        [v17 addObject:v13];

        long long v18 = [v12 hmf_stringForKey:@"DefaultDescription"];
        long long v19 = [v12 hmf_dictionaryForKey:@"Characteristics"];
        long long v20 = [v19 hmf_arrayForKey:@"Required"];
        long long v21 = [(HAPMetadata *)self parseServiceCharacteristics:v20];

        __int16 v22 = v21;
        v75 = v21;
        if (![v21 count])
        {
          uint64_t v23 = sub_100083F74();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            sub_100083FD0(0);
            long long v43 = v23;
            v45 = long long v44 = v18;
            *(_DWORD *)buf = 138543618;
            v81 = v45;
            __int16 v82 = 2112;
            uint64_t v83 = v11;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}@service %@: No mandatory characteristics", buf, 0x16u);

            long long v18 = v44;
            uint64_t v23 = v43;
          }
          int v40 = 1;
          uint32_t v32 = v19;
          goto LABEL_38;
        }
        uint64_t v23 = [v12 hmf_numberForKey:@"ServiceProperties"];
        uint64_t v24 = [v12 hmf_arrayForKey:@"LinkedServices"];
        [(HAPMetadata *)self hapBaseUUIDSuffix];
        uint64_t v25 = v73 = v18;
        uint64_t v26 = [v13 stringByAppendingString:v25];

        long long v18 = v73;
        id v27 = [HAPMetadataService alloc];
        v72 = (void *)v26;
        __int16 v28 = v22;
        long long v29 = (void *)v24;
        uint64_t v30 = [(HAPMetadataService *)v27 initWithName:v11 uuid:v26 description:v73 mandatoryChrTypes:v28 properties:v23 linkedServices:v24];
        if (v30) {
          break;
        }
        int v40 = 1;
        uint32_t v32 = v19;
        uint64_t v41 = v29;
        v42 = v72;
LABEL_37:

        self = v69;
LABEL_38:

        if (v40) {
          goto LABEL_51;
        }
        if (v70 == (id)++v10)
        {
          id v4 = v63;
          id v8 = v65;
          id v7 = v66;
          id v70 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
          if (v70) {
            goto LABEL_4;
          }
          goto LABEL_41;
        }
      }
      v31 = [v12 hmf_stringForKey:@"BTLE_ShortUUID"];
      uint32_t v32 = v19;
      v68 = v31;
      if (v31)
      {
        uint64_t v33 = v31;
        id v34 = [v31 length];
        if (v34 != (id)kMetadataBTLEUUIDLength)
        {
          v38 = sub_100083F74();
          uint64_t v41 = v29;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            long long v46 = sub_100083FD0(0);
            *(_DWORD *)buf = 138544130;
            v81 = v46;
            __int16 v82 = 2112;
            uint64_t v83 = v11;
            __int16 v84 = 2112;
            v85 = v68;
            __int16 v86 = 2048;
            uint64_t v87 = kMetadataBTLEUUIDLength;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID '%@' length needs to be %lu", buf, 0x2Au);
          }
          int v40 = 1;
          v42 = v72;
          goto LABEL_36;
        }
        v35 = v33;
        v67 = v32;
        __int16 v36 = [(HAPMetadata *)v69 parsedUUIDs];
        unsigned int v37 = [v36 containsObject:v35];

        if (v37)
        {
          v38 = sub_100083F74();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = sub_100083FD0(0);
            *(_DWORD *)buf = v62;
            v81 = v39;
            __int16 v82 = 2112;
            uint64_t v83 = v11;
            __int16 v84 = 2112;
            v85 = v68;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@service %@: BTLE UUID %@ is already defined in the metadata", buf, 0x20u);
          }
          int v40 = 1;
          uint64_t v41 = v29;
          v42 = v72;
LABEL_35:
          uint32_t v32 = v67;
LABEL_36:

          long long v18 = v73;
          goto LABEL_37;
        }
        v47 = [(HAPMetadata *)v69 parsedUUIDs];
        [v47 addObject:v35];

        [(HAPMetadataService *)v30 setBtleuuidStr:v35];
        uint32_t v32 = v67;
      }
      v67 = v32;
      v48 = [v32 hmf_arrayForKey:@"Optional"];
      v38 = [(HAPMetadata *)v69 parseServiceCharacteristics:v48];

      uint64_t v41 = v29;
      if (v38)
      {
        v42 = v72;
        if ([v38 count]) {
          [(HAPMetadataService *)v30 setOptionalCharacteristics:v38];
        }
        buf[0] = 0;
        unsigned int v49 = [v12 hmf_BOOLForKey:@"AllowAssociatedService" isPresent:buf];
        if (buf[0]) {
          uint64_t v50 = v49;
        }
        else {
          uint64_t v50 = 0;
        }
        [(HAPMetadataService *)v30 setAllowAssociatedService:v50];
        [v66 setObject:v30 forKey:v72];
        [v65 setObject:v72 forKey:v11];
        int v40 = 0;
      }
      else
      {
        __int16 v51 = sub_100083F74();
        v42 = v72;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          sub_100083FD0(0);
          v52 = log = v51;
          *(_DWORD *)buf = 138543618;
          v81 = v52;
          __int16 v82 = 2112;
          uint64_t v83 = v11;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@service %@: Error parsing optional characteristics", buf, 0x16u);

          __int16 v51 = log;
        }

        int v40 = 1;
      }
      goto LABEL_35;
    }
LABEL_41:

    id v53 = [v8 copy];
    [(HAPMetadata *)self setHapServiceNameTypeMap:v53];

    id v54 = [v7 copy];
LABEL_52:
  }
  else
  {
    id v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v55 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v81 = v55;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@No HAP characteristics", buf, 0xCu);
    }
    id v54 = 0;
  }

  return v54;
}

- (id)parseCharacteristicServiceTuples:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (!v7)
  {
LABEL_18:

    id v25 = [v5 copy];
    goto LABEL_26;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v40;
LABEL_3:
  uint64_t v10 = 0;
LABEL_4:
  if (*(void *)v40 != v9) {
    objc_enumerationMutation(v6);
  }
  uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * v10);
  uint64_t v12 = [(HAPMetadata *)self characteristicTypeFromUTI:v11];
  if (v12)
  {
    id v13 = v12;
    uint64_t v33 = v11;
    id v14 = [v6 hmf_arrayForKey:v11];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (!v16) {
      goto LABEL_16;
    }
    id v17 = v16;
    uint64_t v18 = *(void *)v36;
    id v34 = v6;
    id v31 = v8;
    uint64_t v32 = v9;
    uint64_t v30 = v10;
LABEL_9:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v36 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * v19);
      uint64_t v21 = [(HAPMetadata *)self serviceTypeFromUTI:v20];
      if (!v21) {
        break;
      }
      __int16 v22 = v21;
      uint64_t v23 = [[HAPMetadataTuple alloc] initWithCharacteristicType:v13 serviceType:v21];
      if (!v23)
      {
        uint64_t v26 = sub_100083F74();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = sub_100083FD0(0);
          *(_DWORD *)buf = 138543874;
          long long v44 = v27;
          __int16 v45 = 2112;
          uint64_t v46 = v33;
          __int16 v47 = 2112;
          uint64_t v48 = v20;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP metadata tuple %@,%@", buf, 0x20u);
        }
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v24 = v23;
      [v5 addObject:v23];

      if (v17 == (id)++v19)
      {
        id v17 = [v15 countByEnumeratingWithState:&v35 objects:v49 count:16];
        id v6 = v34;
        id v8 = v31;
        uint64_t v9 = v32;
        uint64_t v10 = v30;
        if (v17) {
          goto LABEL_9;
        }
LABEL_16:

        if ((id)++v10 == v8)
        {
          id v8 = [v6 countByEnumeratingWithState:&v39 objects:v50 count:16];
          if (!v8) {
            goto LABEL_18;
          }
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
    __int16 v22 = sub_100083F74();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      long long v44 = v26;
      __int16 v45 = 2112;
      uint64_t v46 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown service '%@' while parsing tuple", buf, 0x16u);
      goto LABEL_23;
    }
LABEL_24:
    id v6 = v34;

    goto LABEL_25;
  }
  id v13 = sub_100083F74();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    long long v29 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    long long v44 = v29;
    __int16 v45 = 2112;
    uint64_t v46 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown characteristic '%@' while parsing tuple", buf, 0x16u);
  }
LABEL_25:

  id v25 = 0;
LABEL_26:

  return v25;
}

- (BOOL)parseMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 hmf_stringForKey:@"Base UUID"];
  id v6 = v5;
  if (!v5)
  {
    id v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      long long v37 = v18;
      uint64_t v19 = "%{public}@Failed to parse HAP base UUID suffix";
      uint64_t v20 = v8;
      uint32_t v21 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    }
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_35;
  }
  id v7 = [v5 length];
  if (v7 != (id)kMetadataBaseUUIDSuffixLength)
  {
    id v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543874;
      long long v37 = v18;
      __int16 v38 = 2048;
      id v39 = [v6 length];
      __int16 v40 = 2048;
      uint64_t v41 = kMetadataBaseUUIDSuffixLength;
      uint64_t v19 = "%{public}@Base UUID suffix length is %lu, should be %lu";
      uint64_t v20 = v8;
      uint32_t v21 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  [(HAPMetadata *)self setHapBaseUUIDSuffix:v6];
  id v8 = [v4 hmf_dictionaryForKey:@"Units"];
  uint64_t v9 = [(HAPMetadata *)self parseUnits:v8];
  if (v9)
  {
    [(HAPMetadata *)self setHapUnitMap:v9];
    uint64_t v10 = [v4 hmf_dictionaryForKey:@"Properties"];
    uint64_t v11 = [(HAPMetadata *)self parseProperties:v10];
    if (v11)
    {
      [(HAPMetadata *)self setHapPropertyMap:v11];
      uint64_t v12 = [v4 hmf_dictionaryForKey:@"Characteristics"];
      id v13 = [(HAPMetadata *)self parseCharacteristics:v12];
      if (v13)
      {
        [(HAPMetadata *)self setHapCharacteristicMap:v13];
        uint64_t v14 = [v4 hmf_dictionaryForKey:@"Services"];
        uint64_t v15 = [(HAPMetadata *)self parseServices:v14];
        id v34 = (void *)v15;
        long long v35 = (void *)v14;
        if (v15)
        {
          id v31 = v13;
          [(HAPMetadata *)self setHapServiceMap:v15];
          [v4 hmf_dictionaryForKey:@"SupportsAuthorizationData"];
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
          id v16 = -[HAPMetadata parseCharacteristicServiceTuples:](self, "parseCharacteristicServiceTuples:");
          BOOL v17 = v16 != 0;
          if (v16)
          {
            [(HAPMetadata *)self setHapSupportsAuthDataSet:v16];
          }
          else
          {
            __int16 v28 = sub_100083F74();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v30 = sub_100083FD0(0);
              *(_DWORD *)buf = 138543618;
              long long v37 = v30;
              __int16 v38 = 2112;
              id v39 = log;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP addAuthData tuples: %@", buf, 0x16u);
            }
          }

          id v13 = v31;
          uint64_t v26 = log;
        }
        else
        {
          uint64_t v26 = sub_100083F74();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            sub_100083FD0(0);
            id v27 = loga = v26;
            *(_DWORD *)buf = 138543618;
            long long v37 = v27;
            __int16 v38 = 2112;
            id v39 = (id)v14;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP services: %@", buf, 0x16u);

            uint64_t v26 = loga;
          }
          BOOL v17 = 0;
        }
      }
      else
      {
        uint64_t v24 = sub_100083F74();
        long long v35 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = sub_100083FD0(0);
          *(_DWORD *)buf = 138543618;
          long long v37 = v25;
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP characteristics: %@", buf, 0x16u);
        }
        BOOL v17 = 0;
      }
    }
    else
    {
      uint64_t v12 = sub_100083F74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = sub_100083FD0(0);
        *(_DWORD *)buf = 138543618;
        long long v37 = v23;
        __int16 v38 = 2112;
        id v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP properties: %@", buf, 0x16u);
      }
      BOOL v17 = 0;
    }
  }
  else
  {
    uint64_t v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      long long v37 = v22;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAP units: %@", buf, 0x16u);
    }
    BOOL v17 = 0;
  }

LABEL_35:
  return v17;
}

+ (id)shortenHAPType:(id)a3 baseUUIDSuffix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasSuffix:v6])
  {
    [v5 substringToIndex:((unsigned char *)[v5 length] - (unsigned char *)[v6 length])];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (id)serviceUTIFromType:(id)a3
{
  id v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  id v4 = [v3 name];

  return v4;
}

- (id)serviceTypeFromUTI:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapServiceNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)characteristicUTIFromType:(id)a3
{
  id v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  id v4 = [v3 name];

  return v4;
}

- (id)characteristicTypeFromUTI:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapCharacteristicNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)isStandardHAPService:(id)a3
{
  id v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isStandardHAPServiceName:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapServiceNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)isStandardHAPCharacteristic:(id)a3
{
  id v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isStandardHAPCharacteristicName:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapCharacteristicNameTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)isStandardHAPUnitName:(id)a3
{
  id v3 = [(HAPMetadata *)self hapUnitFromName:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)allowAssociatedService:(id)a3
{
  id v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  unsigned __int8 v4 = [v3 allowAssociatedService];

  return v4;
}

- (BOOL)validateMandatoryCharacteristics:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = [(HAPMetadata *)self hapServiceFromType:a4];
  id v8 = +[NSSet setWithArray:v6];

  uint64_t v9 = [v7 mandatoryCharacteristics];
  if ([v9 count])
  {
    uint64_t v10 = [v7 mandatoryCharacteristics];
    unsigned __int8 v11 = [v10 isSubsetOfSet:v8];
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (id)descriptionFromServiceType:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapServiceFromType:v4];
  id v6 = [v5 svcDescription];
  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

- (id)descriptionFromCharacteristicType:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapCharacteristicFromType:v4];
  id v6 = [v5 chrDescription];
  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)isMandatoryCharacteristic:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = [(HAPMetadata *)self hapServiceFromType:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 mandatoryCharacteristics];
    unsigned __int8 v10 = [v9 containsObject:v6];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)characteristicValueUnitOfType:(id)a3
{
  id v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  id v4 = [v3 units];

  return v4;
}

- (id)btleToServiceType:(id)a3
{
  id v4 = a3;
  if ([v4 hasSuffix:@"-0000-1000-8000-00805F9B34FB"])
  {
    id v5 = [v4 length];
    if (v5 == [@"00000000-0000-1000-8000-00805F9B34FB" length])
    {
      id v6 = [v4 substringWithRange:NSMakeRange(4, 4)];
      id v7 = v6;
      if (v6)
      {
        id v8 = v6;

        id v4 = v8;
      }
    }
  }
  uint64_t v9 = [(HAPMetadata *)self hapServiceMap];
  unsigned __int8 v10 = [v9 allValues];
  unsigned __int8 v11 = [v10 hmf_firstObjectWithValue:v4 forKeyPath:@"btleuuidStr"];

  uint64_t v12 = [v11 uuidStr];

  return v12;
}

- (id)serviceTypeToBTLE:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapServiceFromType:v4];
  id v6 = [v5 btleuuidStr];

  if (v6)
  {
    id v7 = [v5 btleuuidStr];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)supportsAdditionalAuthorizationData:(id)a3 forService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HAPMetadataTuple alloc] initWithCharacteristicType:v7 serviceType:v6];

  uint64_t v9 = [(HAPMetadata *)self hapSupportsAuthDataSet];
  LOBYTE(self) = [v9 containsObject:v8];

  return (char)self;
}

- (id)getDefaultCharacteristicMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapCharacteristicMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 valueMetadata];
  id v8 = [v7 minLength];
  if (v8
    || ([v7 maxLength], (id v8 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v7 minValue], (id v8 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v7 maxValue], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_6:
    uint64_t v9 = objc_alloc_init(HAPMetadataConstraints);
    unsigned __int8 v10 = [v7 minValue];
    [(HAPMetadataConstraints *)v9 setMinimumValue:v10];

    unsigned __int8 v11 = [v7 maxValue];
    [(HAPMetadataConstraints *)v9 setMaximumValue:v11];

    uint64_t v12 = [v7 stepValue];
    [(HAPMetadataConstraints *)v9 setStepValue:v12];

    id v13 = [v7 minLength];
    [(HAPMetadataConstraints *)v9 setMinLength:v13];

    uint64_t v14 = [v7 maxLength];
    [(HAPMetadataConstraints *)v9 setMaxLength:v14];

    uint64_t v15 = [v7 validValues];
    [(HAPMetadataConstraints *)v9 setValidValues:v15];

    goto LABEL_7;
  }
  uint64_t v9 = [v7 stepValue];

  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  id v16 = [HAPCharacteristicMetadata alloc];
  BOOL v17 = [v6 chrDescription];
  uint64_t v18 = [v6 format];
  uint64_t v19 = [v6 units];
  uint64_t v20 = [(HAPCharacteristicMetadata *)v16 initWithConstraints:v9 description:v17 format:v18 units:v19];

  return v20;
}

- (id)getDefaultCharacteristicProperties:(id)a3
{
  id v3 = [(HAPMetadata *)self hapCharacteristicFromType:a3];
  id v4 = [v3 properties];

  return v4;
}

- (id)getDefaultServiceProperties:(id)a3
{
  id v3 = [(HAPMetadata *)self hapServiceFromType:a3];
  id v4 = [v3 properties];

  return v4;
}

- (id)hapCharacteristicFromName:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapCharacteristicMap];
  id v6 = [(HAPMetadata *)self hapCharacteristicNameTypeMap];
  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (id)hapCharacteristicFromType:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapCharacteristicMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)hapServiceFromName:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapServiceMap];
  id v6 = [(HAPMetadata *)self hapServiceNameTypeMap];
  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (id)hapServiceFromType:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapServiceMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)hapUnitFromName:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPMetadata *)self hapUnitMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSArray)hapValueUnits
{
  v2 = [(HAPMetadata *)self hapUnitMap];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)hapProperties
{
  v2 = [(HAPMetadata *)self hapPropertyMap];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)hapCharacteristics
{
  v2 = [(HAPMetadata *)self hapCharacteristicMap];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)hapServices
{
  v2 = [(HAPMetadata *)self hapServiceMap];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSArray)hapSupportsAuthDataTuples
{
  v2 = [(HAPMetadata *)self hapSupportsAuthDataSet];
  id v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (HAPMetadata)initWithServices:(id)a3 characteristics:(id)a4 units:(id)a5 properties:(id)a6 addAuthDataTuples:(id)a7 hapBaseUUIDSuffix:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (![v13 count]
    || ![v14 count]
    || ![v15 count]
    || ![v16 count]
    || ![v17 count])
  {
    goto LABEL_44;
  }
  v113.receiver = self;
  v113.super_class = (Class)HAPMetadata;
  v92 = [(HAPMetadata *)&v113 init];
  if (!v92)
  {
    self = 0;
LABEL_44:
    v92 = 0;
    goto LABEL_45;
  }
  v81 = v18;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v14 count]);
  self = (HAPMetadata *)objc_claimAutoreleasedReturnValue();
  v90 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v14 count]);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v84 = v14;
  id v19 = v14;
  id v20 = [v19 countByEnumeratingWithState:&v109 objects:v118 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v110;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v110 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        id v25 = [v24 uuidStr];
        [(HAPMetadata *)self setObject:v24 forKey:v25];

        uint64_t v26 = [v24 uuidStr];
        id v27 = [v24 name];
        [v90 setObject:v26 forKey:v27];
      }
      id v21 = [v19 countByEnumeratingWithState:&v109 objects:v118 count:16];
    }
    while (v21);
  }

  __int16 v28 = (NSDictionary *)[(HAPMetadata *)self copy];
  hapCharacteristicMap = v92->_hapCharacteristicMap;
  v92->_hapCharacteristicMap = v28;

  uint64_t v30 = (NSDictionary *)[v90 copy];
  hapCharacteristicNameTypeMap = v92->_hapCharacteristicNameTypeMap;
  v92->_hapCharacteristicNameTypeMap = v30;

  v89 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v13 count]);
  v88 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v13 count]);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v32 = v13;
  id v33 = [v32 countByEnumeratingWithState:&v105 objects:v117 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v106;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v106 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v37 = *(void **)(*((void *)&v105 + 1) + 8 * (void)j);
        __int16 v38 = [v37 uuidStr];
        [v89 setObject:v37 forKey:v38];

        id v39 = [v37 uuidStr];
        __int16 v40 = [v37 name];
        [v88 setObject:v39 forKey:v40];
      }
      id v34 = [v32 countByEnumeratingWithState:&v105 objects:v117 count:16];
    }
    while (v34);
  }

  uint64_t v41 = (NSDictionary *)[v89 copy];
  hapServiceMap = v92->_hapServiceMap;
  v92->_hapServiceMap = v41;

  long long v43 = (NSDictionary *)[v88 copy];
  hapServiceNameTypeMap = v92->_hapServiceNameTypeMap;
  v92->_hapServiceNameTypeMap = v43;

  uint64_t v87 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v15 count]);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v45 = v15;
  id v46 = [v45 countByEnumeratingWithState:&v101 objects:v116 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v102;
    do
    {
      for (k = 0; k != v47; k = (char *)k + 1)
      {
        if (*(void *)v102 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void **)(*((void *)&v101 + 1) + 8 * (void)k);
        __int16 v51 = [v50 name];
        [v87 setObject:v50 forKey:v51];
      }
      id v47 = [v45 countByEnumeratingWithState:&v101 objects:v116 count:16];
    }
    while (v47);
  }
  uint64_t v83 = v16;
  id v85 = v13;

  v52 = (NSDictionary *)[v87 copy];
  hapUnitMap = v92->_hapUnitMap;
  v92->_hapUnitMap = v52;

  __int16 v86 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v17 count]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v82 = v17;
  id v54 = v17;
  id v55 = [v54 countByEnumeratingWithState:&v97 objects:v115 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v98;
    do
    {
      for (m = 0; m != v56; m = (char *)m + 1)
      {
        if (*(void *)v98 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v97 + 1) + 8 * (void)m);
        uint32_t v60 = [HAPMetadataTuple alloc];
        v61 = [v59 characteristicType];
        long long v62 = [(HAPMetadata *)v92 characteristicTypeFromUTI:v61];
        id v63 = [v59 serviceType];
        v64 = [(HAPMetadata *)v92 serviceTypeFromUTI:v63];
        v65 = [(HAPMetadataTuple *)v60 initWithCharacteristicType:v62 serviceType:v64];

        [v86 addObject:v65];
      }
      id v56 = [v54 countByEnumeratingWithState:&v97 objects:v115 count:16];
    }
    while (v56);
  }

  v66 = (NSSet *)[v86 copy];
  hapSupportsAuthDataSet = v92->_hapSupportsAuthDataSet;
  v92->_hapSupportsAuthDataSet = v66;

  id v16 = v83;
  v68 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v83 count]);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v69 = v83;
  id v70 = [v69 countByEnumeratingWithState:&v93 objects:v114 count:16];
  id v17 = v82;
  if (v70)
  {
    id v71 = v70;
    uint64_t v72 = *(void *)v94;
    do
    {
      for (n = 0; n != v71; n = (char *)n + 1)
      {
        if (*(void *)v94 != v72) {
          objc_enumerationMutation(v69);
        }
        v74 = *(void **)(*((void *)&v93 + 1) + 8 * (void)n);
        v75 = [v74 propertyType];
        [v68 setObject:v74 forKey:v75];
      }
      id v71 = [v69 countByEnumeratingWithState:&v93 objects:v114 count:16];
    }
    while (v71);
  }

  long long v76 = (NSDictionary *)[v68 copy];
  hapPropertyMap = v92->_hapPropertyMap;
  v92->_hapPropertyMap = v76;

  id v18 = v81;
  long long v78 = (NSString *)[v81 copy];
  hapBaseUUIDSuffix = v92->_hapBaseUUIDSuffix;
  v92->_hapBaseUUIDSuffix = v78;

  [(HAPMetadata *)v92 updateRawPlist];
  id v14 = v84;
  id v13 = v85;
LABEL_45:

  return v92;
}

- (BOOL)updateRawPlist
{
  id v3 = [(HAPMetadata *)self generateDictionary];
  if (v3)
  {
    objc_storeStrong((id *)&self->_rawPlist, v3);
  }
  else
  {
    id v4 = sub_100083F74();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = sub_100083FD0(0);
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate plist.", (uint8_t *)&v7, 0xCu);
    }
  }

  return v3 != 0;
}

- (id)generateDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(HAPMetadata *)self hapBaseUUIDSuffix];

  if (v4)
  {
    id v5 = [(HAPMetadata *)self hapBaseUUIDSuffix];
    [v3 setObject:v5 forKeyedSubscript:@"Base UUID"];
  }
  id v6 = +[NSMutableDictionary dictionary];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  int v7 = [(HAPMetadata *)self hapValueUnits];
  id v8 = [v7 countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v70;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v70 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        id v13 = [v12 generateDictionary];
        id v14 = [v12 name];
        [v6 setObject:v13 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v69 objects:v80 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    [v3 setObject:v6 forKeyedSubscript:@"Units"];
  }
  id v54 = v3;
  id v15 = +[NSMutableDictionary dictionary];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v16 = [(HAPMetadata *)self hapProperties];
  id v17 = [v16 countByEnumeratingWithState:&v65 objects:v79 count:16];
  id v53 = v6;
  id v55 = v15;
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v66;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
        uint64_t v22 = [v21 generateDictionary];
        if (v22)
        {
          uint64_t v23 = [v21 propertyType];
          [v15 setObject:v22 forKeyedSubscript:v23];
        }
        else
        {
          uint64_t v23 = sub_100083F74();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = sub_100083FD0(0);
            id v25 = [v21 propertyType];
            *(_DWORD *)buf = 138543618;
            long long v76 = v24;
            __int16 v77 = 2112;
            long long v78 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP property %@", buf, 0x16u);

            id v15 = v55;
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v65 objects:v79 count:16];
    }
    while (v18);
  }

  if ([v15 count]) {
    [v54 setObject:v15 forKeyedSubscript:@"Properties"];
  }
  uint64_t v26 = [(HAPMetadata *)self hapSupportsAuthDataSet];
  id v27 = [(HAPMetadata *)self generateHAPMetadataTuplesDictionary:v26];

  if ([v27 count]) {
    [v54 setObject:v27 forKeyedSubscript:@"SupportsAuthorizationData"];
  }
  v52 = v27;
  id v56 = +[NSMutableDictionary dictionary];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  __int16 v28 = [(HAPMetadata *)self hapCharacteristics];
  id v29 = [v28 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v62;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(*((void *)&v61 + 1) + 8 * (void)k);
        id v34 = [(HAPMetadata *)self hapBaseUUIDSuffix];
        uint64_t v35 = [v33 generateDictionary:v34];

        if (v35)
        {
          long long v36 = [v33 name];
          [v56 setObject:v35 forKeyedSubscript:v36];
        }
        else
        {
          long long v36 = sub_100083F74();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            long long v37 = sub_100083FD0(0);
            __int16 v38 = [v33 name];
            *(_DWORD *)buf = 138543618;
            long long v76 = v37;
            __int16 v77 = 2112;
            long long v78 = v38;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP characteristic %@", buf, 0x16u);
          }
        }
      }
      id v30 = [v28 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v30);
  }

  if ([v56 count]) {
    [v54 setObject:v56 forKeyedSubscript:@"Characteristics"];
  }
  id v39 = +[NSMutableDictionary dictionary];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  __int16 v40 = [(HAPMetadata *)self hapServices];
  id v41 = [v40 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v58;
    do
    {
      for (m = 0; m != v42; m = (char *)m + 1)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(v40);
        }
        id v45 = *(void **)(*((void *)&v57 + 1) + 8 * (void)m);
        id v46 = [(HAPMetadata *)self hapBaseUUIDSuffix];
        id v47 = [v45 generateDictionary:v46 metadata:self];

        if (v47)
        {
          uint64_t v48 = [v45 name];
          [v39 setObject:v47 forKeyedSubscript:v48];
        }
        else
        {
          uint64_t v48 = sub_100083F74();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v49 = sub_100083FD0(0);
            uint64_t v50 = [v45 name];
            *(_DWORD *)buf = 138543618;
            long long v76 = v49;
            __int16 v77 = 2112;
            long long v78 = v50;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate dictionary for HAP service %@", buf, 0x16u);
          }
        }
      }
      id v42 = [v40 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v42);
  }

  if ([v39 count]) {
    [v54 setObject:v39 forKeyedSubscript:@"Services"];
  }

  return v54;
}

- (id)generateHAPMetadataTuplesDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 characteristicType:v18];
        id v13 = [(HAPMetadata *)self characteristicUTIFromType:v12];

        id v14 = [v11 serviceType];
        id v15 = [(HAPMetadata *)self serviceUTIFromType:v14];

        id v16 = [v5 objectForKeyedSubscript:v13];
        if (!v16)
        {
          id v16 = +[NSMutableArray array];
          [v5 setObject:v16 forKeyedSubscript:v13];
        }
        [v16 addObject:v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(id)a3
{
}

- (NSString)hapBaseUUIDSuffix
{
  return self->_hapBaseUUIDSuffix;
}

- (void)setHapBaseUUIDSuffix:(id)a3
{
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSMutableArray)parsedUUIDs
{
  return self->_parsedUUIDs;
}

- (void)setParsedUUIDs:(id)a3
{
}

- (NSDictionary)hapUnitMap
{
  return self->_hapUnitMap;
}

- (void)setHapUnitMap:(id)a3
{
}

- (NSDictionary)hapPropertyMap
{
  return self->_hapPropertyMap;
}

- (void)setHapPropertyMap:(id)a3
{
}

- (NSDictionary)hapCharacteristicMap
{
  return self->_hapCharacteristicMap;
}

- (void)setHapCharacteristicMap:(id)a3
{
}

- (NSDictionary)hapServiceMap
{
  return self->_hapServiceMap;
}

- (void)setHapServiceMap:(id)a3
{
}

- (NSSet)hapSupportsAuthDataSet
{
  return self->_hapSupportsAuthDataSet;
}

- (void)setHapSupportsAuthDataSet:(id)a3
{
}

- (NSDictionary)hapCharacteristicNameTypeMap
{
  return self->_hapCharacteristicNameTypeMap;
}

- (void)setHapCharacteristicNameTypeMap:(id)a3
{
}

- (NSDictionary)hapServiceNameTypeMap
{
  return self->_hapServiceNameTypeMap;
}

- (void)setHapServiceNameTypeMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapServiceNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicNameTypeMap, 0);
  objc_storeStrong((id *)&self->_hapSupportsAuthDataSet, 0);
  objc_storeStrong((id *)&self->_hapServiceMap, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicMap, 0);
  objc_storeStrong((id *)&self->_hapPropertyMap, 0);
  objc_storeStrong((id *)&self->_hapUnitMap, 0);
  objc_storeStrong((id *)&self->_parsedUUIDs, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_hapBaseUUIDSuffix, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end