@interface SearchResult
+ (id)carSearchResultFromDestination:(id)a3;
+ (id)currentLocationSearchResult;
+ (id)customSearchResultWithCoordinate:(CLLocationCoordinate2D)a3;
+ (id)customSearchResultWithCoordinate:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4;
+ (id)keyPathsForValuesAffectingLocationTitle;
+ (id)keyPathsForValuesAffectingName;
+ (id)keyPathsForValuesAffectingSingleLineAddress;
+ (id)keyPathsForValuesAffectingSubtitle;
+ (id)keyPathsForValuesAffectingTitle;
+ (void)newStartWaypointSearchResult:(id *)a3 endWaypointSearchResult:(id *)a4 forRouteHistoryEntry:(id)a5;
- (AddressBookAddress)address;
- (BOOL)_hasStructuredAddress;
- (BOOL)_hasUID;
- (BOOL)behavesAsAtom;
- (BOOL)failedToReverseGeocode;
- (BOOL)hasExplicitlyProvidedComposedWaypoint;
- (BOOL)hasOriginatedFromBookmarks;
- (BOOL)hasOriginatedFromExternal;
- (BOOL)isAddressBookResult;
- (BOOL)isDynamicCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSearchResult:(id)a3 forPurpose:(int64_t)a4;
- (BOOL)isFindMyPerson;
- (BOOL)isFrequentLocation;
- (BOOL)isHomeOrWork;
- (BOOL)isPartOfMultipleResultsSet;
- (BOOL)isPartiallyClientized;
- (BOOL)isReverseGeocoded;
- (BOOL)needsReverseGeocodeCheck;
- (BOOL)readFrom:(id)a3;
- (BOOL)representsIntermediateStop;
- (BOOL)updateFromBookmarkRepresentation:(id)a3;
- (BOOL)updateFromSyncData:(id)a3;
- (BOOL)usePlaceSummaryInSearch;
- (CLLocationCoordinate2D)_offsetCoordinate:(double)a3;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)labelCoordinate;
- (CNContact)contactForSharingToMessages;
- (CNContact)unknownContact;
- (Flyover)_flyover;
- (GEOComposedGeometryRoutePersistentData)routeData;
- (GEOComposedWaypoint)composedWaypoint;
- (GEOPlaceCollection)placeCollection;
- (GEORPPlaceInfo)placeInfo;
- (GEORelatedEntitySection)relatedSection;
- (GEORetainedSearchMetadata)retainedSearchMetadata;
- (GEOSearchSection)searchSection;
- (MKMapItem)mapItem;
- (MKMapItemIdentifier)identifier;
- (MSPBookmarkStorage)bookmarkStorage;
- (MapsLocationOfInterest)locationOfInterest;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)autocompletePersonTitle;
- (NSString)bookmarkTitle;
- (NSString)debugDescription;
- (NSString)defaultName;
- (NSString)description;
- (NSString)findMyHandleName;
- (NSString)infoCardTitle;
- (NSString)locality;
- (NSString)locationTitle;
- (NSString)name;
- (NSString)routableAddress;
- (NSString)singleLineAddress;
- (NSString)sourceApplication;
- (NSString)sourceURL;
- (NSString)subtitle;
- (NSString)title;
- (NSUUID)impressionElementIdentifier;
- (NSUUID)searchToSupersedeIfRecordedInHistory;
- (PersonalizedCompoundItem)personalizedCompoundItem;
- (PersonalizedItemKey)personalizedItemKey;
- (RelatedSearchSuggestion)relatedSearchSuggestion;
- (SearchResult)init;
- (SearchResult)initWithBookmarkRepresentation:(id)a3;
- (SearchResult)initWithBookmarkStorage:(id)a3;
- (SearchResult)initWithComposedWaypoint:(id)a3;
- (SearchResult)initWithComposedWaypoint:(id)a3 preserveLocationInfo:(BOOL)a4;
- (SearchResult)initWithCuratedGuide:(id)a3;
- (SearchResult)initWithData:(id)a3;
- (SearchResult)initWithDroppedPin:(id)a3;
- (SearchResult)initWithGEOMapItem:(id)a3;
- (SearchResult)initWithGEOPlace:(id)a3;
- (SearchResult)initWithMapItem:(id)a3;
- (SearchResult)initWithMapItem:(id)a3 searchResultType:(unsigned int)a4 addressBookAddress:(id)a5 retainedSearchMetadata:(id)a6 resultIndex:(int)a7;
- (SearchResult)initWithMapItem:(id)a3 searchResultType:(unsigned int)a4 resultIndex:(int)a5;
- (SearchResult)initWithMapItem:(id)a3 syncIdentifier:(id)a4;
- (SearchResult)initWithParkedCar:(id)a3;
- (SearchResult)initWithRelatedSection:(id)a3;
- (SearchResult)initWithSearchResult:(id)a3;
- (SearchResult)initWithSearchResult:(id)a3 address:(id)a4;
- (SearchResult)initWithSearchResultStrippingName:(id)a3 address:(id)a4;
- (SearchResult)initWithSearchSection:(id)a3;
- (SearchResult)initWithType:(unsigned int)a3;
- (_TtC4Maps16MapsFindMyHandle)findMyHandle;
- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson;
- (id)_formattedAddress;
- (id)_formattedAddressMultiline;
- (id)_mapsURLfromMapView:(id)a3;
- (id)_maps_externalDeviceDictionaryRepresentation;
- (id)bookmarkRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mapsURL;
- (id)mapsURLfromMapView:(id)a3;
- (id)syncData;
- (int)geoMapServiceTraitSource;
- (int)localSearchProviderID;
- (int64_t)source;
- (unint64_t)businessID;
- (unint64_t)customizedLocationType;
- (unsigned)appearance;
- (unsigned)locationType;
- (void)_commonInit;
- (void)_syncGEOPlaceWithCoordinate;
- (void)_updateTypeAndOriginalTypeIfNeeded;
- (void)clearAddressCache;
- (void)clearLocationInformation;
- (void)markAsOriginatingFromBookmarks;
- (void)setAddress:(id)a3;
- (void)setAppearance:(unsigned int)a3;
- (void)setAutocompletePerson:(id)a3;
- (void)setBookmarkTitle:(id)a3;
- (void)setComposedWaypoint:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3 preserveLocationInfo:(BOOL)a4;
- (void)setFailedToReverseGeocode:(BOOL)a3;
- (void)setFindMyHandle:(id)a3;
- (void)setGeoMapServiceTraitSource:(int)a3;
- (void)setImpressionElementIdentifier:(id)a3;
- (void)setLabelCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLocationOfInterest:(id)a3;
- (void)setLocationOfInterestWithGeoMapItem:(id)a3;
- (void)setLocationType:(unsigned int)a3;
- (void)setMapItem:(id)a3;
- (void)setOriginalType:(unsigned int)a3;
- (void)setOriginatedFromExternal:(BOOL)a3;
- (void)setPartOfMultipleResultsSet:(BOOL)a3;
- (void)setPlaceCollection:(id)a3;
- (void)setPlaceInfo:(id)a3;
- (void)setRelatedSearchSuggestion:(id)a3;
- (void)setRelatedSection:(id)a3;
- (void)setRepresentsIntermediateStop:(BOOL)a3;
- (void)setRetainedSearchMetadata:(id)a3;
- (void)setReverseGeocoded:(BOOL)a3;
- (void)setRouteData:(id)a3;
- (void)setSearchSection:(id)a3;
- (void)setSearchToSupersedeIfRecordedInHistory:(id)a3;
- (void)setSourceApplication:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)tryUpdatingCurrentLocationSearchResultWithCompletion:(id)a3;
- (void)updateModel:(id)a3;
- (void)updateWithGEOMapItem:(id)a3;
- (void)updateWithReverseGeocodedMapItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SearchResult

- (BOOL)isPartiallyClientized
{
  v2 = [(SearchResult *)self mapItem];
  unsigned __int8 v3 = [v2 _isPartiallyClientized];

  return v3;
}

- (MKMapItem)mapItem
{
  mapItem = self->_mapItem;
  if (!mapItem)
  {
    id v4 = objc_alloc((Class)MKMapItem);
    v5 = [(SearchResultRepr *)self place];
    v6 = (MKMapItem *)[v4 initWithPlace:v5];
    v7 = self->_mapItem;
    self->_mapItem = v6;

    mapItem = self->_mapItem;
  }

  return mapItem;
}

- (SearchResult)initWithType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchResult;
  id v4 = [(SearchResult *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(SearchResult *)v4 _commonInit];
    [(SearchResult *)v5 setType:v3];
    [(SearchResult *)v5 setOriginalType:v3];
    v6 = v5;
  }

  return v5;
}

- (NSString)defaultName
{
  unsigned int v2 = [(SearchResultRepr *)self originalType];
  if (v2 == 3)
  {
    v5 = +[MKAnnotationView droppedPinTitle];
  }
  else if (v2 == 4)
  {
    uint64_t v3 = +[MKLocationManager sharedLocationManager];
    if ([v3 isLocationServicesApproved]
      && ([v3 isAuthorizedForPreciseLocation] & 1) == 0)
    {
      uint64_t v4 = MKLocalizedStringForApproximateLocation();
    }
    else
    {
      uint64_t v4 = MKLocalizedStringForCurrentLocation();
    }
    v5 = (void *)v4;
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  p_coordinate = &self->_coordinate;
  if (vabdd_f64(a3.latitude, self->_coordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_coordinate.longitude) >= 0.00000000999999994)
  {
    [(SearchResult *)self clearLocationInformation];
    p_coordinate->CLLocationDegrees latitude = latitude;
    p_coordinate->CLLocationDegrees longitude = longitude;
    [(SearchResult *)self _syncGEOPlaceWithCoordinate];
  }
}

- (void)setMapItem:(id)a3
{
  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    char v6 = objc_opt_respondsToSelector();
    v5 = v9;
    if (v6)
    {
      v7 = [(MKMapItem *)self->_mapItem personalizedCompoundItem];
      personalizedCompoundItem = self->_personalizedCompoundItem;
      self->_personalizedCompoundItem = v7;

      v5 = v9;
    }
  }
}

- (SearchResult)initWithMapItem:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SearchResult;
  v5 = [(SearchResult *)&v23 init];
  char v6 = v5;
  if (v5)
  {
    [(SearchResult *)v5 _commonInit];
    [v4 _coordinate];
    -[SearchResult setCoordinate:](v6, "setCoordinate:");
    [v4 _labelCoordinate];
    -[SearchResult setLabelCoordinate:](v6, "setLabelCoordinate:");
    v7 = [v4 place];
    [(SearchResultRepr *)v6 setPlace:v7];

    [(SearchResult *)v6 setMapItem:v4];
    if ([v4 _hasMUID]) {
      id v8 = [v4 _muid];
    }
    else {
      id v8 = 0;
    }
    v6->_businessID = (unint64_t)v8;
    uint64_t v9 = ([v4 _hasResolvablePartialInformation] & 1) != 0
      || [(SearchResult *)v6 isPartiallyClientized];
    [(SearchResultRepr *)v6 setHasIncompleteMetadata:v9];
    [(SearchResult *)v6 setType:0];
    [(SearchResult *)v6 setOriginalType:[(SearchResultRepr *)v6 type]];
    [(SearchResult *)v6 clearAddressCache];
    v10 = [(SearchResultRepr *)v6 place];
    v11 = [v10 address];
    v12 = [v11 structuredAddress];

    unsigned int v13 = 0;
    if (([v12 hasSubThoroughfare] & 1) == 0) {
      unsigned int v13 = [v12 hasFullThoroughfare] ^ 1;
    }
    if (![v4 _hasMUID] || objc_msgSend(v10, "hasSpokenName"))
    {
      [(SearchResult *)v6 coordinate];
      BOOL v16 = v15 < -180.0;
      if (v15 > 180.0) {
        BOOL v16 = 1;
      }
      if (v14 < -90.0) {
        BOOL v16 = 1;
      }
      if (v14 > 90.0) {
        BOOL v16 = 1;
      }
      if ((v16 | v13))
      {
        if (!v16) {
          goto LABEL_24;
        }
      }
      else if ([v10 hasSpokenAddress])
      {
        v17 = [v10 entryPoints];
        id v18 = [v17 count];

        if (v18) {
          goto LABEL_24;
        }
      }
    }
    [(SearchResultRepr *)v6 setHasIncompleteNavData:1];
LABEL_24:
    v19 = [(SearchResult *)v6 mapItem];
    v20 = [v19 _geoMapItem];
    [(SearchResult *)v6 setLocationOfInterestWithGeoMapItem:v20];

    v21 = v6;
  }

  return v6;
}

