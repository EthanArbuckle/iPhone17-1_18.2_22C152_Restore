@interface ATXWiredAudioDisconnectedTrigger
+ (BOOL)supportsSecureCoding;
- (ATXWiredAudioDisconnectedTrigger)initWithCoder:(id)a3;
- (ATXWiredAudioDisconnectedTrigger)initWithDeviceIdentifier:(id)a3;
- (NSString)deviceIdentifier;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXWiredAudioDisconnectedTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 13;
}

- (ATXWiredAudioDisconnectedTrigger)initWithDeviceIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXWiredAudioDisconnectedTrigger;
  v6 = [(ATXWiredAudioDisconnectedTrigger *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXWiredAudioDisconnectedTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioDeviceIdentifier"];

  v6 = [(ATXWiredAudioDisconnectedTrigger *)self initWithDeviceIdentifier:v5];
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