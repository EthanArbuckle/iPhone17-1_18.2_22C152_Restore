@interface PlaceCardItem
+ (id)keyPathsForValuesAffectingMapItem;
- (AddressBookAddress)address;
- (BOOL)canAddNote;
- (BOOL)canAddToCollections;
- (BOOL)canAddToLibrary;
- (BOOL)canAddToShortcuts;
- (BOOL)canShowOpenFindMyAction;
- (BOOL)canShowRequestLocation;
- (BOOL)isCurrentLocation;
- (BOOL)isDroppedPin;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHomeWorkSchoolAddress;
- (BOOL)isIntermediateMapItem;
- (BOOL)isMeCard;
- (BOOL)isVenueItem;
- (BOOL)shouldInsertInHistory;
- (BOOL)shouldInsertInHistoryForRAPTrackingOnly;
- (BOOL)shouldShowEditNameAction;
- (CGRect)calloutAnchorRect;
- (CNContact)contact;
- (GEOMapItemCorrectedLocationAttributes)correctedLocationAttributes;
- (MKMapItem)mapItem;
- (MapsLocationOfInterest)locationOfInterest;
- (NSString)customLabel;
- (NSString)defaultCollectionItemTitle;
- (NSString)title;
- (PersonalizedItem)personalizedItem;
- (PlaceCardItem)init;
- (PlaceCardItem)initWithLocationOfInterest:(id)a3;
- (PlaceCardItem)initWithMapItem:(id)a3;
- (PlaceCardItem)initWithMapItem:(id)a3 address:(id)a4;
- (PlaceCardItem)initWithMapItem:(id)a3 chargeStationWaypointInfo:(id)a4;
- (PlaceCardItem)initWithPersonalizedItem:(id)a3;
- (PlaceCardItem)initWithSearchResult:(id)a3;
- (RAPPlace)rapPlace;
- (SearchResult)searchResult;
- (VKEVChargeStationRouteWaypoint)chargeStationWaypointInfo;
- (_MKPlaceItem)placeItem;
- (id)_venueIdentifier;
- (int64_t)addressType;
- (unint64_t)venueCardID;
- (unint64_t)venueID;
- (void)setCalloutAnchorRect:(CGRect)a3;
- (void)setIsIntermediateMapItem:(BOOL)a3;
- (void)setLocationOfInterest:(id)a3;
@end

@implementation PlaceCardItem

- (unint64_t)venueID
{
  v3 = [(PlaceCardItem *)self _venueIdentifier];
  if ([v3 _hasVenueID])
  {
    id v4 = [v3 venueID];
  }
  else
  {
    v5 = [(PlaceCardItem *)self personalizedItem];
    v6 = [v5 sourceLabelMarker];
    id v4 = [v6 venueID];
  }
  return (unint64_t)v4;
}

- (unint64_t)venueCardID
{
  v2 = [(PlaceCardItem *)self mapItem];
  id v3 = [v2 _muid];

  return (unint64_t)v3;
}

- (BOOL)isVenueItem
{
  return [(PlaceCardItem *)self venueID] != 0;
}

- (id)_venueIdentifier
{
  id v3 = [(PlaceCardItem *)self mapItem];
  id v4 = [v3 _venueInfo];
  v5 = [v4 venueIdentifier];

  if (v5)
  {
    v6 = [(PlaceCardItem *)self mapItem];
    v7 = [v6 _venueInfo];
    v8 = [v7 venueIdentifier];
  }
  else
  {
    v6 = [(PlaceCardItem *)self searchResult];
    v7 = [v6 mapItem];
    v9 = [v7 _venueInfo];
    v8 = [v9 venueIdentifier];
  }

  return v8;
}

- (PlaceCardItem)init
{
  return 0;
}

