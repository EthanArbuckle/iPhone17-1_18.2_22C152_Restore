@interface TPSDeviceCapability
- (TPSDeviceCapability)initWithDictionary:(id)a3;
- (id)debugDescription;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation TPSDeviceCapability

- (int64_t)type
{
  return self->_type;
}

- (TPSDeviceCapability)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSDeviceCapability;
  v5 = [(TPSCapability *)&v7 initWithDictionary:v4];
  if (v5) {
    v5->_type = [v4 TPSSafeIntegerForKey:@"type"];
  }

  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)TPSDeviceCapability;
  id v4 = [(TPSCapability *)&v7 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"; %@ = %ld", @"type", -[TPSDeviceCapability type](self, "type")];

  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end