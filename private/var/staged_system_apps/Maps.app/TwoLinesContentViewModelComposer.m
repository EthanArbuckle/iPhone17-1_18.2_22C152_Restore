@interface TwoLinesContentViewModelComposer
+ (BOOL)userInterfaceLayoutDirectionIsRTL;
+ (id)_cellModelForComposedWaypointToRoute:(id)a3;
+ (id)_cellModelForHistoryEntryCuratedCollection:(id)a3;
+ (id)_cellModelForHistoryEntryPlace:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5;
+ (id)_cellModelForHistoryEntryRoute:(id)a3;
+ (id)_cellModelForHistoryEntrySearch:(id)a3 showAutocompleteClientSource:(BOOL)a4;
+ (id)_cellModelForHistoryEntryTransitLineItem:(id)a3;
+ (id)_cellModelForRouteName:(id)a3 persistentData:(id)a4 thirdLineViewModel:(id)a5 menuProvider:(id)a6;
+ (id)_convertSymbolToIconImage:(id)a3 RAPType:(int)a4;
+ (id)_delimiterString;
+ (id)_searchResultModelWithSearchResult:(id)a3 title:(id)a4 subtitle:(id)a5 isAuthorizedForPreciseLocation:(BOOL)a6 placeContextViewModel:(id)a7;
+ (id)backgroundColorForRAPType:(int)a3;
+ (id)cellModelForAddMissingPlaceWithUserEnteredText:(id)a3;
+ (id)cellModelForAddressBookAddress:(id)a3;
+ (id)cellModelForCollection:(id)a3;
+ (id)cellModelForCollectionMapItem:(id)a3 currentLocation:(id)a4;
+ (id)cellModelForDroppedPinFromSearchResult:(id)a3;
+ (id)cellModelForExpiredOfflineMapSubscription:(id)a3 isAvailable:(BOOL)a4 isSupportedOSVersion:(BOOL)a5;
+ (id)cellModelForHistoryEntryRecentsItem:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5;
+ (id)cellModelForHistoryEntryRecentsItemProtocol:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5;
+ (id)cellModelForLocalSearchCompletion:(id)a3 userLocationSearchResult:(id)a4 autocompleteClientSourceType:(int64_t)a5;
+ (id)cellModelForLocationInfo:(id)a3;
+ (id)cellModelForMapItem:(id)a3;
+ (id)cellModelForMapsFavoriteItem:(id)a3;
+ (id)cellModelForMapsFavoriteItem:(id)a3 title:(id)a4 subtitle:(id)a5;
+ (id)cellModelForMapsSuggestionEntry:(id)a3;
+ (id)cellModelForMapsSuggestionEntry:(id)a3 title:(id)a4 subtitle:(id)a5;
+ (id)cellModelForMapsSuggestionsShortcut:(id)a3;
+ (id)cellModelForOfflineMapSubscriptionInfo:(id)a3 cancelDownloadBlock:(id)a4 resumeDownloadBlock:(id)a5;
+ (id)cellModelForOfflineMapSuggestion:(id)a3 downloadBlock:(id)a4;
+ (id)cellModelForOfflineRegionLocalSearchCompletion:(id)a3;
+ (id)cellModelForOfflineSearchResult:(id)a3;
+ (id)cellModelForParkedCar:(id)a3;
+ (id)cellModelForPlaceNotFoundWithUserEnteredText:(id)a3;
+ (id)cellModelForPublisher:(id)a3 showDisclosureIndicator:(BOOL)a4;
+ (id)cellModelForRAPReportsHistory:(id)a3 allowDisclosureIndicator:(BOOL)a4;
+ (id)cellModelForRatingsHistory:(id)a3;
+ (id)cellModelForRecentContact:(id)a3;
+ (id)cellModelForRecentContact:(id)a3 showAutocompleteClientSource:(BOOL)a4 autocompleteClientSourceType:(int64_t)a5;
+ (id)cellModelForRouteData:(id)a3 thirdLineViewModel:(id)a4 menuProvider:(id)a5;
+ (id)cellModelForSavedRouteCalculatingFailureForOfflineRegion:(id)a3;
+ (id)cellModelForSavedRouteCalculatingOfflineRegion:(id)a3;
+ (id)cellModelForSavedRouteOfflineDownload:(id)a3 estimatedSizeInBytes:(int64_t)a4;
+ (id)cellModelForSavedRouteOfflineRegion:(id)a3 coveredByExistingSubscription:(id)a4;
+ (id)cellModelForSavedRouteUnavailableOfflineRegion:(id)a3;
+ (id)cellModelForSearchHomeRecentSearch:(id)a3;
+ (id)cellModelForSearchResult:(id)a3;
+ (id)cellModelForSearchResult:(id)a3 typedACQuery:(id)a4 showAutocompleteClientSource:(BOOL)a5;
+ (id)cellModelForSharedTrip:(id)a3;
+ (id)cellModelForSharedTripSummary:(id)a3;
+ (id)cellModelForTransitLine:(id)a3;
+ (id)cellModelForUGCSuggestionContentType:(int64_t)a3 visitDate:(id)a4;
+ (id)libraryCellModelForMapItem:(id)a3 customName:(id)a4 styleAttributes:(id)a5 thirdLineViewModel:(id)a6 menuProvider:(id)a7;
@end

@implementation TwoLinesContentViewModelComposer

+ (id)_delimiterString
{
  if (qword_101610478 != -1) {
    dispatch_once(&qword_101610478, &stru_101314200);
  }
  v2 = (void *)qword_101610470;

  return v2;
}

+ (BOOL)userInterfaceLayoutDirectionIsRTL
{
  v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == (id)1;

  return v3;
}

+ (id)cellModelForPlaceNotFoundWithUserEnteredText:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"More Results for <user typed string> [Home / Work]" value:@"localized string not found" table:0];

  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);
  id v7 = [v6 rangeOfString:v3];
  uint64_t v9 = v8;

  v10 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v6 subtitleText:0 imageCreationBlock:&stru_101314240];
  v11 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v7, v9);
  v14 = v11;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];
  [(_BasicTwoLinesContentViewModel *)v10 setTitleHighlightRanges:v12];

  return v10;
}

+ (id)cellModelForAddMissingPlaceWithUserEnteredText:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Add to Maps [Home / Work Search Results]" value:@"localized string not found" table:0];

  v6 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v5 subtitleText:v3 imageCreationBlock:&stru_101314260];
  [(_BasicTwoLinesContentViewModel *)v6 setAxIdentifier:@"AddMissingPlaceCell"];

  return v6;
}

+ (id)cellModelForAddressBookAddress:(id)a3
{
  id v3 = a3;
  if ([v3 isMeCard])
  {
    v4 = [v3 localizedLabel];
    v5 = [v4 capitalizedString];
  }
  else
  {
    v5 = [v3 compositeName];
  }
  v6 = [v3 shortAddress];
  id v7 = [_BasicTwoLinesContentViewModel alloc];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A08328;
  v21[3] = &unk_101314288;
  id v8 = v3;
  id v22 = v8;
  uint64_t v9 = [(_BasicTwoLinesContentViewModel *)v7 initWithTitleText:v5 subtitleText:v6 imageCreationBlock:v21];
  v10 = [v8 geocodedMapItem];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 _geoMapItem];

    if (v12) {
      goto LABEL_7;
    }
  }
  id v13 = objc_alloc((Class)MKMapItem);
  v14 = [v8 addressDictionary];
  id v15 = [v13 initWithAddressDictionary:v14];

  v11 = v15;
  if (v15)
  {
LABEL_7:
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100A08618;
    v18[3] = &unk_1013142B0;
    id v19 = v11;
    id v20 = v8;
    id v16 = v11;
    [(_BasicTwoLinesContentViewModel *)v9 setPersonalizedItemForQuickActionMenuCreator:v18];
  }
  [(_BasicTwoLinesContentViewModel *)v9 setAxIdentifier:@"AddressBookAddressCell"];

  return v9;
}

+ (id)cellModelForSearchResult:(id)a3
{
  return [a1 cellModelForSearchResult:a3 typedACQuery:0 showAutocompleteClientSource:0];
}

+ (id)cellModelForOfflineSearchResult:(id)a3
{
  id v3 = a3;
  v4 = +[MKLocationManager sharedLocationManager];
  unsigned int v5 = [v4 isAuthorizedForPreciseLocation];

  v6 = [v3 mapItem];
  id v7 = [v6 _addressFormattedAsCity];

  if ([v3 isDynamicCurrentLocation])
  {
    id v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"[Offline Search] Current Location" value:@"localized string not found" table:@"Offline"];

    if (v5)
    {
      v10 = [v3 mapItem];
      id v11 = [v10 _addressFormattedAsCity];
    }
    else
    {
      id v11 = 0;
    }
    v12 = [[PlaceContextViewModel alloc] initWithCurrentLocation];
  }
  else
  {
    uint64_t v9 = [v3 name];
    id v11 = v7;
    v12 = 0;
  }
  id v13 = [_SearchResultTwoLinesContentViewModel alloc];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A08924;
  v23[3] = &unk_101314288;
  id v14 = v3;
  id v24 = v14;
  id v15 = [(_BasicTwoLinesContentViewModel *)v13 initWithTitleText:v9 subtitleText:v11 imageCreationBlock:v23];
  [(_SearchResultTwoLinesContentViewModel *)v15 setPreferredAddressFormat:1];
  if (([v14 isDynamicCurrentLocation] ^ 1 | v5) == 1 && !objc_msgSend(v11, "length")) {
    [(_SearchResultTwoLinesContentViewModel *)v15 setObservedSearchResult:v14];
  }
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_100A08AD8;
  v21 = &unk_1013142D8;
  id v22 = v14;
  id v16 = v14;
  [(_BasicTwoLinesContentViewModel *)v15 setPersonalizedItemForQuickActionMenuCreator:&v18];
  -[_BasicTwoLinesContentViewModel setPlaceContextViewModel:](v15, "setPlaceContextViewModel:", v12, v18, v19, v20, v21);
  [(_BasicTwoLinesContentViewModel *)v15 setAxIdentifier:@"SearchResultCell"];

  return v15;
}

