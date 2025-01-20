@interface PKAMSMediaLookupItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (PKAMSMediaLookupItem)init;
- (PKAMSMediaLookupItem)initWithCoder:(id)a3;
- (PKAMSMediaLookupItemMusic)musicItem;
- (id)_initWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAMSMediaLookupItem

- (PKAMSMediaLookupItem)init
{
  return 0;
}

- (id)_initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAMSMediaLookupItem;
  id result = [(PKAMSMediaLookupItem *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (PKAMSMediaLookupItemMusic)musicItem
{
  if (self->_type <= 2) {
    v3 = self;
  }

  return (PKAMSMediaLookupItemMusic *)self;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKAMSMediaLookupItem)initWithCoder:(id)a3
{
  unint64_t v4 = [a3 decodeIntegerForKey:@"type"];
  self->_type = v4;

  return (PKAMSMediaLookupItem *)[(PKAMSMediaLookupItem *)self _initWithType:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[PKAMSMediaLookupItem allocWithZone:a3];
  unint64_t type = self->_type;

  return [(PKAMSMediaLookupItem *)v4 _initWithType:type];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKAMSMediaLookupItem *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAMSMediaLookupItem *)self isEqualToItem:v5];

  return v6;
}

- (BOOL)isEqualToItem:(id)a3
{
  return self->_type == *((void *)a3 + 1);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash();
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end