@interface SearchFieldItem
+ (SearchFieldItem)searchFieldItemWithObject:(id)a3;
+ (SearchFieldItem)searchFieldItemWithObject:(id)a3 expandRecentsItem:(BOOL)a4 preserveContact:(BOOL)a5;
+ (SearchFieldItem)searchFieldItemWithWaypointRequest:(id)a3 resolvedWaypoint:(id)a4;
+ (id)searchFieldItemsForRouteHistoryEntry:(id)a3;
+ (id)searchFieldItemsForRouteInSuggestionsEntry:(id)a3;
- (AddressBookAddress)_maps_address;
- (AddressBookAddress)address;
- (BOOL)behavesAsAtom;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSearchFieldItem:(id)a3;
- (BOOL)isEquivalentAsWaypointToSearchFieldItem:(id)a3;
- (BOOL)isFindMyPerson;
- (BOOL)isSpotlightSearch;
- (BOOL)matchesWaypoint:(id)a3;
- (CLLocationCoordinate2D)coordinateHint;
- (CRRecentContact)coreRecentContact;
- (DirectionsWaypoint)personalizedDirectionsWaypoint;
- (DirectionsWaypoint)waypoint;
- (ExternalURLQuery)externalURLQuery;
- (GEOComposedWaypoint)composedWaypoint;
- (GEOComposedWaypointEVStop)evStopWaypoint;
- (GEOLatLng)latLng;
- (GEOMapItemChildPlace)childPlace;
- (GEORelatedSearchSuggestion)suggestion;
- (GEORetainedSearchMetadata)retainedSearchMetadata;
- (GEOSearchCategory)currentCategory;
- (GEOSearchCategory)searchCategory;
- (GEOSpotlightSearchPunchIn)punchInDetails;
- (HistoryEntryRecentsItem)historyItem;
- (MKLocalSearchCompletion)completion;
- (MKMapItem)mapItemIfGeocoded;
- (NSData)mapKitHandle;
- (NSString)addressString;
- (NSString)addressStringLabel;
- (NSString)completedQuery;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)externalQueryName;
- (NSString)mapKitHandleTitle;
- (NSString)originalSearchString;
- (NSString)personalizedAddressName;
- (NSString)searchString;
- (NSString)title;
- (NSString)userTypedStringForRAP;
- (NSString)waypointName;
- (PlaceCategoryItem)placeCategoryItem;
- (RoutePlanningWaypointRequest)routePlanningWaypointRequest;
- (SearchResult)searchResult;
- (VenueCategoryItem)venueCategoryItem;
- (_TtC4Maps16MapsFindMyHandle)_maps_findMyHandle;
- (_TtC4Maps16MapsFindMyHandle)findMyHandle;
- (_TtC4Maps22MapsAutocompletePerson)_maps_autoCompletePerson;
- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson;
- (id)_iconWithStyleAttributes:(id)a3 scale:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)waypointIconWithScale:(double)a3;
- (int)engineType;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)clear;
- (void)dealloc;
- (void)setAddress:(id)a3;
- (void)setAddressString:(id)a3;
- (void)setAddressStringLabel:(id)a3;
- (void)setAutocompletePerson:(id)a3;
- (void)setChildPlace:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setComposedWaypoint:(id)a3;
- (void)setCoordinateHint:(CLLocationCoordinate2D)a3;
- (void)setCoreRecentContact:(id)a3;
- (void)setEngineType:(int)a3;
- (void)setExternalQueryName:(id)a3;
- (void)setExternalURLQuery:(id)a3;
- (void)setFindMyHandle:(id)a3;
- (void)setHistoryItem:(id)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setMapKitHandleTitle:(id)a3;
- (void)setPlaceCategoryItem:(id)a3;
- (void)setPunchInDetails:(id)a3 searchString:(id)a4;
- (void)setRetainedSearchMetadata:(id)a3;
- (void)setRoutePlanningWaypointRequest:(id)a3;
- (void)setSearchCategory:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchString:(id)a3 forCompletedQuery:(id)a4;
- (void)setSuggestion:(id)a3;
- (void)setUserTypedStringForRAP:(id)a3;
- (void)setVenueCategoryItem:(id)a3;
@end

@implementation SearchFieldItem

- (NSString)searchString
{
  searchResult = self->_searchResult;
  if (searchResult)
  {
    if ([(SearchResult *)searchResult behavesAsAtom])
    {
      v4 = 0;
    }
    else
    {
      v7 = [(SearchResult *)self->_searchResult mapItem];
      if ([v7 _hasTransitDisplayName])
      {
        v4 = 0;
      }
      else
      {
        v4 = [(SearchResult *)self->_searchResult singleLineAddress];
      }
    }
    if ([v4 length])
    {
      id v8 = v4;
LABEL_14:
      v9 = v8;
LABEL_15:
      v10 = v8;
LABEL_16:

      goto LABEL_20;
    }
    v9 = [(SearchResult *)self->_searchResult title];

    if ([v9 length])
    {
      id v8 = v9;
      goto LABEL_14;
    }
    v13 = sub_1007A3D20();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = self->_searchResult;
      int v54 = 138412290;
      v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to generate search string from search result: %@", (uint8_t *)&v54, 0xCu);
    }

    v15 = +[NSBundle mainBundle];
    id v16 = [v15 localizedStringForKey:@"SearchFieldItem_UnknownLocation" value:@"localized string not found" table:0];
    goto LABEL_26;
  }
  searchCategory = self->_searchCategory;
  if (searchCategory)
  {
    v6 = [(GEOSearchCategory *)searchCategory displayString];
LABEL_19:
    v10 = v6;
    goto LABEL_20;
  }
  suggestion = self->_suggestion;
  if (suggestion)
  {
    v6 = [(GEORelatedSearchSuggestion *)suggestion searchBarDisplayToken];
    goto LABEL_19;
  }
  v17 = [(MKLocalSearchCompletion *)self->_completion category];

  completion = self->_completion;
  if (v17)
  {
    v9 = [(MKLocalSearchCompletion *)completion category];
    id v8 = [v9 displayString];
    goto LABEL_15;
  }
  if (completion)
  {
    id v19 = [(MKLocalSearchCompletion *)completion _type];
    autocompletePerson = self->_completion;
    if (!v19
      || ([autocompletePerson title],
          v21 = objc_claimAutoreleasedReturnValue(),
          id v22 = [v21 length],
          v21,
          autocompletePerson = self->_completion,
          !v22))
    {
      v6 = [autocompletePerson queryLine];
      goto LABEL_19;
    }
    goto LABEL_33;
  }
  coreRecentContact = self->_coreRecentContact;
  if (coreRecentContact)
  {
    v9 = [(CRRecentContact *)coreRecentContact displayName];
    id v24 = [v9 length];
    v25 = self->_coreRecentContact;
    if (v24) {
      [(CRRecentContact *)v25 displayName];
    }
    else {
    id v8 = [(CRRecentContact *)v25 address];
    }
    goto LABEL_15;
  }
  address = self->_address;
  if (address)
  {
    v6 = [(AddressBookAddress *)address compositeName];
    goto LABEL_19;
  }
  autocompletePerson = self->_autocompletePerson;
  if (autocompletePerson)
  {
LABEL_33:
    v6 = [autocompletePerson title];
    goto LABEL_19;
  }
  findMyHandle = self->_findMyHandle;
  if (findMyHandle)
  {
    v6 = [(MapsFindMyHandle *)findMyHandle displayName];
    goto LABEL_19;
  }
  historyItem = self->_historyItem;
  if (!historyItem)
  {
    externalURLQuery = self->_externalURLQuery;
    if (externalURLQuery)
    {
      v6 = [(ExternalURLQuery *)externalURLQuery query];
      goto LABEL_19;
    }
    addressString = self->_addressString;
    if (!addressString)
    {
      childPlace = self->_childPlace;
      if (childPlace) {
        goto LABEL_68;
      }
      if (!self->_mapKitHandle)
      {
        childPlace = self->_composedWaypoint;
        if (!childPlace)
        {
          routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
          if (routePlanningWaypointRequest)
          {
            v9 = [(RoutePlanningWaypointRequest *)routePlanningWaypointRequest waypointPlaceholder];
            v52 = [v9 name];
            v15 = v52;
            if (!v52)
            {
              v53 = [(RoutePlanningWaypointRequest *)self->_routePlanningWaypointRequest waypointRequest];
              v10 = [v53 waypointName];

              goto LABEL_27;
            }
            id v16 = v52;
LABEL_26:
            v10 = v16;
LABEL_27:

            goto LABEL_16;
          }
LABEL_75:
          addressString = self->_searchString;
          goto LABEL_76;
        }
LABEL_68:
        v6 = [(GEOMapItemChildPlace *)childPlace name];
        goto LABEL_19;
      }
      addressString = self->_mapKitHandleTitle;
    }
LABEL_76:
    v6 = addressString;
    goto LABEL_19;
  }
  v29 = historyItem;
  v30 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
  objc_opt_class();
  v31 = v29;
  if (objc_opt_isKindOfClass()) {
    v32 = v31;
  }
  else {
    v32 = 0;
  }
  v33 = v32;

  if (v33
    && ([(HistoryEntryRecentsItem *)v33 historyEntry],
        v34 = objc_claimAutoreleasedReturnValue(),
        unsigned int v35 = [v34 conformsToProtocol:v30],
        v34,
        v35))
  {
    v36 = v31;
  }
  else
  {
    v36 = 0;
  }

  if (v36)
  {
    v37 = [(HistoryEntryRecentsItem *)v36 historyEntry];
    v10 = [v37 query];

    goto LABEL_20;
  }
  v39 = self->_historyItem;
  v40 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  objc_opt_class();
  v41 = v39;
  if (objc_opt_isKindOfClass()) {
    v42 = v41;
  }
  else {
    v42 = 0;
  }
  v43 = v42;

  if (v43
    && ([(HistoryEntryRecentsItem *)v43 historyEntry],
        v44 = objc_claimAutoreleasedReturnValue(),
        unsigned int v45 = [v44 conformsToProtocol:v40],
        v44,
        v45))
  {
    v46 = v41;
  }
  else
  {
    v46 = 0;
  }

  if (!v46) {
    goto LABEL_75;
  }
  v47 = [(HistoryEntryRecentsItem *)v46 historyEntry];
  v48 = [v47 geoMapItem];
  v10 = [v48 name];