+ (id)cellModelForSearchResult:(id)a3 typedACQuery:(id)a4 showAutocompleteClientSource:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = +[MKLocationManager sharedLocationManager];
  id v11 = [v10 isAuthorizedForPreciseLocation];

  v12 = [v8 mapItem];
  id v13 = [v12 _addressFormattedAsShortenedAddress];

  if ([v8 isDynamicCurrentLocation])
  {
    if (v11)
    {
      id v14 = [v8 title];
      id v15 = [v8 mapItem];
      id v16 = [v15 _addressFormattedAsShortenedAddress];
      v17 = sub_100A08D18(v16);
    }
    else
    {
      MKLocalizedStringForCurrentLocation();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v17 = 0;
    }
    id v22 = [[PlaceContextViewModel alloc] initWithCurrentLocation];
  }
  else
  {
    if (v5
      && [v8 type] == 3
      && [v9 length]
      && ([v13 lowercaseString],
          v18 = objc_claimAutoreleasedReturnValue(),
          [v9 lowercaseString],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          unsigned int v20 = [v18 containsString:v19],
          v19,
          v18,
          v20))
    {
      id v14 = v13;
      id v21 = +[AutocompleteClientSource autocompleteClientSourceTitleWithType:5];
    }
    else
    {
      id v14 = [v8 name];
      id v21 = v13;
    }
    v17 = v21;
    id v22 = 0;
  }
  v23 = [a1 _searchResultModelWithSearchResult:v8 title:v14 subtitle:v17 isAuthorizedForPreciseLocation:v11 placeContextViewModel:v22];

  return v23;
}

+ (id)cellModelForDroppedPinFromSearchResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 mapItem];
  v6 = [v5 _addressFormattedAsShortenedAddress];

  id v7 = +[AutocompleteClientSource autocompleteClientSourceTitleWithType:5];
  if ([(__CFString *)v6 length]) {
    id v8 = v6;
  }
  else {
    id v8 = v7;
  }
  id v9 = v8;
  if ([(__CFString *)v9 isEqual:v6]) {
    CFStringRef v10 = v7;
  }
  else {
    CFStringRef v10 = &stru_101324E70;
  }
  id v11 = [a1 _searchResultModelWithSearchResult:v4 title:v9 subtitle:v10 isAuthorizedForPreciseLocation:0 placeContextViewModel:0];

  return v11;
}

+ (id)_searchResultModelWithSearchResult:(id)a3 title:(id)a4 subtitle:(id)a5 isAuthorizedForPreciseLocation:(BOOL)a6 placeContextViewModel:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a4;
  id v15 = [_SearchResultTwoLinesContentViewModel alloc];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100A09074;
  v25[3] = &unk_101314288;
  id v16 = v11;
  id v26 = v16;
  v17 = [(_BasicTwoLinesContentViewModel *)v15 initWithTitleText:v14 subtitleText:v12 imageCreationBlock:v25];

  [(_SearchResultTwoLinesContentViewModel *)v17 setPreferredAddressFormat:0];
  if ((![v16 isDynamicCurrentLocation] || v8) && !objc_msgSend(v12, "length")) {
    [(_SearchResultTwoLinesContentViewModel *)v17 setObservedSearchResult:v16];
  }
  unsigned int v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_100A09210;
  v23 = &unk_1013142D8;
  id v24 = v16;
  id v18 = v16;
  [(_BasicTwoLinesContentViewModel *)v17 setPersonalizedItemForQuickActionMenuCreator:&v20];
  -[_BasicTwoLinesContentViewModel setPlaceContextViewModel:](v17, "setPlaceContextViewModel:", v13, v20, v21, v22, v23);

  [(_BasicTwoLinesContentViewModel *)v17 setAxIdentifier:@"SearchResultCell"];

  return v17;
}

+ (id)cellModelForMapsSuggestionsShortcut:(id)a3
{
  id v3 = a3;
  id v4 = [v3 isSetupPlaceholder];
  id v5 = v3;
  if ([v5 type] == (id)6)
  {
    v6 = [v5 identifier];
    unsigned int v7 = [v6 isEqualToString:@"NearbyTransit"];
  }
  else
  {
    unsigned int v7 = 0;
  }

  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    if (v7)
    {
      BOOL v8 = MapsSuggestionsLocalizedNearbyTransitFullString();
      MapsSuggestionsLocalizedNearbyTransitFullSubtitleString();
    }
    else
    {
      BOOL v8 = [v5 placeName];
      [v5 shortAddress];
    id v9 = };
    uint64_t v10 = [v5 proposedFavoriteStyleAttributes];
  }
  else
  {
    if (v7)
    {
      BOOL v8 = MapsSuggestionsLocalizedNearbyTransitFullString();
      MapsSuggestionsLocalizedNearbyTransitFullSubtitleString();
    }
    else
    {
      BOOL v8 = [v5 title];
      [v5 subtitle];
    id v9 = };
    uint64_t v10 = [v5 styleAttributes];
  }
  id v11 = (void *)v10;
  id v12 = [_BasicTwoLinesContentViewModel alloc];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  uint64_t v19 = sub_100A09498;
  unsigned int v20 = &unk_101314300;
  char v22 = (char)v4;
  id v13 = v11;
  id v21 = v13;
  id v14 = [(_BasicTwoLinesContentViewModel *)v12 initWithTitleText:v8 subtitleText:v9 imageCreationBlock:&v17];
  -[_BasicTwoLinesContentViewModel setVibrantBackground:](v14, "setVibrantBackground:", v4, v17, v18, v19, v20);
  if (+[LibraryUIUtilities isMyPlacesEnabled]
    && [v5 isSetupPlaceholder])
  {
    id v15 = +[UIColor linkColor];
    [(_BasicTwoLinesContentViewModel *)v14 setSubtitleTextColor:v15];
  }
  if (v7) {
    [(_BasicTwoLinesContentViewModel *)v14 setAllowsSubtitleWrapping:1];
  }
  [(_BasicTwoLinesContentViewModel *)v14 setAxIdentifier:@"MapsSuggestionsShortcutCell"];

  return v14;
}

+ (id)cellModelForMapsSuggestionEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 title];
  v6 = [v4 subtitle];
  unsigned int v7 = [a1 cellModelForMapsSuggestionEntry:v4 title:v5 subtitle:v6];

  return v7;
}

+ (id)cellModelForMapsSuggestionEntry:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [_MapsSuggestionsEntryTwoLinesContentViewModel alloc];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100A0983C;
  v20[3] = &unk_101314288;
  id v11 = v7;
  id v21 = v11;
  id v12 = [(_BasicTwoLinesContentViewModel *)v10 initWithTitleText:v9 subtitleText:v8 imageCreationBlock:v20];

  [(_MapsSuggestionsEntryTwoLinesContentViewModel *)v12 setObservedEntry:v11];
  [(_BasicTwoLinesContentViewModel *)v12 setImageStyle:4];
  if (([v11 BOOLeanForKey:@"MapsSuggestionsIsNotADestinationKey" is:1] & 1) == 0)
  {
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100A09910;
    uint64_t v18 = &unk_1013142D8;
    id v19 = v11;
    [(_BasicTwoLinesContentViewModel *)v12 setPersonalizedItemForQuickActionMenuCreator:&v15];
  }
  id v13 = +[NSUserDefaults standardUserDefaults];
  -[_BasicTwoLinesContentViewModel setShowBadgeView:](v12, "setShowBadgeView:", [v13 BOOLForKey:@"__internal__EnableMapsSuggestion"]);

  [(_BasicTwoLinesContentViewModel *)v12 setAxIdentifier:@"MapsSuggestionEntryCell"];

  return v12;
}

+ (id)cellModelForMapsFavoriteItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 title];
  v6 = [v4 subtitle];
  id v7 = [a1 cellModelForMapsFavoriteItem:v4 title:v5 subtitle:v6];

  return v7;
}

+ (id)cellModelForMapsFavoriteItem:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [_MapsFavoriteItemTwoLinesContentViewModel alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A09B70;
  v16[3] = &unk_101314288;
  id v11 = v7;
  id v17 = v11;
  id v12 = [(_BasicTwoLinesContentViewModel *)v10 initWithTitleText:v9 subtitleText:v8 imageCreationBlock:v16];

  if ([v11 isSetupPlaceholder])
  {
    id v13 = +[UIColor linkColor];
    [(_BasicTwoLinesContentViewModel *)v12 setSubtitleTextColor:v13];
  }
  [(_MapsFavoriteItemTwoLinesContentViewModel *)v12 setObservedEntry:v11];
  [(_BasicTwoLinesContentViewModel *)v12 setImageStyle:4];
  id v14 = +[NSUserDefaults standardUserDefaults];
  -[_BasicTwoLinesContentViewModel setShowBadgeView:](v12, "setShowBadgeView:", [v14 BOOLForKey:@"__internal__EnableMapsSuggestion"]);

  [(_BasicTwoLinesContentViewModel *)v12 setAxIdentifier:@"MapsSuggestionEntryCell"];

  return v12;
}

+ (id)cellModelForCollection:(id)a3
{
  id v3 = a3;
  id v4 = [_CollectionTwoLinesContentViewModel alloc];
  id v5 = [v3 title];
  v6 = [v3 subtitle];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A09D64;
  v10[3] = &unk_101314288;
  id v11 = v3;
  id v7 = v3;
  id v8 = [(_BasicTwoLinesContentViewModel *)v4 initWithTitleText:v5 subtitleText:v6 imageCreationBlock:v10];

  [(_CollectionTwoLinesContentViewModel *)v8 setCollection:v7];
  [(_BasicTwoLinesContentViewModel *)v8 setImageStyle:3];
  [(_BasicTwoLinesContentViewModel *)v8 setAxIdentifier:@"GuideCell"];

  return v8;
}

+ (id)cellModelForTransitLine:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 name];
    id v7 = [v3 system];
    id v8 = [v7 name];
  }
  else
  {
    id v9 = [v3 system];
    uint64_t v10 = [v9 name];
    id v11 = [v10 length];

    if (v11)
    {
      id v7 = [v3 system];
      [v7 name];
    }
    else
    {
      id v7 = +[NSBundle mainBundle];
      [v7 localizedStringForKey:@"Transit_Line_Cell_Default" value:@"localized string not found" table:0];
    v6 = };
    id v8 = 0;
  }

  id v12 = [_BasicTwoLinesContentViewModel alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A09FBC;
  v16[3] = &unk_101314288;
  id v17 = v3;
  id v13 = v3;
  id v14 = [(_BasicTwoLinesContentViewModel *)v12 initWithTitleText:v6 subtitleText:v8 imageCreationBlock:v16];
  [(_BasicTwoLinesContentViewModel *)v14 setImageStyle:4];
  [(_BasicTwoLinesContentViewModel *)v14 setAxIdentifier:@"TransitLineCell"];

  return v14;
}

