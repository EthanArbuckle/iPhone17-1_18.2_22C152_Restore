@interface WKUIAssetLoadStatusProvider
- (WKUIAssetLoadStatusProvider)init;
- (WKUIAssetLoadStatusProvider)initWithWorkoutIdentifier:(id)a3 dependencies:(id)a4 assetLoadStatus:(int64_t)a5 bundleReason:(int64_t)a6;
- (int64_t)assetLoadStatus;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAssetLoadStatus:(int64_t)a3;
@end

@implementation WKUIAssetLoadStatusProvider

- (int64_t)assetLoadStatus
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___WKUIAssetLoadStatusProvider_assetLoadStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetLoadStatus:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___WKUIAssetLoadStatusProvider_assetLoadStatus);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (WKUIAssetLoadStatusProvider)initWithWorkoutIdentifier:(id)a3 dependencies:(id)a4 assetLoadStatus:(int64_t)a5 bundleReason:(int64_t)a6
{
  uint64_t v8 = sub_261B8F0F8();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)((char *)a4 + OBJC_IVAR___SMDependencies_dependencies);
  id v12 = objc_allocWithZone((Class)type metadata accessor for WorkoutAssetLoadStatusProvider());
  swift_retain();
  v13 = WorkoutAssetLoadStatusProvider.init(workoutIdentifier:dependencies:assetLoadStatus:bundleReason:)(v8, v10, v11, a5, 2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (WKUIAssetLoadStatusProvider *)v13;
}

- (WKUIAssetLoadStatusProvider)init
{
  result = (WKUIAssetLoadStatusProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___WKUIAssetLoadStatusProvider_assetClient);
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WKUIAssetLoadStatusProvider_observers);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

@end