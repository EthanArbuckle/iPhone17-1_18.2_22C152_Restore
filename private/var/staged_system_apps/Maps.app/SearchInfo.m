@interface SearchInfo
+ (BOOL)isChainResultWithTicket:(id)a3 searchResults:(id)a4;
+ (BOOL)shouldShowRAPWithTicket:(id)a3;
+ (BOOL)supportClientMapRegionCorrection;
+ (SearchInfo)searchInfoWithMapItems:(id)a3 traits:(id)a4 placeInfo:(id)a5 boundingRegion:(id)a6 addressBookAddress:(id)a7 searchType:(unsigned int)a8 retainedSearchMetadata:(id)a9 relatedSections:(id)a10 searchSectionList:(id)a11;
+ (SearchInfo)searchInfoWithResults:(id)a3;
+ (SearchInfo)searchInfoWithResults:(id)a3 boundingMapRegion:(id)a4;
+ (SearchInfo)searchInfoWithResults:(id)a3 boundingMapRegion:(id)a4 autocompleterPerson:(id)a5;
+ (SearchInfo)searchInfoWithResults:(id)a3 mapRegion:(id *)a4;
+ (SearchInfo)searchInfoWithResults:(id)a3 ticket:(id)a4;
+ (SearchInfo)searchInfoWithSearchInfo:(id)a3 refinedIndex:(unint64_t)a4;
+ (SearchInfo)searchInfoWithTicket:(id)a3 addressBookAddress:(id)a4 searchType:(unsigned int)a5;
+ (SearchInfo)searchInfoWithTicket:(id)a3 addressBookAddress:(id)a4 searchType:(unsigned int)a5 forRefinementSearchForBookmark:(id)a6;
+ (SearchInfo)searchInfoWithTicket:(id)a3 searchType:(unsigned int)a4;
+ (id)headerDisplayNameWithTicket:(id)a3;
+ (id)placeCollectionsWithTicket:(id)a3;
+ (id)searchDotPlacesWithTicket:(id)a3;
+ (id)styleAttributesWithTicket:(id)a3;
+ (id)subHeaderDisplayNameWithTicket:(id)a3;
- (BOOL)canRedoSearch;
- (BOOL)disableAdditionalViewportPadding;
- (BOOL)enableStructuredRAPAffordance;
- (BOOL)hasRelatedSearchSuggestion;
- (BOOL)isChainResults;
- (BOOL)isSearchAlongRoute;
- (BOOL)prefersAddressOverCategory;
- (BOOL)shouldAllowManualRedoButton;
- (BOOL)shouldInjectSearchResults;
- (BOOL)shouldPreserveResults;
- (BOOL)showDymSuggestionCloseButton;
- (BOOL)singlePlaceCollection;
- (BOOL)singleResultMode;
- (GEODirectionIntent)directionIntent;
- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata;
- (GEOMapRegion)mapRegion;
- (GEOMapRegion)requestedMapRegion;
- (GEOPublisher)publisher;
- (GEORelatedSearchSuggestion)defaultSuggestion;
- (GEOResolvedItem)clientResolvedResult;
- (GEOResultRefinementGroup)resultRefinementGroup;
- (GEOResultRefinementTime)openAt;
- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold;
- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold;
- (GEOSearchSectionList)searchSectionList;
- (GEOSearchSessionData)searchSessionData;
- (GEOSpotlightSearchPunchIn)punchInDetails;
- (GEOStyleAttributes)styleAttributes;
- (MKMapItemIdentifier)spotlightMapsIdentifier;
- (NSArray)browseCategories;
- (NSArray)placeCollections;
- (NSArray)relatedEntitySections;
- (NSArray)results;
- (NSArray)searchDotPlaces;
- (NSArray)substitutes;
- (NSArray)suggestions;
- (NSString)headerDisplayName;
- (NSString)resultDisplayHeader;
- (NSString)searchText;
- (NSString)subHeaderDisplayName;
- (SearchFieldItem)searchFieldItem;
- (SearchInfo)initWithSearchResults:(id)a3 boundingMapRegion:(id)a4;
- (SearchResult)selectedResult;
- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata;
- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson;
- (double)dymSuggestionVisibleTime;
- (id)description;
- (int)mapDisplayType;
- (int)searchResultType;
- (int)searchResultViewType;
- (int64_t)sortOrder;
- (unint64_t)selectedIndex;
- (void)addDotPlacesFromSearchInfo:(id)a3;
- (void)setCanRedoSearch:(BOOL)a3;
- (void)setClientResolvedResult:(id)a3;
- (void)setDirectionIntent:(id)a3;
- (void)setEnableStructuredRAPAffordance:(BOOL)a3;
- (void)setGuideSummaryLayoutMetadata:(id)a3;
- (void)setPunchInDetails:(id)a3;
- (void)setRequestedMapRegion:(id)a3;
- (void)setResultRefinementGroup:(id)a3;
- (void)setResults:(id)a3;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSearchFieldItem:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setShouldAllowManualRedoButton:(BOOL)a3;
- (void)setShouldPreserveResults:(BOOL)a3;
- (void)setSpotlightMapsIdentifier:(id)a3;
- (void)updateSearchInfo:(id)a3;
@end

