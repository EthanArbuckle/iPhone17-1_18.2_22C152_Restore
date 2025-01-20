@interface PLRevGeoLocationInfo
+ (BOOL)isInvalidWithCoder:(id)a3;
+ (BOOL)isInvalidWithPlistData:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_namingOrderForAssetDetailedReverseGeoDescription;
+ (id)_namingOrderForAssetReverseGeoDescription;
+ (id)_newRevGeoLocationInfoFromData:(id)a3;
+ (id)countryCodeWithGEOMapItem:(id)a3;
+ (id)infoFromPlistData:(id)a3;
+ (id)newDataFromRevGeoLocationInfo:(id)a3;
- (BOOL)hasLocation;
- (BOOL)hasMapItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHome;
- (BOOL)locationWasResolvedWithBestRevGeoProvider;
- (CNPostalAddress)postalAddress;
- (NSString)addressString;
- (NSString)countryCode;
- (NSString)geoServiceProvider;
- (PLRevGeoCompoundNameInfo)compoundNameInfo;
- (PLRevGeoCompoundNameInfo)compoundSecondaryNameInfo;
- (PLRevGeoLocationInfo)initWithCoder:(id)a3;
- (PLRevGeoLocationInfo)initWithGEOMapItem:(id)a3;
- (PLRevGeoLocationInfo)initWithMapItem:(id)a3 postalAddress:(id)a4 addressString:(id)a5 countryCode:(id)a6 compoundNameInfo:(id)a7 compoundSecondaryNameInfo:(id)a8 isHome:(BOOL)a9 geoServiceProvider:(id)a10;
- (PLRevGeoMapItem)mapItem;
- (id)description;
- (id)localizedDescription;
- (id)placeNamesForLocalizedDetailedDescription;
- (id)placeWithAnnotation:(id)a3;
- (id)plistData;
- (unint64_t)_locationInfoOrderForCurrentLocale;
- (void)encodeWithCoder:(id)a3;
- (void)setIsHome:(BOOL)a3;
@end

@implementation PLRevGeoLocationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundSecondaryNameInfo, 0);
  objc_storeStrong((id *)&self->_compoundNameInfo, 0);
  objc_storeStrong((id *)&self->_geoServiceProvider, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

- (void)setIsHome:(BOOL)a3
{
  self->_isHome = a3;
}

- (BOOL)isHome
{
  return self->_isHome;
}

- (PLRevGeoCompoundNameInfo)compoundSecondaryNameInfo
{
  return self->_compoundSecondaryNameInfo;
}

- (PLRevGeoCompoundNameInfo)compoundNameInfo
{
  return self->_compoundNameInfo;
}

- (NSString)geoServiceProvider
{
  return self->_geoServiceProvider;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (PLRevGeoMapItem)mapItem
{
  return self->_mapItem;
}

- (PLRevGeoLocationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  if (+[PLRevGeoLocationInfo isInvalidWithCoder:v4])
  {
    v5 = 0;
  }
  else
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapItem"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postalAddress"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geoServiceProvider"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addressString"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compoundNames"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compoundSecondaryNames"];
    LOBYTE(v14) = [v4 decodeBoolForKey:@"isHome"];
    self = [(PLRevGeoLocationInfo *)self initWithMapItem:v6 postalAddress:v7 addressString:v9 countryCode:v10 compoundNameInfo:v11 compoundSecondaryNameInfo:v12 isHome:v14 geoServiceProvider:v8];

    v5 = self;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:13 forKey:@"version"];
  [v4 encodeObject:self->_mapItem forKey:@"mapItem"];
  [v4 encodeObject:self->_postalAddress forKey:@"postalAddress"];
  [v4 encodeObject:self->_addressString forKey:@"addressString"];
  [v4 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v4 encodeObject:self->_compoundNameInfo forKey:@"compoundNames"];
  [v4 encodeObject:self->_compoundSecondaryNameInfo forKey:@"compoundSecondaryNames"];
  [v4 encodeObject:self->_geoServiceProvider forKey:@"geoServiceProvider"];
  [v4 encodeBool:self->_isHome forKey:@"isHome"];
}