- (PlaceCardItem)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PlaceCardItem;
  v6 = [(PlaceCardItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    if ([v5 isCurrentLocation]) {
      v7->_isCurrentLocation = 1;
    }
    if ([(MKMapItem *)v7->_mapItem _hasResolvablePartialInformation]) {
      [(PlaceCardItem *)v7 setIsIntermediateMapItem:1];
    }
  }

  return v7;
}

- (PlaceCardItem)initWithSearchResult:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PlaceCardItem;
  v6 = [(PlaceCardItem *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 address];
    address = v6->_address;
    v6->_address = (AddressBookAddress *)v7;

    objc_storeStrong((id *)&v6->_searchResult, a3);
    v6->_isDroppedPin = [v5 type] == 3;
    if ([(SearchResult *)v6->_searchResult isDynamicCurrentLocation]) {
      v6->_isCurrentLocation = 1;
    }
    if ([(SearchResultRepr *)v6->_searchResult hasIncompleteMetadata]) {
      v6->_isIntermediateMapItem = 1;
    }
    objc_super v9 = [v5 locationOfInterest];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      locationOfInterest = v6->_locationOfInterest;
      v6->_locationOfInterest = v11;
    }
    else
    {
      locationOfInterest = [v5 address];
      uint64_t v13 = [locationOfInterest locationOfInterest];
      v14 = v6->_locationOfInterest;
      v6->_locationOfInterest = (MapsLocationOfInterest *)v13;
    }
  }

  return v6;
}

- (PlaceCardItem)initWithMapItem:(id)a3 address:(id)a4
{
  id v7 = a4;
  v8 = [(PlaceCardItem *)self initWithMapItem:a3];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_address, a4);
    uint64_t v10 = [v7 locationOfInterest];
    locationOfInterest = v9->_locationOfInterest;
    v9->_locationOfInterest = (MapsLocationOfInterest *)v10;
  }
  return v9;
}

- (PlaceCardItem)initWithMapItem:(id)a3 chargeStationWaypointInfo:(id)a4
{
  id v7 = a4;
  v8 = [(PlaceCardItem *)self initWithMapItem:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_chargeStationWaypointInfo, a4);
  }

  return v9;
}

- (PlaceCardItem)initWithLocationOfInterest:(id)a3
{
  id v5 = a3;
  v6 = [v5 mapItem];
  id v7 = [(PlaceCardItem *)self initWithMapItem:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_locationOfInterest, a3);
    v8 = [v5 mapItem];
    objc_super v9 = [v8 _geoMapItem];

    uint64_t v10 = [v9 _clientAttributes];
    v11 = [v10 addressBookAttributes];
    v12 = [v11 addressIdentifier];

    if ([v12 length])
    {
      uint64_t v13 = +[AddressBookManager sharedManager];
      uint64_t v14 = [v13 addressForIdentifier:v12];
      address = v7->_address;
      v7->_address = (AddressBookAddress *)v14;

      if (!v7->_address)
      {
        objc_super v16 = [v9 addressObject];
        if (v16)
        {
          v17 = +[AddressBookManager sharedManager];
          uint64_t v18 = [v17 addressForAddressObject:v16];
          v19 = v7->_address;
          v7->_address = (AddressBookAddress *)v18;
        }
      }
    }
  }
  return v7;
}

- (PlaceCardItem)initWithPersonalizedItem:(id)a3
{
  id v5 = a3;
  v6 = [v5 mapItem];
  id v7 = [(PlaceCardItem *)self initWithMapItem:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_personalizedItem, a3);
    uint64_t v8 = [v5 address];
    address = v7->_address;
    v7->_address = (AddressBookAddress *)v8;

    uint64_t v10 = [v5 searchResult];
    searchResult = v7->_searchResult;
    v7->_searchResult = (SearchResult *)v10;

    v12 = v7->_searchResult;
    if (v12) {
      BOOL v13 = [(SearchResultRepr *)v12 type] == 3;
    }
    else {
      BOOL v13 = 0;
    }
    v7->_isDroppedPin = v13;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v5 locationOfInterest];
      locationOfInterest = v7->_locationOfInterest;
      v7->_locationOfInterest = (MapsLocationOfInterest *)v14;
    }
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingMapItem
{
  return +[NSSet setWithObjects:@"searchResult", @"searchResult.mapItem", @"searchResult.reverseGeocoded", @"searchResult.failedToReverseGeocode", @"address.addressValue", @"locationOfInterest.name", @"locationOfInterest.mapItem", 0];
}

