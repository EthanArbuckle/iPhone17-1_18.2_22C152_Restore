@interface AutocompleteItem
+ (id)keysForServerCompletion:(id)a3;
- (AddressBookAddress)address;
- (AutocompleteItem)init;
- (AutocompleteItem)initWithLocalCompletion:(id)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 hasPriorityOverride:(BOOL)a6 priorityOverride:(int64_t)a7 matchInfo:(id)a8;
- (AutocompleteItem)initWithLocalCompletion:(id)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 matchInfo:(id)a6;
- (AutocompleteItem)initWithPersonalizedItem:(id)a3 matchInfo:(id)a4;
- (AutocompleteItem)initWithServerCompletion:(id)a3 hasPriorityOverride:(BOOL)a4 priorityOverride:(int64_t)a5 serverResultScoreMetadata:(id)a6;
- (AutocompleteMatchInfo)matchInfo;
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
- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID;
- (PersonalizedItemPrioritizedStringAdornment)prefix;
- (PersonalizedItemPrioritizedStringAdornment)subtitle;
- (PersonalizedItemPrioritizedStringAdornment)title;
- (PersonalizedItemSource)source;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (VKLabelMarker)sourceLabelMarker;
- (id)_searchItemForString:(id)a3;
- (id)autocompleteObject;
- (id)leafPersonalizedAutocompleteItems;
- (int64_t)priorityOverride;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
- (unint64_t)priority;
- (unint64_t)serverItemIndexInSection;
- (unint64_t)serverSectionIndex;
- (unint64_t)sortOrder;
- (void)setSource:(id)a3;
@end

@implementation AutocompleteItem

- (AutocompleteItem)init
{
  return 0;
}

- (AutocompleteItem)initWithServerCompletion:(id)a3 hasPriorityOverride:(BOOL)a4 priorityOverride:(int64_t)a5 serverResultScoreMetadata:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AutocompleteItem;
  v13 = [(AutocompleteItem *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_object, a3);
    *(_OWORD *)&v14->_sourceType = xmmword_100F67600;
    v14->_hasPriorityOverride = a4;
    v14->_priorityOverride = a5;
    objc_storeStrong((id *)&v14->_serverResultScoreMetadata, a6);
    v14->_hasServerItemIndex = 1;
    v14->_serverSectionIndex = (unint64_t)[v11 serverSectionIndex];
    v14->_serverItemIndexInSection = (unint64_t)[v11 serverItemIndexInSection];
    uint64_t v15 = [v11 mapItem];
    mapItem = v14->_mapItem;
    v14->_mapItem = (MKMapItem *)v15;

    uint64_t v17 = [v11 title];
    title = v14->_title;
    v14->_title = (NSString *)v17;

    uint64_t v19 = [v11 subtitle];
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v19;

    uint64_t v21 = +[AutocompleteItem keysForServerCompletion:v11];
    keys = v14->_keys;
    v14->_keys = (NSSet *)v21;

    uint64_t v23 = +[AutocompleteMatchInfo matchInfoWithType:0];
    matchInfo = v14->_matchInfo;
    v14->_matchInfo = (AutocompleteMatchInfo *)v23;
  }
  return v14;
}

- (AutocompleteItem)initWithLocalCompletion:(id)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 hasPriorityOverride:(BOOL)a6 priorityOverride:(int64_t)a7 matchInfo:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v103.receiver = self;
  v103.super_class = (Class)AutocompleteItem;
  uint64_t v17 = [(AutocompleteItem *)&v103 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_73;
  }
  objc_storeStrong(&v17->_object, a3);
  v18->_sourceType = a4;
  v18->_sourceSubtype = a5;
  v18->_hasPriorityOverride = a6;
  v18->_priorityOverride = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v15;
      uint64_t v28 = [v27 displayString];
      title = v18->_title;
      v18->_title = (NSString *)v28;

      subtitle = v18->_subtitle;
      v18->_subtitle = (NSString *)&stru_101324E70;

      id v31 = [v27 displayString];
      if (!v16)
      {
        id v16 = +[AutocompleteMatchInfo matchInfoWithType:1];
      }

      goto LABEL_56;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = v15;
      uint64_t v41 = [v40 compositeName];
      v42 = v18->_title;
      v18->_title = (NSString *)v41;

