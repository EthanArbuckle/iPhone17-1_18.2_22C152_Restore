@interface PKAddHomeKeyPassConfiguration
+ (BOOL)supportsSecureCoding;
- (NSArray)appletTypes;
- (PKAddHomeKeyPassConfiguration)init;
- (PKAddHomeKeyPassConfiguration)initWithCoder:(id)a3;
- (id)_initWithPaymentMethodTypes:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAddHomeKeyPassConfiguration

- (void).cxx_destruct
{
}

- (PKAddHomeKeyPassConfiguration)init
{
  return (PKAddHomeKeyPassConfiguration *)[(PKAddHomeKeyPassConfiguration *)self _initWithPaymentMethodTypes:&unk_1EE22B2D0];
}

- (id)_initWithPaymentMethodTypes:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAddHomeKeyPassConfiguration;
  v5 = [(PKAddSecureElementPassConfiguration *)&v25 initWithType:3];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "unsignedIntegerValue", (void)v21);
          if (v12 == 1004)
          {
            uint64_t v14 = +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirAliro];
          }
          else
          {
            uint64_t v13 = v12;
            if (v12 != 1003)
            {
              v19 = PKLogFacilityTypeGetObject(0);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v27 = v13;
                _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Unrecognized payment method type: %ld", buf, 0xCu);
              }

              v18 = 0;
              goto LABEL_18;
            }
            uint64_t v14 = +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirHome];
          }
          v15 = (void *)v14;
          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = [v6 copy];
    appletTypes = v5->_appletTypes;
    v5->_appletTypes = (NSArray *)v16;
  }
  v18 = v5;
LABEL_18:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddHomeKeyPassConfiguration;
  id v4 = a3;
  [(PKAddSecureElementPassConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_appletTypes, @"appletTypes", v5.receiver, v5.super_class);
}

- (PKAddHomeKeyPassConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAddHomeKeyPassConfiguration;
  objc_super v5 = [(PKAddSecureElementPassConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"appletTypes"];
    appletTypes = v5->_appletTypes;
    v5->_appletTypes = (NSArray *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"appletTypes: '%@'; ", self->_appletTypes];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)appletTypes
{
  return self->_appletTypes;
}

@end