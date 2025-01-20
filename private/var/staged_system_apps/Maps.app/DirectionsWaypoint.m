@interface DirectionsWaypoint
+ (DirectionsWaypoint)directionsWaypointWithNanoDirectionWaypoint:(id)a3;
- ($C79183323B9A0D5602617FF3BE5395AC)bounds;
- (AddressBookAddress)requestAddress;
- (BOOL)containsSearchResult:(id)a3;
- (BOOL)isDynamicCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CLLocationCoordinate2D)coordinate;
- (ExternalURLQuery)externalURLQuery;
- (MKLocalSearchCompletion)completion;
- (MKMapItem)mapItemIfLoaded;
- (NSString)hawkQueryRepresentation;
- (NSString)location;
- (NSString)requestSearchString;
- (NSString)singleLineAddress;
- (NSString)suggestionsPrefix;
- (SearchResult)pin;
- (SearchResult)requestSearch;
- (SearchResult)responseSearch;
- (id)description;
- (id)nanoDirectionWaypoint;
- (unint64_t)hash;
- (void)setCompletion:(id)a3;
- (void)setExternalURLQuery:(id)a3;
- (void)setRequestAddress:(id)a3;
- (void)setRequestSearch:(id)a3;
- (void)setRequestSearchString:(id)a3;
- (void)setResponseSearch:(id)a3;
- (void)setSuggestionsPrefix:(id)a3;
- (void)updateFromGEOComposedWaypoint:(id)a3;
@end

@implementation DirectionsWaypoint

+ (DirectionsWaypoint)directionsWaypointWithNanoDirectionWaypoint:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(DirectionsWaypoint);
  if ([v3 isCurrentLocation])
  {
    v5 = +[SearchResult currentLocationSearchResult];
    [(DirectionsWaypoint *)v4 setRequestSearch:v5];
LABEL_8:

    goto LABEL_9;
  }
  v6 = [v3 searchString];

  if (v6)
  {
    v5 = [v3 searchString];
    [(DirectionsWaypoint *)v4 setRequestSearchString:v5];
    goto LABEL_8;
  }
  v7 = [v3 geoMapItem];

  if (v7)
  {
    v8 = [SearchResult alloc];
    v5 = [v3 geoMapItem];
    v9 = [(SearchResult *)v8 initWithGEOMapItem:v5];
    [(DirectionsWaypoint *)v4 setRequestSearch:v9];
LABEL_7:

    goto LABEL_8;
  }
  if ([v3 muid] && (int)objc_msgSend(v3, "providerID") >= 1)
  {
    v13 = [ExternalURLQuery alloc];
    v5 = [v3 searchString];
    v9 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:](v13, "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v5, [v3 muid], objc_msgSend(v3, "providerID"), 0, kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);
    [(DirectionsWaypoint *)v4 setExternalURLQuery:v9];
    goto LABEL_7;
  }
LABEL_9:
  v10 = [v3 composedWaypoint];

  if (v10)
  {
    v11 = [v3 composedWaypoint];
    [(DirectionsWaypoint *)v4 updateFromGEOComposedWaypoint:v11];
  }

  return v4;
}

- (id)nanoDirectionWaypoint
{
  id v3 = objc_alloc_init(NanoDirectionWaypoint);
  v4 = [(DirectionsWaypoint *)self requestSearch];

  if (v4)
  {
    v5 = [(DirectionsWaypoint *)self requestSearch];
    unsigned int v6 = [v5 isDynamicCurrentLocation];

    if (v6)
    {
      v7 = [(DirectionsWaypoint *)self requestSearch];
      [v7 coordinate];
      double v9 = v8;
      double v11 = v10;

      id v12 = 0;
      if (v11 >= -180.0 && v11 <= 180.0 && v9 >= -90.0 && v9 <= 90.0) {
        id v12 = [objc_alloc((Class)GEOLocation) initWithGEOCoordinate:1 isUserLocation:v9];
      }
      uint64_t v13 = +[NanoDirectionWaypoint directionWaypointForCurrentLocation:v12];
      goto LABEL_11;
    }
    id v12 = [(DirectionsWaypoint *)self requestSearch];
    v16 = [v12 mapItem];
    v17 = [(NanoDirectionWaypoint *)v16 _geoMapItem];
    uint64_t v15 = +[NanoDirectionWaypoint directionWaypointWithGEOMapItem:v17];

LABEL_15:
    id v3 = v16;
    goto LABEL_16;
  }
  v14 = [(DirectionsWaypoint *)self requestSearchString];

  if (!v14)
  {
    v18 = [(DirectionsWaypoint *)self externalURLQuery];

    if (!v18) {
      goto LABEL_17;
    }
    id v12 = [(DirectionsWaypoint *)self externalURLQuery];
    v16 = [v12 query];
    v17 = [(DirectionsWaypoint *)self externalURLQuery];
    id v19 = [v17 muid];
    v20 = [(DirectionsWaypoint *)self externalURLQuery];
    uint64_t v15 = +[NanoDirectionWaypoint directionWaypointWithLabel:muid:providerID:](NanoDirectionWaypoint, "directionWaypointWithLabel:muid:providerID:", v16, v19, [v20 resultProviderId]);

    goto LABEL_15;
  }
  id v12 = [(DirectionsWaypoint *)self requestSearchString];
  uint64_t v13 = +[NanoDirectionWaypoint directionWaypointWithSearchString:v12];
LABEL_11:
  uint64_t v15 = v13;
LABEL_16:

  id v3 = (NanoDirectionWaypoint *)v15;
LABEL_17:
  v21 = [(DirectionsWaypoint *)self responseSearch];

  if (v21)
  {
    v22 = [(DirectionsWaypoint *)self responseSearch];
    v23 = [v22 composedWaypoint];
    [(NanoDirectionWaypoint *)v3 setComposedWaypoint:v23];
  }

  return v3;
}

