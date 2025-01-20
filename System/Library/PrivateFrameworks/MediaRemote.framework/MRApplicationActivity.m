@interface MRApplicationActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MRApplicationActivity)initWithCoder:(id)a3;
- (MRApplicationActivity)initWithPrimaryAppDisplayID:(id)a3 secondaryAppDisplayID:(id)a4;
- (NSString)primaryApplicationDisplayID;
- (NSString)secondaryApplicationDisplayID;
- (NSUUID)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)creatorProcessID;
- (int)status;
- (uint64_t)_copyWithZone:(Class)a3 usingConcreteClass:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRApplicationActivity

- (MRApplicationActivity)initWithPrimaryAppDisplayID:(id)a3 secondaryAppDisplayID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRApplicationActivity;
  v8 = [(MRApplicationActivity *)&v16 init];
  if (v8)
  {
    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = v9;

    uint64_t v11 = [v6 copy];
    primaryApplicationDisplayID = v8->_primaryApplicationDisplayID;
    v8->_primaryApplicationDisplayID = (NSString *)v11;

    uint64_t v13 = [v7 copy];
    secondaryApplicationDisplayID = v8->_secondaryApplicationDisplayID;
    v8->_secondaryApplicationDisplayID = (NSString *)v13;

    v8->_status = 0;
    v8->_creatorProcessID = getpid();
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 uniqueIdentifier];
    char v6 = [v5 isEqual:self->_uniqueIdentifier];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  unsigned int v3 = self->_status - 1;
  if (v3 > 3) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_1E57DA4C0[v3];
  }
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  id v7 = [(NSUUID *)self->_uniqueIdentifier UUIDString];
  v8 = [v5 stringWithFormat:@"<%@ %p id=%@, primary=%@, secondary=%@, status=%@, creatorPID=%d>", v6, self, v7, self->_primaryApplicationDisplayID, self->_secondaryApplicationDisplayID, v4, self->_creatorProcessID];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    [v4 encodeObject:self->_uniqueIdentifier forKey:@"uniqueIdentifier"];
    [v4 encodeObject:self->_primaryApplicationDisplayID forKey:@"primaryApplicationDisplayID"];
    [v4 encodeObject:self->_secondaryApplicationDisplayID forKey:@"secondaryApplicationDisplayID"];
    [v4 encodeInt32:self->_status forKey:@"status"];
    [v4 encodeInt:self->_creatorProcessID forKey:@"creatorProcessID"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"coder must support key-value coding"];
  }
}

- (MRApplicationActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRApplicationActivity;
  v5 = [(MRApplicationActivity *)&v16 init];
  if (v5)
  {
    if ([v4 allowsKeyedCoding])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
      uint64_t v7 = [v6 copy];
      uniqueIdentifier = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSUUID *)v7;

      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryApplicationDisplayID"];
      uint64_t v10 = [v9 copy];
      primaryApplicationDisplayID = v5->_primaryApplicationDisplayID;
      v5->_primaryApplicationDisplayID = (NSString *)v10;

      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryApplicationDisplayID"];
      uint64_t v13 = [v12 copy];
      secondaryApplicationDisplayID = v5->_secondaryApplicationDisplayID;
      v5->_secondaryApplicationDisplayID = (NSString *)v13;

      v5->_status = [v4 decodeInt32ForKey:@"status"];
      v5->_creatorProcessID = [v4 decodeIntForKey:@"creatorProcessID"];
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"coder must support key-value coding"];
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (objc_class *)objc_opt_class();

  return (id)-[MRApplicationActivity _copyWithZone:usingConcreteClass:]((uint64_t)self, v4, v5);
}

- (uint64_t)_copyWithZone:(Class)a3 usingConcreteClass:
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [[a3 alloc] initWithPrimaryAppDisplayID:*(void *)(a1 + 16) secondaryAppDisplayID:*(void *)(a1 + 24)];
  uint64_t v5 = [*(id *)(a1 + 8) copy];
  uint64_t v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  *(_DWORD *)(v4 + 36) = *(_DWORD *)(a1 + 36);
  *(_DWORD *)(v4 + 32) = *(_DWORD *)(a1 + 32);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  return (id)-[MRApplicationActivity _copyWithZone:usingConcreteClass:]((uint64_t)self, v4, v5);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)primaryApplicationDisplayID
{
  return self->_primaryApplicationDisplayID;
}

- (NSString)secondaryApplicationDisplayID
{
  return self->_secondaryApplicationDisplayID;
}

- (int)status
{
  return self->_status;
}

- (int)creatorProcessID
{
  return self->_creatorProcessID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryApplicationDisplayID, 0);
  objc_storeStrong((id *)&self->_primaryApplicationDisplayID, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end