- (_MKPlaceItem)placeItem
{
  id v3 = [(PlaceCardItem *)self address];

  if (v3)
  {
    id v4 = [(PlaceCardItem *)self address];
    unsigned int v5 = [v4 isMeCard];

    if (v5) {
      uint64_t v6 = 40;
    }
    else {
      uint64_t v6 = 32;
    }
    id v7 = [(PlaceCardItem *)self mapItem];
    uint64_t v8 = [(PlaceCardItem *)self address];
    objc_super v9 = [v8 contact];
    uint64_t v10 = +[ContactPlaceItem placeItemWithMapItem:v7 contact:v9 options:v6];

    v11 = [(PlaceCardItem *)self address];
    v12 = [v11 addressValue];
    [v10 setSelectedAddress:v12];

    [v10 setLocationOfInterest:self->_locationOfInterest];
    BOOL v13 = [(PlaceCardItem *)self address];
    [v10 setIsMeCard:[v13 isMeCard]];

    uint64_t v14 = [(PlaceCardItem *)self searchResult];
    [v10 setSearchResult:v14];
  }
  else if (self->_isDroppedPin)
  {
    v15 = [(PlaceCardItem *)self searchResult];
    if ([v15 failedToReverseGeocode])
    {
      id v16 = 0;
    }
    else
    {
      v19 = [(PlaceCardItem *)self searchResult];
      id v16 = [v19 hasIncompleteMetadata];
    }
    v20 = [(PlaceCardItem *)self mapItem];
    uint64_t v14 = [v20 _addressFormattedAsName];

    v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"Marked Location" value:@"localized string not found" table:0];

    if ([v14 length]) {
      v23 = v14;
    }
    else {
      v23 = v22;
    }
    id v24 = v23;
    if ([v24 isEqual:v14]) {
      v25 = v22;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;
    v27 = [(PlaceCardItem *)self mapItem];
    uint64_t v10 = +[_MKMapItemPlaceItem placeItemWithMapItem:v27 options:2 isIntermediateMapItem:v16 preferredName:v24 preferredSecondaryName:v26];
  }
  else
  {
    if ([(PlaceCardItem *)self isHomeWorkSchoolAddress]) {
      uint64_t v17 = 8;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = v17 | [(PlaceCardItem *)self isCurrentLocation];
    uint64_t v14 = [(PlaceCardItem *)self mapItem];
    uint64_t v10 = +[_MKMapItemPlaceItem placeItemWithMapItem:v14 options:v18 isIntermediateMapItem:[(PlaceCardItem *)self isIntermediateMapItem]];
  }

  return (_MKPlaceItem *)v10;
}

- (RAPPlace)rapPlace
{
  searchResult = self->_searchResult;
  if (searchResult) {
    id v3 = searchResult;
  }
  else {
    id v3 = [[SearchResult alloc] initWithMapItem:self->_mapItem];
  }

  return (RAPPlace *)v3;
}

- (MKMapItem)mapItem
{
  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest || (locationOfInterest = self->_searchResult) != 0)
  {
    id v3 = [locationOfInterest mapItem];
  }
  else
  {
    id v3 = self->_mapItem;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PlaceCardItem *)a3;
  unsigned int v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    BOOL v7 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    BOOL v7 = self->_address == v6->_address
      && self->_mapItem == v6->_mapItem
      && self->_searchResult == v6->_searchResult
      && self->_isDroppedPin == v6->_isDroppedPin;
  }
  else
  {
LABEL_9:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (NSString)title
{
  v2 = [(PlaceCardItem *)self placeItem];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (CNContact)contact
{
  address = self->_address;
  if (address)
  {
    id v4 = [(AddressBookAddress *)address contact];
  }
  else if (self->_isCurrentLocation)
  {
    unsigned int v5 = +[AddressBookManager sharedManager];
    id v4 = [v5 meCard];
  }
  else
  {
    id v4 = 0;
  }

  return (CNContact *)v4;
}

- (BOOL)shouldInsertInHistory
{
  if ([(PlaceCardItem *)self shouldInsertInHistoryForRAPTrackingOnly])
  {
    LOBYTE(v3) = 1;
  }
  else if ([(PlaceCardItem *)self isCurrentLocation] {
         || ([(PlaceCardItem *)self contact],
  }
             id v4 = objc_claimAutoreleasedReturnValue(),
             v4,
             v4))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v3 = [(PlaceCardItem *)self mapItem];

    if (v3)
    {
      uint64_t v6 = [(PlaceCardItem *)self searchResult];
      BOOL v7 = v6;
      LOBYTE(v3) = !v6 || [v6 type] != 3;
    }
  }
  return (char)v3;
}

- (BOOL)shouldInsertInHistoryForRAPTrackingOnly
{
  if ([(PlaceCardItem *)self isHomeWorkSchoolAddress]) {
    return 1;
  }
  id v4 = [(PlaceCardItem *)self locationOfInterest];
  unsigned int v5 = [v4 identifier];
  BOOL v3 = v5 != 0;

  return v3;
}

- (BOOL)isMeCard
{
  address = self->_address;
  if (address) {
    LOBYTE(address) = [(AddressBookAddress *)address isMeCard];
  }
  return (char)address;
}

- (BOOL)canAddToCollections
{
  BOOL v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v4 = [v3 isUsingOfflineMaps];

  if ((v4 & 1) != 0 || [(PlaceCardItem *)self isMeCard]) {
    return 0;
  }
  uint64_t v6 = [(PlaceCardItem *)self searchResult];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    uint64_t v8 = [(PlaceCardItem *)self searchResult];
    unsigned int v9 = [v8 type];

    if (v9 == 3) {
      return 1;
    }
  }
  uint64_t v10 = [(PlaceCardItem *)self mapItem];
  unsigned __int8 v11 = [v10 _maps_canAddToCollections];

  return v11;
}

