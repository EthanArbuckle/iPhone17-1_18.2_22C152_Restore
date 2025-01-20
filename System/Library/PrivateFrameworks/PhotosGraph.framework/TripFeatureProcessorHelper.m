@interface TripFeatureProcessorHelper
- (_TtC11PhotosGraph26TripFeatureProcessorHelper)init;
@end

@implementation TripFeatureProcessorHelper

- (_TtC11PhotosGraph26TripFeatureProcessorHelper)init
{
  v2 = (objc_class *)MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph26TripFeatureProcessorHelper_locationDictionaryCache) = (Class)MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph26TripFeatureProcessorHelper_areaCache) = v2;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11PhotosGraph26TripFeatureProcessorHelper_numberOfMomentsAfterFilter) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TripFeatureProcessorHelper();
  return [(TripFeatureProcessorHelper *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end