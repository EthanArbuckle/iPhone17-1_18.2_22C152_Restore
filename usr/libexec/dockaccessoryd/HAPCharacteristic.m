@interface HAPCharacteristic
- (BOOL)eventNotificationsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWriteWithResponseImplicitlySupported;
- (BOOL)mergeObject:(id)a3;
- (BOOL)prohibitCaching;
- (BOOL)shouldValidateValueAfterReading;
- (BOOL)supportsAdditionalAuthorizationData;
- (BOOL)supportsEventNotificationContext;
- (BOOL)supportsWriteWithResponse;
- (CBCharacteristic)cbCharacteristic;
- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 implicitWriteWithResponse:(BOOL)a9 metadata:(id)a10;
- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 metadata:(id)a9;
- (HAPCharacteristicMetadata)accessoryMetadata;
- (HAPCharacteristicMetadata)metadata;
- (HAPService)service;
- (NSData)notificationContext;
- (NSDate)valueUpdatedTime;
- (NSNumber)instanceID;
- (NSNumber)stateNumber;
- (NSString)description;
- (NSString)type;
- (id)_generateValidMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertiesDescription;
- (id)shortDescription;
- (id)validateValue:(id)a3 outValue:(id *)a4;
- (id)value;
- (unint64_t)hash;
- (unint64_t)properties;
- (void)_updateMetadata:(id)a3 withProvidedMetadata:(id)a4;
- (void)setCBCharacteristic:(id)a3;
- (void)setEventNotificationsEnabled:(BOOL)a3;
- (void)setInstanceID:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNotificationContext:(id)a3;
- (void)setProhibitCaching:(BOOL)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setShouldValidateValueAfterReading:(BOOL)a3;
- (void)setStateNumber:(id)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueUpdatedTime:(id)a3;
@end

@implementation HAPCharacteristic

- (void)_updateMetadata:(id)a3 withProvidedMetadata:(id)a4
{
  id v40 = a3;
  id v5 = a4;
  v6 = [v40 format];

  if (!v6)
  {
    v7 = [v5 format];
    [v40 setFormat:v7];
  }
  v8 = [v40 units];

  if (!v8)
  {
    v9 = [v5 units];
    [v40 setUnits:v9];
  }
  v10 = [v40 manufacturerDescription];

  if (!v10)
  {
    v11 = [v5 manufacturerDescription];
    [v40 setManufacturerDescription:v11];
  }
  v12 = [v40 constraints];

  v13 = [v5 constraints];
  v14 = v13;
  if (!v12)
  {
    [v40 setConstraints:v13];
    goto LABEL_20;
  }

  if (v14)
  {
    v15 = [v5 constraints];
    v16 = [v15 minimumValue];

    if (v16)
    {
      v17 = [v5 constraints];
      v18 = [v17 minimumValue];
      v19 = [v40 constraints];
      [v19 setMinimumValue:v18];
    }
    v20 = [v5 constraints];
    v21 = [v20 maximumValue];

    if (v21)
    {
      v22 = [v5 constraints];
      v23 = [v22 maximumValue];
      v24 = [v40 constraints];
      [v24 setMaximumValue:v23];
    }
    v25 = [v5 constraints];
    v26 = [v25 stepValue];

    if (v26)
    {
      v27 = [v5 constraints];
      v28 = [v27 stepValue];
      v29 = [v40 constraints];
      [v29 setStepValue:v28];
    }
    v30 = [v5 constraints];
    v31 = [v30 maxLength];

    if (v31)
    {
      v32 = [v5 constraints];
      v33 = [v32 maxLength];
      v34 = [v40 constraints];
      [v34 setMaxLength:v33];
    }
    v35 = [v5 constraints];
    v36 = [v35 validValues];
    id v37 = [v36 count];

    if (v37)
    {
      v14 = [v5 constraints];
      v38 = [v14 validValues];
      v39 = [v40 constraints];
      [v39 setValidValues:v38];

LABEL_20:
    }
  }
}