- (void)_commonInit
{
  [(SearchResultRepr *)self setZoomLevel:0xFFFFFFFFLL];
  double v3 = MKCoordinateInvalid[0];
  double v4 = MKCoordinateInvalid[1];
  -[SearchResult setCoordinate:](self, "setCoordinate:", MKCoordinateInvalid[0], v4);
  -[SearchResult setLabelCoordinate:](self, "setLabelCoordinate:", v3, v4);
  [(SearchResultRepr *)self setHasIncompleteMetadata:0];
  [(SearchResultRepr *)self setTimestamp:CFAbsoluteTimeGetCurrent()];
  id v5 = objc_alloc_init((Class)GEOPlace);
  [(SearchResultRepr *)self setPlace:v5];
  [(SearchResult *)self _updateTypeAndOriginalTypeIfNeeded];
}

- (void)setOriginalType:(unsigned int)a3
{
  if (a3 == 6)
  {
    double v4 = +[MKSystemController sharedInstance];
    unsigned int v5 = [v4 isInternalInstall];

    if (v5) {
      NSLog(@"Migrated a search result automatically to a new original type.");
    }
    *(void *)&a3 = 4;
  }
  v6.receiver = self;
  v6.super_class = (Class)SearchResult;
  [(SearchResultRepr *)&v6 setOriginalType:*(void *)&a3];
}

- (void)setLabelCoordinate:(CLLocationCoordinate2D)a3
{
  self->_labelCoordinate = a3;
}

- (void)_updateTypeAndOriginalTypeIfNeeded
{
  [(SearchResult *)self setType:[(SearchResultRepr *)self type]];
  uint64_t v3 = [(SearchResultRepr *)self originalType];

  [(SearchResult *)self setOriginalType:v3];
}

- (void)setType:(unsigned int)a3
{
  if (a3 == 4)
  {
LABEL_5:
    id v6 = objc_alloc((Class)MKMapItem);
    v7 = [(SearchResult *)self mapItem];
    id v8 = [v7 _geoMapItem];
    id v9 = [v6 initWithGeoMapItemAsCurrentLocation:v8];
    [(SearchResult *)self setMapItem:v9];

    *(void *)&a3 = 4;
    goto LABEL_6;
  }
  if (a3 == 6)
  {
    double v4 = +[MKSystemController sharedInstance];
    unsigned int v5 = [v4 isInternalInstall];

    if (v5) {
      NSLog(@"Migrated a search result automatically to a new original type.");
    }
    goto LABEL_5;
  }
LABEL_6:
  v10.receiver = self;
  v10.super_class = (Class)SearchResult;
  [(SearchResultRepr *)&v10 setType:*(void *)&a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionElementIdentifier, 0);
  objc_storeStrong((id *)&self->_searchToSupersedeIfRecordedInHistory, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_personalizedCompoundItem, 0);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_placeInfo, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_findMyHandle, 0);
  objc_storeStrong((id *)&self->_autocompletePerson, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_searchSection, 0);
  objc_storeStrong((id *)&self->_relatedSection, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_composedWaypoint, 0);
  objc_storeStrong((id *)&self->_formattedAddressMultiline, 0);
  objc_storeStrong((id *)&self->_formattedAddress, 0);

  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
}

- (SearchResult)initWithDroppedPin:(id)a3
{
  id v4 = a3;
  if ([v4 hasLatLng])
  {
    unsigned int v5 = [v4 latLng];
    [v5 lat];
    double v7 = v6;
    id v8 = [v4 latLng];
    [v8 lng];
    double v10 = v9;

    if (self)
    {
      self = [(SearchResult *)self initWithType:3];
      v11 = [(SearchResult *)self defaultName];
      v12 = [(SearchResultRepr *)self place];
      [v12 setName:v11];

      -[SearchResult setCoordinate:](self, "setCoordinate:", v7, v10);
      [v4 timestamp];
      -[SearchResultRepr setTimestamp:](self, "setTimestamp:");
      if ([v4 hasFloorOrdinal]) {
        -[SearchResultRepr setFloorOrdinal:](self, "setFloorOrdinal:", [v4 floorOrdinal]);
      }
    }
    self = self;
    unsigned int v13 = self;
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (_TtC4Maps16MapsFindMyHandle)findMyHandle
{
  return self->_findMyHandle;
}

- (_TtC4Maps22MapsAutocompletePerson)autocompletePerson
{
  return self->_autocompletePerson;
}

- (void)clearLocationInformation
{
  [(SearchResult *)self setReverseGeocoded:0];
  uint64_t v3 = [(SearchResultRepr *)self place];
  [v3 setAddress:0];

  [(SearchResult *)self clearAddressCache];
  if ([(SearchResultRepr *)self type] == 3)
  {
    mapItem = self->_mapItem;
    self->_mapItem = 0;
  }
}

- (void)clearAddressCache
{
  formattedAddress = self->_formattedAddress;
  self->_formattedAddress = 0;

  formattedAddressMultiline = self->_formattedAddressMultiline;
  self->_formattedAddressMultiline = 0;
}

- (void)setReverseGeocoded:(BOOL)a3
{
}

- (void)_syncGEOPlaceWithCoordinate
{
  [(SearchResult *)self coordinate];
  double v4 = v3;
  double v6 = v5;
  id v9 = [objc_alloc((Class)GEOMapRegion) initWithLatitude:v3 longitude:v5];
  double v7 = [(SearchResultRepr *)self place];
  [v7 setMapRegion:v9];

  id v8 = [(SearchResultRepr *)self place];
  [v8 setCenterCoordinate:v4, v6];
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setLocationOfInterestWithGeoMapItem:(id)a3
{
  id v19 = a3;
  unsigned int v4 = [v19 contactIsMe];
  double v5 = v19;
  if (v4)
  {
    if ([v19 contactAddressType] == 1
      || ([(SearchResult *)self address],
          double v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 addressType],
          v6,
          v7 == 1))
    {
      id v8 = [MapsLocationOfInterest alloc];
      id v9 = [(SearchResult *)self mapItem];
      double v10 = v8;
      uint64_t v11 = 0;
LABEL_11:
      id v18 = [(MapsLocationOfInterest *)v10 initWithLocationOfInterestType:v11 mapItem:v9];
      [(SearchResult *)self setLocationOfInterest:v18];

      double v5 = v19;
      goto LABEL_12;
    }
    if ([v19 contactAddressType] == 2
      || ([(SearchResult *)self address],
          v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 addressType],
          v12,
          v13 == 2))
    {
      double v14 = [MapsLocationOfInterest alloc];
      id v9 = [(SearchResult *)self mapItem];
      double v10 = v14;
      uint64_t v11 = 1;
      goto LABEL_11;
    }
    if ([v19 contactAddressType] == 3
      || ([(SearchResult *)self address],
          double v15 = objc_claimAutoreleasedReturnValue(),
          unsigned int v16 = [v15 addressType],
          v15,
          double v5 = v19,
          v16 == 3))
    {
      v17 = [MapsLocationOfInterest alloc];
      id v9 = [(SearchResult *)self mapItem];
      double v10 = v17;
      uint64_t v11 = 2;
      goto LABEL_11;
    }
  }
LABEL_12:
}

+ (id)keyPathsForValuesAffectingSubtitle
{
  return +[NSSet setWithObjects:@"place.addressGeocodeAccuracy", @"singleLineAddress", @"reverseGeocoded", 0];
}

+ (id)keyPathsForValuesAffectingSingleLineAddress
{
  return +[NSSet setWithObjects:@"mapItem", 0];
}

- (SearchResult)initWithBookmarkStorage:(id)a3
{
  id v5 = a3;
  if ([v5 type] == 1)
  {
    double v6 = [(SearchResult *)self init];
    if (v6)
    {
      unsigned int v7 = [v5 placeBookmark];
      id v8 = [v7 mapItemStorage];
      [(SearchResult *)v6 updateWithGEOMapItem:v8];

      objc_storeStrong((id *)&v6->_bookmarkStorage, a3);
      id v9 = [v5 identifier];
      [(SearchResultRepr *)v6 setSyncIdentifier:v9];

      [v5 timestamp];
      -[SearchResultRepr setTimestamp:](v6, "setTimestamp:");
      double v10 = [v5 placeBookmark];
      LODWORD(v7) = [v10 origin];

      if (v7 == 1)
      {
        [(SearchResult *)v6 setOriginalType:3];
        uint64_t v11 = [v5 placeBookmark];
        unsigned int v12 = [v11 hasDroppedPinCoordinate];

        if (v12)
        {
          unsigned int v13 = [v5 placeBookmark];
          double v14 = [v13 droppedPinCoordinate];
          [v14 coordinate];
          CLLocationCoordinate2DFromGEOLocationCoordinate2D();
          -[SearchResult setCoordinate:](v6, "setCoordinate:");
        }
      }
      [(SearchResult *)v6 markAsOriginatingFromBookmarks];
    }
    self = v6;
    double v15 = self;
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (MSPBookmarkStorage)bookmarkStorage
{
  p_bookmarkStorage = &self->_bookmarkStorage;
  bookmarkStorage = self->_bookmarkStorage;
  if (bookmarkStorage)
  {
    unsigned int v4 = bookmarkStorage;
    goto LABEL_13;
  }
  unsigned int v4 = (MSPBookmarkStorage *)objc_alloc_init((Class)MSPBookmarkStorage);
  [(MSPBookmarkStorage *)v4 setType:1];
  id v6 = objc_alloc_init((Class)MSPPlaceBookmark);
  [(MSPBookmarkStorage *)v4 setPlaceBookmark:v6];

  unsigned int v7 = [(SearchResult *)self mapItem];
  id v8 = [v7 _geoMapItemStorageForPersistence];

  id v9 = objc_alloc_init((Class)GEOMapItemStorage);
  double v10 = [(MSPBookmarkStorage *)v4 placeBookmark];
  [v10 setMapItemStorage:v9];

  uint64_t v11 = [v8 placeData];

  if (v11)
  {
    unsigned int v12 = [v8 placeData];
    unsigned int v13 = [(MSPBookmarkStorage *)v4 placeBookmark];
    double v14 = [v13 mapItemStorage];
    [v14 setPlaceData:v12];
LABEL_7:

    goto LABEL_8;
  }
  double v15 = [v8 place];

  if (v15)
  {
    unsigned int v12 = [v8 place];
    unsigned int v13 = [(MSPBookmarkStorage *)v4 placeBookmark];
    double v14 = [v13 mapItemStorage];
    [v14 setPlace:v12];
    goto LABEL_7;
  }
LABEL_8:
  +[NSDate timeIntervalSinceReferenceDate];
  -[MSPBookmarkStorage setTimestamp:](v4, "setTimestamp:");
  unsigned int v16 = +[NSUUID UUID];
  v17 = [v16 UUIDString];
  [(MSPBookmarkStorage *)v4 setIdentifier:v17];

  if ([(SearchResultRepr *)self originalType] == 3)
  {
    id v18 = [(MSPBookmarkStorage *)v4 placeBookmark];
    [v18 setOrigin:1];

    [(SearchResult *)self coordinate];
    id v21 = [objc_alloc((Class)GEOLatLng) initWithLatitude:v19 longitude:v20];
    v22 = [(MSPBookmarkStorage *)v4 placeBookmark];
    [v22 setDroppedPinCoordinate:v21];

    if ([(SearchResultRepr *)self hasFloorOrdinal])
    {
      uint64_t v23 = [(SearchResultRepr *)self floorOrdinal];
      v24 = [(MSPBookmarkStorage *)v4 placeBookmark];
      [v24 setDroppedPinFloorOrdinal:v23];
    }
  }
  v25 = [(SearchResult *)self title];
  v26 = [(MSPBookmarkStorage *)v4 placeBookmark];
  [v26 setTitle:v25];

  objc_storeStrong((id *)p_bookmarkStorage, v4);
LABEL_13:

  return v4;
}

- (CLLocationCoordinate2D)_offsetCoordinate:(double)a3
{
  [(SearchResult *)self coordinate];
  MKMapPoint v4 = MKMapPointForCoordinate(v9);

  v10.x = v4.x * a3 / a3;
  v10.y = (v4.y * a3 + -25.0) / a3;
  CLLocationCoordinate2D v7 = MKCoordinateForMapPoint(v10);
  double longitude = v7.longitude;
  double latitude = v7.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)updateModel:(id)a3
{
  id v16 = a3;
  MKMapPoint v4 = [(SearchResult *)self composedWaypoint];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(SearchResult *)self composedWaypoint];
    CLLocationCoordinate2D v7 = [v6 route];
    id v8 = [v7 userProvidedName];
    if ([v8 length]) {
      [v7 userProvidedName];
    }
    else {
    CLLocationCoordinate2D v9 = [v7 name];
    }
    [v16 setFirstLine:v9];

    MKMapPoint v10 = [v7 distanceAndElevationString];
    [v16 setSecondLine:v10];

    uint64_t v11 = [[SearchResult alloc] initWithComposedWaypoint:v6];
    unsigned int v12 = [(SearchResult *)v11 mapItem];
    [v16 setMapItem:v12];
  }
  else
  {
    id v6 = [(SearchResult *)self mapItem];
    [v6 updateModel:v16];
  }

  unsigned int v13 = (objc_class *)objc_opt_class();
  double v14 = NSStringFromClass(v13);
  double v15 = +[NSString stringWithFormat:@"[%@]", v14];
  [v16 setDebugSubtitle:v15];
}

- (id)_maps_externalDeviceDictionaryRepresentation
{
  unsigned int v2 = [(SearchResult *)self mapItem];
  double v3 = [v2 _maps_externalDeviceDictionaryRepresentation];

  return v3;
}

- (unint64_t)customizedLocationType
{
  if (![(SearchResult *)self isFindMyPerson])
  {
    if ([(SearchResultRepr *)self type] == 12) {
      return 5;
    }
    uint64_t v4 = [(SearchResult *)self address];
    uint64_t v5 = [(SearchResult *)self locationOfInterest];
    if (v4 | v5)
    {
      if ([(id)v4 addressType] != 1 && (!v5 || objc_msgSend((id)v5, "type")))
      {
        if ([(id)v4 addressType] == 2 || v5 && objc_msgSend((id)v5, "type") == (id)1)
        {
          unint64_t v3 = 2;
        }
        else if ([(id)v4 addressType] == 3 || v5 && objc_msgSend((id)v5, "type") == (id)2)
        {
          unint64_t v3 = 3;
        }
        else
        {
          unint64_t v3 = 0;
        }
        goto LABEL_12;
      }
    }
    else
    {
      id v6 = [(SearchResult *)self mapItem];
      unsigned __int8 v7 = [v6 _maps_isHome];

      if ((v7 & 1) == 0)
      {
        id v8 = [(SearchResult *)self mapItem];
        unsigned int v9 = [v8 _maps_isWork];

        if (v9) {
          unint64_t v3 = 2;
        }
        else {
          unint64_t v3 = 0;
        }
        goto LABEL_12;
      }
    }
    unint64_t v3 = 1;
LABEL_12:

    return v3;
  }
  return 4;
}

- (MKMapItemIdentifier)identifier
{
  id v3 = objc_alloc((Class)MKMapItemIdentifier);
  unint64_t v4 = [(SearchResult *)self businessID];
  uint64_t v5 = [(SearchResult *)self mapItem];
  id v6 = [v5 _resultProviderID];
  [(SearchResult *)self coordinate];
  id v7 = [v3 initWithMUID:v4 resultProviderID:v6];

  return (MKMapItemIdentifier *)v7;
}

- (void)tryUpdatingCurrentLocationSearchResultWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(SearchResult *)self isDynamicCurrentLocation]
    && (+[MKLocationManager sharedLocationManager],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 lastLocation],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    id v7 = +[MKMapService sharedService];
    id v8 = [v7 ticketForReverseGeocodeLocation:v6];

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1009AF394;
    v9[3] = &unk_1012EB628;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [v8 submitWithHandler:v9 networkActivity:0];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (SearchResult)initWithMapItem:(id)a3 searchResultType:(unsigned int)a4 addressBookAddress:(id)a5 retainedSearchMetadata:(id)a6 resultIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  double v15 = [(SearchResult *)self initWithMapItem:v12];
  id v16 = v15;
  if (v15)
  {
    if (v13)
    {
      [(SearchResult *)v15 setAddress:v13];
      v17 = [(SearchResult *)v16 address];
      id v18 = [v17 compositeName];
      [v12 setName:v18];
    }
    [(SearchResult *)v16 setType:v10];
    [(SearchResult *)v16 setOriginalType:v10];
    [(SearchResult *)v16 setRetainedSearchMetadata:v14];
    if ((v7 & 0x80000000) == 0) {
      [(SearchResultRepr *)v16 setResultIndex:v7];
    }
    [(SearchResultRepr *)v16 setHasIncompleteNavData:0];
    double v19 = [(SearchResult *)v16 mapItem];
    double v20 = [v19 _geoMapItem];
    [(SearchResult *)v16 setLocationOfInterestWithGeoMapItem:v20];

    id v21 = v16;
  }

  return v16;
}