+ (id)cellModelForCollectionMapItem:(id)a3 currentLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 name];
  id v8 = [v5 _firstLocalizedCategoryName];
  if (v6)
  {
    char v25 = 0;
    id v9 = +[NSString distanceStringFromLocation:v6 toMapItem:v5 showsDistance:&v25];
    if (!v9)
    {
      uint64_t v10 = [v5 _geoMapItem];
      id v9 = [v10 _resultSnippetLocationString];
    }
  }
  else
  {
    id v9 = 0;
  }
  if ([v5 _hasPriceDescription]) {
    [v5 _priceDescription];
  }
  else {
  id v11 = [v5 _priceRangeString];
  }
  id v12 = +[NSMutableArray array];
  if ([v8 length]) {
    [v12 addObject:v8];
  }
  if ([v9 length]) {
    [v12 addObject:v9];
  }
  if ([v11 length]) {
    [v12 addObject:v11];
  }
  id v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@" · [List view details separator]" value:@"localized string not found" table:0];

  id v15 = [v12 componentsJoinedByString:v14];
  uint64_t v16 = [_BasicTwoLinesContentViewModel alloc];
  unsigned int v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  char v22 = sub_100A0A404;
  v23 = &unk_101314288;
  id v24 = v5;
  id v17 = v5;
  uint64_t v18 = [(_BasicTwoLinesContentViewModel *)v16 initWithTitleText:v7 subtitleText:v15 imageCreationBlock:&v20];
  [(_BasicTwoLinesContentViewModel *)v18 setAxIdentifier:@"GuideItemCell", v20, v21, v22, v23];

  return v18;
}

+ (id)cellModelForMapItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  id v5 = [v3 _addressFormattedAsShortenedAddress];
  id v6 = [_BasicTwoLinesContentViewModel alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A0A5D4;
  v10[3] = &unk_101314288;
  id v11 = v3;
  id v7 = v3;
  id v8 = [(_BasicTwoLinesContentViewModel *)v6 initWithTitleText:v4 subtitleText:v5 imageCreationBlock:v10];
  [(_BasicTwoLinesContentViewModel *)v8 setAxIdentifier:@"PlaceCell"];

  return v8;
}

+ (id)libraryCellModelForMapItem:(id)a3 customName:(id)a4 styleAttributes:(id)a5 thirdLineViewModel:(id)a6 menuProvider:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    id v17 = v13;
  }
  else
  {
    id v17 = [v12 name];
  }
  id v18 = v17;
  id v19 = +[NSMutableArray array];
  uint64_t v20 = [v12 _firstLocalizedCategoryName];
  if (v20) {
    [v19 addObject:v20];
  }
  v36 = (void *)v20;
  uint64_t v21 = [v12 _geoMapItem];
  char v22 = [v21 _resultSnippetLocationString];

  if (v22) {
    [v19 addObject:v22];
  }
  v23 = [a1 _delimiterString];
  id v24 = [v19 componentsJoinedByString:v23];

  if (![v24 length])
  {
    uint64_t v25 = [v12 _addressFormattedAsShortenedAddress];

    id v24 = (void *)v25;
  }
  v38 = v12;
  v39 = v13;
  id v26 = [_BasicTwoLinesContentViewModel alloc];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100A0AA04;
  v40[3] = &unk_101314288;
  id v41 = v14;
  id v35 = v14;
  v37 = v18;
  v27 = [(_BasicTwoLinesContentViewModel *)v26 initWithTitleText:v18 subtitleText:v24 imageCreationBlock:v40];
  [(_BasicTwoLinesContentViewModel *)v27 setAxIdentifier:@"LibraryPlaceCell"];
  if (v15) {
    [(_BasicTwoLinesContentViewModel *)v27 setPlaceContextViewModel:v15];
  }
  v28 = +[UIButton buttonWithType:0];
  v29 = +[UIImage systemImageNamed:@"ellipsis"];
  [v28 setImage:v29 forState:0];

  [v28 setShowsMenuAsPrimaryAction:1];
  [v28 _setMenuProvider:v16];
  [v28 setAccessibilityIdentifier:@"LibraryPlaceCellMoreButton"];
  id v30 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v28 placement:1];
  [v30 setDisplayedState:2];
  v31 = v15;
  id v32 = objc_alloc_init((Class)UICellAccessoryMultiselect);
  [v32 setDisplayedState:1];
  v42[0] = v30;
  v42[1] = v32;
  v33 = +[NSArray arrayWithObjects:v42 count:2];
  [(_BasicTwoLinesContentViewModel *)v27 setCellAccessories:v33];

  return v27;
}

+ (id)cellModelForParkedCar:(id)a3
{
  id v3 = a3;
  id v4 = [v3 title];
  id v5 = [v3 locationDisplayString];

  id v6 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v4 subtitleText:v5 imageCreationBlock:&stru_101314320];
  [(_BasicTwoLinesContentViewModel *)v6 setAxIdentifier:@"ParkedCarCell"];

  return v6;
}

+ (id)cellModelForLocalSearchCompletion:(id)a3 userLocationSearchResult:(id)a4 autocompleteClientSourceType:(int64_t)a5
{
  id v7 = a3;
  id v91 = a4;
  id v8 = [v7 title];
  uint64_t v89 = [v7 titleHighlightRanges];
  id v9 = [v7 subtitle];
  v95 = [v7 subtitleHighlightRanges];
  uint64_t v10 = [v7 category];

  if (v10)
  {
    id v11 = [v7 category];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = [v7 directionIntent];

  if (v12)
  {
    id v13 = +[UIImage imageNamed:@"RouteAC"];
    id v14 = [[DirectionIntentCellViewModel alloc] initWithLocalSearchCompletion:v7];
    uint64_t v15 = [(DirectionIntentCellViewModel *)v14 titleCellString];

    uint64_t v16 = [(DirectionIntentCellViewModel *)v14 subtitleCellString];

    v87 = 0;
    id v17 = 0;
    id v18 = 0;
    id v9 = (__CFString *)v16;
    id v8 = (void *)v15;
  }
  else
  {
    id v19 = [v7 clientResolved];

    if (v19)
    {
      uint64_t v20 = [v7 clientResolved];
      unsigned int v21 = [v20 itemType];

      id v17 = 0;
      unsigned int v22 = v21 - 1;
      v23 = 0;
      id v18 = 0;
      switch(v22)
      {
        case 0u:
          id v24 = v9;
          id v18 = +[GEOFeatureStyleAttributes homeStyleAttributes];
          uint64_t v25 = +[AddressBookManager sharedManager];
          uint64_t v26 = [v25 meCardHomeAddress];
          goto LABEL_23;
        case 1u:
          id v24 = v9;
          id v18 = +[GEOFeatureStyleAttributes workStyleAttributes];
          uint64_t v25 = +[AddressBookManager sharedManager];
          uint64_t v26 = [v25 meCardWorkAddress];
          goto LABEL_23;
        case 2u:
          id v18 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
          if ([(__CFString *)v9 length])
          {
            id v17 = 0;
            v23 = 0;
          }
          else
          {
            v81 = +[ParkedCarManager sharedManager];
            [v81 parkedCar];
            v82 = v11;
            uint64_t v25 = v83 = v9;

            [v25 locationDisplayString];
            uint64_t v85 = v84 = v8;

            id v11 = v82;
            id v17 = 0;
            v23 = 0;
            v95 = 0;
            id v24 = (__CFString *)v85;
            id v8 = v84;
LABEL_24:

            id v9 = v24;
          }
LABEL_25:
          if (![(__CFString *)v9 length] && v23)
          {
            [v23 shortAddress];
            uint64_t v35 = v34 = v8;

            v95 = 0;
            id v9 = (__CFString *)v35;
            id v8 = v34;
          }

          v87 = 0;
          break;
        case 3u:
          id v27 = [(__CFString *)v9 length];
          if (!v91) {
            goto LABEL_20;
          }
          id v24 = v9;
          if (!v27)
          {
            v28 = [v91 mapItem];
            v29 = [v28 _addressFormattedAsShortenedAddress];
            uint64_t v30 = sub_100A08D18(v29);
            v31 = v8;
            id v32 = (void *)v30;
            v33 = &stru_101324E70;
            if (v30) {
              v33 = (__CFString *)v30;
            }
            id v9 = v33;

            id v8 = v31;
            v95 = 0;
LABEL_20:
            id v24 = v9;
          }
          uint64_t v25 = +[AddressBookManager sharedManager];
          id v17 = [v25 meCard];
          v23 = 0;
          id v18 = 0;
          goto LABEL_24;
        case 5u:
          id v24 = v9;
          id v18 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
          uint64_t v25 = +[AddressBookManager sharedManager];
          uint64_t v26 = [v25 meCardSchoolAddress];
LABEL_23:
          v23 = (void *)v26;
          id v17 = 0;
          goto LABEL_24;
        default:
          goto LABEL_25;
      }
LABEL_29:
      id v13 = 0;
    }
    else
    {
      switch((unint64_t)[v7 _type])
      {
        case 0uLL:
        case 3uLL:
          id v13 = +[UIImage imageNamed:@"search"];
          v87 = 0;
          id v17 = 0;
          id v18 = 0;
          break;
        case 1uLL:
        case 2uLL:
          id v18 = +[GEOFeatureStyleAttributes markerStyleAttributes];
          v87 = 0;
          id v17 = 0;
          goto LABEL_29;
        case 4uLL:
          v94 = v8;
          v63 = [v7 collectionResult];
          v64 = [v63 collection];

          v65 = +[NSMutableArray arrayWithCapacity:2];
          v66 = [v64 publisherAttribution];
          v67 = [v66 displayName];

          if ([v67 length]) {
            [v65 addObject:v67];
          }
          id v68 = [v64 numberOfItems];
          if (v68)
          {
            id v69 = v68;
            v70 = +[NSBundle mainBundle];
            v71 = [v70 localizedStringForKey:@"Places [Autocomplete]" value:@"localized string not found" table:0];
            v72 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v71, v69);
            [v65 addObject:v72];
          }
          v86 = v11;
          v73 = v9;
          if ([a1 userInterfaceLayoutDirectionIsRTL])
          {
            v74 = [v65 reverseObjectEnumerator];
            [v74 allObjects];
            v75 = v64;
            v77 = v76 = v67;
            id v78 = [v77 mutableCopy];

            v67 = v76;
            v64 = v75;

            v65 = v78;
          }
          v79 = [a1 _delimiterString];
          id v9 = [v65 componentsJoinedByString:v79];

          v80 = [v64 publisherAttribution];
          v87 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v80 iconIdentifier]);

          id v17 = 0;
          id v18 = 0;
          id v13 = 0;
          id v8 = v94;
          id v11 = v86;
          break;
        default:
          v87 = 0;
          id v17 = 0;
          id v18 = 0;
          goto LABEL_29;
      }
    }
  }
  v36 = +[AutocompleteClientSource autocompleteClientSourceTitleWithType:a5];
  v93 = v8;
  v88 = v36;
  if ([v36 length])
  {
    v37 = +[NSMutableArray arrayWithCapacity:2];
    [v37 addObject:v36];
    if ([(__CFString *)v9 length]) {
      [v37 addObject:v9];
    }
    if ([a1 userInterfaceLayoutDirectionIsRTL])
    {
      v38 = [v37 reverseObjectEnumerator];
      [v38 allObjects];
      id v39 = v7;
      v40 = v13;
      id v41 = v17;
      v42 = v18;
      v43 = v11;
      v45 = v44 = v9;
      id v46 = [v45 mutableCopy];

      id v9 = v44;
      id v11 = v43;
      id v18 = v42;
      id v17 = v41;
      id v13 = v40;
      id v7 = v39;

      v37 = v46;
    }
    v47 = [a1 _delimiterString];
    uint64_t v48 = [v37 componentsJoinedByString:v47];

    id v9 = (__CFString *)v48;
    id v8 = v93;
  }
  v49 = (void *)v89;
  v50 = [_SearchResultTwoLinesContentViewModel alloc];
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_100A0B640;
  v98[3] = &unk_101314348;
  id v51 = v13;
  id v99 = v51;
  id v52 = v11;
  id v100 = v52;
  id v53 = v7;
  id v101 = v53;
  id v54 = v18;
  id v102 = v54;
  id v55 = v17;
  id v103 = v55;
  id v56 = v87;
  id v104 = v56;
  v57 = [(_BasicTwoLinesContentViewModel *)v50 initWithTitleText:v8 subtitleText:v9 imageCreationBlock:v98];
  [(_BasicTwoLinesContentViewModel *)v57 setTitleHighlightRanges:v89];
  [(_BasicTwoLinesContentViewModel *)v57 setSubtitleHighlightRanges:v95];
  v58 = [v53 clientResolved];
  v90 = v54;
  if ([v58 itemType] == 4)
  {
    id v59 = [(__CFString *)v9 length];

    if (!v59) {
      [(_SearchResultTwoLinesContentViewModel *)v57 setObservedSearchResult:v91];
    }
  }
  else
  {
  }
  v60 = [v53 mapItem];
  v61 = v60;
  if (v60)
  {
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_100A0BA84;
    v96[3] = &unk_1013142D8;
    id v97 = v60;
    [(_BasicTwoLinesContentViewModel *)v57 setPersonalizedItemForQuickActionMenuCreator:v96];
  }
  if ([v53 _type] == (id)4) {
    [(_BasicTwoLinesContentViewModel *)v57 setImageStyle:2];
  }
  [(_BasicTwoLinesContentViewModel *)v57 setAxIdentifier:@"LocalSearchCompletionCell"];

  return v57;
}

