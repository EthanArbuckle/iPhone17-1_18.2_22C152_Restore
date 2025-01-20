@interface DirectionsWorkHistoryItem
- (AddressBookAddress)workAddress;
- (DirectionsWorkHistoryItem)init;
- (SearchResult)currentLocation;
- (double)timestamp;
- (id)entryWithTicket:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)updateModel:(id)a3;
@end

@implementation DirectionsWorkHistoryItem

- (DirectionsWorkHistoryItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)DirectionsWorkHistoryItem;
  v2 = [(DirectionsWorkHistoryItem *)&v5 init];
  if (v2)
  {
    v3 = +[SearchResult currentLocationSearchResult];
    [(DirectionsWorkHistoryItem *)v2 setCurrentLocation:v3];
  }
  return v2;
}

- (AddressBookAddress)workAddress
{
  v2 = +[AddressBookManager sharedManager];
  v3 = [v2 meCardWorkAddress];

  return (AddressBookAddress *)v3;
}

- (double)timestamp
{
  return 0.0;
}

- (SearchResult)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateModel:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Work [Address Book label]" value:@"localized string not found" table:0];
  [v4 setFirstLine:v6];

  v7 = [(DirectionsWorkHistoryItem *)self workAddress];
  v8 = [v7 singleLineAddress];
  [v4 setSecondLine:v8];

  v9 = [(DirectionsWorkHistoryItem *)self workAddress];
  v10 = [v9 geocodedMapItem];
  [v4 setMapItem:v10];

  v11 = [v4 mapItem];
  if (v11)
  {
  }
  else
  {
    v12 = [(DirectionsWorkHistoryItem *)self workAddress];
    v13 = [v12 geocodingError];

    if (!v13)
    {
      v14 = [(DirectionsWorkHistoryItem *)self workAddress];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1005E2690;
      v15[3] = &unk_1012E8738;
      id v16 = v4;
      [v14 forwardGeocodeAddress:v15];
    }
  }
  [v4 setDebugSubtitle:@"[Work]"];
}

- (id)entryWithTicket:(id)a3
{
  id v4 = [objc_alloc((Class)GEORPSuggestionEntry) initWithType:4];
  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Work [Address Book label]" value:@"localized string not found" table:0];
  [v4 safeAddDisplayLine:v6];

  v7 = [(DirectionsWorkHistoryItem *)self currentLocation];
  v8 = [v7 mapItem];
  v9 = [v8 name];
  [v4 safeAddDisplayLine:v9];

  return v4;
}

@end