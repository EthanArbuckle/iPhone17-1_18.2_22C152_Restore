@interface PKPendingCarKeyProvisioning
+ (BOOL)supportsSecureCoding;
+ (id)uniqueIdentifierForBrandIdentifier:(id)a3 pairedReaderIdentifier:(id)a4;
+ (id)uniqueIdentifierForCarKeyConfiguration:(id)a3;
+ (id)uniqueIdentifierForSubcredential:(id)a3;
- (BOOL)representsPass:(id)a3;
- (PKAddCarKeyPassConfiguration)configuration;
- (PKPendingCarKeyProvisioning)initWithCarKeyConfiguration:(id)a3;
- (PKPendingCarKeyProvisioning)initWithCoder:(id)a3;
- (id)type;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation PKPendingCarKeyProvisioning

- (PKPendingCarKeyProvisioning)initWithCarKeyConfiguration:(id)a3
{
  id v5 = a3;
  v6 = +[PKPendingCarKeyProvisioning uniqueIdentifierForCarKeyConfiguration:v5];
  v10.receiver = self;
  v10.super_class = (Class)PKPendingCarKeyProvisioning;
  v7 = [(PKPendingProvisioning *)&v10 initWithUniqueIdentifier:v6 status:3];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_configuration, a3);
  }

  return v8;
}

- (id)type
{
  return @"CarKey";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingCarKeyProvisioning)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPendingCarKeyProvisioning;
  id v5 = [(PKPendingProvisioning *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (PKAddCarKeyPassConfiguration *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPendingCarKeyProvisioning;
  id v4 = a3;
  [(PKPendingProvisioning *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, @"configuration", v5.receiver, v5.super_class);
}

- (void)_copyIntoPendingProvision:(id)a3
{
}

+ (id)uniqueIdentifierForBrandIdentifier:(id)a3 pairedReaderIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    v7 = [NSString stringWithFormat:@"%@.%@.%@", @"CarKey", v5, v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)representsPass:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [a3 devicePaymentApplications];
  uint64_t v22 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v5 = *(void *)v29;
    v23 = v4;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v4);
        }
        v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v8 = [v7 subcredentials];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = +[PKPendingCarKeyProvisioning uniqueIdentifierForSubcredential:*(void *)(*((void *)&v24 + 1) + 8 * j)];
              id v14 = [(PKPendingProvisioning *)self uniqueIdentifier];
              id v15 = v13;
              v16 = v15;
              if (v14 == v15)
              {

LABEL_25:
                BOOL v19 = 1;
                id v4 = v23;
                goto LABEL_27;
              }
              if (v15) {
                BOOL v17 = v14 == 0;
              }
              else {
                BOOL v17 = 1;
              }
              if (v17)
              {
              }
              else
              {
                char v18 = [v14 isEqualToString:v15];

                if (v18) {
                  goto LABEL_25;
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        id v4 = v23;
        uint64_t v5 = v21;
      }
      BOOL v19 = 0;
      uint64_t v22 = [v23 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_27:

  return v19;
}

+ (id)uniqueIdentifierForCarKeyConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 issuerIdentifier];
  id v6 = [v4 pairedReaderIdentifier];

  v7 = [a1 uniqueIdentifierForBrandIdentifier:v5 pairedReaderIdentifier:v6];

  return v7;
}

+ (id)uniqueIdentifierForSubcredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 brandIdentifier];
  id v6 = [v4 pairedReaderIdentifier];

  v7 = [a1 uniqueIdentifierForBrandIdentifier:v5 pairedReaderIdentifier:v6];

  return v7;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end