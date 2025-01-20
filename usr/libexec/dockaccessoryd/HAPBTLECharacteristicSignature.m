@interface HAPBTLECharacteristicSignature
- (BOOL)isAuthenticated;
- (HAPBTLECharacteristicSignature)initWithCharacteristicType:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 characteristicProperties:(unint64_t)a6 characteristicMetadata:(id)a7 authenticated:(BOOL)a8;
- (HAPCharacteristicMetadata)characteristicMetadata;
- (NSNumber)serviceInstanceID;
- (NSUUID)characteristicType;
- (NSUUID)serviceType;
- (unint64_t)characteristicProperties;
@end

@implementation HAPBTLECharacteristicSignature

- (HAPBTLECharacteristicSignature)initWithCharacteristicType:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 characteristicProperties:(unint64_t)a6 characteristicMetadata:(id)a7 authenticated:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v18 = v17;
  if (!v14)
  {
    v27 = sub_100083F74();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v28 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    v34 = v28;
    __int16 v35 = 2112;
    id v36 = (id)objc_opt_class();
    id v29 = v36;
    v30 = "%{public}@[%@] The characteristic type is requied";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v30, buf, 0x16u);

    goto LABEL_20;
  }
  if (!v15)
  {
    v27 = sub_100083F74();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v28 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    v34 = v28;
    __int16 v35 = 2112;
    id v36 = (id)objc_opt_class();
    id v29 = v36;
    v30 = "%{public}@[%@] The service instance ID is requied";
    goto LABEL_19;
  }
  if (!v16)
  {
    v27 = sub_100083F74();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v28 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    v34 = v28;
    __int16 v35 = 2112;
    id v36 = (id)objc_opt_class();
    id v29 = v36;
    v30 = "%{public}@[%@] The service type is requied";
    goto LABEL_19;
  }
  if (!a6)
  {
    v27 = sub_100083F74();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v28 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    v34 = v28;
    __int16 v35 = 2112;
    id v36 = (id)objc_opt_class();
    id v29 = v36;
    v30 = "%{public}@[%@] The characteristic properties is requied";
    goto LABEL_19;
  }
  if (!v17)
  {
    v27 = sub_100083F74();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      v34 = v28;
      __int16 v35 = 2112;
      id v36 = (id)objc_opt_class();
      id v29 = v36;
      v30 = "%{public}@[%@] The characteristic metadata is requied";
      goto LABEL_19;
    }
LABEL_20:

    v26 = 0;
    goto LABEL_21;
  }
  v32.receiver = self;
  v32.super_class = (Class)HAPBTLECharacteristicSignature;
  v19 = [(HAPBTLECharacteristicSignature *)&v32 init];
  if (v19)
  {
    v20 = (NSUUID *)[v14 copy];
    characteristicType = v19->_characteristicType;
    v19->_characteristicType = v20;

    v22 = (NSNumber *)[v15 copy];
    serviceInstanceID = v19->_serviceInstanceID;
    v19->_serviceInstanceID = v22;

    v24 = (NSUUID *)[v16 copy];
    serviceType = v19->_serviceType;
    v19->_serviceType = v24;

    v19->_characteristicProperties = a6;
    objc_storeStrong((id *)&v19->_characteristicMetadata, a7);
    v19->_authenticated = a8;
  }
  self = v19;
  v26 = self;
LABEL_21:

  return v26;
}

- (NSUUID)characteristicType
{
  return self->_characteristicType;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (NSUUID)serviceType
{
  return self->_serviceType;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);

  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end