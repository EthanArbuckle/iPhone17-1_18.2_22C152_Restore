@interface NLExternalSeymourSessionStatusProvider
- (BOOL)externalSessionActive;
- (NLExternalSeymourSessionStatusProvider)init;
- (NLExternalSeymourSessionStatusProvider)initWithDependenciesWrapper:(id)a3 appBundleIdentifier:(id)a4;
- (id)observers;
- (void)addObserver:(id)a3;
- (void)notifyObservers;
- (void)removeObserver:(id)a3;
- (void)setExternalSessionActive:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)updateStatus;
@end

@implementation NLExternalSeymourSessionStatusProvider

- (BOOL)externalSessionActive
{
  v2 = (BOOL *)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_isExternalSessionActive;
  swift_beginAccess();
  return *v2;
}

- (void)setExternalSessionActive:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_isExternalSessionActive;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (id)observers
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_observers);
  swift_beginAccess();
  return *v2;
}

- (void)setObservers:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_observers);
  swift_beginAccess();
  v5 = *v4;
  BOOL *v4 = a3;
  id v6 = a3;
}

- (NLExternalSeymourSessionStatusProvider)initWithDependenciesWrapper:(id)a3 appBundleIdentifier:(id)a4
{
  uint64_t v4 = sub_261B8F0F8();
  uint64_t v6 = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for ExternalSeymourSessionStatusProvider());
  uint64_t v8 = swift_retain();
  v9 = (NLExternalSeymourSessionStatusProvider *)ExternalSeymourSessionStatusProvider.init(dependencies:appBundleIdentifier:)(v8, v4, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (NLExternalSeymourSessionStatusProvider)init
{
  result = (NLExternalSeymourSessionStatusProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_sessionClient);
  swift_release();
  v3 = (char *)self + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_lastUpdateTimestamp;
  uint64_t v4 = sub_261B8ADD8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NLExternalSeymourSessionStatusProvider_observers);
}

- (void)updateStatus
{
  v2 = self;
  ExternalSeymourSessionStatusProvider.updateStatus()();
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObservers
{
  v2 = self;
  ExternalSeymourSessionStatusProvider.notifyObservers()();
}

@end