LABEL_20:

  return (NSString *)v10;
}

- (NSString)title
{
  searchResult = self->_searchResult;
  if (searchResult) {
    goto LABEL_2;
  }
  searchString = self->_searchString;
  if (searchString) {
    goto LABEL_5;
  }
  searchString = self->_addressString;
  if (searchString) {
    goto LABEL_5;
  }
  coreRecentContact = self->_coreRecentContact;
  if (coreRecentContact)
  {
    v9 = [(CRRecentContact *)coreRecentContact displayName];
    id v10 = [v9 length];
    v11 = self->_coreRecentContact;
    if (v10) {
      [(CRRecentContact *)v11 displayName];
    }
    else {
    uint64_t v12 = [(CRRecentContact *)v11 address];
    }
    goto LABEL_20;
  }
  searchCategory = self->_searchCategory;
  if (searchCategory) {
    goto LABEL_15;
  }
  venueCategoryItem = self->_venueCategoryItem;
  if (venueCategoryItem || (venueCategoryItem = self->_placeCategoryItem) != 0)
  {
    v9 = [venueCategoryItem searchCategory];
    uint64_t v12 = [v9 displayString];
LABEL_20:
    id v6 = (id)v12;
LABEL_21:

    goto LABEL_7;
  }
  searchCategory = self->_suggestion;
  if (searchCategory)
  {
LABEL_15:
    v4 = [(GEOSearchCategory *)searchCategory displayString];
    goto LABEL_6;
  }
  address = self->_address;
  if (address)
  {
    v4 = [(AddressBookAddress *)address compositeName];
    goto LABEL_6;
  }
  searchResult = self->_autocompletePerson;
  if (searchResult) {
    goto LABEL_2;
  }
  findMyHandle = self->_findMyHandle;
  if (findMyHandle)
  {
    v4 = [(MapsFindMyHandle *)findMyHandle displayName];
    goto LABEL_6;
  }
  historyItem = self->_historyItem;
  if (historyItem)
  {
    v18 = historyItem;
    id v19 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
    objc_opt_class();
    v20 = v18;
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    id v22 = v21;

    if (v22
      && ([(HistoryEntryRecentsItem *)v22 historyEntry],
          v23 = objc_claimAutoreleasedReturnValue(),
          unsigned int v24 = [v23 conformsToProtocol:v19],
          v23,
          v24))
    {
      v25 = v20;
    }
    else
    {
      v25 = 0;
    }

    if (v25)
    {
      v26 = [(HistoryEntryRecentsItem *)v25 historyEntry];
      id v6 = [v26 query];

      goto LABEL_7;
    }
    v28 = self->_historyItem;
    v29 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    objc_opt_class();
    v30 = v28;
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    v32 = v31;

    if (v32
      && ([(HistoryEntryRecentsItem *)v32 historyEntry],
          v33 = objc_claimAutoreleasedReturnValue(),
          unsigned int v34 = [v33 conformsToProtocol:v29],
          v33,
          v34))
    {
      unsigned int v35 = v30;
    }
    else
    {
      unsigned int v35 = 0;
    }

    if (v35)
    {
      v36 = [(HistoryEntryRecentsItem *)v35 historyEntry];
      v37 = [v36 geoMapItem];
      id v6 = [v37 name];

      goto LABEL_7;
    }
  }
  else
  {
    childPlace = self->_childPlace;
    if (childPlace) {
      goto LABEL_39;
    }
    if (self->_mapKitHandle)
    {
      searchString = self->_mapKitHandleTitle;
      goto LABEL_5;
    }
    routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
    if (routePlanningWaypointRequest)
    {
      v9 = [(RoutePlanningWaypointRequest *)routePlanningWaypointRequest waypointPlaceholder];
      v39 = [v9 name];
      v40 = v39;
      if (v39)
      {
        id v6 = v39;
      }
      else
      {
        v41 = [(RoutePlanningWaypointRequest *)self->_routePlanningWaypointRequest waypointRequest];
        id v6 = [v41 waypointName];
      }
      goto LABEL_21;
    }
    searchResult = self->_completion;
    if (searchResult)
    {
LABEL_2:
      v4 = [searchResult title];
LABEL_6:
      id v6 = v4;
      goto LABEL_7;
    }
    searchString = self->_completedQuery;
    if (searchString)
    {
LABEL_5:
      v4 = searchString;
      goto LABEL_6;
    }
    childPlace = self->_composedWaypoint;
    if (childPlace)
    {
LABEL_39:
      v4 = [(GEOMapItemChildPlace *)childPlace name];
      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSString)waypointName
{
  v3 = [(SearchFieldItem *)self searchResult];
  unsigned int v4 = [v3 isDynamicCurrentLocation];

  if (v4)
  {
    v5 = [(SearchFieldItem *)self searchResult];
    id v6 = [v5 title];
LABEL_5:

    goto LABEL_7;
  }
  v7 = [(SearchFieldItem *)self routePlanningWaypointRequest];

  if (v7)
  {
    v5 = [(SearchFieldItem *)self routePlanningWaypointRequest];
    id v8 = [(SearchFieldItem *)self composedWaypoint];
    id v6 = [v5 nameWithResolvedWaypoint:v8 allowCurrentLocation:1];

    goto LABEL_5;
  }
  id v6 = [(SearchFieldItem *)self title];
LABEL_7:

  return (NSString *)v6;
}

- (id)waypointIconWithScale:(double)a3
{
  v5 = [(SearchFieldItem *)self searchResult];
  unsigned int v6 = [v5 isDynamicCurrentLocation];

  if (!v6
    || (+[GEOFeatureStyleAttributes currentLocationStyleAttributes](GEOFeatureStyleAttributes, "currentLocationStyleAttributes"), v7 = objc_claimAutoreleasedReturnValue(), +[MKIconManager imageForStyle:v7 size:0 forScale:0 format:a3], id v8 = objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    v9 = [(SearchFieldItem *)self composedWaypoint];
    uint64_t v10 = [v9 findMyHandleID];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [(SearchFieldItem *)self routePlanningWaypointRequest];

      if (v12)
      {
        v13 = [(SearchFieldItem *)self routePlanningWaypointRequest];
        v14 = [v13 waypointRequest];
        id v8 = [v14 waypointIconWithScale:a3];

        if (v8) {
          goto LABEL_54;
        }
      }
    }
    else
    {
    }
    v15 = [(SearchFieldItem *)self composedWaypoint];
    uint64_t v16 = [v15 addressBookAddress];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [(SearchFieldItem *)self routePlanningWaypointRequest];

      if (v18)
      {
        id v19 = [(SearchFieldItem *)self routePlanningWaypointRequest];
        v20 = [v19 waypointRequest];
        id v8 = [v20 waypointIconWithScale:a3];

        if (v8) {
          goto LABEL_54;
        }
      }
    }
    else
    {
    }
    uint64_t v21 = [(SearchFieldItem *)self composedWaypoint];
    if (!v21) {
      goto LABEL_62;
    }
    id v22 = (void *)v21;
    v23 = [(SearchFieldItem *)self composedWaypoint];
    unsigned int v24 = [v23 styleAttributes];

    if (!v24) {
      goto LABEL_62;
    }
    v25 = [(SearchFieldItem *)self composedWaypoint];
    v26 = [v25 styleAttributes];
    id v8 = [(SearchFieldItem *)self _iconWithStyleAttributes:v26 scale:a3];

    if (!v8)
    {
LABEL_62:
      v27 = [(SearchFieldItem *)self mapItemIfGeocoded];

      if (!v27
        || ([(SearchFieldItem *)self mapItemIfGeocoded],
            v28 = objc_claimAutoreleasedReturnValue(),
            +[MKMapItem _maps_markerImageForMapItem:v28 scale:2 size:0 useMarkerFallback:a3], id v8 = objc_claimAutoreleasedReturnValue(), v28, !v8))
      {
        v29 = [(SearchFieldItem *)self routePlanningWaypointRequest];

        if (!v29) {
          goto LABEL_63;
        }
        v30 = [(SearchFieldItem *)self routePlanningWaypointRequest];
        v31 = [v30 waypointRequest];
        id v8 = [v31 waypointIconWithScale:a3];

        if (!v8)
        {
LABEL_63:
          v32 = [(SearchFieldItem *)self evStopWaypoint];

          if (!v32
            || (+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"), v33 = objc_claimAutoreleasedReturnValue(), +[MKIconManager imageForStyle:v33 size:2 forScale:0 format:a3], id v8 = objc_claimAutoreleasedReturnValue(), v33, !v8))
          {
            unsigned int v34 = [(SearchFieldItem *)self completion];

            if (!v34) {
              goto LABEL_32;
            }
            unsigned int v35 = [(SearchFieldItem *)self completion];
            v36 = [v35 iconStyleAttributes];

            if (v36)
            {
              id v37 = objc_alloc((Class)GEOFeatureStyleAttributes);
              v38 = [(SearchFieldItem *)self completion];
              v39 = [v38 iconStyleAttributes];
              id v40 = [v37 initWithGEOStyleAttributes:v39];
            }
            else
            {
              v41 = [(SearchFieldItem *)self completion];
              v42 = [v41 clientResolved];
              unsigned int v43 = [v42 itemType];

              id v40 = 0;
              switch(v43)
              {
                case 1u:
                  uint64_t v44 = +[GEOFeatureStyleAttributes homeStyleAttributes];
                  goto LABEL_30;
                case 2u:
                  uint64_t v44 = +[GEOFeatureStyleAttributes workStyleAttributes];
                  goto LABEL_30;
                case 3u:
                  uint64_t v44 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
                  goto LABEL_30;
                case 6u:
                  uint64_t v44 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
LABEL_30:
                  id v40 = (id)v44;
                  break;
                default:
                  break;
              }
            }
            id v8 = [(SearchFieldItem *)self _iconWithStyleAttributes:v40 scale:a3];

            if (!v8)
            {
LABEL_32:
              unsigned int v45 = [(SearchFieldItem *)self address];

              if (!v45)
              {
LABEL_42:
                uint64_t v50 = [(SearchFieldItem *)self venueCategoryItem];
                if (!v50) {
                  goto LABEL_59;
                }
                v51 = (void *)v50;
                v52 = [(SearchFieldItem *)self venueCategoryItem];
                v53 = [v52 searchCategory];
                int v54 = [v53 styleAttributes];

                if (!v54) {
                  goto LABEL_59;
                }
                v55 = [(SearchFieldItem *)self venueCategoryItem];
                v56 = [v55 searchCategory];
                v57 = [v56 styleAttributes];
                id v8 = [(SearchFieldItem *)self _iconWithStyleAttributes:v57 scale:a3];

                if (!v8)
                {
LABEL_59:
                  uint64_t v58 = [(SearchFieldItem *)self placeCategoryItem];
                  if (!v58) {
                    goto LABEL_60;
                  }
                  v59 = (void *)v58;
                  v60 = [(SearchFieldItem *)self placeCategoryItem];
                  v61 = [v60 searchCategory];
                  v62 = [v61 styleAttributes];

                  if (!v62) {
                    goto LABEL_60;
                  }
                  v63 = [(SearchFieldItem *)self placeCategoryItem];
                  v64 = [v63 searchCategory];
                  v65 = [v64 styleAttributes];
                  id v8 = [(SearchFieldItem *)self _iconWithStyleAttributes:v65 scale:a3];

                  if (!v8)
                  {
LABEL_60:
                    uint64_t v66 = [(SearchFieldItem *)self searchCategory];
                    if (!v66) {
                      goto LABEL_61;
                    }
                    v67 = (void *)v66;
                    v68 = [(SearchFieldItem *)self searchCategory];
                    v69 = [v68 styleAttributes];

                    if (!v69) {
                      goto LABEL_61;
                    }
                    v70 = [(SearchFieldItem *)self searchCategory];
                    v71 = [v70 styleAttributes];
                    id v8 = [(SearchFieldItem *)self _iconWithStyleAttributes:v71 scale:a3];

                    if (!v8)
                    {
LABEL_61:
                      if (!self->_searchString
                        || (+[UIImage systemImageNamed:@"magnifyingglass.circle.fill"], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
                      {
                        v72 = +[GEOFeatureStyleAttributes genericMarkerStyleAttributes];
                        id v8 = [(SearchFieldItem *)self _iconWithStyleAttributes:v72 scale:a3];
                      }
                    }
                  }
                }
                goto LABEL_54;
              }
              v46 = [(SearchFieldItem *)self address];
              unsigned int v47 = [v46 addressType];

              switch(v47)
              {
                case 3u:
                  uint64_t v48 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
                  break;
                case 2u:
                  uint64_t v48 = +[GEOFeatureStyleAttributes workStyleAttributes];
                  break;
                case 1u:
                  uint64_t v48 = +[GEOFeatureStyleAttributes homeStyleAttributes];
                  break;
                default:
                  v49 = 0;
LABEL_41:
                  id v8 = [(SearchFieldItem *)self _iconWithStyleAttributes:v49 scale:a3];

                  if (v8) {
                    goto LABEL_54;
                  }
                  goto LABEL_42;
              }
              v49 = (void *)v48;
              goto LABEL_41;
            }
          }
        }
      }
    }
  }
LABEL_54:

  return v8;
}

- (id)_iconWithStyleAttributes:(id)a3 scale:(double)a4
{
  return +[MKIconManager imageForStyle:a3 size:2 forScale:0 format:a4];
}

- (void)dealloc
{
  [(SearchFieldItem *)self clear];
  v3.receiver = self;
  v3.super_class = (Class)SearchFieldItem;
  [(SearchFieldItem *)&v3 dealloc];
}

- (void)clear
{
  addressString = self->_addressString;
  self->_addressString = 0;

  coreRecentContact = self->_coreRecentContact;
  self->_coreRecentContact = 0;

  searchResult = self->_searchResult;
  self->_searchResult = 0;

  searchCategory = self->_searchCategory;
  self->_searchCategory = 0;

  suggestion = self->_suggestion;
  self->_suggestion = 0;

  searchString = self->_searchString;
  self->_searchString = 0;

  completedQuery = self->_completedQuery;
  self->_completedQuery = 0;

  completion = self->_completion;
  self->_completion = 0;

  userTypedStringForRAP = self->_userTypedStringForRAP;
  self->_userTypedStringForRAP = 0;

  retainedSearchMetadata = self->_retainedSearchMetadata;
  self->_retainedSearchMetadata = 0;

  address = self->_address;
  self->_address = 0;

  autocompletePerson = self->_autocompletePerson;
  self->_autocompletePerson = 0;

  findMyHandle = self->_findMyHandle;
  self->_findMyHandle = 0;

  historyItem = self->_historyItem;
  self->_historyItem = 0;

  externalURLQuery = self->_externalURLQuery;
  self->_externalURLQuery = 0;

  venueCategoryItem = self->_venueCategoryItem;
  self->_venueCategoryItem = 0;

  placeCategoryItem = self->_placeCategoryItem;
  self->_placeCategoryItem = 0;

  childPlace = self->_childPlace;
  self->_childPlace = 0;

  mapKitHandle = self->_mapKitHandle;
  self->_mapKitHandle = 0;

  mapKitHandleTitle = self->_mapKitHandleTitle;
  self->_mapKitHandleTitle = 0;

  routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
  self->_routePlanningWaypointRequest = 0;

  composedWaypoint = self->_composedWaypoint;
  self->_composedWaypoint = 0;

  latLng = self->_latLng;
  self->_latLng = 0;

  punchInDetails = self->_punchInDetails;
  self->_punchInDetails = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_searchString copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v6;

  objc_storeStrong((id *)v5 + 6, self->_searchResult);
  objc_storeStrong((id *)v5 + 7, self->_completion);
  id v8 = [(NSString *)self->_userTypedStringForRAP copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 26);
  *((void *)v5 + 26) = v8;

  id v10 = [(GEORetainedSearchMetadata *)self->_retainedSearchMetadata copyWithZone:a3];
  v11 = (void *)*((void *)v5 + 27);
  *((void *)v5 + 27) = v10;

  id v12 = [(NSString *)self->_completedQuery copyWithZone:a3];
  v13 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v12;

  objc_storeStrong((id *)v5 + 8, self->_address);
  objc_storeStrong((id *)v5 + 9, self->_searchCategory);
  objc_storeStrong((id *)v5 + 10, self->_venueCategoryItem);
  objc_storeStrong((id *)v5 + 11, self->_placeCategoryItem);
  objc_storeStrong((id *)v5 + 16, self->_suggestion);
  objc_storeStrong((id *)v5 + 12, self->_historyItem);
  objc_storeStrong((id *)v5 + 13, self->_coreRecentContact);
  objc_storeStrong((id *)v5 + 17, self->_externalURLQuery);
  objc_storeStrong((id *)v5 + 19, self->_childPlace);
  id v14 = [(NSData *)self->_mapKitHandle copy];
  v15 = (void *)*((void *)v5 + 20);
  *((void *)v5 + 20) = v14;

  id v16 = [(NSString *)self->_mapKitHandleTitle copy];
  v17 = (void *)*((void *)v5 + 21);
  *((void *)v5 + 21) = v16;

  id v18 = [(RoutePlanningWaypointRequest *)self->_routePlanningWaypointRequest copy];
  id v19 = (void *)*((void *)v5 + 22);
  *((void *)v5 + 22) = v18;

  objc_storeStrong((id *)v5 + 23, self->_composedWaypoint);
  id v20 = [(GEOLatLng *)self->_latLng copy];
  uint64_t v21 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v20;

  id v22 = [(GEOSpotlightSearchPunchIn *)self->_punchInDetails copy];
  v23 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v22;

  id v24 = [(MapsAutocompletePerson *)self->_autocompletePerson copy];
  v25 = (void *)*((void *)v5 + 24);
  *((void *)v5 + 24) = v24;

  id v26 = [(MapsFindMyHandle *)self->_findMyHandle copy];
  v27 = (void *)*((void *)v5 + 25);
  *((void *)v5 + 25) = v26;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (SearchFieldItem *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(SearchFieldItem *)self isEqualToSearchFieldItem:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToSearchFieldItem:(id)a3
{
  unsigned int v4 = (SearchFieldItem *)a3;
  id v5 = v4;
  if (!v4)
  {
LABEL_70:
    unsigned __int8 v11 = 0;
    goto LABEL_71;
  }
  if (v4 != self)
  {
    if (([(NSString *)self->_searchString isEqualToString:v4->_searchString]
       || !self->_searchString && !v5->_searchString)
      && ([(SearchResult *)self->_searchResult isEqual:v5->_searchResult]
       || !self->_searchResult && !v5->_searchResult)
      && (([(MKLocalSearchCompletion *)self->_completion isEqual:v5->_completion] & 1) != 0
       || !self->_completion && !v5->_completion)
      && ([(NSString *)self->_userTypedStringForRAP isEqualToString:v5->_userTypedStringForRAP]
       || !self->_userTypedStringForRAP && !v5->_userTypedStringForRAP)
      && (([(GEORetainedSearchMetadata *)self->_retainedSearchMetadata isEqual:v5->_retainedSearchMetadata] & 1) != 0|| !self->_retainedSearchMetadata && !v5->_retainedSearchMetadata)&& (([(NSString *)self->_completedQuery isEqual:v5->_completedQuery] & 1) != 0|| !self->_completedQuery && !v5->_completedQuery)&& ([(AddressBookAddress *)self->_address isEqual:v5->_address] || !self->_address && !v5->_address)&& ([(MapsFindMyHandle *)self->_findMyHandle isEqual:v5->_findMyHandle]|| !self->_findMyHandle && !v5->_findMyHandle)&& ([(MapsAutocompletePerson *)self->_autocompletePerson isEqual:v5->_autocompletePerson]|| !self->_autocompletePerson && !v5->_autocompletePerson)&& (([(GEOSearchCategory *)self->_searchCategory isEqual:v5->_searchCategory] & 1) != 0|| !self->_searchCategory && !v5->_searchCategory)&& ([(VenueCategoryItem *)self->_venueCategoryItem isEqual:v5->_venueCategoryItem]|| !self->_venueCategoryItem && !v5->_venueCategoryItem)&& (([(PlaceCategoryItem *)self->_placeCategoryItem isEqual:v5->_placeCategoryItem] & 1) != 0|| !self->_placeCategoryItem && !v5->_placeCategoryItem)&& (([(GEORelatedSearchSuggestion *)self->_suggestion isEqual:v5->_suggestion] & 1) != 0|| !self->_suggestion && !v5->_suggestion)
      && ([(HistoryEntryRecentsItem *)self->_historyItem isEqual:v5->_historyItem]
       || !self->_historyItem && !v5->_historyItem)
      && [(ExternalURLQuery *)self->_externalURLQuery isEqualToExternalURLQuery:v5->_externalURLQuery]&& !self->_externalURLQuery&& !v5->_externalURLQuery&& (([(GEOMapItemChildPlace *)self->_childPlace isEqual:v5->_childPlace] & 1) != 0|| !self->_childPlace && !v5->_childPlace)&& (([(NSData *)self->_mapKitHandle isEqual:v5->_mapKitHandle] & 1) != 0|| !self->_mapKitHandle && !v5->_mapKitHandle)&& ([(RoutePlanningWaypointRequest *)self->_routePlanningWaypointRequest isEqual:v5->_routePlanningWaypointRequest]|| !self->_routePlanningWaypointRequest && !v5->_routePlanningWaypointRequest)&& (([(GEOComposedWaypoint *)self->_composedWaypoint isEqual:v5->_composedWaypoint] & 1) != 0|| !self->_composedWaypoint && !v5->_composedWaypoint))
    {
      coreRecentContact = v5->_coreRecentContact;
      uint64_t v7 = self->_coreRecentContact;
      id v8 = coreRecentContact;
      if ((CRRecentContact *)v7 == v8)
      {

        goto LABEL_85;
      }
      unint64_t v9 = (unint64_t)v8;
      id v10 = [(id)v7 contactID];
      if (v10 != [(id)v9 contactID])
      {

        unsigned __int8 v11 = 0;
        goto LABEL_87;
      }

      if (v7 | v9)
      {
LABEL_85:
        punchInDetails = self->_punchInDetails;
        uint64_t v7 = [(SearchFieldItem *)v5 punchInDetails];
        unsigned __int8 v11 = [(GEOSpotlightSearchPunchIn *)punchInDetails isEqual:v7];
LABEL_87:

        goto LABEL_71;
      }
    }
    goto LABEL_70;
  }
  unsigned __int8 v11 = 1;
LABEL_71:

  return v11;
}

- (BOOL)isEquivalentAsWaypointToSearchFieldItem:(id)a3
{
  unsigned int v4 = (id *)a3;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [(SearchFieldItem *)self autocompletePerson];
  BOOL v6 = [v4 autocompletePerson];
  uint64_t v7 = (uint64_t)v6;
  if (v5 && v6) {
    goto LABEL_8;
  }

  if (v5 | v7)
  {
LABEL_5:
    unsigned __int8 IsEqualToMapItemForPurpose = 0;
    goto LABEL_10;
  }
  uint64_t v5 = [(SearchFieldItem *)self findMyHandle];
  unint64_t v9 = [v4 findMyHandle];
  uint64_t v7 = (uint64_t)v9;
  if (v5)
  {
    if (v9)
    {
LABEL_8:
      unsigned __int8 IsEqualToMapItemForPurpose = [(id)v5 isEqual:v7];
LABEL_9:

      goto LABEL_10;
    }
  }

  if (v5 | v7) {
    goto LABEL_5;
  }
  if ([(SearchFieldItem *)self isEqualToSearchFieldItem:v4])
  {
    unsigned __int8 IsEqualToMapItemForPurpose = 1;
    goto LABEL_10;
  }
  searchResult = self->_searchResult;
  if (searchResult)
  {
    id v12 = v4[6];
    if (v12)
    {
      unsigned __int8 v13 = [(SearchResult *)searchResult isEqualToSearchResult:v12 forPurpose:1];
LABEL_17:
      unsigned __int8 IsEqualToMapItemForPurpose = v13;
      goto LABEL_10;
    }
  }
  historyItem = self->_historyItem;
  if (!historyItem || !v4[12]) {
    goto LABEL_25;
  }
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100103F38;
  unsigned int v43 = sub_100104828;
  id v44 = 0;
  uint64_t v33 = 0;
  unsigned int v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100103F38;
  id v37 = sub_100104828;
  id v38 = 0;
  v15 = [(HistoryEntryRecentsItem *)historyItem historyEntry];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1007A2FA8;
  v32[3] = &unk_1012F8798;
  v32[4] = &v39;
  [v15 ifSearch:0 ifRoute:0 ifPlaceDisplay:v32 ifTransitLineItem:0];

  id v16 = [v4[12] historyEntry];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1007A2FF4;
  v31[3] = &unk_1012F8798;
  v31[4] = &v33;
  [v16 ifSearch:0 ifRoute:0 ifPlaceDisplay:v31 ifTransitLineItem:0];

  if (!v40[5]) {
    goto LABEL_23;
  }
  if (v34[5])
  {
    unsigned __int8 IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();
    int v17 = 0;
  }
  else
  {
LABEL_23:
    unsigned __int8 IsEqualToMapItemForPurpose = 0;
    int v17 = 1;
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  if (v17)
  {
LABEL_25:
    routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
    if (routePlanningWaypointRequest && v4[22])
    {
      id v19 = [(RoutePlanningWaypointRequest *)routePlanningWaypointRequest waypointRequest];
      id v20 = [v4[22] waypointRequest];
      unsigned __int8 v21 = sub_100D24910(v19, v20);
    }
    else
    {
      uint64_t v22 = [(SearchFieldItem *)self evStopWaypoint];
      if (v22)
      {
        v23 = (void *)v22;
        id v24 = [v4 evStopWaypoint];

        if (v24)
        {
          uint64_t v5 = [(SearchFieldItem *)self evStopWaypoint];
          id v25 = [(id)v5 muid];
          uint64_t v7 = [v4 evStopWaypoint];
          if (v25 == [(id)v7 muid])
          {
            id v26 = [(SearchFieldItem *)self evStopWaypoint];
            uint64_t v27 = [v26 latLng];
            v28 = [v4 evStopWaypoint];
            uint64_t v29 = [v28 latLng];
            if (v27 | v29) {
              unsigned __int8 IsEqualToMapItemForPurpose = [(id)v27 isEqual:v29];
            }
            else {
              unsigned __int8 IsEqualToMapItemForPurpose = 1;
            }
          }
          else
          {
            unsigned __int8 IsEqualToMapItemForPurpose = 0;
          }
          goto LABEL_9;
        }
      }
      composedWaypoint = self->_composedWaypoint;
      if (composedWaypoint && v4[23])
      {
        unsigned __int8 v13 = -[GEOComposedWaypoint isEqual:](composedWaypoint, "isEqual:");
        goto LABEL_17;
      }
      id v19 = [(SearchFieldItem *)self waypoint];
      id v20 = [v4 waypoint];
      if (![v19 isValid] || !objc_msgSend(v20, "isValid"))
      {
        unsigned __int8 IsEqualToMapItemForPurpose = 0;
        goto LABEL_41;
      }
      unsigned __int8 v21 = [v19 isEqual:v20];
    }
    unsigned __int8 IsEqualToMapItemForPurpose = v21;
LABEL_41:
  }
LABEL_10:

  return IsEqualToMapItemForPurpose;
}

- (void)setSearchString:(id)a3
{
  unsigned int v4 = (NSString *)a3;
  if (!v4 || self->_searchString != v4)
  {
    uint64_t v7 = v4;
    [(SearchFieldItem *)self clear];
    uint64_t v5 = (NSString *)[(NSString *)v7 copy];
    searchString = self->_searchString;
    self->_searchString = v5;

    unsigned int v4 = v7;
  }
}

- (NSString)originalSearchString
{
  return self->_searchString;
}

- (void)setAddressString:(id)a3
{
  unsigned int v4 = (NSString *)a3;
  if (!v4 || self->_addressString != v4)
  {
    uint64_t v7 = v4;
    [(SearchFieldItem *)self clear];
    uint64_t v5 = (NSString *)[(NSString *)v7 copy];
    addressString = self->_addressString;
    self->_addressString = v5;

    unsigned int v4 = v7;
  }
}

- (void)setSearchCategory:(id)a3
{
  uint64_t v5 = (GEOSearchCategory *)a3;
  if (!v5 || self->_searchCategory != v5)
  {
    BOOL v6 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_searchCategory, a3);
    uint64_t v5 = v6;
  }
}

- (void)setVenueCategoryItem:(id)a3
{
  uint64_t v5 = (VenueCategoryItem *)a3;
  if (!v5 || self->_venueCategoryItem != v5)
  {
    BOOL v6 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_venueCategoryItem, a3);
    uint64_t v5 = v6;
  }
}

- (void)setPlaceCategoryItem:(id)a3
{
  uint64_t v5 = (PlaceCategoryItem *)a3;
  if (!v5 || self->_placeCategoryItem != v5)
  {
    BOOL v6 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_placeCategoryItem, a3);
    uint64_t v5 = v6;
  }
}

- (void)setSuggestion:(id)a3
{
  uint64_t v5 = (GEORelatedSearchSuggestion *)a3;
  if (!v5 || self->_suggestion != v5)
  {
    BOOL v6 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_suggestion, a3);
    uint64_t v5 = v6;
  }
}

- (void)setSearchString:(id)a3 forCompletedQuery:(id)a4
{
  unsigned __int8 v11 = (NSString *)a3;
  BOOL v6 = (NSString *)a4;
  if (!v11 || self->_searchString != v11 || self->_completedQuery != v6)
  {
    [(SearchFieldItem *)self clear];
    uint64_t v7 = (NSString *)[(NSString *)v11 copy];
    searchString = self->_searchString;
    self->_searchString = v7;

    unint64_t v9 = (NSString *)[(NSString *)v6 copy];
    completedQuery = self->_completedQuery;
    self->_completedQuery = v9;
  }
}

- (void)setSearchResult:(id)a3
{
  uint64_t v5 = (SearchResult *)a3;
  if (!v5 || self->_searchResult != v5)
  {
    unint64_t v9 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_searchResult, a3);
    BOOL v6 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
    latLng = self->_latLng;
    self->_latLng = v6;

    [(SearchResult *)v9 coordinate];
    -[GEOLatLng setLat:](self->_latLng, "setLat:");
    [(SearchResult *)v9 coordinate];
    [(GEOLatLng *)self->_latLng setLng:v8];
    uint64_t v5 = v9;
  }
}

- (void)setCompletion:(id)a3
{
  unint64_t v9 = (MKLocalSearchCompletion *)a3;
  if (self->_completion != v9)
  {
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_completion, a3);
    uint64_t v5 = [(MKLocalSearchCompletion *)v9 mapItem];
    BOOL v6 = [v5 place];
    uint64_t v7 = [v6 center];
    latLng = self->_latLng;
    self->_latLng = v7;
  }
}

- (void)setUserTypedStringForRAP:(id)a3
{
  if (self->_userTypedStringForRAP != a3)
  {
    unsigned int v4 = (NSString *)[a3 copy];
    userTypedStringForRAP = self->_userTypedStringForRAP;
    self->_userTypedStringForRAP = v4;
  }
}

- (void)setCoreRecentContact:(id)a3
{
  id v4 = a3;
  coreRecentContact = self->_coreRecentContact;
  unint64_t v11 = (unint64_t)v4;
  BOOL v6 = coreRecentContact;
  if (v6 == (CRRecentContact *)v11)
  {

    unint64_t v9 = (CRRecentContact *)v11;
LABEL_8:

    goto LABEL_9;
  }
  unint64_t v7 = (unint64_t)v6;
  id v8 = [(id)v11 contactID];
  if (v8 != [(id)v7 contactID])
  {

    goto LABEL_7;
  }

  if (!(v11 | v7))
  {
LABEL_7:
    [(SearchFieldItem *)self clear];
    id v10 = (CRRecentContact *)(id)v11;
    unint64_t v9 = self->_coreRecentContact;
    self->_coreRecentContact = v10;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setAddress:(id)a3
{
  unint64_t v9 = (AddressBookAddress *)a3;
  if (self->_address != v9)
  {
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_address, a3);
    uint64_t v5 = [(AddressBookAddress *)v9 geocodedMapItem];
    BOOL v6 = [v5 place];
    unint64_t v7 = [v6 center];
    latLng = self->_latLng;
    self->_latLng = v7;
  }
}

- (void)setHistoryItem:(id)a3
{
  uint64_t v5 = (HistoryEntryRecentsItem *)a3;
  if (self->_historyItem != v5)
  {
    BOOL v6 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_historyItem, a3);
    uint64_t v5 = v6;
  }
}

- (void)setExternalURLQuery:(id)a3
{
  uint64_t v5 = (ExternalURLQuery *)a3;
  if (self->_externalURLQuery != v5)
  {
    BOOL v6 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_externalURLQuery, a3);
    uint64_t v5 = v6;
  }
}

- (void)setChildPlace:(id)a3
{
  id v10 = (GEOMapItemChildPlace *)a3;
  if (self->_childPlace != v10)
  {
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_childPlace, a3);
    uint64_t v5 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
    latLng = self->_latLng;
    self->_latLng = v5;

    unint64_t v7 = [(GEOMapItemChildPlace *)v10 identifier];
    [v7 coordinate];
    -[GEOLatLng setLat:](self->_latLng, "setLat:");

    id v8 = [(GEOMapItemChildPlace *)v10 identifier];
    [v8 coordinate];
    [(GEOLatLng *)self->_latLng setLng:v9];
  }
}