@implementation SearchInfo

+ (BOOL)supportClientMapRegionCorrection
{
  if (qword_10160EF70 != -1) {
    dispatch_once(&qword_10160EF70, &stru_1012ED7F0);
  }
  return byte_1015E4760;
}

- (SearchInfo)initWithSearchResults:(id)a3 boundingMapRegion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SearchInfo;
  v9 = [(SearchInfo *)&v33 init];
  v10 = v9;
  if (v9)
  {
    v9->_searchResultType = 1;
    objc_storeStrong((id *)&v9->_results, a3);
    p_mapRegion = (void **)&v10->_mapRegion;
    objc_storeStrong((id *)&v10->_mapRegion, a4);
    v10->_chainResults = 0;
    v10->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    if ([v7 count] == (id)1 && *p_mapRegion)
    {
      v12 = [v7 firstObject];
      v13 = [v12 mapItem];

      v14 = [v13 _styleAttributes];
      if ([v14 isLabelPOI]
        && +[SearchInfo supportClientMapRegionCorrection])
      {
        GEOMapRectForMapRegion();
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        [v13 _coordinate];
        MKMapPoint v23 = MKMapPointForCoordinate(v34);
        double v24 = vabdd_f64(v16 + v20, v23.x);
        double v25 = vabdd_f64(v16, v23.x);
        double v26 = vabdd_f64(v18 + v22, v23.y);
        double v27 = vabdd_f64(v18, v23.y);
        if (v24 <= v25) {
          double v24 = v25;
        }
        if (v26 <= v27) {
          double v28 = v27;
        }
        else {
          double v28 = v26;
        }
        id v29 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v23.x - v24, v23.y - v28, v24 + v24, v28 + v28];
        v30 = *p_mapRegion;
        *p_mapRegion = v29;
      }
    }
    v31 = v10;
  }

  return v10;
}

- (BOOL)shouldInjectSearchResults
{
  v3 = [(SearchInfo *)self searchFieldItem];
  v4 = [v3 venueCategoryItem];

  if (!v4) {
    return 1;
  }
  v5 = [(SearchInfo *)self searchFieldItem];
  v6 = [v5 venueCategoryItem];
  BOOL v7 = [v6 displayMode] != 2;

  return v7;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_results count] > a3) {
    self->_selectedIndex = a3;
  }
}

- (SearchResult)selectedResult
{
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex >= [(NSArray *)self->_results count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_results objectAtIndexedSubscript:self->_selectedIndex];
  }

  return (SearchResult *)v4;
}