+ (id)cellModelForOfflineRegionLocalSearchCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 title];
  id v5 = [v3 titleHighlightRanges];
  id v6 = [v3 subtitle];
  id v7 = [v3 subtitleHighlightRanges];
  unsigned int v8 = [v3 _supportsOfflineDownload];
  if ((v8 & 1) == 0)
  {
    id v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"Offline map unavailable [autocomplete]" value:@"localized string not found" table:@"Offline"];

    id v7 = 0;
    id v6 = (void *)v10;
  }
  id v11 = [_SearchResultTwoLinesContentViewModel alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100A0BCA8;
  v15[3] = &unk_101314288;
  id v16 = v3;
  id v12 = v3;
  id v13 = [(_BasicTwoLinesContentViewModel *)v11 initWithTitleText:v4 subtitleText:v6 imageCreationBlock:v15];
  [(_BasicTwoLinesContentViewModel *)v13 setTitleHighlightRanges:v5];
  [(_BasicTwoLinesContentViewModel *)v13 setSubtitleHighlightRanges:v7];
  [(_BasicTwoLinesContentViewModel *)v13 setDisabled:v8 ^ 1];
  [(_BasicTwoLinesContentViewModel *)v13 setAxIdentifier:@"LocalSearchCompletionCell"];

  return v13;
}

+ (id)cellModelForRecentContact:(id)a3
{
  return [a1 cellModelForRecentContact:a3 showAutocompleteClientSource:0 autocompleteClientSourceType:0];
}

+ (id)cellModelForRecentContact:(id)a3 showAutocompleteClientSource:(BOOL)a4 autocompleteClientSourceType:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 metadata];
  id v9 = [v8 objectForKeyedSubscript:CRRecentContactMetadataFrom];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = 0;
    id v12 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:CRRecentContactMetadataFromDisplayName];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v13 = [v9 objectForKeyedSubscript:CRRecentContactMetadataFromAddress];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  uint64_t v15 = [v9 objectForKeyedSubscript:CRRecentContactMetadataFromAddressKind];

  if ([v15 isEqual:CRAddressKindEmail])
  {
    id v16 = (id *)&CNContactEmailAddressesKey;
  }
  else
  {
    if (![v15 isEqual:CRAddressKindPhoneNumber])
    {
      id v17 = 0;
      goto LABEL_17;
    }
    id v16 = (id *)&CNContactPhoneNumbersKey;
  }
  id v17 = *v16;
  if (!v14
    || (+[AddressBookManager sharedManager],
        id v18 = objc_claimAutoreleasedReturnValue(),
        [v18 senderNameForAddress:v14 ofType:v17],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v18,
        !v12))
  {
LABEL_17:
    if ([v11 length]) {
      id v19 = v11;
    }
    else {
      id v19 = 0;
    }
    id v12 = v19;
  }

LABEL_22:
  uint64_t v20 = [v7 address];
  if (v6)
  {
    unsigned int v21 = +[AutocompleteClientSource autocompleteClientSourceTitleWithType:a5 contactName:v11];
LABEL_26:

    goto LABEL_27;
  }
  if (v12)
  {
    unsigned int v22 = +[NSBundle mainBundle];
    uint64_t v23 = [v22 localizedStringForKey:@"From_Subtitle_CRRecentContact newUI" value:@"localized string not found" table:0];

    unsigned int v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v12);

    id v12 = (id)v23;
    goto LABEL_26;
  }
  unsigned int v21 = 0;
LABEL_27:
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100A0C154;
  v26[3] = &unk_101314368;
  BOOL v27 = v6;
  v26[4] = a5;
  id v24 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v20 subtitleText:v21 imageCreationBlock:v26];
  [(_BasicTwoLinesContentViewModel *)v24 setAxIdentifier:@"RecentContactCell"];

  return v24;
}

+ (id)cellModelForHistoryEntryRecentsItem:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  unsigned int v8 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  objc_opt_class();
  id v9 = v7;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11
    && ([v11 historyEntry],
        id v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 conformsToProtocol:v8],
        v12,
        v13))
  {
    id v14 = v9;
  }
  else
  {
    id v14 = 0;
  }

  if (v14)
  {
    uint64_t v15 = +[TwoLinesContentViewModelComposer _cellModelForHistoryEntryRoute:v9];
LABEL_46:
    uint64_t v48 = (void *)v15;
    goto LABEL_47;
  }
  id v16 = v9;
  id v17 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  objc_opt_class();
  id v18 = v16;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  if (v20
    && ([v20 historyEntry],
        unsigned int v21 = objc_claimAutoreleasedReturnValue(),
        unsigned int v22 = [v21 conformsToProtocol:v17],
        v21,
        v22))
  {
    id v23 = v18;
  }
  else
  {
    id v23 = 0;
  }

  if (v23)
  {
    uint64_t v15 = +[TwoLinesContentViewModelComposer _cellModelForHistoryEntryPlace:v18 showAutocompleteClientSource:v6 showPlaceContext:v5];
    goto LABEL_46;
  }
  id v24 = v18;
  uint64_t v25 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
  objc_opt_class();
  id v26 = v24;
  if (objc_opt_isKindOfClass()) {
    BOOL v27 = v26;
  }
  else {
    BOOL v27 = 0;
  }
  id v28 = v27;

  if (v28
    && ([v28 historyEntry],
        v29 = objc_claimAutoreleasedReturnValue(),
        unsigned int v30 = [v29 conformsToProtocol:v25],
        v29,
        v30))
  {
    id v31 = v26;
  }
  else
  {
    id v31 = 0;
  }

  if (v31)
  {
    uint64_t v15 = +[TwoLinesContentViewModelComposer _cellModelForHistoryEntrySearch:v26 showAutocompleteClientSource:v6];
    goto LABEL_46;
  }
  id v32 = v26;
  v33 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
  objc_opt_class();
  id v34 = v32;
  if (objc_opt_isKindOfClass()) {
    uint64_t v35 = v34;
  }
  else {
    uint64_t v35 = 0;
  }
  id v36 = v35;

  if (v36
    && ([v36 historyEntry],
        v37 = objc_claimAutoreleasedReturnValue(),
        unsigned int v38 = [v37 conformsToProtocol:v33],
        v37,
        v38))
  {
    id v39 = v34;
  }
  else
  {
    id v39 = 0;
  }

  if (v39)
  {
    uint64_t v15 = +[TwoLinesContentViewModelComposer _cellModelForHistoryEntryTransitLineItem:v34];
    goto LABEL_46;
  }
  id v40 = v34;
  id v41 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
  objc_opt_class();
  id v42 = v40;
  if (objc_opt_isKindOfClass()) {
    v43 = v42;
  }
  else {
    v43 = 0;
  }
  id v44 = v43;

  if (v44
    && ([v44 historyEntry],
        v45 = objc_claimAutoreleasedReturnValue(),
        unsigned int v46 = [v45 conformsToProtocol:v41],
        v45,
        v46))
  {
    id v47 = v42;
  }
  else
  {
    id v47 = 0;
  }

  if (v47)
  {
    uint64_t v15 = +[TwoLinesContentViewModelComposer _cellModelForHistoryEntryCuratedCollection:v42];
    goto LABEL_46;
  }
  uint64_t v48 = 0;
