@interface MXMOSLogDevice_Internal
- (MXMOSLogDevice_Internal)initWithName:(id)a3 identifier:(id)a4;
- (MXMOSLogDevice_Internal)initWithOSLogDevice:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (OSLogDevice)rawDevice;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setRawDevice:(id)a3;
@end

@implementation MXMOSLogDevice_Internal

- (MXMOSLogDevice_Internal)initWithOSLogDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMOSLogDevice_Internal;
  v6 = [(MXMOSLogDevice_Internal *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawDevice, a3);
  }

  return v7;
}

- (MXMOSLogDevice_Internal)initWithName:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MXMOSLogDevice_Internal;
  objc_super v9 = [(MXMOSLogDevice_Internal *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OSLogDevice)rawDevice
{
  return self->_rawDevice;
}

- (void)setRawDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end