@interface PLRevGeoMapItem
+ (BOOL)supportsSecureCoding;
+ (id)mapItemWithGEOMapItem:(id)a3;
+ (id)placeInfoWithName:(id)a3 geoPlaceInfo:(id)a4 dominantOrderType:(unint64_t)a5;
+ (id)sortedAdditionalPlaceInfoComparator;
- (BOOL)isEqual:(id)a3;
- (NSArray)backupPlaceInfos;
- (NSArray)finalPlaceInfos;
- (NSArray)sortedPlaceInfos;
- (PLRevGeoMapItem)initWithCoder:(id)a3;
- (PLRevGeoMapItem)initWithSortedPlaceInfos:(id)a3 backupPlaceInfos:(id)a4 finalPlaceInfos:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLRevGeoMapItem

+ (id)mapItemWithGEOMapItem:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 _asPlaceInfo];
  v5 = [v3 _additionalPlaceInfos];
  v6 = [v3 geoAddress];
  v7 = [v6 structuredAddress];

  v8 = [MEMORY[0x1E4F1CA48] array];
  v52 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v51 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 count])
  {
    id v50 = v3;
    [v4 name];
    v10 = v9 = v5;
    v49 = v4;
    v11 = +[PLRevGeoMapItem placeInfoWithName:v10 geoPlaceInfo:v4 dominantOrderType:0];
    [v8 addObject:v11];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v48 = v9;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v18 = [v17 name];
          v19 = +[PLRevGeoMapItem placeInfoWithName:v18 geoPlaceInfo:v17 dominantOrderType:0];
          [v8 addObject:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v14);
    }

    v20 = +[PLRevGeoMapItem sortedAdditionalPlaceInfoComparator];
    [v8 sortUsingComparator:v20];

    v4 = v49;
    id v3 = v50;
    v5 = v48;
    v22 = (void *)v51;
    v21 = v52;
  }
  else
  {
    uint64_t v23 = [v7 areaOfInterestsCount];
    v21 = v52;
    if (v23)
    {
      uint64_t v24 = v23;
      int v25 = [v3 _placeType];
      if (v24 != 1 || v25 != 11)
      {
        v26 = [v7 areaOfInterestAtIndex:0];
        v27 = +[PLRevGeoMapItem placeInfoWithName:v26 geoPlaceInfo:v4 dominantOrderType:1];

        [v52 addObject:v27];
      }
    }
    if ([v7 hasSubLocality])
    {
      v28 = [v7 subLocality];
      v29 = +[PLRevGeoMapItem placeInfoWithName:v28 geoPlaceInfo:v4 dominantOrderType:3];

      [v52 addObject:v29];
    }
    v22 = (void *)v51;
    if ([v7 hasLocality])
    {
      v30 = [v7 locality];
      v31 = +[PLRevGeoMapItem placeInfoWithName:v30 geoPlaceInfo:v4 dominantOrderType:5];

      [v52 addObject:v31];
    }
    if ([v7 hasSubAdministrativeArea])
    {
      v32 = [v7 subAdministrativeArea];
      v33 = +[PLRevGeoMapItem placeInfoWithName:v32 geoPlaceInfo:v4 dominantOrderType:7];

      [v52 addObject:v33];
    }
    if ([v7 hasAdministrativeArea])
    {
      v34 = [v7 administrativeArea];
      v35 = +[PLRevGeoMapItem placeInfoWithName:v34 geoPlaceInfo:v4 dominantOrderType:10];

      [v52 addObject:v35];
    }
    if ([v7 hasCountry])
    {
      v36 = [v7 country];
      v37 = +[PLRevGeoMapItem placeInfoWithName:v36 geoPlaceInfo:v4 dominantOrderType:12];

      [v52 addObject:v37];
    }
  }
  if ([v7 hasThoroughfare])
  {
    v38 = [v7 thoroughfare];
    v39 = +[PLRevGeoMapItem placeInfoWithName:v38 geoPlaceInfo:v4 dominantOrderType:2];

    [v22 addObject:v39];
  }
  if ([v7 hasAdministrativeAreaCode])
  {
    v40 = [v7 administrativeAreaCode];
    v41 = +[PLRevGeoMapItem placeInfoWithName:v40 geoPlaceInfo:v4 dominantOrderType:11];

    [v22 addObject:v41];
  }
  if ([v7 hasCountryCode])
  {
    v42 = [v7 countryCode];
    v43 = +[PLRevGeoMapItem placeInfoWithName:v42 geoPlaceInfo:v4 dominantOrderType:13];

    [v22 addObject:v43];
  }
  v44 = [[PLRevGeoMapItem alloc] initWithSortedPlaceInfos:v8 backupPlaceInfos:v21 finalPlaceInfos:v22];
  v45 = v22;
  v46 = v44;

  return v46;
}

