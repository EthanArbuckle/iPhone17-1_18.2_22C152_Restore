@interface PMDeviceSharingAvailability
- (NSArray)devicesWithSharingAvailable;
- (NSArray)devicesWithSharingUnavailable;
- (PMDeviceSharingAvailability)init;
- (PMDeviceSharingAvailability)initWithDevicesWithSharingAvailable:(id)a3 devicesWithSharingUnavailable:(id)a4;
@end

@implementation PMDeviceSharingAvailability

- (NSArray)devicesWithSharingAvailable
{
  return (NSArray *)sub_258B02A20((uint64_t)self);
}

- (NSArray)devicesWithSharingUnavailable
{
  return (NSArray *)sub_258B02A20((uint64_t)self);
}

- (PMDeviceSharingAvailability)initWithDevicesWithSharingAvailable:(id)a3 devicesWithSharingUnavailable:(id)a4
{
  type metadata accessor for PMDevice((uint64_t)self);
  v5 = (objc_class *)sub_258D6F6D8();
  v6 = (objc_class *)sub_258D6F6D8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PMDeviceSharingAvailability_devicesWithSharingAvailable) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PMDeviceSharingAvailability_devicesWithSharingUnavailable) = v6;
  v8.receiver = self;
  v8.super_class = (Class)PMDeviceSharingAvailability;
  return [(PMDeviceSharingAvailability *)&v8 init];
}

- (PMDeviceSharingAvailability)init
{
  result = (PMDeviceSharingAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end