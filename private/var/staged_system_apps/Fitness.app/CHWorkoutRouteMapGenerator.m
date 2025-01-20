@interface CHWorkoutRouteMapGenerator
- (CHWorkoutRouteMapGenerator)init;
- (CHWorkoutRouteMapGenerator)initWithPathRendererClass:(Class)a3;
- (HKLocationReadings)locationReadings;
- (MKMapSnapshotter)mapSnapshotter;
- (void)configureForDive;
- (void)setLocationReadings:(id)a3;
- (void)setMapSize:(CGSize)a3;
- (void)setMapSnapshotter:(id)a3;
- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 insets:(UIEdgeInsets)a6 completion:(id)a7;
@end

@implementation CHWorkoutRouteMapGenerator

- (HKLocationReadings)locationReadings
{
  return (HKLocationReadings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings));
}

- (void)setLocationReadings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings) = (Class)a3;
  id v3 = a3;
}

- (MKMapSnapshotter)mapSnapshotter
{
  return (MKMapSnapshotter *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter));
}

- (void)setMapSnapshotter:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter) = (Class)a3;
  id v3 = a3;
}

- (CHWorkoutRouteMapGenerator)initWithPathRendererClass:(Class)a3
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_isForDive) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_pinWidth) = (Class)0x402E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter) = 0;
  v5 = (char *)self + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_pathRendererClass) = ObjCClassMetadata;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WorkoutRouteMapGenerator();
  return [(CHWorkoutRouteMapGenerator *)&v7 init];
}

- (void)setMapSize:(CGSize)a3
{
  id v3 = (CGSize *)((char *)self + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSize);
  *id v3 = a3;
  LOBYTE(v3[1].width) = 0;
}

- (void)configureForDive
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_isForDive) = 1;
}

- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 insets:(UIEdgeInsets)a6 completion:(id)a7
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  double height = a3.height;
  double width = a3.width;
  v16 = _Block_copy(a7);
  _Block_copy(v16);
  id v17 = a5;
  v18 = self;
  sub_1006545E0((uint64_t)v17, (uint64_t)v18, (void (**)(void, void))v16, width, height, a4, top, left, bottom, right);
  _Block_release(v16);
  _Block_release(v16);
}

- (CHWorkoutRouteMapGenerator)init
{
  result = (CHWorkoutRouteMapGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter);
}

@end