LABEL_55:
      id v31 = 0;
      goto LABEL_56;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = v15;
      uint64_t v63 = [v40 title];
      v64 = v18->_title;
      v18->_title = (NSString *)v63;

      uint64_t v65 = [v40 subTitle];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v15;
        uint64_t v73 = [v40 displayName];
        v74 = v18->_title;
        v18->_title = (NSString *)v73;

        uint64_t v65 = [v40 address];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v31 = v15;
              objc_storeStrong((id *)&v18->_title, a3);
              uint64_t v101 = [(AutocompleteItem *)v18 _searchItemForString:v31];
              id object = v18->_object;
              v18->_id object = (id)v101;

              if (!v16)
              {
                uint64_t v72 = 0;
                goto LABEL_47;
              }
            }
            else
            {
              id v31 = 0;
              v18->_hidden = 1;
            }
            goto LABEL_56;
          }
          id v40 = v15;
          uint64_t v93 = [v40 mapItem];
          mapItem = v18->_mapItem;
          v18->_mapItem = (MKMapItem *)v93;
          goto LABEL_53;
        }
        id v40 = v15;
        uint64_t v75 = [v40 MKMapItem];
        v76 = v18->_mapItem;
        v18->_mapItem = (MKMapItem *)v75;

        uint64_t v77 = [v40 title];
        v78 = v18->_title;
        v18->_title = (NSString *)v77;

        uint64_t v65 = [v40 subtitle];
      }
    }
    mapItem = (MKMapItem *)v18->_subtitle;
    v18->_subtitle = (NSString *)v65;
LABEL_53:

    if (!v16)
    {
      id v16 = +[AutocompleteMatchInfo matchInfoWithType:0];
    }
    goto LABEL_55;
  }
  id v19 = v15;
  v20 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  objc_opt_class();
  id v21 = v19;
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  if (v23
    && ([v23 historyEntry],
        v24 = objc_claimAutoreleasedReturnValue(),
        unsigned int v25 = [v24 conformsToProtocol:v20],
        v24,
        v25))
  {
    id v26 = v21;
  }
  else
  {
    id v26 = 0;
  }

  if (v26)
  {
    id v32 = v21;
    v33 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    objc_opt_class();
    id v34 = v32;
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
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

    v43 = [v39 historyEntry];
    v44 = [v43 geoMapItem];
    uint64_t v45 = +[MKMapItem _itemWithGeoMapItem:v44];
    v46 = v18->_mapItem;
    v18->_mapItem = (MKMapItem *)v45;

    id v31 = 0;
    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
    id v47 = v21;
    v48 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
    objc_opt_class();
    id v49 = v47;
    if (objc_opt_isKindOfClass()) {
      v50 = v49;
    }
    else {
      v50 = 0;
    }
    id v51 = v50;

    if (v51
      && ([v51 historyEntry],
          v52 = objc_claimAutoreleasedReturnValue(),
          unsigned int v53 = [v52 conformsToProtocol:v48],
          v52,
          v53))
    {
      id v54 = v49;
    }
    else
    {
      id v54 = 0;
    }

    if (!v54)
    {
      id v31 = 0;
      v18->_hidden = 1;
      if (v16) {
        goto LABEL_56;
      }
      goto LABEL_46;
    }
    id v55 = v49;
    v56 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
    objc_opt_class();
    id v57 = v55;
    if (objc_opt_isKindOfClass()) {
      v58 = v57;
    }
    else {
      v58 = 0;
    }
    id v59 = v58;

    if (v59
      && ([v59 historyEntry],
          v60 = objc_claimAutoreleasedReturnValue(),
          unsigned int v61 = [v60 conformsToProtocol:v56],
          v60,
          v61))
    {
      id v62 = v57;
    }
    else
    {
      id v62 = 0;
    }

    v66 = [v62 historyEntry];
    uint64_t v67 = [v66 query];
    v68 = v18->_title;
    v18->_title = (NSString *)v67;

    v69 = [v62 historyEntry];
    uint64_t v70 = [v69 locationDisplayString];
    v71 = v18->_subtitle;
    v18->_subtitle = (NSString *)v70;

    id v31 = +[NSString stringWithFormat:@"%@\n%@", v18->_title, v18->_subtitle];

    if (!v16)
    {
LABEL_46:
      uint64_t v72 = 1;
LABEL_47:
      id v16 = +[AutocompleteMatchInfo matchInfoWithType:v72];
    }
  }
LABEL_56:
  if (!v18->_mapItem)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v85 = [[AddressBookAddressItemKey alloc] initWithAddressBookAddress:v15];
