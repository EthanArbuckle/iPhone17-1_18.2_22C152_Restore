@interface PLLocalCreationDateCreator
+ (id)_gmtTranslationDictionary;
+ (void)initialize;
- (PFTimeZoneLookup)timeZoneLookup;
- (PLLocalCreationDateCreator)initWithTimeZoneLookup:(id)a3;
- (id)generateInferredTimeZoneOffsetForAsset:(id)a3;
@end

@implementation PLLocalCreationDateCreator

- (void).cxx_destruct
{
}

- (PFTimeZoneLookup)timeZoneLookup
{
  return self->_timeZoneLookup;
}

- (id)generateInferredTimeZoneOffsetForAsset:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 utcDate];
  [v4 coordinate];
  double latitude = v36.latitude;
  double longitude = v36.longitude;
  if (!CLLocationCoordinate2DIsValid(v36)) {
    goto LABEL_32;
  }
  BOOL v8 = latitude != 0.0;
  if (longitude != 0.0) {
    BOOL v8 = 1;
  }
  if (!v8
    || (latitude == 40.0 ? (BOOL v9 = longitude == -100.0) : (BOOL v9 = 0),
        v9
     || (-[PFTimeZoneLookup timeZoneNameForCoordinate:](self->_timeZoneLookup, "timeZoneNameForCoordinate:", latitude, longitude), (v10 = objc_claimAutoreleasedReturnValue()) == 0)))
  {
LABEL_32:
    v10 = [v4 rawTimeZoneName];
    if (!v10) {
      goto LABEL_20;
    }
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v10];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 secondsFromGMTForDate:v5];
  }
  else
  {
    v14 = [(id)_gmtTranslationDictionary objectForKeyedSubscript:v10];
    v15 = v14;
    if (v14)
    {
      [v14 doubleValue];
      uint64_t v13 = (uint64_t)(v16 * 3600.0);
    }
    else
    {
      v17 = PLMomentsGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [v4 uuid];
        int v28 = 138543874;
        v29 = v18;
        __int16 v30 = 2112;
        v31 = v5;
        __int16 v32 = 2112;
        v33 = v10;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "[LOCAL DATE] Could not find tz information for asset w/ uuid %{public}@, date %@, tz %@", (uint8_t *)&v28, 0x20u);
      }
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_20:
    v19 = [v4 rawTimeZoneOffsetValue];
    if (!v19) {
      goto LABEL_24;
    }
    v20 = v19;
    uint64_t v13 = [v19 integerValue];
    v21 = PLMomentsGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = [v4 uuid];
      int v28 = 138543362;
      v29 = v22;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "[LOCAL DATE] Using timezone offset from database for asset w/ uuid %{public}@", (uint8_t *)&v28, 0xCu);
    }
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_24:
      v23 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
      uint64_t v13 = [v23 secondsFromGMTForDate:v5];
      v24 = PLMomentsGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = [v4 uuid];
        int v28 = 138543362;
        v29 = v25;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "[LOCAL DATE] Using local timezone for asset w/ uuid %{public}@", (uint8_t *)&v28, 0xCu);
      }
    }
  }
  v26 = [NSNumber numberWithInteger:v13];

  return v26;
}

- (PLLocalCreationDateCreator)initWithTimeZoneLookup:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLLocalCreationDateCreator;
  v5 = [(PLLocalCreationDateCreator *)&v9 init];
  if (v5)
  {
    if (v4) {
      v6 = (PFTimeZoneLookup *)v4;
    }
    else {
      v6 = (PFTimeZoneLookup *)objc_alloc_init(MEMORY[0x1E4F8CDF0]);
    }
    timeZoneLookup = v5->_timeZoneLookup;
    v5->_timeZoneLookup = v6;
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___PLLocalCreationDateCreator;
    objc_msgSendSuper2(&v4, sel_initialize);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLLocalCreationDateCreator_initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, block);
    }
  }
}

void __40__PLLocalCreationDateCreator_initialize__block_invoke()
{
  uint64_t v0 = [(id)objc_opt_class() _gmtTranslationDictionary];
  v1 = (void *)_gmtTranslationDictionary;
  _gmtTranslationDictionary = v0;
}

+ (id)_gmtTranslationDictionary
{
  return &unk_1EEBF2A90;
}

@end