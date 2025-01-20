@interface VMAccount
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (BOOL)isProvisioned;
- (NSString)abbreviatedAccountDescription;
- (NSString)accountDescription;
- (NSString)isoCountryCode;
- (NSString)serviceName;
- (NSUUID)UUID;
- (VMAccount)init;
- (VMAccount)initWithCoder:(id)a3;
- (VMAccount)initWithUUID:(id)a3;
- (VMHandle)handle;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)copyPropertiesWithZone:(_NSZone *)a3 toAccount:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAbbreviatedAccountDescription:(id)a3;
- (void)setAccountDescription:(id)a3;
- (void)setHandle:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setProvisioned:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation VMAccount

- (VMAccount)init
{
  return 0;
}

- (VMAccount)initWithUUID:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VMAccount;
  v6 = [(VMAccount *)&v8 init];
  if (v6)
  {
    if (!v5) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%s: parameter '%@' cannot be nil", "-[VMAccount initWithUUID:]", @"UUID" format];
    }
    objc_storeStrong((id *)&v6->_UUID, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[VMAccount allocWithZone:](VMAccount, "allocWithZone:") initWithUUID:self->_UUID];
  [(VMAccount *)self copyPropertiesWithZone:a3 toAccount:v5];
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [(VMAccount *)[VMMutableAccount alloc] initWithUUID:self->_UUID];
  [(VMAccount *)self copyPropertiesWithZone:a3 toAccount:v5];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VMAccount;
  id v5 = [(VMAccount *)&v32 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_abbreviatedAccountDescription);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    abbreviatedAccountDescription = v5->_abbreviatedAccountDescription;
    v5->_abbreviatedAccountDescription = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_accountDescription);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    accountDescription = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_handle);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    handle = v5->_handle;
    v5->_handle = (VMHandle *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_isoCountryCode);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v20;

    v22 = NSStringFromSelector(sel_isProvisioned);
    v5->_provisioned = [v4 decodeBoolForKey:v22];

    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector(sel_serviceName);
    uint64_t v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v25;

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_UUID);
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(VMAccount *)self abbreviatedAccountDescription];
  uint64_t v6 = NSStringFromSelector(sel_abbreviatedAccountDescription);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(VMAccount *)self accountDescription];
  uint64_t v8 = NSStringFromSelector(sel_accountDescription);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(VMAccount *)self handle];
  uint64_t v10 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(VMAccount *)self isoCountryCode];
  uint64_t v12 = NSStringFromSelector(sel_isoCountryCode);
  [v4 encodeObject:v11 forKey:v12];

  BOOL v13 = [(VMAccount *)self isProvisioned];
  uint64_t v14 = NSStringFromSelector(sel_isProvisioned);
  [v4 encodeBool:v13 forKey:v14];

  v15 = [(VMAccount *)self serviceName];
  uint64_t v16 = NSStringFromSelector(sel_serviceName);
  [v4 encodeObject:v15 forKey:v16];

  id v18 = [(VMAccount *)self UUID];
  v17 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v18 forKey:v17];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_UUID);
  id v5 = [(VMAccount *)self UUID];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_handle);
  v7 = [(VMAccount *)self handle];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  uint64_t v8 = NSStringFromSelector(sel_isoCountryCode);
  v9 = [(VMAccount *)self isoCountryCode];
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@", "];
  uint64_t v10 = NSStringFromSelector(sel_abbreviatedAccountDescription);
  v11 = [(VMAccount *)self abbreviatedAccountDescription];
  [v3 appendFormat:@"%@=%@", v10, v11];

  [v3 appendFormat:@", "];
  uint64_t v12 = NSStringFromSelector(sel_accountDescription);
  BOOL v13 = [(VMAccount *)self accountDescription];
  [v3 appendFormat:@"%@=%@", v12, v13];

  [v3 appendFormat:@", "];
  uint64_t v14 = NSStringFromSelector(sel_serviceName);
  v15 = [(VMAccount *)self serviceName];
  [v3 appendFormat:@"%@=%@", v14, v15];

  [v3 appendFormat:@", "];
  uint64_t v16 = NSStringFromSelector(sel_isProvisioned);
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[VMAccount isProvisioned](self, "isProvisioned"));
  [v3 appendFormat:@"%@=%@", v16, v17];

  [v3 appendFormat:@">"];
  id v18 = (void *)[v3 copy];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(VMAccount *)self isEqualToAccount:v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(VMAccount *)self abbreviatedAccountDescription];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(VMAccount *)self accountDescription];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(VMAccount *)self isoCountryCode];
  uint64_t v8 = [v7 hash];
  v9 = [(VMAccount *)self handle];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  if ([(VMAccount *)self isProvisioned]) {
    uint64_t v11 = 1231;
  }
  else {
    uint64_t v11 = 1237;
  }
  uint64_t v12 = [(VMAccount *)self serviceName];
  uint64_t v13 = v10 ^ v11 ^ [v12 hash];
  uint64_t v14 = [(VMAccount *)self UUID];
  unint64_t v15 = v13 ^ [v14 hash];

  return v15;
}

