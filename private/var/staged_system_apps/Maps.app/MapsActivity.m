@interface MapsActivity
+ (Class)searchPlacesType;
+ (id)mapsActivityPerDefault;
+ (void)brandMapsActivityFromUserActivity:(id)a3 completion:(id)a4;
- (BOOL)affectsMapType;
- (BOOL)hasCollectionsMode;
- (BOOL)hasDirectionsPlan;
- (BOOL)hasDisplayOptions;
- (BOOL)hasDroppedPin;
- (BOOL)hasIsDroppedPinPresented;
- (BOOL)hasIsDroppedPinSelected;
- (BOOL)hasIsPresentingSelectedPlace;
- (BOOL)hasLineItem;
- (BOOL)hasPresentedMapItem;
- (BOOL)hasSearchCategoryStorage;
- (BOOL)hasSearchString;
- (BOOL)hasSelectedPlaceIndex;
- (BOOL)hasSelectedTransitFeatureID;
- (BOOL)hasSelectedTransitLineName;
- (BOOL)hasUserCreatedCollectionID;
- (BOOL)isDroppedPinPresented;
- (BOOL)isDroppedPinSelected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPresentingSelectedPlace;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldIndex;
- (DirectionsPlan)directionsPlan;
- (GEOMapItemStorage)presentedMapItem;
- (GEOSearchCategoryStorage)searchCategoryStorage;
- (GEOURLOptions)displayOptions;
- (MSPDroppedPin)droppedPin;
- (MSPTransitStorageLineItem)lineItem;
- (MapsActivity)initWithBzip2CompressedData:(id)a3;
- (NSData)bzip2CompressedData;
- (NSData)bzip2DataByIterativelyReducingIfNeeded;
- (NSMutableArray)searchPlaces;
- (NSString)name;
- (NSString)searchString;
- (NSString)selectedTransitLineName;
- (NSString)userCreatedCollectionID;
- (id)_destinationDirectionsURL;
- (id)categoryString;
- (id)collectionsModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationString;
- (id)dictionaryRepresentation;
- (id)mapsSiriAction;
- (id)searchPlacesAtIndex:(unint64_t)a3;
- (int)StringAsCollectionsMode:(id)a3;
- (int)collectionsMode;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)searchPlacesCount;
- (unint64_t)selectedPlaceIndex;
- (unint64_t)selectedTransitFeatureID;
- (void)addSearchPlaces:(id)a3;
- (void)clearSearchPlaces;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionsMode:(int)a3;
- (void)setDirectionsPlan:(id)a3;
- (void)setDisplayOptions:(id)a3;
- (void)setDroppedPin:(id)a3;
- (void)setHasCollectionsMode:(BOOL)a3;
- (void)setHasIsDroppedPinPresented:(BOOL)a3;
- (void)setHasIsDroppedPinSelected:(BOOL)a3;
- (void)setHasIsPresentingSelectedPlace:(BOOL)a3;
- (void)setHasSelectedPlaceIndex:(BOOL)a3;
- (void)setHasSelectedTransitFeatureID:(BOOL)a3;
- (void)setIsDroppedPinPresented:(BOOL)a3;
- (void)setIsDroppedPinSelected:(BOOL)a3;
- (void)setIsPresentingSelectedPlace:(BOOL)a3;
- (void)setLineItem:(id)a3;
- (void)setPresentedMapItem:(id)a3;
- (void)setSearchCategoryStorage:(id)a3;
- (void)setSearchPlaces:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSelectedPlaceIndex:(unint64_t)a3;
- (void)setSelectedTransitFeatureID:(unint64_t)a3;
- (void)setSelectedTransitLineName:(id)a3;
- (void)setUserCreatedCollectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MapsActivity

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_displayOptions) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_searchString) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_searchPlaces;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_directionsPlan) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_droppedPin) {
    PBDataWriterWriteSubmessage();
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_presentedMapItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_searchCategoryStorage) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_selectedTransitLineName) {
    PBDataWriterWriteStringField();
  }
  if (self->_lineItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_userCreatedCollectionID) {
    PBDataWriterWriteStringField();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCreatedCollectionID, 0);
  objc_storeStrong((id *)&self->_selectedTransitLineName, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchPlaces, 0);
  objc_storeStrong((id *)&self->_searchCategoryStorage, 0);
  objc_storeStrong((id *)&self->_presentedMapItem, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_droppedPin, 0);
  objc_storeStrong((id *)&self->_displayOptions, 0);

  objc_storeStrong((id *)&self->_directionsPlan, 0);
}

