@interface RMCertificateStatusItem
+ (BOOL)supportsSecureCoding;
+ (id)certificateStatusItemWithPersistentRef:(id)a3 isIdentity:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCertificateStatus:(id)a3;
- (BOOL)isIdentity;
- (NSData)persistentRef;
- (RMCertificateStatusItem)initWithCoder:(id)a3;
- (RMCertificateStatusItem)initWithWithPersistentRef:(id)a3 isIdentity:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMCertificateStatusItem

+ (id)certificateStatusItemWithPersistentRef:(id)a3 isIdentity:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[RMCertificateStatusItem alloc] initWithWithPersistentRef:v5 isIdentity:v4];

  return v6;
}

- (RMCertificateStatusItem)initWithWithPersistentRef:(id)a3 isIdentity:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMCertificateStatusItem;
  v8 = [(RMCertificateStatusItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_persistentRef, a3);
    v9->_isIdentity = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMCertificateStatusItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistent-ref"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"is-identity"];

  id v7 = -[RMCertificateStatusItem initWithWithPersistentRef:isIdentity:](self, "initWithWithPersistentRef:isIdentity:", v5, [v6 BOOLValue]);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMCertificateStatusItem *)self persistentRef];
  [v4 encodeObject:v5 forKey:@"persistent-ref"];

  objc_msgSend(NSNumber, "numberWithBool:", -[RMCertificateStatusItem isIdentity](self, "isIdentity"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"is-identity"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMCertificateStatusItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMCertificateStatusItem *)self isEqualToCertificateStatus:v4];
  }

  return v5;
}

- (BOOL)isEqualToCertificateStatus:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMCertificateStatusItem *)self persistentRef];
  id v6 = [v4 persistentRef];
  if ([v5 isEqualToData:v6])
  {
    BOOL v7 = [(RMCertificateStatusItem *)self isIdentity];
    int v8 = v7 ^ [v4 isIdentity] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSData)persistentRef
{
  return self->_persistentRef;
}

- (BOOL)isIdentity
{
  return self->_isIdentity;
}

- (void).cxx_destruct
{
}

@end