LABEL_47:

  return v48;
}

+ (id)_cellModelForHistoryEntryRoute:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 historyEntry];
  BOOL v6 = [v5 endWaypoint];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v4 historyEntry];
    id v9 = [v8 endWaypoint];
    uint64_t v10 = [a1 _cellModelForComposedWaypointToRoute:v9];
    goto LABEL_20;
  }
  id v41 = 0;
  id v42 = 0;
  id v11 = [v4 historyEntry];
  +[SearchResult newStartWaypointSearchResult:&v42 endWaypointSearchResult:&v41 forRouteHistoryEntry:v11];
  id v8 = v42;
  id v9 = v41;

  if ([v9 isAddressBookResult])
  {
    id v12 = [v9 address];
    unsigned int v13 = [v12 waypointCompositeName];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v9 title];
    }
    id v16 = v15;
  }
  else
  {
    id v16 = [v9 title];
  }
  if ([v8 isDynamicCurrentLocation])
  {
    id v17 = +[NSBundle mainBundle];
    id v18 = v17;
    CFStringRef v19 = @"From_my_location_recents_cell_subtitle";
LABEL_14:
    id v24 = [v17 localizedStringForKey:v19 value:@"localized string not found" table:0];
    goto LABEL_15;
  }
  id v20 = [v8 name];
  id v21 = [v20 length];

  if (!v21)
  {
    id v17 = +[NSBundle mainBundle];
    id v18 = v17;
    CFStringRef v19 = @"From_unknown_location_recents_cell_subtitle";
    goto LABEL_14;
  }
  id v18 = +[NSBundle mainBundle];
  unsigned int v22 = [v18 localizedStringForKey:@"From_in_cell" value:@"localized string not found" table:0];
  id v23 = [v8 name];
  id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23);

LABEL_15:
  uint64_t v25 = [v4 historyEntry];
  id v26 = [v25 waypoints];
  BOOL v27 = (char *)[v26 count];

  if ((unint64_t)v27 >= 3)
  {
    id v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"count_of_stops" value:@"localized string not found" table:0];
    unsigned int v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v29, v27 - 2);

    id v31 = +[NSMutableArray arrayWithCapacity:2];
    [v31 addObject:v24];
    [v31 addObject:v30];
    id v40 = v9;
    id v32 = v8;
    v33 = v16;
    if ([a1 userInterfaceLayoutDirectionIsRTL])
    {
      id v34 = [v31 reverseObjectEnumerator];
      uint64_t v35 = [v34 allObjects];
      id v36 = [v35 mutableCopy];

      id v31 = v36;
    }
    v37 = [a1 _delimiterString];
    uint64_t v38 = [v31 componentsJoinedByString:v37];

    id v24 = (void *)v38;
    id v16 = v33;
    id v8 = v32;
    id v9 = v40;
  }
  uint64_t v10 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v16 subtitleText:v24 imageCreationBlock:&stru_101314388];
  [(_BasicTwoLinesContentViewModel *)v10 setAxIdentifier:@"RecentRouteCell"];

LABEL_20:

  return v10;
}

+ (id)_cellModelForComposedWaypointToRoute:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 name];
  BOOL v6 = [v4 route];

  id v7 = [v6 persistentData];
  id v8 = [a1 _cellModelForRouteName:v5 persistentData:v7 thirdLineViewModel:0 menuProvider:0];

  return v8;
}

+ (id)cellModelForRouteData:(id)a3 thirdLineViewModel:(id)a4 menuProvider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 userProvidedName];
  if ([v11 length]) {
    [v8 userProvidedName];
  }
  else {
  id v12 = [v8 routeName];
  }

  unsigned int v13 = [a1 _cellModelForRouteName:v12 persistentData:v8 thirdLineViewModel:v10 menuProvider:v9];

  return v13;
}

+ (id)_cellModelForRouteName:(id)a3 persistentData:(id)a4 thirdLineViewModel:(id)a5 menuProvider:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unsigned int v13 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v12 subtitleText:0 imageCreationBlock:&stru_1013143A8];

  id v14 = [v11 distanceAndElevationDescriptionStringWithAttributes:&__NSDictionary0__struct];

  id v15 = [v14 attributedString];
  [(_BasicTwoLinesContentViewModel *)v13 setAttributedSubtitleText:v15];

  [(_BasicTwoLinesContentViewModel *)v13 setPlaceContextViewModel:v10];
  [(_BasicTwoLinesContentViewModel *)v13 setAxIdentifier:@"RecentCustomRouteCell"];
  if (v9)
  {
    id v16 = +[UIButton buttonWithType:0];
    id v17 = +[UIImage systemImageNamed:@"ellipsis"];
    [v16 setImage:v17 forState:0];

    [v16 setShowsMenuAsPrimaryAction:1];
    [v16 _setMenuProvider:v9];
    [v16 setAccessibilityIdentifier:@"RecentCustomRouteCellMoreButton"];
    id v18 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v16 placement:1];
    id v19 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    [v19 setDisplayedState:1];
    v22[0] = v18;
    v22[1] = v19;
    id v20 = +[NSArray arrayWithObjects:v22 count:2];
    [(_BasicTwoLinesContentViewModel *)v13 setCellAccessories:v20];
  }

  return v13;
}

+ (id)_cellModelForHistoryEntryPlace:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [a3 historyEntry];
  id v9 = [v8 geoMapItem];

  id v10 = +[MKMapItem _itemWithGeoMapItem:v9];
  id v11 = [v10 name];
  id v12 = +[NSMutableArray array];
  if (v6)
  {
    unsigned int v13 = +[AutocompleteClientSource autocompleteClientSourceTitleWithType:2];
    if ([v13 length]) {
      [v12 addObject:v13];
    }
  }
  if ([v10 _venueFeatureType] == (id)4)
  {
    id v14 = [v10 venueLabelWithContext:2];
    id v15 = [v10 _venueInfo];
    id v16 = [v15 parent];
    unsigned int v17 = [v16 featureType];

    if (v17 != 2)
    {
      id v18 = [v10 _geoMapItem];
      id v19 = [v18 addressObject];
      id v20 = [v19 venueShortAddress];

      id v21 = [v20 length];
      unsigned int v22 = v20;
      if (v21 || (v23 = objc_msgSend(v14, "length", v20), unsigned int v22 = v14, v23)) {
        [v12 addObject:v22];
      }

      goto LABEL_19;
    }
  }
  else
  {
    id v14 = [v10 _addressFormattedAsShortenedAddress];
    if ([v10 _isMapItemTypeAddress]
      && [v14 containsString:v11])
    {
      id v24 = [v10 _geoAddress];
      uint64_t v25 = [v24 structuredAddress];
      uint64_t v26 = [v25 locality];
    }
    else
    {
      BOOL v27 = [v11 uppercaseString];
      id v28 = [v14 uppercaseString];
      unsigned int v29 = [v27 isEqualToString:v28];

      if (!v29) {
        goto LABEL_17;
      }
      id v24 = [v10 _geoAddress];
      uint64_t v25 = [v24 structuredAddress];
      uint64_t v26 = [v25 _cellContent_subtitleWithTitle:v11];
    }
    unsigned int v30 = (void *)v26;

    id v14 = v30;
  }
LABEL_17:
  if ([v14 length]) {
    [v12 addObject:v14];
  }
LABEL_19:

  if ([a1 userInterfaceLayoutDirectionIsRTL])
  {
    id v31 = [v12 reverseObjectEnumerator];
    id v32 = [v31 allObjects];
    id v33 = [v32 mutableCopy];

    id v12 = v33;
  }
  id v34 = [a1 _delimiterString];
  uint64_t v35 = [v12 componentsJoinedByString:v34];

  id v36 = [_BasicTwoLinesContentViewModel alloc];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100A0D344;
  v48[3] = &unk_101314288;
  id v37 = v10;
  id v49 = v37;
  uint64_t v38 = [(_BasicTwoLinesContentViewModel *)v36 initWithTitleText:v11 subtitleText:v35 imageCreationBlock:v48];
  v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472;
  v45 = sub_100A0D418;
  unsigned int v46 = &unk_1013142D8;
  id v39 = v9;
  id v47 = v39;
  [(_BasicTwoLinesContentViewModel *)v38 setPersonalizedItemForQuickActionMenuCreator:&v43];
  if (v5)
  {
    id v40 = [PlaceContextViewModel alloc];
    id v41 = -[PlaceContextViewModel initWithMapItem:context:](v40, "initWithMapItem:context:", v37, 1, v43, v44, v45, v46);
    [(_BasicTwoLinesContentViewModel *)v38 setPlaceContextViewModel:v41];
  }
  [(_BasicTwoLinesContentViewModel *)v38 setAxIdentifier:@"RecentPlaceCell", v43, v44, v45, v46];

  return v38;
}

+ (id)_cellModelForHistoryEntrySearch:(id)a3 showAutocompleteClientSource:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 historyEntry];
  id v8 = [v7 query];

  id v9 = +[NSMutableArray array];
  if (v4)
  {
    id v10 = +[AutocompleteClientSource autocompleteClientSourceTitleWithType:1];
    if ([v10 length]) {
      [v9 addObject:v10];
    }
  }
  id v11 = [v6 historyEntry];
  id v12 = [v11 locationDisplayString];

  if ([v12 length]) {
    [v9 addObject:v12];
  }
  if ([a1 userInterfaceLayoutDirectionIsRTL])
  {
    unsigned int v13 = [v9 reverseObjectEnumerator];
    id v14 = [v13 allObjects];
    id v15 = [v14 mutableCopy];

    id v9 = v15;
  }
  id v16 = [a1 _delimiterString];
  unsigned int v17 = [v9 componentsJoinedByString:v16];

  id v18 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v8 subtitleText:v17 imageCreationBlock:&stru_1013143C8];
  [(_BasicTwoLinesContentViewModel *)v18 setAxIdentifier:@"RecentSearchCell"];

  return v18;
}

