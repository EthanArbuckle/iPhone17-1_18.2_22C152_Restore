@interface MIAppReference
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateAppReference:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (MIAppIdentity)identity;
- (MIAppReference)initWithCoder:(id)a3;
- (MIAppReference)initWithReferenceUUID:(id)a3 identity:(id)a4 domain:(unint64_t)a5 uid:(unsigned int)a6;
- (NSUUID)referenceUUID;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (unsigned)uid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MIAppReference

- (MIAppReference)initWithReferenceUUID:(id)a3 identity:(id)a4 domain:(unint64_t)a5 uid:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MIAppReference;
  v13 = [(MIAppReference *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_referenceUUID, a3);
    objc_storeStrong((id *)&v14->_identity, a4);
    v14->_domain = a5;
    v14->_uid = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIAppReference;
  v5 = [(MIAppReference *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceUUID"];
    referenceUUID = v5->_referenceUUID;
    v5->_referenceUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    identity = v5->_identity;
    v5->_identity = (MIAppIdentity *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    v5->_domain = [v10 unsignedIntegerValue];

    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uid"];
    v5->_uid = [v11 unsignedIntValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIAppReference *)self referenceUUID];
  [v4 encodeObject:v5 forKey:@"referenceUUID"];

  uint64_t v6 = [(MIAppReference *)self identity];
  [v4 encodeObject:v6 forKey:@"identity"];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[MIAppReference domain](self, "domain"));
  [v4 encodeObject:v7 forKey:@"domain"];

  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[MIAppReference uid](self, "uid"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"uid"];
}

- (unint64_t)hash
{
  v3 = [(MIAppReference *)self referenceUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(MIAppReference *)self identity];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(MIAppReference *)self domain];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MIAppReference *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MIAppReference *)self referenceUUID];
      unint64_t v7 = [(MIAppReference *)v5 referenceUUID];
      BOOL v8 = MICompareObjects(v6, v7);

      if (!v8) {
        goto LABEL_9;
      }
      v9 = [(MIAppReference *)self identity];
      v10 = [(MIAppReference *)v5 identity];
      BOOL v11 = MICompareObjects(v9, v10);

      if (!v11) {
        goto LABEL_9;
      }
      unint64_t v12 = [(MIAppReference *)self domain];
      if (v12 == [(MIAppReference *)v5 domain])
      {
        unsigned int v13 = [(MIAppReference *)self uid];
        BOOL v14 = v13 == [(MIAppReference *)v5 uid];
      }
      else
      {
LABEL_9:
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(MIAppReference *)self referenceUUID];
  v5 = [(MIAppReference *)self identity];
  uint64_t v6 = [v3 stringWithFormat:@"[uuid:%@ identity:%@ domain:%lu uid:%u]", v4, v5, -[MIAppReference domain](self, "domain"), -[MIAppReference uid](self, "uid")];

  return v6;
}

+ (BOOL)validateAppReference:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  unint64_t v7 = v5;
  if (!v5)
  {
    unint64_t v12 = (void *)*MEMORY[0x1E4F6F548];
    unsigned int v13 = @"app reference is nil";
    uint64_t v14 = 112;
LABEL_8:
    _CreateError((uint64_t)"+[MIAppReference validateAppReference:withError:]", v14, v12, 25, 0, 0, v13, v6, v16);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [v5 identity];

  if (!v8)
  {
    _CreateError((uint64_t)"+[MIAppReference validateAppReference:withError:]", 117, (void *)*MEMORY[0x1E4F6F548], 25, 0, 0, @"app reference has nil app identity", v9, v16);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (![v7 domain])
  {
    unint64_t v12 = (void *)*MEMORY[0x1E4F6F548];
    unsigned int v13 = @"app reference has unknown domain";
    uint64_t v14 = 122;
    goto LABEL_8;
  }
  uint64_t v8 = MEMORY[0x1E4F6F5A8];
  v10 = [v7 identity];
  id v17 = 0;
  LOBYTE(v8) = [(id)v8 validateAppIdentity:v10 withError:&v17];
  id v11 = v17;

LABEL_9:
  if (a4 && (v8 & 1) == 0) {
    *a4 = v11;
  }

  return v8;
}

- (NSUUID)referenceUUID
{
  return self->_referenceUUID;
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_referenceUUID, 0);
}

@end