@interface STStatusBarDataBatteryEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithCapacity:(int64_t)a3 state:(int64_t)a4 saverMode:(BOOL)a5 prominentlyShowsDetailString:(BOOL)a6 detailString:(id)a7;
- (BOOL)prominentlyShowsDetailString;
- (BOOL)saverModeActive;
- (NSString)detailString;
- (STStatusBarDataBatteryEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataBatteryEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)capacity;
- (int64_t)state;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataBatteryEntry

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)STStatusBarDataBatteryEntry;
  v5 = [(STStatusBarDataEntry *)&v33 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataBatteryEntry *)self capacity];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke;
  v31[3] = &unk_1E6B63D88;
  id v8 = v6;
  id v32 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v31];
  int64_t v10 = [(STStatusBarDataBatteryEntry *)self state];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_2;
  v29[3] = &unk_1E6B63D88;
  id v11 = v8;
  id v30 = v11;
  id v12 = (id)[v5 appendInteger:v10 counterpart:v29];
  BOOL v13 = [(STStatusBarDataBatteryEntry *)self saverModeActive];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_3;
  v27[3] = &unk_1E6B630D0;
  id v14 = v11;
  id v28 = v14;
  id v15 = (id)[v5 appendBool:v13 counterpart:v27];
  BOOL v16 = [(STStatusBarDataBatteryEntry *)self prominentlyShowsDetailString];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_4;
  v25[3] = &unk_1E6B630D0;
  id v17 = v14;
  id v26 = v17;
  id v18 = (id)[v5 appendBool:v16 counterpart:v25];
  v19 = [(STStatusBarDataBatteryEntry *)self detailString];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_5;
  v23[3] = &unk_1E6B630A8;
  id v24 = v17;
  id v20 = v17;
  id v21 = (id)[v5 appendString:v19 counterpart:v23];

  return v5;
}

- (int64_t)capacity
{
  return *(void *)&self->_saverModeActive;
}

- (int64_t)state
{
  return self->_capacity;
}

- (BOOL)saverModeActive
{
  return *(&self->super._enabled + 1);
}

- (BOOL)prominentlyShowsDetailString
{
  return *(&self->super._enabled + 2);
}

- (NSString)detailString
{
  return (NSString *)self->_state;
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) capacity];
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) detailString];
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) prominentlyShowsDetailString];
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) saverModeActive];
}

uint64_t __56__STStatusBarDataBatteryEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) state];
}

- (void).cxx_destruct
{
}

+ (id)entryWithCapacity:(int64_t)a3 state:(int64_t)a4 saverMode:(BOOL)a5 prominentlyShowsDetailString:(BOOL)a6 detailString:(id)a7
{
  id v12 = a7;
  BOOL v13 = objc_alloc_init((Class)a1);
  v13[2] = a3;
  v13[3] = a4;
  *((unsigned char *)v13 + 9) = a5;
  *((unsigned char *)v13 + 10) = a6;
  uint64_t v14 = [v12 copy];

  id v15 = (void *)v13[4];
  v13[4] = v14;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBatteryEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", *(void *)&self->_saverModeActive, @"capacity", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_capacity forKey:@"state"];
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"saverModeActive"];
  [v4 encodeInteger:*((unsigned __int8 *)&self->super._enabled + 2) forKey:@"prominentlyShowsDetailString"];
  [v4 encodeObject:self->_state forKey:@"detailString"];
}

- (STStatusBarDataBatteryEntry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBatteryEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v8 initWithCoder:v3];
  *(void *)&v4->_saverModeActive = objc_msgSend(v3, "decodeIntegerForKey:", @"capacity", v8.receiver, v8.super_class);
  v4->_capacity = [v3 decodeIntegerForKey:@"state"];
  *(&v4->super._enabled + 1) = [v3 decodeIntegerForKey:@"saverModeActive"] != 0;
  *(&v4->super._enabled + 2) = [v3 decodeIntegerForKey:@"prominentlyShowsDetailString"] != 0;
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"detailString"];

  state = (void *)v4->_state;
  v4->_state = v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v11.receiver = self;
  v11.super_class = (Class)STStatusBarDataBatteryEntry;
  id v3 = [(STStatusBarDataEntry *)&v11 succinctDescriptionBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataBatteryEntry capacity](self, "capacity"), @"capacity");
  unint64_t v5 = [(STStatusBarDataBatteryEntry *)self state];
  if (v5 > 3) {
    id v6 = @"(unknown)";
  }
  else {
    id v6 = off_1E6B63E80[v5];
  }
  [v3 appendString:v6 withName:@"state"];
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataBatteryEntry saverModeActive](self, "saverModeActive"), @"saverModeActive");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataBatteryEntry prominentlyShowsDetailString](self, "prominentlyShowsDetailString"), @"prominentlyShowsDetailString");
  id v9 = [(STStatusBarDataBatteryEntry *)self detailString];
  [v3 appendString:v9 withName:@"detailString" skipIfEmpty:1];

  return v3;
}

- (id)_hashBuilder
{
  v11.receiver = self;
  v11.super_class = (Class)STStatusBarDataBatteryEntry;
  id v3 = [(STStatusBarDataEntry *)&v11 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataBatteryEntry capacity](self, "capacity"));
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataBatteryEntry state](self, "state"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataBatteryEntry saverModeActive](self, "saverModeActive"));
  id v7 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataBatteryEntry prominentlyShowsDetailString](self, "prominentlyShowsDetailString"));
  id v8 = [(STStatusBarDataBatteryEntry *)self detailString];
  id v9 = (id)[v3 appendString:v8];

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBatteryEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)&self->_saverModeActive, @"capacity", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_capacity forKey:@"state"];
  [v4 encodeInt64:*((unsigned __int8 *)&self->super._enabled + 1) forKey:@"saverModeActive"];
  [v4 encodeInt64:*((unsigned __int8 *)&self->super._enabled + 2) forKey:@"prominentlyShowsDetailString"];
  [v4 encodeObject:self->_state forKey:@"detailString"];
}

- (STStatusBarDataBatteryEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataBatteryEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    *(void *)&v5->_saverModeActive = [v4 decodeInt64ForKey:@"capacity"];
    v5->_capacity = [v4 decodeInt64ForKey:@"state"];
    *(&v5->super._enabled + 1) = [v4 decodeInt64ForKey:@"saverModeActive"] != 0;
    *(&v5->super._enabled + 2) = [v4 decodeInt64ForKey:@"prominentlyShowsDetailString"] != 0;
    uint64_t v6 = [v4 decodeStringForKey:@"detailString"];
    state = (void *)v5->_state;
    v5->_state = v6;
  }
  return v5;
}

@end