@interface PKProvisioningJPKISupportData
+ (BOOL)supportsSecureCoding;
+ (id)_decryptEncryptedSupportDataDictionary:(id)a3 withGroupIdentifier:(id)a4 sid:(id)a5;
- (NSString)password;
- (NSString)pin;
- (PKProvisioningJPKISupportData)initWithCoder:(id)a3;
- (PKProvisioningJPKISupportData)initWithEncryptedSupportDataDictionary:(id)a3 sid:(id)a4;
- (PKProvisioningJPKISupportData)initWithPIN:(id)a3 password:(id)a4 type:(unint64_t)a5 sid:(id)a6;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initByUnarchivingData:(id)a3 ofType:(unint64_t)a4 forPass:(id)a5;
- (unint64_t)supportDataType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKProvisioningJPKISupportData

- (PKProvisioningJPKISupportData)initWithEncryptedSupportDataDictionary:(id)a3 sid:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningJPKISupportData;
  result = [(PKProvisioningSupportData *)&v5 initWithEncryptedSupportDataDictionary:a3 sid:a4];
  if (result) {
    result->_type = 1;
  }
  return result;
}

- (PKProvisioningJPKISupportData)initWithPIN:(id)a3 password:(id)a4 type:(unint64_t)a5 sid:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a6;
  if (v10 | v11)
  {
    v21.receiver = self;
    v21.super_class = (Class)PKProvisioningJPKISupportData;
    v13 = [(PKProvisioningJPKISupportData *)&v21 init];
    if (v13)
    {
      if (v10)
      {
        uint64_t v14 = objc_msgSend((id)v10, "pk_zString");
        pin = v13->_pin;
        v13->_pin = (NSString *)v14;
      }
      if (v11)
      {
        uint64_t v16 = objc_msgSend((id)v11, "pk_zString");
        password = v13->_password;
        v13->_password = (NSString *)v16;
      }
      v13->_type = a5;
      [(PKProvisioningSupportData *)v13 setSid:v12];
    }
    self = v13;
    v18 = self;
  }
  else
  {
    v19 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v12;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData failed init - PIN and Password not provided", buf, 0xCu);
    }

    v18 = 0;
  }

  return v18;
}

- (id)initByUnarchivingData:(id)a3 ofType:(unint64_t)a4 forPass:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F28DC0];
  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = a3;
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v12, objc_opt_class(), 0);
  id v33 = 0;
  uint64_t v14 = [v9 unarchivedObjectOfClasses:v13 fromData:v11 error:&v33];

  id v15 = v33;
  uint64_t v16 = [v14 objectForKeyedSubscript:@"SID"];
  if (v16)
  {
    if (!v15) {
      goto LABEL_10;
    }
  }
  else
  {
    v17 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = &stru_1EE0F5368;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Warning, SID was not found when initializing PKProvisioningJPKISupportData by unarchiving data.", buf, 0xCu);
    }

    uint64_t v16 = &stru_1EE0F5368;
    if (!v15)
    {
LABEL_10:
      if (!a4)
      {
        v26 = [v14 objectForKeyedSubscript:@"userPIN"];
        v27 = @"userPassword";
LABEL_30:
        v28 = [v14 objectForKeyedSubscript:v27];
        goto LABEL_31;
      }
      if (a4 != 1)
      {
        v26 = 0;
        v28 = 0;
LABEL_31:
        self = [(PKProvisioningJPKISupportData *)self initWithPIN:v26 password:v28 type:a4 sid:v16];

        v29 = self;
LABEL_32:

        goto LABEL_33;
      }
      v19 = [v14 PKDictionaryForKey:@"EncryptedSupportDictionary"];
      if (v19)
      {
        v20 = objc_opt_class();
        objc_super v21 = [v8 longTermPrivacyKeyGroupIdentifier];
        uint64_t v22 = [v20 _decryptEncryptedSupportDataDictionary:v19 withGroupIdentifier:v21 sid:v16];

        uint64_t v14 = (void *)v22;
        if (v22)
        {
LABEL_29:

          v26 = [v14 objectForKeyedSubscript:@"temporaryPin"];
          v27 = @"temporaryPassword";
          goto LABEL_30;
        }
        if (!PKFallbackToStaticJPKITempPINAndPass())
        {
          uint64_t v14 = 0;
          goto LABEL_29;
        }
        id v23 = PKLogFacilityTypeGetObject(0x27uLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v16;
          _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData hitting temporary workaround to use known server hard coded TPIN/TPassword values", buf, 0xCu);
        }

        id v24 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v34[0] = @"temporaryPin";
        v34[1] = @"temporaryPassword";
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
        uint64_t v14 = (void *)[v24 initWithObjects:&unk_1EE22AC58 forKeys:v25];
      }
      else
      {
        uint64_t v30 = [v14 objectForKeyedSubscript:@"temporaryPin"];
        if (!v30)
        {
          v31 = [v14 objectForKeyedSubscript:@"temporaryPassword"];

          if (!v31)
          {
            v26 = PKLogFacilityTypeGetObject(0x27uLL);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v16;
              _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData failed init - temporary type lacked expected values", buf, 0xCu);
            }
            v29 = 0;
            goto LABEL_32;
          }
          goto LABEL_29;
        }
        v25 = (void *)v30;
      }

      goto LABEL_29;
    }
  }
  v18 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v16;
    __int16 v37 = 2112;
    id v38 = v15;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData failed init - unarchiving archived data failed with error: %@", buf, 0x16u);
  }

  if (v14) {
    goto LABEL_10;
  }
  v29 = 0;
