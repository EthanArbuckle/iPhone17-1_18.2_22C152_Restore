@interface PersonalizedFavoriteItem
- (AddressBookAddress)address;
- (BOOL)hasPriorityOverride;
- (BOOL)hasServerItemIndex;
- (BOOL)hidden;
- (BOOL)isCompoundPersonalizedAutocompleteItem;
- (BOOL)mustRefineMapItem;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)showsBalloonCallout;
- (CLLocationCoordinate2D)coordinate;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (GEOServerResultScoreMetadata)serverResultScoreMetadata;
- (MKMapItem)mapItem;
- (NSArray)autocompletionStrings;
- (NSArray)searchableStrings;
- (NSSet)keys;
- (NSString)description;
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (VKLabelMarker)sourceLabelMarker;
- (_TtC4Maps24PersonalizedFavoriteItem)init;
- (id)leafPersonalizedAutocompleteItems;
- (int64_t)priorityOverride;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (unint64_t)priority;
- (unint64_t)serverItemIndexInSection;
- (unint64_t)serverSectionIndex;
- (unint64_t)sortOrder;
- (void)setAddress:(id)a3;
- (void)setAutocompletionStrings:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setHidden:(BOOL)a3;
- (void)setKeys:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setSearchableStrings:(id)a3;
- (void)setShouldBeClustered:(BOOL)a3;
- (void)setShouldBeHiddenFromMap:(BOOL)a3;
- (void)setShowsBalloonCallout:(BOOL)a3;
- (void)setSortOrder:(unint64_t)a3;
- (void)setSource:(id)a3;
- (void)setSourceLabelMarker:(id)a3;
- (void)setSourceSubtype:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PersonalizedFavoriteItem

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_coordinate);
  double v3 = *(double *)&self->keys[OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (SearchResult)searchResult
{
  return (SearchResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__searchResult));
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return (PersonalizedItemPrioritizedStringAdornment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_subtitle));
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return (PersonalizedItemPrioritizedStringAdornment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_title));
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  double v2 = self;
  id v3 = sub_1000EF958();

  return (PersonalizedItemStyleAttributesAdornment *)v3;
}

- (NSSet)keys
{
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (unint64_t)sortOrder
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sortOrder);
}

- (unint64_t)priority
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_priority);
}

- (GEOLabelGeometry)labelGeometry
{
  id v2 = [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__mapItem) _labelGeometry];

  return (GEOLabelGeometry *)v2;
}

- (BOOL)shouldBeClustered
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeClustered);
}

- (BOOL)shouldBeHiddenFromMap
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeHiddenFromMap);
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_prefix));
}

- (BOOL)showsBalloonCallout
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_showsBalloonCallout);
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  id v2 = [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__mapItem) _enhancedPlacement];

  return (GEOEnhancedPlacement *)v2;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  id v3 = self;
  v4 = self;
  id v5 = sub_1000EF958();
  id v6 = [v3 clientFeatureIDFromAdornment:v5 mapItem:*(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__mapItem)];

  if (v6)
  {

    return (PersonalizedItemClientFeatureIDAdornment *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (int64_t)sourceSubtype
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceSubtype);
}

- (int64_t)sourceType
{
  return 9;
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_mapItem));
}

- (void)setKeys:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_keys) = (Class)static Set._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)setPriority:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_priority) = (Class)a3;
}

- (void)setMapItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_mapItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_mapItem) = (Class)a3;
  id v3 = a3;
}

- (PersonalizedItemSource)source
{
  return (PersonalizedItemSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_source));
}

- (void)setSource:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_source);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_source) = (Class)a3;
  id v3 = a3;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_coordinate) = a3;
}

- (void)setPrefix:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_prefix);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_prefix) = (Class)a3;
  id v3 = a3;
}

- (void)setTitle:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_title);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_title) = (Class)a3;
  id v3 = a3;
}

- (void)setSubtitle:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_subtitle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_subtitle) = (Class)a3;
  id v3 = a3;
}

- (void)setSortOrder:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sortOrder) = (Class)a3;
}

- (void)setShouldBeClustered:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeClustered) = a3;
}

- (void)setShowsBalloonCallout:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_showsBalloonCallout) = a3;
}

- (VKLabelMarker)sourceLabelMarker
{
  return (VKLabelMarker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceLabelMarker));
}

- (void)setSourceLabelMarker:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceLabelMarker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceLabelMarker) = (Class)a3;
  id v3 = a3;
}

- (AddressBookAddress)address
{
  return (AddressBookAddress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_address));
}

- (void)setAddress:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_address);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_address) = (Class)a3;
  id v3 = a3;
}

- (NSArray)searchableStrings
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_searchableStrings))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void)setSearchableStrings:(id)a3
{
  if (a3) {
    id v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_searchableStrings) = v4;

  swift_bridgeObjectRelease();
}

- (void)setShouldBeHiddenFromMap:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shouldBeHiddenFromMap) = a3;
}

- (BOOL)mustRefineMapItem
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_shortcutType)
       - 4 < 0xFFFFFFFFFFFFFFFELL;
}

- (SearchDotPlace)searchDotPlace
{
  return (SearchDotPlace *)0;
}

- (void)setSourceSubtype:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_sourceSubtype) = (Class)a3;
}

- (BOOL)hasPriorityOverride
{
  return 0;
}

- (int64_t)priorityOverride
{
  return 0;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return (GEOServerResultScoreMetadata *)0;
}

- (BOOL)hidden
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_hidden);
}

- (void)setHidden:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem_hidden) = a3;
}

- (NSArray)autocompletionStrings
{
  NSArray v2 = self;
  uint64_t v3 = sub_1001F8BF4();

  if (v3)
  {
    sub_1000FF33C(&qword_1015D52F8);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAutocompletionStrings:(id)a3
{
  if (a3)
  {
    sub_1000FF33C(&qword_1015D52F8);
    NSArray v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    NSArray v4 = 0;
  }
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem____lazy_storage___autocompletionStrings);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem____lazy_storage___autocompletionStrings) = v4;

  sub_1001F94BC(v5);
}

- (BOOL)hasServerItemIndex
{
  return 0;
}

- (unint64_t)serverSectionIndex
{
  return 0;
}

- (unint64_t)serverItemIndexInSection
{
  return 0;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 0;
}

- (id)leafPersonalizedAutocompleteItems
{
  sub_1000FF33C(&qword_1015CD310);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100F5DFF0;
  *(void *)(v3 + 32) = self;
  specialized Array._endMutation()();
  NSArray v4 = self;
  sub_1000FF33C(&qword_1015D52F0);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (NSString)description
{
  NSArray v2 = self;
  sub_1001F8F00();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC4Maps24PersonalizedFavoriteItem)init
{
  CLLocationCoordinate2D result = (_TtC4Maps24PersonalizedFavoriteItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1001F94BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem____lazy_storage___autocompletionStrings));

  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24PersonalizedFavoriteItem__searchResult);
}

@end