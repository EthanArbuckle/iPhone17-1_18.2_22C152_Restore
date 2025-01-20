@interface DetachEvent
- (BOOL)restrictedModeEnabled;
- (DetachEvent)initWithTimestamp:(id)a3 primaryPort:(id)a4 restrictedModeEnabled:(BOOL)a5;
- (NSData)accDigitalID;
- (NSNumber)duration;
- (NSNumber)primaryPort;
- (NSNumber)timestamp;
- (void)setAccDigitalID:(id)a3;
- (void)setDuration:(id)a3;
- (void)setPrimaryPort:(id)a3;
- (void)setRestrictedModeEnabled:(BOOL)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation DetachEvent

- (DetachEvent)initWithTimestamp:(id)a3 primaryPort:(id)a4 restrictedModeEnabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DetachEvent;
  v11 = [(DetachEvent *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timestamp, a3);
    objc_storeStrong((id *)&v12->_primaryPort, a4);
    v12->_restrictedModeEnabled = a5;
    duration = v12->_duration;
    v12->_duration = 0;

    accDigitalID = v12->_accDigitalID;
    v12->_accDigitalID = 0;
  }
  return v12;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)primaryPort
{
  return self->_primaryPort;
}

- (void)setPrimaryPort:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSData)accDigitalID
{
  return self->_accDigitalID;
}

- (void)setAccDigitalID:(id)a3
{
}

- (BOOL)restrictedModeEnabled
{
  return self->_restrictedModeEnabled;
}

- (void)setRestrictedModeEnabled:(BOOL)a3
{
  self->_restrictedModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accDigitalID, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_primaryPort, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end