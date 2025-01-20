@interface DIPDeviceInfo.DIPNFHardwareMonitor
- (_TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor)init;
- (void)hardwareStateDidChange;
@end

@implementation DIPDeviceInfo.DIPNFHardwareMonitor

- (void)hardwareStateDidChange
{
  v2 = self;
  sub_1004EAF78();
}

- (_TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor)init
{
  uint64_t v3 = OBJC_IVAR____TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor_notified;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)dispatch_semaphore_create(0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DIPDeviceInfo.DIPNFHardwareMonitor();
  return [(DIPDeviceInfo.DIPNFHardwareMonitor *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor_notified));
}

@end