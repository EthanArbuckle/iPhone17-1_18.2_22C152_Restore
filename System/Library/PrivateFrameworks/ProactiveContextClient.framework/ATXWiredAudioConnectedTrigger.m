@interface ATXWiredAudioConnectedTrigger
+ (BOOL)supportsSecureCoding;
- (ATXWiredAudioConnectedTrigger)initWithCoder:(id)a3;
- (ATXWiredAudioConnectedTrigger)initWithDeviceIdentifier:(id)a3;
- (NSString)deviceIdentifier;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXWiredAudioConnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 12;
}

- (ATXWiredAudioConnectedTrigger)initWithDeviceIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXWiredAudioConnectedTrigger;
  v6 = [(ATXWiredAudioConnectedTrigger *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXWiredAudioConnectedTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioDeviceIdentifier"];

  v6 = [(ATXWiredAudioConnectedTrigger *)self initWithDeviceIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
}

@end