- (id)mapsSiriAction
{
  int64_t v3 = [(MapsActivity *)self type];
  if (v3 == 1)
  {
    uint64_t v14 = [(MapsActivity *)self searchString];
    long long v15 = (void *)v14;
    v16 = &stru_101324E70;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v7 = v16;

    uint64_t v8 = +[GEOMapURLBuilder URLForSearch:v7];
    if (![(__CFString *)v7 length])
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_23;
    }
    v36[0] = @"MapsActionKey";
    v36[1] = @"MapsActionSearchStringKey";
    v37[0] = @"MapsSearchActionKey";
    v37[1] = v7;
    v36[2] = @"MapsActionLaunchURLKey";
    v37[2] = v8;
    v10 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    char v11 = +[NSBundle mainBundle];
    long long v12 = v11;
    CFStringRef v13 = @"SearchActionTitleFor";
LABEL_13:
    v17 = [v11 localizedStringForKey:v13 value:@"localized string not found" table:0];

    id v18 = [objc_alloc((Class)NSString) initWithFormat:v17, v7];
    goto LABEL_21;
  }
  if (v3 != 4)
  {
    if (v3 != 3)
    {
      v10 = 0;
      v9 = 0;
      goto LABEL_27;
    }
    uint64_t v4 = [(MapsActivity *)self destinationString];
    v5 = (void *)v4;
    v6 = &stru_101324E70;
    if (v4) {
      v6 = (__CFString *)v4;
    }
    v7 = v6;

    uint64_t v8 = [(MapsActivity *)self _destinationDirectionsURL];
    v9 = 0;
    if (![(__CFString *)v7 length] || !v8)
    {
      v10 = 0;
      goto LABEL_23;
    }
    v38[0] = @"MapsActionKey";
    v38[1] = @"MapsActionDestinationStringKey";
    v39[0] = @"MapsDirectionsActionKey";
    v39[1] = v7;
    v38[2] = @"MapsActionLaunchURLKey";
    v39[2] = v8;
    v10 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    char v11 = +[NSBundle mainBundle];
    long long v12 = v11;
    CFStringRef v13 = @"DirectionsActionTitleFor";
    goto LABEL_13;
  }
  v7 = [(MapsActivity *)self presentedMapItem];
  if ([(MapsActivity *)self hasSelectedPlaceIndex])
  {
    unint64_t v19 = [(MapsActivity *)self selectedPlaceIndex];
    if (v19 < [(MapsActivity *)self searchPlacesCount])
    {
      v20 = [(MapsActivity *)self searchPlaces];
      uint64_t v21 = [v20 objectAtIndexedSubscript:[self selectedPlaceIndex]];

      v7 = (__CFString *)v21;
    }
  }
  uint64_t v22 = [(__CFString *)v7 name];
  v23 = (void *)v22;
  v24 = &stru_101324E70;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  uint64_t v8 = v24;

  id v25 = [(__CFString *)v7 _muid];
  id v26 = [(__CFString *)v7 _resultProviderID];
  [(__CFString *)v7 coordinate];
  double v28 = v27;
  double v30 = v29;
  v31 = [(__CFString *)v7 shortAddress];
  v17 = +[GEOMapURLBuilder URLForInternalBusiness:id:provider:coordinate:address:](GEOMapURLBuilder, "URLForInternalBusiness:id:provider:coordinate:address:", v8, v25, v26, v31, v28, v30);

  if (![(__CFString *)v8 length])
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_22;
  }
  v34[0] = @"MapsActionKey";
  v34[1] = @"MapsActionMapItemNameKey";
  v35[0] = @"MapsMapItemActionKey";
  v35[1] = v8;
  v34[2] = @"MapsActionLaunchURLKey";
  v35[2] = v17;
  v10 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  id v18 = [objc_alloc((Class)NSString) initWithString:v8];
LABEL_21:
  v9 = v18;
LABEL_22:

LABEL_23:
  if (v9 && [v10 count])
  {
    v32 = [[MapsSiriAction alloc] initWithTitle:v9 userInfo:v10];
    goto LABEL_28;
  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (BOOL)shouldIndex
{
  if ([(MapsActivity *)self hasDirectionsPlan]
    || [(MapsActivity *)self hasSearchCategoryStorage]
    || [(MapsActivity *)self hasSearchString]
    || [(MapsActivity *)self hasPresentedMapItem])
  {
    return 1;
  }

  return [(MapsActivity *)self hasDroppedPin];
}

- (NSString)name
{
  if ([(MapsActivity *)self hasPresentedMapItem]
    || [(MapsActivity *)self hasSelectedPlaceIndex]
    && (unint64_t v3 = [(MapsActivity *)self selectedPlaceIndex],
        v3 < [(MapsActivity *)self searchPlacesCount]))
  {
    if ([(MapsActivity *)self hasPresentedMapItem])
    {
      uint64_t v4 = [(MapsActivity *)self presentedMapItem];
      v5 = [v4 data];
      v6 = +[GEOMapItemStorage mapItemStorageForSerializedMapItemStorage:v5];

      if (!v6)
      {
        uint64_t v22 = 0;
LABEL_15:

        v23 = +[NSBundle mainBundle];
        id v24 = [v23 localizedStringForKey:@"Maps" value:@"localized string not found" table:0];

        if (v22)
        {
          id v25 = [v22 _addressFormattedAsCity];
          if ([v25 length])
          {
            id v26 = +[NSBundle mainBundle];
            double v27 = [v26 localizedStringForKey:@"History_Directions_Title" value:@"localized string not found" table:0];
            double v28 = [v22 name];
            uint64_t v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28, v25);

            id v24 = v26;
          }
          else
          {
            uint64_t v29 = [v22 name];
          }

          id v24 = (id)v29;
        }
        goto LABEL_25;
      }
      id v7 = +[MKMapItem _itemWithGeoMapItem:v6];
    }
    else
    {
      uint64_t v21 = [(MapsActivity *)self searchPlaces];
      v6 = [v21 objectAtIndexedSubscript:[self selectedPlaceIndex]];

      id v7 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v6 isPlaceHolderPlace:0];
    }
    uint64_t v22 = v7;
    goto LABEL_15;
  }
  if (![(MapsActivity *)self hasDirectionsPlan])
  {
    if (![(MapsActivity *)self hasSearchCategoryStorage]
      && ![(MapsActivity *)self hasSearchString])
    {
      goto LABEL_47;
    }
    double v30 = +[SearchSession currentSearchSession];
    v31 = [v30 searchFieldItem];
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x3032000000;
    v85 = sub_1001041F4;
    v86 = sub_100104978;
    id v87 = 0;
    v32 = [v31 historyItem];
    v33 = [v32 historyEntry];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_1009B77A8;
    v81[3] = &unk_1012F87C0;
    v81[4] = &v82;
    [v33 ifSearch:v81 ifRoute:0 ifPlaceDisplay:0 ifTransitLineItem:0];

    id v24 = [v30 currentResults];
    id v34 = [v24 count];

    if ([(MapsActivity *)self hasSearchCategoryStorage])
    {
      id v35 = objc_alloc((Class)GEOSearchCategory);
      v36 = [(MapsActivity *)self searchCategoryStorage];
      id v24 = [v35 initWithStorage:v36];

      v37 = [v24 popularTokenString];
      v38 = v37;
      if (v37)
      {
        id v39 = v37;
      }
      else
      {
        id v39 = [v24 displayString];
      }
      v43 = v39;

      if (!v34) {
        goto LABEL_42;
      }
    }
    else
    {
      v43 = [(MapsActivity *)self searchString];
      id v34 = [(MapsActivity *)self searchPlacesCount];
      if (!v34) {
        goto LABEL_42;
      }
    }
    if ([(id)v83[5] length])
    {
      v50 = +[NSBundle mainBundle];
      v51 = [v50 localizedStringForKey:@"Title_for_search_in_maps_history" value:@"localized string not found" table:0];

      v52 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v51, v34, v83[5]);
      id v24 = +[NSString stringWithFormat:@"%@\n%@", v43, v52];

      goto LABEL_44;
    }
