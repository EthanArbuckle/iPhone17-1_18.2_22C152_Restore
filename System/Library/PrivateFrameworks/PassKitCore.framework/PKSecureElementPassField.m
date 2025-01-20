@interface PKSecureElementPassField
- (NSSet)foreignReferenceIdentifiers;
- (NSString)key;
- (PKSecureElementPassField)initWithPassField:(id)a3;
- (PKSecureElementPassField)initWithPaymentPassFieldDictionary:(id)a3;
- (int64_t)unitType;
- (void)setForeignReferenceIdentifiers:(id)a3;
- (void)setKey:(id)a3;
- (void)setUnitType:(int64_t)a3;
@end

@implementation PKSecureElementPassField

- (PKSecureElementPassField)initWithPaymentPassFieldDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PKSecureElementPassField *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 PKSetContaining:objc_opt_class() forKey:@"combinedForeignReferenceIdentifiers"];
    foreignReferenceIdentifiers = v5->_foreignReferenceIdentifiers;
    v5->_foreignReferenceIdentifiers = (NSSet *)v8;

    if (!v5->_foreignReferenceIdentifiers)
    {
      v10 = [v4 PKStringForKey:@"foreignReferenceIdentifier"];
      if (v10)
      {
        uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v10, 0);
        v12 = v5->_foreignReferenceIdentifiers;
        v5->_foreignReferenceIdentifiers = (NSSet *)v11;
      }
    }
    v13 = [v4 PKStringForKey:@"unitType"];
    v18 = v13;
    if (v13) {
      v5->_unitType = (int)_PKEnumValueFromString(v13, 0, @"PKFieldUnitType", @"PKFieldUnitTypeNone, PKFieldUnitTypeDefault, PKFieldUnitTypeRides, PKFieldUnitTypeTickets, PKFieldUnitTypeLoyaltyPoints", v14, v15, v16, v17, 0xFFFFFFFF);
    }
  }
  return v5;
}

- (PKSecureElementPassField)initWithPassField:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSecureElementPassField;
  v5 = [(PKSecureElementPassField *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 key];
    uint64_t v7 = [v6 copy];
    key = v5->_key;
    v5->_key = (NSString *)v7;

    v9 = [v4 foreignReferenceIdentifiers];
    uint64_t v10 = [v9 copy];
    foreignReferenceIdentifiers = v5->_foreignReferenceIdentifiers;
    v5->_foreignReferenceIdentifiers = (NSSet *)v10;

    v5->_unitType = [v4 unitType];
  }

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSSet)foreignReferenceIdentifiers
{
  return self->_foreignReferenceIdentifiers;
}

- (void)setForeignReferenceIdentifiers:(id)a3
{
}

- (int64_t)unitType
{
  return self->_unitType;
}

- (void)setUnitType:(int64_t)a3
{
  self->_unitType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignReferenceIdentifiers, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end