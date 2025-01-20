@interface SFClientGetDeviceAssetsParams
+ (BOOL)supportsSecureCoding;
- (NSString)model;
- (SFClientGetDeviceAssetsParams)initWithCoder:(id)a3;
- (double)timeoutSeconds;
- (unsigned)bluetoothProductID;
- (unsigned)colorCode;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothProductID:(unsigned __int16)a3;
- (void)setColorCode:(unsigned int)a3;
- (void)setModel:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
@end

@implementation SFClientGetDeviceAssetsParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFClientGetDeviceAssetsParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFClientGetDeviceAssetsParams;
  v5 = [(SFClientGetDeviceAssetsParams *)&v9 init];
  if (v5)
  {
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_bluetoothProductID = v10;
    }
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_colorCode = v10;
    }
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_bluetoothProductID)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    id v4 = v7;
  }
  uint64_t colorCode = self->_colorCode;
  if (colorCode)
  {
    [v7 encodeInt64:colorCode forKey:@"cc"];
    id v4 = v7;
  }
  model = self->_model;
  if (model)
  {
    [v7 encodeObject:model forKey:@"model"];
    id v4 = v7;
  }
}

- (unsigned)bluetoothProductID
{
  return self->_bluetoothProductID;
}

- (void)setBluetoothProductID:(unsigned __int16)a3
{
  self->_bluetoothProductID = a3;
}

- (unsigned)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(unsigned int)a3
{
  self->_uint64_t colorCode = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (void).cxx_destruct
{
}

@end