- (void)updateFromGEOComposedWaypoint:(id)a3
{
  id v15 = a3;
  v4 = [(DirectionsWaypoint *)self responseSearch];

  v5 = v15;
  if (!v4)
  {
    unsigned int v6 = [v15 geoMapItem];
    v7 = [(DirectionsWaypoint *)self requestSearch];

    if (v7)
    {
      double v8 = [(DirectionsWaypoint *)self requestSearch];
      id v9 = [v8 copy];
      [(DirectionsWaypoint *)self setResponseSearch:v9];

      double v10 = [(DirectionsWaypoint *)self responseSearch];
      [v10 updateWithGEOMapItem:v6];
    }
    else
    {
      if ([v15 hasFindMyHandleID])
      {
        double v11 = [[SearchResult alloc] initWithComposedWaypoint:v15];
      }
      else
      {
        unsigned int v12 = [v15 isCurrentLocation];
        if (v6)
        {
          if ((v12 & 1) == 0 && ![v15 isLocationWaypointType])
          {
            uint64_t v13 = [SearchResult alloc];
            double v10 = +[MKMapItem _itemWithGeoMapItem:v6];
            v14 = [(SearchResult *)v13 initWithMapItem:v10];
            [(DirectionsWaypoint *)self setResponseSearch:v14];

            goto LABEL_13;
          }
          double v11 = [[SearchResult alloc] initWithComposedWaypoint:v15 preserveLocationInfo:1];
        }
        else
        {
          if (!v12)
          {
LABEL_14:

            v5 = v15;
            goto LABEL_15;
          }
          double v11 = +[SearchResult currentLocationSearchResult];
        }
      }
      double v10 = v11;
      [(DirectionsWaypoint *)self setResponseSearch:v11];
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
}

- (void)setResponseSearch:(id)a3
{
  v5 = (SearchResult *)a3;
  p_responseSearch = &self->_responseSearch;
  if (self->_responseSearch != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_responseSearch, a3);
    v5 = v9;
    requestSearch = self->_requestSearch;
    p_requestSearch = &self->_requestSearch;
    if (!requestSearch)
    {
      objc_storeStrong((id *)p_requestSearch, *p_responseSearch);
      v5 = v9;
    }
  }
}

- (BOOL)isValid
{
  completion = self->_completion;
  if (completion)
  {
    v4 = [(MKLocalSearchCompletion *)completion category];
    if (v4)
    {

      return 1;
    }
    v5 = [(MKLocalSearchCompletion *)self->_completion queryLine];
    if ([v5 length])
    {

      return 1;
    }
    unsigned int v6 = [(MKLocalSearchCompletion *)self->_completion title];
    id v7 = [v6 length];

    if (v7) {
      return 1;
    }
  }
  if (self->_responseSearch || self->_externalURLQuery || self->_requestSearch || self->_requestAddress) {
    return 1;
  }
  return [(NSString *)self->_requestSearchString length] != 0;
}

- (NSString)location
{
  if ([(DirectionsWaypoint *)self isValid])
  {
    requestSearch = self->_requestSearch;
    if (requestSearch)
    {
      v4 = [(SearchResult *)requestSearch routableAddress];
LABEL_4:
      v5 = v4;
      goto LABEL_6;
    }
    completion = self->_completion;
    if (!completion)
    {
      externalURLQuery = self->_externalURLQuery;
      if (externalURLQuery)
      {
        v4 = [(ExternalURLQuery *)externalURLQuery query];
      }
      else if ([(AddressBookAddress *)self->_requestAddress isValid])
      {
        v4 = [(AddressBookAddress *)self->_requestAddress singleLineAddress];
      }
      else
      {
        v4 = self->_requestSearchString;
      }
      goto LABEL_4;
    }
    double v8 = [(MKLocalSearchCompletion *)completion displayLines];
    v5 = [v8 componentsJoinedByString:@","];

    if (![v5 length])
    {
      double v13 = 0.0;
      double v14 = 0.0;
      if ([(MKLocalSearchCompletion *)self->_completion getCoordinate:&v13])
      {
        id v9 = +[NSNumber numberWithDouble:v13];
        double v10 = +[NSNumber numberWithDouble:v14];
        uint64_t v11 = +[NSString stringWithFormat:@"%@, %@", v9, v10];

        v5 = (void *)v11;
      }
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_6:

  return (NSString *)v5;
}

- (NSString)hawkQueryRepresentation
{
  if ([(DirectionsWaypoint *)self isValid])
  {
    id v3 = [(DirectionsWaypoint *)self mapItemIfLoaded];
    v4 = [v3 _identifier];

    if (v4)
    {
      v5 = [(DirectionsWaypoint *)self location];
    }
    else
    {
      [(DirectionsWaypoint *)self coordinate];
      unsigned int v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(DirectionsWaypoint *)self coordinate];
      double v8 = +[NSNumber numberWithDouble:v7];
      v5 = +[NSString stringWithFormat:@"%@, %@", v6, v8];
    }
  }
  else
  {
    v5 = @"<invalid>";
  }

  return (NSString *)v5;
}

- (BOOL)containsSearchResult:(id)a3
{
  return self->_requestSearch == a3 || self->_responseSearch == a3;
}

- (NSString)singleLineAddress
{
  id v3 = [(SearchResult *)self->_requestSearch singleLineAddress];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(SearchResult *)self->_responseSearch singleLineAddress];
  }
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)isDynamicCurrentLocation
{
  return [(SearchResult *)self->_requestSearch isDynamicCurrentLocation];
}