+ (SearchInfo)searchInfoWithResults:(id)a3
{
  id v3 = a3;
  v4 = [[SearchInfo alloc] initWithSearchResults:v3 boundingMapRegion:0];

  return v4;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 ticket:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[SearchInfo alloc] initWithSearchResults:v6 boundingMapRegion:0];

  if (v5)
  {
    v7->_canRedoSearch = [v5 shouldEnableRedoSearch];
    v7->_shouldAllowManualRedoButton = [v5 shouldAllowManualRedoButton];
    uint64_t v8 = [v5 searchAutoRedoThreshold];
    searchAutoRedoThreshold = v7->_searchAutoRedoThreshold;
    v7->_searchAutoRedoThreshold = (GEOSearchAutoRedoThreshold *)v8;

    uint64_t v10 = [v5 searchRedoButtonThreshold];
    searchRedoButtonThreshold = v7->_searchRedoButtonThreshold;
    v7->_searchRedoButtonThreshold = (GEOSearchRedoButtonThreshold *)v10;

    uint64_t v12 = [v5 resultRefinementGroup];
    resultRefinementGroup = v7->_resultRefinementGroup;
    v7->_resultRefinementGroup = (GEOResultRefinementGroup *)v12;

    uint64_t v14 = [v5 searchSessionData];
    searchSessionData = v7->_searchSessionData;
    v7->_searchSessionData = (GEOSearchSessionData *)v14;
  }

  return v7;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 mapRegion:(id *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  id v12 = a3;
  v13 = +[GEOMapRegion _mapkit_mapRegionForCoordinateRegion:](GEOMapRegion, "_mapkit_mapRegionForCoordinateRegion:", v11, v10, v9, v8);
  uint64_t v14 = [[SearchInfo alloc] initWithSearchResults:v12 boundingMapRegion:v13];

  return v14;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 boundingMapRegion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [[SearchInfo alloc] initWithSearchResults:v6 boundingMapRegion:v5];

  return v7;
}

+ (SearchInfo)searchInfoWithResults:(id)a3 boundingMapRegion:(id)a4 autocompleterPerson:(id)a5
{
  double v7 = (_TtC4Maps22MapsAutocompletePerson *)a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [[SearchInfo alloc] initWithSearchResults:v9 boundingMapRegion:v8];

  autocompletePerson = v10->_autocompletePerson;
  v10->_autocompletePerson = v7;

  return v10;
}

+ (SearchInfo)searchInfoWithMapItems:(id)a3 traits:(id)a4 placeInfo:(id)a5 boundingRegion:(id)a6 addressBookAddress:(id)a7 searchType:(unsigned int)a8 retainedSearchMetadata:(id)a9 relatedSections:(id)a10 searchSectionList:(id)a11
{
  uint64_t v11 = *(void *)&a8;
  id v16 = a3;
  id v54 = a4;
  id v57 = a5;
  id v53 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  double v20 = v16;
  id v55 = v18;
  id v56 = a11;
  v52 = v17;
  if (v17 && [v16 count] == (id)1)
  {
    double v21 = [SearchResult alloc];
    double v22 = [v16 firstObject];
    MKMapPoint v23 = [v18 firstObject];
    double v24 = [(SearchResult *)v21 initWithMapItem:v22 searchResultType:v11 addressBookAddress:v17 retainedSearchMetadata:v23 resultIndex:0];

    [(SearchResult *)v24 setPlaceInfo:v57];
    double v25 = v54;
    -[SearchResult setGeoMapServiceTraitSource:](v24, "setGeoMapServiceTraitSource:", [v54 source]);
    double v26 = [SearchInfo alloc];
    v63 = v24;
    double v27 = +[NSArray arrayWithObjects:&v63 count:1];
    double v28 = v26;
    id v29 = v53;
    v30 = [(SearchInfo *)v28 initWithSearchResults:v27 boundingMapRegion:v53];

    id v18 = v55;
  }
  else
  {
    v51 = v19;
    double v24 = (SearchResult *)[objc_alloc((Class)NSMutableArray) initWithCapacity:[v16 count]];
    double v25 = v54;
    if ([v16 count])
    {
      unint64_t v31 = 0;
      do
      {
        if (v31 >= (unint64_t)[v18 count])
        {
          v32 = 0;
        }
        else
        {
          v32 = [v18 objectAtIndexedSubscript:v31];
        }
        objc_super v33 = [v16 objectAtIndexedSubscript:v31];
        CLLocationCoordinate2D v34 = [v33 _identifier];
        v35 = [v34 geoMapItemIdentifier];

        v36 = -[SearchResult initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:]([SearchResult alloc], "initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:", v33, v11, 0, v32, [v56 indexOfItemWithIdentifier:v35]);
        [(SearchResult *)v36 setPlaceInfo:v57];
        -[SearchResult setGeoMapServiceTraitSource:](v36, "setGeoMapServiceTraitSource:", [v54 source]);
        [(SearchResult *)v24 addObject:v36];

        ++v31;
        id v18 = v55;
      }
      while (v31 < (unint64_t)[v16 count]);
    }
    v37 = +[CarDisplayController sharedInstance];
    unsigned __int8 v38 = [v37 isCurrentlyConnectedToAnyCarScene];

    if ((v38 & 1) == 0)
    {
      id v50 = v16;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v39 = v51;
      id v40 = [v39 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v59;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v59 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            unsigned int v45 = [v44 index:v50];
            if ((unint64_t)[(SearchResult *)v24 count] >= v45)
            {
              v46 = [v44 relatedPlaceCollections];
              id v47 = [v46 count];

              if (v47)
              {
                v48 = [[SearchResult alloc] initWithRelatedSection:v44];
                [(SearchResult *)v24 insertObject:v48 atIndex:v45];
              }
            }
          }
          id v41 = [v39 countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v41);
      }

      double v20 = v50;
      double v25 = v54;
      id v18 = v55;
    }
    id v29 = v53;
    v30 = [[SearchInfo alloc] initWithSearchResults:v24 boundingMapRegion:v53];
    id v19 = v51;
  }

  return v30;
}