- (id)_generateValidMetadata:(id)a3
{
  id v4 = a3;
  id v5 = +[HAPMetadata getSharedInstance];
  v6 = [(HAPCharacteristic *)self type];
  v7 = [v5 getDefaultCharacteristicMetadata:v6];

  v8 = v4;
  if (v7)
  {
    v8 = v7;
    if (v4)
    {
      [(HAPCharacteristic *)self _updateMetadata:v7 withProvidedMetadata:v4];
      v8 = v7;
    }
  }
  id v9 = v8;

  return v9;
}

- (id)validateValue:(id)a3 outValue:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HAPCharacteristic *)self metadata];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(HAPCharacteristic *)self metadata];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [(HAPCharacteristic *)self metadata];
      v12 = [v11 format];

      if (!v12) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    v14 = [(HAPCharacteristic *)self metadata];
    v15 = [v14 format];

    if (a4) {
      *a4 = 0;
    }
    if (!v6)
    {
      id v13 = 0;
LABEL_67:

      goto LABEL_68;
    }
    v16 = [(HAPCharacteristic *)self metadata];
    v93 = a4;
    if (v16)
    {
      v17 = [(HAPCharacteristic *)self metadata];
      v18 = [v17 constraints];

      if (v18)
      {
        v19 = [(HAPCharacteristic *)self metadata];
        v20 = [v19 constraints];
        v16 = [v20 minimumValue];

        v21 = [(HAPCharacteristic *)self metadata];
        v22 = [v21 constraints];
        uint64_t v23 = [v22 maximumValue];

        v24 = [(HAPCharacteristic *)self metadata];
        v25 = [v24 constraints];
        uint64_t v26 = [v25 minLength];

        v27 = [(HAPCharacteristic *)self metadata];
        v28 = [v27 constraints];
        v29 = [v28 maxLength];

        v30 = (void *)v26;
      }
      else
      {
        v29 = 0;
        v30 = 0;
        uint64_t v23 = 0;
        v16 = 0;
      }
    }
    else
    {
      v29 = 0;
      v30 = 0;
      uint64_t v23 = 0;
    }
    v94 = v6;
    if (([v15 isEqualToString:@"int"] & 1) != 0
      || ([v15 isEqualToString:@"float"] & 1) != 0
      || ([v15 isEqualToString:@"BOOL"] & 1) != 0
      || ([v15 isEqualToString:@"int8"] & 1) != 0
      || ([v15 isEqualToString:@"int16"] & 1) != 0
      || ([v15 isEqualToString:@"int64"] & 1) != 0
      || ([v15 isEqualToString:@"uint8"] & 1) != 0
      || ([v15 isEqualToString:@"uint16"] & 1) != 0
      || ([v15 isEqualToString:@"uint32"] & 1) != 0
      || ([v15 isEqualToString:@"uint64"] & 1) != 0)
    {
      v31 = v15;
      v32 = (void *)v23;
    }
    else if ([v15 isEqualToString:@"string"])
    {
      v31 = v15;
      v32 = (void *)v23;
    }
    else if ([v15 isEqualToString:@"date"])
    {
      v31 = v15;
      v32 = (void *)v23;
    }
    else
    {
      v32 = (void *)v23;
      v31 = v15;
      if (([v15 isEqualToString:@"array"] & 1) == 0)
      {
        if (([v15 isEqualToString:@"dict"] & 1) == 0
          && ([v15 isEqualToString:@"data"] & 1) == 0
          && ![v15 isEqualToString:@"tlv8"])
        {
          uint64_t v33 = 0;
          v31 = v15;
LABEL_29:
          if (([(id)objc_opt_class() isSubclassOfClass:v33] & 1) == 0)
          {
            id v40 = +[NSError errorWithDomain:@"DKErrorDomain" code:35 userInfo:0];
            v41 = sub_100083F74();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v42 = sub_100083FD0(0);
              [(HAPCharacteristic *)self type];
              v91 = v29;
              v44 = v43 = v30;
              *(_DWORD *)buf = 138544130;
              v96 = v42;
              __int16 v97 = 2112;
              id v98 = v44;
              __int16 v99 = 2112;
              id v100 = (id)objc_opt_class();
              __int16 v101 = 2112;
              id v102 = (id)v33;
              id v45 = v100;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@### Failed to validate value for characteristic with type '%@' because the value was of class '%@' but should be '%@'", buf, 0x2Au);

              v30 = v43;
              v29 = v91;
            }
            v34 = v32;
            v15 = v31;
            goto LABEL_37;
          }
          v34 = v32;
          v15 = v31;
          id v6 = v94;
          if (!v93)
          {
LABEL_49:
            if (([v31 isEqualToString:@"int"] & 1) != 0
              || ([v31 isEqualToString:@"float"] & 1) != 0
              || ([v31 isEqualToString:@"int8"] & 1) != 0
              || ([v31 isEqualToString:@"int16"] & 1) != 0
              || ([v31 isEqualToString:@"int64"] & 1) != 0
              || ([v31 isEqualToString:@"uint8"] & 1) != 0
              || ([v31 isEqualToString:@"uint16"] & 1) != 0
              || ([v31 isEqualToString:@"uint32"] & 1) != 0
              || [v31 isEqualToString:@"uint64"])
            {
              if (v16 && [v94 compare:v16] == (id)-1)
              {
                v63 = +[NSError errorWithDomain:@"DKErrorDomain" code:47 userInfo:0];
                if (v93) {
                  id *v93 = 0;
                }
              }
              else
              {
                v63 = 0;
              }
              if (v34 && [v94 compare:v34] == (id)1)
              {
                id v40 = +[NSError errorWithDomain:@"DKErrorDomain" code:48 userInfo:0];

                if (v93) {
                  id *v93 = 0;
                }
              }
              else
              {
                id v40 = v63;
              }
              goto LABEL_66;
            }
            if ([v31 isEqualToString:@"BOOL"])
            {
              v65 = objc_opt_class();
              if (([v65 isSubclassOfClass:objc_opt_class()] & 1) == 0)
              {
                v92 = v29;
                v66 = v34;
                v67 = v16;
                if ([v65 isSubclassOfClass:objc_opt_class()])
                {
                  if ([v94 intValue] < 2)
                  {
                    id v40 = 0;
LABEL_106:
                    v16 = v67;
                    v34 = v66;
                    v15 = v31;
LABEL_109:
                    v29 = v92;
LABEL_37:
                    id v6 = v94;
LABEL_66:
                    id v13 = v40;

                    goto LABEL_67;
                  }
                  v68 = sub_100083F74();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    v69 = sub_100083FD0(0);
                    v70 = objc_opt_class();
                    id v71 = v94;
                    id v72 = v70;
                    *(_DWORD *)buf = 138544130;
                    v96 = v69;
                    __int16 v97 = 2112;
                    id v98 = v94;
                    __int16 v99 = 2112;
                    id v100 = v70;
                    __int16 v101 = 2080;
                    id v102 = [v71 objCType];
                    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%{public}@Value to be validated is expected to be either '0' or '1', instead it was '%@' - class %@  objCType %s", buf, 0x2Au);
                  }
                }
                else
                {
                  v83 = sub_100083F74();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  {
                    v84 = sub_100083FD0(0);
                    *(_DWORD *)buf = 138543874;
                    v96 = v84;
                    __int16 v97 = 2112;
                    id v98 = v94;
                    __int16 v99 = 2112;
                    id v100 = v65;
                    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%{public}@inValue not a BOOLean value %@ - class %@", buf, 0x20u);
                  }
                }
                id v40 = +[NSError errorWithDomain:@"DKErrorDomain" code:2 userInfo:0];
                if (v93) {
                  id *v93 = 0;
                }
                goto LABEL_106;
              }
LABEL_89:
              id v40 = 0;
              goto LABEL_66;
            }
            if (![v31 isEqualToString:@"string"]) {
              goto LABEL_89;
            }
            v73 = v34;
            v74 = v30;
            v75 = v16;
            v76 = v29;
            v77 = v73;
            id v78 = v94;
            id v79 = [v78 length];
            v92 = v76;
            if ((unint64_t)v79 <= [v76 unsignedIntValue])
            {
              id v85 = [v78 length];
              if ((unint64_t)v85 >= [v74 unsignedIntValue])
              {
                id v40 = 0;
LABEL_108:

                v16 = v75;
                v30 = v74;
                v34 = v77;
                goto LABEL_109;
              }
              v86 = sub_100083F74();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
              {
                v87 = sub_100083FD0(0);
                *(_DWORD *)buf = 138543874;
                v96 = v87;
                __int16 v97 = 2048;
                id v98 = [v78 length];
                __int16 v99 = 1024;
                LODWORD(v100) = [v74 unsignedIntValue];
                _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu < minLength: %u", buf, 0x1Cu);
              }
              uint64_t v82 = 50;
            }
            else
            {
              v80 = sub_100083F74();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              {
                v81 = sub_100083FD0(0);
                *(_DWORD *)buf = 138543874;
                v96 = v81;
                __int16 v97 = 2048;
                id v98 = [v78 length];
                __int16 v99 = 1024;
                LODWORD(v100) = [v92 unsignedIntValue];
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu > maxLength: %u", buf, 0x1Cu);
              }
              uint64_t v82 = 49;
            }
            id v40 = +[NSError errorWithDomain:@"DKErrorDomain" code:v82 userInfo:0];
            if (v93) {
              id *v93 = 0;
            }
            goto LABEL_108;
          }
          v88 = v30;
          v89 = v34;
          v35 = [(HAPCharacteristic *)self metadata];
          v36 = [v35 constraints];
          uint64_t v37 = [v36 stepValue];
          v90 = v29;
          if (v37)
          {
            v38 = (void *)v37;
            v39 = v16;
            if ([v31 isEqualToString:@"float"])
            {

LABEL_40:
              v47 = [(HAPCharacteristic *)self metadata];
              v48 = [v47 constraints];
              v49 = [v48 stepValue];
              [v49 doubleValue];
              double v51 = v50;

              v52 = [(HAPCharacteristic *)self metadata];
              v53 = [v52 constraints];
              v54 = [v53 minimumValue];

              if (v54)
              {
                v55 = [(HAPCharacteristic *)self metadata];
                v56 = [v55 constraints];
                v57 = [v56 minimumValue];
                [v57 doubleValue];
                double v59 = v58;
              }
              else
              {
                double v59 = 0.0;
              }
              [v94 doubleValue];
              double v62 = v59 + round((v61 - v59) / v51) * v51;
              v16 = v39;
              v30 = v88;
              v29 = v90;
              if ([v31 isEqualToString:@"int"]) {
                +[NSNumber numberWithInteger:(uint64_t)v62];
              }
              else {
                +[NSNumber numberWithDouble:v62];
              }
              v34 = v89;
              id v60 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_48;
            }
            unsigned __int8 v46 = [v31 isEqualToString:@"int"];

            if (v46) {
              goto LABEL_40;
            }
          }
          else
          {
            v39 = v16;
          }
          id v60 = v94;
          v16 = v39;
          v30 = v88;
          v34 = v89;
          v29 = v90;
LABEL_48:
          id *v93 = v60;
          goto LABEL_49;
        }
        v31 = v15;
      }
    }
    uint64_t v33 = objc_opt_class();
    goto LABEL_29;
  }