- (void)setMapKitHandle:(id)a3
{
  if (self->_mapKitHandle != a3)
  {
    id v4 = a3;
    [(SearchFieldItem *)self clear];
    uint64_t v5 = (NSData *)[v4 copy];

    mapKitHandle = self->_mapKitHandle;
    self->_mapKitHandle = v5;
  }
}

- (void)setRoutePlanningWaypointRequest:(id)a3
{
  uint64_t v5 = (RoutePlanningWaypointRequest *)a3;
  routePlanningWaypointRequest = self->_routePlanningWaypointRequest;
  if (routePlanningWaypointRequest != v5)
  {
    unsigned __int8 v13 = v5;
    unsigned __int8 v7 = [(RoutePlanningWaypointRequest *)routePlanningWaypointRequest isEqual:v5];
    uint64_t v5 = v13;
    if ((v7 & 1) == 0)
    {
      [(SearchFieldItem *)self clear];
      objc_storeStrong((id *)&self->_routePlanningWaypointRequest, a3);
      id v8 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
      latLng = self->_latLng;
      self->_latLng = v8;

      id v10 = [(RoutePlanningWaypointRequest *)self->_routePlanningWaypointRequest waypointRequest];
      [v10 coordinate];
      -[GEOLatLng setLat:](self->_latLng, "setLat:");

      unint64_t v11 = [(RoutePlanningWaypointRequest *)self->_routePlanningWaypointRequest waypointRequest];
      [v11 coordinate];
      [(GEOLatLng *)self->_latLng setLng:v12];

      uint64_t v5 = v13;
    }
  }
}

