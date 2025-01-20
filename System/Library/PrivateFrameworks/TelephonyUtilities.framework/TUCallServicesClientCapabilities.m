@interface TUCallServicesClientCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)wantsCallDisconnectionOnInvalidation;
- (BOOL)wantsCallNotificationsDisabledWhileSuspended;
- (BOOL)wantsCallStopStreamingOnInvalidation;
- (BOOL)wantsFrequencyChangeNotifications;
- (BOOL)wantsToScreenCalls;
- (TUCallServicesClientCapabilities)initWithCoder:(id)a3;
- (TUCallServicesClientCapabilitiesActions)delegate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setDelegate:(id)a3;
- (void)setWantsCallDisconnectionOnInvalidation:(BOOL)a3;
- (void)setWantsCallNotificationsDisabledWhileSuspended:(BOOL)a3;
- (void)setWantsCallStopStreamingOnInvalidation:(BOOL)a3;
- (void)setWantsFrequencyChangeNotifications:(BOOL)a3;
- (void)setWantsToScreenCalls:(BOOL)a3;
@end

@implementation TUCallServicesClientCapabilities

- (void)save
{
  id v3 = [(TUCallServicesClientCapabilities *)self delegate];
  [v3 setClientCapabilities:self];
}

- (TUCallServicesClientCapabilitiesActions)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUCallServicesClientCapabilitiesActions *)WeakRetained;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDelegate:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  BOOL wantsCallDisconnectionOnInvalidation = self->_wantsCallDisconnectionOnInvalidation;
  id v5 = a3;
  [v5 encodeBool:wantsCallDisconnectionOnInvalidation forKey:@"wantsCallDisconnectionOnInvalidation"];
  [v5 encodeBool:self->_wantsCallStopStreamingOnInvalidation forKey:@"wantsCallStopStreamingOnInvalidation"];
  [v5 encodeBool:self->_wantsFrequencyChangeNotifications forKey:@"wantsFrequencyChangeNotifications"];
  [v5 encodeBool:self->_wantsCallNotificationsDisabledWhileSuspended forKey:@"wantsCallNotificationsDisabledWhileSuspended"];
  [v5 encodeBool:self->_wantsToScreenCalls forKey:@"wantsToScreenCalls"];
}

- (TUCallServicesClientCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TUCallServicesClientCapabilities;
  id v5 = [(TUCallServicesClientCapabilities *)&v7 init];
  if (v5)
  {
    v5->_BOOL wantsCallDisconnectionOnInvalidation = [v4 decodeBoolForKey:@"wantsCallDisconnectionOnInvalidation"];
    v5->_wantsCallStopStreamingOnInvalidation = [v4 decodeBoolForKey:@"wantsCallStopStreamingOnInvalidation"];
    v5->_wantsFrequencyChangeNotifications = [v4 decodeBoolForKey:@"wantsFrequencyChangeNotifications"];
    v5->_wantsCallNotificationsDisabledWhileSuspended = [v4 decodeBoolForKey:@"wantsCallNotificationsDisabledWhileSuspended"];
    v5->_wantsToScreenCalls = [v4 decodeBoolForKey:@"wantsToScreenCalls"];
  }

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" wantsCallDisconnectionOnInvalidation: %d", -[TUCallServicesClientCapabilities wantsCallDisconnectionOnInvalidation](self, "wantsCallDisconnectionOnInvalidation"));
  objc_msgSend(v3, "appendFormat:", @" wantsFrequencyChangeNotifications: %d", -[TUCallServicesClientCapabilities wantsFrequencyChangeNotifications](self, "wantsFrequencyChangeNotifications"));
  objc_msgSend(v3, "appendFormat:", @" wantsCallStopStreamingOnInvalidation: %d", -[TUCallServicesClientCapabilities wantsCallStopStreamingOnInvalidation](self, "wantsCallStopStreamingOnInvalidation"));
  objc_msgSend(v3, "appendFormat:", @" wantsCallNotificationsDisabledWhileSuspended: %d", -[TUCallServicesClientCapabilities wantsCallNotificationsDisabledWhileSuspended](self, "wantsCallNotificationsDisabledWhileSuspended"));
  objc_msgSend(v3, "appendFormat:", @" wantsToScreenCalls: %d", -[TUCallServicesClientCapabilities wantsToScreenCalls](self, "wantsToScreenCalls"));
  [v3 appendString:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)wantsCallDisconnectionOnInvalidation
{
  return self->_wantsCallDisconnectionOnInvalidation;
}

- (void)setWantsCallDisconnectionOnInvalidation:(BOOL)a3
{
  self->_BOOL wantsCallDisconnectionOnInvalidation = a3;
}

- (BOOL)wantsCallStopStreamingOnInvalidation
{
  return self->_wantsCallStopStreamingOnInvalidation;
}

- (void)setWantsCallStopStreamingOnInvalidation:(BOOL)a3
{
  self->_wantsCallStopStreamingOnInvalidation = a3;
}

- (BOOL)wantsFrequencyChangeNotifications
{
  return self->_wantsFrequencyChangeNotifications;
}

- (void)setWantsFrequencyChangeNotifications:(BOOL)a3
{
  self->_wantsFrequencyChangeNotifications = a3;
}

- (BOOL)wantsToScreenCalls
{
  return self->_wantsToScreenCalls;
}

- (void)setWantsToScreenCalls:(BOOL)a3
{
  self->_wantsToScreenCalls = a3;
}

- (BOOL)wantsCallNotificationsDisabledWhileSuspended
{
  return self->_wantsCallNotificationsDisabledWhileSuspended;
}

- (void)setWantsCallNotificationsDisabledWhileSuspended:(BOOL)a3
{
  self->_wantsCallNotificationsDisabledWhileSuspended = a3;
}

- (void).cxx_destruct
{
}

@end