+ (SearchInfo)searchInfoWithTicket:(id)a3 searchType:(unsigned int)a4
{
  return (SearchInfo *)[a1 searchInfoWithTicket:a3 addressBookAddress:0 searchType:*(void *)&a4];
}

+ (SearchInfo)searchInfoWithTicket:(id)a3 addressBookAddress:(id)a4 searchType:(unsigned int)a5
{
  return (SearchInfo *)[a1 searchInfoWithTicket:a3 addressBookAddress:a4 searchType:*(void *)&a5 forRefinementSearchForBookmark:0];
}

+ (SearchInfo)searchInfoWithTicket:(id)a3 addressBookAddress:(id)a4 searchType:(unsigned int)a5 forRefinementSearchForBookmark:(id)a6
{
  id v10 = a3;
  id v93 = a4;
  id v11 = a6;
  id v12 = [v10 exactMapItems];
  v91 = [v10 refinedMapItems];
  id v13 = [v91 count];
  id v14 = v13;
  v92 = v12;
  if (v11)
  {
    id v90 = v13;
    unsigned int v15 = a5;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v16 = v12;
    id v17 = [v16 countByEnumeratingWithState:&v94 objects:v98 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v95;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v95 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          double v22 = [v11 title];
          [v21 setName:v22];
        }
        id v18 = [v16 countByEnumeratingWithState:&v94 objects:v98 count:16];
      }
      while (v18);
    }

    id v12 = v92;
    a5 = v15;
    id v14 = v90;
  }
  id v88 = a1;
  if ([v12 count])
  {
    id v23 = v12;
    uint64_t v24 = [v10 retainedSearchMetadata];
  }
  else
  {
    id v23 = v91;
    uint64_t v24 = 0;
  }
  if (v14) {
    uint64_t v25 = 5;
  }
  else {
    uint64_t v25 = a5;
  }
  double v26 = objc_opt_new();
  [v10 applyToPlaceInfo:v26];
  double v27 = [v10 traits];
  double v28 = [v10 boundingRegion];
  id v29 = [v10 relatedEntitySections];
  v30 = [v10 searchSectionList];
  v89 = (void *)v24;
  uint64_t v31 = [v88 searchInfoWithMapItems:v23 traits:v27 placeInfo:v26 boundingRegion:v28 addressBookAddress:v93 searchType:v25 retainedSearchMetadata:v24 relatedSections:v29 searchSectionList:v30];

  v32 = [(id)v31 results];
  *(unsigned char *)(v31 + 12) = [v88 isChainResultWithTicket:v10 searchResults:v32];

  *(unsigned char *)(v31 + 14) = [v10 isChainResultSet];
  uint64_t v33 = [v10 relatedSearchSuggestions];
  CLLocationCoordinate2D v34 = *(void **)(v31 + 64);
  *(void *)(v31 + 64) = v33;

  uint64_t v35 = [v10 browseCategories];
  v36 = *(void **)(v31 + 72);
  *(void *)(v31 + 72) = v35;

  uint64_t v37 = [v10 defaultRelatedSuggestion];
  unsigned __int8 v38 = *(void **)(v31 + 88);
  *(void *)(v31 + 88) = v37;

  *(_DWORD *)(v31 + 20) = [v10 searchResultType];
  uint64_t v39 = [v10 clientResolvedResult];
  id v40 = *(void **)(v31 + 112);
  *(void *)(v31 + 112) = v39;

  uint64_t v41 = [v10 directionIntent];
  uint64_t v42 = *(void **)(v31 + 120);
  *(void *)(v31 + 120) = v41;

  if (!*(_DWORD *)(v31 + 20)) {
    *(_DWORD *)(v31 + 20) = 1;
  }
  v43 = [v10 resultDisplayHeader];
  v44 = v43;
  if (v43)
  {
    id v45 = v43;
  }
  else
  {
    id v45 = [v10 sectionHeader];
  }
  v46 = *(void **)(v31 + 96);
  *(void *)(v31 + 96) = v45;

  uint64_t v47 = [v10 displayHeaderSubstitutes];
  v48 = *(void **)(v31 + 104);
  *(void *)(v31 + 104) = v47;

  *(double *)(v31 + 128) = (double)[v10 dymSuggestionVisibleTime];
  *(unsigned char *)(v31 + 13) = [v10 showDymSuggestionCloseButton];
  *(unsigned char *)(v31 + 10) = [v10 shouldEnableRedoSearch];
  *(unsigned char *)(v31 + 11) = [v10 shouldAllowManualRedoButton];
  uint64_t v49 = [v88 headerDisplayNameWithTicket:v10];
  id v50 = *(void **)(v31 + 144);
  *(void *)(v31 + 144) = v49;

  uint64_t v51 = [v88 subHeaderDisplayNameWithTicket:v10];
  v52 = *(void **)(v31 + 152);
  *(void *)(v31 + 152) = v51;

  uint64_t v53 = [v88 placeCollectionsWithTicket:v10];
  id v54 = *(void **)(v31 + 168);
  *(void *)(v31 + 168) = v53;

  uint64_t v55 = [v10 relatedEntitySections];
  id v56 = *(void **)(v31 + 160);
  *(void *)(v31 + 160) = v55;

  id v57 = [v10 publisherResults];
  long long v58 = [v57 firstObject];
  uint64_t v59 = [v58 publisher];
  long long v60 = *(void **)(v31 + 176);
  *(void *)(v31 + 176) = v59;

  uint64_t v61 = [v88 styleAttributesWithTicket:v10];
  v62 = *(void **)(v31 + 184);
  *(void *)(v31 + 184) = v61;

  uint64_t v63 = [v88 searchDotPlacesWithTicket:v10];
  v64 = *(void **)(v31 + 192);
  *(void *)(v31 + 192) = v63;

  uint64_t v65 = [v10 searchAutoRedoThreshold];
  v66 = *(void **)(v31 + 200);
  *(void *)(v31 + 200) = v65;

  uint64_t v67 = [v10 searchRedoButtonThreshold];
  v68 = *(void **)(v31 + 208);
  *(void *)(v31 + 208) = v67;

  v69 = [v10 placeSummaryLayoutMetadata];

  if (v69)
  {
    v70 = [_TtC4Maps20PlaceSummaryMetadata alloc];
    v71 = [v10 placeSummaryLayoutMetadata];
    v72 = [(PlaceSummaryMetadata *)v70 initWithMetadata:v71];
    v73 = *(void **)(v31 + 216);
    *(void *)(v31 + 216) = v72;
  }
  uint64_t v74 = [v10 resultRefinementGroup];
  v75 = *(void **)(v31 + 232);
  *(void *)(v31 + 232) = v74;

  uint64_t v76 = [v10 searchSectionList];
  v77 = *(void **)(v31 + 224);
  *(void *)(v31 + 224) = v76;

  if ([v10 disableAdditionalViewportPadding]) {
    BOOL v78 = (unint64_t)[v23 count] > 1;
  }
  else {
    BOOL v78 = 0;
  }
  *(unsigned char *)(v31 + 15) = v78;
  *(_DWORD *)(v31 + 24) = [v10 searchResultViewType];
  uint64_t v79 = [v10 mapItemIdentifierForSpotlight];
  v80 = *(void **)(v31 + 248);
  *(void *)(v31 + 248) = v79;

  *(unsigned char *)(v31 + 16) = [v88 shouldShowRAPWithTicket:v10];
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0
    || MapsFeature_IsEnabled_Maps182())
  {
    v81 = [v10 traits];
    *(unsigned char *)(v31 + 9) = [v81 navigating];
  }
  uint64_t v82 = [v10 guideSummaryLayoutMetadata];
  v83 = *(void **)(v31 + 264);
  *(void *)(v31 + 264) = v82;

  uint64_t v84 = [v10 searchSessionData];
  v85 = *(void **)(v31 + 256);
  *(void *)(v31 + 256) = v84;

  if (GEOConfigGetBOOL()) {
    unsigned int v86 = 1;
  }
  else {
    unsigned int v86 = [v10 mapDisplayType];
  }
  *(_DWORD *)(v31 + 28) = v86;

  return (SearchInfo *)(id)v31;
}