LABEL_4:
  id v13 = 0;
  if (a4) {
    *a4 = v6;
  }
LABEL_68:

  return v13;
}

- (CBCharacteristic)cbCharacteristic
{
  v2 = objc_getAssociatedObject(self, "cbCharacteristic");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CBCharacteristic *)v3;
}

- (void)setCBCharacteristic:(id)a3
{
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 metadata:(id)a9
{
  LOBYTE(v10) = 0;
  return [(HAPCharacteristic *)self initWithType:a3 instanceID:a4 value:a5 stateNumber:a6 properties:a7 eventNotificationsEnabled:a8 implicitWriteWithResponse:v10 metadata:a9];
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 implicitWriteWithResponse:(BOOL)a9 metadata:(id)a10
{
  v16 = a3;
  id v17 = a4;
  id v53 = a5;
  id v52 = a6;
  id v18 = a10;
  if ((sub_100082A44(v16) & 1) == 0)
  {
    v19 = sub_100083F74();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_28:
      uint64_t v37 = 0;
      goto LABEL_29;
    }
    v38 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    v56 = v38;
    __int16 v57 = 2112;
    double v58 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize characteristic because of invalid characteristic type name: %@", buf, 0x16u);
    goto LABEL_27;
  }
  v19 = sub_100082BE4(v16);
  if (!v19)
  {
    v38 = sub_100083F74();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v56 = v39;
      id v40 = "%{public}@### Unable to initialize characteristic because type name is not a UUID";
      v41 = v38;
      uint32_t v42 = 12;
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if ((sub_100082EDC(v17) & 1) == 0)
  {
    v38 = sub_100083F74();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      v56 = v39;
      __int16 v57 = 2112;
      double v58 = v19;
      id v40 = "%{public}@### Unable to initialize characteristic '%@' because of invalid instance ID";
LABEL_25:
      v41 = v38;
      uint32_t v42 = 22;
      goto LABEL_26;
    }
LABEL_27:

    goto LABEL_28;
  }
  if ((sub_100013134(a7, a9, v19) & 1) == 0)
  {
    v38 = sub_100083F74();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      v56 = v39;
      __int16 v57 = 2112;
      double v58 = v19;
      id v40 = "%{public}@### Unable to initialize characteristic '%@' because of invalid properties";
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  id v20 = v18;
  id v51 = v20;
  if (v20)
  {
    v21 = [v20 constraints];
    if (v21
      || ([v51 manufacturerDescription], (v21 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v51 format], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      id v20 = v51;
      goto LABEL_10;
    }
    double v50 = [v51 units];

    id v20 = v51;
    if (v50) {
      goto LABEL_10;
    }
    v44 = sub_100083F74();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543362;
      v56 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}@### Characteristic metadata is empty", buf, 0xCu);
    }
    v38 = sub_100083F74();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v39 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    v56 = v39;
    __int16 v57 = 2112;
    double v58 = v19;
    id v40 = "%{public}@### Unable to initialize characteristic '%@' because of invalid metadata";
    goto LABEL_25;
  }
LABEL_10:

  v54.receiver = self;
  v54.super_class = (Class)HAPCharacteristic;
  v22 = [(HAPCharacteristic *)&v54 init];
  if (v22)
  {
    id v48 = v18;
    uint64_t v23 = +[HAPMetadata getSharedInstance];
    uint64_t v24 = +[HMFObjectCacheNSString hmf_cachedInstanceForString:v19];
    type = v22->_type;
    v22->_type = (NSString *)v24;

    v49 = v23;
    uint64_t v26 = [v23 characteristicUTIFromType:v19];
    v27 = (void *)v26;
    if (v26)
    {
      v47 = (void *)v26;
      v28 = sub_100083F74();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        unsigned __int8 v46 = sub_100083FD0(0);
        v29 = v22->_type;
        *(_DWORD *)buf = 138544130;
        v56 = v46;
        __int16 v57 = 2112;
        double v58 = v29;
        __int16 v59 = 2112;
        id v60 = v47;
        __int16 v61 = 2112;
        id v62 = v17;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);
      }
      v27 = v47;
    }
    objc_storeStrong((id *)&v22->_instanceID, a4);
    objc_storeStrong(&v22->_value, a5);
    objc_storeStrong((id *)&v22->_stateNumber, a6);
    uint64_t v30 = +[NSDate date];
    valueUpdatedTime = v22->_valueUpdatedTime;
    v22->_valueUpdatedTime = (NSDate *)v30;

    v22->_properties = a7;
    v22->_eventNotificationsEnabled = a8;
    v22->_implicitWriteWithResponse = a9;
    v22->_shouldValidateValueAfterReading = 1;
    uint64_t v32 = +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:v51];
    accessoryMetadata = v22->_accessoryMetadata;
    v22->_accessoryMetadata = (HAPCharacteristicMetadata *)v32;

    v34 = [(HAPCharacteristic *)v22 _generateValidMetadata:v51];
    uint64_t v35 = +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:v34];
    metadata = v22->_metadata;
    v22->_metadata = (HAPCharacteristicMetadata *)v35;

    id v18 = v48;
  }
  self = v22;
  uint64_t v37 = self;