+ (id)sortedAdditionalPlaceInfoComparator
{
  return &__block_literal_global_28520;
}

uint64_t __67__PLRevGeoMapItem_GEOServices__sortedAdditionalPlaceInfoComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 placeType];
  int v7 = [v6 intValue];

  v8 = [v5 placeType];
  int v9 = [v8 intValue];

  if (v7 == 7 || v9 != 7)
  {
    if (v7 != 7 || v9 == 7)
    {
      [v4 areaInSquareMeters];
      double v12 = v11;
      [v5 areaInSquareMeters];
      if (v9 != 9 || v13 != 0.0 || (uint64_t v10 = -1, v7 == 9) && v12 == 0.0)
      {
        if (v7 != 9 || v12 != 0.0 || (uint64_t v10 = 1, v9 == 9) && v13 == 0.0)
        {
          uint64_t v14 = -1;
          if (v12 >= v13) {
            uint64_t v14 = 1;
          }
          if (v12 == v13) {
            uint64_t v10 = 0;
          }
          else {
            uint64_t v10 = v14;
          }
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

+ (id)placeInfoWithName:(id)a3 geoPlaceInfo:(id)a4 dominantOrderType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [PLRevGeoMapItemAdditionalPlaceInfo alloc];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "placeType"));
  [v7 areaInMeters];
  double v12 = v11;

  double v13 = [(PLRevGeoMapItemAdditionalPlaceInfo *)v9 initWithName:v8 placeType:v10 dominantOrderType:a5 areaInSquareMeters:v12];
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPlaceInfos, 0);
  objc_storeStrong((id *)&self->_backupPlaceInfos, 0);
  objc_storeStrong((id *)&self->_sortedPlaceInfos, 0);
}

- (NSArray)finalPlaceInfos
{
  return self->_finalPlaceInfos;
}

- (NSArray)backupPlaceInfos
{
  return self->_backupPlaceInfos;
}

- (NSArray)sortedPlaceInfos
{
  return self->_sortedPlaceInfos;
}

- (PLRevGeoMapItem)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"sortedPlaceInfos"];
  int v9 = [v5 decodeObjectOfClasses:v7 forKey:@"backupPlaceInfos"];
  uint64_t v10 = [v5 decodeObjectOfClasses:v7 forKey:@"finalPlaceInfos"];

  double v11 = [(PLRevGeoMapItem *)self initWithSortedPlaceInfos:v8 backupPlaceInfos:v9 finalPlaceInfos:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  sortedPlaceInfos = self->_sortedPlaceInfos;
  id v5 = a3;
  [v5 encodeObject:sortedPlaceInfos forKey:@"sortedPlaceInfos"];
  [v5 encodeObject:self->_backupPlaceInfos forKey:@"backupPlaceInfos"];
  [v5 encodeObject:self->_finalPlaceInfos forKey:@"finalPlaceInfos"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLRevGeoMapItem *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = v4;
      sortedPlaceInfos = self->_sortedPlaceInfos;
      int v9 = [(PLRevGeoMapItem *)v7 sortedPlaceInfos];
      LODWORD(sortedPlaceInfos) = [(NSArray *)sortedPlaceInfos isEqualToArray:v9];

      if (sortedPlaceInfos
        && (backupPlaceInfos = self->_backupPlaceInfos,
            [(PLRevGeoMapItem *)v7 backupPlaceInfos],
            double v11 = objc_claimAutoreleasedReturnValue(),
            LODWORD(backupPlaceInfos) = [(NSArray *)backupPlaceInfos isEqualToArray:v11],
            v11,
            backupPlaceInfos))
      {
        finalPlaceInfos = self->_finalPlaceInfos;
        double v13 = [(PLRevGeoMapItem *)v7 finalPlaceInfos];
        char v6 = [(NSArray *)finalPlaceInfos isEqualToArray:v13];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"<%@ %p sortedPlaceInfos=%@ backupPlaceInfos=%@ finalPlaceInfos=%@>", v5, self, self->_sortedPlaceInfos, self->_backupPlaceInfos, self->_finalPlaceInfos];

  return v6;
}

- (PLRevGeoMapItem)initWithSortedPlaceInfos:(id)a3 backupPlaceInfos:(id)a4 finalPlaceInfos:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLRevGeoMapItem;
  double v12 = [(PLRevGeoMapItem *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sortedPlaceInfos, a3);
    objc_storeStrong((id *)&v13->_backupPlaceInfos, a4);
    objc_storeStrong((id *)&v13->_finalPlaceInfos, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end