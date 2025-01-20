@interface AirplaneModeConfiguration
- (_TtC13TranslationUI25AirplaneModeConfiguration)init;
- (void)airplaneModeChanged;
- (void)dealloc;
@end

@implementation AirplaneModeConfiguration

- (_TtC13TranslationUI25AirplaneModeConfiguration)init
{
  return (_TtC13TranslationUI25AirplaneModeConfiguration *)AirplaneModeConfiguration.init()();
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration_reachability);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    SCNetworkReachabilitySetCallback(v5, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(v5, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AirplaneModeConfiguration();
  [(AirplaneModeConfiguration *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration_radiosPreferences));
  v3 = (char *)self + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration___enabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA4E248);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration___reachable, v4);
  swift_release();
}

- (void)airplaneModeChanged
{
  v2 = self;
  AirplaneModeConfiguration.airplaneModeChanged()();
}

@end