@interface HAPMetadataService
- (BOOL)allowAssociatedService;
- (HAPMetadataService)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 mandatoryChrTypes:(id)a6 properties:(id)a7 linkedServices:(id)a8;
- (NSArray)linkedServices;
- (NSNumber)properties;
- (NSSet)mandatoryCharacteristics;
- (NSSet)optionalCharacteristics;
- (NSString)btleuuidStr;
- (NSString)name;
- (NSString)svcDescription;
- (NSString)uuidStr;
- (id)description;
- (id)generateDictionary:(id)a3 metadata:(id)a4;
- (void)dump;
- (void)setAllowAssociatedService:(BOOL)a3;
- (void)setBtleuuidStr:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setMandatoryCharacteristics:(id)a3;
- (void)setName:(id)a3;
- (void)setOptionalCharacteristics:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSvcDescription:(id)a3;
- (void)setUuidStr:(id)a3;
@end

@implementation HAPMetadataService

- (HAPMetadataService)initWithName:(id)a3 uuid:(id)a4 description:(id)a5 mandatoryChrTypes:(id)a6 properties:(id)a7 linkedServices:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = 0;
  if (v14 && v15 && v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)HAPMetadataService;
    id v20 = [(HAPMetadataService *)&v29 init];
    if (v20)
    {
      id v21 = [v14 copy];
      v22 = (void *)*((void *)v20 + 2);
      *((void *)v20 + 2) = v21;

      id v23 = [v15 copy];
      v24 = (void *)*((void *)v20 + 4);
      *((void *)v20 + 4) = v23;

      id v25 = [v16 copy];
      v26 = (void *)*((void *)v20 + 3);
      *((void *)v20 + 3) = v25;

      objc_storeStrong((id *)v20 + 8, a6);
      objc_storeStrong((id *)v20 + 6, a7);
      id v27 = v19;
      self = (HAPMetadataService *)*((void *)v20 + 7);
      *((void *)v20 + 7) = v27;
    }
    else
    {
      self = 0;
    }
  }

  return (HAPMetadataService *)v20;
}

- (id)generateDictionary:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableDictionary dictionary];
  v9 = [(HAPMetadataService *)self uuidStr];
  v30 = v6;
  v10 = +[HAPMetadata shortenHAPType:v9 baseUUIDSuffix:v6];
  [v8 setObject:v10 forKeyedSubscript:@"ShortUUID"];

  v11 = [(HAPMetadataService *)self svcDescription];
  [v8 setObject:v11 forKeyedSubscript:@"DefaultDescription"];

  [v8 setObject:&stru_10027B0E8 forKeyedSubscript:@"LocalizationKey"];
  v12 = [(HAPMetadataService *)self btleuuidStr];

  if (v12)
  {
    v13 = [(HAPMetadataService *)self btleuuidStr];
    [v8 setObject:v13 forKeyedSubscript:@"BTLE_ShortUUID"];
  }
  id v14 = +[NSMutableDictionary dictionary];
  id v15 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = [(HAPMetadataService *)self mandatoryCharacteristics];
  id v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [v7 characteristicUTIFromType:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        if (v21) {
          [v15 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v18);
  }

  if ([v15 count]) {
    [v14 setObject:v15 forKeyedSubscript:@"Required"];
  }
  v22 = +[NSMutableArray array];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = [(HAPMetadataService *)self mandatoryCharacteristics];
  id v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [v7 characteristicUTIFromType:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)];
        if (v28) {
          [v22 addObject:v28];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }

  if ([v22 count]) {
    [v14 setObject:v22 forKeyedSubscript:@"Optional"];
  }
  if ([v14 count]) {
    [v8 setObject:v14 forKeyedSubscript:@"Characteristics"];
  }
  if ([(HAPMetadataService *)self allowAssociatedService]) {
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AllowAssociatedService"];
  }

  return v8;
}