+ (SearchInfo)searchInfoWithSearchInfo:(id)a3 refinedIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 results];
  if ((unint64_t)[v6 count] >= a4)
  {
    double v7 = [v5 results];
    id v8 = [v7 objectAtIndexedSubscript:a4];

    if (v8)
    {
      id v9 = [SearchInfo alloc];
      unsigned int v15 = v8;
      id v10 = +[NSArray arrayWithObjects:&v15 count:1];
      id v11 = [v8 place];
      id v12 = [v11 mapRegion];
      id v13 = [(SearchInfo *)v9 initWithSearchResults:v10 boundingMapRegion:v12];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (void)addDotPlacesFromSearchInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSMutableSet);
  id v6 = [(SearchInfo *)self searchDotPlaces];
  id v10 = [v5 initWithArray:v6];

  double v7 = [v4 searchDotPlaces];

  [v10 addObjectsFromArray:v7];
  id v8 = [v10 allObjects];
  searchDotPlaces = self->_searchDotPlaces;
  self->_searchDotPlaces = v8;
}

- (BOOL)singlePlaceCollection
{
  id v3 = [(SearchInfo *)self results];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(SearchInfo *)self placeCollections];
    BOOL v4 = [v5 count] == (id)1;
  }
  return v4;
}

- (BOOL)singleResultMode
{
  id v3 = [(SearchInfo *)self suggestions];
  if ([v3 count])
  {
    BOOL v4 = [(SearchInfo *)self defaultSuggestion];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  id v6 = [(SearchInfo *)self relatedEntitySections];
  id v7 = [v6 count];

  id v8 = [(SearchInfo *)self resultRefinementGroup];

  id v9 = [(SearchInfo *)self results];
  if ([v9 count] != (id)1 || v5 || v7)
  {
  }
  else
  {

    if (!v8) {
      return 1;
    }
  }
  return 0;
}

- (GEOResultRefinementTime)openAt
{
  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = [(SearchInfo *)self resultRefinementGroup];
    BOOL v4 = [v3 resultRefinementBar];
    BOOL v5 = [v4 resultRefinements];

    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v10 type] == (id)4)
          {
            id v12 = [v10 openOptions];
            id v13 = [v12 openAt];

            if ([v13 isSelected] && (objc_msgSend(v13, "timeStamp"), v14 > 0.0)) {
              unsigned int v15 = v13;
            }
            else {
              unsigned int v15 = 0;
            }
            id v11 = v15;

            goto LABEL_17;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_17:
  }
  else
  {
    id v11 = 0;
  }

  return (GEOResultRefinementTime *)v11;
}

