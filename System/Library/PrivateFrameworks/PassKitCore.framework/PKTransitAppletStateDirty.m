@interface PKTransitAppletStateDirty
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPKTransitAppletStateDirty:(id)a3;
- (NSString)applicationIdentifier;
- (NSString)dpanIdentifier;
- (NSString)passUniqueIdentifier;
- (NSString)secureElementIdentifier;
- (PKTransitAppletStateDirty)initWithCoder:(id)a3;
- (PKTransitAppletStateDirty)initWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setDpanIdentifier:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setSecureElementIdentifier:(id)a3;
@end

@implementation PKTransitAppletStateDirty

- (PKTransitAppletStateDirty)initWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKTransitAppletStateDirty;
  v9 = [(PKTransitAppletStateDirty *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passUniqueIdentifier, a3);
    uint64_t v11 = [v8 applicationIdentifier];
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v11;

    uint64_t v13 = [v8 secureElementIdentifier];
    secureElementIdentifier = v10->_secureElementIdentifier;
    v10->_secureElementIdentifier = (NSString *)v13;

    uint64_t v15 = [v8 dpanIdentifier];
    dpanIdentifier = v10->_dpanIdentifier;
    v10->_dpanIdentifier = (NSString *)v15;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKTransitAppletStateDirty *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransitAppletStateDirty *)self isEqualToPKTransitAppletStateDirty:v5];

  return v6;
}

- (BOOL)isEqualToPKTransitAppletStateDirty:(id)a3
{
  v4 = a3;
  v5 = (void *)v4[1];
  BOOL v6 = self->_passUniqueIdentifier;
  id v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    LOBYTE(v10) = 0;
    goto LABEL_21;
  }
  BOOL v10 = [(NSString *)v6 isEqualToString:v7];

  if (v10)
  {
LABEL_10:
    uint64_t v11 = (void *)v4[3];
    BOOL v6 = self->_applicationIdentifier;
    v12 = v11;
    if (v6 == v12)
    {

LABEL_16:
      secureElementIdentifier = self->_secureElementIdentifier;
      v14 = (void *)v4[2];
      BOOL v6 = secureElementIdentifier;
      uint64_t v15 = v14;
      if (v6 == v15)
      {
        LOBYTE(v10) = 1;
        id v8 = v6;
      }
      else
      {
        id v8 = v15;
        LOBYTE(v10) = 0;
        if (v6 && v15) {
          LOBYTE(v10) = [(NSString *)v6 isEqualToString:v15];
        }
      }
      goto LABEL_21;
    }
    id v8 = v12;
    LOBYTE(v10) = 0;
    if (v6 && v12)
    {
      BOOL v10 = [(NSString *)v6 isEqualToString:v12];

      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
LABEL_21:
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_passUniqueIdentifier];
  [v3 safelyAddObject:self->_applicationIdentifier];
  [v3 safelyAddObject:self->_secureElementIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:applicationIdentifier forKey:@"paymentApplicationIdentifier"];
  [v5 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeObject:self->_secureElementIdentifier forKey:@"secureElementIdentifier"];
  [v5 encodeObject:self->_dpanIdentifier forKey:@"dpanIdentifier"];
}

- (PKTransitAppletStateDirty)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTransitAppletStateDirty *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentApplicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementIdentifier"];
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = (void *)[(NSString *)self->_dpanIdentifier copyWithZone:a3];
  [v5 setDpanIdentifier:v6];

  id v7 = (void *)[(NSString *)self->_passUniqueIdentifier copyWithZone:a3];
  [v5 setPassUniqueIdentifier:v7];

  uint64_t v8 = (void *)[(NSString *)self->_applicationIdentifier copyWithZone:a3];
  [v5 setApplicationIdentifier:v8];

  BOOL v9 = (void *)[(NSString *)self->_secureElementIdentifier copyWithZone:a3];
  [v5 setSecureElementIdentifier:v9];

  return v5;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end