- (SearchResult)initWithMapItem:(id)a3 searchResultType:(unsigned int)a4 resultIndex:(int)a5
{
  return [(SearchResult *)self initWithMapItem:a3 searchResultType:*(void *)&a4 addressBookAddress:0 retainedSearchMetadata:0 resultIndex:*(void *)&a5];
}

- (void)updateWithReverseGeocodedMapItem:(id)a3
{
  id v15 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([(SearchResult *)v4 isDynamicCurrentLocation])
  {
    uint64_t v5 = [(SearchResult *)v4 defaultName];
  }
  else
  {
    id v6 = [(SearchResult *)v4 mapItem];
    uint64_t v5 = [v6 name];
  }
  uint64_t v7 = [(SearchResult *)v4 mapItem];
  [v7 _coordinate];
  double v9 = v8;
  double v11 = v10;

  [(SearchResultRepr *)v4 setHasIncompleteNavData:0];
  [(SearchResultRepr *)v4 setHasIncompleteMetadata:0];
  [(SearchResult *)v4 setMapItem:v15];
  id v12 = [v15 place];
  [(SearchResultRepr *)v4 setPlace:v12];

  id v13 = [(SearchResult *)v4 mapItem];
  [v13 setName:v5];

  id v14 = [(SearchResultRepr *)v4 place];
  [v14 setCenterCoordinate:v9, v11];

  [(SearchResult *)v4 setReverseGeocoded:1];
  [(SearchResult *)v4 clearAddressCache];

  objc_sync_exit(v4);
}

- (NSString)findMyHandleName
{
  unsigned int v2 = [(SearchResult *)self findMyHandle];
  id v3 = [v2 displayName];

  return (NSString *)v3;
}

- (int)localSearchProviderID
{
  unsigned int v2 = [(SearchResultRepr *)self place];
  int v3 = [v2 localSearchProviderID];

  return v3;
}

- (int64_t)source
{
  if ([(SearchResult *)self hasOriginatedFromBookmarks]) {
    return 5;
  }
  if ([(SearchResult *)self hasOriginatedFromExternal]) {
    return 6;
  }
  id v4 = [(SearchResult *)self address];

  if (v4)
  {
    uint64_t v5 = [(SearchResult *)self address];
    id v6 = [v5 addressIdentifier];
    uint64_t v7 = +[CNContact _mapkit_sharedLocationContactIdentifer];
    unsigned int v8 = [v6 isEqualToString:v7];

    BOOL v9 = v8 == 0;
    int64_t v10 = 3;
    int64_t v11 = 9;
    goto LABEL_7;
  }
  if ([(SearchResult *)self geoMapServiceTraitSource])
  {
    if ([(SearchResult *)self geoMapServiceTraitSource] == 1) {
      return 6;
    }
    if ([(SearchResult *)self geoMapServiceTraitSource] == 7) {
      return 7;
    }
  }
  unsigned int v12 = [(SearchResultRepr *)self originalType];
  int64_t result = 0;
  if (v12 <= 0xC)
  {
    if (((1 << v12) & 0x1821) != 0) {
      return 4;
    }
    if (v12 == 3) {
      return 1;
    }
    if (v12 == 9)
    {
      id v13 = [(SearchResult *)self mapItem];
      unsigned int v14 = [v13 _isMapItemTypeBrand];

      BOOL v9 = v14 == 0;
      int64_t v10 = 2;
      int64_t v11 = 8;
LABEL_7:
      if (v9) {
        return v10;
      }
      else {
        return v11;
      }
    }
  }
  return result;
}

- (id)bookmarkRepresentation
{
  int v3 = objc_alloc_init(SyncedBookmarkRepr);
  [(SyncedBookmarkRepr *)v3 setType:2 * ([(SearchResultRepr *)self type] == 4)];
  id v4 = [(SearchResult *)self bookmarkTitle];

  if (v4)
  {
    uint64_t v5 = [(SearchResult *)self bookmarkTitle];
    [(SyncedBookmarkRepr *)v3 setTitle:v5];
  }
  id v6 = [(SearchResult *)self singleLineAddress];

  if (v6)
  {
    uint64_t v7 = [(SearchResult *)self singleLineAddress];
    [(SyncedBookmarkRepr *)v3 setSingleLineAddress:v7];
  }
  unsigned int v8 = [(SearchResult *)self mapItem];
  unsigned int v9 = [v8 _resultProviderID];

  if (v9)
  {
    int64_t v10 = [(SearchResult *)self mapItem];
    -[SyncedBookmarkRepr setProviderID:](v3, "setProviderID:", [v10 _resultProviderID]);
  }
  if ([(SearchResult *)self businessID]) {
    [(SyncedBookmarkRepr *)v3 setBusinessID:[(SearchResult *)self businessID]];
  }
  [(SearchResult *)self coordinate];
  if (v12 >= -180.0 && v12 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
  {
    [(SearchResult *)self coordinate];
    -[SyncedBookmarkRepr setLatitude:](v3, "setLatitude:");
    [(SearchResult *)self coordinate];
    [(SyncedBookmarkRepr *)v3 setLongitude:v13];
  }

  return v3;
}

- (SearchResult)initWithSearchResult:(id)a3 address:(id)a4
{
  id v7 = a4;
  unsigned int v8 = [(SearchResult *)self initWithSearchResult:a3];
  unsigned int v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_address, a4);
  }

  return v9;
}

- (SearchResult)initWithSearchResultStrippingName:(id)a3 address:(id)a4
{
  id v4 = [(SearchResult *)self initWithSearchResult:a3 address:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [(SearchResultRepr *)v4 place];
    [v6 setName:0];
  }
  return v5;
}

- (void)setAddress:(id)a3
{
  uint64_t v5 = (AddressBookAddress *)a3;
  if (self->_address != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_address, a3);
    uint64_t v5 = v6;
  }
}

- (void)setAutocompletePerson:(id)a3
{
  uint64_t v5 = (_TtC4Maps22MapsAutocompletePerson *)a3;
  if (self->_autocompletePerson != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_autocompletePerson, a3);
    uint64_t v5 = v6;
  }
}

- (BOOL)isAddressBookResult
{
  return [(AddressBookAddress *)self->_address isValid];
}

- (SearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchResult;
  unsigned int v2 = [(SearchResult *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    [(SearchResult *)v2 _commonInit];
    id v4 = v3;
  }

  return v3;
}

- (SearchResult)initWithData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchResult;
  int v3 = [(SearchResult *)&v6 initWithData:a3];
  id v4 = v3;
  if (v3) {
    [(SearchResult *)v3 _updateTypeAndOriginalTypeIfNeeded];
  }
  return v4;
}

