@interface STMapItem
+ (BOOL)supportsSecureCoding;
- (Class)_aceCollectionClass;
- (STMapItem)initWithCoder:(id)a3;
- (STMapItem)initWithMKMapItem:(id)a3;
- (id)_aceContextObjectValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMapItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearchProviderID, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STMapItem;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"_title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_location forKey:@"_location"];
  [v4 encodeObject:self->_placeData forKey:@"_placeData"];
  [v4 encodeBool:self->_isCurrentLocation forKey:@"_isCurrentLocation"];
  [v4 encodeObject:self->_businessID forKey:@"_businessID"];
  [v4 encodeObject:self->_localSearchProviderID forKey:@"_localSearchProviderID"];
}

- (STMapItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STMapItem;
  objc_super v5 = [(STSiriModelObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_placeData"];
    placeData = v5->_placeData;
    v5->_placeData = (NSData *)v10;

    v5->_isCurrentLocation = [v4 decodeBoolForKey:@"_isCurrentLocation"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_businessID"];
    businessID = v5->_businessID;
    v5->_businessID = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localSearchProviderID"];
    localSearchProviderID = v5->_localSearchProviderID;
    v5->_localSearchProviderID = (NSNumber *)v14;
  }
  return v5;
}

- (Class)_aceCollectionClass
{
  return (Class)objc_opt_class();
}

- (id)_aceContextObjectValue
{
  id v3 = objc_alloc_init(MEMORY[0x263F64A88]);
  id v4 = objc_alloc_init(MEMORY[0x263F64AD0]);
  objc_super v5 = NSNumber;
  [(CLLocation *)self->_location coordinate];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setLatitude:v6];

  v7 = NSNumber;
  [(CLLocation *)self->_location coordinate];
  v9 = [v7 numberWithDouble:v8];
  [v4 setLongitude:v9];

  [v3 setLocation:v4];
  [v3 setLabel:self->_title];
  [v3 setPlaceData2:self->_placeData];
  [v3 setLocalSearchProviderId:self->_localSearchProviderID];
  if (self->_isCurrentLocation)
  {
    [v3 setDetailType:*MEMORY[0x263F65998]];
  }
  else if (self->_businessID)
  {
    [v3 setDetailType:*MEMORY[0x263F65990]];
    id v10 = objc_alloc_init(MEMORY[0x263F64A68]);
    if (self->_businessID)
    {
      v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"urn:places:%lld", -[NSNumber unsignedLongLongValue](self->_businessID, "unsignedLongLongValue"));
      uint64_t v12 = (void *)[objc_alloc(NSURL) initWithString:v11];
      [v10 setIdentifier:v12];
    }
    [v3 setDetail:v10];
  }
  return v3;
}

- (STMapItem)initWithMKMapItem:(id)a3
{
  id v4 = a3;
  if (initWithMKMapItem__onceToken != -1) {
    dispatch_once(&initWithMKMapItem__onceToken, &__block_literal_global);
  }
  v21.receiver = self;
  v21.super_class = (Class)STMapItem;
  objc_super v5 = [(STMapItem *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = [v4 placemark];
    id v10 = [v9 location];
    uint64_t v11 = [v10 copy];
    location = v5->_location;
    v5->_location = (CLLocation *)v11;

    uint64_t v13 = [v4 _placeDataAsData];
    placeData = v5->_placeData;
    v5->_placeData = (NSData *)v13;

    v5->_isCurrentLocation = [v4 isCurrentLocation];
    if ([v4 _hasMUID])
    {
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "_muid"));
      businessID = v5->_businessID;
      v5->_businessID = (NSNumber *)v15;
    }
    objc_super v17 = [v4 _geoMapItem];
    if ([v17 _hasResultProviderID])
    {
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "_resultProviderID"));
      localSearchProviderID = v5->_localSearchProviderID;
      v5->_localSearchProviderID = (NSNumber *)v18;
    }
  }

  return v5;
}

id __31__STMapItem_initWithMKMapItem___block_invoke()
{
  if (initMKMapItem_sOnce != -1) {
    dispatch_once(&initMKMapItem_sOnce, &__block_literal_global_55);
  }
  v0 = (void *)classMKMapItem;
  return v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end