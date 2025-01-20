@interface PlaceSummaryTemplateEntry
- (BOOL)containsContainmentParentUnit;
- (BOOL)containsCuratedGuideUnit;
- (BOOL)containsPhotoCarouselUnit;
- (BOOL)containsTappableEntityWithIdentifier:(id)a3 metadata:(id)a4;
- (BOOL)containsTransitShieldsUnit;
- (BOOL)containsUserGeneratedGuideUnit;
- (_TtC4Maps25PlaceSummaryTemplateEntry)init;
- (id)stringUnitContent;
@end

@implementation PlaceSummaryTemplateEntry

- (_TtC4Maps25PlaceSummaryTemplateEntry)init
{
  result = (_TtC4Maps25PlaceSummaryTemplateEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)containsCuratedGuideUnit
{
  v2 = self;
  char v3 = sub_1001BBE84();

  return v3 & 1;
}

- (BOOL)containsUserGeneratedGuideUnit
{
  v2 = self;
  char v3 = sub_1001BC104();

  return v3 & 1;
}

- (BOOL)containsContainmentParentUnit
{
  v2 = self;
  char v3 = sub_1001BC384();

  return v3 & 1;
}

- (BOOL)containsTransitShieldsUnit
{
  v2 = self;
  char v3 = sub_1001BC604();

  return v3 & 1;
}

- (BOOL)containsPhotoCarouselUnit
{
  v2 = self;
  char v3 = sub_1001BC884();

  return v3 & 1;
}

- (id)stringUnitContent
{
  v2 = self;
  sub_1001BCB04();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

- (BOOL)containsTappableEntityWithIdentifier:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  LOBYTE(v5) = sub_1001BCD28(v5, (uint64_t)v8);

  return v5 & 1;
}

@end