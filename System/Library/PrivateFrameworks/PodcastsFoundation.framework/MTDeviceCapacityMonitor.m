@interface MTDeviceCapacityMonitor
+ (MTDeviceCapacityMonitor)shared;
- (MTDeviceCapacityMonitor)init;
- (NSString)activeNotificationName;
- (int64_t)addCapacityChangeObserverWithOptions:(int64_t)a3 callback:(id)a4;
- (void)capacityLevel:(id)a3;
- (void)dealloc;
- (void)removeCapacityChangeObserverWith:(int64_t)a3;
- (void)setActiveNotificationName:(id)a3;
@end

@implementation MTDeviceCapacityMonitor

+ (MTDeviceCapacityMonitor)shared
{
  if (qword_1EB767B50 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB767B40;
  return (MTDeviceCapacityMonitor *)v2;
}

- (NSString)activeNotificationName
{
  v3 = (os_unfair_lock_s **)((char *)self + OBJC_IVAR___MTDeviceCapacityMonitor__activeNotificationName);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void **)&(*v3)[4];
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 6);
  sub_1ACE6E704(v5, &v9);
  os_unfair_lock_unlock(v4 + 6);
  v7 = v9;

  swift_release();
  return (NSString *)v7;
}

- (void)setActiveNotificationName:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1ACE6F08C(a3);
}

- (void)capacityLevel:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1ACE6EB30((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)dealloc
{
  v2 = self;
  DeviceCapacityMonitor.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR___MTDeviceCapacityMonitor_url;
  uint64_t v4 = sub_1ACE74F28();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (int64_t)addCapacityChangeObserverWithOptions:(int64_t)a3 callback:(id)a4
{
  char v4 = a3;
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  int64_t v8 = sub_1ACE6EF1C(v4, (uint64_t)v7, v6);
  _Block_release(v6);
  _Block_release(v6);

  return v8;
}

- (void)removeCapacityChangeObserverWith:(int64_t)a3
{
  v3 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___MTDeviceCapacityMonitor__capacityChangeObservers);
  char v4 = self;
  swift_retain();
  os_unfair_lock_lock(v3 + 6);
  sub_1ACE6F6C8((uint64_t)&v3[4]);
  os_unfair_lock_unlock(v3 + 6);

  swift_release();
}

- (MTDeviceCapacityMonitor)init
{
  result = (MTDeviceCapacityMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end