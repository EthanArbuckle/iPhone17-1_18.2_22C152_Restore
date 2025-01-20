@interface SiriBluetoothContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEyesFree;
- (BOOL)isTemporaryDevice;
- (NSString)address;
- (SiriBluetoothContext)initWithBluetoothDevice:(id)a3;
- (SiriBluetoothContext)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriBluetoothContext

- (SiriBluetoothContext)initWithBluetoothDevice:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SiriBluetoothContext;
  v5 = [(SiriBluetoothContext *)&v13 init];
  if (v5)
  {
    [v4 device];
    BTDeviceIsTemporaryPaired();
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)v6;

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "ac_isEyesFree"));
    isEyesFree = v5->_isEyesFree;
    v5->_isEyesFree = (NSNumber *)v8;

    uint64_t v10 = [v4 address];
    address = v5->_address;
    v5->_address = (NSString *)v10;
  }
  return v5;
}

- (BOOL)isTemporaryDevice
{
  return [(NSNumber *)self->_isTemporaryDevice BOOLValue];
}

- (BOOL)isEyesFree
{
  return [(NSNumber *)self->_isEyesFree BOOLValue];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SiriContext *)self contextOverride];
  v5 = [v3 stringWithFormat:@"<SiriBluetoothContext contextOverride:%@ isTemporaryDevice:%@ isEyesFree:%@ address:%@>", v4, self->_isTemporaryDevice, self->_isEyesFree, self->_address];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriBluetoothContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriBluetoothContext;
  v5 = [(SiriContext *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isTemporaryDevice"];
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isEyesFree"];
    isEyesFree = v5->_isEyesFree;
    v5->_isEyesFree = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_1F336E7E8;
    }
    objc_storeStrong((id *)&v5->_address, v12);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriBluetoothContext;
  id v4 = a3;
  [(SiriContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_isTemporaryDevice, @"isTemporaryDevice", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_isEyesFree forKey:@"isEyesFree"];
  [v4 encodeObject:self->_address forKey:@"address"];
}

- (NSString)address
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_isEyesFree, 0);
  objc_storeStrong((id *)&self->_isTemporaryDevice, 0);
}

@end