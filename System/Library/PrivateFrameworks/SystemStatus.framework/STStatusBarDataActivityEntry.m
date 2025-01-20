@interface STStatusBarDataActivityEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (STStatusBarDataActivityEntry)entryWithType:(int64_t)a3 displayID:(id)a4;
- (NSString)displayId;
- (STStatusBarDataActivityEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataActivityEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataActivityEntry

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STStatusBarDataActivityEntry;
  v5 = [(STStatusBarDataEntry *)&v18 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataActivityEntry *)self type];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke;
  v16[3] = &unk_1E6B63D88;
  id v8 = v6;
  id v17 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v16];
  v10 = [(STStatusBarDataActivityEntry *)self displayId];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke_2;
  v14[3] = &unk_1E6B630A8;
  id v15 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendString:v10 counterpart:v14];

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)displayId
{
  return self->_displayId;
}

- (void).cxx_destruct
{
}

+ (STStatusBarDataActivityEntry)entryWithType:(int64_t)a3 displayID:(id)a4
{
  id v6 = a4;
  int64_t v7 = objc_alloc_init((Class)a1);
  v7[2] = a3;
  uint64_t v8 = [v6 copy];

  id v9 = (void *)v7[3];
  v7[3] = v8;

  return (STStatusBarDataActivityEntry *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataActivityEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_displayId forKey:@"displayId"];
}

- (STStatusBarDataActivityEntry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataActivityEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v8 initWithCoder:v3];
  v4->_type = objc_msgSend(v3, "decodeIntegerForKey:", @"type", v8.receiver, v8.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayId"];

  displayId = v4->_displayId;
  v4->_displayId = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataActivityEntry;
  id v3 = [(STStatusBarDataEntry *)&v8 succinctDescriptionBuilder];
  unint64_t v4 = [(STStatusBarDataActivityEntry *)self type];
  if (v4 > 2) {
    uint64_t v5 = @"(unknown)";
  }
  else {
    uint64_t v5 = off_1E6B63EE8[v4];
  }
  [v3 appendString:v5 withName:@"type"];
  id v6 = [(STStatusBarDataActivityEntry *)self displayId];
  [v3 appendString:v6 withName:@"displayId" skipIfEmpty:1];

  return v3;
}

uint64_t __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

uint64_t __57__STStatusBarDataActivityEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayId];
}

- (id)_hashBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataActivityEntry;
  id v3 = [(STStatusBarDataEntry *)&v8 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataActivityEntry type](self, "type"));
  uint64_t v5 = [(STStatusBarDataActivityEntry *)self displayId];
  id v6 = (id)[v3 appendString:v5];

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataActivityEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_displayId forKey:@"displayId"];
}

- (STStatusBarDataActivityEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataActivityEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeInt64ForKey:@"type"];
    uint64_t v6 = [v4 decodeStringForKey:@"displayId"];
    displayId = v5->_displayId;
    v5->_displayId = (NSString *)v6;
  }
  return v5;
}

@end