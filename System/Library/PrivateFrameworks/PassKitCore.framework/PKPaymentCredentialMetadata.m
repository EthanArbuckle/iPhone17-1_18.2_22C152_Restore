@interface PKPaymentCredentialMetadata
+ (Class)classForValueType:(id)a3;
+ (id)paymentCredentialMetadataWithConfiguration:(id)a3;
- (BOOL)_isEqualToMetadata:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedDisplayName;
- (NSString)value;
- (PKPaymentCredentialMetadata)initWithConfiguration:(id)a3;
- (unint64_t)hash;
@end

@implementation PKPaymentCredentialMetadata

+ (Class)classForValueType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"text"] & 1) != 0
    || ([v3 isEqualToString:@"date"] & 1) != 0
    || [v3 isEqualToString:@"currency"])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

+ (id)paymentCredentialMetadataWithConfiguration:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKey:@"valueType"];
  v5 = (objc_class *)[(id)objc_opt_class() classForValueType:v4];
  if (v5)
  {
    v6 = (void *)[[v5 alloc] initWithConfiguration:v3];
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "Could not generate meta data for the value type:%{public}@", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (PKPaymentCredentialMetadata)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentCredentialMetadata;
  v5 = [(PKPaymentCredentialMetadata *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"localizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v8;

    if (!v5->_localizedDisplayName || !v5->_value)
    {

      v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Bad config could not create metadata", v12, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentCredentialMetadata *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPaymentCredentialMetadata *)self _isEqualToMetadata:v4];
  }

  return v5;
}

- (BOOL)_isEqualToMetadata:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)v4[1];
  uint64_t v6 = self->_localizedDisplayName;
  v7 = v5;
  if (v6 == v7)
  {

LABEL_10:
    v12 = (void *)v4[2];
    uint64_t v6 = self->_value;
    objc_super v13 = v12;
    if (v6 == v13)
    {
      char v10 = 1;
      uint64_t v8 = v6;
    }
    else
    {
      uint64_t v8 = v13;
      char v10 = 0;
      if (v6 && v13) {
        char v10 = [(NSString *)v6 isEqualToString:v13];
      }
    }
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    BOOL v11 = [(NSString *)v6 isEqualToString:v7];

    if (!v11)
    {
      char v10 = 0;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  char v10 = 0;
LABEL_15:

LABEL_16:
  return v10;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_localizedDisplayName];
  [v3 safelyAddObject:self->_value];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end