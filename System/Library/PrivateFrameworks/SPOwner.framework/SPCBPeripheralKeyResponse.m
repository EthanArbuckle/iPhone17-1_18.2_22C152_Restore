@interface SPCBPeripheralKeyResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)peripherals;
- (SPCBPeripheralKeyResponse)initWithCoder:(id)a3;
- (SPCBPeripheralKeyResponse)initWithPeripherals:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPeripherals:(id)a3;
@end

@implementation SPCBPeripheralKeyResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyResponse)initWithPeripherals:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPCBPeripheralKeyResponse;
  v6 = [(SPCBPeripheralKeyResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_peripherals, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SPCBPeripheralKeyResponse *)self peripherals];
  [v4 encodeObject:v5 forKey:@"peripherals"];
}

- (SPCBPeripheralKeyResponse)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"peripherals"];

  peripherals = self->_peripherals;
  self->_peripherals = v8;

  return self;
}

- (NSArray)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end