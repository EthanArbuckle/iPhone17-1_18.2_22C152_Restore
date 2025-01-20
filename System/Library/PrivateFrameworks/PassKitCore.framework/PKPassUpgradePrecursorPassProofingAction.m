@interface PKPassUpgradePrecursorPassProofingAction
+ (BOOL)supportsSecureCoding;
- (NSString)productIdentifier;
- (PKPassUpgradePrecursorPassProofingAction)initWithCoder:(id)a3;
- (PKPassUpgradePrecursorPassProofingAction)initWithDictionary:(id)a3;
- (id)asDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassUpgradePrecursorPassProofingAction

- (PKPassUpgradePrecursorPassProofingAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  v5 = [(PKPassUpgradePrecursorPassAction *)&v9 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"productIdentifier"];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)asDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  v3 = [(PKPassUpgradePrecursorPassAction *)&v7 asDictionary];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:self->_productIdentifier forKeyedSubscript:@"productIdentifier"];
  v5 = (void *)[v4 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  id v4 = a3;
  [(PKPassUpgradePrecursorPassAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_productIdentifier, @"productIdentifier", v5.receiver, v5.super_class);
}

- (PKPassUpgradePrecursorPassProofingAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassUpgradePrecursorPassProofingAction;
  objc_super v5 = [(PKPassUpgradePrecursorPassAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productIdentifier"];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v6;
  }
  return v5;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void).cxx_destruct
{
}

@end