- (NSString)defaultCollectionItemTitle
{
  BOOL v3 = [(PlaceCardItem *)self address];
  if (v3)
  {
    if ([(PlaceCardItem *)self isHomeWorkSchoolAddress]) {
      [v3 localizedLabel];
    }
    else {
    unsigned int v5 = [v3 compositeName];
    }
  }
  else
  {
    unsigned __int8 v4 = [(PlaceCardItem *)self mapItem];
    if ([(PlaceCardItem *)self isDroppedPin]) {
      [v4 _addressFormattedAsName];
    }
    else {
    unsigned int v5 = [v4 _maps_defaultCollectionItemTitle];
    }
  }

  return (NSString *)v5;
}

- (BOOL)canAddToShortcuts
{
  v2 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v3 = [v2 isUsingOfflineMaps];

  return v3 ^ 1;
}

- (BOOL)canAddToLibrary
{
  unsigned int v2 = +[LibraryUIUtilities isMyPlacesEnabled];
  if (v2)
  {
    unsigned __int8 v3 = +[MapsOfflineUIHelper sharedHelper];
    unsigned __int8 v4 = [v3 isUsingOfflineMaps];

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

- (BOOL)canAddNote
{
  unsigned int v2 = +[LibraryUIUtilities isMyPlacesEnabled];
  if (v2)
  {
    unsigned __int8 v3 = +[MapsOfflineUIHelper sharedHelper];
    unsigned __int8 v4 = [v3 isUsingOfflineMaps];

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

- (BOOL)canShowOpenFindMyAction
{
  int IsEnabled_MapsWally = MapsFeature_IsEnabled_MapsWally();
  if (IsEnabled_MapsWally)
  {
    unsigned __int8 v4 = [(PlaceCardItem *)self searchResult];
    unsigned int v5 = [v4 autocompletePerson];
    unsigned __int8 v6 = [v5 canShowOpenFindMy];

    LOBYTE(IsEnabled_MapsWally) = v6;
  }
  return IsEnabled_MapsWally;
}

- (BOOL)canShowRequestLocation
{
  int IsEnabled_MapsWally = MapsFeature_IsEnabled_MapsWally();
  if (IsEnabled_MapsWally)
  {
    unsigned __int8 v4 = [(PlaceCardItem *)self searchResult];
    unsigned int v5 = [v4 autocompletePerson];
    unsigned __int8 v6 = [v5 canShowRequestLocation];

    LOBYTE(IsEnabled_MapsWally) = v6;
  }
  return IsEnabled_MapsWally;
}

- (BOOL)isHomeWorkSchoolAddress
{
  unsigned __int8 v3 = [(MapsLocationOfInterest *)self->_locationOfInterest identifier];
  if (v3
    && (![(MapsLocationOfInterest *)self->_locationOfInterest type]
     || (id)[(MapsLocationOfInterest *)self->_locationOfInterest type] == (id)1
     || (id)[(MapsLocationOfInterest *)self->_locationOfInterest type] == (id)2)
    || (address = self->_address) != 0
    && [(AddressBookAddress *)address isHomeWorkSchoolAddress])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v6 = [(PlaceCardItem *)self mapItem];
    unsigned __int8 v5 = [v6 _maps_isHomeWorkOrSchool];
  }
  return v5;
}

- (int64_t)addressType
{
  unsigned __int8 v3 = [(PlaceCardItem *)self locationOfInterest];

  if (v3)
  {
    unsigned __int8 v4 = [(PlaceCardItem *)self locationOfInterest];
    id v5 = [v4 type];

    return (int64_t)v5;
  }
  else
  {
    BOOL v7 = [(PlaceCardItem *)self address];
    unsigned int v8 = [v7 addressType];

    if (v8 <= 3) {
      return v8 - 1;
    }
    else {
      return -1;
    }
  }
}

- (BOOL)shouldShowEditNameAction
{
  if (!self->_locationOfInterest) {
    return 0;
  }
  unsigned __int8 v3 = [(PlaceCardItem *)self mapItem];
  if ([v3 _hasMUID] && objc_msgSend(v3, "_muid"))
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [(PlaceCardItem *)self locationOfInterest];
    unsigned __int8 v4 = [v5 isFrequentLocation];
  }
  return v4;
}

- (NSString)customLabel
{
  return [(MapsLocationOfInterest *)self->_locationOfInterest customLabel];
}

- (PersonalizedItem)personalizedItem
{
  return self->_personalizedItem;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)isDroppedPin
{
  return self->_isDroppedPin;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (BOOL)isIntermediateMapItem
{
  return self->_isIntermediateMapItem;
}

- (void)setIsIntermediateMapItem:(BOOL)a3
{
  self->_isIntermediateMapItem = a3;
}

- (GEOMapItemCorrectedLocationAttributes)correctedLocationAttributes
{
  return self->_correctedLocationAttributes;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (VKEVChargeStationRouteWaypoint)chargeStationWaypointInfo
{
  return self->_chargeStationWaypointInfo;
}

- (CGRect)calloutAnchorRect
{
  double x = self->_calloutAnchorRect.origin.x;
  double y = self->_calloutAnchorRect.origin.y;
  double width = self->_calloutAnchorRect.size.width;
  double height = self->_calloutAnchorRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCalloutAnchorRect:(CGRect)a3
{
  self->_calloutAnchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargeStationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_correctedLocationAttributes, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_personalizedItem, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end