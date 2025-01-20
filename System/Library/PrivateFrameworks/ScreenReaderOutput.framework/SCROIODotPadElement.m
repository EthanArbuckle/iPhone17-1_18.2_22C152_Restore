@interface SCROIODotPadElement
- (CBCentralManager)central;
- (CBPeripheral)peripheral;
- (NSString)address;
- (NSString)name;
- (SCROIODotPadElement)initWithCentral:(id)a3 peripheral:(id)a4;
- (id)dotFamilyIdentifier;
- (int)identifier;
- (int)transport;
@end

@implementation SCROIODotPadElement

- (SCROIODotPadElement)initWithCentral:(id)a3 peripheral:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCROIODotPadElement;
  v9 = [(SCROIODotPadElement *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_central, a3);
    objc_storeStrong((id *)&v10->_peripheral, a4);
    v10->_identifier = atomic_fetch_add_explicit(_currentIdentifier, 1u, memory_order_relaxed);
  }

  return v10;
}

- (id)dotFamilyIdentifier
{
  return @"com.apple.braille.driver.dot.pad";
}

- (int)transport
{
  return 32;
}

- (int)identifier
{
  return self->_identifier;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CBCentralManager)central
{
  return self->_central;
}

- (NSString)address
{
  v2 = [(CBPeripheral *)self->_peripheral identifier];
  v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (NSString)name
{
  return [(CBPeripheral *)self->_peripheral name];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_central, 0);
}

@end