- (id)description
{
  v3 = +[NSMutableString string];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v4 = [(HAPMetadataService *)self mandatoryCharacteristics];
  id v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v10 = [v9 name];
        v11 = [v9 uuidStr];
        [v3 appendFormat:@"%@(%@),", v10, v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  v12 = +[NSMutableString string];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v13 = [(HAPMetadataService *)self optionalCharacteristics];
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        uint64_t v19 = [v18 name];
        id v20 = [v18 uuidStr];
        [v12 appendFormat:@"%@(%@),", v19, v20];
      }
      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }

  id v21 = [(HAPMetadataService *)self name];
  v22 = [(HAPMetadataService *)self uuidStr];
  id v23 = [(HAPMetadataService *)self svcDescription];
  id v24 = +[NSString stringWithFormat:@"HAPMetadataService %@(%@) - %@ - mandatory %@, optional %@", v21, v22, v23, v3, v12];

  return v24;
}

- (void)dump
{
  v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100083FD0(0);
    id v5 = [(HAPMetadataService *)self name];
    id v6 = [(HAPMetadataService *)self uuidStr];
    uint64_t v7 = [(HAPMetadataService *)self svcDescription];
    *(_DWORD *)buf = 138544130;
    v53 = v4;
    __int16 v54 = 2112;
    unint64_t v55 = (unint64_t)v5;
    __int16 v56 = 2112;
    v57 = v6;
    __int16 v58 = 2112;
    v59 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@HAPMetadataCharaceristics %@(%@):  description: %@", buf, 0x2Au);
  }
  if ([(HAPMetadataService *)self allowAssociatedService])
  {
    v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = sub_100083FD0(0);
      unsigned int v10 = [(HAPMetadataService *)self allowAssociatedService];
      *(_DWORD *)buf = 138543618;
      v53 = v9;
      __int16 v54 = 2048;
      unint64_t v55 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@AllowAssociatedService: %ld", buf, 0x16u);
    }
  }
  v11 = [(HAPMetadataService *)self mandatoryCharacteristics];
  id v12 = [v11 count];

  if (v12)
  {
    v13 = sub_100083F74();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v53 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Mandatory characteristics:", buf, 0xCu);
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v41 = self;
    id v15 = [(HAPMetadataService *)self mandatoryCharacteristics];
    id v16 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v47;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v21 = sub_100083F74();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = sub_100083FD0(0);
            id v23 = [v20 name];
            id v24 = [v20 uuidStr];
            id v25 = [v20 chrDescription];
            *(_DWORD *)buf = 138544130;
            v53 = v22;
            __int16 v54 = 2112;
            unint64_t v55 = (unint64_t)v23;
            __int16 v56 = 2112;
            v57 = v24;
            __int16 v58 = 2112;
            v59 = v25;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v17);
    }

    self = v41;
  }
  long long v26 = [(HAPMetadataService *)self optionalCharacteristics];
  id v27 = [v26 count];

  if (v27)
  {
    long long v28 = sub_100083F74();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      long long v29 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v53 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}@Optional characteristics:", buf, 0xCu);
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v30 = [(HAPMetadataService *)self optionalCharacteristics];
    id v31 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v43;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
          long long v36 = sub_100083F74();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            long long v37 = sub_100083FD0(0);
            long long v38 = [v35 name];
            v39 = [v35 uuidStr];
            v40 = [v35 chrDescription];
            *(_DWORD *)buf = 138544130;
            v53 = v37;
            __int16 v54 = 2112;
            unint64_t v55 = (unint64_t)v38;
            __int16 v56 = 2112;
            v57 = v39;
            __int16 v58 = 2112;
            v59 = v40;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}@%@(%@) - %@", buf, 0x2Au);
          }
        }
        id v32 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v32);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)svcDescription
{
  return self->_svcDescription;
}

- (void)setSvcDescription:(id)a3
{
}

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
}

- (NSString)btleuuidStr
{
  return self->_btleuuidStr;
}

- (void)setBtleuuidStr:(id)a3
{
}

- (NSNumber)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
}

- (NSSet)mandatoryCharacteristics
{
  return self->_mandatoryCharacteristics;
}

- (void)setMandatoryCharacteristics:(id)a3
{
}

- (NSSet)optionalCharacteristics
{
  return self->_optionalCharacteristics;
}

- (void)setOptionalCharacteristics:(id)a3
{
}

- (BOOL)allowAssociatedService
{
  return self->_allowAssociatedService;
}

- (void)setAllowAssociatedService:(BOOL)a3
{
  self->_allowAssociatedService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalCharacteristics, 0);
  objc_storeStrong((id *)&self->_mandatoryCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_btleuuidStr, 0);
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_svcDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end