- (SearchResult)pin
{
  requestSearch = self->_requestSearch;
  if (!requestSearch) {
    requestSearch = self->_responseSearch;
  }
  return requestSearch;
}

- (CLLocationCoordinate2D)coordinate
{
  id v3 = [(DirectionsWaypoint *)self pin];
  if (v3)
  {
    id v4 = [(DirectionsWaypoint *)self pin];
    [v4 coordinate];
    CLLocationDegrees latitude = v5;
    CLLocationDegrees longitude = v7;
  }
  else
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v9 = latitude;
  double v10 = longitude;
  result.CLLocationDegrees longitude = v10;
  result.CLLocationDegrees latitude = v9;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)bounds
{
  v2 = [(DirectionsWaypoint *)self pin];
  [v2 coordinate];
  if (v2 && v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0 && v3 <= 90.0)
  {
    MKMapPoint v5 = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)&v3);
    double x = v5.x;
    double y = v5.y;
    double width = 0.0;
    double height = 0.0;
  }
  else
  {
    double x = MKMapRectNull.origin.x;
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
  }

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.var1.var1 = v13;
  result.var1.var0 = v12;
  result.var0.var1 = v11;
  result.var0.var0 = v10;
  return result;
}

- (MKMapItem)mapItemIfLoaded
{
  return [(SearchResult *)self->_responseSearch mapItem];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (DirectionsWaypoint *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      MKMapPoint v5 = v4;
      unsigned int v6 = [(DirectionsWaypoint *)v5 pin];
      uint64_t v7 = [(DirectionsWaypoint *)self pin];
      double v8 = (void *)v7;
      if (v6 && v7)
      {
        unsigned __int8 v9 = [v6 isEqualToSearchResult:v7 forPurpose:1];
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v10 = [(DirectionsWaypoint *)v5 location];
      if (v10
        && (double v11 = (void *)v10,
            [(DirectionsWaypoint *)self location],
            double v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v12))
      {
        double v13 = [(DirectionsWaypoint *)v5 location];
        uint64_t v14 = [(DirectionsWaypoint *)self location];
      }
      else
      {
        uint64_t v17 = [(DirectionsWaypoint *)v5 requestSearchString];
        if (v17)
        {
          v18 = (void *)v17;
          id v19 = [(DirectionsWaypoint *)self requestSearchString];

          if (v19)
          {
            double v13 = [(DirectionsWaypoint *)v5 requestSearchString];
            id v15 = [(DirectionsWaypoint *)self requestSearchString];
            unsigned __int8 v16 = [v13 isEqualToString:v15];
            goto LABEL_18;
          }
        }
        uint64_t v20 = [(DirectionsWaypoint *)v5 externalURLQuery];
        if (v20)
        {
          v21 = (void *)v20;
          v22 = [(DirectionsWaypoint *)self externalURLQuery];

          if (v22)
          {
            double v13 = [(DirectionsWaypoint *)v5 externalURLQuery];
            id v15 = [(DirectionsWaypoint *)self externalURLQuery];
            unsigned __int8 v16 = [v13 isEqualToExternalURLQuery:v15];
            goto LABEL_18;
          }
        }
        uint64_t v24 = [(DirectionsWaypoint *)v5 requestAddress];
        if (!v24
          || (v25 = (void *)v24,
              [(DirectionsWaypoint *)self requestAddress],
              v26 = objc_claimAutoreleasedReturnValue(),
              v26,
              v25,
              !v26))
        {
          unsigned __int8 v9 = 0;
          goto LABEL_19;
        }
        double v13 = [(DirectionsWaypoint *)v5 requestAddress];
        uint64_t v14 = [(DirectionsWaypoint *)self requestAddress];
      }
      id v15 = (void *)v14;
      unsigned __int8 v16 = [v13 isEqual:v14];
LABEL_18:
      unsigned __int8 v9 = v16;

      goto LABEL_19;
    }
    unsigned __int8 v9 = 0;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(id)objc_opt_class() hash];
  double v4 = [(DirectionsWaypoint *)self location];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  CFStringRef v4 = @"YES";
  if ([(DirectionsWaypoint *)self isValid]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  if (![(DirectionsWaypoint *)self isDynamicCurrentLocation]) {
    CFStringRef v4 = @"NO";
  }
  unsigned int v6 = [(DirectionsWaypoint *)self location];
  uint64_t v7 = +[NSMutableString stringWithFormat:@"<%@: %p isValid=%@ isDynamicCurrentLocation=%@ location=%@", v3, self, v5, v4, v6];

  double v8 = [(DirectionsWaypoint *)self requestSearchString];

  if (v8)
  {
    unsigned __int8 v9 = [(DirectionsWaypoint *)self requestSearchString];
    [v7 appendFormat:@" requestSearchString=%@", v9];
  }
  uint64_t v10 = [(DirectionsWaypoint *)self requestSearch];

  if (v10)
  {
    double v11 = [(DirectionsWaypoint *)self requestSearch];
    [v7 appendFormat:@" requestSearch=%@", v11];
  }
  double v12 = [(DirectionsWaypoint *)self requestAddress];

  if (v12)
  {
    double v13 = [(DirectionsWaypoint *)self requestAddress];
    [v7 appendFormat:@" requestAddress=%@", v13];
  }
  uint64_t v14 = [(DirectionsWaypoint *)self suggestionsPrefix];

  if (v14)
  {
    id v15 = [(DirectionsWaypoint *)self suggestionsPrefix];
    [v7 appendFormat:@" suggestionsPrefix=%@", v15];
  }
  unsigned __int8 v16 = [(DirectionsWaypoint *)self responseSearch];

  if (v16)
  {
    uint64_t v17 = [(DirectionsWaypoint *)self responseSearch];
    [v7 appendFormat:@" responseSearch=%@", v17];
  }
  v18 = [(DirectionsWaypoint *)self completion];

  if (v18)
  {
    id v19 = [(DirectionsWaypoint *)self completion];
    [v7 appendFormat:@" completion=%@", v19];
  }
  uint64_t v20 = [(DirectionsWaypoint *)self mapItemIfLoaded];

  if (v20)
  {
    v21 = [(DirectionsWaypoint *)self mapItemIfLoaded];
    [v7 appendFormat:@" mapItemIfLoaded=%@", v21];
  }
  [v7 appendString:@">"];

  return v7;
}

- (NSString)requestSearchString
{
  return self->_requestSearchString;
}

- (void)setRequestSearchString:(id)a3
{
}

- (SearchResult)requestSearch
{
  return self->_requestSearch;
}

- (void)setRequestSearch:(id)a3
{
}

- (AddressBookAddress)requestAddress
{
  return self->_requestAddress;
}

- (void)setRequestAddress:(id)a3
{
}

- (NSString)suggestionsPrefix
{
  return self->_suggestionsPrefix;
}

- (void)setSuggestionsPrefix:(id)a3
{
}

- (SearchResult)responseSearch
{
  return self->_responseSearch;
}

- (MKLocalSearchCompletion)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (ExternalURLQuery)externalURLQuery
{
  return self->_externalURLQuery;
}

- (void)setExternalURLQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalURLQuery, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_responseSearch, 0);
  objc_storeStrong((id *)&self->_suggestionsPrefix, 0);
  objc_storeStrong((id *)&self->_requestAddress, 0);
  objc_storeStrong((id *)&self->_requestSearch, 0);

  objc_storeStrong((id *)&self->_requestSearchString, 0);
}

@end