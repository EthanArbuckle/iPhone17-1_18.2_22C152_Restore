@interface UARPUpdateFirmwareAnalyticsEvent
- (BOOL)share3rdParty;
- (NSNumber)applyDuration;
- (NSNumber)applyUserInitiated;
- (NSNumber)applyVendorError;
- (NSNumber)downloadConsentDuration;
- (NSNumber)downloadUserInitiated;
- (NSNumber)stagingDuration;
- (NSNumber)stagingIterations;
- (NSNumber)stagingUserInitiated;
- (NSNumber)stagingVendorError;
- (NSString)activeFirmwareVersion;
- (NSString)countryCode;
- (NSString)downloadURL;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)postedFirmwareVersion;
- (id)description;
- (int64_t)applyStatus;
- (int64_t)channelType;
- (int64_t)downloadStatus;
- (int64_t)stagingStatus;
- (int64_t)transport;
- (void)dealloc;
- (void)send;
- (void)setActiveFirmwareVersion:(id)a3;
- (void)setApplyDuration:(id)a3;
- (void)setApplyStatus:(int64_t)a3;
- (void)setApplyUserInitiated:(id)a3;
- (void)setApplyVendorError:(id)a3;
- (void)setChannelType:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setDownloadConsentDuration:(id)a3;
- (void)setDownloadStatus:(int64_t)a3;
- (void)setDownloadURL:(id)a3;
- (void)setDownloadUserInitiated:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setPostedFirmwareVersion:(id)a3;
- (void)setShare3rdParty:(BOOL)a3;
- (void)setStagingDuration:(id)a3;
- (void)setStagingIterations:(id)a3;
- (void)setStagingStatus:(int64_t)a3;
- (void)setStagingUserInitiated:(id)a3;
- (void)setStagingVendorError:(id)a3;
- (void)setTransport:(int64_t)a3;
- (void)updateWithAccessoryID:(id)a3 assetID:(id)a4;
- (void)updateWithFrameworkParams:(id)a3;
@end

@implementation UARPUpdateFirmwareAnalyticsEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPUpdateFirmwareAnalyticsEvent;
  [(UARPUpdateFirmwareAnalyticsEvent *)&v3 dealloc];
}

- (void)send
{
}

- (void)updateWithAccessoryID:(id)a3 assetID:(id)a4
{
  -[UARPUpdateFirmwareAnalyticsEvent setManufacturerName:](self, "setManufacturerName:", [a3 manufacturer]);
  -[UARPUpdateFirmwareAnalyticsEvent setModelName:](self, "setModelName:", [a3 modelAnalytics]);
  -[UARPUpdateFirmwareAnalyticsEvent setActiveFirmwareVersion:](self, "setActiveFirmwareVersion:", [a3 firmwareVersion]);
  -[UARPUpdateFirmwareAnalyticsEvent setTransport:](self, "setTransport:", [a3 transport]);
  -[UARPUpdateFirmwareAnalyticsEvent setCountryCode:](self, "setCountryCode:", [a3 countryCode]);
  -[UARPUpdateFirmwareAnalyticsEvent setPostedFirmwareVersion:](self, "setPostedFirmwareVersion:", [a4 assetVersion]);
  -[UARPUpdateFirmwareAnalyticsEvent setDownloadURL:](self, "setDownloadURL:", objc_msgSend(objc_msgSend(a4, "remoteURL"), "path"));
  id v7 = [a3 shareAnalyticsEventsWithThirdParty];
  [(UARPUpdateFirmwareAnalyticsEvent *)self setShare3rdParty:v7];
}

- (void)updateWithFrameworkParams:(id)a3
{
  -[UARPUpdateFirmwareAnalyticsEvent setStagingUserInitiated:](self, "setStagingUserInitiated:", [a3 stagingUserInitiated]);
  -[UARPUpdateFirmwareAnalyticsEvent setStagingDuration:](self, "setStagingDuration:", [a3 stagingDuration]);
  -[UARPUpdateFirmwareAnalyticsEvent setStagingIterations:](self, "setStagingIterations:", [a3 stagingIterations]);
  -[UARPUpdateFirmwareAnalyticsEvent setStagingStatus:](self, "setStagingStatus:", objc_msgSend(objc_msgSend(a3, "stagingStatus"), "integerValue"));
  -[UARPUpdateFirmwareAnalyticsEvent setStagingVendorError:](self, "setStagingVendorError:", [a3 stagingVendorError]);
  -[UARPUpdateFirmwareAnalyticsEvent setApplyUserInitiated:](self, "setApplyUserInitiated:", [a3 applyUserInitiated]);
  -[UARPUpdateFirmwareAnalyticsEvent setApplyDuration:](self, "setApplyDuration:", [a3 applyDuration]);
  -[UARPUpdateFirmwareAnalyticsEvent setApplyStatus:](self, "setApplyStatus:", objc_msgSend(objc_msgSend(a3, "applyStatus"), "integerValue"));
  id v5 = [a3 applyVendorError];
  [(UARPUpdateFirmwareAnalyticsEvent *)self setApplyVendorError:v5];
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<Model Name = %@>, ", self->_modelName];
  [v3 appendFormat:@"<Active Firmware Version = %@>, ", self->_activeFirmwareVersion];
  [v3 appendFormat:@"<Download URL = %@>", self->_downloadURL];
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

- (NSString)activeFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
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

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)postedFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPostedFirmwareVersion:(id)a3
{
}

- (NSString)downloadURL
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDownloadURL:(id)a3
{
}

- (int64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(int64_t)a3
{
  self->_channelType = a3;
}

- (NSNumber)downloadConsentDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDownloadConsentDuration:(id)a3
{
}

- (NSNumber)downloadUserInitiated
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDownloadUserInitiated:(id)a3
{
}

- (int64_t)downloadStatus
{
  return self->_downloadStatus;
}

- (void)setDownloadStatus:(int64_t)a3
{
  self->_downloadStatus = a3;
}

- (NSNumber)stagingUserInitiated
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStagingUserInitiated:(id)a3
{
}

- (NSNumber)stagingDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStagingDuration:(id)a3
{
}

- (NSNumber)stagingIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStagingIterations:(id)a3
{
}

- (int64_t)stagingStatus
{
  return self->_stagingStatus;
}

- (void)setStagingStatus:(int64_t)a3
{
  self->_stagingStatus = a3;
}

- (NSNumber)stagingVendorError
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStagingVendorError:(id)a3
{
}

- (NSNumber)applyUserInitiated
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setApplyUserInitiated:(id)a3
{
}

- (NSNumber)applyDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setApplyDuration:(id)a3
{
}

- (int64_t)applyStatus
{
  return self->_applyStatus;
}

- (void)setApplyStatus:(int64_t)a3
{
  self->_applyStatus = a3;
}

- (NSNumber)applyVendorError
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setApplyVendorError:(id)a3
{
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