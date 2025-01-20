@interface STStatusBarDataIntegerEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithRawValue:(int64_t)a3 displayValue:(int64_t)a4 displayRawValue:(BOOL)a5;
- (BOOL)displayRawValue;
- (STStatusBarDataIntegerEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataIntegerEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)displayValue;
- (int64_t)rawValue;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataIntegerEntry

+ (id)entryWithRawValue:(int64_t)a3 displayValue:(int64_t)a4 displayRawValue:(BOOL)a5
{
  v8 = objc_alloc_init((Class)a1);
  v8[2] = a3;
  v8[3] = a4;
  *((unsigned char *)v8 + 9) = a5;

  return v8;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STStatusBarDataIntegerEntry;
  v5 = [(STStatusBarDataEntry *)&v23 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataIntegerEntry *)self rawValue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke;
  v21[3] = &unk_1E6B63D88;
  id v8 = v6;
  id v22 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v21];
  int64_t v10 = [(STStatusBarDataIntegerEntry *)self displayValue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_2;
  v19[3] = &unk_1E6B63D88;
  id v11 = v8;
  id v20 = v11;
  id v12 = (id)[v5 appendInteger:v10 counterpart:v19];
  BOOL v13 = [(STStatusBarDataIntegerEntry *)self displayRawValue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_3;
  v17[3] = &unk_1E6B630D0;
  id v18 = v11;
  id v14 = v11;
  id v15 = (id)[v5 appendBool:v13 counterpart:v17];

  return v5;
}

- (int64_t)displayValue
{
  return self->_rawValue;
}

- (int64_t)rawValue
{
  return *(void *)&self->_displayRawValue;
}

- (BOOL)displayRawValue
{
  return *(&self->super._enabled + 1);
}

uint64_t __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayRawValue];
}

uint64_t __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayValue];
}

uint64_t __56__STStatusBarDataIntegerEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rawValue];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataIntegerEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_displayRawValue, @"rawValue", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_rawValue forKey:@"displayValue"];
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"displayRawValue"];
}

- (STStatusBarDataIntegerEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataIntegerEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v7 initWithCoder:v3];
  *(void *)&v4->_displayRawValue = objc_msgSend(v3, "decodeIntegerForKey:", @"rawValue", v7.receiver, v7.super_class);
  v4->_rawValue = [v3 decodeIntegerForKey:@"displayValue"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"displayRawValue"];

  *(&v4->super._enabled + 1) = v5 != 0;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataIntegerEntry;
  id v3 = [(STStatusBarDataEntry *)&v8 succinctDescriptionBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataIntegerEntry rawValue](self, "rawValue"), @"rawValue");
  id v5 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataIntegerEntry displayValue](self, "displayValue"), @"displayValue");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataIntegerEntry displayRawValue](self, "displayRawValue"), @"displayRawValue");

  return v3;
}

- (id)_hashBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataIntegerEntry;
  id v3 = [(STStatusBarDataEntry *)&v8 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataIntegerEntry rawValue](self, "rawValue"));
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataIntegerEntry displayValue](self, "displayValue"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataIntegerEntry displayRawValue](self, "displayRawValue"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataIntegerEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)&self->_displayRawValue, @"rawValue", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_rawValue forKey:@"displayValue"];
  [v4 encodeBool:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"displayRawValue"];
}

- (STStatusBarDataIntegerEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataIntegerEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5)
  {
    *(void *)&v5->_displayRawValue = [v4 decodeInt64ForKey:@"rawValue"];
    v5->_rawValue = [v4 decodeInt64ForKey:@"displayValue"];
    *(&v5->super._enabled + 1) = [v4 decodeBoolForKey:@"displayRawValue"];
  }

  return v5;
}

@end