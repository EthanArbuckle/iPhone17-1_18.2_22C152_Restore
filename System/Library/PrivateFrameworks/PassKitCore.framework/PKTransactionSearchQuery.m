@interface PKTransactionSearchQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)passUniqueIdentifier;
- (PKTransactionSearchQuery)initWithCoder:(id)a3;
- (PKTransactionSearchQuery)initWithIdentifier:(id)a3 keyboardLanguage:(id)a4 passUniqueIdentifier:(id)a5;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
@end

@implementation PKTransactionSearchQuery

- (PKTransactionSearchQuery)initWithIdentifier:(id)a3 keyboardLanguage:(id)a4 passUniqueIdentifier:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionSearchQuery;
  v10 = [(PKSearchQuery *)&v13 initWithIdentifier:a3 keyboardLanguage:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_passUniqueIdentifier, a5);
  }

  return v11;
}

- (unint64_t)domain
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionSearchQuery;
  id v4 = a3;
  [(PKSearchQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, @"passUniqueIdentifier", v5.receiver, v5.super_class);
}

- (PKTransactionSearchQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSearchQuery;
  objc_super v5 = [(PKSearchQuery *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    passUniqueIdentifier = self->_passUniqueIdentifier;
    uint64_t v6 = (NSString *)v4[7];
    if (passUniqueIdentifier) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (passUniqueIdentifier == v6)
      {
LABEL_10:
        v10.receiver = self;
        v10.super_class = (Class)PKTransactionSearchQuery;
        BOOL v8 = [(PKSearchQuery *)&v10 isEqual:v4];
        goto LABEL_11;
      }
    }
    else if (-[NSString isEqual:](passUniqueIdentifier, "isEqual:"))
    {
      goto LABEL_10;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_passUniqueIdentifier];
  v7.receiver = self;
  v7.super_class = (Class)PKTransactionSearchQuery;
  id v4 = [(PKSearchQuery *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKTransactionSearchQuery;
  id v3 = [(PKSearchQuery *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"passUniqueIdentifier: '%@'; ", self->_passUniqueIdentifier];
  [v4 appendFormat:@">"];
  return v4;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end