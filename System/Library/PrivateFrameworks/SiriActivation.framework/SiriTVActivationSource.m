@interface SiriTVActivationSource
+ (id)activationSourceForIdentifier:(int64_t)a3;
- (NSString)deviceIdentifier;
- (SiriLongPressButtonContext)context;
- (double)longPressInterval;
- (id)_deviceIdentifier;
- (unint64_t)remoteType;
- (void)setContext:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setListening:(BOOL)a3;
- (void)setLongPressInterval:(double)a3;
- (void)setPTTEligible:(BOOL)a3;
- (void)setRemoteType:(unint64_t)a3;
@end

@implementation SiriTVActivationSource

+ (id)activationSourceForIdentifier:(int64_t)a3
{
  id v3 = [(SiriLongPressButtonSource *)[SiriTVActivationSource alloc] _initWithButtonIdentifier:a3];
  [v3 setLongPressInterval:0.0];
  v4 = objc_alloc_init(SiriTVLongPressButtonContext);
  [(SiriLongPressButtonContext *)v4 setButtonDownTimestamp:0.0];
  [v3 setContext:v4];

  return v3;
}

- (void)setDeviceIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v4;

  v6 = [(SiriTVActivationSource *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(SiriTVActivationSource *)self context];
    if ([(NSString *)self->_deviceIdentifier length]) {
      v8 = (__CFString *)self->_deviceIdentifier;
    }
    else {
      v8 = &stru_1F336E7E8;
    }
    [v9 setActiveDeviceBluetoothIdentifier:v8];
  }
}

- (void)setRemoteType:(unint64_t)a3
{
  self->_remoteType = a3;
  v5 = [(SiriTVActivationSource *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(SiriTVActivationSource *)self context];
    [v7 setRemoteType:a3];
  }
}

- (void)setListening:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SiriTVActivationSource *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(SiriTVActivationSource *)self context];
    [v7 setIsListening:v3];
  }
}

- (id)_deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setPTTEligible:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SiriTVActivationSource *)self context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(SiriTVActivationSource *)self context];
    [v7 setSourcePTTEligibility:v3];
  }
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)remoteType
{
  return self->_remoteType;
}

- (double)longPressInterval
{
  return self->_longPressInterval;
}

- (void)setLongPressInterval:(double)a3
{
  self->_longPressInterval = a3;
}

- (SiriLongPressButtonContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end