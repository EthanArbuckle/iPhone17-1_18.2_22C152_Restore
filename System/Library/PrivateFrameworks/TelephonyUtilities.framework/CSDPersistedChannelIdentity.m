@interface CSDPersistedChannelIdentity
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersistedChannelIdentity:(id)a3;
- (CSDPersistedChannelIdentity)initWithApplicationIdentifier:(id)a3 bundleIdentifier:(id)a4 channelUUID:(id)a5;
- (CSDPersistedChannelIdentity)initWithCoder:(id)a3;
- (CSDPersistedChannelIdentity)initWithPersistedChannelIdentity:(id)a3;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSUUID)channelUUID;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSDPersistedChannelIdentity

- (CSDPersistedChannelIdentity)initWithApplicationIdentifier:(id)a3 bundleIdentifier:(id)a4 channelUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSDPersistedChannelIdentity;
  v11 = [(CSDPersistedChannelIdentity *)&v17 init];
  if (v11)
  {
    if (v8)
    {
      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%s: parameter '%@' cannot be nil", "-[CSDPersistedChannelIdentity initWithApplicationIdentifier:bundleIdentifier:channelUUID:]", @"applicationIdentifier");
      if (v9)
      {
LABEL_4:
        if (v10)
        {
LABEL_5:
          v12 = (NSString *)[v8 copy];
          applicationIdentifier = v11->_applicationIdentifier;
          v11->_applicationIdentifier = v12;

          v14 = (NSString *)[v9 copy];
          bundleIdentifier = v11->_bundleIdentifier;
          v11->_bundleIdentifier = v14;

          objc_storeStrong((id *)&v11->_channelUUID, a5);
          goto LABEL_6;
        }
LABEL_9:
        +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%s: parameter '%@' cannot be nil", "-[CSDPersistedChannelIdentity initWithApplicationIdentifier:bundleIdentifier:channelUUID:]", @"channelUUID");
        goto LABEL_5;
      }
    }
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%s: parameter '%@' cannot be nil", "-[CSDPersistedChannelIdentity initWithApplicationIdentifier:bundleIdentifier:channelUUID:]", @"bundleIdentifier");
    if (v10) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v11;
}

- (CSDPersistedChannelIdentity)initWithPersistedChannelIdentity:(id)a3
{
  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDPersistedChannelIdentity;
  v5 = [(CSDPersistedChannelIdentity *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_applicationIdentifier, v4[1]);
    objc_storeStrong((id *)&v6->_bundleIdentifier, v4[2]);
    objc_storeStrong((id *)&v6->_channelUUID, v4[3]);
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v5 = a3;
  v6 = NSStringFromSelector("applicationIdentifier");
  [v5 encodeObject:applicationIdentifier forKey:v6];

  bundleIdentifier = self->_bundleIdentifier;
  objc_super v8 = NSStringFromSelector("bundleIdentifier");
  [v5 encodeObject:bundleIdentifier forKey:v8];

  channelUUID = self->_channelUUID;
  NSStringFromSelector("channelUUID");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:channelUUID forKey:v10];
}

- (CSDPersistedChannelIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSDPersistedChannelIdentity;
  id v5 = [(CSDPersistedChannelIdentity *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("applicationIdentifier");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector("bundleIdentifier");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector("channelUUID");
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    channelUUID = v5->_channelUUID;
    v5->_channelUUID = (NSUUID *)v16;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CSDPersistedChannelIdentity allocWithZone:a3];

  return [(CSDPersistedChannelIdentity *)v4 initWithPersistedChannelIdentity:self];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_applicationIdentifier hash];
  unint64_t v4 = [(NSString *)self->_bundleIdentifier hash] ^ v3;
  return v4 ^ (unint64_t)[(NSUUID *)self->_channelUUID hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CSDPersistedChannelIdentity *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(CSDPersistedChannelIdentity *)self isEqualToPersistedChannelIdentity:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToPersistedChannelIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 applicationIdentifier];
  if (TUObjectsAreEqualOrNil())
  {
    uint64_t v6 = [v4 bundleIdentifier];
    if (TUObjectsAreEqualOrNil())
    {
      channelUUID = self->_channelUUID;
      uint64_t v8 = [v4 channelUUID];
      unsigned __int8 v9 = [(NSUUID *)channelUUID isEqual:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 unarchivedObjectClasses];
  uint64_t v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v6 error:a4];

  return v8;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSUUID)channelUUID
{
  return self->_channelUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelUUID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end