LABEL_29:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(HAPCharacteristic *)self value];
  if (([v5 conformsToProtocol:&OBJC_PROTOCOL___NSCopying] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v6 = [(HAPCharacteristic *)self value];

  if (!v6)
  {
LABEL_5:
    id v6 = [(HAPCharacteristic *)self value];
    id v7 = [v6 copy];
    goto LABEL_6;
  }
  id v7 = [v6 copyWithZone:a3];
LABEL_6:
  v25 = v7;

  id v22 = objc_alloc((Class)objc_opt_class());
  uint64_t v24 = [(HAPCharacteristic *)self type];
  id v21 = [v24 copyWithZone:a3];
  uint64_t v23 = [(HAPCharacteristic *)self instanceID];
  id v8 = [v23 copyWithZone:a3];
  uint64_t v9 = [(HAPCharacteristic *)self stateNumber];
  id v10 = [v9 copyWithZone:a3];
  unint64_t v11 = [(HAPCharacteristic *)self properties];
  BOOL v12 = [(HAPCharacteristic *)self eventNotificationsEnabled];
  unsigned __int8 v13 = [(HAPCharacteristic *)self isWriteWithResponseImplicitlySupported];
  v14 = [(HAPCharacteristic *)self metadata];
  id v15 = [v14 copyWithZone:a3];
  LOBYTE(v20) = v13;
  id v16 = [v22 initWithType:v21 instanceID:v8 value:v25 stateNumber:v10 properties:v11 eventNotificationsEnabled:v12 implicitWriteWithResponse:v20 metadata:v15];

  id v17 = [(HAPCharacteristic *)self valueUpdatedTime];
  [v16 setValueUpdatedTime:v17];

  id v18 = [(HAPCharacteristic *)self notificationContext];
  [v16 setNotificationContext:v18];

  [v16 setProhibitCaching:-[HAPCharacteristic prohibitCaching](self, "prohibitCaching")];
  [v16 setShouldValidateValueAfterReading:[self shouldValidateValueAfterReading]];

  return v16;
}

- (unint64_t)hash
{
  v2 = [(HAPCharacteristic *)self instanceID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPCharacteristic *)a3;
  if (self == v4)
  {
    unsigned __int8 v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (!v6) {
      goto LABEL_12;
    }
    id v7 = [(HAPCharacteristic *)self instanceID];
    id v8 = [(HAPCharacteristic *)v6 instanceID];
    char v9 = sub_100083128(v7, v8);

    if (v9) {
      goto LABEL_12;
    }
    id v10 = [(HAPCharacteristic *)self type];
    unint64_t v11 = [(HAPCharacteristic *)v6 type];
    char v12 = sub_1000830F4((unint64_t)v10, (uint64_t)v11);

    if ((v12 & 1) != 0
      || (id v13 = [(HAPCharacteristic *)self properties],
          v13 != (id)[(HAPCharacteristic *)v6 properties]))
    {
LABEL_12:
      unsigned __int8 v20 = 0;
    }
    else
    {
      uint64_t v14 = [(HAPCharacteristic *)self service];
      if (v14)
      {
        id v15 = (void *)v14;
        uint64_t v16 = [(HAPCharacteristic *)v6 service];
        if (v16)
        {
          id v17 = (void *)v16;
          id v18 = [(HAPCharacteristic *)self service];
          v19 = [(HAPCharacteristic *)v6 service];
          unsigned __int8 v20 = [v18 isEqual:v19];
        }
        else
        {
          unsigned __int8 v20 = 1;
        }
      }
      else
      {
        unsigned __int8 v20 = 1;
      }
    }
  }
  return v20;
}

- (id)shortDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = [(HAPCharacteristic *)self value];
  [v3 appendFormat:@"Value: %@", v4];

  id v5 = [(HAPCharacteristic *)self stateNumber];
  [v3 appendFormat:@", State Number: %@", v5];

  id v6 = [(HAPCharacteristic *)self valueUpdatedTime];
  id v7 = [v6 hmf_localTimeDescription];
  [v3 appendFormat:@", Value update time: %@", v7];

  id v8 = [(HAPCharacteristic *)self propertiesDescription];
  [v3 appendFormat:@", Properties: %@", v8];

  [(HAPCharacteristic *)self eventNotificationsEnabled];
  char v9 = HMFBooleanToString();
  [v3 appendFormat:@", Event Notifications Enabled: %@", v9];

  id v10 = +[NSNumber numberWithBool:[(HAPCharacteristic *)self isWriteWithResponseImplicitlySupported]];
  [v3 appendFormat:@", Write With Response Implicitly Supported: %@", v10];

  unint64_t v11 = [(HAPCharacteristic *)self metadata];
  [v3 appendFormat:@", Metadata: %@", v11];

  [(HAPCharacteristic *)self supportsEventNotificationContext];
  char v12 = HMFBooleanToString();
  [v3 appendFormat:@", supportsEventNotificationContext: %@", v12];

  return v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristic;
  id v4 = [(HAPCharacteristic *)&v12 description];
  [v3 appendFormat:@"%@", v4];

  id v5 = [(HAPCharacteristic *)self service];
  id v6 = [v5 accessory];
  id v7 = [v6 uniqueIdentifier];
  [v3 appendFormat:@", Accessory Unique ID: %@", v7];

  id v8 = [(HAPCharacteristic *)self instanceID];
  [v3 appendFormat:@", Instance ID: %@", v8];

  char v9 = [(HAPCharacteristic *)self type];
  [v3 appendFormat:@", Type: %@", v9];

  id v10 = [(HAPCharacteristic *)self shortDescription];
  [v3 appendFormat:@", %@", v10];

  return (NSString *)v3;
}

