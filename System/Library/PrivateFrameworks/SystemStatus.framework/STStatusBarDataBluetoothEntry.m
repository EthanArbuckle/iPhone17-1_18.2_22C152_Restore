@interface STStatusBarDataBluetoothEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (STStatusBarDataBluetoothEntry)entryWithState:(int64_t)a3 batteryEntry:(id)a4;
- (STStatusBarDataBatteryEntry)batteryEntry;
- (STStatusBarDataBluetoothEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataBluetoothEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)state;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataBluetoothEntry

- (void).cxx_destruct
{
}

+ (STStatusBarDataBluetoothEntry)entryWithState:(int64_t)a3 batteryEntry:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init((Class)a1);
  v7[2] = a3;
  uint64_t v8 = [v6 copy];

  v9 = (void *)v7[3];
  v7[3] = v8;

  return (STStatusBarDataBluetoothEntry *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBluetoothEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, @"state", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_batteryEntry forKey:@"batteryEntry"];
}

- (STStatusBarDataBluetoothEntry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBluetoothEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v8 initWithCoder:v3];
  v4->_state = objc_msgSend(v3, "decodeIntegerForKey:", @"state", v8.receiver, v8.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"batteryEntry"];

  batteryEntry = v4->_batteryEntry;
  v4->_batteryEntry = (STStatusBarDataBatteryEntry *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataBluetoothEntry;
  id v3 = [(STStatusBarDataEntry *)&v9 succinctDescriptionBuilder];
  unint64_t v4 = [(STStatusBarDataBluetoothEntry *)self state];
  if (v4 > 2) {
    uint64_t v5 = @"(unknown)";
  }
  else {
    uint64_t v5 = off_1E6B63EA0[v4];
  }
  [v3 appendString:v5 withName:@"state"];
  id v6 = [(STStatusBarDataBluetoothEntry *)self batteryEntry];
  id v7 = (id)[v3 appendObject:v6 withName:@"batteryState" skipIfNil:1];

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STStatusBarDataBluetoothEntry;
  uint64_t v5 = [(STStatusBarDataEntry *)&v18 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataBluetoothEntry *)self state];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke;
  v16[3] = &unk_1E6B63D88;
  id v8 = v6;
  id v17 = v8;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v16];
  v10 = [(STStatusBarDataBluetoothEntry *)self batteryEntry];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke_2;
  v14[3] = &unk_1E6B63058;
  id v15 = v8;
  id v11 = v8;
  id v12 = (id)[v5 appendObject:v10 counterpart:v14];

  return v5;
}

uint64_t __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) state];
}

uint64_t __58__STStatusBarDataBluetoothEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) batteryEntry];
}

- (id)_hashBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataBluetoothEntry;
  id v3 = [(STStatusBarDataEntry *)&v8 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataBluetoothEntry state](self, "state"));
  uint64_t v5 = [(STStatusBarDataBluetoothEntry *)self batteryEntry];
  id v6 = (id)[v3 appendObject:v5];

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBluetoothEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_state, @"state", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_batteryEntry forKey:@"batteryEntry"];
}

- (STStatusBarDataBluetoothEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataBluetoothEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_state = [v4 decodeInt64ForKey:@"state"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryEntry"];
    batteryEntry = v5->_batteryEntry;
    v5->_batteryEntry = (STStatusBarDataBatteryEntry *)v6;
  }
  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (STStatusBarDataBatteryEntry)batteryEntry
{
  return self->_batteryEntry;
}

@end