LABEL_33:

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningJPKISupportData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKProvisioningJPKISupportData;
  objc_super v5 = [(PKProvisioningSupportData *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JPKIPIN"];
    uint64_t v7 = objc_msgSend(v6, "pk_zString");
    pin = v5->_pin;
    v5->_pin = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JPKIpassword"];
    uint64_t v10 = objc_msgSend(v9, "pk_zString");
    password = v5->_password;
    v5->_password = (NSString *)v10;

    v5->_type = [v4 decodeIntegerForKey:@"JPKISupportDataType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningJPKISupportData;
  id v4 = a3;
  [(PKProvisioningSupportData *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_pin, @"JPKIPIN", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_password forKey:@"JPKIpassword"];
  [v4 encodeInteger:self->_type forKey:@"JPKISupportDataType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKProvisioningJPKISupportData;
  id v4 = [(PKProvisioningSupportData *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_pin pk_zString];
  v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSString *)self->_password pk_zString];
  id v8 = (void *)v4[4];
  v4[4] = v7;

  v4[5] = self->_type;
  return v4;
}

- (unint64_t)supportDataType
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningJPKISupportData;
  v3 = [(PKProvisioningSupportData *)&v12 _dictionaryRepresentation];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  }
  v6 = v5;

  if (self->_type) {
    uint64_t v7 = @"temporaryPin";
  }
  else {
    uint64_t v7 = @"userPIN";
  }
  [v6 setObject:self->_pin forKeyedSubscript:v7];
  if (self->_type) {
    id v8 = @"temporaryPassword";
  }
  else {
    id v8 = @"userPassword";
  }
  [v6 setObject:self->_password forKeyedSubscript:v8];
  if ([v6 count]) {
    v9 = v6;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  return v10;
}

+ (id)_decryptEncryptedSupportDataDictionary:(id)a3 withGroupIdentifier:(id)a4 sid:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(PKDAManager);
  id v22 = 0;
  id v11 = [(PKDAManager *)v10 decryptPayload:v7 groupIdentifier:v9 outError:&v22];

  id v12 = v22;
  if (v11) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    id v14 = v12;
    id v15 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData - Unable to decrypt encrypted support data dict %@ with error: %@", buf, 0x20u);
    }
    uint64_t v16 = 0;
LABEL_14:

    v19 = v14;
    goto LABEL_16;
  }
  id v21 = 0;
  uint64_t v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v21];
  id v17 = v21;
  if (v16) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (!v18)
  {
    id v14 = v17;
    id v15 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData - Issue serializing decrypted data: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v19 = 0;
LABEL_16:

  return v16;
}

- (NSString)pin
{
  return self->_pin;
}

- (NSString)password
{
  return self->_password;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pin, 0);
}

@end