- (void)setComposedWaypoint:(id)a3
{
  id v5 = a3;
  composedWaypoint = self->_composedWaypoint;
  unint64_t v17 = (unint64_t)v5;
  id v7 = composedWaypoint;
  if (v17 | (unint64_t)v7)
  {
    unsigned __int8 v8 = [(id)v17 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      [(SearchFieldItem *)self clear];
      objc_storeStrong((id *)&self->_composedWaypoint, a3);
      double v9 = [(id)v17 latLng];

      if (v9)
      {
        id v10 = [(id)v17 latLng];
        latLng = self->_latLng;
        self->_latLng = v10;
      }
      else
      {
        [(id)v17 coordinate];
        if (v12 != -180.0)
        {
          [(id)v17 coordinate];
          if (v13 != -180.0)
          {
            id v14 = (GEOLatLng *)objc_alloc_init((Class)GEOLatLng);
            v15 = self->_latLng;
            self->_latLng = v14;

            [(id)v17 coordinate];
            -[GEOLatLng setLat:](self->_latLng, "setLat:");
            [(id)v17 coordinate];
            [(GEOLatLng *)self->_latLng setLng:v16];
          }
        }
      }
    }
  }
}

- (void)setAutocompletePerson:(id)a3
{
  id v5 = (_TtC4Maps22MapsAutocompletePerson *)a3;
  if (self->_autocompletePerson != v5)
  {
    BOOL v6 = v5;
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_autocompletePerson, a3);
    id v5 = v6;
  }
}