- (SearchResult)initWithSearchResult:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SearchResult;
  uint64_t v5 = [(SearchResult *)&v38 init];
  objc_super v6 = v5;
  if (v5)
  {
    [(SearchResult *)v5 _commonInit];
    if ([v4 hasTimestamp])
    {
      [v4 timestamp];
      -[SearchResultRepr setTimestamp:](v6, "setTimestamp:");
    }
    if ([v4 hasResultIndex]) {
      -[SearchResultRepr setResultIndex:](v6, "setResultIndex:", [v4 resultIndex]);
    }
    -[SearchResult setType:](v6, "setType:", [v4 type]);
    -[SearchResult setOriginalType:](v6, "setOriginalType:", [v4 originalType]);
    -[SearchResultRepr setZoomLevel:](v6, "setZoomLevel:", [v4 zoomLevel]);
    [v4 coordinate];
    -[SearchResult setCoordinate:](v6, "setCoordinate:");
    [v4 labelCoordinate];
    -[SearchResult setLabelCoordinate:](v6, "setLabelCoordinate:");
    id v7 = [v4 place];
    id v8 = [v7 copy];

    [(SearchResultRepr *)v6 setPlace:v8];
    if (-[SearchResultRepr type](v6, "type") - 5 <= 0xFFFFFFFD && [v4 hasMapsURL])
    {
      unsigned int v9 = [v4 mapsURL];
      [(SearchResultRepr *)v6 setMapsURL:v9];
    }
    [(SearchResult *)v6 clearAddressCache];
    -[SearchResult setReverseGeocoded:](v6, "setReverseGeocoded:", [v4 isReverseGeocoded]);
    -[SearchResult setOriginatedFromExternal:](v6, "setOriginatedFromExternal:", [v4 hasOriginatedFromExternal]);
    -[SearchResult setGeoMapServiceTraitSource:](v6, "setGeoMapServiceTraitSource:", [v4 geoMapServiceTraitSource]);
    int64_t v10 = [v4 sourceURL];
    [(SearchResult *)v6 setSourceURL:v10];

    double v11 = [v4 sourceApplication];
    [(SearchResult *)v6 setSourceApplication:v11];

    if ([v4 hasHasIncompleteNavData]) {
      -[SearchResultRepr setHasIncompleteNavData:](v6, "setHasIncompleteNavData:", [v4 hasIncompleteNavData]);
    }
    if (v4)
    {
      double v12 = (void *)v4[49];
      if (v12) {
        objc_storeStrong((id *)&v6->_address, v12);
      }
      double v13 = (void *)v4[42];
      if (v13) {
        objc_storeStrong((id *)&v6->_autocompletePerson, v13);
      }
      unsigned int v14 = (void *)v4[43];
      if (v14) {
        objc_storeStrong((id *)&v6->_findMyHandle, v14);
      }
    }
    id v15 = [v4 locationOfInterest];
    [(SearchResult *)v6 setLocationOfInterest:v15];

    id v16 = [v4 mapItem];
    [(SearchResult *)v6 setMapItem:v16];

    v17 = [v4 syncIdentifier];
    if (v17)
    {
      id v18 = [v4 syncIdentifier];
      [(SearchResultRepr *)v6 setSyncIdentifier:v18];
    }
    double v19 = [v4 bookmarkStorage];
    double v20 = v19;
    if (v19) {
      id v21 = (MSPBookmarkStorage *)[v19 copy];
    }
    else {
      id v21 = (MSPBookmarkStorage *)objc_alloc_init((Class)MSPBookmarkStorage);
    }
    bookmarkStorage = v6->_bookmarkStorage;
    v6->_bookmarkStorage = v21;

    uint64_t v23 = [v4 composedWaypoint];
    v24 = (GEOComposedWaypoint *)[v23 copy];
    composedWaypoint = v6->_composedWaypoint;
    v6->_composedWaypoint = v24;

    v26 = [v4 placeInfo];
    v27 = v26;
    if (v26)
    {
      v28 = (GEORPPlaceInfo *)[v26 copy];
      placeInfo = v6->_placeInfo;
      v6->_placeInfo = v28;
    }
    if ([v4 hasFloorOrdinal]) {
      -[SearchResultRepr setFloorOrdinal:](v6, "setFloorOrdinal:", [v4 floorOrdinal]);
    }
    v6->_originatedFromBookmarks = [v4 hasOriginatedFromBookmarks];
    uint64_t v30 = [v4 autocompletePerson];
    autocompletePerson = v6->_autocompletePerson;
    v6->_autocompletePerson = (_TtC4Maps22MapsAutocompletePerson *)v30;

    uint64_t v32 = [v4 findMyHandle];
    findMyHandle = v6->_findMyHandle;
    v6->_findMyHandle = (_TtC4Maps16MapsFindMyHandle *)v32;

    uint64_t v34 = [v4 routeData];
    routeData = v6->_routeData;
    v6->_routeData = (GEOComposedGeometryRoutePersistentData *)v34;

    v36 = v6;
  }

  return v6;
}

- (SearchResult)initWithMapItem:(id)a3 syncIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(SearchResult *)self initWithMapItem:a3];
  id v8 = v7;
  if (v7)
  {
    unsigned int v9 = [(SearchResult *)v7 bookmarkStorage];
    [v9 setIdentifier:v6];

    [(SearchResultRepr *)v8 setSyncIdentifier:v6];
  }

  return v8;
}

- (SearchResult)initWithGEOPlace:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MKMapItem) initWithPlace:v4];

  id v6 = [(SearchResult *)self initWithMapItem:v5];
  return v6;
}

- (SearchResult)initWithGEOMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v4 isPlaceHolderPlace:0];

  id v6 = [(SearchResult *)self initWithMapItem:v5];
  if (v6) {
    id v7 = v6;
  }

  return v6;
}

- (SearchResult)initWithRelatedSection:(id)a3
{
  id v5 = a3;
  id v6 = [(SearchResult *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_relatedSection, a3);
    [(SearchResult *)v7 setType:11];
    [(SearchResult *)v7 setOriginalType:11];
  }

  return v7;
}

- (SearchResult)initWithSearchSection:(id)a3
{
  id v5 = a3;
  id v6 = [(SearchResult *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchSection, a3);
    [(SearchResult *)v7 setType:11];
    [(SearchResult *)v7 setOriginalType:11];
  }

  return v7;
}

- (SearchResult)initWithCuratedGuide:(id)a3
{
  id v5 = a3;
  id v6 = [(SearchResult *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_placeCollection, a3);
  }

  return v7;
}

- (SearchResult)initWithParkedCar:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mapItem];
  id v6 = [(SearchResult *)self initWithMapItem:v5];

  if (v6)
  {
    [(SearchResult *)v6 setType:12];
    [(SearchResult *)v6 setOriginalType:12];
    [v4 coordinate];
    v6->_coordinate.double latitude = v7;
    v6->_coordinate.double longitude = v8;
  }

  return v6;
}

- (SearchResult)initWithComposedWaypoint:(id)a3
{
  return [(SearchResult *)self initWithComposedWaypoint:a3 preserveLocationInfo:1];
}

- (SearchResult)initWithComposedWaypoint:(id)a3 preserveLocationInfo:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  CLLocationDegrees v8 = [v7 geoMapItem];

  if (v8)
  {
    unsigned int v9 = [v7 geoMapItem];
    int64_t v10 = +[MKMapItem _itemWithGeoMapItem:v9];
    double v11 = [(SearchResult *)self initWithMapItem:v10];

    if (!v11) {
      goto LABEL_30;
    }
LABEL_10:
    if ([v7 isCurrentLocation])
    {
      uint64_t v14 = 4;
    }
    else
    {
      if (![v7 isLocationWaypointType])
      {
LABEL_15:
        id v15 = [v7 findMyHandleID];

        if (v15)
        {
          id v16 = [v7 findMyHandle];
          [(SearchResult *)v11 setFindMyHandle:v16];

          [(SearchResult *)v11 setLocationType:4];
        }
        v17 = [v7 addressBookAddress];

        if (v17)
        {
          id v18 = [v7 addressBookAddress];
          [(SearchResult *)v11 setAddress:v18];

          double v19 = [(SearchResult *)v11 address];
          unsigned __int8 v20 = [v19 isMeCard];

          if ((v20 & 1) == 0)
          {
            id v21 = [(SearchResult *)v11 address];
            unsigned int v22 = [v21 addressType];
            if (v22 - 1 >= 3) {
              uint64_t v23 = 0;
            }
            else {
              uint64_t v23 = v22;
            }
            [(SearchResult *)v11 setLocationType:v23];
          }
        }
        if (([v7 hasLatLng] & 1) != 0 || objc_msgSend(v7, "hasLocation"))
        {
          v24 = [v7 latLng];
          v25 = v24;
          if (v24)
          {
            id v26 = v24;
          }
          else
          {
            v27 = [v7 location];
            id v26 = [v27 latLng];
          }
          [v26 lat];
          double v29 = v28;
          [v26 lng];
          -[SearchResult setCoordinate:preserveLocationInfo:](v11, "setCoordinate:preserveLocationInfo:", v4, v29, v30);
        }
        objc_storeStrong((id *)&v11->_composedWaypoint, a3);
        v11->_hasExplicitlyProvidedComposedWaypoint = 1;
        goto LABEL_30;
      }
      uint64_t v14 = 3;
    }
    [(SearchResult *)v11 setType:v14];
    [(SearchResult *)v11 setOriginalType:v14];
    goto LABEL_15;
  }
  if (![v7 isCurrentLocation])
  {
    double v12 = [v7 findMyHandleID];
    if (v12)
    {
    }
    else
    {
      double v13 = [v7 addressBookAddress];

      if (!v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v31 = 0;
          goto LABEL_31;
        }
      }
    }
  }
  double v11 = [(SearchResult *)self init];
  if (v11) {
    goto LABEL_10;
  }
LABEL_30:
  self = v11;
  v31 = self;
LABEL_31:

  return v31;
}

- (void)setComposedWaypoint:(id)a3
{
  self->_hasExplicitlyProvidedComposedWaypoint = a3 != 0;
}

- (GEOComposedWaypoint)composedWaypoint
{
  composedWaypoint = self->_composedWaypoint;
  if (!composedWaypoint)
  {
    BOOL v4 = [(SearchResult *)self routeData];

    if (v4)
    {
      id v5 = objc_alloc((Class)GEORouteBuilder_PersistentData);
      id v6 = [(SearchResult *)self routeData];
      id v7 = (GEOComposedWaypoint *)[v5 initWithPersistentData:v6];

      CLLocationDegrees v8 = [(GEOComposedWaypoint *)v7 buildRoute];
      unsigned int v9 = (GEOComposedWaypoint *)[objc_alloc((Class)GEOComposedWaypointToRoute) initWithRoute:v8];
      int64_t v10 = self->_composedWaypoint;
      self->_composedWaypoint = v9;
    }
    else
    {
      double v11 = (GEOComposedWaypoint *)[objc_alloc((Class)GEOComposedWaypoint) initWithSearchResult:self];
      id v7 = self->_composedWaypoint;
      self->_composedWaypoint = v11;
    }

    composedWaypoint = self->_composedWaypoint;
  }

  return composedWaypoint;
}

- (void)setRouteData:(id)a3
{
  BOOL v4 = self;
  objc_storeStrong((id *)&self->_routeData, a3);
  id v5 = a3;
  BOOL v4 = (SearchResult *)((char *)v4 + 208);
  [v5 originCoordinate];
  uint64_t v7 = v6;
  int64_t v9 = v8;

  *(void *)v4->super.PBCodable_opaque = v7;
  v4->super._obsoleteCid = v9;
}

- (void)updateWithGEOMapItem:(id)a3
{
  id v14 = a3;
  BOOL v4 = [(SearchResult *)self mapItem];
  id v5 = [v4 _geoMapItem];
  uint64_t v6 = [v5 _clientAttributes];

  uint64_t v7 = [v14 _clientAttributes];

  if (v7 || !v6)
  {
    id v9 = v14;
  }
  else
  {
    uint64_t v8 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v14 clientAttributes:v6];

    id v9 = (id)v8;
  }
  id v15 = v9;
  int64_t v10 = +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:");
  [v10 _coordinate];
  -[SearchResult setCoordinate:](self, "setCoordinate:");
  [v10 _labelCoordinate];
  -[SearchResult setLabelCoordinate:](self, "setLabelCoordinate:");
  double v11 = [v10 place];
  [(SearchResultRepr *)self setPlace:v11];

  [(SearchResult *)self setMapItem:v10];
  if ([v10 _hasMUID]) {
    id v12 = [v10 _muid];
  }
  else {
    id v12 = 0;
  }
  self->_businessID = (unint64_t)v12;
  BOOL v13 = ([v10 _hasResolvablePartialInformation] & 1) != 0
     || [(SearchResult *)self isPartiallyClientized];
  [(SearchResultRepr *)self setHasIncompleteMetadata:v13];
  [(SearchResult *)self setLocationOfInterestWithGeoMapItem:v15];
}