- (int64_t)sortOrder
{
  uint64_t v3 = [(SearchFieldItem *)self->_searchFieldItem placeCategoryItem];
  int64_t result = 0;
  if (v3)
  {
    BOOL v4 = (void *)v3;
    NSUInteger v5 = [(NSArray *)self->_results count];

    if (v5 > 0x13) {
      return 1;
    }
  }
  return result;
}

- (BOOL)hasRelatedSearchSuggestion
{
  uint64_t v3 = [(SearchInfo *)self resultDisplayHeader];
  id v4 = [v3 length];

  NSUInteger v5 = [(SearchInfo *)self substitutes];
  if ([v5 count]) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

+ (id)headerDisplayNameWithTicket:(id)a3
{
  id v3 = a3;
  id v4 = [v3 searchResultSections];
  NSUInteger v5 = [v4 firstObject];
  BOOL v6 = [v5 headerDisplayName];
  id v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v3 searchResultSections];
    id v9 = [v8 firstObject];
    id v10 = [v9 headerDisplayName];

LABEL_5:
    goto LABEL_6;
  }
  id v11 = [v3 categorySearchResultSection];
  id v12 = [v11 headerDisplayName];
  id v13 = [v12 length];

  if (v13)
  {
    uint64_t v8 = [v3 categorySearchResultSection];
    id v10 = [v8 headerDisplayName];
    goto LABEL_5;
  }
  id v10 = 0;
