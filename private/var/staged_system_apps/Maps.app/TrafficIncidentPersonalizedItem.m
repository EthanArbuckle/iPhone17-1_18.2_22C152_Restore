@interface TrafficIncidentPersonalizedItem
- (AddressBookAddress)address;
- (BOOL)mustRefineMapItem;
- (BOOL)shouldBeClustered;
- (BOOL)shouldBeHiddenFromMap;
- (BOOL)showsBalloonCallout;
- (CLLocationCoordinate2D)coordinate;
- (GEOEnhancedPlacement)enhancedPlacement;
- (GEOLabelGeometry)labelGeometry;
- (MKMapItem)mapItem;
- (NSArray)searchableStrings;
- (NSDate)eventDate;
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
- (TrafficIncidentPersonalizedItem)initWithIncidentReport:(id)a3;
- (TrafficIncidentReport)incidentReport;
- (VKLabelMarker)sourceLabelMarker;
- (unint64_t)priority;
- (unint64_t)sortOrder;
- (void)setSource:(id)a3;
@end

@implementation TrafficIncidentPersonalizedItem

- (TrafficIncidentPersonalizedItem)initWithIncidentReport:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TrafficIncidentPersonalizedItem;
  v6 = [(TrafficIncidentPersonalizedItem *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_report, a3);
    id v8 = objc_alloc((Class)MKPlacemark);
    v9 = [v5 mapItemLocation];
    v10 = [v9 latLng];
    [v10 lat];
    CLLocationDegrees v12 = v11;
    v13 = [v5 mapItemLocation];
    v14 = [v13 latLng];
    [v14 lng];
    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v12, v15);
    id v17 = [v8 initWithCoordinate:v16.latitude, v16.longitude];

    v18 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithPlacemark:v17];
    mapItem = v7->_mapItem;
    v7->_mapItem = v18;

    v20 = [v5 mapItemLocation];
    v21 = [v20 latLng];
    [v21 lat];
    CLLocationDegrees v23 = v22;
    v24 = [v5 mapItemLocation];
    v25 = [v24 latLng];
    [v25 lng];
    v7->_coordinate = CLLocationCoordinate2DMake(v23, v26);
  }
  return v7;
}

- (unint64_t)priority
{
  return 0;
}

- (NSSet)keys
{
  v2 = [(TrafficIncidentReport *)self->_report uniqueID];
  v3 = +[NSSet setWithObject:v2];

  return (NSSet *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)title
{
  v2 = +[TrafficIncidentLayoutItem defaultDisplayTextForType:[(TrafficIncidentReport *)self->_report incidentType]];
  v3 = +[PersonalizedItemPrioritizedStringAdornment adornmentWithString:v2 priority:1];

  return (PersonalizedItemPrioritizedStringAdornment *)v3;
}

- (PersonalizedItemPrioritizedStringAdornment)prefix
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemPrioritizedStringAdornment)subtitle
{
  return (PersonalizedItemPrioritizedStringAdornment *)+[PersonalizedItemPrioritizedStringAdornment defaultAdornment];
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  v2 = +[TrafficIncidentLayoutItem styleAttributesForType:[(TrafficIncidentReport *)self->_report incidentType]];
  v6 = &off_1013A8C38;
  v7 = &off_1013A8C50;
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v4 = +[PersonalizedItemStyleAttributesAdornment adornmentWithStyleAttributes:v2 additionalAttributes:v3];

  return (PersonalizedItemStyleAttributesAdornment *)v4;
}

- (PersonalizedItemClientFeatureIDAdornment)clientFeatureID
{
  v3 = [(TrafficIncidentPersonalizedItem *)self styleAttributes];
  v4 = [v3 styleAttributes];
  uint64_t v5 = (int)[v4 poiType];
  [(MKMapItem *)self->_mapItem _coordinate];
  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  unint64_t v11 = v10 + (unint64_t)v9;
  double v12 = fabs(v9);
  if (v9 <= 0.0) {
    unint64_t v11 = v10;
  }
  unint64_t v13 = v10 - (unint64_t)v12;
  if (v9 >= 0.0) {
    unint64_t v13 = v11;
  }
  unint64_t v14 = v13 ^ v5;
  [(MKMapItem *)self->_mapItem _coordinate];
  if (v15 < 0.0) {
    double v15 = -v15;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  double v18 = fmod(v16, 1.84467441e19);
  unint64_t v19 = 2654435761u * (unint64_t)v18;
  unint64_t v20 = v19 + (unint64_t)v17;
  if (v17 <= 0.0) {
    unint64_t v20 = 2654435761u * (unint64_t)v18;
  }
  unint64_t v21 = v19 - (unint64_t)fabs(v17);
  if (v17 >= 0.0) {
    unint64_t v21 = v20;
  }
  unint64_t v22 = v14 ^ v21;

  CLLocationDegrees v23 = [(MKMapItem *)self->_mapItem _geoMapItem];
  v24 = [v23 name];

  if (v24)
  {
    v25 = [(MKMapItem *)self->_mapItem _geoMapItem];
    CLLocationDegrees v26 = [v25 name];
    v22 ^= (unint64_t)[v26 hash];
  }

  return +[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:v22];
}

- (GEOEnhancedPlacement)enhancedPlacement
{
  v2 = [(TrafficIncidentPersonalizedItem *)self mapItem];
  v3 = [v2 _enhancedPlacement];

  return (GEOEnhancedPlacement *)v3;
}

- (GEOLabelGeometry)labelGeometry
{
  v2 = [(TrafficIncidentPersonalizedItem *)self mapItem];
  v3 = [v2 _labelGeometry];

  return (GEOLabelGeometry *)v3;
}

- (unint64_t)sortOrder
{
  return 0;
}

- (BOOL)shouldBeClustered
{
  return 0;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (TrafficIncidentReport)incidentReport
{
  return self->_report;
}

- (BOOL)shouldBeHiddenFromMap
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

- (BOOL)mustRefineMapItem
{
  return 0;
}

- (NSDate)eventDate
{
  return 0;
}

- (AddressBookAddress)address
{
  return 0;
}

- (NSArray)searchableStrings
{
  return (NSArray *)&__NSArray0__struct;
}

- (SearchDotPlace)searchDotPlace
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<TrafficIncidentPersonalizedItem %p: %@>", self, self->_report];
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (PersonalizedItemSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (PersonalizedItemSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end