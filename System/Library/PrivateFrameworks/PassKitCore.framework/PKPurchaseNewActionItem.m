@interface PKPurchaseNewActionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)serviceProviderDataRequiresAppletData;
- (NSDate)newExpirationDate;
- (NSDecimalNumber)amount;
- (NSString)currency;
- (NSString)identifier;
- (NSString)title;
- (PKPurchaseNewActionItem)init;
- (PKPurchaseNewActionItem)initWithCoder:(id)a3;
- (PKPurchaseNewActionItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_processLocalizableStrings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)serviceProviderDataWithItemForPass:(id)a3 completion:(id)a4;
@end

@implementation PKPurchaseNewActionItem

- (PKPurchaseNewActionItem)init
{
  return 0;
}

- (PKPurchaseNewActionItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPurchaseNewActionItem;
  v5 = [(PKPurchaseNewActionItem *)&v29 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 PKStringForKey:@"title"];
    uint64_t v10 = [v9 copy];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v12 = [v4 PKDecimalNumberForKey:@"amount"];
    uint64_t v13 = [v12 copy];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v13;

    v15 = [v4 PKStringForKey:@"currency"];
    uint64_t v16 = [v15 copy];
    currency = v5->_currency;
    v5->_currency = (NSString *)v16;

    v18 = [v4 PKDateForKey:@"newExpirationDate"];
    uint64_t v19 = [v18 copy];
    newExpirationDate = v5->_newExpirationDate;
    v5->_newExpirationDate = (NSDate *)v19;

    v21 = [v4 PKDictionaryForKey:@"serviceProviderData"];
    v22 = (void *)[v21 copy];
    v23 = v22;
    if (v22) {
      v24 = v22;
    }
    else {
      v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = v24;

    v5->_serviceProviderDataRequiresAppletData = [v4 PKBoolForKey:@"serviceProviderDataRequiresAppletData"];
    uint64_t v26 = +[PKPassLibrary sharedInstance];
    sharedLibrary = v5->_sharedLibrary;
    v5->_sharedLibrary = (PKPassLibrary *)v26;
  }
  return v5;
}

- (void)_processLocalizableStrings:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4 && self->_title)
  {
    uint64_t v7 = v4;
    v4[2]();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v5;

    id v4 = v7;
  }
}

- (void)serviceProviderDataWithItemForPass:(id)a3 completion:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[(NSMutableDictionary *)self->_serviceProviderData mutableCopy];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  identifier = self->_identifier;
  v19[0] = @"identifier";
  v19[1] = @"amount";
  amount = self->_amount;
  v20[0] = identifier;
  v20[1] = amount;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v9 addObject:v12];
  uint64_t v13 = (void *)[v9 copy];
  [v8 setObject:v13 forKeyedSubscript:@"products"];

  if (self->_serviceProviderDataRequiresAppletData)
  {
    sharedLibrary = self->_sharedLibrary;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__PKPurchaseNewActionItem_serviceProviderDataWithItemForPass_completion___block_invoke;
    v16[3] = &unk_1E56D8450;
    id v17 = v8;
    id v18 = v7;
    [(PKPassLibrary *)sharedLibrary encryptedServiceProviderDataForSecureElementPass:v6 completion:v16];

    v15 = v17;
  }
  else
  {
    v15 = (void *)[v8 copy];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

void __73__PKPurchaseNewActionItem_serviceProviderDataWithItemForPass_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:@"appletData"];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPurchaseNewActionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPurchaseNewActionItem;
  v5 = [(PKPurchaseNewActionItem *)&v30 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v10 = [v9 copy];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    uint64_t v13 = [v12 copy];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    uint64_t v16 = [v15 copy];
    currency = v5->_currency;
    v5->_currency = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"newExpirationDate"];
    newExpirationDate = v5->_newExpirationDate;
    v5->_newExpirationDate = (NSDate *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"serviceProviderData"];
    uint64_t v27 = [v26 copy];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSMutableDictionary *)v27;

    v5->_serviceProviderDataRequiresAppletData = [v4 decodeBoolForKey:@"serviceProviderDataRequiresAppletData"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeObject:self->_newExpirationDate forKey:@"newExpirationDate"];
  [v5 encodeObject:self->_serviceProviderData forKey:@"serviceProviderData"];
  [v5 encodeBool:self->_serviceProviderDataRequiresAppletData forKey:@"serviceProviderDataRequiresAppletData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  id v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_currency copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSDate *)self->_newExpirationDate copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSMutableDictionary *)self->_serviceProviderData copyWithZone:a3];
  id v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  *(unsigned char *)(v5 + 24) = self->_serviceProviderDataRequiresAppletData;
  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currency
{
  return self->_currency;
}

- (NSDate)newExpirationDate
{
  return self->_newExpirationDate;
}

- (BOOL)serviceProviderDataRequiresAppletData
{
  return self->_serviceProviderDataRequiresAppletData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newExpirationDate, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
}

@end