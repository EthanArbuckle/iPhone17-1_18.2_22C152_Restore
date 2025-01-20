@interface TSAppMonitor
- (BOOL)isActive;
- (BOOL)isTracking;
- (TSAppMonitor)init;
- (id)onWindowDidBecomeBackgroundWithBlock:(id)a3;
- (id)onWindowWillBecomeForegroundWithBlock:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsTracking:(BOOL)a3;
- (void)triggerWithEvent:(int64_t)a3;
@end

@implementation TSAppMonitor

- (BOOL)isActive
{
  return AppMonitor.isActive.getter() & 1;
}

- (void)setIsActive:(BOOL)a3
{
}

- (BOOL)isTracking
{
  return AppMonitor.isTracking.getter() & 1;
}

- (void)setIsTracking:(BOOL)a3
{
}

- (id)onWindowDidBecomeBackgroundWithBlock:(id)a3
{
  return sub_1B6016154(self, (int)a2, a3, (uint64_t)&unk_1F0F107A8, (uint64_t)sub_1B5EAA464, (void (*)(uint64_t, uint64_t))AppMonitor.onWindowDidBecomeBackground(block:));
}

- (id)onWindowWillBecomeForegroundWithBlock:(id)a3
{
  return sub_1B6016154(self, (int)a2, a3, (uint64_t)&unk_1F0F10780, (uint64_t)sub_1B5EA9C18, (void (*)(uint64_t, uint64_t))AppMonitor.onWindowWillBecomeForeground(block:));
}

- (void)triggerWithEvent:(int64_t)a3
{
  v4 = self;
  AppMonitor.trigger(event:)(a3);
}

- (TSAppMonitor)init
{
  return (TSAppMonitor *)AppMonitor.init()();
}

- (void).cxx_destruct
{
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TSAppMonitor_onWindowDidBecomeBackgroundBlock));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TSAppMonitor_onWindowWillBecomeForegroundBlock);
  sub_1B5E3799C(v3);
}

@end