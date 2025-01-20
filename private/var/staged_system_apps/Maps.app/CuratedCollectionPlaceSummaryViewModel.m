@interface CuratedCollectionPlaceSummaryViewModel
- (CuratedCollectionPlaceSummaryViewModel)initWithMapItem:(id)a3;
- (GEOLocation)currentLocation;
- (MKMapItem)mapItem;
- (NSAttributedString)hours;
- (NSString)category;
- (NSString)distance;
- (NSString)price;
- (NSString)title;
- (void)setCurrentLocation:(id)a3;
@end

@implementation CuratedCollectionPlaceSummaryViewModel

- (CuratedCollectionPlaceSummaryViewModel)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionPlaceSummaryViewModel;
  v6 = [(CuratedCollectionPlaceSummaryViewModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (NSString)title
{
  v2 = [(CuratedCollectionPlaceSummaryViewModel *)self mapItem];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)category
{
  v2 = [(CuratedCollectionPlaceSummaryViewModel *)self mapItem];
  v3 = [v2 _firstLocalizedCategoryName];

  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSString)distance
{
  char v12 = 0;
  v3 = [(CuratedCollectionPlaceSummaryViewModel *)self currentLocation];
  v4 = [(CuratedCollectionPlaceSummaryViewModel *)self mapItem];
  id v5 = +[NSString distanceStringFromLocation:v3 toMapItem:v4 showsDistance:&v12];

  if (!v12)
  {
    v6 = [(CuratedCollectionPlaceSummaryViewModel *)self mapItem];
    v7 = [v6 _geoMapItem];
    uint64_t v8 = [v7 _resultSnippetLocationString];

    id v5 = (void *)v8;
  }
  if ([v5 length]) {
    objc_super v9 = v5;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  return (NSString *)v10;
}

- (NSString)price
{
  v3 = [(CuratedCollectionPlaceSummaryViewModel *)self mapItem];
  unsigned __int8 v4 = [v3 _hasPriceDescription];
  id v5 = [(CuratedCollectionPlaceSummaryViewModel *)self mapItem];
  v6 = v5;
  if (v4) {
    [v5 _priceDescription];
  }
  else {
  v7 = [v5 _priceRangeString];
  }

  if ([v7 length]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = v8;

  return v9;
}

- (NSAttributedString)hours
{
  id v3 = objc_alloc((Class)_MKLocalizedHoursBuilder);
  unsigned __int8 v4 = [(CuratedCollectionPlaceSummaryViewModel *)self mapItem];
  id v5 = [v3 initWithMapItem:v4 localizedHoursStringOptions:128];

  v6 = [v5 localizedOperatingHours];
  id v7 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v6];
  uint64_t v8 = [v5 localizedOpenState];
  id v9 = [v6 rangeOfString:v8];
  uint64_t v11 = v10;

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    char v12 = [v5 localizedOpenState];
    if ([v6 rangeOfString:v12] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = +[UIColor secondaryLabelColor];
      [v5 updateHoursLabelColorWithDefaultLabelColor:v13];
    }
    NSAttributedStringKey v18 = NSForegroundColorAttributeName;
    v14 = [v5 hoursStateLabelColor];
    v19 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    [v7 setAttributes:v15 range:v9];
  }
  id v16 = [v7 copy];

  return (NSAttributedString *)v16;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end