@interface NRDDeviceIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDDeviceIdentity)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRDDeviceIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (id *)v4;
    if (self) {
      identity = self->_identity;
    }
    else {
      identity = 0;
    }
    v7 = identity;
    id v8 = v5[1];
    if ([(NSUUID *)v7 isEqual:v8])
    {
      if (self) {
        publicKey = self->_publicKey;
      }
      else {
        publicKey = 0;
      }
      id v10 = v5[2];
      v11 = publicKey;
      unsigned __int8 v12 = [(NSData *)v11 isEqualToData:v10];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_identity forKey:@"identity"];
    publicKey = self->_publicKey;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"identity"];
    publicKey = 0;
  }
  [a3 encodeObject:publicKey forKey:@"publicKey"];
}

- (NRDDeviceIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NRDDeviceIdentity;
  v5 = [(NRDDeviceIdentity *)&v23 init];
  if (!v5)
  {
    id v13 = sub_100135DDC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v15 = sub_100135DDC();
      _NRLogWithArgs();
    }
    id v4 = (id)_os_log_pack_size();
    v6 = (NRDDeviceIdentity *)((char *)&v22 - (((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    __error();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "-[NRDDeviceIdentity initWithCoder:]";
    sub_100135DDC();
    _NRLogAbortWithPack();
LABEL_9:
    id v17 = sub_100135DDC();
    int v18 = _NRLogIsLevelEnabled();

    if (v18)
    {
      id v19 = sub_100135DDC();
LABEL_13:
      _NRLogWithArgs();
    }
LABEL_14:
    v11 = 0;
    goto LABEL_5;
  }
  v6 = v5;
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
  identity = v6->_identity;
  v6->_identity = (NSUUID *)v7;

  if (!v6->_identity) {
    goto LABEL_9;
  }
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
  publicKey = v6->_publicKey;
  v6->_publicKey = (NSData *)v9;

  if (!v6->_publicKey)
  {
    id v20 = sub_100135DDC();
    int v21 = _NRLogIsLevelEnabled();

    if (v21)
    {
      id v19 = sub_100135DDC();
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v11 = v6;
LABEL_5:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[NRDDeviceIdentity allocWithZone:](NRDDeviceIdentity, "allocWithZone:") init];
  if (self) {
    identity = self->_identity;
  }
  else {
    identity = 0;
  }
  uint64_t v7 = identity;
  id v8 = [(NSUUID *)v7 copyWithZone:a3];
  if (v5) {
    objc_storeStrong((id *)&v5->_identity, v8);
  }

  if (self) {
    publicKey = self->_publicKey;
  }
  else {
    publicKey = 0;
  }
  id v10 = publicKey;
  id v11 = [(NSData *)v10 copyWithZone:a3];
  if (v5) {
    objc_storeStrong((id *)&v5->_publicKey, v11);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end