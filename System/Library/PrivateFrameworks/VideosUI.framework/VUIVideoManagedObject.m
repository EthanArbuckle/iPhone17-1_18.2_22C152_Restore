@interface VUIVideoManagedObject
+ (id)keyPathsForValuesAffectingExpirationDate;
+ (id)keyPathsForValuesAffectingLocalPlaybackURL;
- (NSArray)playbackModes;
- (NSDate)expirationDate;
- (NSDictionary)additionalFPSRequestParams;
- (NSDictionary)mediaMetrics;
- (NSDictionary)redownloadProductResponseDictionary;
- (NSURL)localPlaybackURL;
- (void)setLocalPlaybackURL:(id)a3;
- (void)setRedownloadProductResponseDictionary:(id)a3;
@end

@implementation VUIVideoManagedObject

+ (id)keyPathsForValuesAffectingLocalPlaybackURL
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"localPlaybackRelativeFilePath"];
}

+ (id)keyPathsForValuesAffectingExpirationDate
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"hasExpirationDate", @"fpsKeyInfo", 0);
}

- (NSURL)localPlaybackURL
{
  v2 = [(VUIVideoManagedObject *)self localPlaybackRelativeFilePath];
  if ([v2 length])
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    v4 = NSHomeDirectory();
    v5 = [v3 fileURLWithPath:v4];
    v6 = [v3 fileURLWithPath:v2 relativeToURL:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (void)setLocalPlaybackURL:(id)a3
{
  v4 = [a3 relativeString];
  id v5 = [v4 stringByRemovingPercentEncoding];

  [(VUIVideoManagedObject *)self setLocalPlaybackRelativeFilePath:v5];
}

- (NSDictionary)additionalFPSRequestParams
{
  v2 = [(VUIVideoManagedObject *)self additionalFPSRequestParamsJSONData];
  if (![v2 length])
  {
    id v5 = 0;
    goto LABEL_12;
  }
  id v15 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:&v15];
  id v4 = v15;
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VUIVideoManagedObject(VideosUIDerivedProperties) additionalFPSRequestParams]((uint64_t)v4);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v6) {
      [(VUIVideoManagedObject(VideosUIDerivedProperties) *)v6 additionalFPSRequestParams];
    }
LABEL_10:
    id v5 = 0;
    goto LABEL_11;
  }
  id v5 = v3;
LABEL_11:

LABEL_12:
  return (NSDictionary *)v5;
}

- (NSDictionary)mediaMetrics
{
  v2 = [(VUIVideoManagedObject *)self mediaMetricsJSONData];
  if (![v2 length])
  {
    id v4 = 0;
    goto LABEL_12;
  }
  uint64_t v22 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:&v22];
  if (!v3)
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v5) {
      [(VUIVideoManagedObject(VideosUIDerivedProperties) *)v5 mediaMetrics];
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v13) {
      [(VUIVideoManagedObject(VideosUIDerivedProperties) *)v13 mediaMetrics];
    }
LABEL_10:
    id v4 = 0;
    goto LABEL_11;
  }
  id v4 = v3;
LABEL_11:

LABEL_12:
  return (NSDictionary *)v4;
}

- (NSArray)playbackModes
{
  v2 = [(VUIVideoManagedObject *)self playbackModesJSONData];
  if (![v2 length])
  {
    id v4 = 0;
    goto LABEL_12;
  }
  uint64_t v22 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:&v22];
  if (!v3)
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v5) {
      [(VUIVideoManagedObject(VideosUIDerivedProperties) *)v5 playbackModes];
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v13) {
      [(VUIVideoManagedObject(VideosUIDerivedProperties) *)v13 playbackModes];
    }
LABEL_10:
    id v4 = 0;
    goto LABEL_11;
  }
  id v4 = v3;
LABEL_11:

LABEL_12:
  return (NSArray *)v4;
}

- (NSDate)expirationDate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(VUIVideoManagedObject *)self fpsKeyInfo];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v5 = [(VUIVideoManagedObject *)self fpsKeyInfo];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) expirationDate];
          uint64_t v12 = v11;
          if (v11)
          {
            if (v8)
            {
              uint64_t v13 = [v8 earlierDate:v11];

              id v8 = (id)v13;
            }
            else
            {
              id v8 = v11;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }
  }
  else if ([(VUIVideoManagedObject *)self hasExpirationDate])
  {
    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  else
  {
    id v8 = 0;
  }
  return (NSDate *)v8;
}

- (void)setRedownloadProductResponseDictionary:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [MEMORY[0x1E4F28F98] propertyList:v4 isValidForFormat:200])
  {
    id v7 = 0;
    BOOL v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v7];
    id v6 = v7;
    if ([v5 length])
    {
      [(VUIVideoManagedObject *)self setRedownloadProductResponse:v5];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1E2BD7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to serialize redownloadProductResponseDictionary data: %@", buf, 0xCu);
    }
  }
}

- (NSDictionary)redownloadProductResponseDictionary
{
  v2 = [(VUIVideoManagedObject *)self redownloadProductResponse];
  if (![v2 length])
  {
    id v5 = 0;
    goto LABEL_12;
  }
  id v23 = 0;
  v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:&v23];
  id v4 = v23;
  if (!v3)
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v6) {
      [(VUIVideoManagedObject(VideosUIDerivedProperties) *)v6 redownloadProductResponseDictionary];
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v14) {
      [(VUIVideoManagedObject(VideosUIDerivedProperties) *)v14 redownloadProductResponseDictionary];
    }
LABEL_10:
    id v5 = 0;
    goto LABEL_11;
  }
  id v5 = v3;
LABEL_11:

LABEL_12:
  return (NSDictionary *)v5;
}

@end