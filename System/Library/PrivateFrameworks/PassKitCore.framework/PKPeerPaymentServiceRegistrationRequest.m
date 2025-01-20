@interface PKPeerPaymentServiceRegistrationRequest
- (NSString)pushToken;
- (PKPeerPaymentDeviceRegistrationData)deviceData;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8;
- (void)setDeviceData:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation PKPeerPaymentServiceRegistrationRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (!v14)
  {
    v36 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    __int16 v52 = 2082;
    v53 = "url";
LABEL_35:
    _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_36;
  }
  if (!v15)
  {
    v36 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    v39 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v39);
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    __int16 v52 = 2082;
    v53 = "appleAccountInformation";
    goto LABEL_35;
  }
  if (!v19)
  {
    v36 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    v40 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v40);
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    __int16 v52 = 2082;
    v53 = "deviceMetadata";
    goto LABEL_35;
  }
  if (!self->_pushToken)
  {
    v36 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    v41 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v41);
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    __int16 v52 = 2082;
    v53 = "_pushToken";
    goto LABEL_35;
  }
  deviceData = self->_deviceData;
  if (!deviceData)
  {
    v36 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    v42 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v42);
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    __int16 v52 = 2082;
    v53 = "_deviceData";
    goto LABEL_35;
  }
  v22 = [(PKPeerPaymentDeviceRegistrationData *)deviceData signedAuthToken];

  if (!v22)
  {
    v36 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    v43 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v43);
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    __int16 v52 = 2082;
    v53 = "[_deviceData signedAuthToken]";
    goto LABEL_35;
  }
  v23 = [(PKPeerPaymentDeviceRegistrationData *)self->_deviceData enrollmentData];

  if (!v23)
  {
    v36 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v44);
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      __int16 v52 = 2082;
      v53 = "[_deviceData enrollmentData]";
      goto LABEL_35;
    }
LABEL_36:

    v35 = 0;
    goto LABEL_37;
  }
  id v49 = v16;
  v24 = [(PKPeerPaymentDeviceRegistrationData *)self->_deviceData authorizationHeader];
  [v15 setAuthorizationHeader:v24];

  v25 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v14 endpointComponents:&unk_1EE22B4B0 queryParameters:0 appleAccountInformation:v15];
  [v25 setHTTPMethod:@"POST"];
  [v25 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v48 = v25;
  [v25 setCachePolicy:1];
  v26 = [MEMORY[0x1E4F1CA60] dictionary];
  v47 = [(PKPeerPaymentDeviceRegistrationData *)self->_deviceData enrollmentData];
  v27 = PKSerialNumber();
  [v26 setObject:v27 forKey:@"deviceSerialNumber"];

  v28 = PKProductType();
  [v26 setObject:v28 forKey:@"productType"];

  uint64_t v29 = [(PKPeerPaymentDeviceRegistrationData *)self->_deviceData companionSerialNumber];
  if (v29) {
    [v26 setObject:v29 forKey:@"companionSerialNumber"];
  }
  v30 = [(PKPeerPaymentDeviceRegistrationData *)self->_deviceData signedAuthToken];
  if (v30) {
    [v26 setObject:v30 forKey:@"signedAuthToken"];
  }
  pushToken = self->_pushToken;
  if (pushToken) {
    [v26 setObject:pushToken forKey:@"pushToken"];
  }
  v46 = (void *)v29;
  if (v47) {
    [v26 setObject:v47 forKey:@"enrollmentData"];
  }
  if (v17)
  {
    v32 = [v17 hexEncoding];
    [v26 setObject:v32 forKey:@"deviceScore"];
  }
  if (v18) {
    [v26 setObject:v18 forKey:@"odiAssessment"];
  }
  v33 = [v20 dictionaryRepresentation];
  [v26 setObject:v33 forKey:@"deviceMetadata"];

  [MEMORY[0x1E4F18DA0] setProperty:&unk_1EE22C788 forKey:@"PKPeerPaymentEndPointKey" inRequest:v48];
  v34 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v26];
  [v48 setHTTPBody:v34];

  v35 = (void *)[v48 copy];
  id v16 = v49;
LABEL_37:

  return v35;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (PKPeerPaymentDeviceRegistrationData)deviceData
{
  return self->_deviceData;
}

- (void)setDeviceData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceData, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end