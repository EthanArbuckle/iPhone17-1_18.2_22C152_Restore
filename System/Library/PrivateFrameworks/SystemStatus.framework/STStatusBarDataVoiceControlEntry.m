@interface STStatusBarDataVoiceControlEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithType:(int64_t)a3;
- (STStatusBarDataVoiceControlEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataVoiceControlEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataVoiceControlEntry

+ (id)entryWithType:(int64_t)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataVoiceControlEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (STStatusBarDataVoiceControlEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataVoiceControlEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"type", v7.receiver, v7.super_class);

  v4->_type = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataVoiceControlEntry;
  id v3 = [(STStatusBarDataEntry *)&v7 succinctDescriptionBuilder];
  unint64_t v4 = [(STStatusBarDataVoiceControlEntry *)self type];
  if (v4 > 2) {
    uint64_t v5 = @"(unknown)";
  }
  else {
    uint64_t v5 = off_1E6B63F18[v4];
  }
  [v3 appendString:v5 withName:@"type"];

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataVoiceControlEntry;
  uint64_t v5 = [(STStatusBarDataEntry *)&v13 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataVoiceControlEntry *)self type];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__STStatusBarDataVoiceControlEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E6B63D88;
  id v12 = v6;
  id v8 = v6;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v11];

  return v5;
}

uint64_t __61__STStatusBarDataVoiceControlEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

- (id)_hashBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataVoiceControlEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataVoiceControlEntry type](self, "type"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataVoiceControlEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (STStatusBarDataVoiceControlEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataVoiceControlEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5) {
    v5->_type = [v4 decodeInt64ForKey:@"type"];
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end