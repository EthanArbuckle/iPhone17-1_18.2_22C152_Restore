@interface PKPassUpgradePrecursorPassGenericReprovisionAction
+ (BOOL)supportsSecureCoding;
- (PKPassUpgradePrecursorPassGenericReprovisionAction)initWithCoder:(id)a3;
- (PKPassUpgradePrecursorPassGenericReprovisionAction)initWithDictionary:(id)a3;
- (id)asDictionary;
- (unint64_t)subtype;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassUpgradePrecursorPassGenericReprovisionAction

- (PKPassUpgradePrecursorPassGenericReprovisionAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  v5 = [(PKPassUpgradePrecursorPassAction *)&v8 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"subtype"];
    v5->_subtype = PKPassUpgradePrecursorPassActionGenericReprovisionSubTypeFromString(v6);
  }
  return v5;
}

- (id)asDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  v3 = [(PKPassUpgradePrecursorPassAction *)&v9 asDictionary];
  id v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = self->_subtype - 1;
  if (v5 > 4) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56ECBC0[v5];
  }
  [v4 setObject:v6 forKeyedSubscript:@"subtype"];
  v7 = (void *)[v4 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  id v4 = a3;
  [(PKPassUpgradePrecursorPassAction *)&v7 encodeWithCoder:v4];
  unint64_t v5 = self->_subtype - 1;
  if (v5 > 4) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56ECBC0[v5];
  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, @"subtype", v7.receiver, v7.super_class);
}

- (PKPassUpgradePrecursorPassGenericReprovisionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassGenericReprovisionAction;
  unint64_t v5 = [(PKPassUpgradePrecursorPassAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtype"];
    v5->_subtype = PKPassUpgradePrecursorPassActionGenericReprovisionSubTypeFromString(v6);
  }
  return v5;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

@end