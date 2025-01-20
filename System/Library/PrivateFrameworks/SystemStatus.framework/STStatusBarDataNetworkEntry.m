@interface STStatusBarDataNetworkEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithStatus:(int64_t)a3 lowDataMode:(BOOL)a4 rawValue:(int64_t)a5 displayValue:(int64_t)a6 displayRawValue:(BOOL)a7;
- (BOOL)lowDataModeActive;
- (STStatusBarDataNetworkEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataNetworkEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)status;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataNetworkEntry

+ (id)entryWithStatus:(int64_t)a3 lowDataMode:(BOOL)a4 rawValue:(int64_t)a5 displayValue:(int64_t)a6 displayRawValue:(BOOL)a7
{
  id result = (id)[a1 entryWithRawValue:a5 displayValue:a6 displayRawValue:a7];
  *((void *)result + 5) = a3;
  *((unsigned char *)result + 32) = a4;
  return result;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STStatusBarDataNetworkEntry;
  v5 = [(STStatusBarDataIntegerEntry *)&v18 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataNetworkEntry *)self status];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__STStatusBarDataNetworkEntry__equalsBuilderWithObject___block_invoke;
  v16[3] = &unk_1E6B63D88;
  id v8 = v6;
  id v17 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v16];
  BOOL v10 = [(STStatusBarDataNetworkEntry *)self lowDataModeActive];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__STStatusBarDataNetworkEntry__equalsBuilderWithObject___block_invoke_2;
  v14[3] = &unk_1E6B630D0;
  id v15 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendBool:v10 counterpart:v14];

  return v5;
}

- (int64_t)status
{
  return *(void *)&self->_lowDataModeActive;
}

- (BOOL)lowDataModeActive
{
  return self->super._displayValue;
}

uint64_t __56__STStatusBarDataNetworkEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) lowDataModeActive];
}

uint64_t __56__STStatusBarDataNetworkEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) status];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataNetworkEntry;
  id v4 = a3;
  [(STStatusBarDataIntegerEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_lowDataModeActive, @"status", v5.receiver, v5.super_class);
  [v4 encodeBool:LOBYTE(self->super._displayValue) forKey:@"lowDataModeActive"];
}

- (STStatusBarDataNetworkEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataNetworkEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataIntegerEntry *)&v7 initWithCoder:v3];
  *(void *)&v4->_lowDataModeActive = objc_msgSend(v3, "decodeIntegerForKey:", @"status", v7.receiver, v7.super_class);
  char v5 = [v3 decodeBoolForKey:@"lowDataModeActive"];

  LOBYTE(v4->super._displayValue) = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataNetworkEntry;
  id v3 = [(STStatusBarDataIntegerEntry *)&v8 succinctDescriptionBuilder];
  unint64_t v4 = [(STStatusBarDataNetworkEntry *)self status];
  if (v4 > 5) {
    char v5 = @"(unknown)";
  }
  else {
    char v5 = off_1E6B63E50[v4];
  }
  [v3 appendString:v5 withName:@"status"];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataNetworkEntry lowDataModeActive](self, "lowDataModeActive"), @"lowDataModeActive");

  return v3;
}

- (id)_hashBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataNetworkEntry;
  id v3 = [(STStatusBarDataIntegerEntry *)&v7 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataNetworkEntry status](self, "status"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataNetworkEntry lowDataModeActive](self, "lowDataModeActive"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataNetworkEntry;
  id v4 = a3;
  [(STStatusBarDataIntegerEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)&self->_lowDataModeActive, @"status", v5.receiver, v5.super_class);
  [v4 encodeBool:LOBYTE(self->super._displayValue) forKey:@"lowDataModeActive"];
}

- (STStatusBarDataNetworkEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataNetworkEntry;
  objc_super v5 = [(STStatusBarDataIntegerEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5)
  {
    *(void *)&v5->_lowDataModeActive = [v4 decodeInt64ForKey:@"status"];
    LOBYTE(v5->super._displayValue) = [v4 decodeBoolForKey:@"lowDataModeActive"];
  }

  return v5;
}

@end