- (void)markAsOriginatingFromBookmarks
{
  self->_originatedFromBookmarks = 1;
}

- (void)setGeoMapServiceTraitSource:(int)a3
{
  if (self->_geoMapServiceTraitSource != a3) {
    self->_geoMapServiceTraitSource = a3;
  }
}

- (void)setSourceURL:(id)a3
{
  p_sourceURL = &self->_sourceURL;
  id v5 = a3;
  if (!-[NSString isEqualToString:](*p_sourceURL, "isEqualToString:")) {
    objc_storeStrong((id *)p_sourceURL, a3);
  }
}

- (void)setSourceApplication:(id)a3
{
  p_sourceApplication = &self->_sourceApplication;
  id v5 = a3;
  if (!-[NSString isEqualToString:](*p_sourceApplication, "isEqualToString:")) {
    objc_storeStrong((id *)p_sourceApplication, a3);
  }
}

- (BOOL)isEqualToSearchResult:(id)a3 forPurpose:(int64_t)a4
{
  id v5 = (SearchResult *)a3;
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (self == v5)
  {
    unsigned __int8 IsEqualToMapItemForPurpose = 1;
    goto LABEL_10;
  }
  uint64_t v7 = [(SearchResult *)self autocompletePerson];
  uint64_t v8 = [(SearchResult *)v6 autocompletePerson];
  uint64_t v9 = (uint64_t)v8;
  if (v7 && v8) {
    goto LABEL_5;
  }

  if (v7 | v9)
  {
LABEL_9:
    unsigned __int8 IsEqualToMapItemForPurpose = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(SearchResult *)self findMyHandle];
  id v12 = [(SearchResult *)v6 findMyHandle];
  uint64_t v9 = (uint64_t)v12;
  if (!v7 || !v12)
  {

    if (!(v7 | v9))
    {
      uint64_t v13 = [(SearchResult *)self routeData];
      if (v13)
      {
        id v14 = (void *)v13;
        id v15 = [(SearchResult *)v6 routeData];

        if (v15)
        {
          id v16 = [(SearchResult *)self routeData];
          v17 = [(SearchResult *)v6 routeData];
          unsigned __int8 IsEqualToMapItemForPurpose = [v16 isEqual:v17];

          goto LABEL_10;
        }
      }
      id v18 = [(SearchResult *)self routeData];
      if (v18)
      {
      }
      else
      {
        double v19 = [(SearchResult *)v6 routeData];

        if (!v19)
        {
          if ([(SearchResultRepr *)v6 type] == 4 && [(SearchResultRepr *)self type] == 4
            || [(SearchResultRepr *)v6 type] == 3 && [(SearchResultRepr *)self type] == 3)
          {
            [(SearchResult *)self coordinate];
            [(SearchResult *)v6 coordinate];
            GEOCalculateDistance();
            unsigned __int8 IsEqualToMapItemForPurpose = v20 < 5.0;
            goto LABEL_10;
          }
          uint64_t v7 = [(SearchResult *)v6 mapItem];
          uint64_t v9 = [(id)v7 _geoMapItem];
          id v21 = [(SearchResult *)self mapItem];
          unsigned int v22 = [v21 _geoMapItem];
          unsigned __int8 IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();

          goto LABEL_6;
        }
      }
    }
    goto LABEL_9;
  }
LABEL_5:
  unsigned __int8 IsEqualToMapItemForPurpose = [(id)v7 isEqual:v9];
LABEL_6:

LABEL_10:
  return IsEqualToMapItemForPurpose;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

+ (id)currentLocationSearchResult
{
  id v2 = [objc_alloc((Class)a1) initWithType:4];
  int v3 = [v2 defaultName];
  BOOL v4 = [v2 place];
  [v4 setName:v3];

  id v5 = +[MKLocationManager sharedLocationManager];
  uint64_t v6 = [v5 lastLocation];

  if (v6)
  {
    [v6 coordinate];
    [v2 setCoordinate:];
  }
  else
  {
    if (qword_1016106B8 != -1) {
      dispatch_once(&qword_1016106B8, &stru_1013164F0);
    }
    uint64_t v7 = qword_1016106B0;
    if (os_log_type_enabled((os_log_t)qword_1016106B0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No last location available for current location search result", v9, 2u);
    }
  }

  return v2;
}

+ (id)customSearchResultWithCoordinate:(CLLocationCoordinate2D)a3
{
  return [a1 customSearchResultWithCoordinate:0x7FFFFFFFLL floorOrdinal:a3.latitude, a3.longitude];
}

+ (id)customSearchResultWithCoordinate:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = [objc_alloc((Class)a1) initWithType:3];
  uint64_t v8 = [v7 defaultName];
  uint64_t v9 = [v7 place];
  [v9 setName:v8];

  [v7 setCoordinate:latitude longitude:longitude];
  if (v4 != 0x7FFFFFFF) {
    [v7 setFloorOrdinal:v4];
  }

  return v7;
}

- (BOOL)readFrom:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)SearchResult;
  BOOL v4 = [(SearchResultRepr *)&v47 readFrom:a3];
  if (v4)
  {
    if ([(SearchResultRepr *)self hasAddressRecordID])
    {
      id v5 = [[AddressBookAddress alloc] initWithRecordID:[(SearchResultRepr *)self addressRecordID] addressID:[(SearchResultRepr *)self addressID]];
      address = self->_address;
      self->_address = v5;
    }
    unsigned int v7 = [(SearchResultRepr *)self hasObsoleteName];
    if ([(SearchResultRepr *)self hasObsoleteLocality]
      || [(SearchResultRepr *)self hasObsoleteRegion]
      || [(SearchResultRepr *)self hasObsoletePostalCode]
      || [(SearchResultRepr *)self hasObsoleteCountryCode]
      || [(SearchResultRepr *)self hasObsoleteCountryName]
      || [(SearchResultRepr *)self hasObsoleteDependentLocality])
    {
      unsigned int v8 = 1;
    }
    else
    {
      unsigned int v8 = [(SearchResultRepr *)self hasObsoleteThoroughfare];
    }
    uint64_t v9 = [(SearchResultRepr *)self obsoleteAddressLines];
    id v10 = [v9 count];

    if (v10) {
      int v11 = 1;
    }
    else {
      int v11 = v8;
    }
    if ([(SearchResultRepr *)self hasObsoleteInexactPosition]) {
      unsigned int v12 = [(SearchResultRepr *)self obsoleteInexactPosition];
    }
    else {
      unsigned int v12 = 0;
    }
    if ([(SearchResultRepr *)self hasObsoletePhone]
      || [(SearchResultRepr *)self hasObsoleteReferenceURL]
      || [(SearchResultRepr *)self hasObsoleteCid]
      && [(SearchResultRepr *)self obsoleteCid]
      || [(SearchResultRepr *)self hasObsoleteUnverifiedListing])
    {
      unsigned int v13 = 1;
    }
    else
    {
      unsigned int v13 = [(SearchResultRepr *)self hasObsoleteClosedListing];
    }
    if ([(SearchResultRepr *)self hasObsoleteLatitudeE6Value]) {
      unsigned int v14 = [(SearchResultRepr *)self hasObsoleteLongitudeE6Value];
    }
    else {
      unsigned int v14 = 0;
    }
    if (((v7 | v8 | v12 | v13 | v11) & 1) != 0 || v14)
    {
      id v24 = objc_alloc_init((Class)GEOPlace);
      [(SearchResultRepr *)self setPlace:v24];

      if (!v7)
      {
LABEL_29:
        if (!v11) {
          goto LABEL_30;
        }
        goto LABEL_38;
      }
    }
    else if (!v7)
    {
      goto LABEL_29;
    }
    v25 = [(SearchResultRepr *)self obsoleteName];
    id v26 = [(SearchResultRepr *)self place];
    [v26 setName:v25];

    if (!v11)
    {
LABEL_30:
      if (!v12) {
        goto LABEL_31;
      }
      goto LABEL_57;
    }
LABEL_38:
    id v27 = objc_alloc_init((Class)GEOAddress);
    if (v10)
    {
      double v28 = [(SearchResultRepr *)self obsoleteAddressLines];
      [v27 setFormattedAddressLines:v28];
    }
    double v29 = [(SearchResultRepr *)self place];
    [v29 setAddress:v27];

    if (v8)
    {
      id v30 = objc_alloc_init((Class)GEOStructuredAddress);
      if ([(SearchResultRepr *)self hasObsoleteLocality])
      {
        v31 = [(SearchResultRepr *)self obsoleteLocality];
        [v30 setLocality:v31];
      }
      if ([(SearchResultRepr *)self hasObsoleteRegion])
      {
        uint64_t v32 = [(SearchResultRepr *)self obsoleteRegion];
        [v30 setAdministrativeArea:v32];
      }
      if ([(SearchResultRepr *)self hasObsoletePostalCode])
      {
        v33 = [(SearchResultRepr *)self obsoletePostalCode];
        [v30 setPostCode:v33];
      }
      if ([(SearchResultRepr *)self hasObsoleteCountryCode])
      {
        uint64_t v34 = [(SearchResultRepr *)self obsoleteCountryCode];
        [v30 setCountryCode:v34];
      }
      if ([(SearchResultRepr *)self hasObsoleteCountryName])
      {
        v35 = [(SearchResultRepr *)self obsoleteCountryName];
        [v30 setCountry:v35];
      }
      if ([(SearchResultRepr *)self hasObsoleteDependentLocality])
      {
        v36 = [(SearchResultRepr *)self obsoleteDependentLocality];
        [v30 setSubLocality:v36];
      }
      if ([(SearchResultRepr *)self hasObsoleteThoroughfare])
      {
        v37 = [(SearchResultRepr *)self obsoleteThoroughfare];
        [v30 setThoroughfare:v37];
      }
      objc_super v38 = [(SearchResultRepr *)self place];
      v39 = [v38 address];
      [v39 setStructuredAddress:v30];
    }
    if (!v12)
    {
LABEL_31:
      if (!v13) {
        goto LABEL_32;
      }
      goto LABEL_58;
    }
LABEL_57:
    v40 = [(SearchResultRepr *)self place];
    [v40 setAddressGeocodeAccuracy:2];

    if (!v13)
    {
LABEL_32:
      if (!v14)
      {
LABEL_34:
        double v20 = [(SearchResultRepr *)self place];
        [v20 mkCoordinate];
        self->_coordinate.double latitude = v21;
        self->_coordinate.double longitude = v22;

        [(SearchResultRepr *)self setObsoleteName:0];
        [(SearchResultRepr *)self setObsoleteLocality:0];
        [(SearchResultRepr *)self setObsoleteRegion:0];
        [(SearchResultRepr *)self setObsoletePostalCode:0];
        [(SearchResultRepr *)self setObsoleteCountryCode:0];
        [(SearchResultRepr *)self setObsoleteCountryName:0];
        [(SearchResultRepr *)self setObsoletePhone:0];
        [(SearchResultRepr *)self setObsoleteReferenceURL:0];
        [(SearchResultRepr *)self setObsoleteDependentLocality:0];
        [(SearchResultRepr *)self setObsoleteThoroughfare:0];
        [(SearchResultRepr *)self setObsoleteLatitudeE6Value:0];
        [(SearchResultRepr *)self setHasObsoleteLatitudeE6Value:0];
        [(SearchResultRepr *)self setObsoleteLongitudeE6Value:0];
        [(SearchResultRepr *)self setHasObsoleteLongitudeE6Value:0];
        [(SearchResultRepr *)self setObsoleteInexactPosition:0];
        [(SearchResultRepr *)self setHasObsoleteInexactPosition:0];
        [(SearchResultRepr *)self setObsoleteCid:0];
        [(SearchResultRepr *)self setHasObsoleteCid:0];
        [(SearchResultRepr *)self setObsoleteAddressLines:0];
        [(SearchResultRepr *)self setObsoleteUnverifiedListing:0];
        [(SearchResultRepr *)self setHasObsoleteUnverifiedListing:0];
        [(SearchResultRepr *)self setObsoleteClosedListing:0];
        [(SearchResultRepr *)self setHasObsoleteClosedListing:0];
        return v4;
      }
LABEL_33:
      unsigned int v15 = [(SearchResultRepr *)self obsoleteLatitudeE6Value];
      int64x2_t v16 = vshll_n_s32((int32x2_t)__PAIR64__([(SearchResultRepr *)self obsoleteLongitudeE6Value], v15), 0x10uLL);
      v16.i64[0] /= 1000000;
      v16.i64[1] /= 1000000;
      float64x2_t v46 = vmulq_f64(vcvtq_f64_s64(v16), (float64x2_t)vdupq_n_s64(0x3EF0000000000000uLL));
      id v17 = [objc_alloc((Class)GEOMapRegion) initWithLatitude:longitude:];
      id v18 = [(SearchResultRepr *)self place];
      [v18 setMapRegion:v17];

      double v19 = [(SearchResultRepr *)self place];
      [v19 setCenterCoordinate:*(_OWORD *)&v46];

      goto LABEL_34;
    }
LABEL_58:
    id v41 = objc_alloc_init((Class)GEOBusiness);
    if ([(SearchResultRepr *)self hasObsoletePhone])
    {
      v42 = [(SearchResultRepr *)self obsoletePhone];
      [v41 setTelephone:v42];
    }
    if ([(SearchResultRepr *)self hasObsoleteReferenceURL])
    {
      v43 = [(SearchResultRepr *)self obsoleteReferenceURL];
      [v41 setURL:v43];
    }
    if ([(SearchResultRepr *)self hasObsoleteClosedListing]) {
      [v41 setIsClosed:[self obsoleteClosedListing]];
    }
    id v44 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    [v44 addObject:v41];
    v45 = [(SearchResultRepr *)self place];
    [v45 setBusiness:v44];

    if (!v14) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(SearchResult *)self isAddressBookResult])
  {
    [(SearchResultRepr *)self setAddressID:[(PersistentAddressBookAddress *)self->_address addressID]];
    [(SearchResultRepr *)self setAddressRecordID:[(PersistentAddressBookAddress *)self->_address recordID]];
  }
  else
  {
    [(SearchResultRepr *)self setHasAddressID:0];
    [(SearchResultRepr *)self setHasAddressRecordID:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SearchResult;
  [(SearchResultRepr *)&v5 writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return [v4 initWithSearchResult:self];
}

- (BOOL)updateFromBookmarkRepresentation:(id)a3
{
  id v4 = a3;
  if ([v4 hasTitle])
  {
    objc_super v5 = [v4 title];
    uint64_t v6 = [(SearchResultRepr *)self place];
    [v6 setName:v5];
  }
  if ([v4 hasLatitude] && objc_msgSend(v4, "hasLongitude"))
  {
    [v4 latitude];
    double v8 = v7;
    [v4 longitude];
    -[SearchResult setCoordinate:](self, "setCoordinate:", v8, v9);
  }
  if ([v4 hasBusinessID]) {
    self->_businessID = (unint64_t)[v4 businessID];
  }
  if ([v4 hasProviderID])
  {
    if ([v4 providerID])
    {
      id v10 = [v4 providerID];
      int v11 = [(SearchResultRepr *)self place];
      [v11 setLocalSearchProviderID:v10];
    }
    else
    {
      int v11 = [(SearchResultRepr *)self place];
      [v11 setHasLocalSearchProviderID:0];
    }
  }
  if ([v4 hasRegionLatitude]
    && [v4 hasRegionLatitudeDelta]
    && [v4 hasRegionLongitude]
    && [v4 hasRegionLongitudeDelta])
  {
    unsigned int v12 = [v4 mapRegion];
    unsigned int v13 = [(SearchResultRepr *)self place];
    [v13 setMapRegion:v12];
  }
  unsigned int v14 = [v4 type];
  uint64_t v15 = 0;
  BOOL v16 = 0;
  switch(v14)
  {
    case 0u:
      if (objc_msgSend(v4, "hasProviderID", 0) && objc_msgSend(v4, "hasBusinessID"))
      {
        id v17 = objc_alloc_init((Class)GEOBusiness);
        [v17 setUID:[v4 businessID]];
        id v18 = [(SearchResultRepr *)self place];
        [v18 addBusiness:v17];

        [(SearchResultRepr *)self setHasIncompleteMetadata:1];
        if ([v4 hasProviderID])
        {
          id v19 = [v4 providerID];
          double v20 = [(SearchResultRepr *)self place];
          [v20 setLocalSearchProviderID:v19];
        }
      }
      uint64_t v15 = 0;
      goto LABEL_26;
    case 1u:
      goto LABEL_26;
    case 2u:
      uint64_t v15 = 4;
LABEL_26:
      [(SearchResult *)self setType:v15];
      goto LABEL_27;
    case 3u:
    case 4u:
      goto LABEL_28;
    default:
LABEL_27:
      [(SearchResult *)self setOriginalType:[(SearchResultRepr *)self type]];
      BOOL v16 = 1;
LABEL_28:

      return v16;
  }
}

- (SearchResult)initWithBookmarkRepresentation:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SearchResult;
  id v3 = a3;
  id v4 = [(SearchResult *)&v10 init];
  [(SearchResult *)v4 _commonInit];
  unsigned int v5 = [(SearchResult *)v4 updateFromBookmarkRepresentation:v3];

  if (v5)
  {
    uint64_t v6 = [(SearchResultRepr *)v4 place];
    unsigned __int8 v7 = [v6 hasAddress];

    if ((v7 & 1) == 0) {
      [(SearchResultRepr *)v4 setHasIncompleteMetadata:1];
    }
    [(SearchResultRepr *)v4 setHasIncompleteNavData:1];
    double v8 = v4;
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)syncData
{
  id v2 = [(SearchResult *)self bookmarkStorage];
  id v3 = [v2 data];

  return v3;
}

- (BOOL)updateFromSyncData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MSPBookmarkStorage) initWithData:v4];

  if (v5 && [v5 type] == 1)
  {
    uint64_t v6 = [v5 placeBookmark];
    unsigned __int8 v7 = [v6 mapItemStorage];

    [(SearchResult *)self updateWithGEOMapItem:v7];
    double v8 = [v5 placeBookmark];
    unsigned int v9 = [v8 origin];

    if (v9 == 1)
    {
      [(SearchResult *)self setOriginalType:3];
      objc_super v10 = [v5 placeBookmark];
      unsigned int v11 = [v10 hasDroppedPinCoordinate];

      if (v11)
      {
        unsigned int v12 = [v5 placeBookmark];
        unsigned int v13 = [v12 droppedPinCoordinate];
        [v13 coordinate];
        CLLocationCoordinate2DFromGEOLocationCoordinate2D();
        -[SearchResult setCoordinate:](self, "setCoordinate:");
      }
      unsigned int v14 = [v5 placeBookmark];
      unsigned int v15 = [v14 hasDroppedPinFloorOrdinal];

      if (v15)
      {
        BOOL v16 = [v5 placeBookmark];
        -[SearchResultRepr setFloorOrdinal:](self, "setFloorOrdinal:", [v16 droppedPinFloorOrdinal]);
      }
    }
    id v17 = [v5 placeBookmark];
    id v18 = [v17 title];
    [(SearchResult *)self setBookmarkTitle:v18];
  }
  return 0;
}

