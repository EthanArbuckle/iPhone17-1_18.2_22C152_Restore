@interface PodcastsApplicationStateMonitor
+ (PodcastsApplicationStateMonitor)shared;
+ (id)descriptionForState:(unint64_t)a3;
- (BOOL)isActive;
- (BOOL)isBackground;
- (BOOL)isUnknown;
- (PodcastsApplicationStateMonitor)init;
- (unint64_t)currentState;
- (void)updateCurrentState:(unint64_t)a3;
@end

@implementation PodcastsApplicationStateMonitor

+ (PodcastsApplicationStateMonitor)shared
{
  if (qword_1EB76F6C0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB76F6B0;
  return (PodcastsApplicationStateMonitor *)v2;
}

- (unint64_t)currentState
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1ACA30C84(v3, &v8);
  os_unfair_lock_unlock(v4);
  unint64_t v6 = v8;

  return v6;
}

- (BOOL)isActive
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1ACA30C84(v3, &v8);
  os_unfair_lock_unlock(v4);
  uint64_t v6 = v8;

  return v6 == 1;
}

- (BOOL)isBackground
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1ACA30C84(v3, &v8);
  os_unfair_lock_unlock(v4);
  uint64_t v6 = v8;

  return v6 == 2;
}

- (BOOL)isUnknown
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1ACA30C84(v3, &v8);
  os_unfair_lock_unlock(v4);
  uint64_t v6 = v8;

  return v6 == 0;
}

- (void)updateCurrentState:(unint64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PodcastsApplicationStateMonitor_applicationState);
  v4 = (void *)(v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + 24);
  uint64_t v6 = self;
  os_unfair_lock_lock(v5);
  sub_1ACBDEA60(v4);
  os_unfair_lock_unlock(v5);
}

+ (id)descriptionForState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      uint64_t v3 = (void *)sub_1ACE76178();
      swift_bridgeObjectRelease();
      return v3;
    default:
      sub_1ACE77A18();
      __break(1u);
      JUMPOUT(0x1ACBDE058);
  }
}

- (PodcastsApplicationStateMonitor)init
{
  return (PodcastsApplicationStateMonitor *)ApplicationStateMonitor.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end