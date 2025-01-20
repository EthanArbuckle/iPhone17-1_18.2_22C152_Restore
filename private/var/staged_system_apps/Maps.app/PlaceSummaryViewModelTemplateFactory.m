@interface PlaceSummaryViewModelTemplateFactory
+ (id)addAPlaceAutocompleteViewModel;
+ (id)addAPlaceSearchViewModel;
+ (id)venueViewModelWithSearchResult:(id)a3 metadata:(id)a4 labelContext:(unint64_t)a5;
+ (id)viewModelWithAddressBookAddress:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5;
+ (id)viewModelWithAutocompletePerson:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5;
+ (id)viewModelWithCompletion:(id)a3 metadata:(id)a4 currentLocation:(id)a5 userLocationSearchResult:(id)a6 highlightType:(id)a7 availableWidth:(double)a8 clientSourceType:(int64_t)a9 allowsTappableUnits:(BOOL)a10 searchAlongRoute:(BOOL)a11;
+ (id)viewModelWithCoreRecentContact:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5;
+ (id)viewModelWithHistoryEntryPlaceDisplay:(id)a3 highlightConfiguration:(id)a4 availableWidth:(double)a5 currentLocation:(id)a6 searchAlongRoute:(BOOL)a7;
+ (id)viewModelWithHistoryEntrySearch:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5;
+ (id)viewModelWithMapsSuggestionsEntry:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5;
+ (id)viewModelWithSearchResult:(id)a3 highlightConfiguration:(id)a4 currentLocation:(id)a5 availableWidth:(double)a6 searchAlongRoute:(BOOL)a7;
+ (id)viewModelWithSearchResult:(id)a3 metadata:(id)a4 currentLocation:(id)a5 searchAlongRoute:(BOOL)a6 openAt:(id)a7;
+ (int64_t)kSearchMinimumRegularLinesCount;
+ (void)updateDistanceViewModelWithCurrentLocation:(id)a3 mapItem:(id)a4 template:(id)a5 searchAlongTheRoute:(BOOL)a6;
- (_TtC4Maps36PlaceSummaryViewModelTemplateFactory)init;
@end

@implementation PlaceSummaryViewModelTemplateFactory

+ (int64_t)kSearchMinimumRegularLinesCount
{
  return 3;
}

+ (id)venueViewModelWithSearchResult:(id)a3 metadata:(id)a4 labelContext:(unint64_t)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)sub_10021E3FC(v8, a5);

  return v10;
}

+ (id)viewModelWithSearchResult:(id)a3 metadata:(id)a4 currentLocation:(id)a5 searchAlongRoute:(BOOL)a6 openAt:(id)a7
{
  BOOL v8 = a6;
  swift_getObjCClassMetadata();
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = sub_1002070B4(v12, (char *)a4, a5, v8, (uint64_t)a7);

  return v16;
}

+ (id)viewModelWithCompletion:(id)a3 metadata:(id)a4 currentLocation:(id)a5 userLocationSearchResult:(id)a6 highlightType:(id)a7 availableWidth:(double)a8 clientSourceType:(int64_t)a9 allowsTappableUnits:(BOOL)a10 searchAlongRoute:(BOOL)a11
{
  swift_getObjCClassMetadata();
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  v22 = (void *)sub_100207DC8(v17, (char *)a4, a5, a6, (uint64_t)v21, a9, a10, a11, a8);

  return v22;
}

+ (id)viewModelWithHistoryEntrySearch:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  BOOL v5 = a5;
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = (void *)sub_1002089EC((uint64_t)a3, (uint64_t)v8, v5);
  swift_unknownObjectRelease();

  return v9;
}

+ (id)viewModelWithHistoryEntryPlaceDisplay:(id)a3 highlightConfiguration:(id)a4 availableWidth:(double)a5 currentLocation:(id)a6 searchAlongRoute:(BOOL)a7
{
  BOOL v7 = a7;
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  id v12 = a4;
  id v13 = a6;
  id v14 = (void *)sub_100208AE0(a3, v12, a6, v7, a5);
  swift_unknownObjectRelease();

  return v14;
}

+ (id)viewModelWithAddressBookAddress:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_10020AE48((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_100209790);
}

+ (id)viewModelWithAutocompletePerson:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_10020AE48((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_100209984);
}

+ (id)viewModelWithCoreRecentContact:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_10020AE48((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_10020AED4);
}

+ (id)viewModelWithSearchResult:(id)a3 highlightConfiguration:(id)a4 currentLocation:(id)a5 availableWidth:(double)a6 searchAlongRoute:(BOOL)a7
{
  BOOL v7 = a7;
  swift_getObjCClassMetadata();
  id v12 = a3;
  id v13 = (char *)a4;
  id v14 = a5;
  id v15 = (void *)sub_10020B6B0(v12, v13, a5, v7, a6);

  return v15;
}

+ (id)viewModelWithMapsSuggestionsEntry:(id)a3 highlightConfiguration:(id)a4 searchAlongRoute:(BOOL)a5
{
  return sub_10020AE48((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t (*)(id, id, uint64_t))sub_10020C15C);
}

+ (id)addAPlaceAutocompleteViewModel
{
  swift_getObjCClassMetadata();
  v2 = (void *)sub_10020CB6C(1);

  return v2;
}

+ (id)addAPlaceSearchViewModel
{
  swift_getObjCClassMetadata();
  v2 = (void *)sub_10020CB6C(2);

  return v2;
}

- (_TtC4Maps36PlaceSummaryViewModelTemplateFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryViewModelTemplateFactory();
  return [(PlaceSummaryViewModelTemplateFactory *)&v3 init];
}

+ (void)updateDistanceViewModelWithCurrentLocation:(id)a3 mapItem:(id)a4 template:(id)a5 searchAlongTheRoute:(BOOL)a6
{
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  sub_10021B494(a3, v11, (uint64_t)v12, a6);
}

@end