+ (id)_cellModelForHistoryEntryTransitLineItem:(id)a3
{
  BOOL v4 = [a3 historyEntry];
  BOOL v5 = [v4 lineItem];

  id v6 = [a1 cellModelForTransitLine:v5];

  return v6;
}

+ (id)_cellModelForHistoryEntryCuratedCollection:(id)a3
{
  BOOL v4 = [a3 historyEntry];
  BOOL v5 = [v4 placeCollection];

  id v6 = [v5 publisherAttribution];
  id v7 = [v6 displayName];

  id v8 = +[NSMutableArray arrayWithCapacity:2];
  if ([v7 length]) {
    [v8 addObject:v7];
  }
  id v9 = [v5 numberOfItems];
  if (v9)
  {
    id v10 = v9;
    id v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"Number of places [Curated Collection]" value:@"localized string not found" table:0];
    unsigned int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10);
    [v8 addObject:v13];
  }
  if ([a1 userInterfaceLayoutDirectionIsRTL])
  {
    id v14 = [v8 reverseObjectEnumerator];
    id v15 = [v14 allObjects];
    id v16 = [v15 mutableCopy];

    id v8 = v16;
  }
  unsigned int v17 = [a1 _delimiterString];
  id v18 = [v8 componentsJoinedByString:v17];

  id v19 = [_BasicTwoLinesContentViewModel alloc];
  id v20 = [v5 collectionTitle];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100A0D980;
  v24[3] = &unk_101314288;
  id v25 = v5;
  id v21 = v5;
  unsigned int v22 = [(_BasicTwoLinesContentViewModel *)v19 initWithTitleText:v20 subtitleText:v18 imageCreationBlock:v24];

  [(_BasicTwoLinesContentViewModel *)v22 setImageStyle:3];
  [(_BasicTwoLinesContentViewModel *)v22 setAxIdentifier:@"CuratedGuideCell"];

  return v22;
}

+ (id)cellModelForSharedTripSummary:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 title];
  BOOL v5 = [v3 subtitle];
  id v6 = [_BasicTwoLinesContentViewModel alloc];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A0DBDC;
  v10[3] = &unk_101314288;
  id v11 = v3;
  id v7 = v3;
  id v8 = [(_BasicTwoLinesContentViewModel *)v6 initWithTitleText:v4 subtitleText:v5 imageCreationBlock:v10];
  [(_BasicTwoLinesContentViewModel *)v8 setAxIdentifier:@"SharedTripSummaryCell"];

  return v8;
}

+ (id)cellModelForSharedTrip:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 listCellTitle];
  id v6 = [v4 listCellSubtitle];
  id v7 = +[NSMutableArray arrayWithCapacity:2];
  if ([v6 length]) {
    [v7 addObject:v6];
  }
  id v8 = [a1 _delimiterString];
  id v9 = [v7 componentsJoinedByString:v8];

  id v10 = [_BasicTwoLinesContentViewModel alloc];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A0DFD8;
  v14[3] = &unk_101314288;
  id v15 = v4;
  id v11 = v4;
  id v12 = [(_BasicTwoLinesContentViewModel *)v10 initWithTitleText:v5 subtitleText:v9 imageCreationBlock:v14];
  [(_BasicTwoLinesContentViewModel *)v12 setAxIdentifier:@"SharedTripCell"];

  return v12;
}

+ (id)cellModelForLocationInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 locationName];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 locationName];
  }
  else
  {
    id v6 = &stru_101324E70;
  }
  id v7 = [v3 localityName];
  id v8 = [v7 length];

  if (v8)
  {
    if ([(__CFString *)v6 length])
    {
      uint64_t v9 = [(__CFString *)v6 stringByAppendingString:@", "];

      id v6 = (__CFString *)v9;
    }
    id v10 = [v3 localityName];
    uint64_t v11 = [(__CFString *)v6 stringByAppendingString:v10];

    id v6 = (__CFString *)v11;
  }
  id v12 = [_BasicTwoLinesContentViewModel alloc];
  unsigned int v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"[LookAround Rap]" value:@"localized string not found" table:0];
  id v15 = [(_BasicTwoLinesContentViewModel *)v12 initWithTitleText:v14 subtitleText:v6 imageCreationBlock:&stru_1013143E8];

  [(_BasicTwoLinesContentViewModel *)v15 setImageStyle:0];
  id v16 = +[UIColor systemBlueColor];
  [(_BasicTwoLinesContentViewModel *)v15 setLeftImageTintColor:v16];

  [(_BasicTwoLinesContentViewModel *)v15 setAxIdentifier:@"LookAroundCell"];

  return v15;
}

+ (id)cellModelForPublisher:(id)a3 showDisclosureIndicator:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 publisherAttribution];
  id v7 = [v6 displayName];

  id v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"[Curated Collections] %lu Guides" value:@"localized string not found" table:0];
  id v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, [v5 totalCollectionCount]);

  uint64_t v11 = [_BasicTwoLinesContentViewModel alloc];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100A0E670;
  v19[3] = &unk_101314288;
  id v12 = v5;
  id v20 = v12;
  unsigned int v13 = [(_BasicTwoLinesContentViewModel *)v11 initWithTitleText:v7 subtitleText:v10 imageCreationBlock:v19];
  [(_BasicTwoLinesContentViewModel *)v13 setImageStyle:1];
  if (v4)
  {
    id v14 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    id v15 = +[UIColor tertiaryLabelColor];
    [v14 setTintColor:v15];

    id v21 = v14;
    id v16 = +[NSArray arrayWithObjects:&v21 count:1];
    [(_BasicTwoLinesContentViewModel *)v13 setCellAccessories:v16];
  }
  [(_BasicTwoLinesContentViewModel *)v13 setPublisher:v12];
  unsigned int v17 = +[UIFont system17SemiBold];
  [(_BasicTwoLinesContentViewModel *)v13 setTitleTextFont:v17];

  [(_BasicTwoLinesContentViewModel *)v13 setAxIdentifier:@"PublisherCell"];

  return v13;
}

+ (id)cellModelForSearchHomeRecentSearch:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100104234;
  BOOL v27 = sub_100104998;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100104234;
  id v21 = sub_100104998;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_100104234;
  void v15[4] = sub_100104998;
  id v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100104234;
  v13[4] = sub_100104998;
  id v14 = 0;
  BOOL v4 = [v3 historyEntry];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A0EA58;
  v12[3] = &unk_101314410;
  v12[4] = &v23;
  v12[5] = &v17;
  v12[6] = v15;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A0EB04;
  v11[3] = &unk_101314438;
  v11[4] = &v23;
  v11[5] = &v17;
  v11[6] = v13;
  [v4 ifSearch:v12 ifRoute:0 ifPlaceDisplay:v11 ifTransitLineItem:0];

  id v5 = [_BasicTwoLinesContentViewModel alloc];
  uint64_t v6 = v24[5];
  uint64_t v7 = v18[5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A0EC88;
  v10[3] = &unk_101314460;
  void v10[4] = v15;
  v10[5] = v13;
  id v8 = [(_BasicTwoLinesContentViewModel *)v5 initWithTitleText:v6 subtitleText:v7 imageCreationBlock:v10];
  [(_BasicTwoLinesContentViewModel *)v8 setAxIdentifier:@"SearchHomeRecentSearchCell"];
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v8;
}

+ (id)cellModelForRatingsHistory:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 mapItem];
  id v54 = [v4 name];

  id v53 = objc_alloc_init((Class)NSMutableAttributedString);
  id v5 = objc_alloc_init((Class)NSMutableAttributedString);
  id v6 = objc_alloc_init((Class)NSMutableAttributedString);
  uint64_t v7 = +[NSBundle mainBundle];
  id v55 = [v7 localizedStringForKey:@"[Ratings History] Your rating" value:@"localized string not found" table:0];

  id v8 = [v3 reviewedPlace];
  id v9 = [v8 recommendState];

  if (v9)
  {
    if (v9 == (id)2)
    {
      CFStringRef v10 = @"hand.thumbsup.fill";
    }
    else
    {
      if (v9 != (id)1)
      {
        uint64_t v11 = 0;
        goto LABEL_8;
      }
      CFStringRef v10 = @"hand.thumbsdown.fill";
    }
    uint64_t v11 = +[UIImage systemImageNamed:v10];
LABEL_8:
    id v12 = +[UIColor secondaryLabelColor];
    unsigned int v13 = [v11 imageWithTintColor:v12];

    id v14 = objc_alloc_init((Class)NSTextAttachment);
    id v15 = +[UIFont system15];
    [v15 pointSize];
    id v16 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 1);
    uint64_t v17 = [v13 imageWithConfiguration:v16];
    id v18 = [v17 imageWithRenderingMode:2];
    [v14 setImage:v18];

    uint64_t v19 = +[NSAttributedString attributedStringWithAttachment:v14];
    [v6 appendAttributedString:v19];

    id v20 = [objc_alloc((Class)NSAttributedString) initWithString:v55];
    [v6 appendAttributedString:v20];
  }
  id v21 = [v3 reviewedPlace];
  id v22 = [v21 numberOfPhotosAdded];

  if (!v9 && v22)
  {
    uint64_t v23 = +[UIImage systemImageNamed:@"camera.fill"];
    id v24 = +[UIColor secondaryLabelColor];
    uint64_t v25 = [v23 imageWithTintColor:v24];

    id v26 = objc_alloc_init((Class)NSTextAttachment);
    BOOL v27 = +[UIFont system15];
    [v27 pointSize];
    id v28 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 1);
    unsigned int v29 = [v25 imageWithConfiguration:v28];
    unsigned int v30 = [v29 imageWithRenderingMode:2];
    [v26 setImage:v30];

    id v31 = +[NSAttributedString attributedStringWithAttachment:v26];
    [v5 appendAttributedString:v31];

    id v32 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
    [v5 appendAttributedString:v32];
  }
  id v33 = [v3 reviewedPlace];
  id v34 = [v33 numberOfPhotosAdded];

  if (v34 == (id)1)
  {
    id v35 = objc_alloc((Class)NSMutableAttributedString);
    id v36 = +[NSBundle mainBundle];
    id v37 = v36;
    CFStringRef v38 = @"[Ratings History] 1 Photo";
  }
  else
  {
    id v39 = [v3 reviewedPlace];
    id v40 = [v39 numberOfPhotosAdded];

    if ((unint64_t)v40 < 2) {
      goto LABEL_17;
    }
    id v35 = objc_alloc((Class)NSMutableAttributedString);
    id v36 = +[NSBundle mainBundle];
    id v37 = v36;
    CFStringRef v38 = @"[Ratings History] Number of Photos";
  }
  id v41 = [v36 localizedStringForKey:v38 value:@"localized string not found" table:0];
  id v42 = [v3 reviewedPlace];
  v43 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v41, [v42 numberOfPhotosAdded]);
  id v44 = [v35 initWithString:v43];
  [v5 appendAttributedString:v44];