LABEL_6:

  return v10;
}

+ (id)subHeaderDisplayNameWithTicket:(id)a3
{
  id v3 = a3;
  id v4 = [v3 searchResultSections];
  NSUInteger v5 = [v4 firstObject];
  BOOL v6 = [v5 subHeaderDisplayName];
  id v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v3 searchResultSections];
    id v9 = [v8 firstObject];
    id v10 = [v9 subHeaderDisplayName];

LABEL_5:
    goto LABEL_6;
  }
  id v11 = [v3 categorySearchResultSection];
  id v12 = [v11 subHeaderDisplayName];
  id v13 = [v12 length];

  if (v13)
  {
    uint64_t v8 = [v3 categorySearchResultSection];
    id v10 = [v8 subHeaderDisplayName];
    goto LABEL_5;
  }
  id v10 = 0;
LABEL_6:

  return v10;
}

+ (id)styleAttributesWithTicket:(id)a3
{
  id v3 = a3;
  id v4 = [v3 searchResultSections];
  NSUInteger v5 = [v4 firstObject];
  BOOL v6 = [v5 styleAttributes];

  if (v6)
  {
    id v7 = [v3 searchResultSections];
    uint64_t v8 = [v7 firstObject];
    id v9 = [v8 styleAttributes];
  }
  else
  {
    id v10 = [v3 categorySearchResultSection];
    id v9 = [v10 styleAttributes];

    if (!v9) {
      goto LABEL_6;
    }
    id v7 = [v3 categorySearchResultSection];
    id v9 = [v7 styleAttributes];
  }

LABEL_6:

  return v9;
}

+ (BOOL)isChainResultWithTicket:(id)a3 searchResults:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 searchResultSections];
  id v7 = [v6 firstObject];
  id v8 = [v7 cellType];

  if (v8 == (id)1)
  {
    id v9 = [v5 firstObject];
    id v10 = [v9 name];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) name:(void)v20];
          unsigned int v17 = [v10 isEqualToString:v16];

          if (!v17)
          {

            BOOL v18 = 0;
            goto LABEL_13;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    BOOL v18 = [v10 length] != 0;
LABEL_13:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)placeCollectionsWithTicket:(id)a3
{
  id v3 = [a3 collectionResults];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) collection:v15 with:v16];
        if (v11 && ([v4 containsObject:v11] & 1) == 0)
        {
          [v4 addObject:v11];
        }
        else
        {
          id v12 = sub_10057611C();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            long long v21 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "SearcInfo contains a nil or duplicate collection: %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  if ([v4 count]) {
    id v13 = [v4 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (id)searchDotPlacesWithTicket:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableArray);
  id v5 = [v3 dotPlaces];
  id v6 = [v4 initWithCapacity:[v5 count]];

  long long v7 = [v3 dotPlaces];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100508F68;
  v11[3] = &unk_1012ED818;
  id v12 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = [v8 copy];

  return v9;
}

