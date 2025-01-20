@interface MRDCreateEndpointAnalytics
- (MRDCreateEndpointAnalytics)init;
- (MRDCreateEndpointAnalytics)initWithRequestID:(id)a3;
- (MRDTimingEvent)createHostedEndpoint;
- (MRDTimingEvent)createRemoteHostedEndpoint;
- (MRDTimingEvent)modifyOutputContext;
- (NSString)operationTypeString;
- (NSString)requestID;
- (int64_t)operationType;
- (void)setCreateHostedEndpoint:(id)a3;
- (void)setCreateRemoteHostedEndpoint:(id)a3;
- (void)setModifyOutputContext:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setOperationTypeString:(id)a3;
- (void)setRequestID:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDCreateEndpointAnalytics

- (NSString)requestID
{
  return (NSString *)sub_10027068C();
}

- (void)setRequestID:(id)a3
{
}

- (int64_t)operationType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateEndpointAnalytics_operationType);
  swift_beginAccess();
  return *v2;
}

- (void)setOperationType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateEndpointAnalytics_operationType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)operationTypeString
{
  return (NSString *)sub_10027068C();
}

- (void)setOperationTypeString:(id)a3
{
}

- (MRDTimingEvent)createHostedEndpoint
{
  v2 = self;
  id v3 = sub_10026CC78();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createHostedEndpoint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createRemoteHostedEndpoint
{
  v2 = self;
  id v3 = sub_10026CD00();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateRemoteHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)modifyOutputContext
{
  v2 = self;
  id v3 = sub_10026CD88();

  return (MRDTimingEvent *)v3;
}

- (void)setModifyOutputContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___modifyOutputContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___modifyOutputContext) = (Class)a3;
  id v3 = a3;
}

- (MRDCreateEndpointAnalytics)initWithRequestID:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (MRDCreateEndpointAnalytics *)sub_10026D16C(v3, v4);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDCreateEndpointAnalytics)init
{
  result = (MRDCreateEndpointAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createHostedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint));
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___modifyOutputContext);
}

@end