LABEL_17:
  if ([v6 length]) {
    [v53 appendAttributedString:v6];
  }
  if ([v5 length])
  {
    if ([v6 length])
    {
      id v45 = objc_alloc((Class)NSAttributedString);
      unsigned int v46 = +[NSBundle mainBundle];
      id v47 = [v46 localizedStringForKey:@" • " value:@"localized string not found" table:0];
      id v48 = [v45 initWithString:v47];
      [v53 appendAttributedString:v48];
    }
    [v53 appendAttributedString:v5];
  }
  id v49 = [_BasicTwoLinesContentViewModel alloc];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100A0F3C4;
  v56[3] = &unk_101314288;
  id v57 = v3;
  id v50 = v3;
  id v51 = [(_BasicTwoLinesContentViewModel *)v49 initWithTitleText:v54 subtitleText:0 imageCreationBlock:v56];
  [(_BasicTwoLinesContentViewModel *)v51 setAttributedSubtitleText:v53];
  [(_BasicTwoLinesContentViewModel *)v51 setAxIdentifier:@"RatingsHistoryCell"];

  return v51;
}

+ (id)cellModelForRAPReportsHistory:(id)a3 allowDisclosureIndicator:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 mapItem];
  if (!v7) {
    goto LABEL_4;
  }
  id v8 = (void *)v7;
  id v9 = [v6 mapItem];
  CFStringRef v10 = [v9 name];

  if (v10)
  {
    uint64_t v11 = [v6 mapItem];
    id v12 = [v11 name];
  }
  else
  {
LABEL_4:
    id v12 = [v6 reportTitle];
  }
  unsigned int v13 = objc_opt_new();
  id v14 = [v6 reportSummary];
  id v15 = [v6 dateOfReportCreation];
  id v16 = +[NSDateFormatter _maps_abbreviatedDateStringWithoutYearForDate:v15];

  if ([v16 length]) {
    [v13 addObject:v16];
  }
  if ([v14 length]) {
    [v13 addObject:v14];
  }
  uint64_t v17 = +[NSBundle mainBundle];
  id v18 = [v17 localizedStringForKey:@" • " value:@"localized string not found" table:0];
  uint64_t v19 = [v13 componentsJoinedByString:v18];

  id v20 = [_BasicTwoLinesContentViewModel alloc];
  id v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  unsigned int v30 = sub_100A0F7F4;
  id v31 = &unk_101314488;
  id v21 = v6;
  id v32 = v21;
  id v33 = a1;
  id v22 = [(_BasicTwoLinesContentViewModel *)v20 initWithTitleText:v12 subtitleText:v19 imageCreationBlock:&v28];
  uint64_t v23 = [a1 backgroundColorForRAPType:[v21 reportType:v28, v29, v30, v31]];
  [(_BasicTwoLinesContentViewModel *)v22 setLeadingImageBackgroundColor:v23];

  [(_BasicTwoLinesContentViewModel *)v22 setImageStyle:0];
  id v24 = +[UIColor whiteColor];
  [(_BasicTwoLinesContentViewModel *)v22 setLeftImageTintColor:v24];

  [(_BasicTwoLinesContentViewModel *)v22 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v22 setAxIdentifier:@"ReportAProblemHistoryCell"];
  if (v4
    && ([v21 reportStatus] == 2 || objc_msgSend(v21, "reportStatus") == 1))
  {
    id v25 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    id v34 = v25;
    id v26 = +[NSArray arrayWithObjects:&v34 count:1];
    [(_BasicTwoLinesContentViewModel *)v22 setCellAccessories:v26];
  }

  return v22;
}

+ (id)backgroundColorForRAPType:(int)a3
{
  int v5 = a3 - 8;
  if (a3 - 8) <= 9 && ((0x283u >> v5))
  {
    id v6 = +[UIColor colorNamed:](UIColor, "colorNamed:", off_101314670[v5], v3);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)_convertSymbolToIconImage:(id)a3 RAPType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
  -[ImageIconWithBackgroundConfiguration setIconSize:](v7, "setIconSize:", 30.0, 30.0);
  id v8 = +[UIColor whiteColor];
  [(ImageIconWithBackgroundConfiguration *)v7 setTintColor:v8];

  id v9 = [a1 backgroundColorForRAPType:v4];
  [(ImageIconWithBackgroundConfiguration *)v7 setBackgroundColor:v9];

  [(ImageIconWithBackgroundConfiguration *)v7 setCornerRadius:15.0];
  CFStringRef v10 = [v6 _maps_imageIconWithBackgroundConfiguration:v7];

  return v10;
}

+ (id)cellModelForUGCSuggestionContentType:(int64_t)a3 visitDate:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 1:
      id v6 = +[NSBundle mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"[UGC] Add Your Photos to Maps" value:@"localized string not found" table:0];

      id v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"[UGC] You took photos here";
      goto LABEL_9;
    case 2:
      id v12 = +[NSBundle mainBundle];
      uint64_t v7 = [v12 localizedStringForKey:@"[UGC] Rate This Place" value:@"localized string not found" table:0];

      id v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"[UGC] In your Favorites";
      goto LABEL_9;
    case 3:
      unsigned int v13 = +[NSBundle mainBundle];
      uint64_t v7 = [v13 localizedStringForKey:@"[UGC] Rate This Place" value:@"localized string not found" table:0];

      id v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"[UGC] It’s pinned.";
      goto LABEL_9;
    case 4:
      id v14 = +[NSBundle mainBundle];
      uint64_t v7 = [v14 localizedStringForKey:@"[UGC] Rate This Place" value:@"localized string not found" table:0];

      if (v5)
      {
        id v9 = objc_alloc_init((Class)NSRelativeDateTimeFormatter);
        [v9 setDateTimeStyle:1];
        [v9 setUnitsStyle:0];
        [v9 setFormattingContext:1];
        id v15 = +[NSDate date];
        id v16 = [v9 localizedStringForDate:v5 relativeToDate:v15];

        uint64_t v17 = +[NSBundle mainBundle];
        id v18 = [v17 localizedStringForKey:@"[UGC] Visited" value:@"localized string not found" table:0];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v16);
        uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      }
      else
      {
        uint64_t v11 = &stru_101324E70;
      }
LABEL_11:
      id v20 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v7 subtitleText:v11 imageCreationBlock:&stru_1013144A8];
      [(_BasicTwoLinesContentViewModel *)v20 setImageStyle:0];

      return v20;
    case 5:
      uint64_t v19 = +[NSBundle mainBundle];
      uint64_t v7 = [v19 localizedStringForKey:@"[UGC] Rate This Place" value:@"localized string not found" table:0];

      id v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"[UGC] You’re nearby";
LABEL_9:
      uint64_t v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
      goto LABEL_10;
    default:
      uint64_t v11 = &stru_101324E70;
      uint64_t v7 = &stru_101324E70;
      goto LABEL_11;
  }
}

+ (id)cellModelForOfflineMapSubscriptionInfo:(id)a3 cancelDownloadBlock:(id)a4 resumeDownloadBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  CFStringRef v10 = [v7 subscription];
  uint64_t v11 = [v10 displayName];
  if ([v11 length])
  {
    id v12 = [v7 subscription];
    [v12 displayName];
  }
  else
  {
    id v12 = +[NSBundle mainBundle];
    [v12 localizedStringForKey:@"Offline Map" value:@"localized string not found" table:@"Offline"];
  unsigned int v13 = };

  id v14 = [_OfflineMapSubscriptionTwoLinesContentViewModel alloc];
  id v15 = [v7 subscription];
  id v16 = [v15 region];
  uint64_t v17 = sub_100A10294(v16);
  id v18 = [(_OfflineMapSubscriptionTwoLinesContentViewModel *)v14 initWithTitleText:v13 subtitleText:0 cancelableImageCreationBlock:v17];

  uint64_t v19 = [v7 subscription];
  id v20 = [v19 region];
  sub_100A10338(v18, v20);

  [(_BasicTwoLinesContentViewModel *)v18 setImageCreationCanBeCached:1];
  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)v18 setSubscriptionInfo:v7];
  id v21 = [v9 copy];

  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)v18 setCancelDownloadBlock:v21];
  id v22 = [v8 copy];

  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)v18 setResumeDownloadBlock:v22];
  [(_BasicTwoLinesContentViewModel *)v18 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v18 setSubtitleUsesMonospacedNumbers:1];
  [(_BasicTwoLinesContentViewModel *)v18 setAxIdentifier:@"OfflineMapSubscriptionCell"];
  [(_OfflineMapSubscriptionTwoLinesContentViewModel *)v18 setAccessibilityLabel:v13];

  return v18;
}