- (id)plistData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[ERROR] Could not encode revGeoLocationData %@ with error:%@", buf, 0x16u);
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLRevGeoLocationInfo *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      mapItem = self->_mapItem;
      uint64_t v7 = [(PLRevGeoLocationInfo *)v5 mapItem];
      if (mapItem == (PLRevGeoMapItem *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_mapItem;
        __int16 v10 = [(PLRevGeoLocationInfo *)v5 mapItem];
        LODWORD(v9) = [(PLRevGeoMapItem *)v9 isEqual:v10];

        if (!v9) {
          goto LABEL_19;
        }
      }
      addressString = self->_addressString;
      uint64_t v13 = [(PLRevGeoLocationInfo *)v5 addressString];
      if (addressString == (NSString *)v13)
      {
      }
      else
      {
        uint64_t v14 = (void *)v13;
        v15 = self->_addressString;
        v16 = [(PLRevGeoLocationInfo *)v5 addressString];
        LODWORD(v15) = [(NSString *)v15 isEqualToString:v16];

        if (!v15) {
          goto LABEL_19;
        }
      }
      compoundNameInfo = self->_compoundNameInfo;
      uint64_t v18 = [(PLRevGeoLocationInfo *)v5 compoundNameInfo];
      if (compoundNameInfo == (PLRevGeoCompoundNameInfo *)v18)
      {
      }
      else
      {
        v19 = (void *)v18;
        v20 = self->_compoundNameInfo;
        v21 = [(PLRevGeoLocationInfo *)v5 compoundNameInfo];
        LODWORD(v20) = [(PLRevGeoCompoundNameInfo *)v20 isEqual:v21];

        if (!v20) {
          goto LABEL_19;
        }
      }
      compoundSecondaryNameInfo = self->_compoundSecondaryNameInfo;
      uint64_t v23 = [(PLRevGeoLocationInfo *)v5 compoundSecondaryNameInfo];
      if (compoundSecondaryNameInfo == (PLRevGeoCompoundNameInfo *)v23)
      {
      }
      else
      {
        v24 = (void *)v23;
        v25 = self->_compoundSecondaryNameInfo;
        v26 = [(PLRevGeoLocationInfo *)v5 compoundSecondaryNameInfo];
        LODWORD(v25) = [(PLRevGeoCompoundNameInfo *)v25 isEqual:v26];

        if (!v25)
        {
LABEL_19:
          BOOL v11 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      BOOL isHome = self->_isHome;
      BOOL v11 = isHome == [(PLRevGeoLocationInfo *)v5 isHome];
      goto LABEL_22;
    }
    BOOL v11 = 0;
  }
LABEL_23:

  return v11;
}

- (id)placeWithAnnotation:(id)a3
{
  return +[PLRevGeoPlace placeWithMapItem:self->_mapItem placeAnnotation:a3];
}

- (BOOL)hasLocation
{
  v3 = [(PLRevGeoLocationInfo *)self compoundNameInfo];
  id v4 = [v3 localizedTitleForNameInfo];
  if ([v4 length])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(PLRevGeoLocationInfo *)self compoundSecondaryNameInfo];
    uint64_t v7 = [v6 localizedSortedNames];
    BOOL v5 = [v7 count] != 0;
  }
  return v5;
}

- (unint64_t)_locationInfoOrderForCurrentLocale
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 preferredLocalizations];
  id v4 = [v3 firstObject];

  if (![v4 length])
  {
    BOOL v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v6 = [v5 languageCode];

    id v4 = (void *)v6;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [&unk_1EEBF1DC0 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    unint64_t v10 = 1;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(&unk_1EEBF1DC0);
      }
      if ([v4 hasPrefix:*(void *)(*((void *)&v13 + 1) + 8 * v11)]) {
        break;
      }
      if (v8 == ++v11)
      {
        uint64_t v8 = [&unk_1EEBF1DC0 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)placeNamesForLocalizedDetailedDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(PLRevGeoLocationInfo *)self placeWithAnnotation:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  BOOL v5 = +[PLRevGeoLocationInfo _namingOrderForAssetDetailedReverseGeoDescription];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = objc_msgSend(v3, "bestPlaceInfoForOrderType:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "unsignedIntegerValue"));
        uint64_t v11 = [v10 placeName];
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  if ([(PLRevGeoLocationInfo *)self _locationInfoOrderForCurrentLocale] == 1)
  {
    id v12 = [v4 reversedOrderedSet];
  }
  else
  {
    id v12 = v4;
  }
  long long v13 = v12;
  long long v14 = (void *)[v12 copy];

  return v14;
}

- (id)localizedDescription
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [(PLRevGeoLocationInfo *)self placeWithAnnotation:0];
  +[PLRevGeoLocationInfo _namingOrderForAssetReverseGeoDescription];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "unsignedIntegerValue", (void)v27);
        uint64_t v11 = [v2 bestPlaceInfoForOrderType:v10];
        id v12 = v11;
        if (v11)
        {
          if (!v7)
          {
            id v7 = v11;
            uint64_t v6 = v10;
          }
          if ([v12 hasArea])
          {
            [v12 maximumArea];
            if (v13 >= 500.0)
            {

              uint64_t v6 = v10;
              id v7 = v12;
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = 0;
  }
LABEL_16:

  uint64_t v14 = [v7 placeName];
  long long v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v21 = 0;
    goto LABEL_27;
  }
  uint64_t v31 = v14;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  if (v6 == 3)
  {
    long long v17 = [v2 bestPlaceInfoForOrderType:5];
    long long v18 = [v17 placeName];
    long long v19 = [v18 lowercaseString];

    if (v19)
    {
      v20 = [v15 lowercaseString];
      if ([v19 containsString:v20])
      {
      }
      else
      {
        uint64_t v23 = [v15 lowercaseString];
        char v24 = [v23 containsString:v19];

        if ((v24 & 1) == 0)
        {
          v22 = [v17 placeName];
          goto LABEL_25;
        }
      }
    }
    v22 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v22 = 0;
LABEL_26:
  v25 = [[PLRevGeoCompoundNameInfo alloc] initWithNamePrefix:v22 nameSuffix:0 sortedNames:v16 isContinuation:0 suffixWhenPrefixOnly:0];
  uint64_t v21 = [(PLRevGeoCompoundNameInfo *)v25 localizedTitleForNameInfo];

LABEL_27:
  return v21;
}

- (BOOL)hasMapItem
{
  return self->_mapItem != 0;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PLRevGeoLocationInfo;
  uint64_t v4 = [(PLRevGeoLocationInfo *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ mapItem: %@, postalAddress: %@, countryCode: %@, addressString: %@, compoundNameInfo: %@, compoundSecondaryNameInfo: %@, mapItem: %d", v4, self->_mapItem, self->_postalAddress, self->_addressString, self->_countryCode, self->_compoundNameInfo, self->_compoundSecondaryNameInfo, self->_isHome];

  return v5;
}

- (PLRevGeoLocationInfo)initWithMapItem:(id)a3 postalAddress:(id)a4 addressString:(id)a5 countryCode:(id)a6 compoundNameInfo:(id)a7 compoundSecondaryNameInfo:(id)a8 isHome:(BOOL)a9 geoServiceProvider:(id)a10
{
  id v17 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)PLRevGeoLocationInfo;
  long long v19 = [(PLRevGeoLocationInfo *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mapItem, a3);
    objc_storeStrong((id *)&v20->_postalAddress, a4);
    objc_storeStrong((id *)&v20->_addressString, a5);
    objc_storeStrong((id *)&v20->_countryCode, a6);
    objc_storeStrong((id *)&v20->_compoundNameInfo, a7);
    objc_storeStrong((id *)&v20->_compoundSecondaryNameInfo, a8);
    v20->_BOOL isHome = a9;
    objc_storeStrong((id *)&v20->_geoServiceProvider, a10);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isInvalidWithPlistData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v11 = 0;
  uint64_t v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:&v11];

  id v7 = v11;
  if (v7)
  {
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[ERROR] Could not create unarchiver for revGeoLocationData with error:%@", buf, 0xCu);
    }

    char v9 = 1;
  }
  else
  {
    char v9 = [a1 isInvalidWithCoder:v6];
    [v6 finishDecoding];
  }

  return v9;
}

+ (BOOL)isInvalidWithCoder:(id)a3
{
  return [a3 decodeIntegerForKey:@"version"] != 13;
}

+ (id)infoFromPlistData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F28DC0];
    id v4 = a3;
    id v9 = 0;
    id v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];

    id v6 = v9;
    if (!v5)
    {
      id v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[ERROR] Could not decode revGeoLocationData with error:%@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)_namingOrderForAssetDetailedReverseGeoDescription
{
  return &unk_1EEBF1DA8;
}