LABEL_68:
      v80 = (PersonalizedMapItemKey *)v85;
      goto LABEL_69;
    }
    if (v31)
    {
      v85 = [[AutocompleteStringKey alloc] initWithString:v31];
      goto LABEL_68;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v85 = +[NSString stringWithFormat:@"%@\n%@", v18->_title, v18->_subtitle];
      goto LABEL_68;
    }
    id v86 = v15;
    v87 = [v86 handle];
    if (v87)
    {
    }
    else
    {
      uint64_t v94 = [v86 contact];
      if (v94)
      {
        v95 = (void *)v94;
        v96 = [v86 contact];
        v97 = [v96 postalAddresses];
        id v98 = [v97 count];

        if (v98 == (id)1)
        {
          v99 = [AddressBookAddressItemKey alloc];
          v89 = [v86 contact];
          v100 = +[AddressBookAddress singleAddressForContact:v89];
          v80 = [(AddressBookAddressItemKey *)v99 initWithAddressBookAddress:v100];

          goto LABEL_66;
        }
      }
    }
    v88 = [AutocompleteStringKey alloc];
    v89 = [v86 identifier];
    v80 = [(AutocompleteStringKey *)v88 initWithString:v89];
LABEL_66:

    goto LABEL_69;
  }
  v80 = [[PersonalizedMapItemKey alloc] initWithMapItem:v18->_mapItem];
  uint64_t v81 = [(MKMapItem *)v18->_mapItem name];
  v82 = v18->_title;
  v18->_title = (NSString *)v81;

  uint64_t v83 = [(MKMapItem *)v18->_mapItem _addressFormattedAsShortenedAddress];
  v84 = v18->_subtitle;
  v18->_subtitle = (NSString *)v83;

LABEL_69:
  if (v80) {
    +[NSSet setWithObject:v80];
  }
  else {
  uint64_t v90 = +[NSSet set];
  }
  keys = v18->_keys;
  v18->_keys = (NSSet *)v90;

  objc_storeStrong((id *)&v18->_matchInfo, v16);
LABEL_73:

  return v18;
}

- (AutocompleteItem)initWithLocalCompletion:(id)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 matchInfo:(id)a6
{
  return [(AutocompleteItem *)self initWithLocalCompletion:a3 sourceType:a4 sourceSubtype:a5 hasPriorityOverride:0 priorityOverride:0 matchInfo:a6];
}

- (AutocompleteItem)initWithPersonalizedItem:(id)a3 matchInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AutocompleteItem;
  v8 = [(AutocompleteItem *)&v26 init];
  if (v8)
  {
    v8->_sourceType = (int64_t)[v6 sourceType];
    v8->_sourceSubtype = (int64_t)[v6 sourceSubtype];
    if ([v6 hasPriorityOverride])
    {
      v8->_hasPriorityOverride = 1;
      v8->_priorityOverride = (int64_t)[v6 priorityOverride];
    }
    uint64_t v9 = [v6 serverResultScoreMetadata];
    serverResultScoreMetadata = v8->_serverResultScoreMetadata;
    v8->_serverResultScoreMetadata = (GEOServerResultScoreMetadata *)v9;

    v8->_hidden = [v6 hidden];
    unsigned int v11 = [v6 hasServerItemIndex];
    v8->_hasServerItemIndex = v11;
    if (v11)
    {
      v8->_serverSectionIndex = (unint64_t)[v6 serverSectionIndex];
      uint64_t v12 = (uint64_t)[v6 serverItemIndexInSection];
    }
    else
    {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      v8->_serverSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    v8->_serverItemIndexInSection = v12;
    uint64_t v13 = [v6 autocompleteObject];
    id object = v8->_object;
    v8->_id object = (id)v13;

    uint64_t v15 = [v6 keys];
    keys = v8->_keys;
    v8->_keys = (NSSet *)v15;

    uint64_t v17 = [v6 title];
    uint64_t v18 = [v17 value];
    title = v8->_title;
    v8->_title = (NSString *)v18;

    v20 = [v6 subtitle];
    uint64_t v21 = [v20 value];
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v21;

    uint64_t v23 = [v6 mapItem];
    mapItem = v8->_mapItem;
    v8->_mapItem = (MKMapItem *)v23;

    objc_storeStrong((id *)&v8->_matchInfo, a4);
  }

  return v8;
}

+ (id)keysForServerCompletion:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableSet set];
  v5 = [v3 clientResolved];

  if (v5)
  {
    id v6 = [v3 clientResolved];
    id v7 = [v6 itemType];

    if ((v7 - 1) < 2 || v7 == 6)
    {
      uint64_t v9 = objc_alloc_init(ClientTypeResolver);
      v10 = [(ClientTypeResolver *)v9 personalizedItemSource];
      unsigned int v11 = [v10 cachedAddressWithType:v7];

      if (v11)
      {
        v8 = [[AddressBookAddressItemKey alloc] initWithAddressBookAddress:v11];
      }
      else
      {
        uint64_t v12 = [(ClientTypeResolver *)v9 personalizedItemSource];
        uint64_t v13 = [v12 cachedLOIWithType:v7];

        if (v13)
        {
          v14 = [[MapsLocationOfInterest alloc] initWithLocationOfInterest:v13 geoMapItem:0];
          v8 = [[LocationOfInterestItemKey alloc] initWithLocationOfInterest:v14];
        }
        else
        {
          v8 = 0;
        }
      }
      if (!v8) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v7 != 3) {
        goto LABEL_15;
      }
      v8 = +[ParkedCar personalizedItemKey];
      if (!v8) {
        goto LABEL_15;
      }
    }
    [v4 addObject:v8];
  }
