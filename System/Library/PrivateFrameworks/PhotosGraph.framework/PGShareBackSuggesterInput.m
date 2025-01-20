@interface PGShareBackSuggesterInput
+ (id)localDateIntervalForSuggesterInputs:(id)a3 withTimeIntervalPadding:(double)a4;
+ (id)suggesterInputsWithDictionaries:(id)a3;
+ (id)universalDateIntervalForSuggesterInputs:(id)a3 withTimeIntervalPadding:(double)a4;
- (CLLocation)location;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSString)localIdentifier;
- (NSTimeZone)timeZone;
- (PGShareBackSuggesterInput)initWithDictionary:(id)a3;
- (PHAsset)asset;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
@end

@implementation PGShareBackSuggesterInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (PHAsset)asset
{
  return 0;
}

- (NSDate)localCreationDate
{
  v3 = [(PGShareBackSuggesterInput *)self creationDate];
  v4 = [(PGShareBackSuggesterInput *)self timeZone];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v3 inTimeZone:v4];
  }
  else
  {
    v6 = [(PGShareBackSuggesterInput *)self location];
    if (v6) {
      [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v3 atLocation:v6];
    }
    else {
    v5 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:v3];
    }
  }
  return (NSDate *)v5;
}

- (CLLocation)location
{
  [(PGShareBackSuggesterInput *)self latitude];
  CLLocationDegrees v4 = v3;
  [(PGShareBackSuggesterInput *)self longitude];
  CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v4, v5);
  double latitude = v15.latitude;
  double longitude = v15.longitude;
  if (CLLocationCoordinate2DIsValid(v15))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [(PGShareBackSuggesterInput *)self horizontalAccuracy];
    double v10 = v9;
    v11 = [(PGShareBackSuggesterInput *)self creationDate];
    v12 = objc_msgSend(v8, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v11, latitude, longitude, 0.0, v10, 0.0);
  }
  else
  {
    v12 = 0;
  }
  return (CLLocation *)v12;
}

- (PGShareBackSuggesterInput)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PGShareBackSuggesterInput;
  CLLocationDegrees v5 = [(PGShareBackSuggesterInput *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataCreationDateKey"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataTimeZoneKey"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    double v10 = [v4 objectForKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLatitudeKey"];
    v11 = v10;
    if (v10)
    {
      [v10 doubleValue];
      v5->_double latitude = v12;
      v13 = [v4 objectForKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLongitudeKey"];
      [v13 doubleValue];
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F1E750];
      v5->_double latitude = *(double *)MEMORY[0x1E4F1E750];
      v13 = [v4 objectForKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLongitudeKey"];
      double v14 = *(double *)(v15 + 8);
    }
    v5->_double longitude = v14;
    v16 = [v4 objectForKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataHorizontalAccuracyKey"];
    [v16 doubleValue];
    v5->_horizontalAccuracy = v17;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLocalIdentifierKey"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v18;
  }
  return v5;
}

+ (id)universalDateIntervalForSuggesterInputs:(id)a3 withTimeIntervalPadding:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (!v6)
  {
    id v9 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v5);
      }
      double v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) creationDate];
      v13 = v12;
      if (v9)
      {
        uint64_t v14 = [v9 earlierDate:v12];

        id v9 = (id)v14;
        if (v8) {
          goto LABEL_8;
        }
      }
      else
      {
        id v9 = v12;
        if (v8)
        {
LABEL_8:
          uint64_t v15 = [v8 laterDate:v13];

          id v8 = (id)v15;
          goto LABEL_11;
        }
      }
      id v8 = v13;
LABEL_11:
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  }
  while (v7);
  if (v9 && v8)
  {
    v16 = [v9 dateByAddingTimeInterval:-a4];
    double v17 = [v8 dateByAddingTimeInterval:a4];
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v16 endDate:v17];

    goto LABEL_20;
  }
LABEL_17:
  v19 = +[PGLogging sharedLogging];
  v20 = [v19 loggingConnection];

  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:]";
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "%s: Start or endDate nil for %@", buf, 0x16u);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F28C18]);
LABEL_20:

  return v18;
}

+ (id)localDateIntervalForSuggesterInputs:(id)a3 withTimeIntervalPadding:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (!v6)
  {
    id v9 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v5);
      }
      double v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) localCreationDate];
      v13 = v12;
      if (v9)
      {
        uint64_t v14 = [v9 earlierDate:v12];

        id v9 = (id)v14;
        if (v8) {
          goto LABEL_8;
        }
      }
      else
      {
        id v9 = v12;
        if (v8)
        {
LABEL_8:
          uint64_t v15 = [v8 laterDate:v13];

          id v8 = (id)v15;
          goto LABEL_11;
        }
      }
      id v8 = v13;
LABEL_11:
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  }
  while (v7);
  if (v9 && v8)
  {
    v16 = [v9 dateByAddingTimeInterval:-a4];
    double v17 = [v8 dateByAddingTimeInterval:a4];
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v16 endDate:v17];

    goto LABEL_20;
  }
LABEL_17:
  v19 = +[PGLogging sharedLogging];
  v20 = [v19 loggingConnection];

  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[PGShareBackSuggesterInput localDateIntervalForSuggesterInputs:withTimeIntervalPadding:]";
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "%s: Start or endDate nil for %@", buf, 0x16u);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F28C18]);
LABEL_20:

  return v18;
}

+ (id)suggesterInputsWithDictionaries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [PGShareBackSuggesterInput alloc];
        double v12 = -[PGShareBackSuggesterInput initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end