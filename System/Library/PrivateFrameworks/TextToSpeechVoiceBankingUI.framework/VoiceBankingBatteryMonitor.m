@interface VoiceBankingBatteryMonitor
- (void)batteryStateChanged;
@end

@implementation VoiceBankingBatteryMonitor

- (void)batteryStateChanged
{
  v3 = self;
  swift_retain();
  id v4 = objc_msgSend(v3, sel_currentDevice);
  id v5 = objc_msgSend(v4, sel_batteryState);

  (*((void (**)(BOOL))self->super.isa + 12))(v5 != (id)1);

  swift_release();
}

@end