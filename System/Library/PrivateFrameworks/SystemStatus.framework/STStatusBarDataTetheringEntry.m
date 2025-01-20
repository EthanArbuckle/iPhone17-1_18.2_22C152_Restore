@interface STStatusBarDataTetheringEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (STStatusBarDataTetheringEntry)entryWithConnectionCount:(int64_t)a3;
- (STStatusBarDataTetheringEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataTetheringEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)connectionCount;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataTetheringEntry

+ (STStatusBarDataTetheringEntry)entryWithConnectionCount:(int64_t)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;

  return (STStatusBarDataTetheringEntry *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataTetheringEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_connectionCount, @"connectionCount", v5.receiver, v5.super_class);
}

- (STStatusBarDataTetheringEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataTetheringEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"connectionCount", v7.receiver, v7.super_class);

  v4->_connectionCount = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataTetheringEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 succinctDescriptionBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataTetheringEntry connectionCount](self, "connectionCount"), @"connectionCount");

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataTetheringEntry;
  uint64_t v5 = [(STStatusBarDataEntry *)&v13 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataTetheringEntry *)self connectionCount];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataTetheringEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E6B63D88;
  id v12 = v6;
  id v8 = v6;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v11];

  return v5;
}

uint64_t __58__STStatusBarDataTetheringEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionCount];
}

- (id)_hashBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataTetheringEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataTetheringEntry connectionCount](self, "connectionCount"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataTetheringEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_connectionCount, @"connectionCount", v5.receiver, v5.super_class);
}

- (STStatusBarDataTetheringEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataTetheringEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5) {
    v5->_connectionCount = [v4 decodeInt64ForKey:@"connectionCount"];
  }

  return v5;
}

- (int64_t)connectionCount
{
  return self->_connectionCount;
}

@end