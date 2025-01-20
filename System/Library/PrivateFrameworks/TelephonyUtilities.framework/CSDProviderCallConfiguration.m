@interface CSDProviderCallConfiguration
- (BOOL)accessoryButtonEventsEnabled;
- (BOOL)isEndpointOnCurrentDevice;
- (BOOL)isHeld;
- (BOOL)isOutgoing;
- (CSDProviderCallConfiguration)initWithProviderIdentifier:(id)a3;
- (CXAbstractProviderSource)providerSource;
- (NSNotificationCenter)defaultNotificationCenter;
- (NSString)providerIdentifier;
- (TUFeatureFlags)featureFlags;
- (int64_t)transmissionMode;
- (void)setAccessoryButtonEventsEnabled:(BOOL)a3;
- (void)setDefaultNotificationCenter:(id)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHeld:(BOOL)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setProviderSource:(id)a3;
- (void)setTransmissionMode:(int64_t)a3;
@end

@implementation CSDProviderCallConfiguration

- (CSDProviderCallConfiguration)initWithProviderIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDProviderCallConfiguration;
  v5 = [(CSDProviderCallConfiguration *)&v9 init];
  if (v5)
  {
    if (!v4) {
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%s: parameter '%@' cannot be nil", "-[CSDProviderCallConfiguration initWithProviderIdentifier:]", @"providerIdentifier");
    }
    v5->_endpointOnCurrentDevice = 1;
    v6 = (NSString *)[v4 copy];
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = v6;
  }
  return v5;
}

- (BOOL)isEndpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BOOL)isHeld
{
  return self->_held;
}

- (void)setHeld:(BOOL)a3
{
  self->_held = a3;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (CXAbstractProviderSource)providerSource
{
  return self->_providerSource;
}

- (void)setProviderSource:(id)a3
{
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (void)setTransmissionMode:(int64_t)a3
{
  self->_transmissionMode = a3;
}

- (BOOL)accessoryButtonEventsEnabled
{
  return self->_accessoryButtonEventsEnabled;
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)a3
{
  self->_accessoryButtonEventsEnabled = a3;
}

- (NSNotificationCenter)defaultNotificationCenter
{
  return self->_defaultNotificationCenter;
}

- (void)setDefaultNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultNotificationCenter, 0);
  objc_storeStrong((id *)&self->_providerSource, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end