- (void)setFindMyHandle:(id)a3
{
  id v5 = a3;
  findMyHandle = self->_findMyHandle;
  unint64_t v10 = (unint64_t)v5;
  id v7 = findMyHandle;
  unsigned __int8 v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [(id)v10 isEqual:v7];

    unsigned __int8 v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      [(SearchFieldItem *)self clear];
      objc_storeStrong((id *)&self->_findMyHandle, a3);
      unsigned __int8 v8 = (void *)v10;
    }
  }
}

- (void)setPunchInDetails:(id)a3 searchString:(id)a4
{
  unsigned __int8 v8 = (GEOSpotlightSearchPunchIn *)a3;
  id v7 = (NSString *)a4;
  if (self->_punchInDetails != v8 || self->_searchString != v7)
  {
    [(SearchFieldItem *)self clear];
    objc_storeStrong((id *)&self->_punchInDetails, a3);
    objc_storeStrong((id *)&self->_searchString, a4);
  }
}

- (GEOSearchCategory)currentCategory
{
  searchCategory = self->_searchCategory;
  if (searchCategory)
  {
    objc_super v3 = searchCategory;
  }
  else
  {
    objc_super v3 = [(MKLocalSearchCompletion *)self->_completion category];
  }

  return v3;
}

- (NSString)personalizedAddressName
{
  objc_super v3 = [(SearchFieldItem *)self searchString];
  id v4 = [(SearchFieldItem *)self searchResult];
  id v5 = [v4 name];

  if (v5)
  {
    BOOL v6 = [(SearchFieldItem *)self searchResult];
    uint64_t v7 = [v6 name];

    objc_super v3 = (void *)v7;
  }
  unsigned __int8 v8 = [(SearchFieldItem *)self address];

  if (v8)
  {
    unsigned __int8 v9 = [(SearchFieldItem *)self address];
    unint64_t v10 = +[AddressBookManager sharedManager];
    unint64_t v11 = [v10 meCardHomeAddress];

    if (v9 == v11)
    {
      id v18 = +[NSBundle mainBundle];
      id v19 = v18;
      CFStringRef v20 = @"Home";
    }
    else
    {
      double v12 = [(SearchFieldItem *)self address];
      double v13 = +[AddressBookManager sharedManager];
      id v14 = [v13 meCardWorkAddress];

      if (v12 == v14)
      {
        id v18 = +[NSBundle mainBundle];
        id v19 = v18;
        CFStringRef v20 = @"Work";
      }
      else
      {
        v15 = [(SearchFieldItem *)self address];
        double v16 = +[AddressBookManager sharedManager];
        unint64_t v17 = [v16 meCardSchoolAddress];

        if (v15 != v17) {
          goto LABEL_11;
        }
        id v18 = +[NSBundle mainBundle];
        id v19 = v18;
        CFStringRef v20 = @"School";
      }
    }
    uint64_t v21 = [v18 localizedStringForKey:v20 value:@"localized string not found" table:0];

    objc_super v3 = (void *)v21;
  }
LABEL_11:

  return (NSString *)v3;
}

