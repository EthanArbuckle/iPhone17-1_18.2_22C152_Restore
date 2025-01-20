@interface PKAccountWebServiceVirtualCardManageRequest
- (NSString)accountIdentifier;
- (NSString)virtualCardIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAction:(int64_t)a3 withQueue:(id)a4 completion:(id)a5;
- (void)setBaseURL:(id)a3;
- (void)setVirtualCardIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceVirtualCardManageRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    __int16 v27 = 2082;
    v28 = "_baseURL";
LABEL_18:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_19;
  }
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    __int16 v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_18;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v16 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    __int16 v27 = 2082;
    v28 = "_accountIdentifier";
    goto LABEL_18;
  }
  virtualCardIdentifier = self->_virtualCardIdentifier;
  if (!virtualCardIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v17 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    __int16 v27 = 2082;
    v28 = "_virtualCardIdentifier";
    goto LABEL_18;
  }
  if (!self->_action)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2082;
      v28 = "_action";
      goto LABEL_18;
    }
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  v24[0] = @"accounts";
  v24[1] = accountIdentifier;
  v24[2] = @"virtualCards";
  v24[3] = virtualCardIdentifier;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v11 = v10;
  v12 = @"fetch";
  switch(self->_action)
  {
    case 0:
      goto LABEL_29;
    case 2:
      v12 = @"cancel";
      goto LABEL_28;
    case 3:
      v12 = @"replace";
      goto LABEL_28;
    case 4:
      v12 = @"enable";
      goto LABEL_28;
    case 5:
      v12 = @"disable";
      goto LABEL_28;
    case 6:
      v12 = @"enableDynamicSecurityCode";
      goto LABEL_28;
    case 7:
      v12 = @"disableDynamicSecurityCode";
      goto LABEL_28;
    default:
LABEL_28:
      [v10 setObject:v12 forKey:@"action"];
LABEL_29:
      encryptionFields = self->_encryptionFields;
      if (encryptionFields)
      {
        v22 = [(PKVirtualCardEncryptionFields *)encryptionFields dictionaryRepresentation];
        [v11 setObject:v22 forKey:@"encryptionFields"];
      }
      if (v11)
      {
        v23 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
        [v9 setHTTPBody:v23];
      }
      v19 = objc_msgSend(v9, "copy", v12);

      break;
  }
LABEL_20:

  return v19;
}

- (void)setAction:(int64_t)a3 withQueue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  self->_action = a3;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_initWeak(&location, self);
    v11 = objc_alloc_init(PKVirtualCardEncryptionFields);
    encryptionFields = self->_encryptionFields;
    self->_encryptionFields = v11;

    v13 = self->_encryptionFields;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__PKAccountWebServiceVirtualCardManageRequest_setAction_withQueue_completion___block_invoke;
    v14[3] = &unk_1E56DD5C8;
    id v15 = v10;
    objc_copyWeak(&v16, &location);
    [(PKVirtualCardEncryptionFields *)v13 prepareCertificateWithQueue:v8 completion:v14];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, PKAccountWebServiceVirtualCardManageRequest *))v9 + 2))(v9, self);
  }
}

void __78__PKAccountWebServiceVirtualCardManageRequest_setAction_withQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
  }
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (void)setVirtualCardIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCardIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptionFields, 0);
}

@end