LABEL_42:
    if (!v43)
    {
      char v53 = 1;
LABEL_46:

      _Block_object_dispose(&v82, 8);
      if ((v53 & 1) == 0) {
        goto LABEL_73;
      }
LABEL_47:
      if ([(MapsActivity *)self hasDroppedPin])
      {
        v54 = +[CustomSearchManager sharedManager];
        uint64_t v22 = [v54 customSearchResult];

        v55 = [v22 mapItem];
        v56 = [v55 _addressFormattedAsShortenedAddress];

        unsigned int v57 = +[LibraryUIUtilities isMyPlacesEnabled];
        if (v56)
        {
          v58 = +[NSBundle mainBundle];
          v59 = v58;
          if (v57) {
            CFStringRef v60 = @"Marked Location at %@";
          }
          else {
            CFStringRef v60 = @"Dropped Pin on %@";
          }
          v67 = [v58 localizedStringForKey:v60 value:@"localized string not found" table:0];
          v68 = [v22 mapItem];
          v69 = [v68 _addressFormattedAsShortenedAddress];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v67, v69);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v65 = +[NSBundle mainBundle];
          v59 = v65;
          if (v57) {
            CFStringRef v66 = @"Marked Location";
          }
          else {
            CFStringRef v66 = @"Dropped Pin";
          }
          id v24 = [v65 localizedStringForKey:v66 value:@"localized string not found" table:0];
        }
      }
      else
      {
        uint64_t v22 = +[NSBundle mainBundle];
        id v24 = [v22 localizedStringForKey:@"Maps" value:@"localized string not found" table:0];
      }
LABEL_25:

      goto LABEL_73;
    }
    id v24 = v43;
LABEL_44:
    char v53 = 0;
    goto LABEL_46;
  }
  uint64_t v8 = [(MapsActivity *)self directionsPlan];
  id v9 = [v8 originString];

  v10 = [(MapsActivity *)self directionsPlan];
  id v11 = [v10 destinationString];

  long long v12 = [(MapsActivity *)self directionsPlan];
  CFStringRef v13 = [v12 routeRequestStorage];
  uint64_t v14 = [v13 waypoints];
  id v15 = [v14 count];

  v16 = MKLocalizedStringForCurrentLocation();
  if (v9 && !v11 && v15)
  {
    v17 = [(MapsActivity *)self directionsPlan];
    id v18 = [v17 routeRequestStorage];
    unint64_t v19 = [v18 waypoints];
    v20 = [v19 firstObject];

    if ([v20 isCurrentLocation])
    {
      id v11 = v16;
LABEL_71:

      goto LABEL_72;
    }
    v44 = [v20 geoMapItem];
    id v11 = [v44 name];
    goto LABEL_53;
  }
  if (v11 && !v9 && v15)
  {
    v40 = [(MapsActivity *)self directionsPlan];
    v41 = [v40 routeRequestStorage];
    v42 = [v41 waypoints];
    v20 = [v42 firstObject];

    if ([v20 isCurrentLocation])
    {
      id v9 = v16;
      goto LABEL_71;
    }
    v44 = [v20 geoMapItem];
    id v9 = [v44 name];
LABEL_53:

    goto LABEL_71;
  }
  if ((unint64_t)v15 >= 2)
  {
    v45 = [(MapsActivity *)self directionsPlan];
    v46 = [v45 routeRequestStorage];
    v47 = [v46 waypoints];
    v48 = [v47 firstObject];

    if ([v48 isCurrentLocation])
    {
      v49 = v9;
      id v9 = v16;
    }
    else
    {
      v49 = [v48 geoMapItem];
      uint64_t v70 = [v49 name];

      id v9 = (id)v70;
    }

    v71 = [(MapsActivity *)self directionsPlan];
    v72 = [v71 routeRequestStorage];
    v73 = [v72 waypoints];
    v20 = [v73 lastObject];

    if ([v20 isCurrentLocation])
    {
      id v74 = v16;
    }
    else
    {
      v75 = [v20 geoMapItem];
      id v74 = [v75 name];

      id v11 = v75;
    }

    id v11 = v74;
    goto LABEL_71;
  }
  if (v15 == (id)1)
  {
    v61 = [(MapsActivity *)self directionsPlan];
    v62 = [v61 routeRequestStorage];
    v63 = [v62 waypoints];
    v20 = [v63 firstObject];

    if ([v20 isCurrentLocation])
    {
      id v64 = v16;
    }
    else
    {
      v76 = [v20 geoMapItem];
      id v64 = [v76 name];

      id v11 = v76;
    }

    id v77 = v16;
    id v11 = v64;
    id v9 = v77;
    goto LABEL_71;
  }
LABEL_72:
  v78 = +[NSBundle mainBundle];
  v79 = [v78 localizedStringForKey:@"%@\nDirection from %@" value:@"localized string not found" table:0];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v79, v11, v9);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

LABEL_73:

  return (NSString *)v24;
}

