@interface STStatusBarDataWifiEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithType:(int64_t)a3 status:(int64_t)a4 lowDataMode:(BOOL)a5 rawValue:(int64_t)a6 displayValue:(int64_t)a7 displayRawValue:(BOOL)a8;
- (STStatusBarDataWifiEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataWifiEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataWifiEntry

+ (id)entryWithType:(int64_t)a3 status:(int64_t)a4 lowDataMode:(BOOL)a5 rawValue:(int64_t)a6 displayValue:(int64_t)a7 displayRawValue:(BOOL)a8
{
  id result = (id)[a1 entryWithStatus:a4 lowDataMode:a5 rawValue:a6 displayValue:a7 displayRawValue:a8];
  *((void *)result + 6) = a3;
  return result;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STStatusBarDataWifiEntry;
  v5 = [(STStatusBarDataNetworkEntry *)&v12 _equalsBuilderWithObject:v4];
  int64_t v6 = [(STStatusBarDataWifiEntry *)self type];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__STStatusBarDataWifiEntry__equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E6B63D88;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendInteger:v6 counterpart:v10];

  return v5;
}

- (int64_t)type
{
  return self->super._status;
}

uint64_t __53__STStatusBarDataWifiEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataWifiEntry;
  id v4 = a3;
  [(STStatusBarDataNetworkEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->super._status, @"type", v5.receiver, v5.super_class);
}

- (STStatusBarDataWifiEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataWifiEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataNetworkEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"type", v7.receiver, v7.super_class);

  v4->super._status = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataWifiEntry;
  id v3 = [(STStatusBarDataNetworkEntry *)&v8 succinctDescriptionBuilder];
  int64_t v4 = [(STStatusBarDataWifiEntry *)self type];
  uint64_t v5 = @"(unknown)";
  if (v4 == 1) {
    uint64_t v5 = @"hotspot";
  }
  if (v4) {
    int64_t v6 = v5;
  }
  else {
    int64_t v6 = @"regular";
  }
  [v3 appendString:v6 withName:@"type"];

  return v3;
}

- (id)_hashBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataWifiEntry;
  id v3 = [(STStatusBarDataNetworkEntry *)&v6 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataWifiEntry type](self, "type"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataWifiEntry;
  id v4 = a3;
  [(STStatusBarDataNetworkEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->super._status, @"type", v5.receiver, v5.super_class);
}

- (STStatusBarDataWifiEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataWifiEntry;
  objc_super v5 = [(STStatusBarDataNetworkEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5) {
    v5->super._status = [v4 decodeInt64ForKey:@"type"];
  }

  return v5;
}

@end