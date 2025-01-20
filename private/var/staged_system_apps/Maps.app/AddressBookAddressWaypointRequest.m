@interface AddressBookAddressWaypointRequest
+ (id)_clientAttributesForAddress:(id)a3;
- (AddressBookAddress)address;
- (AddressBookAddressWaypointRequest)initWithAddress:(id)a3;
- (AddressBookAddressWaypointRequest)initWithAddress:(id)a3 mapItem:(id)a4;
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (CNContact)contact;
- (GEOMapItemClientAttributes)clientAttributes;
- (MKMapItem)mapItem;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)addressString;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)waypointName;
- (Result)cachedLoadResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
- (void)recordRAPInformation:(id)a3;
- (void)setCachedLoadResult:(id)a3;
@end

@implementation AddressBookAddressWaypointRequest

- (AddressBookAddressWaypointRequest)initWithAddress:(id)a3
{
  return [(AddressBookAddressWaypointRequest *)self initWithAddress:a3 mapItem:0];
}

- (AddressBookAddressWaypointRequest)initWithAddress:(id)a3 mapItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isValid])
  {
    v26.receiver = self;
    v26.super_class = (Class)AddressBookAddressWaypointRequest;
    v9 = [(AddressBookAddressWaypointRequest *)&v26 init];
    if (v9)
    {
      v10 = [v7 singleLineAddress];
      v11 = [(id)objc_opt_class() _clientAttributesForAddress:v7];
      v12 = [v7 contact];
      if (!v8)
      {
        id v13 = objc_alloc((Class)MKMapItem);
        v14 = [v7 addressDictionary];
        id v8 = [v13 initWithAddressDictionary:v14];
      }
      objc_storeStrong((id *)&v9->_address, a3);
      v15 = (NSString *)[v10 copy];
      addressString = v9->_addressString;
      v9->_addressString = v15;

      v17 = (GEOMapItemClientAttributes *)[v11 copy];
      clientAttributes = v9->_clientAttributes;
      v9->_clientAttributes = v17;

      contact = v9->_contact;
      v9->_contact = v12;
      v20 = v12;

      objc_storeStrong((id *)&v9->_mapItem, v8);
    }
    self = v9;
    v21 = self;
  }
  else
  {
    v22 = sub_100576F5C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138412546;
      v28 = v24;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Invalid %@ was passed in: %@", buf, 0x16u);
    }
    v21 = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(id)objc_opt_class() allocWithZone:a3] initWithAddress:self->_address mapItem:self->_mapItem];
  objc_storeStrong(v4 + 6, self->_cachedLoadResult);
  return v4;
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100092578;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(AddressBookAddressWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(AddressBookAddressWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100A2FF48;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(AddressBookAddressWaypointRequest *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(AddressBookAddressWaypointRequest *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  v4 = (void (**)(id, const __CFString *, NSString *))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"addressString", self->_addressString);
  (*v4)(v6, @"clientAttributes", (NSString *)self->_clientAttributes);
  (*v4)(v6, @"contact", (NSString *)&self->_contact->super.isa);
  (*v4)(v6, @"mapItem", (NSString *)&self->_mapItem->super.isa);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = kCLLocationCoordinate2DInvalid.latitude;
  double longitude = kCLLocationCoordinate2DInvalid.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (BOOL)hasCachedResult
{
  return self->_cachedLoadResult != 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return self->_mapItem;
}

- (id)waypointIconWithScale:(double)a3
{
  v4 = [(AddressBookAddressWaypointRequest *)self address];
  v5 = [v4 thumbnailIconWithScale:2 size:a3];

  return v5;
}

- (NSString)waypointName
{
  uint64_t v3 = [(AddressBookAddressWaypointRequest *)self contact];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(AddressBookAddressWaypointRequest *)self address];

    if (v5)
    {
      id v6 = [(AddressBookAddressWaypointRequest *)self address];
      id v7 = [v6 waypointCompositeName];
LABEL_6:
      v9 = v7;
      goto LABEL_8;
    }
  }
  id v8 = [(MKMapItem *)self->_mapItem name];
  if (v8)
  {
    id v7 = v8;
    id v6 = v7;
    goto LABEL_6;
  }
  v9 = MKLocalizedStringForUnknownLocation();
  id v6 = 0;
LABEL_8:

  return (NSString *)v9;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(AddressBookAddressWaypointRequest *)self addressString];
    id v7 = [v5 addressString];

    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void *))a5;
  id v13 = a6;
  v14 = [(AddressBookAddressWaypointRequest *)self cachedLoadResult];

  if (v14)
  {
    uint64_t v15 = [(AddressBookAddressWaypointRequest *)self cachedLoadResult];
    v12[2](v12, v15);

    v16 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100A2FB4C;
    v25[3] = &unk_101314D48;
    objc_copyWeak(&v27, &location);
    objc_super v26 = v12;
    v17 = objc_retainBlock(v25);
    id v18 = [(AddressBookAddressWaypointRequest *)self addressString];
    v19 = [(AddressBookAddressWaypointRequest *)self clientAttributes];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100A2FBC0;
    v22[3] = &unk_101314D70;
    objc_copyWeak(&v24, &location);
    v20 = v17;
    id v23 = v20;
    v16 = +[GEOComposedWaypoint composedWaypointForAddressString:v18 traits:v10 clientAttributes:v19 completionHandler:v22 networkActivityHandler:v13];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)recordRAPInformation:(id)a3
{
  addressString = self->_addressString;
  id v4 = a3;
  [v4 setSingleLineAddressString:addressString];
  [v4 setOrigin:1];
}

+ (id)_clientAttributesForAddress:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)GEOMapItemAddressBookAttributes);
  id v5 = [v3 compositeName];
  [v4 setName:v5];

  id v6 = [v3 spokenNameForNavigation];
  if ([v6 length]) {
    [v4 setSpokenName:v6];
  }
  [v4 setAddressType:[v3 addressType]];
  [v4 setIsMe:[v3 isMeCard]];
  id v7 = [v3 addressValue];
  unsigned __int8 v8 = [v7 identifier];
  [v4 setAddressIdentifier:v8];

  v9 = [v3 contact];
  id v10 = [v9 identifier];
  [v4 setContactIdentifier:v10];

  id v11 = objc_alloc_init((Class)GEOMapItemClientAttributes);
  [v11 setAddressBookAttributes:v4];

  return v11;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (CNContact)contact
{
  return self->_contact;
}

- (GEOMapItemClientAttributes)clientAttributes
{
  return self->_clientAttributes;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (Result)cachedLoadResult
{
  return self->_cachedLoadResult;
}

- (void)setCachedLoadResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLoadResult, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end