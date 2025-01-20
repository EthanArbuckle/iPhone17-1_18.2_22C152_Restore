@interface PKDigitalIssuanceServiceProviderItem
- (NSDecimalNumber)amount;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSString)localizedDisplayName;
- (PKDigitalIssuanceServiceProviderItem)initWithDictionary:(id)a3;
- (PKDigitalIssuanceServiceProviderItem)initWithServiceProviderProduct:(id)a3;
- (unint64_t)unitCount;
- (void)setIdentifier:(id)a3;
@end

@implementation PKDigitalIssuanceServiceProviderItem

- (PKDigitalIssuanceServiceProviderItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDigitalIssuanceServiceProviderItem;
  v5 = [(PKDigitalIssuanceServiceProviderItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"localizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

    v5->_unitCount = [v4 PKIntegerForKey:@"unitCount"];
    uint64_t v12 = [v4 PKDecimalNumberForKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v12;
  }
  return v5;
}

- (PKDigitalIssuanceServiceProviderItem)initWithServiceProviderProduct:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKDigitalIssuanceServiceProviderItem;
  v5 = [(PKDigitalIssuanceServiceProviderItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 localizedDisplayName];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 localizedDescription];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

    v5->_unitCount = 0;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28C28]) initWithInt:0];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v12;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (unint64_t)unitCount
{
  return self->_unitCount;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end