- (BOOL)behavesAsAtom
{
  if ([(SearchResult *)self->_searchResult behavesAsAtom]
    || self->_searchCategory
    || self->_address
    || self->_coreRecentContact)
  {
    return 1;
  }
  id v5 = self->_historyItem;
  BOOL v6 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  objc_opt_class();
  uint64_t v7 = v5;
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v8 = v7;
  }
  else {
    unsigned __int8 v8 = 0;
  }
  unsigned __int8 v9 = v8;

  if (v9
    && ([(HistoryEntryRecentsItem *)v9 historyEntry],
        unint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 conformsToProtocol:v6],
        v10,
        v11))
  {
    double v12 = v7;
  }
  else
  {
    double v12 = 0;
  }

  if (v12) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = self->_routePlanningWaypointRequest != 0;
  }

  return v3;
}

- (GEOComposedWaypointEVStop)evStopWaypoint
{
  v2 = [(SearchFieldItem *)self composedWaypoint];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (GEOSpotlightSearchPunchIn)punchInDetails
{
  return self->_punchInDetails;
}

- (BOOL)isSpotlightSearch
{
  return self->_punchInDetails != 0;
}

- (NSString)description
{
  v2 = self;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  double v16 = sub_100091A6C;
  unint64_t v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(SearchFieldItem *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v8 = [(SearchFieldItem *)v5 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        unint64_t v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    unint64_t v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  unint64_t v10 = @"<nil>";
LABEL_9:

  unsigned int v11 = [v3 componentsJoinedByString:@", "];
  double v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  double v16 = sub_1007A66EC;
  unint64_t v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  id v4 = objc_retainBlock(&v14);
  [(SearchFieldItem *)v2 _maps_buildDescriptionWithBlock:v4];
  id v5 = v2;
  if (v5)
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v8 = [(SearchFieldItem *)v5 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        unint64_t v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    unint64_t v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  unint64_t v10 = @"<nil>";
LABEL_9:

  unsigned int v11 = [v3 componentsJoinedByString:@"\n"];
  double v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  id v3 = (void (**)(id, const __CFString *, NSString *))a3;
  id v5 = a3;
  BOOL v6 = [(SearchFieldItem *)self title];
  uint64_t v7 = v3[2];
  v3 += 2;
  v7(v5, @"title", v6);

  (*v3)(v5, @"searchString", self->_searchString);
  (*v3)(v5, @"searchResult", (NSString *)self->_searchResult);
  (*v3)(v5, @"completion", (NSString *)&self->_completion->super.isa);
  (*v3)(v5, @"addressBookAddress", (NSString *)self->_address);
  (*v3)(v5, @"searchCategory", (NSString *)self->_searchCategory);
  (*v3)(v5, @"venueCategoryItem", (NSString *)&self->_venueCategoryItem->super.isa);
  (*v3)(v5, @"placeCategoryItem", (NSString *)&self->_placeCategoryItem->super.isa);
  (*v3)(v5, @"historyItem", (NSString *)&self->_historyItem->super.isa);
  (*v3)(v5, @"coreRecentContact", (NSString *)self->_coreRecentContact);
  (*v3)(v5, @"addressString", self->_addressString);
  (*v3)(v5, @"childPlace", (NSString *)self->_childPlace);
  (*v3)(v5, @"routePlanningWaypointRequest", (NSString *)&self->_routePlanningWaypointRequest->super.isa);
  (*v3)(v5, @"suggestion", (NSString *)self->_suggestion);
  unsigned __int8 v8 = [(GEOComposedWaypoint *)self->_composedWaypoint shortDescription];
  (*v3)(v5, @"composedWaypoint", v8);

  unsigned __int8 v9 = [(MapsAutocompletePerson *)self->_autocompletePerson description];
  (*v3)(v5, @"autocompletePerson", v9);
}

- (DirectionsWaypoint)waypoint
{
  id v3 = objc_alloc_init(DirectionsWaypoint);
  id v4 = [(SearchFieldItem *)self searchResult];
  if (!v4)
  {
    uint64_t v7 = [(SearchFieldItem *)self address];

    if (v7)
    {
      id v5 = [(SearchFieldItem *)self address];
      [(DirectionsWaypoint *)v3 setRequestAddress:v5];
      goto LABEL_18;
    }
    unsigned __int8 v8 = [(SearchFieldItem *)self coreRecentContact];

    if (v8)
    {
      id v5 = [(SearchFieldItem *)self coreRecentContact];
      unsigned __int8 v9 = [v5 address];
      [(DirectionsWaypoint *)v3 setRequestSearchString:v9];
    }
    else
    {
      unint64_t v10 = [(SearchFieldItem *)self completion];

      if (v10)
      {
        id v5 = [(SearchFieldItem *)self completion];
        [(DirectionsWaypoint *)v3 setCompletion:v5];
        goto LABEL_18;
      }
      unsigned int v11 = [(SearchFieldItem *)self externalURLQuery];

      if (v11)
      {
        id v5 = [(SearchFieldItem *)self externalURLQuery];
        [(DirectionsWaypoint *)v3 setExternalURLQuery:v5];
        goto LABEL_18;
      }
      uint64_t v12 = [(SearchFieldItem *)self routePlanningWaypointRequest];
      if (!v12) {
        goto LABEL_17;
      }
      double v13 = (void *)v12;
      id v14 = [(SearchFieldItem *)self routePlanningWaypointRequest];
      uint64_t v15 = [v14 waypointRequest];
      double v16 = [v15 mapItemForLocationComparison];

      if (!v16)
      {
LABEL_17:
        id v19 = [(SearchFieldItem *)self searchString];
        [(DirectionsWaypoint *)v3 setRequestSearchString:v19];

        id v5 = [(SearchFieldItem *)self completedQuery];
        [(DirectionsWaypoint *)v3 setSuggestionsPrefix:v5];
        goto LABEL_18;
      }
      unint64_t v17 = [(SearchFieldItem *)self routePlanningWaypointRequest];
      id v18 = [v17 waypointRequest];
      id v5 = [v18 mapItemForLocationComparison];

      unsigned __int8 v9 = [[SearchResult alloc] initWithMapItem:v5];
      [(DirectionsWaypoint *)v3 setRequestSearch:v9];
    }

    goto LABEL_18;
  }
  id v5 = v4;
  if ([v4 type] == 4)
  {
    uint64_t v6 = +[SearchResult currentLocationSearchResult];

    id v5 = (void *)v6;
  }
  [(DirectionsWaypoint *)v3 setRequestSearch:v5];
LABEL_18:

  CFStringRef v20 = [(SearchFieldItem *)self composedWaypoint];

  if (v20)
  {
    uint64_t v21 = [(SearchFieldItem *)self composedWaypoint];
    [(DirectionsWaypoint *)v3 updateFromGEOComposedWaypoint:v21];
  }

  return v3;
}

- (DirectionsWaypoint)personalizedDirectionsWaypoint
{
  id v3 = [(SearchFieldItem *)self mapItemIfGeocoded];

  if (v3)
  {
    id v4 = [(SearchFieldItem *)self waypoint];
  }
  else
  {
    id v4 = 0;
  }

  return (DirectionsWaypoint *)v4;
}

- (BOOL)matchesWaypoint:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchFieldItem *)self searchResult];

  if (!v5)
  {
    unsigned int v11 = [(SearchFieldItem *)self address];

    if (v11)
    {
      uint64_t v6 = [(SearchFieldItem *)self address];
      uint64_t v12 = [v4 requestAddress];
    }
    else
    {
      id v14 = [(SearchFieldItem *)self coreRecentContact];

      if (v14)
      {
        uint64_t v6 = [(SearchFieldItem *)self coreRecentContact];
        uint64_t v7 = [v6 address];
        unsigned __int8 v9 = [v4 requestSearchString];
        unsigned __int8 v10 = [v7 isEqualToString:v9];
        goto LABEL_12;
      }
      double v16 = [(SearchFieldItem *)self completion];

      if (!v16)
      {
        unint64_t v17 = [(SearchFieldItem *)self externalURLQuery];

        if (!v17)
        {
          uint64_t v6 = [(SearchFieldItem *)self searchString];
          if (![v6 length])
          {
            unsigned __int8 v8 = 0;
            goto LABEL_15;
          }
          id v18 = [(SearchFieldItem *)self completedQuery];

          uint64_t v7 = [v4 requestSearchString];
          unsigned int v19 = [v6 isEqualToString:v7];
          if (v18)
          {
            if (v19)
            {
              unsigned __int8 v9 = [(SearchFieldItem *)self completedQuery];
              CFStringRef v20 = [v4 suggestionsPrefix];
              unsigned __int8 v8 = [v9 isEqualToString:v20];

              goto LABEL_13;
            }
          }
          else if (v19)
          {
            unsigned __int8 v9 = [v4 suggestionsPrefix];
            unsigned __int8 v8 = v9 == 0;
            goto LABEL_13;
          }
          unsigned __int8 v8 = 0;
          goto LABEL_14;
        }
        uint64_t v6 = [(SearchFieldItem *)self externalURLQuery];
        uint64_t v7 = [v4 externalURLQuery];
        unsigned __int8 v13 = [v6 isEqualToExternalURLQuery:v7];
        goto LABEL_8;
      }
      uint64_t v6 = [(SearchFieldItem *)self completion];
      uint64_t v12 = [v4 completion];
    }
    uint64_t v7 = (void *)v12;
    unsigned __int8 v13 = [v6 isEqual:v12];
LABEL_8:
    unsigned __int8 v8 = v13;
    goto LABEL_14;
  }
  uint64_t v6 = [(SearchFieldItem *)self searchResult];
  uint64_t v7 = [v4 requestSearch];
  unsigned __int8 v8 = 1;
  if (([v6 isEqualToSearchResult:v7 forPurpose:1] & 1) == 0)
  {
    unsigned __int8 v9 = [(SearchFieldItem *)self searchResult];
    if (![v9 isDynamicCurrentLocation])
    {
      unsigned __int8 v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    unsigned __int8 v10 = [v4 isDynamicCurrentLocation];
LABEL_12:
    unsigned __int8 v8 = v10;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  return v8;
}

- (MKMapItem)mapItemIfGeocoded
{
  id v5 = self;
  uint64_t v26 = 0;
  uint64_t v27 = (id *)&v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100103F38;
  v30 = sub_100104828;
  id v31 = 0;
  uint64_t v6 = [(SearchFieldItem *)self searchResult];

  if (v6)
  {
    uint64_t v7 = [v5 searchResult];
    unsigned int v8 = [v7 isDynamicCurrentLocation];
    if (v8)
    {
      id v2 = +[MKLocationManager sharedLocationManager];
      if ([v2 hasLocation])
      {
        unsigned __int8 v9 = +[MKMapItem mapItemForCurrentLocation];
        unsigned int v10 = v8;
      }
      else
      {
        unsigned int v10 = 0;
        unsigned __int8 v9 = 0;
      }
    }
    else
    {
      id v4 = [v5 searchResult];
      unsigned __int8 v9 = [v4 mapItem];
      unsigned int v10 = 0;
    }
    objc_storeStrong(v27 + 5, v9);
    if ((v8 & 1) == 0)
    {
    }
    if (v10) {

    }
    if ((v8 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  unsigned int v11 = [v5 historyItem];

  if (v11)
  {
    uint64_t v7 = [v5 historyItem];
    id v2 = [v7 historyEntry];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1007A500C;
    v25[3] = &unk_1012F8798;
    v25[4] = &v26;
    [v2 ifSearch:0 ifRoute:0 ifPlaceDisplay:v25 ifTransitLineItem:0];
  }
  else
  {
    uint64_t v12 = [v5 address];

    if (v12)
    {
      uint64_t v7 = [v5 address];
      uint64_t v13 = [v7 geocodedMapItem];
    }
    else
    {
      id v14 = [v5 coreRecentContact];

      if (v14)
      {
        uint64_t v7 = +[Recents sharedRecents];
        id v2 = [v5 coreRecentContact];
        uint64_t v15 = [v7 cachedMapItemForContactID:[v2 contactID]];
        id v16 = v27[5];
        v27[5] = (id)v15;

        goto LABEL_20;
      }
      uint64_t v21 = [v5 completion];

      if (!v21)
      {
        uint64_t v22 = [v5 composedWaypoint];

        if (!v22) {
          goto LABEL_22;
        }
        uint64_t v7 = [v5 composedWaypoint];
        id v2 = [v7 geoMapItem];
        if (v2)
        {
          id v23 = objc_alloc((Class)MKMapItem);
          id v5 = [v5 composedWaypoint];
          id v3 = [v5 geoMapItem];
          id v24 = [v23 initWithGeoMapItem:v3 isPlaceHolderPlace:0];
        }
        else
        {
          id v24 = 0;
        }
        objc_storeStrong(v27 + 5, v24);
        if (v2)
        {
        }
        goto LABEL_20;
      }
      uint64_t v7 = [v5 completion];
      uint64_t v13 = [v7 mapItem];
    }
    id v2 = v27[5];
    v27[5] = (id)v13;
  }
LABEL_20:

LABEL_21:
LABEL_22:
  id v17 = v27[5];
  if (v17 && ([v17 _coordinate], CLLocationCoordinate2DIsValid(v33))) {
    id v18 = v27[5];
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;
  _Block_object_dispose(&v26, 8);

  return (MKMapItem *)v19;
}

+ (SearchFieldItem)searchFieldItemWithObject:(id)a3
{
  return (SearchFieldItem *)[a1 searchFieldItemWithObject:a3 expandRecentsItem:0 preserveContact:0];
}

+ (SearchFieldItem)searchFieldItemWithObject:(id)a3 expandRecentsItem:(BOOL)a4 preserveContact:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!v8)
  {
    id v9 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 copy];
    goto LABEL_18;
  }
  uint64_t v36 = 0;
  id v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_100103F38;
  id v40 = sub_100104828;
  uint64_t v41 = objc_alloc_init(SearchFieldItem);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v37[5] setSearchCategory:v8];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v37[5] setSearchResult:v8];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v37[5] setCompletion:v8];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v37[5] setAutocompletePerson:v8];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v37[5] setFindMyHandle:v8];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v37[5] setAddress:v8];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (v6)
                {
                  id v11 = v8;
                  uint64_t v12 = [v11 historyEntry];
                  v35[0] = _NSConcreteStackBlock;
                  v35[1] = 3221225472;
                  v35[2] = sub_1007A5A24;
                  v35[3] = &unk_1012F87C0;
                  v35[4] = &v36;
                  v33[4] = &v36;
                  v34[0] = _NSConcreteStackBlock;
                  v34[1] = 3221225472;
                  v34[2] = sub_1007A5A84;
                  v34[3] = &unk_1012F4148;
                  v34[4] = &v36;
                  v33[0] = _NSConcreteStackBlock;
                  v33[1] = 3221225472;
                  v33[2] = sub_1007A5A98;
                  v33[3] = &unk_1012F8798;
                  [v12 ifSearch:v35 ifRoute:v34 ifPlaceDisplay:v33 ifTransitLineItem:0];
                }
                else
                {
                  [v37[5] setHistoryItem:v8];
                }
                goto LABEL_17;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (v5)
                {
                  [v37[5] setCoreRecentContact:v8];
                }
                else
                {
                  id v14 = [v8 address];
                  [v37[5] setAddressString:v14];
                }
                goto LABEL_17;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v13 = [v8 searchResult];
                [v37[5] setSearchResult:v13];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v37[5] setVenueCategoryItem:v8];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v37[5] setPlaceCategoryItem:v8];
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v37[5] setChildPlace:v8];
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v37[5] setRoutePlanningWaypointRequest:v8];
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v37[5] setSuggestion:v8];
                        }
                        else if ([v8 conformsToProtocol:&OBJC_PROTOCOL___GEOMapItem])
                        {
                          uint64_t v15 = [[SearchResult alloc] initWithGEOMapItem:v8];
                          [v37[5] setSearchResult:v15];
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            objc_storeStrong(v37 + 5, a3);
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v17 = v8;
                                if ([v17 isCurrentLocation])
                                {
                                  id v18 = +[SearchResult currentLocationSearchResult];
                                  [v37[5] setSearchResult:v18];
                                }
                                else
                                {
                                  [v37[5] setComposedWaypoint:v17];
                                }
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  [v37[5] setSearchString:v8];
                                  goto LABEL_17;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  uint64_t v21 = sub_1005762E4();
                                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                                  {
                                    if (v6) {
                                      uint64_t v22 = @"YES";
                                    }
                                    else {
                                      uint64_t v22 = @"NO";
                                    }
                                    id v23 = v22;
                                    if (v5) {
                                      id v24 = @"YES";
                                    }
                                    else {
                                      id v24 = @"NO";
                                    }
                                    id v25 = v24;
                                    uint64_t v26 = +[NSString stringWithFormat:@"Unable to create item from object (expand recents: %@, preserve contact: %@): %@", v23, v25, v8];
                                    *(_DWORD *)buf = 136315906;
                                    unsigned int v43 = "+[SearchFieldItem searchFieldItemWithObject:expandRecentsItem:preserveContact:]";
                                    __int16 v44 = 2080;
                                    unsigned int v45 = "SearchFieldItem.m";
                                    __int16 v46 = 1024;
                                    int v47 = 966;
                                    __int16 v48 = 2112;
                                    v49 = v26;
                                    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
                                  }
                                  if (sub_100BB36BC())
                                  {
                                    uint64_t v27 = sub_1005762E4();
                                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                                    {
                                      uint64_t v28 = +[NSThread callStackSymbols];
                                      *(_DWORD *)buf = 138412290;
                                      unsigned int v43 = v28;
                                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                                    }
                                  }
                                  id v29 = v37[5];
                                  v37[5] = 0;

                                  goto LABEL_17;
                                }
                                id v17 = v8;
                                if ([v17 type] == (id)24)
                                {
                                  id v19 = [v17 findMyWaypoint];
                                  if (!v19)
                                  {
                                    v30 = sub_1005762E4();
                                    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                                    {
                                      *(_DWORD *)buf = 136315906;
                                      unsigned int v43 = "+[SearchFieldItem searchFieldItemWithObject:expandRecentsItem:preserveContact:]";
                                      __int16 v44 = 2080;
                                      unsigned int v45 = "SearchFieldItem.m";
                                      __int16 v46 = 1024;
                                      int v47 = 961;
                                      __int16 v48 = 2080;
                                      v49 = "waypoint != nil";
                                      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
                                    }

                                    if (sub_100BB36BC())
                                    {
                                      id v31 = sub_1005762E4();
                                      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                                      {
                                        v32 = +[NSThread callStackSymbols];
                                        *(_DWORD *)buf = 138412290;
                                        unsigned int v43 = v32;
                                        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                                      }
                                    }
                                  }
                                  CFStringRef v20 = [[SearchResult alloc] initWithComposedWaypoint:v19];
                                  [v37[5] setSearchResult:v20];
                                }
                              }

                              goto LABEL_17;
                            }
                            id v16 = [v8 pin];
                            [v37[5] setSearchResult:v16];
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_17:
  id v9 = v37[5];
  _Block_object_dispose(&v36, 8);