+ (id)cellModelForOfflineMapSuggestion:(id)a3 downloadBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [_BasicTwoLinesContentViewModel alloc];
  id v8 = [v6 regionName];
  id v9 = [v6 suggestionSubtitle];
  CFStringRef v10 = [v6 mapRegion];
  uint64_t v11 = sub_100A10294(v10);
  id v12 = [(_BasicTwoLinesContentViewModel *)v7 initWithTitleText:v8 subtitleText:v9 cancelableImageCreationBlock:v11];

  unsigned int v13 = [v6 mapRegion];

  sub_100A10338(v12, v13);
  [(_BasicTwoLinesContentViewModel *)v12 setImageCreationCanBeCached:1];
  [(_BasicTwoLinesContentViewModel *)v12 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v12 setSubtitleUsesMonospacedNumbers:1];
  [(_BasicTwoLinesContentViewModel *)v12 setAxIdentifier:@"OfflineMapSuggestionCell"];
  id v14 = [(_BasicTwoLinesContentViewModel *)v12 titleText];
  [(_BasicTwoLinesContentViewModel *)v12 setAccessibilityLabel:v14];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A106EC;
  v23[3] = &unk_1013144D0;
  id v24 = v5;
  id v15 = v5;
  id v16 = +[UIAction actionWithHandler:v23];
  uint64_t v17 = +[UIButton buttonWithType:0 primaryAction:v16];

  id v18 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
  uint64_t v19 = +[UIImage systemImageNamed:@"arrow.down.circle" withConfiguration:v18];
  [v17 setImage:v19 forState:0];

  [v17 setAccessibilityIdentifier:@"DownloadSuggestedMap"];
  id v20 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v17 placement:1];
  id v25 = v20;
  id v21 = +[NSArray arrayWithObjects:&v25 count:1];
  [(_BasicTwoLinesContentViewModel *)v12 setCellAccessories:v21];

  return v12;
}

+ (id)cellModelForExpiredOfflineMapSubscription:(id)a3 isAvailable:(BOOL)a4 isSupportedOSVersion:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [v7 displayName];
  if ([v8 length])
  {
    id v9 = [v7 displayName];
  }
  else
  {
    CFStringRef v10 = +[NSBundle mainBundle];
    id v9 = [v10 localizedStringForKey:@"Offline Map" value:@"localized string not found" table:@"Offline"];
  }
  uint64_t v11 = +[NSBundle mainBundle];
  id v12 = v11;
  if (v6)
  {
    unsigned int v13 = [v11 localizedStringForKey:@"Tap to update [List]" value:@"localized string not found" table:@"Offline"];

    id v14 = [v7 region];
    id v15 = sub_100A10294(v14);
  }
  else
  {
    if (v5) {
      CFStringRef v16 = @"Not Available [List]";
    }
    else {
      CFStringRef v16 = @"Update OS to Restore [List]";
    }
    unsigned int v13 = [v11 localizedStringForKey:v16 value:@"localized string not found" table:@"Offline"];

    uint64_t v17 = [v7 region];
    id v18 = sub_100A10294(v17);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    void v22[2] = sub_100A10984;
    v22[3] = &unk_101314570;
    id v23 = v18;
    id v14 = v18;
    id v15 = objc_retainBlock(v22);
  }
  uint64_t v19 = [[_BasicTwoLinesContentViewModel alloc] initWithTitleText:v9 subtitleText:v13 cancelableImageCreationBlock:v15];
  id v20 = [v7 region];
  sub_100A10338(v19, v20);

  [(_BasicTwoLinesContentViewModel *)v19 setImageCreationCanBeCached:1];
  [(_BasicTwoLinesContentViewModel *)v19 setAxIdentifier:@"ExpiredOfflineMapSubscription"];
  [(_BasicTwoLinesContentViewModel *)v19 setAccessibilityLabel:v9];
  [(_BasicTwoLinesContentViewModel *)v19 setDisabled:!v6];
  [(_BasicTwoLinesContentViewModel *)v19 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v19 setSubtitleUsesMonospacedNumbers:1];

  return v19;
}

+ (id)cellModelForSavedRouteOfflineDownload:(id)a3 estimatedSizeInBytes:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = +[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:a4];
  id v7 = [_BasicTwoLinesContentViewModel alloc];
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_TITLE" value:@"localized string not found" table:@"Offline"];
  CFStringRef v10 = sub_100A10294(v5);
  uint64_t v11 = [(_BasicTwoLinesContentViewModel *)v7 initWithTitleText:v9 subtitleText:v6 cancelableImageCreationBlock:v10];

  sub_100A10338(v11, v5);
  [(_BasicTwoLinesContentViewModel *)v11 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v11 setShouldCenterImage:1];
  [(_BasicTwoLinesContentViewModel *)v11 setImageCreationCanBeCached:1];
  [(_BasicTwoLinesContentViewModel *)v11 setSubtitleUsesMonospacedNumbers:1];
  [(_BasicTwoLinesContentViewModel *)v11 setAxIdentifier:@"OfflineMapDownloadCell"];
  id v12 = [(_BasicTwoLinesContentViewModel *)v11 titleText];
  [(_BasicTwoLinesContentViewModel *)v11 setAccessibilityLabel:v12];

  return v11;
}

+ (id)cellModelForSavedRouteCalculatingOfflineRegion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_BasicTwoLinesContentViewModel alloc];
  id v5 = +[NSBundle mainBundle];
  BOOL v6 = [v5 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_TITLE" value:@"localized string not found" table:@"Offline"];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_CALCULATING" value:@"localized string not found" table:@"Offline"];
  id v9 = sub_100A10294(v3);
  CFStringRef v10 = [(_BasicTwoLinesContentViewModel *)v4 initWithTitleText:v6 subtitleText:v8 cancelableImageCreationBlock:v9];

  sub_100A10338(v10, v3);
  [(_BasicTwoLinesContentViewModel *)v10 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v10 setShouldCenterImage:1];
  [(_BasicTwoLinesContentViewModel *)v10 setImageCreationCanBeCached:1];
  [(_BasicTwoLinesContentViewModel *)v10 setSubtitleUsesMonospacedNumbers:1];
  [(_BasicTwoLinesContentViewModel *)v10 setAxIdentifier:@"OfflineMapDownloadCell"];
  uint64_t v11 = [(_BasicTwoLinesContentViewModel *)v10 titleText];
  [(_BasicTwoLinesContentViewModel *)v10 setAccessibilityLabel:v11];

  return v10;
}

+ (id)cellModelForSavedRouteCalculatingFailureForOfflineRegion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_BasicTwoLinesContentViewModel alloc];
  id v5 = +[NSBundle mainBundle];
  BOOL v6 = [v5 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_TITLE_UNAVAILABLE" value:@"localized string not found" table:@"Offline"];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_ERROR" value:@"localized string not found" table:@"Offline"];
  id v9 = sub_100A10294(v3);
  CFStringRef v10 = [(_BasicTwoLinesContentViewModel *)v4 initWithTitleText:v6 subtitleText:v8 cancelableImageCreationBlock:v9];

  sub_100A10338(v10, v3);
  [(_BasicTwoLinesContentViewModel *)v10 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v10 setShouldCenterImage:1];
  [(_BasicTwoLinesContentViewModel *)v10 setImageCreationCanBeCached:1];
  [(_BasicTwoLinesContentViewModel *)v10 setSubtitleUsesMonospacedNumbers:1];
  [(_BasicTwoLinesContentViewModel *)v10 setDisabled:1];
  [(_BasicTwoLinesContentViewModel *)v10 setAxIdentifier:@"OfflineMapDownloadCell"];
  uint64_t v11 = [(_BasicTwoLinesContentViewModel *)v10 titleText];
  [(_BasicTwoLinesContentViewModel *)v10 setAccessibilityLabel:v11];

  return v10;
}

+ (id)cellModelForSavedRouteUnavailableOfflineRegion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_BasicTwoLinesContentViewModel alloc];
  id v5 = +[NSBundle mainBundle];
  BOOL v6 = [v5 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_TITLE_UNAVAILABLE" value:@"localized string not found" table:@"Offline"];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_UNAVAILABLE" value:@"localized string not found" table:@"Offline"];
  id v9 = sub_100A10294(v3);
  CFStringRef v10 = [(_BasicTwoLinesContentViewModel *)v4 initWithTitleText:v6 subtitleText:v8 cancelableImageCreationBlock:v9];

  sub_100A10338(v10, v3);
  [(_BasicTwoLinesContentViewModel *)v10 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v10 setShouldCenterImage:1];
  [(_BasicTwoLinesContentViewModel *)v10 setImageCreationCanBeCached:1];
  [(_BasicTwoLinesContentViewModel *)v10 setSubtitleUsesMonospacedNumbers:1];
  [(_BasicTwoLinesContentViewModel *)v10 setDisabled:1];
  [(_BasicTwoLinesContentViewModel *)v10 setAxIdentifier:@"OfflineMapDownloadCell"];
  uint64_t v11 = [(_BasicTwoLinesContentViewModel *)v10 titleText];
  [(_BasicTwoLinesContentViewModel *)v10 setAccessibilityLabel:v11];

  return v10;
}

+ (id)cellModelForSavedRouteOfflineRegion:(id)a3 coveredByExistingSubscription:(id)a4
{
  id v4 = a3;
  id v5 = [_BasicTwoLinesContentViewModel alloc];
  BOOL v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_TITLE_ALREADY_DOWNLOADED" value:@"localized string not found" table:@"Offline"];
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"SAVE_ROUTE_DOWNLOAD_MAP_SUBTITLE_ALREADY_DOWNLOADED" value:@"localized string not found" table:@"Offline"];
  CFStringRef v10 = sub_100A10294(v4);
  uint64_t v11 = [(_BasicTwoLinesContentViewModel *)v5 initWithTitleText:v7 subtitleText:v9 cancelableImageCreationBlock:v10];

  sub_100A10338(v11, v4);
  [(_BasicTwoLinesContentViewModel *)v11 setAllowsSubtitleWrapping:1];
  [(_BasicTwoLinesContentViewModel *)v11 setShouldCenterImage:1];
  [(_BasicTwoLinesContentViewModel *)v11 setImageCreationCanBeCached:1];
  [(_BasicTwoLinesContentViewModel *)v11 setAxIdentifier:@"OfflineMapDownloadCell"];
  id v12 = [(_BasicTwoLinesContentViewModel *)v11 titleText];
  [(_BasicTwoLinesContentViewModel *)v11 setAccessibilityLabel:v12];

  return v11;
}

+ (id)cellModelForHistoryEntryRecentsItemProtocol:(id)a3 showAutocompleteClientSource:(BOOL)a4 showPlaceContext:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  if (v10)
  {
    uint64_t v11 = [a1 cellModelForHistoryEntryRecentsItem:v10 showAutocompleteClientSource:v6 showPlaceContext:v5];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end