@interface STStatusBarDataThermalEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (STStatusBarDataThermalEntry)entryWithColor:(int64_t)a3 isSunlightMode:(BOOL)a4;
- (BOOL)sunlightMode;
- (STStatusBarDataThermalEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataThermalEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)color;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataThermalEntry

+ (STStatusBarDataThermalEntry)entryWithColor:(int64_t)a3 isSunlightMode:(BOOL)a4
{
  v6 = objc_alloc_init((Class)a1);
  v6[2] = a3;
  *((unsigned char *)v6 + 9) = a4;

  return (STStatusBarDataThermalEntry *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataThermalEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_sunlightMode, @"color", v5.receiver, v5.super_class);
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"sunlightMode"];
}

- (STStatusBarDataThermalEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataThermalEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v7 initWithCoder:v3];
  *(void *)&v4->_sunlightMode = objc_msgSend(v3, "decodeIntegerForKey:", @"color", v7.receiver, v7.super_class);
  uint64_t v5 = [v3 decodeIntegerForKey:@"sunlightMode"];

  *(&v4->super._enabled + 1) = v5 != 0;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataThermalEntry;
  id v3 = [(STStatusBarDataEntry *)&v8 succinctDescriptionBuilder];
  unint64_t v4 = [(STStatusBarDataThermalEntry *)self color];
  if (v4 > 5) {
    uint64_t v5 = @"(unknown)";
  }
  else {
    uint64_t v5 = off_1E6B63EB8[v4];
  }
  [v3 appendString:v5 withName:@"color"];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataThermalEntry sunlightMode](self, "sunlightMode"), @"sunlightMode");

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STStatusBarDataThermalEntry;
  uint64_t v5 = [(STStatusBarDataEntry *)&v18 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataThermalEntry *)self color];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke;
  v16[3] = &unk_1E6B63D88;
  id v8 = v6;
  id v17 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v16];
  BOOL v10 = [(STStatusBarDataThermalEntry *)self sunlightMode];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke_2;
  v14[3] = &unk_1E6B630D0;
  id v15 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendBool:v10 counterpart:v14];

  return v5;
}

uint64_t __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) color];
}

uint64_t __56__STStatusBarDataThermalEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sunlightMode];
}

- (id)_hashBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataThermalEntry;
  id v3 = [(STStatusBarDataEntry *)&v7 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataThermalEntry color](self, "color"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataThermalEntry sunlightMode](self, "sunlightMode"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataThermalEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)&self->_sunlightMode, @"color", v5.receiver, v5.super_class);
  [v4 encodeInt64:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"sunlightMode"];
}

- (STStatusBarDataThermalEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataThermalEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5)
  {
    *(void *)&v5->_sunlightMode = [v4 decodeInt64ForKey:@"color"];
    *(&v5->super._enabled + 1) = [v4 decodeInt64ForKey:@"sunlightMode"] != 0;
  }

  return v5;
}

- (int64_t)color
{
  return *(void *)&self->_sunlightMode;
}

- (BOOL)sunlightMode
{
  return *(&self->super._enabled + 1);
}

@end