LABEL_18:

  return (SearchFieldItem *)v9;
}

+ (SearchFieldItem)searchFieldItemWithWaypointRequest:(id)a3 resolvedWaypoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && ![v7 isCurrentLocation])
  {
    id v9 = (id *)objc_alloc_init((Class)a1);
    [v9 setRoutePlanningWaypointRequest:v6];
    objc_storeStrong(v9 + 23, a4);
  }
  else
  {
    id v9 = [a1 searchFieldItemWithObject:v8];
  }

  return (SearchFieldItem *)v9;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (CLLocationCoordinate2D)coordinateHint
{
  double latitude = self->_coordinateHint.latitude;
  double longitude = self->_coordinateHint.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinateHint:(CLLocationCoordinate2D)a3
{
  self->_coordinateHint = a3;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (MKLocalSearchCompletion)completion
{
  return self->_completion;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (VenueCategoryItem)venueCategoryItem
{
  return self->_venueCategoryItem;
}

- (PlaceCategoryItem)placeCategoryItem
{
  return self->_placeCategoryItem;
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
}

- (CRRecentContact)coreRecentContact
{
  return self->_coreRecentContact;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (NSString)addressStringLabel
{
  return self->_addressStringLabel;
}

- (void)setAddressStringLabel:(id)a3
{
}

- (GEORelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (ExternalURLQuery)externalURLQuery
{
  return self->_externalURLQuery;
}

- (NSString)externalQueryName
{
  return self->_externalQueryName;
}

- (void)setExternalQueryName:(id)a3
{
}

- (GEOMapItemChildPlace)childPlace
{
  return self->_childPlace;
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (NSString)mapKitHandleTitle
{
  return self->_mapKitHandleTitle;
}

- (void)setMapKitHandleTitle:(id)a3
{
}

- (RoutePlanningWaypointRequest)routePlanningWaypointRequest
{
  return self->_routePlanningWaypointRequest;
}

- (GEOComposedWaypoint)composedWaypoint
{
  return self->_composedWaypoint;
}

- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson
{
  return self->_autocompletePerson;
}

- (_TtC4Maps16MapsFindMyHandle)findMyHandle
{
  return self->_findMyHandle;
}

- (NSString)userTypedStringForRAP
{
  return self->_userTypedStringForRAP;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (void)setRetainedSearchMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_userTypedStringForRAP, 0);
  objc_storeStrong((id *)&self->_findMyHandle, 0);
  objc_storeStrong((id *)&self->_autocompletePerson, 0);
  objc_storeStrong((id *)&self->_composedWaypoint, 0);
  objc_storeStrong((id *)&self->_routePlanningWaypointRequest, 0);
  objc_storeStrong((id *)&self->_mapKitHandleTitle, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_childPlace, 0);
  objc_storeStrong((id *)&self->_externalQueryName, 0);
  objc_storeStrong((id *)&self->_externalURLQuery, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_addressStringLabel, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_coreRecentContact, 0);
  objc_storeStrong((id *)&self->_historyItem, 0);
  objc_storeStrong((id *)&self->_placeCategoryItem, 0);
  objc_storeStrong((id *)&self->_venueCategoryItem, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_punchInDetails, 0);
}

+ (id)searchFieldItemsForRouteInSuggestionsEntry:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v24 = 0;
    goto LABEL_29;
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 containsKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"])
  {
    BOOL v5 = [v3 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
    if (v5)
    {
      id v6 = v5;
      id v7 = (char *)[v5 waypointsCount];
      id v8 = (char *)[v3 uint64ForKey:@"MapsSuggestionsResumeRouteWaypointIndex"];
      if (v8 < v7)
      {
        id v9 = v8;
        do
        {
          unsigned int v10 = objc_alloc_init(SearchFieldItem);
          id v11 = [SearchResult alloc];
          uint64_t v12 = [v6 waypointsAtIndex:v9];
          uint64_t v13 = [(SearchResult *)v11 initWithComposedWaypoint:v12];
          [(SearchFieldItem *)v10 setSearchResult:v13];

          [v4 addObject:v10];
          ++v9;
        }
        while (v7 != v9);
      }
      if (![v4 count])
      {
        uint64_t v26 = sub_1007A3D20();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          int v28 = 134217984;
          id v29 = [v6 waypointsCount];
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to extract any items from MSG entry (expected %lu)", (uint8_t *)&v28, 0xCu);
        }

        id v24 = 0;
        goto LABEL_28;
      }
      id v14 = (char *)[v4 count];
      uint64_t v15 = sub_1007A3D20();
      id v16 = v15;
      if (v14 >= v7)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 134218240;
          id v29 = [v4 count];
          __int16 v30 = 2048;
          id v31 = v7;
          id v17 = v16;
          os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_26;
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v28 = 134218240;
        id v29 = [v4 count];
        __int16 v30 = 2048;
        id v31 = v7;
        id v17 = v16;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Extracted %lu items from MSG entry (expected %lu)", (uint8_t *)&v28, 0x16u);
      }

      id v24 = v4;
      goto LABEL_28;
    }
  }
  id v6 = [v3 MKMapItem];
  id v19 = [v3 findMyWaypoint];
  if (v19)
  {
    CFStringRef v20 = objc_alloc_init(SearchFieldItem);
    uint64_t v21 = [[SearchResult alloc] initWithComposedWaypoint:v19];
    [(SearchFieldItem *)v20 setSearchResult:v21];

    [v4 addObject:v20];
    uint64_t v22 = sub_1007A3D20();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      id v23 = "Extracted item from findMyWaypoint in MSG entry";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v28, 2u);
    }
  }
  else
  {
    if (!v6)
    {
      sub_1007A3D20();
      CFStringRef v20 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, &v20->super, OS_LOG_TYPE_ERROR, "Unable to extract any items from MSG entry (no route storage, no find my info, no map item)", (uint8_t *)&v28, 2u);
      }
      id v24 = 0;
      goto LABEL_20;
    }
    CFStringRef v20 = objc_alloc_init(SearchFieldItem);
    id v25 = [[SearchResult alloc] initWithMapItem:v6];
    [(SearchFieldItem *)v20 setSearchResult:v25];

    [v4 addObject:v20];
    uint64_t v22 = sub_1007A3D20();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      id v23 = "Extracted item from MapItem in MSG entry";
      goto LABEL_18;
    }
  }

  id v24 = v4;
