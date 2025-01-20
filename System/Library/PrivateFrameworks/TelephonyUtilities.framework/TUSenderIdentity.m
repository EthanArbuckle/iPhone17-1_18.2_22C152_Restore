@interface TUSenderIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSenderIdentity:(id)a3;
- (NSString)ISOCountryCode;
- (NSString)localizedName;
- (NSString)localizedServiceName;
- (NSString)localizedShortName;
- (NSUUID)UUID;
- (NSUUID)accountUUID;
- (TUHandle)handle;
- (TUSenderIdentity)initWithCoder:(id)a3;
- (TUSenderIdentity)initWithSenderIdentity:(id)a3;
- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 ISOCountryCode:(id)a5 localizedName:(id)a6 localizedShortName:(id)a7 localizedServiceName:(id)a8 handle:(id)a9;
- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 localizedName:(id)a5 localizedShortName:(id)a6 handle:(id)a7;
- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 localizedName:(id)a5 localizedShortName:(id)a6 localizedServiceName:(id)a7 handle:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUSenderIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUSenderIdentity *)self UUID];
  v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUSenderIdentity *)self accountUUID];
  v8 = NSStringFromSelector(sel_accountUUID);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(TUSenderIdentity *)self handle];
  v10 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(TUSenderIdentity *)self ISOCountryCode];
  v12 = NSStringFromSelector(sel_ISOCountryCode);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(TUSenderIdentity *)self localizedName];
  v14 = NSStringFromSelector(sel_localizedName);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(TUSenderIdentity *)self localizedShortName];
  v16 = NSStringFromSelector(sel_localizedShortName);
  [v4 encodeObject:v15 forKey:v16];

  id v18 = [(TUSenderIdentity *)self localizedServiceName];
  v17 = NSStringFromSelector(sel_localizedServiceName);
  [v4 encodeObject:v18 forKey:v17];
}

- (unint64_t)hash
{
  v3 = [(TUSenderIdentity *)self UUID];
  uint64_t v4 = [v3 hash];
  v5 = [(TUSenderIdentity *)self accountUUID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(TUSenderIdentity *)self handle];
  uint64_t v8 = [v7 hash];
  v9 = [(TUSenderIdentity *)self ISOCountryCode];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(TUSenderIdentity *)self localizedName];
  uint64_t v12 = [v11 hash];
  v13 = [(TUSenderIdentity *)self localizedShortName];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(TUSenderIdentity *)self localizedServiceName];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (NSString)localizedServiceName
{
  return self->_localizedServiceName;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSUUID)accountUUID
{
  return self->_accountUUID;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)ISOCountryCode
{
  return self->_ISOCountryCode;
}

- (TUSenderIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TUSenderIdentity;
  v5 = [(TUSenderIdentity *)&v35 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_accountUUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    accountUUID = v5->_accountUUID;
    v5->_accountUUID = (NSUUID *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_handle);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_ISOCountryCode);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    ISOCountryCode = v5->_ISOCountryCode;
    v5->_ISOCountryCode = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_localizedName);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_localizedShortName);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    localizedShortName = v5->_localizedShortName;
    v5->_localizedShortName = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_localizedServiceName);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    localizedServiceName = v5->_localizedServiceName;
    v5->_localizedServiceName = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector(sel_UUID);
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v32;
  }
  return v5;
}

- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 localizedName:(id)a5 localizedShortName:(id)a6 handle:(id)a7
{
  return [(TUSenderIdentity *)self initWithUUID:a3 accountUUID:a4 localizedName:a5 localizedShortName:a6 localizedServiceName:&stru_1EECEA668 handle:a7];
}

- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 localizedName:(id)a5 localizedShortName:(id)a6 localizedServiceName:(id)a7 handle:(id)a8
{
  return [(TUSenderIdentity *)self initWithUUID:a3 accountUUID:a4 ISOCountryCode:@"xw" localizedName:a5 localizedShortName:a6 localizedServiceName:a7 handle:a8];
}

- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 ISOCountryCode:(id)a5 localizedName:(id)a6 localizedShortName:(id)a7 localizedServiceName:(id)a8 handle:(id)a9
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v34 = a9;
  id v22 = a9;
  v35.receiver = self;
  v35.super_class = (Class)TUSenderIdentity;
  v23 = [(TUSenderIdentity *)&v35 init];
  if (v23)
  {
    if (v16)
    {
      if (v17) {
        goto LABEL_4;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", @"UUID", obj, a9 format];
      if (v17)
      {
LABEL_4:
        if (v18) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", @"accountUUID" format];
    if (v18)
    {
LABEL_5:
      if (v19) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
LABEL_12:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", @"ISOCountryCode" format];
    if (v19)
    {
LABEL_6:
      if (v20) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
LABEL_13:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", @"localizedName" format];
    if (v20)
    {
LABEL_7:
      if (v21)
      {
LABEL_8:
        objc_storeStrong((id *)&v23->_UUID, a3);
        objc_storeStrong((id *)&v23->_accountUUID, obj);
        uint64_t v24 = [v18 copy];
        ISOCountryCode = v23->_ISOCountryCode;
        v23->_ISOCountryCode = (NSString *)v24;

        uint64_t v26 = [v19 copy];
        localizedName = v23->_localizedName;
        v23->_localizedName = (NSString *)v26;

        uint64_t v28 = [v20 copy];
        localizedShortName = v23->_localizedShortName;
        v23->_localizedShortName = (NSString *)v28;

        uint64_t v30 = [v21 copy];
        localizedServiceName = v23->_localizedServiceName;
        v23->_localizedServiceName = (NSString *)v30;

        objc_storeStrong((id *)&v23->_handle, v34);
        goto LABEL_9;
      }
LABEL_15:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", @"localizedServiceName" format];
      goto LABEL_8;
    }
LABEL_14:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", @"localizedShortName" format];
    if (v21) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_9:

  return v23;
}

- (TUSenderIdentity)initWithSenderIdentity:(id)a3
{
  id v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TUSenderIdentity;
  v5 = [(TUSenderIdentity *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_accountUUID, v4[2]);
    objc_storeStrong((id *)&v6->_handle, v4[3]);
    objc_storeStrong((id *)&v6->_ISOCountryCode, v4[4]);
    objc_storeStrong((id *)&v6->_localizedName, v4[5]);
    objc_storeStrong((id *)&v6->_localizedShortName, v4[6]);
    objc_storeStrong((id *)&v6->_localizedServiceName, v4[7]);
    objc_storeStrong((id *)&v6->_UUID, v4[1]);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUSenderIdentity allocWithZone:a3];

  return [(TUSenderIdentity *)v4 initWithSenderIdentity:self];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_UUID);
  v5 = [(TUSenderIdentity *)self UUID];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_accountUUID);
  v7 = [(TUSenderIdentity *)self accountUUID];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  objc_super v8 = NSStringFromSelector(sel_ISOCountryCode);
  v9 = [(TUSenderIdentity *)self ISOCountryCode];
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@", "];
  uint64_t v10 = NSStringFromSelector(sel_localizedName);
  v11 = [(TUSenderIdentity *)self localizedName];
  [v3 appendFormat:@"%@=%@", v10, v11];

  [v3 appendFormat:@", "];
  uint64_t v12 = NSStringFromSelector(sel_localizedShortName);
  v13 = [(TUSenderIdentity *)self localizedShortName];
  [v3 appendFormat:@"%@=%@", v12, v13];

  [v3 appendFormat:@", "];
  uint64_t v14 = NSStringFromSelector(sel_localizedServiceName);
  v15 = [(TUSenderIdentity *)self localizedServiceName];
  [v3 appendFormat:@"%@=%@", v14, v15];

  [v3 appendFormat:@", "];
  id v16 = NSStringFromSelector(sel_handle);
  id v17 = [(TUSenderIdentity *)self handle];
  [v3 appendFormat:@"%@=%@", v16, v17];

  [v3 appendFormat:@">"];
  id v18 = (void *)[v3 copy];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUSenderIdentity *)self isEqualToSenderIdentity:v4];

  return v5;
}

- (BOOL)isEqualToSenderIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUSenderIdentity *)self UUID];
  uint64_t v6 = [v4 UUID];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUSenderIdentity *)self accountUUID];
    objc_super v8 = [v4 accountUUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(TUSenderIdentity *)self handle];
      uint64_t v10 = [v4 handle];
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        v11 = [(TUSenderIdentity *)self ISOCountryCode];
        uint64_t v12 = [v4 ISOCountryCode];
        if ([v11 isEqualToString:v12])
        {
          v23 = v11;
          v13 = [(TUSenderIdentity *)self localizedName];
          [v4 localizedName];
          id v22 = v24 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            uint64_t v14 = [(TUSenderIdentity *)self localizedShortName];
            id v20 = [v4 localizedShortName];
            id v21 = v14;
            int v15 = objc_msgSend(v14, "isEqualToString:");
            v11 = v23;
            if (v15)
            {
              id v19 = [(TUSenderIdentity *)self localizedServiceName];
              id v18 = [v4 localizedServiceName];
              char v16 = [v19 isEqualToString:v18];
            }
            else
            {
              char v16 = 0;
            }
          }
          else
          {
            char v16 = 0;
            v11 = v23;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedServiceName, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_accountUUID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end