- (int64_t)type
{
  if ([(MapsActivity *)self hasPresentedMapItem]) {
    return 4;
  }
  if ([(MapsActivity *)self hasSelectedPlaceIndex])
  {
    unint64_t v4 = [(MapsActivity *)self selectedPlaceIndex];
    if (v4 < [(MapsActivity *)self searchPlacesCount]) {
      return 4;
    }
  }
  if ([(MapsActivity *)self hasDirectionsPlan]) {
    return 3;
  }
  if ([(MapsActivity *)self hasSearchCategoryStorage]) {
    return 2;
  }
  if ([(MapsActivity *)self hasSearchString]) {
    return 1;
  }
  if ([(MapsActivity *)self hasDroppedPin]) {
    return 5;
  }
  return 0;
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (BOOL)hasSearchCategoryStorage
{
  return self->_searchCategoryStorage != 0;
}

- (BOOL)hasPresentedMapItem
{
  return self->_presentedMapItem != 0;
}

- (BOOL)hasDroppedPin
{
  return self->_droppedPin != 0;
}

- (BOOL)hasDirectionsPlan
{
  return self->_directionsPlan != 0;
}

- (BOOL)hasSelectedPlaceIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSData)bzip2CompressedData
{
  v2 = [(MapsActivity *)self data];
  unint64_t v3 = [v2 bzip2CompressedData];

  return (NSData *)v3;
}

- (void)setSearchString:(id)a3
{
}

- (void)setSearchPlaces:(id)a3
{
}

- (void)setSearchCategoryStorage:(id)a3
{
}

- (void)setDisplayOptions:(id)a3
{
}

- (void)setDirectionsPlan:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (BOOL)isPresentingSelectedPlace
{
  return self->_isPresentingSelectedPlace;
}

- (id)destinationString
{
  unint64_t v3 = [(MapsActivity *)self directionsPlan];
  unint64_t v4 = [v3 destinationString];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v6 = [(MapsActivity *)self directionsPlan];
    id v7 = [v6 routeRequestStorage];
    uint64_t v8 = [v7 waypoints];
    id v9 = [v8 lastObject];

    v10 = [v9 geoMapItem];
    id v11 = [v10 name];
    id v12 = [v11 length];

    if (v12)
    {
      CFStringRef v13 = [v9 geoMapItem];
      id v5 = [v13 name];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_destinationDirectionsURL
{
  unint64_t v3 = [(MapsActivity *)self destinationString];
  unint64_t v4 = [(MapsActivity *)self directionsPlan];
  id v5 = [v4 routeRequestStorage];
  v6 = [v5 waypoints];
  id v7 = [v6 lastObject];

  uint64_t v8 = [v7 geoMapItem];
  id v9 = [v8 shortAddress];
  v10 = [(MapsActivity *)self directionsPlan];
  id v11 = [v10 destinationString];

  if ([v9 length]) {
    id v12 = v9;
  }
  else {
    id v12 = v11;
  }
  id v13 = v12;
  if ([v13 length])
  {
    uint64_t v14 = [GEOMapURLBuilder URLForDirectionsFromHereTo:v3 label:v13 muid:[v8 _muid] provider:[v8 _resultProviderID] transport:4];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)categoryString
{
  if ([(MapsActivity *)self hasSearchCategoryStorage])
  {
    id v3 = objc_alloc((Class)GEOSearchCategory);
    unint64_t v4 = [(MapsActivity *)self searchCategoryStorage];
    id v5 = [v3 initWithStorage:v4];

    v6 = [v5 popularTokenString];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v5 displayString];
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)brandMapsActivityFromUserActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 activityType];
  unsigned int v8 = [v7 isEqualToString:@"MKPlaceBrandUserActivity"];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    id v12 = [v5 userInfo];
    id v13 = [v12 objectForKeyedSubscript:@"MKPlaceBrandUserActivityData"];
    uint64_t v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v13 error:0];

    id v15 = [v14 objectForKeyedSubscript:@"MKPlaceBrandUserActivityID"];
    id v16 = [v15 longLongValue];

    v17 = +[MKMapService sharedService];
    id v18 = [v17 ticketForSearchPoisForBrandMUID:v16 traits:0];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1009B7530;
    v20[3] = &unk_1012E6EF8;
    id v21 = v14;
    id v22 = v6;
    id v19 = v14;
    [v18 submitWithHandler:v20 networkActivity:&stru_1013130D0];
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (MapsActivity)initWithBzip2CompressedData:(id)a3
{
  unint64_t v4 = [a3 bzip2UncompressedData];
  if (v4)
  {
    self = [(MapsActivity *)self initWithData:v4];
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSData)bzip2DataByIterativelyReducingIfNeeded
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MapsActivity *)v2 bzip2CompressedData];
  if ((unint64_t)[v3 length] <= 0x2328)
  {
    id v9 = v3;
  }
  else
  {
    id v4 = [(MapsActivity *)v2 copy];
    while (1)
    {
      id v5 = [v4 searchPlaces];
      id v6 = [v5 count];

      if (!v6) {
        break;
      }
      id v7 = [v4 searchPlaces];
      [v7 removeLastObject];

      unsigned int v8 = [v4 bzip2CompressedData];

      id v3 = v8;
      if ((unint64_t)[v8 length] <= 0x2328) {
        goto LABEL_8;
      }
    }
    unsigned int v8 = v3;
LABEL_8:
    id v9 = v8;
  }
  objc_sync_exit(v2);

  return (NSData *)v9;
}

- (BOOL)affectsMapType
{
  id v3 = [(MapsActivity *)self displayOptions];
  if ([v3 hasMapType])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(MapsActivity *)self displayOptions];
    if ([v5 hasTransportType])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      id v6 = [(MapsActivity *)self directionsPlan];
      id v7 = [v6 routeRequestStorage];
      unsigned __int8 v4 = [v7 hasTransportType];
    }
  }

  return v4;
}

+ (id)mapsActivityPerDefault
{
  v2 = objc_alloc_init(MapsActivity);
  id v3 = objc_alloc_init((Class)GEOURLOptions);
  [(MapsActivity *)v2 setDisplayOptions:v3];

  unsigned __int8 v4 = [(MapsActivity *)v2 displayOptions];
  [v4 setUserTrackingMode:1];

  unint64_t v5 = (unint64_t)+[MapsSettings selectedViewMode] - 1;
  if (v5 > 6) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = dword_100F72DA0[v5];
  }
  id v7 = [(MapsActivity *)v2 displayOptions];
  [v7 setMapType:v6];

  return v2;
}

- (BOOL)hasDisplayOptions
{
  return self->_displayOptions != 0;
}

