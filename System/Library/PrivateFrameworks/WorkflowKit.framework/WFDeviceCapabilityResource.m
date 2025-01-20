@interface WFDeviceCapabilityResource
+ (BOOL)mustBeAvailableForDisplay;
- (_TtC11WorkflowKit26WFDeviceCapabilityResource)init;
- (_TtC11WorkflowKit26WFDeviceCapabilityResource)initWithDefinition:(id)a3;
- (_TtC11WorkflowKit26WFDeviceCapabilityResource)initWithMobileGestaltKey:(id)a3 value:(BOOL)a4;
- (void)refreshAvailability;
@end

@implementation WFDeviceCapabilityResource

- (_TtC11WorkflowKit26WFDeviceCapabilityResource)initWithMobileGestaltKey:(id)a3 value:(BOOL)a4
{
  uint64_t v5 = sub_1C8532658();
  return (_TtC11WorkflowKit26WFDeviceCapabilityResource *)WFDeviceCapabilityResource.init(mobileGestaltKey:value:)(v5, v6, a4);
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)refreshAvailability
{
  v2 = self;
  sub_1C8297A78();
}

- (_TtC11WorkflowKit26WFDeviceCapabilityResource)initWithDefinition:(id)a3
{
  if (a3) {
    sub_1C8532538();
  }
  WFDeviceCapabilityResource.init(definition:)();
}

- (_TtC11WorkflowKit26WFDeviceCapabilityResource)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11WorkflowKit26WFDeviceCapabilityResource_capability;
  uint64_t v3 = sub_1C8531B08();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end