- (id)propertiesDescription
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (([(HAPCharacteristic *)self properties] & 2) != 0) {
    [v3 addObject:@"read"];
  }
  if (([(HAPCharacteristic *)self properties] & 4) != 0) {
    [v3 addObject:@"write"];
  }
  if ([(HAPCharacteristic *)self properties]) {
    [v3 addObject:@"eventConnectionNotifications"];
  }
  if (([(HAPCharacteristic *)self properties] & 8) != 0) {
    [v3 addObject:@"broadcast"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x10) != 0) {
    [v3 addObject:@"additionalAuthData"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x20) != 0) {
    [v3 addObject:@"requiresTimedWrite"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x40) != 0) {
    [v3 addObject:@"hidden"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x80) != 0) {
    [v3 addObject:@"writeResponse"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x100) != 0) {
    [v3 addObject:@"eventNotificationContext"];
  }
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableString);
    id v5 = [v3 objectAtIndexedSubscript:0];
    [v4 appendString:v5];

    id v6 = [v3 objectAtIndexedSubscript:0];
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

- (void)setValue:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  os_unfair_lock_lock_with_options();
  id value = self->_value;
  self->_id value = v4;
  id v7 = v4;

  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_value;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setStateNumber:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  stateNumber = self->_stateNumber;
  self->_stateNumber = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)stateNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setValueUpdatedTime:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)valueUpdatedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_valueUpdatedTime;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setNotificationContext:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)notificationContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_notificationContext;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)supportsWriteWithResponse
{
  unsigned int v3 = [(HAPCharacteristic *)self properties];
  if ((v3 & 0x80) != 0) {
    LOBYTE(v4) = 1;
  }
  else {
    return [(HAPCharacteristic *)self isWriteWithResponseImplicitlySupported] & (v3 >> 2);
  }
  return v4;
}

