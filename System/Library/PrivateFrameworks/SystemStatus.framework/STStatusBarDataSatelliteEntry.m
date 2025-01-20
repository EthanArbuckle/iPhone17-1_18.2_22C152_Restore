@interface STStatusBarDataSatelliteEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithConnectionStatus:(int64_t)a3;
- (STStatusBarDataSatelliteEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataSatelliteEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (int64_t)connectionStatus;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataSatelliteEntry

+ (id)entryWithConnectionStatus:(int64_t)a3
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
  v5.super_class = (Class)STStatusBarDataSatelliteEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_connectionStatus, @"connectionStatus", v5.receiver, v5.super_class);
}

- (STStatusBarDataSatelliteEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataSatelliteEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"connectionStatus", v7.receiver, v7.super_class);

  v4->_connectionStatus = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataSatelliteEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 succinctDescriptionBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STStatusBarDataSatelliteEntry connectionStatus](self, "connectionStatus"), @"connectionStatus");

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataSatelliteEntry;
  uint64_t v5 = [(STStatusBarDataEntry *)&v13 _equalsBuilderWithObject:v4];
  id v6 = v4;
  int64_t v7 = [(STStatusBarDataSatelliteEntry *)self connectionStatus];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataSatelliteEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E6B63D88;
  id v12 = v6;
  id v8 = v6;
  id v9 = (id)[v5 appendInteger:v7 counterpart:v11];

  return v5;
}

uint64_t __58__STStatusBarDataSatelliteEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionStatus];
}

- (id)_hashBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataSatelliteEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[STStatusBarDataSatelliteEntry connectionStatus](self, "connectionStatus"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataSatelliteEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_connectionStatus, @"connectionStatus", v5.receiver, v5.super_class);
}

- (STStatusBarDataSatelliteEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataSatelliteEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5) {
    v5->_connectionStatus = [v4 decodeInt64ForKey:@"connectionStatus"];
  }

  return v5;
}

- (int64_t)connectionStatus
{
  return self->_connectionStatus;
}

@end