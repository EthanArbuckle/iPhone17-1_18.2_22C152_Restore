@interface PKAccountWebServiceAccountUpdateUserInfoRequest
- (CNContact)contact;
- (NSArray)certificates;
- (NSString)accountIdentifier;
- (NSString)encryptionVersion;
- (NSString)odiAssessment;
- (NSString)ssn;
- (NSURL)baseURL;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)featureIdentifier;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setContact:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setEncryptionVersion:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setSsn:(id)a3;
@end

@implementation PKAccountWebServiceAccountUpdateUserInfoRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543618;
    v61 = v25;
    __int16 v62 = 2082;
    v63 = "_baseURL";
LABEL_30:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_31;
  }
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    v26 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138543618;
    v61 = v25;
    __int16 v62 = 2082;
    v63 = "appleAccountInformation";
    goto LABEL_30;
  }
  if (!self->_accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    v27 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v61 = v25;
    __int16 v62 = 2082;
    v63 = "_accountIdentifier";
    goto LABEL_30;
  }
  if (self->_ssn && !self->_certificates)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138543618;
      v61 = v25;
      __int16 v62 = 2082;
      v63 = "_certificates";
      goto LABEL_30;
    }
LABEL_31:
    v35 = 0;
    goto LABEL_32;
  }
  if (self->_encryptionVersion) {
    encryptionVersion = (__CFString *)self->_encryptionVersion;
  }
  else {
    encryptionVersion = @"EV_ECC_v1-ASN.1";
  }
  objc_storeStrong((id *)&self->_encryptionVersion, encryptionVersion);
  accountIdentifier = self->_accountIdentifier;
  v59[0] = @"accounts";
  v59[1] = accountIdentifier;
  v59[2] = @"userInfo";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v9 setCachePolicy:1];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = [(PKOverlayableWebServiceRequest *)self secureOverlayParameters];
  uint64_t v12 = [v11 count];

  certificates = self->_certificates;
  if (v12)
  {
    if (![(NSArray *)certificates count])
    {
      v37 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Error: Tried to update user info without certificates", buf, 2u);
      }
      v22 = 0;
      v53 = 0;
      v38 = v9;
      v9 = 0;
      goto LABEL_52;
    }
    v14 = (void *)MEMORY[0x192FDC630]();
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PKOverlayableWebServiceRequest *)self _applySecureOverlayToDictionary:v15];
    if ([v15 count])
    {
      v52 = v14;
      v16 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = NSString;
        v18 = [v15 allKeys];
        v19 = [v17 stringWithFormat:@"Encrypted User Info Fields: %@", v18];
        *(_DWORD *)buf = 138477827;
        v61 = v19;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
      }
      v20 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v15];
      v21 = self->_certificates;
      id v56 = 0;
      v22 = PKFeatureEncryptDataWithCertChain(v20, v21, &v56, self->_featureIdentifier);
      id v23 = v56;

      if (v22)
      {
        v14 = v52;
LABEL_44:

        goto LABEL_50;
      }
      v14 = v52;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate user indo request encryptedData. This is bad!", buf, 2u);
      }
    }
    else
    {
      id v23 = 0;
    }
    v22 = 0;
    goto LABEL_44;
  }
  if (!certificates || (ssn = self->_ssn) == 0)
  {
    v22 = 0;
    v53 = 0;
    goto LABEL_53;
  }
  v57 = @"ssnFull";
  v58 = ssn;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  id v55 = 0;
  v30 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v29 options:1 error:&v55];
  v31 = (char *)v55;
  if (!v30)
  {
    v33 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v61 = v39;
      __int16 v62 = 2112;
      v63 = v31;
      v40 = v31;
      id v41 = v39;
      _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "Could not create data for %@: %@", buf, 0x16u);

      v31 = v40;
    }
    id v23 = 0;
    goto LABEL_48;
  }
  v32 = self->_certificates;
  id v54 = 0;
  v22 = PKFeatureEncryptDataWithCertChain(v30, v32, &v54, self->_featureIdentifier);
  id v23 = v54;
  if (!v22)
  {
    v33 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate user info request encryptedData.", buf, 2u);
    }
LABEL_48:

    v22 = 0;
  }

LABEL_50:
  v53 = v23;
  if (v22)
  {
    v38 = (void *)[[NSString alloc] initWithData:v22 encoding:4];
    [v10 setObject:self->_encryptionVersion forKey:@"encryptionVersion"];
    [v10 setObject:v38 forKey:@"encryptedData"];
    v37 = [v23 hexEncoding];
    [v10 setObject:v37 forKey:@"publicKeyHash"];
LABEL_52:
  }
LABEL_53:
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PKOverlayableWebServiceRequest *)self _applyOverlayToDictionary:v42];
  [v10 setObject:v42 forKey:@"inputData"];
  contact = self->_contact;
  if (contact)
  {
    v44 = [(CNContact *)contact postalAddresses];
    v45 = [v44 firstObject];
    v46 = [v45 value];

    if (v46)
    {
      v47 = [v46 webServiceDictionaryRepresentation];
      [v10 setObject:v47 forKey:@"billingAddress"];
    }
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v10 setObject:odiAssessment forKey:@"odiAssessment"];
  }
  deviceMetadata = self->_deviceMetadata;
  if (deviceMetadata)
  {
    v50 = [(PKPaymentDeviceMetadata *)deviceMetadata dictionaryRepresentation];
    [v10 setObject:v50 forKey:@"deviceMetadata"];
  }
  if (v10)
  {
    v51 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
    [v9 setHTTPBody:v51];
  }
  v35 = (void *)[v9 copy];

LABEL_32:
  return v35;
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

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)ssn
{
  return self->_ssn;
}

- (void)setSsn:(id)a3
{
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void)setEncryptionVersion:(id)a3
{
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_ssn, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end