@interface PXLemonadeFeatureAvailabilityMonitor
+ (unint64_t)stateChangedChangeDescriptor;
- (PXLemonadeFeatureAvailabilityMonitor)init;
- (PXObservable)observable;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation PXLemonadeFeatureAvailabilityMonitor

+ (unint64_t)stateChangedChangeDescriptor
{
  return 1;
}

- (PXObservable)observable
{
  return (PXObservable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor_observable));
}

- (int64_t)state
{
  swift_getKeyPath();
  sub_1AA829C48(&qword_1E981E1D8, (void (*)(uint64_t))type metadata accessor for LemonadeFeatureAvailabilityMonitor);
  v3 = self;
  sub_1AB230B6C();
  swift_release();
  int64_t v4 = *(int64_t *)((char *)&v3->super.isa + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor___state);

  return v4;
}

- (void)setState:(int64_t)a3
{
  int64_t v4 = self;
  sub_1AA823F5C(a3);
}

- (PXLemonadeFeatureAvailabilityMonitor)init
{
  result = (PXLemonadeFeatureAvailabilityMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor_highlightAnalysisStatus));
  swift_unknownObjectRelease();

  sub_1AA829D44((uint64_t)self + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor____lazy_storage___updateInterval, &qword_1E9820698, MEMORY[0x1E4FBCAF0]);
  v3 = (char *)self + OBJC_IVAR___PXLemonadeFeatureAvailabilityMonitor___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end