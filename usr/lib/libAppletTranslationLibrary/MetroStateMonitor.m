@interface MetroStateMonitor
+ (_TtC24AppletTranslationLibrary17MetroStateMonitor)shared;
- (BOOL)inMetro;
- (_TtC24AppletTranslationLibrary17MetroStateMonitor)init;
- (void)consumeStateWithAid:(id)a3 newState:(BOOL)a4;
@end

@implementation MetroStateMonitor

+ (_TtC24AppletTranslationLibrary17MetroStateMonitor)shared
{
  if (qword_1EA608690 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA60A488;

  return (_TtC24AppletTranslationLibrary17MetroStateMonitor *)v2;
}

- (BOOL)inMetro
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24AppletTranslationLibrary17MetroStateMonitor_state);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_1CA5BA868((unsigned char *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  BOOL v4 = v6;

  swift_release();
  return v4;
}

- (void)consumeStateWithAid:(id)a3 newState:(BOOL)a4
{
  uint64_t v5 = sub_1CA5FD8A8();
  unint64_t v7 = v6;
  v8 = self;
  sub_1CA5BA874(v5, v7);

  swift_bridgeObjectRelease();
}

- (_TtC24AppletTranslationLibrary17MetroStateMonitor)init
{
  return (_TtC24AppletTranslationLibrary17MetroStateMonitor *)sub_1CA5BAB0C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24AppletTranslationLibrary17MetroStateMonitor_userDefaults));
  v3 = (char *)self + OBJC_IVAR____TtC24AppletTranslationLibrary17MetroStateMonitor_subscriber;

  sub_1CA5B858C((uint64_t)v3);
}

@end