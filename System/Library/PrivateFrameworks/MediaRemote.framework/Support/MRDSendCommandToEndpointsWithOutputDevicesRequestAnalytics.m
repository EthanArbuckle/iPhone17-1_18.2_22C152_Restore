@interface MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics
- (BOOL)requestContainsLocalDeviceUID;
- (BOOL)requestForCompanionOrigin;
- (BOOL)requestForCurrentConfiguration;
- (BOOL)requestForLocalOrigin;
- (BOOL)tracked;
- (MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics)init;
- (MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics)initWithDetails:(id)a3 deviceInfo:(id)a4 numberOfRequestedOutputDeviceUIDs:(int64_t)a5 timeout:(double)a6;
- (MRDTimingEvent)discoverOutputDevices;
- (MRDTimingEvent)sendCommands;
- (MRDeviceInfo)deviceInfo;
- (MRRequestDetails)details;
- (NSString)commandString;
- (double)timeout;
- (int64_t)command;
- (int64_t)numberOfDiscoveredOutputDeviceUIDs;
- (int64_t)numberOfEndpoints;
- (int64_t)numberOfErrorsAtCompletion;
- (int64_t)numberOfErrorsAtTimeout;
- (int64_t)numberOfMissingOutputDeviceUIDs;
- (int64_t)numberOfPendingAtTimeout;
- (int64_t)numberOfRequestedOutputDeviceUIDs;
- (int64_t)numberOfSuccessAtCompletion;
- (int64_t)numberOfSuccessAtTimeout;
- (void)setCommand:(int64_t)a3;
- (void)setCommandString:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoverOutputDevices:(id)a3;
- (void)setNumberOfDiscoveredOutputDeviceUIDs:(int64_t)a3;
- (void)setNumberOfEndpoints:(int64_t)a3;
- (void)setNumberOfErrorsAtCompletion:(int64_t)a3;
- (void)setNumberOfErrorsAtTimeout:(int64_t)a3;
- (void)setNumberOfMissingOutputDeviceUIDs:(int64_t)a3;
- (void)setNumberOfPendingAtTimeout:(int64_t)a3;
- (void)setNumberOfRequestedOutputDeviceUIDs:(int64_t)a3;
- (void)setNumberOfSuccessAtCompletion:(int64_t)a3;
- (void)setNumberOfSuccessAtTimeout:(int64_t)a3;
- (void)setRequestContainsLocalDeviceUID:(BOOL)a3;
- (void)setRequestForCompanionOrigin:(BOOL)a3;
- (void)setRequestForCurrentConfiguration:(BOOL)a3;
- (void)setRequestForLocalOrigin:(BOOL)a3;
- (void)setSendCommands:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTracked:(BOOL)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics

- (MRRequestDetails)details
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_details);
  swift_beginAccess();
  return (MRRequestDetails *)*v2;
}

- (void)setDetails:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_deviceInfo);
  swift_beginAccess();
  return (MRDeviceInfo *)*v2;
}

- (void)setDeviceInfo:(id)a3
{
}

- (int64_t)command
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_command);
  swift_beginAccess();
  return *v2;
}

- (void)setCommand:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_command);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)commandString
{
  return (NSString *)sub_10027068C();
}

- (void)setCommandString:(id)a3
{
}

- (BOOL)requestContainsLocalDeviceUID
{
  v2 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestContainsLocalDeviceUID:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requestForCurrentConfiguration
{
  v2 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestForCurrentConfiguration:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requestForLocalOrigin
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestForLocalOrigin;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestForLocalOrigin:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestForLocalOrigin;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requestForCompanionOrigin
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestForCompanionOrigin;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestForCompanionOrigin:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_requestForCompanionOrigin;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)numberOfRequestedOutputDeviceUIDs
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfRequestedOutputDeviceUIDs:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfDiscoveredOutputDeviceUIDs
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfDiscoveredOutputDeviceUIDs);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfDiscoveredOutputDeviceUIDs:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfDiscoveredOutputDeviceUIDs);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfMissingOutputDeviceUIDs
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfMissingOutputDeviceUIDs);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfMissingOutputDeviceUIDs:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfMissingOutputDeviceUIDs);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfEndpoints
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfEndpoints);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfEndpoints:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfEndpoints);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfPendingAtTimeout
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfPendingAtTimeout);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfPendingAtTimeout:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfPendingAtTimeout);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfErrorsAtTimeout
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfErrorsAtTimeout);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfErrorsAtTimeout:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfErrorsAtTimeout);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfErrorsAtCompletion
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfErrorsAtCompletion);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfErrorsAtCompletion:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfErrorsAtCompletion);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfSuccessAtTimeout
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfSuccessAtTimeout);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfSuccessAtTimeout:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfSuccessAtTimeout);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfSuccessAtCompletion
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfSuccessAtCompletion);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfSuccessAtCompletion:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_numberOfSuccessAtCompletion);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (double)timeout
{
  v2 = (double *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_timeout);
  swift_beginAccess();
  return *v2;
}

- (void)setTimeout:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_timeout);
  swift_beginAccess();
  double *v4 = a3;
}

- (MRDTimingEvent)discoverOutputDevices
{
  v2 = self;
  id v3 = sub_100270F9C();

  return (MRDTimingEvent *)v3;
}

- (void)setDiscoverOutputDevices:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics____lazy_storage___discoverOutputDevices);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics____lazy_storage___discoverOutputDevices) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)sendCommands
{
  v2 = self;
  id v3 = sub_100271024();

  return (MRDTimingEvent *)v3;
}

- (void)setSendCommands:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics____lazy_storage___sendCommands);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics____lazy_storage___sendCommands) = (Class)a3;
  id v3 = a3;
}

- (BOOL)tracked
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_tracked;
  swift_beginAccess();
  return *v2;
}

- (void)setTracked:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_tracked;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics)initWithDetails:(id)a3 deviceInfo:(id)a4 numberOfRequestedOutputDeviceUIDs:(int64_t)a5 timeout:(double)a6
{
  return (MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)sub_100271854((uint64_t)a3, (uint64_t)a4, a5, a6);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics)init
{
  result = (MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_details));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics_deviceInfo));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics____lazy_storage___discoverOutputDevices));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics____lazy_storage___sendCommands);
}

@end