- (int)collectionsMode
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_collectionsMode;
  }
  else {
    return 0;
  }
}

- (void)setCollectionsMode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_collectionsMode = a3;
}

- (void)setHasCollectionsMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCollectionsMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)collectionsModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_101321018[a3];
  }

  return v3;
}

- (int)StringAsCollectionsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Bookmarks"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Recents"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Contacts"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearSearchPlaces
{
}

- (void)addSearchPlaces:(id)a3
{
  id v4 = a3;
  searchPlaces = self->_searchPlaces;
  id v8 = v4;
  if (!searchPlaces)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_searchPlaces;
    self->_searchPlaces = v6;

    id v4 = v8;
    searchPlaces = self->_searchPlaces;
  }
  [(NSMutableArray *)searchPlaces addObject:v4];
}

- (unint64_t)searchPlacesCount
{
  return (unint64_t)[(NSMutableArray *)self->_searchPlaces count];
}

- (id)searchPlacesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_searchPlaces objectAtIndex:a3];
}

+ (Class)searchPlacesType
{
  return (Class)objc_opt_class();
}

- (void)setSelectedPlaceIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_selectedPlaceIndex = a3;
}

- (void)setHasSelectedPlaceIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsPresentingSelectedPlace:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isPresentingSelectedPlace = a3;
}

- (void)setHasIsPresentingSelectedPlace:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPresentingSelectedPlace
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsDroppedPinSelected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isDroppedPinSelected = a3;
}

- (void)setHasIsDroppedPinSelected:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsDroppedPinSelected
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsDroppedPinPresented:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isDroppedPinPresented = a3;
}

- (void)setHasIsDroppedPinPresented:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsDroppedPinPresented
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSelectedTransitFeatureID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_selectedTransitFeatureID = a3;
}

- (void)setHasSelectedTransitFeatureID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelectedTransitFeatureID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSelectedTransitLineName
{
  return self->_selectedTransitLineName != 0;
}

- (BOOL)hasLineItem
{
  return self->_lineItem != 0;
}

