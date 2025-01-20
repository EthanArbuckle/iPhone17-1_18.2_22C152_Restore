@interface PKServiceProviderPurchaseAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServiceProviderPurchaseAction:(id)a3;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (PKServiceProviderPurchaseAction)initWithCoder:(id)a3;
- (PKServiceProviderPurchaseAction)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation PKServiceProviderPurchaseAction

+ (id)actionWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (PKServiceProviderPurchaseAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKServiceProviderPurchaseAction;
  v5 = [(PKServiceProviderPurchaseAction *)&v16 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 PKStringForKey:@"localizedTitle"];
    uint64_t v10 = [v9 copy];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    v12 = [v4 PKStringForKey:@"localizedDescription"];
    uint64_t v13 = [v12 copy];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPurchaseAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKServiceProviderPurchaseAction;
  v5 = [(PKServiceProviderPurchaseAction *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    uint64_t v10 = [v9 copy];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    uint64_t v13 = [v12 copy];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_localizedTitle];
  [v3 safelyAddObject:self->_localizedDescription];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(PKServiceProviderPurchaseAction *)self isEqualToServiceProviderPurchaseAction:v4];

  return v5;
}

- (BOOL)isEqualToServiceProviderPurchaseAction:(id)a3
{
  id v4 = (PKServiceProviderPurchaseAction *)a3;
  if (self == v4)
  {
    char v8 = 1;
    goto LABEL_19;
  }
  identifier = self->_identifier;
  v6 = v4->_identifier;
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_18;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_18;
  }
  localizedTitle = self->_localizedTitle;
  uint64_t v10 = v4->_localizedTitle;
  if (!localizedTitle || !v10)
  {
    if (localizedTitle == v10) {
      goto LABEL_14;
    }
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  localizedDescription = self->_localizedDescription;
  v12 = v4->_localizedDescription;
  if (localizedDescription && v12) {
    char v8 = -[NSString isEqual:](localizedDescription, "isEqual:");
  }
  else {
    char v8 = localizedDescription == v12;
  }
LABEL_19:

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_identifier) {
    [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  }
  if (self->_localizedTitle) {
    [v4 appendFormat:@"localizedTitle: '%@'; ", self->_localizedTitle];
  }
  if (self->_localizedDescription) {
    [v4 appendFormat:@"localizedDescription: %@; ", self->_localizedDescription];
  }
  [v4 appendFormat:@">"];
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end