@interface NLSeymourAvailabilityProvider
- (NLSeymourAvailabilityProvider)init;
- (NLSeymourAvailabilityProvider)initWithDependenciesWrapper:(id)a3;
- (id)observers;
- (int64_t)availability;
- (void)addObserver:(id)a3;
- (void)notifyObservers;
- (void)removeObserver:(id)a3;
- (void)setAvailability:(int64_t)a3;
- (void)setObservers:(id)a3;
- (void)update;
@end

@implementation NLSeymourAvailabilityProvider

- (int64_t)availability
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___NLSeymourAvailabilityProvider_availability);
  swift_beginAccess();
  return *v2;
}

- (void)setAvailability:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___NLSeymourAvailabilityProvider_availability);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (id)observers
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___NLSeymourAvailabilityProvider_observers);
  swift_beginAccess();
  return *v2;
}

- (void)setObservers:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___NLSeymourAvailabilityProvider_observers);
  swift_beginAccess();
  v5 = *v4;
  int64_t *v4 = a3;
  id v6 = a3;
}

- (NLSeymourAvailabilityProvider)initWithDependenciesWrapper:(id)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for SeymourAvailabilityProvider());
  swift_retain();
  v4 = (NLSeymourAvailabilityProvider *)SeymourAvailabilityProvider.init(dependencies:)();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (NLSeymourAvailabilityProvider)init
{
  result = (NLSeymourAvailabilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NLSeymourAvailabilityProvider_subscriptionClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NLSeymourAvailabilityProvider_contentAvailabilityClient);
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NLSeymourAvailabilityProvider_observers);
}

- (void)update
{
  v2 = self;
  SeymourAvailabilityProvider.update()();
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
  SeymourAvailabilityProvider.notifyObservers()();
}

@end