LABEL_20:

LABEL_28:
LABEL_29:

  return v24;
}

+ (id)searchFieldItemsForRouteHistoryEntry:(id)a3
{
  id v3 = a3;
  id v4 = [v3 endWaypoint];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = +[SearchResult currentLocationSearchResult];
    id v7 = +[SearchFieldItem searchFieldItemWithObject:v6];
    v37[0] = v7;
    id v8 = [v3 endWaypoint];
    id v9 = +[SearchFieldItem searchFieldItemWithObject:v8];
    v37[1] = v9;
    unsigned int v10 = +[NSArray arrayWithObjects:v37 count:2];

LABEL_3:
    goto LABEL_13;
  }
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) == 0
    && (MapsFeature_IsEnabled_Maps420() & 1) == 0
    && !MapsFeature_IsEnabled_Maps182())
  {
    uint64_t v22 = [v3 startWaypoint];
    id v23 = +[SearchFieldItem searchFieldItemWithObject:v22];
    id v24 = v23;
    if (v23)
    {
      id v6 = v23;
    }
    else
    {
      id v25 = +[SearchResult currentLocationSearchResult];
      id v6 = +[SearchFieldItem searchFieldItemWithObject:v25];
    }
    uint64_t v26 = [v3 endWaypoint];
    uint64_t v27 = +[SearchFieldItem searchFieldItemWithObject:v26];
    int v28 = v27;
    if (v27)
    {
      id v7 = v27;
    }
    else
    {
      id v29 = +[SearchResult currentLocationSearchResult];
      id v7 = +[SearchFieldItem searchFieldItemWithObject:v29];
    }
    v30[0] = v6;
    v30[1] = v7;
    unsigned int v10 = +[NSArray arrayWithObjects:v30 count:2];
    id v8 = sub_1007A3D20();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Created items from non-MPR history entry: %@", buf, 0xCu);
    }
    goto LABEL_3;
  }
  id v6 = [v3 waypoints];
  unsigned int v10 = sub_100099700(v6, &stru_1012F8800);
  id v11 = [v10 count];
  id v12 = [v6 count];
  uint64_t v13 = sub_1007A3D20();
  id v7 = v13;
  if (v11 >= v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v19 = [v10 count];
    id v20 = [v6 count];
    id v16 = sub_100099700(v10, &stru_1012F8860);
    *(_DWORD *)buf = 134218499;
    id v32 = v19;
    __int16 v33 = 2048;
    id v34 = v20;
    __int16 v35 = 2113;
    uint64_t v36 = v16;
    id v17 = v7;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    id v14 = [v10 count];
    id v15 = [v6 count];
    id v16 = sub_100099700(v10, &stru_1012F8840);
    *(_DWORD *)buf = 134218499;
    id v32 = v14;
    __int16 v33 = 2048;
    id v34 = v15;
    __int16 v35 = 2113;
    uint64_t v36 = v16;
    id v17 = v7;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl((void *)&_mh_execute_header, v17, v18, "Extracted %lu items from history entry (expected %lu): %{private}@", buf, 0x20u);

LABEL_13:

  return v10;
}

- (_TtC4Maps22MapsAutocompletePerson)_maps_autoCompletePerson
{
  id v3 = [(SearchFieldItem *)self autocompletePerson];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(SearchFieldItem *)self searchResult];
    id v5 = [v6 autocompletePerson];
  }

  return (_TtC4Maps22MapsAutocompletePerson *)v5;
}

- (_TtC4Maps16MapsFindMyHandle)_maps_findMyHandle
{
  id v3 = [(SearchFieldItem *)self findMyHandle];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(SearchFieldItem *)self searchResult];
    id v5 = [v6 findMyHandle];
  }

  return (_TtC4Maps16MapsFindMyHandle *)v5;
}

- (AddressBookAddress)_maps_address
{
  id v3 = [(SearchFieldItem *)self address];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(SearchFieldItem *)self searchResult];
    id v5 = [v6 address];
  }

  return (AddressBookAddress *)v5;
}

- (BOOL)isFindMyPerson
{
  id v3 = [(SearchFieldItem *)self _maps_autoCompletePerson];
  uint64_t v4 = [(SearchFieldItem *)self _maps_findMyHandle];
  uint64_t v5 = [v3 handle];
  BOOL v6 = (v5 | v4) != 0;

  return v6;
}

@end