LABEL_15:
  uint64_t v15 = [v3 mapItem];

  if (v15)
  {
    id v16 = [PersonalizedMapItemKey alloc];
    uint64_t v17 = [v3 mapItem];
    uint64_t v18 = [(PersonalizedMapItemKey *)v16 initWithMapItem:v17];
    [v4 addObject:v18];
  }
  else
  {
    double v33 = 0.0;
    double v34 = 0.0;
    if ([v3 getCoordinate:&v33])
    {
      id v19 = objc_alloc((Class)CLLocation);
      id v20 = [v19 initWithLatitude:v33 longitude:v34];
      id v21 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v20 placeType:[v3 _placeType]];
      v22 = [v3 title];
      [v21 setName:v22];

      unsigned int v23 = [v3 _hasDisambiguationRadiusMeters];
      v24 = [PersonalizedMapItemKey alloc];
      unsigned int v25 = v24;
      if (v23)
      {
        [v3 _disambiguationRadiusMeters];
        objc_super v26 = -[PersonalizedMapItemKey initWithMapItem:disambiguationRadiusMeters:](v25, "initWithMapItem:disambiguationRadiusMeters:", v21);
      }
      else
      {
        objc_super v26 = [(PersonalizedMapItemKey *)v24 initWithMapItem:v21];
      }
      id v27 = v26;
      [v4 addObject:v26];
    }
  }
  if ([v4 count])
  {
    id v28 = [v4 copy];
  }
  else
  {
    v29 = [v3 title];
    v30 = [v3 subtitle];
    id v31 = +[NSString stringWithFormat:@"%@\n%@", v29, v30];
    id v28 = +[NSSet setWithObject:v31];
  }

  return v28;
}

- (id)_searchItemForString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MSPMutableHistoryEntrySearch);
  [v4 setQuery:v3];

  uint64_t v8 = 0;
  v5 = [v4 transferToImmutableIfValidWithError:&v8];
  id v6 = [[HistoryEntryRecentsItem alloc] initWithHistoryEntry:v5];

  return v6;
}

- (unint64_t)priority
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    [(MKMapItem *)mapItem _coordinate];
  }
  else
  {
    double latitude = kCLLocationCoordinate2DInvalid.latitude;
    double longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  return (GEOEnhancedPlacement *)[(MKMapItem *)self->_mapItem _enhancedPlacement];
}

- (GEOLabelGeometry)labelGeometry
{
  return (GEOLabelGeometry *)[(MKMapItem *)self->_mapItem _labelGeometry];
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:self->_title priority:1];
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:self->_subtitle priority:1];
}

- (unint64_t)sortOrder
{
  return 0;
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  return (PersonalizedItemStyleAttributesAdornment *)+[PersonalizedItemStyleAttributesAdornment defaultAdornment];
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  return (PersonalizedItemClientFeatureIDAdornment *)+[PersonalizedItemClientFeatureIDAdornment defaultAdornment];
}

- (BOOL)shouldBeClustered
{
  return 1;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (BOOL)shouldBeHiddenFromMap
{
  return 0;
}

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (SearchResult)searchResult
{
  return 0;
}

- (VKLabelMarker)sourceLabelMarker
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (NSArray)searchableStrings
{
  return 0;
}

- (NSArray)autocompletionStrings
{
  return 0;
}

- (id)autocompleteObject
{
  return self->_object;
}

- (unint64_t)serverSectionIndex
{
  return self->_serverSectionIndex;
}

- (unint64_t)serverItemIndexInSection
{
  return self->_serverItemIndexInSection;
}

- (BOOL)isCompoundPersonalizedAutocompleteItem
{
  return 0;
}

- (id)leafPersonalizedAutocompleteItems
{
  id v4 = self;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (BOOL)hasPriorityOverride
{
  return self->_hasPriorityOverride;
}

- (int64_t)priorityOverride
{
  return self->_priorityOverride;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  return self->_serverResultScoreMetadata;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)hasServerItemIndex
{
  return self->_hasServerItemIndex;
}

- (NSSet)keys
{
  return self->_keys;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (AutocompleteMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_destroyWeak((id *)&self->source);
  objc_storeStrong((id *)&self->_serverResultScoreMetadata, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_keys, 0);

  objc_storeStrong(&self->_object, 0);
}

@end