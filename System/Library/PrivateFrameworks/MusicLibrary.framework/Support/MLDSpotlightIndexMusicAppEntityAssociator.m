@interface MLDSpotlightIndexMusicAppEntityAssociator
- (_TtC13medialibraryd41MLDSpotlightIndexMusicAppEntityAssociator)init;
- (void)associateAppEntityForEntityOfType:(int64_t)a3 persistentID:(int64_t)a4 library:(id)a5 properties:(id)a6 withSearchableItemWithAttributeSet:(id)a7;
@end

@implementation MLDSpotlightIndexMusicAppEntityAssociator

- (void)associateAppEntityForEntityOfType:(int64_t)a3 persistentID:(int64_t)a4 library:(id)a5 properties:(id)a6 withSearchableItemWithAttributeSet:(id)a7
{
  uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a5;
  id v14 = a7;
  v15 = self;
  MLDSpotlightIndexMusicAppEntityAssociator.associateAppEntityForEntity(of:persistentID:library:properties:with:)(a3, a4, (uint64_t)v13, v12, (uint64_t)v14);

  swift_bridgeObjectRelease();
}

- (_TtC13medialibraryd41MLDSpotlightIndexMusicAppEntityAssociator)init
{
  return (_TtC13medialibraryd41MLDSpotlightIndexMusicAppEntityAssociator *)MLDSpotlightIndexMusicAppEntityAssociator.init()();
}

- (void).cxx_destruct
{
}

@end