- (BOOL)isDynamicCurrentLocation
{
  return [(SearchResultRepr *)self originalType] == 4;
}

- (BOOL)behavesAsAtom
{
  uint64_t v3 = [(SearchResultRepr *)self type];
  unsigned int v4 = v3;
  if (v3 > 9 || (BOOL v5 = 1, ((1 << v3) & 0x218) == 0))
  {
    uint64_t v3 = [(SearchResult *)self locationOfInterest];
    if (v3)
    {
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = [(SearchResult *)self isAddressBookResult];
      uint64_t v3 = 0;
    }
  }
  if (v4 > 9 || ((1 << v4) & 0x218) == 0) {

  }
  return v5;
}

- (id)_formattedAddress
{
  formattedAddress = self->_formattedAddress;
  if (!formattedAddress)
  {
    unsigned int v4 = [(SearchResult *)self mapItem];
    BOOL v5 = [v4 _addressFormattedAsSinglelineAddress];
    uint64_t v6 = self->_formattedAddress;
    self->_formattedAddress = v5;

    formattedAddress = self->_formattedAddress;
  }

  return formattedAddress;
}

- (id)_formattedAddressMultiline
{
  formattedAddressMultiline = self->_formattedAddressMultiline;
  if (!formattedAddressMultiline)
  {
    unsigned int v4 = [(SearchResult *)self mapItem];
    BOOL v5 = [v4 _addressFormattedAsMultilineAddress];
    uint64_t v6 = self->_formattedAddressMultiline;
    self->_formattedAddressMultiline = v5;

    formattedAddressMultiline = self->_formattedAddressMultiline;
  }

  return formattedAddressMultiline;
}

- (BOOL)_hasUID
{
  if (self->_businessID) {
    return 1;
  }
  uint64_t v3 = [(SearchResult *)self mapItem];
  unsigned __int8 v4 = [v3 _hasMUID];

  return v4;
}

- (unint64_t)businessID
{
  if (self->_businessID) {
    return self->_businessID;
  }
  uint64_t v3 = [(SearchResult *)self mapItem];
  id v4 = [v3 _muid];

  return (unint64_t)v4;
}

- (id)mapsURL
{
  return [(SearchResult *)self mapsURLfromMapView:0];
}

- (id)mapsURLfromMapView:(id)a3
{
  return [(SearchResult *)self _mapsURLfromMapView:a3];
}

- (id)_mapsURLfromMapView:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SearchResult;
  if ([(SearchResultRepr *)&v26 hasMapsURL])
  {
    v25.receiver = self;
    v25.super_class = (Class)SearchResult;
    BOOL v5 = [(SearchResultRepr *)&v25 mapsURL];
  }
  else
  {
    uint64_t v6 = [(SearchResult *)self mapItem];
    unsigned __int8 v7 = [v6 _activityURL];

    if ([(SearchResultRepr *)self type] == 3 || [(SearchResult *)self isReverseGeocoded])
    {
      double v8 = +[NSURLComponents componentsWithURL:v7 resolvingAgainstBaseURL:0];
      unsigned int v9 = [v8 queryItems];
      id v10 = [v9 mutableCopy];

      uint64_t v21 = 0;
      CLLocationDegrees v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      unsigned int v11 = [v8 queryItems];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100AA9C38;
      v18[3] = &unk_1013164D0;
      id v12 = v10;
      id v19 = v12;
      double v20 = &v21;
      [v11 enumerateObjectsUsingBlock:v18];

      if (*((unsigned char *)v22 + 24))
      {
        id v13 = [v12 copy];
        [v8 setQueryItems:v13];

        uint64_t v14 = [v8 URL];

        unsigned __int8 v7 = (void *)v14;
      }

      _Block_object_dispose(&v21, 8);
    }
    BOOL v5 = [v7 absoluteString];
    if (v4)
    {
      unsigned int v15 = +[MKURLSerializer stringForMapType:](MKURLSerializer, "stringForMapType:", [v4 mapType]);
      uint64_t v16 = [v5 stringByAppendingFormat:@"&t=%@", v15];

      BOOL v5 = (void *)v16;
    }
  }

  return v5;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SearchResultRepr *)self place];
  BOOL v5 = [v4 name];
  uint64_t v6 = [(SearchResult *)self singleLineAddress];
  [(SearchResultRepr *)self hasIncompleteMetadata];
  unsigned __int8 v7 = NSStringFromBOOL();
  double v8 = +[NSString stringWithFormat:@"<%@: %p> \"%@\" %@ - (partiallyClientized: %@)", v3, self, v5, v6, v7];

  return (NSString *)v8;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v15.receiver = self;
  v15.super_class = (Class)SearchResult;
  id v4 = [(SearchResultRepr *)&v15 description];
  id v5 = [v3 initWithString:v4];

  uint64_t v6 = [(SearchResult *)self name];
  if ([v6 length]) {
    [v5 appendFormat:@" %@", v6];
  }
  unsigned __int8 v7 = [(SearchResult *)self mapItem];
  double v8 = [v7 _addressFormattedAsSinglelineAddress];

  if ([v8 length]) {
    [v5 appendFormat:@" %@", v8];
  }
  unsigned int v9 = [(SearchResultRepr *)self place];
  unsigned int v10 = [v9 addressGeocodeAccuracy];

  if (v10 == 2) {
    [v5 appendString:@" -- Inexact"];
  }
  unsigned int v11 = [(SearchResult *)self title];
  [v5 appendFormat:@"\ntitle: %@", v11];

  id v12 = [(SearchResult *)self subtitle];
  [v5 appendFormat:@"\nsubtitle: %@", v12];

  [(SearchResultRepr *)self hasIncompleteMetadata];
  id v13 = NSStringFromBOOL();
  [v5 appendFormat:@"\npartiallyClientized: %@", v13];

  return (NSString *)v5;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3 preserveLocationInfo:(BOOL)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  p_coordinate = &self->_coordinate;
  if (vabdd_f64(a3.latitude, self->_coordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_coordinate.longitude) >= 0.00000000999999994)
  {
    if (!a4) {
      [(SearchResult *)self clearLocationInformation];
    }
    uint64_t v8 = kAnnotationCoordinateKey;
    [(SearchResult *)self willChangeValueForKey:kAnnotationCoordinateKey];
    p_coordinate->CLLocationDegrees latitude = latitude;
    p_coordinate->CLLocationDegrees longitude = longitude;
    [(SearchResult *)self didChangeValueForKey:v8];
    [(SearchResult *)self _syncGEOPlaceWithCoordinate];
  }
}