- (void)copyPropertiesWithZone:(_NSZone *)a3 toAccount:(id)a4
{
  abbreviatedAccountDescription = self->_abbreviatedAccountDescription;
  v7 = a4;
  uint64_t v8 = [(NSString *)abbreviatedAccountDescription copyWithZone:a3];
  v9 = (void *)v7[4];
  v7[4] = v8;

  uint64_t v10 = [(NSString *)self->_accountDescription copyWithZone:a3];
  uint64_t v11 = (void *)v7[3];
  v7[3] = v10;

  id v12 = [(VMHandle *)self->_handle copyWithZone:a3];
  uint64_t v13 = (void *)v7[5];
  v7[5] = v12;

  uint64_t v14 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  unint64_t v15 = (void *)v7[6];
  v7[6] = v14;

  *((unsigned char *)v7 + 8) = self->_provisioned;
  uint64_t v16 = [(NSString *)self->_serviceName copyWithZone:a3];
  id v17 = (id)v7[7];
  v7[7] = v16;
}

- (BOOL)isEqualToAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VMAccount *)self abbreviatedAccountDescription];
  uint64_t v6 = [v4 abbreviatedAccountDescription];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8)) {
    goto LABEL_4;
  }
  if (!v8)
  {
    char v29 = 0;
    unint64_t v13 = v7;
LABEL_37:

    goto LABEL_38;
  }
  int v10 = [(id)v7 isEqualToString:v8];

  if (v10)
  {
LABEL_4:
    uint64_t v11 = [(VMAccount *)self accountDescription];
    id v12 = [v4 accountDescription];
    unint64_t v13 = v11;
    unint64_t v14 = v12;
    unint64_t v15 = (void *)v14;
    if (v13 | v14)
    {
      if (!v14)
      {
        char v29 = 0;
        unint64_t v19 = v13;
LABEL_35:

        goto LABEL_36;
      }
      int v16 = [(id)v13 isEqualToString:v14];

      if (!v16)
      {
        char v29 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    id v17 = [(VMAccount *)self isoCountryCode];
    id v18 = [v4 isoCountryCode];
    unint64_t v19 = v17;
    unint64_t v20 = v18;
    v21 = (void *)v20;
    if (v19 | v20)
    {
      if (!v20)
      {
        char v29 = 0;
        unint64_t v25 = v19;
LABEL_33:

        goto LABEL_34;
      }
      int v22 = [(id)v19 isEqualToString:v20];

      if (!v22)
      {
        char v29 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    uint64_t v23 = [(VMAccount *)self handle];
    v24 = [v4 handle];
    unint64_t v25 = v23;
    unint64_t v26 = v24;
    uint64_t v27 = (void *)v26;
    unint64_t v47 = v25;
    if (v25 | v26)
    {
      if (!v26)
      {
        char v29 = 0;
        v39 = (void *)v25;
LABEL_31:

        goto LABEL_32;
      }
      int v44 = [(id)v25 isEqual:v26];

      if (!v44)
      {
LABEL_14:
        char v29 = 0;
        unint64_t v25 = v47;
LABEL_32:

        goto LABEL_33;
      }
    }
    int v28 = [(VMAccount *)self isProvisioned];
    if (v28 != [v4 isProvisioned]) {
      goto LABEL_14;
    }
    v30 = [(VMAccount *)self serviceName];
    v45 = [v4 serviceName];
    unint64_t v31 = v30;
    unint64_t v32 = v45;
    v33 = (void *)v32;
    v46 = (void *)v31;
    if (v31 | v32)
    {
      if (!v32)
      {
        v43 = 0;
        char v29 = 0;
        v38 = (void *)v31;
        unint64_t v25 = v47;
LABEL_29:

        v33 = v43;
LABEL_30:

        v39 = v46;
        goto LABEL_31;
      }
      v34 = (void *)v32;
      LODWORD(v41) = [v46 isEqualToString:v32];

      v33 = v34;
      if (!v41)
      {
        char v29 = 0;
        unint64_t v25 = v47;
        goto LABEL_30;
      }
    }
    v43 = v33;
    uint64_t v35 = [(VMAccount *)self UUID];
    uint64_t v36 = [v4 UUID];
    v37 = (void *)v35;
    char v29 = (v35 | v36) == 0;
    v42 = v37;
    if (v36) {
      char v29 = [v37 isEqual:v36];
    }

    unint64_t v25 = v47;
    v38 = v42;
    goto LABEL_29;
  }
  char v29 = 0;
LABEL_38:

  return v29;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08928];
  id v7 = a3;
  unint64_t v8 = [a1 unarchivedObjectClasses];
  v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
}

- (NSString)abbreviatedAccountDescription
{
  return self->_abbreviatedAccountDescription;
}

- (void)setAbbreviatedAccountDescription:(id)a3
{
}

- (VMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (BOOL)isProvisioned
{
  return self->_provisioned;
}

- (void)setProvisioned:(BOOL)a3
{
  self->_provisioned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_abbreviatedAccountDescription, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end