- (BOOL)hasUserCreatedCollectionID
{
  return self->_userCreatedCollectionID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MapsActivity;
  char v3 = [(MapsActivity *)&v7 description];
  id v4 = [(MapsActivity *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  displayOptions = self->_displayOptions;
  if (displayOptions)
  {
    unint64_t v5 = [(GEOURLOptions *)displayOptions dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"displayOptions"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t collectionsMode = self->_collectionsMode;
    if (collectionsMode >= 4)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_collectionsMode];
    }
    else
    {
      objc_super v7 = off_101321018[collectionsMode];
    }
    [v3 setObject:v7 forKey:@"collectionsMode"];
  }
  searchString = self->_searchString;
  if (searchString) {
    [v3 setObject:searchString forKey:@"searchString"];
  }
  if ([(NSMutableArray *)self->_searchPlaces count])
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_searchPlaces, "count")];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v10 = self->_searchPlaces;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"searchPlaces"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v17 = +[NSNumber numberWithUnsignedLongLong:self->_selectedPlaceIndex];
    [v3 setObject:v17 forKey:@"selectedPlaceIndex"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    id v18 = +[NSNumber numberWithBool:self->_isPresentingSelectedPlace];
    [v3 setObject:v18 forKey:@"isPresentingSelectedPlace"];
  }
  directionsPlan = self->_directionsPlan;
  if (directionsPlan)
  {
    v20 = [(DirectionsPlan *)directionsPlan dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"directionsPlan"];
  }
  droppedPin = self->_droppedPin;
  if (droppedPin)
  {
    id v22 = [(MSPDroppedPin *)droppedPin dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"droppedPin"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 0x10) != 0)
  {
    id v24 = +[NSNumber numberWithBool:self->_isDroppedPinSelected];
    [v3 setObject:v24 forKey:@"isDroppedPinSelected"];

    char v23 = (char)self->_has;
  }
  if ((v23 & 8) != 0)
  {
    id v25 = +[NSNumber numberWithBool:self->_isDroppedPinPresented];
    [v3 setObject:v25 forKey:@"isDroppedPinPresented"];
  }
  presentedMapItem = self->_presentedMapItem;
  if (presentedMapItem)
  {
    double v27 = [(GEOMapItemStorage *)presentedMapItem dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"presentedMapItem"];
  }
  searchCategoryStorage = self->_searchCategoryStorage;
  if (searchCategoryStorage)
  {
    uint64_t v29 = [(GEOSearchCategoryStorage *)searchCategoryStorage dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"searchCategoryStorage"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double v30 = +[NSNumber numberWithUnsignedLongLong:self->_selectedTransitFeatureID];
    [v3 setObject:v30 forKey:@"selectedTransitFeatureID"];
  }
  selectedTransitLineName = self->_selectedTransitLineName;
  if (selectedTransitLineName) {
    [v3 setObject:selectedTransitLineName forKey:@"selectedTransitLineName"];
  }
  lineItem = self->_lineItem;
  if (lineItem)
  {
    v33 = [(MSPTransitStorageLineItem *)lineItem dictionaryRepresentation];
    [v3 setObject:v33 forKey:@"lineItem"];
  }
  userCreatedCollectionID = self->_userCreatedCollectionID;
  if (userCreatedCollectionID) {
    [v3 setObject:userCreatedCollectionID forKey:@"userCreatedCollectionID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          uint64_t v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOURLOptions);
          uint64_t v14 = 40;
          goto LABEL_73;
        case 2u:
          char v16 = 0;
          unsigned int v17 = 0;
          uint64_t v18 = 0;
          *(unsigned char *)&self->_has |= 4u;
          while (2)
          {
            unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v19 == -1 || v19 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
              v18 |= (unint64_t)(v20 & 0x7F) << v16;
              if (v20 < 0)
              {
                v16 += 7;
                BOOL v10 = v17++ >= 9;
                if (v10)
                {
                  LODWORD(v18) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v18) = 0;
          }
LABEL_82:
          self->_uint64_t collectionsMode = v18;
          goto LABEL_105;
        case 3u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 88;
          goto LABEL_78;
        case 4u:
          uint64_t v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOMapItemStorage);
          [(MapsActivity *)self addSearchPlaces:v13];
          goto LABEL_74;
        case 5u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v26 == -1 || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
              v25 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                BOOL v10 = v24++ >= 9;
                if (v10)
                {
                  uint64_t v25 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v25 = 0;
          }
LABEL_86:
          uint64_t v48 = 8;
          goto LABEL_104;
        case 6u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          *(unsigned char *)&self->_has |= 0x20u;
          while (2)
          {
            unint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v31 == -1 || v31 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
              v30 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                BOOL v10 = v29++ >= 9;
                if (v10)
                {
                  uint64_t v30 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v30 = 0;
          }
LABEL_90:
          BOOL v49 = v30 != 0;
          uint64_t v50 = 114;
          goto LABEL_99;
        case 7u:
          uint64_t v13 = objc_alloc_init(DirectionsPlan);
          objc_storeStrong((id *)&self->_directionsPlan, v13);
          if (!PBReaderPlaceMark() || (sub_100831B04((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
            goto LABEL_107;
          }
          goto LABEL_76;
        case 8u:
          uint64_t v13 = (DirectionsPlan *)objc_alloc_init((Class)MSPDroppedPin);
          uint64_t v14 = 48;
          goto LABEL_73;
        case 9u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          *(unsigned char *)&self->_has |= 0x10u;
          while (2)
          {
            unint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v36 == -1 || v36 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v36 + 1;
              v35 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v10 = v34++ >= 9;
                if (v10)
                {
                  uint64_t v35 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v35 = 0;
          }
LABEL_94:
          BOOL v49 = v35 != 0;
          uint64_t v50 = 113;
          goto LABEL_99;
        case 0xAu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)&self->_has |= 8u;
          while (2)
          {
            unint64_t v41 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v41 == -1 || v41 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v41);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v41 + 1;
              v40 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                BOOL v10 = v39++ >= 9;
                if (v10)
                {
                  uint64_t v40 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v40 = 0;
          }
LABEL_98:
          BOOL v49 = v40 != 0;
          uint64_t v50 = 112;
LABEL_99:
          self->PBCodable_opaque[v50] = v49;
          goto LABEL_105;
        case 0xBu:
          uint64_t v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOMapItemStorage);
          uint64_t v14 = 64;
          goto LABEL_73;
        case 0xCu:
          uint64_t v13 = (DirectionsPlan *)objc_alloc_init((Class)GEOSearchCategoryStorage);
          uint64_t v14 = 72;
          goto LABEL_73;
        case 0xDu:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v25 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            unint64_t v45 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v45 == -1 || v45 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v45);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v45 + 1;
              v25 |= (unint64_t)(v46 & 0x7F) << v43;
              if (v46 < 0)
              {
                v43 += 7;
                BOOL v10 = v44++ >= 9;
                if (v10)
                {
                  uint64_t v25 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v25 = 0;
          }
LABEL_103:
          uint64_t v48 = 16;
LABEL_104:
          *(void *)&self->PBCodable_opaque[v48] = v25;
          goto LABEL_105;
        case 0xEu:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 96;
          goto LABEL_78;
        case 0xFu:
          uint64_t v13 = (DirectionsPlan *)objc_alloc_init((Class)MSPTransitStorageLineItem);
          uint64_t v14 = 56;
LABEL_73:
          objc_storeStrong((id *)&self->PBCodable_opaque[v14], v13);
LABEL_74:
          if (!PBReaderPlaceMark() || !-[DirectionsPlan readFrom:](v13, "readFrom:", a3, 0, 0))
          {
LABEL_107:

            LOBYTE(v15) = 0;
            return v15;
          }
LABEL_76:
          PBReaderRecallMark();

LABEL_105:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_106;
          break;
        case 0x10u:
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 104;
LABEL_78:
          v47 = *(void **)&self->PBCodable_opaque[v22];
          *(void *)&self->PBCodable_opaque[v22] = v21;

          goto LABEL_105;
        default:
          int v15 = PBReaderSkipValueWithTag();
          if (!v15) {
            return v15;
          }
          goto LABEL_105;
      }
    }
  }
LABEL_106:
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_displayOptions)
  {
    [v4 setDisplayOptions:];
    id v4 = v12;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_collectionsMode;
    *((unsigned char *)v4 + 116) |= 4u;
  }
  if (self->_searchString) {
    [v12 setSearchString:];
  }
  if ([(MapsActivity *)self searchPlacesCount])
  {
    [v12 clearSearchPlaces];
    unint64_t v5 = [(MapsActivity *)self searchPlacesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        unint64_t v8 = [(MapsActivity *)self searchPlacesAtIndex:i];
        [v12 addSearchPlaces:v8];
      }
    }
  }
  char has = (char)self->_has;
  BOOL v10 = v12;
  if (has)
  {
    *((void *)v12 + 1) = self->_selectedPlaceIndex;
    *((unsigned char *)v12 + 116) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v12 + 114) = self->_isPresentingSelectedPlace;
    *((unsigned char *)v12 + 116) |= 0x20u;
  }
  if (self->_directionsPlan)
  {
    [v12 setDirectionsPlan:];
    BOOL v10 = v12;
  }
  if (self->_droppedPin)
  {
    [v12 setDroppedPin:];
    BOOL v10 = v12;
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    v10[113] = self->_isDroppedPinSelected;
    v10[116] |= 0x10u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 8) != 0)
  {
    v10[112] = self->_isDroppedPinPresented;
    v10[116] |= 8u;
  }
  if (self->_presentedMapItem)
  {
    [v12 setPresentedMapItem:];
    BOOL v10 = v12;
  }
  if (self->_searchCategoryStorage)
  {
    [v12 setSearchCategoryStorage];
    BOOL v10 = v12;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v10 + 2) = self->_selectedTransitFeatureID;
    v10[116] |= 2u;
  }
  if (self->_selectedTransitLineName)
  {
    [v12 setSelectedTransitLineName:];
    BOOL v10 = v12;
  }
  if (self->_lineItem)
  {
    [v12 setLineItem:];
    BOOL v10 = v12;
  }
  if (self->_userCreatedCollectionID)
  {
    [v12 setUserCreatedCollectionID:];
    BOOL v10 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOURLOptions *)self->_displayOptions copyWithZone:a3];
  unint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_collectionsMode;
    *((unsigned char *)v5 + 116) |= 4u;
  }
  id v8 = [(NSString *)self->_searchString copyWithZone:a3];
  char v9 = (void *)v5[11];
  v5[11] = v8;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  BOOL v10 = self->_searchPlaces;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [v33 copyWithZone:a3];
        [v5 addSearchPlaces:v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_selectedPlaceIndex;
    *((unsigned char *)v5 + 116) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v5 + 114) = self->_isPresentingSelectedPlace;
    *((unsigned char *)v5 + 116) |= 0x20u;
  }
  id v17 = -[DirectionsPlan copyWithZone:](self->_directionsPlan, "copyWithZone:", a3, (void)v33);
  uint64_t v18 = (void *)v5[4];
  v5[4] = v17;

  id v19 = [(MSPDroppedPin *)self->_droppedPin copyWithZone:a3];
  char v20 = (void *)v5[6];
  v5[6] = v19;

  char v21 = (char)self->_has;
  if ((v21 & 0x10) != 0)
  {
    *((unsigned char *)v5 + 113) = self->_isDroppedPinSelected;
    *((unsigned char *)v5 + 116) |= 0x10u;
    char v21 = (char)self->_has;
  }
  if ((v21 & 8) != 0)
  {
    *((unsigned char *)v5 + 112) = self->_isDroppedPinPresented;
    *((unsigned char *)v5 + 116) |= 8u;
  }
  id v22 = [(GEOMapItemStorage *)self->_presentedMapItem copyWithZone:a3];
  char v23 = (void *)v5[8];
  v5[8] = v22;

  id v24 = [(GEOSearchCategoryStorage *)self->_searchCategoryStorage copyWithZone:a3];
  uint64_t v25 = (void *)v5[9];
  v5[9] = v24;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = self->_selectedTransitFeatureID;
    *((unsigned char *)v5 + 116) |= 2u;
  }
  id v26 = [(NSString *)self->_selectedTransitLineName copyWithZone:a3];
  char v27 = (void *)v5[12];
  v5[12] = v26;

  id v28 = [(MSPTransitStorageLineItem *)self->_lineItem copyWithZone:a3];
  unsigned int v29 = (void *)v5[7];
  v5[7] = v28;

  id v30 = [(NSString *)self->_userCreatedCollectionID copyWithZone:a3];
  unint64_t v31 = (void *)v5[13];
  v5[13] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  displayOptions = self->_displayOptions;
  if ((unint64_t)displayOptions | *((void *)v4 + 5))
  {
    if (!-[GEOURLOptions isEqual:](displayOptions, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 4) == 0 || self->_collectionsMode != *((_DWORD *)v4 + 6)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    goto LABEL_61;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 11)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_61;
  }
  searchPlaces = self->_searchPlaces;
  if ((unint64_t)searchPlaces | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](searchPlaces, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_selectedPlaceIndex != *((void *)v4 + 1)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 0x20) == 0) {
      goto LABEL_61;
    }
    if (self->_isPresentingSelectedPlace)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  directionsPlan = self->_directionsPlan;
  if ((unint64_t)directionsPlan | *((void *)v4 + 4) && !-[DirectionsPlan isEqual:](directionsPlan, "isEqual:")) {
    goto LABEL_61;
  }
  droppedPin = self->_droppedPin;
  if ((unint64_t)droppedPin | *((void *)v4 + 6))
  {
    if (!-[MSPDroppedPin isEqual:](droppedPin, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 0x10) == 0) {
      goto LABEL_61;
    }
    if (self->_isDroppedPinSelected)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 8) != 0)
    {
      if (self->_isDroppedPinPresented)
      {
        if (!*((unsigned char *)v4 + 112)) {
          goto LABEL_61;
        }
        goto LABEL_46;
      }
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_46;
      }
    }
