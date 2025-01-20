@interface PKPassUpgradePrecursorPassAction
+ (BOOL)supportsSecureCoding;
- (PKPassUpgradePrecursorPassAction)initWithCoder:(id)a3;
- (PKPassUpgradePrecursorPassAction)initWithDictionary:(id)a3;
- (id)asDictionary;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassUpgradePrecursorPassAction

- (PKPassUpgradePrecursorPassAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassAction;
  v5 = [(PKPassUpgradePrecursorPassAction *)&v8 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_type = PKPassUpgradePrecursorPassActionTypeFromString(v6);
  }
  return v5;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  unint64_t v5 = self->_type - 1;
  if (v5 > 3) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56ECBA0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"type"];
  v7 = (void *)[v4 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = self->_type - 1;
  if (v4 > 3) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56ECBA0[v4];
  }
  [a3 encodeObject:v5 forKey:@"type"];
}

- (PKPassUpgradePrecursorPassAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassAction;
  unint64_t v5 = [(PKPassUpgradePrecursorPassAction *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = PKPassUpgradePrecursorPassActionTypeFromString(v6);
  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end