- (BOOL)supportsAdditionalAuthorizationData
{
  if (([(HAPCharacteristic *)self properties] & 0x10) != 0) {
    return 1;
  }
  unsigned int v3 = +[HAPMetadata getSharedInstance];
  BOOL v4 = [(HAPCharacteristic *)self service];
  id v5 = [(HAPCharacteristic *)self type];
  id v6 = [v4 type];
  unsigned __int8 v7 = [v3 supportsAdditionalAuthorizationData:v5 forService:v6];

  return v7;
}

- (BOOL)supportsEventNotificationContext
{
  return ([(HAPCharacteristic *)self properties] >> 8) & 1;
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
  if (!v6)
  {
LABEL_14:
    char v16 = 0;
    goto LABEL_15;
  }
  if (![(HAPCharacteristic *)self shouldMergeObject:v6])
  {
    id v17 = self;
    id v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = sub_100083FD0(v17);
      int v21 = 138543618;
      id v22 = v19;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@Not merging with characteristic: %@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_14;
  }
  unsigned __int8 v7 = [v6 value];
  [(HAPCharacteristic *)self setValue:v7];

  id v8 = [(HAPCharacteristic *)self metadata];
  id v9 = [v6 metadata];
  unsigned __int8 v10 = [v8 isEqualToCharacteristicMetadata:v9];

  if ((v10 & 1) == 0)
  {
    unint64_t v11 = self;
    objc_super v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = sub_100083FD0(v11);
      long long v14 = [v6 metadata];
      int v21 = 138543618;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Updated the characteristic metadata: %@", (uint8_t *)&v21, 0x16u);
    }
    long long v15 = [v6 metadata];
    [(HAPCharacteristic *)v11 setMetadata:v15];
  }
  char v16 = v10 ^ 1;
LABEL_15:

  return v16;
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

- (HAPService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (HAPService *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (BOOL)eventNotificationsEnabled
{
  return self->_eventNotificationsEnabled;
}

- (void)setEventNotificationsEnabled:(BOOL)a3
{
  self->_eventNotificationsEnabled = a3;
}

- (HAPCharacteristicMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)shouldValidateValueAfterReading
{
  return self->_shouldValidateValueAfterReading;
}

- (void)setShouldValidateValueAfterReading:(BOOL)a3
{
  self->_shouldValidateValueAfterReading = a3;
}

- (BOOL)prohibitCaching
{
  return self->_prohibitCaching;
}

- (void)setProhibitCaching:(BOOL)a3
{
  self->_prohibitCaching = a3;
}

- (HAPCharacteristicMetadata)accessoryMetadata
{
  return self->_accessoryMetadata;
}

- (BOOL)isWriteWithResponseImplicitlySupported
{
  return self->_implicitWriteWithResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
}

@end