LABEL_61:
    unsigned __int8 v15 = 0;
    goto LABEL_62;
  }
  if ((*((unsigned char *)v4 + 116) & 8) != 0) {
    goto LABEL_61;
  }
LABEL_46:
  presentedMapItem = self->_presentedMapItem;
  if ((unint64_t)presentedMapItem | *((void *)v4 + 8)
    && !-[GEOMapItemStorage isEqual:](presentedMapItem, "isEqual:"))
  {
    goto LABEL_61;
  }
  searchCategoryStorage = self->_searchCategoryStorage;
  if ((unint64_t)searchCategoryStorage | *((void *)v4 + 9))
  {
    if (!-[GEOSearchCategoryStorage isEqual:](searchCategoryStorage, "isEqual:")) {
      goto LABEL_61;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 2) == 0 || self->_selectedTransitFeatureID != *((void *)v4 + 2)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
    goto LABEL_61;
  }
  selectedTransitLineName = self->_selectedTransitLineName;
  if ((unint64_t)selectedTransitLineName | *((void *)v4 + 12)
    && !-[NSString isEqual:](selectedTransitLineName, "isEqual:"))
  {
    goto LABEL_61;
  }
  lineItem = self->_lineItem;
  if ((unint64_t)lineItem | *((void *)v4 + 7))
  {
    if (!-[MSPTransitStorageLineItem isEqual:](lineItem, "isEqual:")) {
      goto LABEL_61;
    }
  }
  userCreatedCollectionID = self->_userCreatedCollectionID;
  if ((unint64_t)userCreatedCollectionID | *((void *)v4 + 13)) {
    unsigned __int8 v15 = -[NSString isEqual:](userCreatedCollectionID, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_62:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v19 = (unint64_t)[(GEOURLOptions *)self->_displayOptions hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v18 = 2654435761 * self->_collectionsMode;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_searchString hash];
  unint64_t v16 = (unint64_t)[(NSMutableArray *)self->_searchPlaces hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v15 = 2654435761u * self->_selectedPlaceIndex;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_6:
      uint64_t v3 = 2654435761 * self->_isPresentingSelectedPlace;
      goto LABEL_9;
    }
  }
  uint64_t v3 = 0;
LABEL_9:
  unint64_t v4 = [(DirectionsPlan *)self->_directionsPlan hash];
  unint64_t v5 = (unint64_t)[(MSPDroppedPin *)self->_droppedPin hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isDroppedPinSelected;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_11:
      uint64_t v7 = 2654435761 * self->_isDroppedPinPresented;
      goto LABEL_14;
    }
  }
  uint64_t v7 = 0;
