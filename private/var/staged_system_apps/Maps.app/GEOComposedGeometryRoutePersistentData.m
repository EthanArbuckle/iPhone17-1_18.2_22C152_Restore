@interface GEOComposedGeometryRoutePersistentData
- (MapDataSubscriptionInfo)_maps_existingOfflineSubscription;
- (id)addressString;
- (id)addressStringWithAttributes:(id)a3;
- (id)distanceAndElevationDescriptionStringWithAttributes:(id)a3;
- (id)distanceAndElevationString;
- (id)distanceStringWithAttributes:(id)a3;
- (id)titleString;
- (void)prepareForSaving;
@end

@implementation GEOComposedGeometryRoutePersistentData

- (MapDataSubscriptionInfo)_maps_existingOfflineSubscription
{
  v2 = [(GEOComposedGeometryRoutePersistentData *)self boundingMapRegion];
  v3 = +[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:v2];

  if (v3)
  {
    v4 = +[MapsOfflineUIHelper sharedHelper];
    v5 = [v4 subscriptionInfoForRegion:v3];
  }
  else
  {
    v5 = 0;
  }

  return (MapDataSubscriptionInfo *)v5;
}

- (void)prepareForSaving
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(GEOComposedGeometryRoutePersistentData *)self anchorPoints];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 isCurrentLocation]) {
          [v7 setIsCurrentLocation:0];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)titleString
{
  id v3 = [(GEOComposedGeometryRoutePersistentData *)self userProvidedName];
  if ([v3 length])
  {
    id v4 = [(GEOComposedGeometryRoutePersistentData *)self userProvidedName];
  }
  else
  {
    uint64_t v5 = [(GEOComposedGeometryRoutePersistentData *)self routeName];
    v6 = (void *)v5;
    v7 = &stru_101324E70;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    id v4 = v7;
  }

  return v4;
}

- (id)addressString
{
  if ([(GEOComposedGeometryRoutePersistentData *)self isAvailableForCurrentCountry])
  {
    id v3 = [(GEOComposedGeometryRoutePersistentData *)self address];
    id v4 = [v3 cityAndAboveNoCurrentCountryWithFallback:1];
    uint64_t v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v7 = [(GEOComposedGeometryRoutePersistentData *)self address];
      uint64_t v8 = [v7 name];
      long long v9 = (void *)v8;
      long long v10 = &stru_101324E70;
      if (v8) {
        long long v10 = (__CFString *)v8;
      }
      v6 = v10;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)distanceAndElevationString
{
  [(GEOComposedGeometryRoutePersistentData *)self distance];
  id v3 = [(GEOComposedGeometryRoutePersistentData *)self elevationProfile];
  id v4 = sub_100A45B1C(v3);

  return v4;
}

- (id)addressStringWithAttributes:(id)a3
{
  id v4 = a3;
  if ([(GEOComposedGeometryRoutePersistentData *)self isAvailableForCurrentCountry])
  {
    id v5 = [(GEOComposedGeometryRoutePersistentData *)self address];
    if (v5)
    {
      id v6 = v4;
      v7 = [v5 cityAndAboveNoCurrentCountryWithFallback:1];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [v5 name];
      }
      long long v11 = v9;

      id v10 = [objc_alloc((Class)NSAttributedString) initWithString:v11 attributes:v6];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)distanceAndElevationDescriptionStringWithAttributes:(id)a3
{
  id v4 = a3;
  [(GEOComposedGeometryRoutePersistentData *)self distance];
  id v5 = [(GEOComposedGeometryRoutePersistentData *)self elevationProfile];
  id v6 = v4;
  v7 = [v6 objectForKeyedSubscript:NSForegroundColorAttributeName];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[UIColor secondaryLabelColor];
  }
  id v10 = v9;

  long long v11 = objc_opt_new();
  v12 = +[UIImage _systemImageNamed:@"base.unit"];
  v28 = v10;
  v13 = [v12 imageWithTintColor:v10];
  [v11 setImage:v13];

  v29 = +[NSAttributedString attributedStringWithAttachment:v11 attributes:v6];
  v14 = GEOStringForDistance();
  id v15 = [objc_alloc((Class)NSAttributedString) initWithString:v14];
  if ([v5 isValid])
  {
    v16 = sub_100A454D0(v5, v6);
    v17 = +[UIApplication sharedApplication];
    id v18 = [v17 userInterfaceLayoutDirection];

    id v19 = objc_alloc((Class)NSAttributedString);
    if (v18 == (id)1)
    {
      id v20 = [v19 initWithString:@"%@ • %@ %@" attributes:v6];
      +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v20, v16, v15, v29);
    }
    else
    {
      id v20 = [v19 initWithString:@"%@ %@ • %@" attributes:v6];
      +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v20, v29, v15, v16);
    }
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    id v30 = v21;
    v24 = +[NSArray arrayWithObjects:&v30 count:1];
    v25 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v24 repeatedSeparator:0];
    v26 = v28;
  }
  else
  {
    id v21 = [objc_alloc((Class)NSAttributedString) initWithString:@"%@ %@" attributes:v6];
    v22 = +[UIApplication sharedApplication];
    id v23 = [v22 userInterfaceLayoutDirection];

    if (v23 == (id)1) {
      +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v21, v15, v29);
    }
    else {
    v16 = +[NSAttributedString localizedAttributedStringWithFormat:](NSAttributedString, "localizedAttributedStringWithFormat:", v21, v29, v15);
    }
    v26 = v28;
    id v30 = v16;
    v24 = +[NSArray arrayWithObjects:&v30 count:1];
    v25 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v24 repeatedSeparator:0];
  }

  return v25;
}

- (id)distanceStringWithAttributes:(id)a3
{
  id v4 = a3;
  [(GEOComposedGeometryRoutePersistentData *)self distance];
  id v5 = sub_100A45784(v4);

  return v5;
}

@end