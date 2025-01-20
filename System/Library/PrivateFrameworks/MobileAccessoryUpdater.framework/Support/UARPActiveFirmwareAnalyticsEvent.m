@interface UARPActiveFirmwareAnalyticsEvent
- (BOOL)share3rdParty;
- (NSString)activeFirmwareVersion;
- (NSString)countryCode;
- (NSString)downloadURL;
- (NSString)manufacturerName;
- (NSString)modelName;
- (id)description;
- (int64_t)channelType;
- (int64_t)transport;
- (void)dealloc;
- (void)send;
- (void)setActiveFirmwareVersion:(id)a3;
- (void)setChannelType:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setDownloadURL:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setShare3rdParty:(BOOL)a3;
- (void)setTransport:(int64_t)a3;
- (void)updateWithAccessoryID:(id)a3;
@end

@implementation UARPActiveFirmwareAnalyticsEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPActiveFirmwareAnalyticsEvent;
  [(UARPActiveFirmwareAnalyticsEvent *)&v3 dealloc];
}

- (void)send
{
}

- (void)updateWithAccessoryID:(id)a3
{
  -[UARPActiveFirmwareAnalyticsEvent setManufacturerName:](self, "setManufacturerName:", [a3 manufacturer]);
  -[UARPActiveFirmwareAnalyticsEvent setModelName:](self, "setModelName:", [a3 modelAnalytics]);
  -[UARPActiveFirmwareAnalyticsEvent setCountryCode:](self, "setCountryCode:", [a3 countryCode]);
  -[UARPActiveFirmwareAnalyticsEvent setActiveFirmwareVersion:](self, "setActiveFirmwareVersion:", [a3 firmwareVersion]);
  -[UARPActiveFirmwareAnalyticsEvent setTransport:](self, "setTransport:", [a3 transport]);
  id v5 = [a3 shareAnalyticsEventsWithThirdParty];
  [(UARPActiveFirmwareAnalyticsEvent *)self setShare3rdParty:v5];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<Model Name = %@>, ", self->_modelName];
  [v3 appendFormat:@"<Active Firmware Version = %@>", self->_activeFirmwareVersion];
  return +[NSString stringWithString:v3];
}

- (NSString)manufacturerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)downloadURL
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDownloadURL:(id)a3
{
}

- (NSString)activeFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActiveFirmwareVersion:(id)a3
{
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (int64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(int64_t)a3
{
  self->_channelType = a3;
}

- (BOOL)share3rdParty
{
  return self->_share3rdParty;
}

- (void)setShare3rdParty:(BOOL)a3
{
  self->_share3rdParty = a3;
}

@end