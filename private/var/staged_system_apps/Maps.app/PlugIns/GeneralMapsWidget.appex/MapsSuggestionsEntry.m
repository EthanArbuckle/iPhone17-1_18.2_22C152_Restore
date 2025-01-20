@interface MapsSuggestionsEntry
- (GEOFeatureStyleAttributes)styleAttributes;
- (MKMapItem)MKMapItem;
- (NSArray)waypoints;
- (NSString)poiTitle;
- (UIImage)icon;
- (void)setIcon:(id)a3;
@end

@implementation MapsSuggestionsEntry

- (MKMapItem)MKMapItem
{
  v3 = [(MapsSuggestionsEntry *)self geoMapItem];

  if (v3)
  {
    v4 = objc_getAssociatedObject(self, &unk_100088098);
    v5 = objc_getAssociatedObject(self, &unk_100088099);
    if (v4
      && ([(MapsSuggestionsEntry *)self geoMapItem],
          v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isEqual:v5],
          v6,
          v7))
    {
      id v8 = v4;
    }
    else
    {
      v9 = [(MapsSuggestionsEntry *)self geoMapItem];
      if ([(MapsSuggestionsEntry *)self isShortcut])
      {
        id v10 = [v9 copy];

        id v11 = objc_alloc_init((Class)GEOMapItemStorageUserValues);
        [v10 setUserValues:v11];

        v12 = [(MapsSuggestionsEntry *)self undecoratedTitle];
        v13 = [v10 userValues];
        [v13 setName:v12];

        v9 = v10;
      }
      id v14 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v9 isPlaceHolderPlace:0];

      objc_setAssociatedObject(self, &unk_100088098, v14, (void *)0x301);
      objc_setAssociatedObject(self, &unk_100088099, v9, (void *)0x301);
      id v8 = v14;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (MKMapItem *)v8;
}

- (UIImage)icon
{
  v3 = [(MapsSuggestionsEntry *)self iconData];

  if (v3)
  {
    v4 = objc_getAssociatedObject(self, &unk_10008809A);
    v5 = objc_getAssociatedObject(self, &unk_10008809B);
    if (!v4
      || ([(MapsSuggestionsEntry *)self iconData],
          v6 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v7 = [v6 isEqual:v5],
          v6,
          (v7 & 1) == 0))
    {
      id v8 = [(MapsSuggestionsEntry *)self iconData];
      v9 = +[UIImage imageWithData:v8];

      objc_setAssociatedObject(self, &unk_10008809A, v9, (void *)0x301);
      id v10 = [(MapsSuggestionsEntry *)self iconData];
      objc_setAssociatedObject(self, &unk_10008809B, v10, (void *)0x301);

      v4 = v9;
    }
    id v11 = v4;
  }
  else
  {
    id v11 = 0;
  }

  return (UIImage *)v11;
}

- (void)setIcon:(id)a3
{
  image = (UIImage *)a3;
  v4 = objc_getAssociatedObject(self, &unk_10008809A);
  if (image)
  {
    if (([(UIImage *)image isEqual:v4] & 1) == 0)
    {
      v5 = UIImagePNGRepresentation(image);
      [(MapsSuggestionsEntry *)self setIconData:v5];

      objc_setAssociatedObject(self, &unk_10008809A, image, (void *)0x301);
      v6 = [(MapsSuggestionsEntry *)self iconData];
      objc_setAssociatedObject(self, &unk_10008809B, v6, (void *)0x301);
    }
  }
  else if (v4)
  {
    objc_setAssociatedObject(self, &unk_10008809A, 0, (void *)0x301);
    objc_setAssociatedObject(self, &unk_10008809B, 0, (void *)0x301);
    [(MapsSuggestionsEntry *)self setIconData:0];
  }
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  unint64_t v3 = (unint64_t)[(MapsSuggestionsEntry *)self type];
  if (v3 > 0x18) {
    goto LABEL_8;
  }
  if (((1 << v3) & 0x8018E) == 0)
  {
    if (v3 == 24)
    {
      unsigned __int8 v7 = +[GEOFeatureStyleAttributes sharedLocationStyleAttributes];
      if (v7) {
        goto LABEL_24;
      }
      goto LABEL_3;
    }
LABEL_8:
    v9 = [(MapsSuggestionsEntry *)self MKMapItem];
    unsigned __int8 v7 = [v9 _styleAttributes];

    if (v7) {
      goto LABEL_24;
    }
  }
LABEL_3:
  id v4 = [(MapsSuggestionsEntry *)self type];
  id v5 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
  v6 = v5;
  unsigned __int8 v7 = 0;
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xBuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes markerStyleAttributes];
      goto LABEL_22;
    case 1uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes homeStyleAttributes];
      goto LABEL_22;
    case 2uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes workStyleAttributes];
      goto LABEL_22;
    case 3uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes calendarEventStyleAttributes];
      goto LABEL_22;
    case 7uLL:
    case 0xAuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
      goto LABEL_22;
    case 8uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes restaurantStyleAttributes];
      goto LABEL_22;
    case 0xDuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes hotelStyleAttributes];
      goto LABEL_22;
    case 0xEuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes carRentalStyleAttributes];
      goto LABEL_22;
    case 0xFuLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes airportStyleAttributes];
      goto LABEL_22;
    case 0x10uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes ticketedEventStyleAttributes];
      goto LABEL_22;
    case 0x13uLL:
      uint64_t v8 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
      goto LABEL_22;
    case 0x16uLL:
      if ([v5 isEqualToString:@"NearbyTransit"])
      {
        uint64_t v8 = +[GEOFeatureStyleAttributes nearbyTransitStyleAttributes];
LABEL_22:
        unsigned __int8 v7 = (void *)v8;
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
LABEL_23:

      break;
    default:
      goto LABEL_23;
  }
LABEL_24:

  return (GEOFeatureStyleAttributes *)v7;
}

- (NSString)poiTitle
{
  unint64_t v3 = (unint64_t)[(MapsSuggestionsEntry *)self type];
  if (v3 > 0x18)
  {
    id v5 = 0;
  }
  else
  {
    if (((1 << v3) & 0x7E96F7) != 0)
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self undecoratedTitle];
LABEL_4:
      id v5 = (void *)v4;
      goto LABEL_5;
    }
    if (((1 << v3) & 0x1816108) != 0
      && ([(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsEntryTitleNameKey"] & 1) != 0)
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
      goto LABEL_4;
    }
    unsigned __int8 v7 = [(MapsSuggestionsEntry *)self MKMapItem];
    id v5 = [v7 name];
  }
LABEL_5:

  return (NSString *)v5;
}

- (NSArray)waypoints
{
  v2 = self;
  if (self)
  {
    if ([(MapsSuggestionsEntry *)self type] == (id)11)
    {
      v2 = [v2 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
    }
    else
    {
      v2 = 0;
    }
  }
  unint64_t v3 = [v2 waypoints];

  return (NSArray *)v3;
}

@end