- (CLLocationCoordinate2D)labelCoordinate
{
  p_labelCoordinate = &self->_labelCoordinate;
  double longitude = self->_labelCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (double latitude = p_labelCoordinate->latitude, p_labelCoordinate->latitude < -90.0)
    || latitude > 90.0)
  {
    id v5 = [(SearchResult *)self mapItem];
    [v5 _labelCoordinate];
    p_labelCoordinate->double latitude = v6;
    p_labelCoordinate->double longitude = v7;

    double latitude = p_labelCoordinate->latitude;
    double longitude = p_labelCoordinate->longitude;
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (unsigned)appearance
{
  unsigned int appearance = self->_appearance;
  if (!appearance)
  {
    unsigned int v3 = [(SearchResultRepr *)self type];
    if (v3 == 4) {
      unsigned int appearance = 4;
    }
    else {
      unsigned int appearance = 1;
    }
    if (v3 == 3) {
      return 3;
    }
  }
  return appearance;
}

- (NSString)locationTitle
{
  unsigned int v3 = [(SearchResult *)self singleLineAddress];
  if ([v3 length])
  {
    id v4 = v3;
LABEL_5:
    CLLocationDegrees v7 = v4;
    goto LABEL_7;
  }
  id v5 = [(SearchResultRepr *)self place];
  unsigned int v6 = [v5 isDisputed];

  if (v6)
  {
    [(SearchResult *)self coordinate];
    +[NSString _mapkit_formattedStringForCoordinate:](NSString, "_mapkit_formattedStringForCoordinate:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v8 = +[NSBundle mainBundle];
  CLLocationDegrees v7 = [v8 localizedStringForKey:@"SearchResult_UnknownLocation" value:@"localized string not found" table:0];

LABEL_7:

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingLocationTitle
{
  return +[NSSet setWithObjects:@"place.address.formattedAddressLines", @"singleLineAddress", 0];
}

- (NSString)infoCardTitle
{
  if ([(SearchResultRepr *)self type] == 3) {
    [(SearchResult *)self defaultName];
  }
  else {
  unsigned int v3 = [(SearchResult *)self title];
  }

  return (NSString *)v3;
}

- (BOOL)isHomeOrWork
{
  uint64_t v3 = [(SearchResult *)self locationOfInterest];
  if (!v3) {
    goto LABEL_13;
  }
  id v4 = (void *)v3;
  id v5 = [(SearchResult *)self locationOfInterest];
  if (![v5 type])
  {

    unsigned __int8 v10 = 1;
    goto LABEL_9;
  }
  unsigned int v6 = [(SearchResult *)self locationOfInterest];
  id v7 = [v6 type];

  if (v7 != (id)1)
  {
LABEL_13:
    if ([(SearchResult *)self isAddressBookResult])
    {
      uint64_t v8 = [(SearchResult *)self address];
      unsigned __int8 v9 = [v8 isMeCard];

      if (v9) {
        return 1;
      }
    }
    unsigned int v11 = [(SearchResult *)self mapItem];
    id v4 = [v11 _geoMapItem];

    unsigned __int8 v10 = [v4 contactIsMe];
LABEL_9:

    return v10;
  }
  return 1;
}

- (NSString)name
{
  uint64_t v3 = [(SearchResult *)self mapItem];
  id v4 = [v3 _geoMapItem];

  if ([v4 contactIsMe])
  {
    unsigned int v5 = [v4 contactAddressType];
    switch(v5)
    {
      case 3u:
        unsigned int v6 = +[NSBundle mainBundle];
        id v7 = v6;
        CFStringRef v8 = @"School";
        goto LABEL_15;
      case 2u:
        unsigned int v6 = +[NSBundle mainBundle];
        id v7 = v6;
        CFStringRef v8 = @"Work";
        goto LABEL_15;
      case 1u:
        unsigned int v6 = +[NSBundle mainBundle];
        id v7 = v6;
        CFStringRef v8 = @"Home";
LABEL_15:
        id v12 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];
        goto LABEL_16;
    }
  }
  routeData = self->_routeData;
  if (routeData)
  {
    id v7 = [(GEOComposedGeometryRoutePersistentData *)routeData userProvidedName];
    id v10 = [v7 length];
    unsigned int v11 = self->_routeData;
    if (v10) {
      [(GEOComposedGeometryRoutePersistentData *)v11 userProvidedName];
    }
    else {
    id v12 = [(GEOComposedGeometryRoutePersistentData *)v11 routeName];
    }
    goto LABEL_16;
  }
  id v13 = [(SearchResult *)self autocompletePersonTitle];
  if (v13)
  {
    id v12 = v13;
    id v7 = v12;
LABEL_16:
    id v14 = v12;
    goto LABEL_17;
  }
  if (![(SearchResult *)self isAddressBookResult]
    || ([(AddressBookAddress *)self->_address compositeName],
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v17 = [(SearchResult *)self findMyHandleName];
    id v18 = v17;
    if (v17)
    {
      id v14 = v17;
LABEL_32:

      goto LABEL_33;
    }
    if ([(SearchResult *)self hasOriginatedFromBookmarks]
      && ([(MSPBookmarkStorage *)self->_bookmarkStorage placeBookmark],
          id v19 = objc_claimAutoreleasedReturnValue(),
          unsigned int v20 = [v19 hasTitle],
          v19,
          v20))
    {
      uint64_t v21 = [(MSPBookmarkStorage *)self->_bookmarkStorage placeBookmark];
      uint64_t v22 = [v21 title];
    }
    else
    {
      uint64_t v23 = [(SearchResult *)self locationOfInterest];
      char v24 = [v23 name];

      if (!v24)
      {
        objc_super v25 = [(SearchResult *)self mapItem];
        id v14 = [v25 name];

        objc_super v26 = [(SearchResult *)self mapItem];
        LODWORD(v25) = [v26 isCurrentLocation];

        if (!v25) {
          goto LABEL_32;
        }
        uint64_t v21 = +[MKLocationManager sharedLocationManager];
        unsigned int v27 = [v21 isLocationServicesApproved];
        if ([v21 isAuthorizedForPreciseLocation])
        {
          double v28 = MKLocalizedStringForApproximateLocation();
          unsigned int v29 = [v14 isEqualToString:v28];

          if (!v29) {
            goto LABEL_31;
          }
          uint64_t v30 = MKLocalizedStringForCurrentLocation();
        }
        else
        {
          if (!v27) {
            goto LABEL_31;
          }
          v31 = MKLocalizedStringForCurrentLocation();
          unsigned int v32 = [v14 isEqualToString:v31];

          if (!v32) {
            goto LABEL_31;
          }
          uint64_t v30 = MKLocalizedStringForApproximateLocation();
        }
        v33 = (void *)v30;

        id v14 = v33;
        goto LABEL_31;
      }
      uint64_t v21 = [(SearchResult *)self locationOfInterest];
      uint64_t v22 = [v21 name];
    }
    id v14 = (id)v22;
LABEL_31:

    goto LABEL_32;
  }
  id v14 = (id)v16;
LABEL_33:
  id v7 = 0;
LABEL_17:

  return (NSString *)v14;
}

+ (id)keyPathsForValuesAffectingName
{
  return +[NSSet setWithObjects:@"place.name", 0];
}

- (void)setBookmarkTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(SearchResult *)self bookmarkStorage];
  unsigned int v5 = [v6 placeBookmark];
  [v5 setTitle:v4];
}

- (NSString)bookmarkTitle
{
  uint64_t v3 = [(MSPBookmarkStorage *)self->_bookmarkStorage placeBookmark];
  unsigned int v4 = [v3 hasTitle];

  if (v4)
  {
    unsigned int v5 = [(MSPBookmarkStorage *)self->_bookmarkStorage placeBookmark];
    id v6 = [v5 title];
  }
  else
  {
    id v6 = [(SearchResult *)self name];
  }

  return (NSString *)v6;
}

- (NSString)title
{
  uint64_t v3 = [(SearchResult *)self name];
  if ([v3 length])
  {
    unsigned int v4 = [(SearchResult *)self defaultName];
    char v5 = [v3 isEqualToString:v4] ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  unsigned int v6 = [(SearchResultRepr *)self type];
  if ((v5 & 1) != 0 || v6 - 3 <= 1)
  {
    id v7 = v3;
  }
  else
  {
    id v7 = [(SearchResult *)self locationTitle];
  }
  CFStringRef v8 = v7;

  return (NSString *)v8;
}

+ (id)keyPathsForValuesAffectingTitle
{
  return +[NSSet setWithObjects:@"name", @"locationTitle", 0];
}

- (NSString)subtitle
{
  unsigned int v3 = [(SearchResultRepr *)self type];
  if (v3 == 3)
  {
    if (![(SearchResult *)self isReverseGeocoded]) {
      goto LABEL_10;
    }
    char v5 = [(SearchResult *)self singleLineAddress];
    if ([v5 length]) {
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (v3 == 4 && [(SearchResult *)self isReverseGeocoded])
  {
    unsigned int v4 = [(SearchResult *)self mapItem];
    char v5 = [v4 _addressFormattedAsShortenedAddress];

    if ([v5 length]) {
      goto LABEL_17;
    }
    unsigned int v6 = [(SearchResult *)self singleLineAddress];
    if ([v6 length]) {
      goto LABEL_16;
    }

LABEL_9:
  }
LABEL_10:
  id v7 = [(SearchResultRepr *)self place];
  char v5 = [v7 firstBusiness];

  if ([v5 isClosed])
  {
    CFStringRef v8 = +[NSBundle mainBundle];
    unsigned __int8 v9 = v8;
    CFStringRef v10 = @"Permanently Closed";
  }
  else
  {
    unsigned int v11 = [(SearchResultRepr *)self place];
    unsigned int v12 = [v11 addressGeocodeAccuracy];

    if (v12 != 2)
    {
      unsigned int v6 = 0;
      goto LABEL_16;
    }
    CFStringRef v8 = +[NSBundle mainBundle];
    unsigned __int8 v9 = v8;
    CFStringRef v10 = @"Approximate Location";
  }
  unsigned int v6 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

LABEL_16:
  char v5 = v6;
LABEL_17:

  return (NSString *)v5;
}

- (BOOL)_hasStructuredAddress
{
  id v2 = [(SearchResultRepr *)self place];
  unsigned int v3 = [v2 address];
  unsigned int v4 = [v3 structuredAddress];
  unsigned __int8 v5 = [v4 hasThoroughfare];

  return v5;
}

- (NSString)singleLineAddress
{
  if ([(SearchResult *)self isAddressBookResult]) {
    [(AddressBookAddress *)self->_address singleLineAddress];
  }
  else {
  unsigned int v3 = [(SearchResult *)self _formattedAddress];
  }

  return (NSString *)v3;
}

- (NSString)locality
{
  id v2 = [(SearchResultRepr *)self place];
  unsigned int v3 = [v2 address];
  unsigned int v4 = [v3 structuredAddress];
  unsigned __int8 v5 = [v4 locality];

  return (NSString *)v5;
}

- (BOOL)needsReverseGeocodeCheck
{
  if ([(SearchResultRepr *)self type] == 3
    || (BOOL v3 = [(SearchResult *)self isDynamicCurrentLocation]))
  {
    LOBYTE(v3) = ![(SearchResult *)self isReverseGeocoded];
  }
  return v3;
}

- (BOOL)isReverseGeocoded
{
  return [(SearchResultRepr *)self flags] != 0;
}

- (PersonalizedItemKey)personalizedItemKey
{
  BOOL v3 = [PersonalizedMapItemKey alloc];
  unsigned int v4 = [(SearchResult *)self mapItem];
  unsigned __int8 v5 = [(PersonalizedMapItemKey *)v3 initWithMapItem:v4];

  return (PersonalizedItemKey *)v5;
}

- (BOOL)isFrequentLocation
{
  id v2 = [(SearchResult *)self mapItem];
  BOOL v3 = [v2 _geoMapItem];
  unsigned int v4 = [v3 _clientAttributes];
  unsigned __int8 v5 = [v4 routineAttributes];
  unsigned int v6 = [v5 loiIdentifier];
  BOOL v7 = v6 != 0;

  return v7;
}

- (NSUUID)impressionElementIdentifier
{
  impressionElementIdentifier = self->_impressionElementIdentifier;
  if (!impressionElementIdentifier)
  {
    unsigned int v4 = +[NSUUID UUID];
    unsigned __int8 v5 = self->_impressionElementIdentifier;
    self->_impressionElementIdentifier = v4;

    impressionElementIdentifier = self->_impressionElementIdentifier;
  }

  return impressionElementIdentifier;
}

- (GEORelatedEntitySection)relatedSection
{
  return self->_relatedSection;
}

- (void)setRelatedSection:(id)a3
{
}

- (GEOSearchSection)searchSection
{
  return self->_searchSection;
}

- (void)setSearchSection:(id)a3
{
}

- (GEOPlaceCollection)placeCollection
{
  return self->_placeCollection;
}

- (void)setPlaceCollection:(id)a3
{
}

- (BOOL)failedToReverseGeocode
{
  return self->_failedToReverseGeocode;
}

- (void)setFailedToReverseGeocode:(BOOL)a3
{
  self->_failedToReverseGeocode = a3;
}

- (BOOL)hasOriginatedFromBookmarks
{
  return self->_originatedFromBookmarks;
}

- (BOOL)hasOriginatedFromExternal
{
  return self->_originatedFromExternal;
}

- (void)setOriginatedFromExternal:(BOOL)a3
{
  self->_originatedFromExternal = a3;
}

- (int)geoMapServiceTraitSource
{
  return self->_geoMapServiceTraitSource;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setAppearance:(unsigned int)a3
{
  self->_unsigned int appearance = a3;
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unsigned int)a3
{
  self->_locationType = a3;
}

- (void)setFindMyHandle:(id)a3
{
}

- (GEOComposedGeometryRoutePersistentData)routeData
{
  return self->_routeData;
}

- (BOOL)hasExplicitlyProvidedComposedWaypoint
{
  return self->_hasExplicitlyProvidedComposedWaypoint;
}

- (GEORPPlaceInfo)placeInfo
{
  return self->_placeInfo;
}

- (void)setPlaceInfo:(id)a3
{
}

- (RelatedSearchSuggestion)relatedSearchSuggestion
{
  return self->_relatedSearchSuggestion;
}

- (void)setRelatedSearchSuggestion:(id)a3
{
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (void)setRetainedSearchMetadata:(id)a3
{
}

- (PersonalizedCompoundItem)personalizedCompoundItem
{
  return self->_personalizedCompoundItem;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (BOOL)isPartOfMultipleResultsSet
{
  return self->_partOfMultipleResultsSet;
}

- (void)setPartOfMultipleResultsSet:(BOOL)a3
{
  self->_partOfMultipleResultsSet = a3;
}

- (NSUUID)searchToSupersedeIfRecordedInHistory
{
  return self->_searchToSupersedeIfRecordedInHistory;
}

- (void)setSearchToSupersedeIfRecordedInHistory:(id)a3
{
}

- (void)setImpressionElementIdentifier:(id)a3
{
}

- (CNContact)unknownContact
{
  BOOL v3 = [(SearchResult *)self mapItem];
  unsigned int v4 = [v3 _placeCardContact];
  if (([v3 _hasMUID] & 1) == 0)
  {
    if ([(SearchResult *)self isDynamicCurrentLocation])
    {
      unsigned __int8 v5 = [(SearchResult *)self infoCardTitle];
    }
    else
    {
      unsigned int v6 = [(SearchResultRepr *)self place];
      unsigned __int8 v5 = [v6 name];

      if (![v5 length])
      {
        uint64_t v7 = [(SearchResult *)self infoCardTitle];

        unsigned __int8 v5 = (void *)v7;
      }
    }
    if ([v5 length])
    {
      id v8 = [v4 mutableCopy];
      [v8 setGivenName:v5];

      unsigned int v4 = v8;
    }
  }

  return (CNContact *)v4;
}

- (CNContact)contactForSharingToMessages
{
  BOOL v3 = [(SearchResult *)self address];
  unsigned int v4 = [v3 contact];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(SearchResult *)self unknownContact];
  }
  uint64_t v7 = v6;

  return (CNContact *)v7;
}

- (BOOL)usePlaceSummaryInSearch
{
  BOOL v3 = [(SearchResult *)self relatedSection];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    unsigned __int8 v5 = [(SearchResult *)self searchSection];
    BOOL v4 = v5 == 0;
  }
  id v6 = [(SearchResult *)self placeCollection];

  uint64_t v7 = [(SearchResult *)self personalizedCompoundItem];
  id v8 = [v7 address];

  unsigned __int8 v9 = [(SearchResult *)self mapItem];

  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  BOOL v11 = !v10;
  if (v6) {
    BOOL v11 = 0;
  }
  return v4 && v11;
}

- (void)setRepresentsIntermediateStop:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &unk_100F734B8, v4, (void *)1);
}

- (BOOL)representsIntermediateStop
{
  id v2 = objc_getAssociatedObject(self, &unk_100F734B8);
  BOOL v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSString)autocompletePersonTitle
{
  id v2 = [(SearchResult *)self autocompletePerson];
  BOOL v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)routableAddress
{
  BOOL v3 = [(SearchResult *)self singleLineAddress];
  unsigned int v4 = [(SearchResultRepr *)self originalType];
  if (![v3 length] || v4 == 3 || v4 == 4)
  {
    [(SearchResult *)self coordinate];
    uint64_t v7 = 0;
    if (v6 >= -180.0 && v6 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
    {
      uint64_t v7 = +[NSString stringWithFormat:@"%f, %f", *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude];
    }

    BOOL v3 = (void *)v7;
  }

  return (NSString *)v3;
}

+ (void)newStartWaypointSearchResult:(id *)a3 endWaypointSearchResult:(id *)a4 forRouteHistoryEntry:(id)a5
{
  id v7 = a5;
  id v20 = v7;
  if (a3)
  {
    uint64_t v8 = [v7 startWaypoint];
    if (v8
      && (unsigned __int8 v9 = (void *)v8,
          [v20 startWaypoint],
          BOOL v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 isCurrentLocation],
          v10,
          v9,
          !v11))
    {
      unsigned int v12 = [SearchResult alloc];
      id v13 = [v20 startWaypoint];
      *a3 = [(SearchResult *)v12 initWithComposedWaypoint:v13];
    }
    else
    {
      *a3 = +[SearchResult currentLocationSearchResult];
    }
    id v7 = v20;
  }
  if (a4)
  {
    uint64_t v14 = [v7 endWaypoint];
    if (v14
      && (objc_super v15 = (void *)v14,
          [v20 endWaypoint],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v16 isCurrentLocation],
          v16,
          v15,
          !v17))
    {
      id v18 = [SearchResult alloc];
      id v19 = [v20 endWaypoint];
      *a4 = [(SearchResult *)v18 initWithComposedWaypoint:v19];
    }
    else
    {
      *a4 = +[SearchResult currentLocationSearchResult];
    }
    id v7 = v20;
  }
}

+ (id)carSearchResultFromDestination:(id)a3
{
  id v4 = a3;
  if (objc_opt_isKindOfClass())
  {
    double v5 = (SearchResult *)v4;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      BOOL v10 = [v6 mkMapItem];

      if (v10)
      {
        unsigned __int8 v9 = [[MapsLocationOfInterest alloc] initWithMapsFavoriteItem:v6];
        goto LABEL_13;
      }
    }
    id v6 = +[MKMapItem carMapItemFromDestination:v4];
    if (v6) {
      double v5 = (SearchResult *)[objc_alloc((Class)a1) initWithMapItem:v6];
    }
    else {
      double v5 = 0;
    }
    goto LABEL_19;
  }
  id v6 = v4;
  if ([v6 type] == (id)24)
  {
    id v7 = [v6 findMyWaypoint];
    if (!v7)
    {
      uint64_t v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315906;
        id v18 = "+[SearchResult(CarHelpers) carSearchResultFromDestination:]";
        __int16 v19 = 2080;
        id v20 = "CarDisplayController.m";
        __int16 v21 = 1024;
        int v22 = 2320;
        __int16 v23 = 2080;
        char v24 = "waypoint != nil";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
      }

      if (sub_100BB36BC())
      {
        objc_super v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = +[NSThread callStackSymbols];
          int v17 = 138412290;
          id v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    double v5 = [[SearchResult alloc] initWithComposedWaypoint:v7];
    goto LABEL_14;
  }
  uint64_t v8 = [v6 MKMapItem];

  if (!v8)
  {

    goto LABEL_10;
  }
  unsigned __int8 v9 = [[MapsLocationOfInterest alloc] initWithMapsSuggestionEntry:v6];
LABEL_13:
  id v7 = v9;
  unsigned int v11 = [SearchResult alloc];
  unsigned int v12 = [v7 mapItem];
  double v5 = [(SearchResult *)v11 initWithMapItem:v12];

  [(SearchResult *)v5 setLocationOfInterest:v7];
LABEL_14:

LABEL_19:
LABEL_20:

  return v5;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  unsigned int v3 = [(SearchResultRepr *)self type];
  id v4 = 0;
  switch(v3)
  {
    case 3u:
      id v4 = @"DroppedPin";
      break;
    case 4u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
      break;
    case 5u:
    case 0xCu:
      goto LABEL_2;
    case 0xBu:
      id v4 = @"Section";
      break;
    default:
      if (!v3)
      {
        if (MapsFeature_IsEnabled_SearchAndDiscovery()
          && ([(SearchResult *)self placeCollection],
              id v6 = objc_claimAutoreleasedReturnValue(),
              v6,
              v6))
        {
          double v5 = [(SearchResult *)self placeCollection];
          id v7 = [v5 collectionIdentifier];
          id v4 = +[NSString stringWithFormat:@"CuratedGuide-%@", v7];
        }
        else
        {
LABEL_2:
          double v5 = [(SearchResult *)self mapItem];
          [v5 _maps_diffableDataSourceIdentifier];
          id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      break;
  }

  return (NSString *)v4;
}

- (Flyover)_flyover
{
  unsigned int v3 = [(SearchResult *)self mapItem];
  id v4 = [v3 _flyover];
  if (v4)
  {
    double v5 = [(SearchResult *)self title];
    id v6 = [v3 _flyoverAnnouncementMessageWithDefaultTitle:v5];

    id v7 = v6;
    uint64_t v8 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v9 = [v8 objectForKey:@"FlyoverSearchNotificationKey"];
    id v10 = [v9 mutableCopy];

    if (!v10) {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
    }
    unsigned int v11 = [v10 objectForKeyedSubscript:v7];
    unsigned int v12 = (char *)[v11 unsignedIntegerValue];

    if ((uint64_t)v12 >= GEOConfigGetInteger())
    {
      objc_super v15 = 0;
    }
    else
    {
      id v13 = +[NSNumber numberWithUnsignedInteger:v12 + 1];
      [v10 setValue:v13 forKey:v7];

      uint64_t v14 = +[NSUserDefaults standardUserDefaults];
      [v14 setObject:v10 forKey:@"FlyoverSearchNotificationKey"];

      objc_super v15 = [[Flyover alloc] initWithAnnouncement:v7 mapItem:v3 animationID:0];
    }
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

- (BOOL)isFindMyPerson
{
  unsigned int v3 = [(SearchResult *)self autocompletePerson];
  uint64_t v4 = [(SearchResult *)self findMyHandle];
  uint64_t v5 = [v3 handle];
  BOOL v6 = (v5 | v4) != 0;

  return v6;
}

@end