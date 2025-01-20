@interface PKAccountAttestationRequest
+ (BOOL)supportsSecureCoding;
+ (id)_keychainItemWrapper;
+ (id)createAnonymizationSalt;
+ (id)defaultAnonymizationSaltWithError:(id *)a3;
+ (id)keychainDataWithError:(id *)a3;
+ (id)setDefaultAnonymizationSalt:(id)a3;
+ (void)removeAccountAttesationData;
+ (void)removeLocalAccountAttesationData;
- (NSString)anonymizationSalt;
- (PKAccountAttestationRequest)initWithCoder:(id)a3;
- (PKSecureElementCertificateSet)casdCertificate;
- (void)encodeWithCoder:(id)a3;
- (void)setAnonymizationSalt:(id)a3;
- (void)setCasdCertificate:(id)a3;
@end

@implementation PKAccountAttestationRequest

+ (id)createAnonymizationSalt
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%08X", arc4random_uniform(0xFFFFFFFF));
  v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Account Attestation: Generating salt: '%@'", buf, 0xCu);
  }

  return v2;
}

+ (id)keychainDataWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = [a1 _keychainItemWrapper];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F3BD38]];
  v6 = (void *)v5;
  if (a3) {
    *a3 = 0;
  }
  if (v5)
  {
    id v22 = 0;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v22];
    id v8 = v22;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      v13 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v14 = objc_opt_class();
      v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      uint64_t v16 = *MEMORY[0x1E4F284E8];
      id v21 = 0;
      v17 = [v7 decodeTopLevelObjectOfClasses:v15 forKey:v16 error:&v21];
      id v10 = v21;

      [v7 finishDecoding];
      if (v17) {
        BOOL v18 = v10 == 0;
      }
      else {
        BOOL v18 = 0;
      }
      if (v18)
      {
        id v12 = v17;
      }
      else
      {
        v19 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v10;
          _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Account Attestation: Could not parse keychain data: %@", buf, 0xCu);
        }

        id v12 = 0;
        if (a3) {
          *a3 = v10;
        }
      }
    }
    else
    {
      id v10 = v8;
      v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v10;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Account Attestation: Could not initialize unarchiver with keychain data: %@", buf, 0xCu);
      }

      if (a3)
      {
        id v10 = v10;
        id v12 = 0;
        *a3 = v10;
      }
      else
      {
        id v12 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)defaultAnonymizationSaltWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [a1 keychainDataWithError:a3];
  v4 = v3;
  if (!v3)
  {
    v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      id v8 = "Account Attestation: No keychain data found";
LABEL_9:
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 2u);
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [v3 objectForKey:@"DefaultSalt"];
  v6 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      id v8 = "Account Attestation: Missing default salt value";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v7)
  {
    int v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Account Attestation: Found default salt: '%@'", (uint8_t *)&v10, 0xCu);
  }
LABEL_11:

  return v5;
}

+ (id)setDefaultAnonymizationSalt:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v22 = 0;
  uint64_t v5 = [a1 keychainDataWithError:&v22];
  id v6 = v22;
  BOOL v7 = (void *)[v5 mutableCopy];

  if (v6)
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Account Attestation: Failed to load key chain data to set: %@", buf, 0xCu);
    }

    id v9 = v6;
LABEL_23:

    goto LABEL_24;
  }
  if (v7)
  {
    int v10 = PKLogFacilityTypeGetObject(6uLL);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (!v4)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        id v24 = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Account Attestation: Clearing default salt: '%@'", buf, 0xCu);
      }

      [v7 removeObjectForKey:@"DefaultSalt"];
      goto LABEL_18;
    }
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Account Attestation: Updating default salt: '%@'", buf, 0xCu);
    }

    id v12 = v7;
LABEL_14:
    [v12 setObject:v4 forKey:@"DefaultSalt"];
LABEL_18:
    uint64_t v14 = (void *)MEMORY[0x1E4F28DB0];
    v15 = (void *)[v7 copy];
    id v21 = 0;
    uint64_t v16 = [v14 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v21];
    id v17 = v21;

    BOOL v18 = [a1 _keychainItemWrapper];
    [v18 setObject:v16 forKey:*MEMORY[0x1E4F3BD38]];

    if (v17)
    {
      v19 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v17;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Account Attestation: Error writing information to keychain: %@", buf, 0xCu);
      }
    }
    id v9 = v17;

    goto LABEL_23;
  }
  if (v4)
  {
    v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Account Attestation: Creating new keychain data with salt: '%@'", buf, 0xCu);
    }

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v7 = v12;
    goto LABEL_14;
  }
  id v9 = 0;
LABEL_24:

  return v9;
}

+ (void)removeAccountAttesationData
{
  v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Account Attestation: Removing data...", v5, 2u);
  }

  id v4 = [a1 _keychainItemWrapper];
  [v4 resetKeychainItem];
}

+ (void)removeLocalAccountAttesationData
{
  v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Account Attestation: Removing local data...", v5, 2u);
  }

  id v4 = [a1 _keychainItemWrapper];
  [v4 resetLocalKeychainItem];
}

+ (id)_keychainItemWrapper
{
  v2 = [[PKKeychainItemWrapper alloc] initWithIdentifier:@"PKAnonymizationSaltKeychainKey" accessGroup:@"com.apple.passd" serviceName:@"com.apple.passd.account-attestation" type:1 invisible:1 accessibility:1];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAttestationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountAttestationRequest;
  uint64_t v5 = [(PKAccountAttestationRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"casdCertificate"];
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (PKSecureElementCertificateSet *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anonymizationSalt"];
    anonymizationSalt = v5->_anonymizationSalt;
    v5->_anonymizationSalt = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  casdCertificate = self->_casdCertificate;
  id v5 = a3;
  [v5 encodeObject:casdCertificate forKey:@"casdCertificate"];
  [v5 encodeObject:self->_anonymizationSalt forKey:@"anonymizationSalt"];
}

- (PKSecureElementCertificateSet)casdCertificate
{
  return self->_casdCertificate;
}

- (void)setCasdCertificate:(id)a3
{
}

- (NSString)anonymizationSalt
{
  return self->_anonymizationSalt;
}

- (void)setAnonymizationSalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizationSalt, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);
}

@end