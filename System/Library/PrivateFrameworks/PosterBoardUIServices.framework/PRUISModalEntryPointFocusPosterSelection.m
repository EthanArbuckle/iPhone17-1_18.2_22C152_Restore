@interface PRUISModalEntryPointFocusPosterSelection
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)activityIdentifier;
- (NSUUID)activityUUID;
- (PRUISModalEntryPointFocusPosterSelection)initWithActivityUUID:(id)a3 activityIdentifier:(id)a4;
- (PRUISModalEntryPointFocusPosterSelection)initWithBSXPCCoder:(id)a3;
- (id)_BSXPCSecureCodingEntryPointTypeString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRUISModalEntryPointFocusPosterSelection

- (PRUISModalEntryPointFocusPosterSelection)initWithActivityUUID:(id)a3 activityIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRUISModalEntryPointFocusPosterSelection;
  v9 = [(PRUISModalEntryPointFocusPosterSelection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityUUID, a3);
    uint64_t v11 = [v8 copy];
    activityIdentifier = v10->_activityIdentifier;
    v10->_activityIdentifier = (NSString *)v11;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  activityUUID = self->_activityUUID;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke;
  v19[3] = &unk_26546B108;
  id v8 = v6;
  id v20 = v8;
  id v9 = (id)[v5 appendObject:activityUUID counterpart:v19];
  activityIdentifier = self->_activityIdentifier;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke_2;
  v17 = &unk_26546BE78;
  id v18 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendObject:activityIdentifier counterpart:&v14];
  LOBYTE(activityIdentifier) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)activityIdentifier;
}

uint64_t __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityUUID];
}

uint64_t __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityIdentifier];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_activityUUID];
  id v5 = (id)[v3 appendObject:self->_activityIdentifier];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  activityUUID = self->_activityUUID;
  activityIdentifier = self->_activityIdentifier;

  return (id)[v4 initWithActivityUUID:activityUUID activityIdentifier:activityIdentifier];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointFocusPosterSelection)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityUUID"];
  if (v5)
  {
    unint64_t v6 = [v4 decodeStringForKey:@"activityIdentifier"];
    if (v6)
    {
      self = [(PRUISModalEntryPointFocusPosterSelection *)self initWithActivityUUID:v5 activityIdentifier:v6];
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  activityUUID = self->_activityUUID;
  id v5 = a3;
  [v5 encodeObject:activityUUID forKey:@"activityUUID"];
  [v5 encodeObject:self->_activityIdentifier forKey:@"activityIdentifier"];
}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return @"FocusPosterSelection";
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);

  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end