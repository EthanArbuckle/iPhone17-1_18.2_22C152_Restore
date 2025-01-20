@interface MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics
- (BOOL)requestContainsLocalDeviceUID;
- (BOOL)requestForCompanionOrigin;
- (BOOL)requestForCurrentConfiguration;
- (BOOL)requestForLocalOrigin;
- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)init;
- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)initWithDetails:(id)a3 deviceInfo:(id)a4 numberOfRequestedOutputDeviceUIDs:(int64_t)a5 timeout:(double)a6;
- (MRDTimingEvent)connect;
- (MRDTimingEvent)createEndpointWithCurrentTopology;
- (MRDTimingEvent)createOptimizedEndpoint;
- (MRDTimingEvent)createPartialEndpoint;
- (MRDTimingEvent)sendCommand;
- (MRDeviceInfo)deviceInfo;
- (MRRequestDetails)details;
- (NSString)commandString;
- (double)timeout;
- (int64_t)command;
- (int64_t)numberOfRequestedOutputDeviceUIDs;
- (void)setCommand:(int64_t)a3;
- (void)setCommandString:(id)a3;
- (void)setConnect:(id)a3;
- (void)setCreateEndpointWithCurrentTopology:(id)a3;
- (void)setCreateOptimizedEndpoint:(id)a3;
- (void)setCreatePartialEndpoint:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setNumberOfRequestedOutputDeviceUIDs:(int64_t)a3;
- (void)setRequestContainsLocalDeviceUID:(BOOL)a3;
- (void)setRequestForCompanionOrigin:(BOOL)a3;
- (void)setRequestForCurrentConfiguration:(BOOL)a3;
- (void)setRequestForLocalOrigin:(BOOL)a3;
- (void)setSendCommand:(id)a3;
- (void)setTimeout:(double)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics

- (MRRequestDetails)details
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_details);
  swift_beginAccess();
  return (MRRequestDetails *)*v2;
}

- (void)setDetails:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_deviceInfo);
  swift_beginAccess();
  return (MRDeviceInfo *)*v2;
}

- (void)setDeviceInfo:(id)a3
{
}

- (int64_t)command
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_command);
  swift_beginAccess();
  return *v2;
}

- (void)setCommand:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_command);
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
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestContainsLocalDeviceUID:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestContainsLocalDeviceUID;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requestForCurrentConfiguration
{
  v2 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestForCurrentConfiguration:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCurrentConfiguration;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requestForLocalOrigin
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForLocalOrigin;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestForLocalOrigin:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForLocalOrigin;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requestForCompanionOrigin
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCompanionOrigin;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestForCompanionOrigin:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_requestForCompanionOrigin;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)numberOfRequestedOutputDeviceUIDs
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfRequestedOutputDeviceUIDs:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_numberOfRequestedOutputDeviceUIDs);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (double)timeout
{
  v2 = (double *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_timeout);
  swift_beginAccess();
  return *v2;
}

- (void)setTimeout:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_timeout);
  swift_beginAccess();
  double *v4 = a3;
}

- (MRDTimingEvent)createOptimizedEndpoint
{
  v2 = self;
  id v3 = sub_10026F358();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateOptimizedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createOptimizedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createOptimizedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createEndpointWithCurrentTopology
{
  v2 = self;
  id v3 = sub_10026F3E0();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateEndpointWithCurrentTopology:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createEndpointWithCurrentTopology);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createEndpointWithCurrentTopology) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createPartialEndpoint
{
  v2 = self;
  id v3 = sub_10026F468();

  return (MRDTimingEvent *)v3;
}

- (void)setCreatePartialEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createPartialEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createPartialEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)connect
{
  v2 = self;
  id v3 = sub_10026F4F0();

  return (MRDTimingEvent *)v3;
}

- (void)setConnect:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___connect);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___connect) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)sendCommand
{
  v2 = self;
  id v3 = sub_10026F578();

  return (MRDTimingEvent *)v3;
}

- (void)setSendCommand:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___sendCommand);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___sendCommand) = (Class)a3;
  id v3 = a3;
}

- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)initWithDetails:(id)a3 deviceInfo:(id)a4 numberOfRequestedOutputDeviceUIDs:(int64_t)a5 timeout:(double)a6
{
  return (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)sub_1002700C8((uint64_t)a3, (uint64_t)a4, a5, a6);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics)init
{
  result = (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_details));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics_deviceInfo));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createOptimizedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createEndpointWithCurrentTopology));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___createPartialEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___connect));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics____lazy_storage___sendCommand);
}

@end