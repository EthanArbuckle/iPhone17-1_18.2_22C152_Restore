@interface CHCatalogItemViewModel
- (BOOL)isSeymourGuidedRunWorkout;
- (BOOL)isSeymourGuidedWalkWorkout;
- (BOOL)isSeymourPairedWorkout;
- (CHCatalogItemViewModel)init;
- (NSAttributedString)subtitle;
- (NSAttributedString)title;
- (NSString)description;
@end

@implementation CHCatalogItemViewModel

- (NSAttributedString)title
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHCatalogItemViewModel_title));
}

- (NSAttributedString)subtitle
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHCatalogItemViewModel_subtitle));
}

- (BOOL)isSeymourPairedWorkout
{
  v2 = self;
  char v3 = sub_10040FADC();

  return v3 & 1;
}

- (BOOL)isSeymourGuidedWalkWorkout
{
  v2 = self;
  char v3 = sub_10040FB1C();

  return v3 & 1;
}

- (BOOL)isSeymourGuidedRunWorkout
{
  v2 = self;
  char v3 = sub_10040FC38();

  return v3 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_10040FF04();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CHCatalogItemViewModel)init
{
  result = (CHCatalogItemViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR___CHCatalogItemViewModel_artwork;
  uint64_t v4 = type metadata accessor for Artwork();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1004108F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHCatalogItemViewModel_mediaType), *(void *)&self->title[OBJC_IVAR___CHCatalogItemViewModel_mediaType], self->subtitle[OBJC_IVAR___CHCatalogItemViewModel_mediaType]);

  swift_bridgeObjectRelease();
}

@end