+ (BOOL)shouldShowRAPWithTicket:(id)a3
{
  id v3 = a3;
  if (_MKRAPIsAvailable() && MapsFeature_IsEnabled_RAPSydney()) {
    unsigned __int8 v4 = [v3 enableStructuredRAPAffordance];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)updateSearchInfo:(id)a3
{
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = [(NSArray *)self->_results debugDescription];
  id v5 = +[NSString stringWithFormat:@"<%@: %p> Search Results:%@", v3, self, v4];

  return v5;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (BOOL)shouldPreserveResults
{
  return self->_shouldPreserveResults;
}

- (void)setShouldPreserveResults:(BOOL)a3
{
  self->_shouldPreserveResults = a3;
}

- (BOOL)isSearchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)canRedoSearch
{
  return self->_canRedoSearch;
}

- (void)setCanRedoSearch:(BOOL)a3
{
  self->_canRedoSearch = a3;
}

- (BOOL)shouldAllowManualRedoButton
{
  return self->_shouldAllowManualRedoButton;
}

- (void)setShouldAllowManualRedoButton:(BOOL)a3
{
  self->_shouldAllowManualRedoButton = a3;
}

- (GEOMapRegion)requestedMapRegion
{
  return self->_requestedMapRegion;
}

- (void)setRequestedMapRegion:(id)a3
{
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (void)setSearchFieldItem:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSArray)browseCategories
{
  return self->_browseCategories;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (int)searchResultType
{
  return self->_searchResultType;
}

- (GEORelatedSearchSuggestion)defaultSuggestion
{
  return self->_defaultSuggestion;
}

- (NSString)resultDisplayHeader
{
  return self->_resultDisplayHeader;
}

- (NSArray)substitutes
{
  return self->_substitutes;
}

- (BOOL)isChainResults
{
  return self->_chainResults;
}

- (GEOResolvedItem)clientResolvedResult
{
  return self->_clientResolvedResult;
}

- (void)setClientResolvedResult:(id)a3
{
}

- (GEODirectionIntent)directionIntent
{
  return self->_directionIntent;
}

- (void)setDirectionIntent:(id)a3
{
}

- (double)dymSuggestionVisibleTime
{
  return self->_dymSuggestionVisibleTime;
}

- (BOOL)showDymSuggestionCloseButton
{
  return self->_showDymSuggestionCloseButton;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (NSString)headerDisplayName
{
  return self->_headerDisplayName;
}

- (NSString)subHeaderDisplayName
{
  return self->_subHeaderDisplayName;
}

- (NSArray)relatedEntitySections
{
  return self->_relatedEntitySections;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (NSArray)searchDotPlaces
{
  return self->_searchDotPlaces;
}

- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold
{
  return self->_searchAutoRedoThreshold;
}

- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold
{
  return self->_searchRedoButtonThreshold;
}

- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (GEOSearchSectionList)searchSectionList
{
  return self->_searchSectionList;
}

- (GEOResultRefinementGroup)resultRefinementGroup
{
  return self->_resultRefinementGroup;
}

- (void)setResultRefinementGroup:(id)a3
{
}

- (BOOL)disableAdditionalViewportPadding
{
  return self->_disableAdditionalViewportPadding;
}

- (int)searchResultViewType
{
  return self->_searchResultViewType;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (void)setEnableStructuredRAPAffordance:(BOOL)a3
{
  self->_enableStructuredRAPAffordance = a3;
}

- (GEOSpotlightSearchPunchIn)punchInDetails
{
  return self->_punchInDetails;
}

- (void)setPunchInDetails:(id)a3
{
}

- (MKMapItemIdentifier)spotlightMapsIdentifier
{
  return self->_spotlightMapsIdentifier;
}

- (void)setSpotlightMapsIdentifier:(id)a3
{
}

- (GEOSearchSessionData)searchSessionData
{
  return self->_searchSessionData;
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return self->_guideSummaryLayoutMetadata;
}

- (void)setGuideSummaryLayoutMetadata:(id)a3
{
}

- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson
{
  return self->_autocompletePerson;
}

- (int)mapDisplayType
{
  return self->_mapDisplayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompletePerson, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_spotlightMapsIdentifier, 0);
  objc_storeStrong((id *)&self->_punchInDetails, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_searchSectionList, 0);
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_storeStrong((id *)&self->_searchRedoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_searchAutoRedoThreshold, 0);
  objc_storeStrong((id *)&self->_searchDotPlaces, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_subHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_headerDisplayName, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_clientResolvedResult, 0);
  objc_storeStrong((id *)&self->_substitutes, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);
  objc_storeStrong((id *)&self->_defaultSuggestion, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_browseCategories, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);

  objc_storeStrong((id *)&self->_requestedMapRegion, 0);
}

@end