LABEL_14:
  unint64_t v8 = (unint64_t)[(GEOMapItemStorage *)self->_presentedMapItem hash];
  unint64_t v9 = (unint64_t)[(GEOSearchCategoryStorage *)self->_searchCategoryStorage hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v10 = 2654435761u * self->_selectedTransitFeatureID;
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v12 = [(NSString *)self->_selectedTransitLineName hash];
  unint64_t v13 = v12 ^ (unint64_t)[(MSPTransitStorageLineItem *)self->_lineItem hash];
  return v11 ^ v13 ^ [(NSString *)self->_userCreatedCollectionID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  displayOptions = self->_displayOptions;
  uint64_t v6 = *((void *)v4 + 5);
  if (displayOptions)
  {
    if (v6) {
      -[GEOURLOptions mergeFrom:](displayOptions, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MapsActivity setDisplayOptions:](self, "setDisplayOptions:");
  }
  if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    self->_uint64_t collectionsMode = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 11)) {
    -[MapsActivity setSearchString:](self, "setSearchString:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = *((id *)v4 + 10);
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        -[MapsActivity addSearchPlaces:](self, "addSearchPlaces:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
      }
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v4 + 116);
  if (v12)
  {
    self->_selectedPlaceIndex = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v12 = *((unsigned char *)v4 + 116);
  }
  if ((v12 & 0x20) != 0)
  {
    self->_isPresentingSelectedPlace = *((unsigned char *)v4 + 114);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  directionsPlan = self->_directionsPlan;
  uint64_t v14 = *((void *)v4 + 4);
  if (directionsPlan)
  {
    if (v14) {
      -[DirectionsPlan mergeFrom:](directionsPlan, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[MapsActivity setDirectionsPlan:](self, "setDirectionsPlan:");
  }
  droppedPin = self->_droppedPin;
  uint64_t v16 = *((void *)v4 + 6);
  if (droppedPin)
  {
    if (v16) {
      -[MSPDroppedPin mergeFrom:](droppedPin, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[MapsActivity setDroppedPin:](self, "setDroppedPin:");
  }
  char v17 = *((unsigned char *)v4 + 116);
  if ((v17 & 0x10) != 0)
  {
    self->_isDroppedPinSelected = *((unsigned char *)v4 + 113);
    *(unsigned char *)&self->_has |= 0x10u;
    char v17 = *((unsigned char *)v4 + 116);
  }
  if ((v17 & 8) != 0)
  {
    self->_isDroppedPinPresented = *((unsigned char *)v4 + 112);
    *(unsigned char *)&self->_has |= 8u;
  }
  presentedMapItem = self->_presentedMapItem;
  uint64_t v19 = *((void *)v4 + 8);
  if (presentedMapItem)
  {
    if (v19) {
      -[GEOMapItemStorage mergeFrom:](presentedMapItem, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[MapsActivity setPresentedMapItem:](self, "setPresentedMapItem:");
  }
  searchCategoryStorage = self->_searchCategoryStorage;
  uint64_t v21 = *((void *)v4 + 9);
  if (searchCategoryStorage)
  {
    if (v21) {
      -[GEOSearchCategoryStorage mergeFrom:](searchCategoryStorage, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[MapsActivity setSearchCategoryStorage:](self, "setSearchCategoryStorage:");
  }
  if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
    self->_selectedTransitFeatureID = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 12)) {
    -[MapsActivity setSelectedTransitLineName:](self, "setSelectedTransitLineName:");
  }
  lineItem = self->_lineItem;
  uint64_t v23 = *((void *)v4 + 7);
  if (lineItem)
  {
    if (v23) {
      -[MSPTransitStorageLineItem mergeFrom:](lineItem, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[MapsActivity setLineItem:](self, "setLineItem:");
  }
  if (*((void *)v4 + 13)) {
    -[MapsActivity setUserCreatedCollectionID:](self, "setUserCreatedCollectionID:");
  }
}

- (GEOURLOptions)displayOptions
{
  return self->_displayOptions;
}

- (NSMutableArray)searchPlaces
{
  return self->_searchPlaces;
}

- (unint64_t)selectedPlaceIndex
{
  return self->_selectedPlaceIndex;
}

- (DirectionsPlan)directionsPlan
{
  return self->_directionsPlan;
}

- (MSPDroppedPin)droppedPin
{
  return self->_droppedPin;
}

- (void)setDroppedPin:(id)a3
{
}

- (BOOL)isDroppedPinSelected
{
  return self->_isDroppedPinSelected;
}

- (BOOL)isDroppedPinPresented
{
  return self->_isDroppedPinPresented;
}

- (GEOMapItemStorage)presentedMapItem
{
  return self->_presentedMapItem;
}

- (void)setPresentedMapItem:(id)a3
{
}

- (GEOSearchCategoryStorage)searchCategoryStorage
{
  return self->_searchCategoryStorage;
}

- (unint64_t)selectedTransitFeatureID
{
  return self->_selectedTransitFeatureID;
}

- (NSString)selectedTransitLineName
{
  return self->_selectedTransitLineName;
}

- (void)setSelectedTransitLineName:(id)a3
{
}

- (MSPTransitStorageLineItem)lineItem
{
  return self->_lineItem;
}

- (void)setLineItem:(id)a3
{
}

- (NSString)userCreatedCollectionID
{
  return self->_userCreatedCollectionID;
}

- (void)setUserCreatedCollectionID:(id)a3
{
}

@end