+ (id)_namingOrderForAssetReverseGeoDescription
{
  return &unk_1EEBF1D90;
}

+ (id)_newRevGeoLocationInfoFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F38D3B0]();
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)newDataFromRevGeoLocationInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F38D3B0]();
    id v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (PLRevGeoLocationInfo)initWithGEOMapItem:(id)a3
{
  id v4 = a3;
  id v5 = +[PLRevGeoMapItem mapItemWithGEOMapItem:v4];
  id v6 = [v4 geoAddress];
  id v7 = [v6 postalAddress];

  uint64_t v8 = [v4 addressObject];
  id v9 = [v8 fullAddressWithMultiline:0];

  uint64_t v10 = +[PLRevGeoLocationInfo countryCodeWithGEOMapItem:v4];

  id v11 = +[PLRevGeoLocationHelper currentRevGeoProvider];
  LOBYTE(v14) = 0;
  uint64_t v12 = [(PLRevGeoLocationInfo *)self initWithMapItem:v5 postalAddress:v7 addressString:v9 countryCode:v10 compoundNameInfo:0 compoundSecondaryNameInfo:0 isHome:v14 geoServiceProvider:v11];

  return v12;
}

- (BOOL)locationWasResolvedWithBestRevGeoProvider
{
  id v3 = +[PLRevGeoLocationHelper currentRevGeoProvider];
  id v4 = [(PLRevGeoLocationInfo *)self geoServiceProvider];
  if (([v3 isEqualToString:v4] & 1) != 0
    || (v5 = +[PLRevGeoLocationHelper isAutoNaviRevGeoProvider:](PLRevGeoLocationHelper, "isAutoNaviRevGeoProvider:", v4), [(PLRevGeoLocationInfo *)self countryCode], v6 = objc_claimAutoreleasedReturnValue(), int v7 = +[PLRevGeoLocationHelper isAutoNaviCountryCode:v6], v6, v5 == v7))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    int v8 = v7 ^ +[PLRevGeoLocationHelper isCurrentRevGeoProviderAutoNavi];
  }

  return v8;
}

+ (id)countryCodeWithGEOMapItem:(id)a3
{
  id v3 = [a3 geoAddress];
  id v4 = v3;
  if (v3 && [v3 hasStructuredAddress])
  {
    int v5 = [v4 structuredAddress];
    if ([v5 hasCountryCode])
    {
      id v6 = [v5 countryCode];
      int v7 = (void *)[v6 copy];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

@end