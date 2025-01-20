@interface BKLibraryAsset
+ (BOOL)hasBookReachedReadThreshold:(id)a3;
+ (id)actualAuthorFromMetedata:(id)a3;
+ (id)keyPathsForValuesAffectingIsDownloading;
+ (id)keyPathsForValuesAffectingIsImporting;
+ (id)keyPathsForValuesAffectingIsLocal;
+ (id)multipleAuthors;
+ (id)unknownAuthor;
+ (id)unknownTitle;
- (BOOL)_isUbiquityItem;
- (BOOL)_validateIsState1;
- (BOOL)_validateIsState2;
- (BOOL)_validateIsState3;
- (BOOL)canEditMetadata;
- (BOOL)canOpen;
- (BOOL)currentlyUploading;
- (BOOL)hasImportantAssetDetails;
- (BOOL)hasImportantReadingNowDetails;
- (BOOL)hasSpecifiedFinishedDate;
- (BOOL)iTunesU;
- (BOOL)isAudiobook;
- (BOOL)isAudiobookPreview;
- (BOOL)isBook;
- (BOOL)isCloud;
- (BOOL)isContainer;
- (BOOL)isDecompressing;
- (BOOL)isDeletable;
- (BOOL)isDownloading;
- (BOOL)isImporting;
- (BOOL)isInSamples;
- (BOOL)isLocal;
- (BOOL)isManagedBook;
- (BOOL)isMemberOfCustomCollection;
- (BOOL)isNonLocalSample;
- (BOOL)isOwned;
- (BOOL)isPartOfSeries;
- (BOOL)isPreorderBook;
- (BOOL)isRightToLeft;
- (BOOL)isSeriesItem;
- (BOOL)isStore;
- (BOOL)isStoreItem;
- (BOOL)isStoreOrSeriesItem;
- (BOOL)isUbiquitousBook;
- (BOOL)isValid;
- (BOOL)needsGlobalAnnotation;
- (BOOL)shouldBeInDownloadedCollection;
- (BOOL)shouldBeInMySamplesCollection;
- (BOOL)streamable;
- (BOOL)titleEditsSavedInLibraryOnly;
- (NSString)actualAuthor;
- (NSString)assetLogID;
- (NSString)cloudAssetType;
- (NSString)displayAuthor;
- (NSString)finishedCollectionSectionName;
- (NSString)permanentOrTemporaryAssetID;
- (NSString)shortBookTitle;
- (id)_dateFinishedForYearOnly:(id)a3;
- (id)assetDetailRepresentation;
- (id)managedObjectContext;
- (id)readingNowDetailRepresentation;
- (id)seriesStackAssetIDs;
- (int64_t)finishedCollectionSectionID;
- (int64_t)isRightToLeftValue;
- (signed)seriesType;
- (void)_setFinishedStates:(BOOL)a3;
- (void)cleanupDateFinished;
- (void)configureFromAssetDetail:(id)a3;
- (void)configureFromReadingNowDetail:(id)a3;
- (void)didChangeValueForKey:(id)a3;
- (void)nonUserUpdateLastOpenDateTo:(id)a3;
- (void)setCreationDateToNow;
- (void)setFinishedStateAddToFinishedCollection;
- (void)setFinishedStateAssetRead;
- (void)setFinishedStateRemoveFromFinishedCollection;
- (void)setFinishedStateUserSetsFinished:(BOOL)a3 userInfo:(id)a4;
- (void)setFinishedStateUserSetsUnfinished;
- (void)setIsDecompressing:(BOOL)a3;
- (void)setIsRightToLeftValue:(int64_t)a3;
- (void)setLastOpenDate:(id)a3;
- (void)unsetFinishedDate;
- (void)userUpdateDateFinished:(id)a3 ofKind:(signed __int16)a4;
- (void)willSave;
@end

@implementation BKLibraryAsset

- (BOOL)hasSpecifiedFinishedDate
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(BKLibraryAsset *)self dateFinished];
    if (v3)
    {
      v4 = [(BKLibraryAsset *)self dateFinished];
      v5 = +[NSDate distantPast];
      unsigned int v6 = [v4 isEqualToDate:v5] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (int64_t)finishedCollectionSectionID
{
  return [(BKLibraryAsset *)self hasSpecifiedFinishedDate] ^ 1;
}

- (NSString)finishedCollectionSectionName
{
  if ([(BKLibraryAsset *)self hasSpecifiedFinishedDate])
  {
    v2 = 0;
  }
  else
  {
    v3 = BKLibraryFrameworkBundle();
    v2 = [v3 localizedStringForKey:@"Date Not Set" value:&stru_D4160 table:&stru_D4160];
  }

  return (NSString *)v2;
}

- (BOOL)_validateIsState1
{
  if ([(BKLibraryAsset *)self isFinished]) {
    return 0;
  }
  else {
    return [(BKLibraryAsset *)self notFinished] ^ 1;
  }
}

- (BOOL)_validateIsState2
{
  if ([(BKLibraryAsset *)self isFinished]) {
    return 0;
  }

  return [(BKLibraryAsset *)self notFinished];
}

- (BOOL)_validateIsState3
{
  unsigned int v3 = [(BKLibraryAsset *)self isFinished];
  if (v3) {
    LOBYTE(v3) = [(BKLibraryAsset *)self notFinished] ^ 1;
  }
  return v3;
}

- (void)_setFinishedStates:(BOOL)a3
{
  BOOL v3 = a3;
  -[BKLibraryAsset setIsFinished:](self, "setIsFinished:");

  [(BKLibraryAsset *)self setNotFinished:!v3];
}

- (id)_dateFinishedForYearOnly:(id)a3
{
  id v3 = a3;
  v4 = +[NSCalendar currentCalendar];
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setCalendar:v4];
  unsigned int v6 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v5 setTimeZone:v6];

  [v5 setEra:[v4 component:2 fromDate:v3]];
  [v5 setYear:[v4 component:4 fromDate:v3]];
  v7 = [v4 dateFromComponents:v5];
  v8 = v7;
  if (!v7) {
    v7 = v3;
  }
  id v9 = v7;

  return v9;
}

- (void)userUpdateDateFinished:(id)a3 ofKind:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v10 = v6;
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSDate date];
  }
  v8 = v7;
  if (v4 == 2)
  {
    uint64_t v9 = [(BKLibraryAsset *)self _dateFinishedForYearOnly:v7];

    v8 = (void *)v9;
  }
  [(BKLibraryAsset *)self setDifferentDate:v8 forKey:@"dateFinished"];
  if ([(BKLibraryAsset *)self finishedDateKind] != v4) {
    [(BKLibraryAsset *)self setFinishedDateKind:v4];
  }
}

- (void)cleanupDateFinished
{
  uint64_t v3 = [(BKLibraryAsset *)self dateFinished];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    unsigned int v5 = [(BKLibraryAsset *)self finishedDateKind];

    if (v5 == 2) {
      return;
    }
  }
  id v24 = +[NSDate date];
  uint64_t v6 = [(BKLibraryAsset *)self lastEngagedDate];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [(BKLibraryAsset *)self lastEngagedDate];
    uint64_t v9 = +[NSDate distantPast];
    unsigned __int8 v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v21 = [(BKLibraryAsset *)self lastEngagedDate];
      goto LABEL_12;
    }
  }
  uint64_t v11 = [(BKLibraryAsset *)self lastOpenDate];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(BKLibraryAsset *)self lastOpenDate];
    v14 = +[NSDate distantPast];
    unsigned __int8 v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      uint64_t v21 = [(BKLibraryAsset *)self lastOpenDate];
      goto LABEL_12;
    }
  }
  uint64_t v16 = [(BKLibraryAsset *)self purchaseDate];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(BKLibraryAsset *)self purchaseDate];
    v19 = +[NSDate distantPast];
    unsigned __int8 v20 = [v18 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = [(BKLibraryAsset *)self purchaseDate];
LABEL_12:
      v22 = (void *)v21;

      id v24 = v22;
    }
  }
  v23 = [(BKLibraryAsset *)self assetDetailsModificationDate];
  [(BKLibraryAsset *)self setDifferentDate:v24 forKey:@"dateFinished"];
  [(BKLibraryAsset *)self setFinishedDateKind:1];
  [(BKLibraryAsset *)self setAssetDetailsModificationDate:v23];
}

- (void)unsetFinishedDate
{
  id v3 = +[NSDate distantPast];
  [(BKLibraryAsset *)self userUpdateDateFinished:v3 ofKind:0];
}

- (void)setFinishedStateUserSetsFinished:(BOOL)a3 userInfo:(id)a4
{
  id v6 = a4;
  if ([(BKLibraryAsset *)self isContainer])
  {
    id v7 = BKLibraryUILog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_8F448((uint64_t)self, v7);
    }
LABEL_7:

    goto LABEL_8;
  }
  if ([(BKLibraryAsset *)self _validateIsState3])
  {
    id v7 = BKLibraryUILog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_8F4C0(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_7;
  }
  [(BKLibraryAsset *)self _setFinishedStates:1];
  if (a3
    || ([(BKLibraryAsset *)self dateFinished],
        v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
    [(BKLibraryAsset *)self userUpdateDateFinished:0 ofKind:1];
  }
  v19 = BKLibraryUILog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v20 = [(BKLibraryAsset *)self dateFinished];
    int v22 = 138412546;
    v23 = self;
    __int16 v24 = 2112;
    v25 = v20;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "setFinishedStateUserSetsFinished: for asset %@ with date %@", (uint8_t *)&v22, 0x16u);
  }
  if ([(BKLibraryAsset *)self isTrackedAsRecent]
    && [(BKLibraryAsset *)self hasSpecifiedFinishedDate])
  {
    uint64_t v21 = +[NSDate now];
    [(BKLibraryAsset *)self setDifferentDate:v21 forKey:@"lastEngagedDate"];

    id v7 = BKLibraryUILog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "userUpdateDateFinished: lastEngagedDate updated", (uint8_t *)&v22, 2u);
    }
    goto LABEL_7;
  }
LABEL_8:
  if (v6 && [(BKLibraryAsset *)self isFinished])
  {
    id v15 = [v6 mutableCopy];
    uint64_t v16 = [(BKLibraryAsset *)self permanentOrTemporaryAssetID];
    [v15 setObject:v16 forKeyedSubscript:@"BKLibraryAssetIDKey"];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 postNotificationName:@"BKLibraryAssetMarkedAsFinishedNotification" object:self userInfo:v15];
  }
}

- (void)setFinishedStateUserSetsUnfinished
{
  if ([(BKLibraryAsset *)self _validateIsState2])
  {
    id v3 = BKLibraryUILog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_8F4F8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    [(BKLibraryAsset *)self _setFinishedStates:0];
    [(BKLibraryAsset *)self setDateFinished:0];
    [(BKLibraryAsset *)self setFinishedDateKind:0];
    id v3 = BKLibraryUILog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "setFinishedStateUserSetsUnfinished for asset %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)setFinishedStateRemoveFromFinishedCollection
{
  if ([(BKLibraryAsset *)self _validateIsState2])
  {
    id v3 = BKLibraryUILog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_8F530(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    [(BKLibraryAsset *)self _setFinishedStates:0];
    [(BKLibraryAsset *)self setDateFinished:0];
    [(BKLibraryAsset *)self setFinishedDateKind:0];
    id v3 = BKLibraryUILog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "setFinishedStateRemoveFromFinishedCollection for asset %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)setFinishedStateAssetRead
{
  if ([(BKLibraryAsset *)self _validateIsState2])
  {
    [(BKLibraryAsset *)self setIsFinished:0];
    [(BKLibraryAsset *)self setNotFinished:0];
    id v3 = BKLibraryUILog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      uint64_t v5 = self;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "setFinishedStateAssetRead for asset %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)setFinishedStateAddToFinishedCollection
{
  if ([(BKLibraryAsset *)self isContainer])
  {
    id v3 = BKLibraryUILog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_8F568(self, v3);
    }
  }
  else
  {
    if ([(BKLibraryAsset *)self isFinished]) {
      return;
    }
    [(BKLibraryAsset *)self _setFinishedStates:1];
    [(BKLibraryAsset *)self userUpdateDateFinished:0 ofKind:1];
    int v4 = [(BKLibraryAsset *)self permanentOrTemporaryAssetID];
    if (v4)
    {
      CFStringRef v14 = @"BKLibraryAssetIDKey";
      uint64_t v5 = [(BKLibraryAsset *)self permanentOrTemporaryAssetID];
      id v15 = v5;
      uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      id v3 = [v6 mutableCopy];
    }
    else
    {
      id v3 = [&__NSDictionary0__struct mutableCopy];
    }

    [v3 setObject:BALocationTypeFromAddToFinishCollection forKeyedSubscript:@"BKLibraryAssetMarkedLocation"];
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"BKLibraryAssetMarkedAsFinishedNotification" object:self userInfo:v3];

    uint64_t v8 = BKLibraryUILog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(BKLibraryAsset *)self dateFinished];
      int v10 = 138412546;
      int v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "setFinishedStateAddToFinishedCollection for asset %@ with date %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

+ (BOOL)hasBookReachedReadThreshold:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int v4 = [v3 objectForKeyedSubscript:BCAssetReadingProgressKey];

  uint64_t v5 = BUDynamicCast();

  [v5 floatValue];
  LOBYTE(v3) = v6 > kAEAnnotationReadingLocationSignificantHighwaterMark;

  return (char)v3;
}

+ (id)keyPathsForValuesAffectingIsDownloading
{
  return +[NSSet setWithObject:@"state"];
}

+ (id)keyPathsForValuesAffectingIsLocal
{
  return +[NSSet setWithObject:@"state"];
}

+ (id)keyPathsForValuesAffectingIsImporting
{
  return +[NSSet setWithObject:@"state"];
}

+ (id)unknownAuthor
{
  if (qword_EE5D8 != -1) {
    dispatch_once(&qword_EE5D8, &stru_D27C8);
  }
  v2 = (void *)gUnknownAuthor;

  return v2;
}

+ (id)unknownTitle
{
  if (qword_EE5E0 != -1) {
    dispatch_once(&qword_EE5E0, &stru_D27E8);
  }
  v2 = (void *)gUnknownTitle;

  return v2;
}

+ (id)multipleAuthors
{
  if (qword_EE5E8 != -1) {
    dispatch_once(&qword_EE5E8, &stru_D2808);
  }
  v2 = (void *)gMultipleAuthors;

  return v2;
}

- (void)willSave
{
  if (([(BKLibraryAsset *)self isFault] & 1) != 0
    || ([(BKLibraryAsset *)self isDeleted] & 1) != 0)
  {
    return;
  }
  id v3 = [(BKLibraryAsset *)self sortAuthor];
  id v4 = [v3 length];

  if (!v4)
  {
    uint64_t v5 = [(BKLibraryAsset *)self author];
    id v6 = [v5 length];

    if (v6)
    {
      uint64_t v7 = [(BKLibraryAsset *)self author];
      [(BKLibraryAsset *)self setSortAuthor:v7];
    }
  }
  uint64_t v8 = [(BKLibraryAsset *)self sortAuthor];
  if ([v8 isEqualToString:@"UnknownAuthor"])
  {
    uint64_t v9 = [(BKLibraryAsset *)self author];
    unsigned __int8 v10 = [v9 isEqualToString:@"UnknownAuthor"];

    if (v10) {
      goto LABEL_11;
    }
    uint64_t v8 = [(BKLibraryAsset *)self author];
    [(BKLibraryAsset *)self setSortAuthor:v8];
  }

LABEL_11:
  int v11 = [(BKLibraryAsset *)self sortTitle];
  id v12 = [v11 length];

  if (!v12)
  {
    uint64_t v13 = [(BKLibraryAsset *)self title];
    id v14 = [v13 length];

    if (v14)
    {
      id v15 = [(BKLibraryAsset *)self title];
      [(BKLibraryAsset *)self setSortTitle:v15];
    }
  }
  id v21 = [(BKLibraryAsset *)self lastOpenDate];
  uint64_t v16 = +[NSDate distantPast];
  v17 = [(BKLibraryAsset *)self lastOpenDate];
  v18 = [v16 laterDate:v17];

  v19 = [(BKLibraryAsset *)self purchaseDate];
  unsigned __int8 v20 = [v18 laterDate:v19];

  if (([v21 isEqualToDate:v20] & 1) == 0) {
    [(BKLibraryAsset *)self nonUserUpdateLastOpenDateTo:v20];
  }
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryAsset;
  [(BKLibraryAsset *)&v6 didChangeValueForKey:v4];
  if (([v4 isEqualToString:@"assetDetailsModificationDate"] & 1) == 0
    && (([v4 isEqualToString:@"isFinished"] & 1) != 0
     || ([v4 isEqualToString:@"notFinished"] & 1) != 0
     || ([v4 isEqualToString:@"lastOpenDate"] & 1) != 0
     || ([v4 isEqualToString:@"dateFinished"] & 1) != 0
     || [(BKLibraryAsset *)self isAudiobook]
     && (([v4 isEqualToString:@"readingProgress"] & 1) != 0
      || [v4 isEqualToString:@"bookHighWaterMarkProgress"])))
  {
    uint64_t v5 = +[NSDate date];
    [(BKLibraryAsset *)self setAssetDetailsModificationDate:v5];
  }
}

- (NSString)permanentOrTemporaryAssetID
{
  id v3 = [(BKLibraryAsset *)self assetID];
  if (!v3)
  {
    id v3 = [(BKLibraryAsset *)self temporaryAssetID];
  }

  return (NSString *)v3;
}

+ (id)actualAuthorFromMetedata:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"UnknownAuthor"] & 1) != 0
    || ([v3 isEqualToString:@"MultipleAuthors"] & 1) != 0)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (NSString)actualAuthor
{
  v2 = [(BKLibraryAsset *)self author];
  id v3 = +[BKLibraryAsset actualAuthorFromMetedata:v2];

  return (NSString *)v3;
}

- (NSString)displayAuthor
{
  id v3 = [(BKLibraryAsset *)self hasTooManyAuthors];
  unsigned int v4 = [v3 BOOLValue];

  uint64_t v5 = [(BKLibraryAsset *)self authorNames];
  objc_super v6 = [(BKLibraryAsset *)self authorCount];
  uint64_t v7 = v6;
  if (!v4)
  {
    if ([v6 intValue] == 1 && objc_msgSend(v5, "count"))
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:0];
      goto LABEL_21;
    }
    if ([v7 intValue] == 2 && (unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      uint64_t v9 = BKLibraryFrameworkBundle();
      unsigned __int8 v10 = [v9 localizedStringForKey:@"Library.Item.TwoArtists" value:@"%@ & %@" table:&stru_D4160];

      int v11 = [v5 objectAtIndexedSubscript:0];
      uint64_t v12 = [v5 objectAtIndexedSubscript:1];
      uint64_t v13 = (void *)v12;
    }
    else
    {
      if ([v7 intValue] == 3 && (unint64_t)objc_msgSend(v5, "count") >= 3)
      {
        id v14 = BKLibraryFrameworkBundle();
        unsigned __int8 v10 = [v14 localizedStringForKey:@"Library.Item.ThreeArtists", @"%@, %@, & %@", &stru_D4160 value table];

        int v11 = [v5 objectAtIndexedSubscript:0];
        uint64_t v13 = [v5 objectAtIndexedSubscript:1];
        id v15 = [v5 objectAtIndexedSubscript:2];
        uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v13, v15);

LABEL_16:
        goto LABEL_22;
      }
      if ((int)[v7 intValue] < 4 || (unint64_t)objc_msgSend(v5, "count") < 2)
      {
        v19 = [(BKLibraryAsset *)self author];
        unsigned int v20 = [v19 isEqualToString:@"UnknownAuthor"];

        if (v20)
        {
          uint64_t v8 = +[BKLibraryAsset unknownAuthor];
          goto LABEL_21;
        }
        id v21 = [(BKLibraryAsset *)self author];
        unsigned int v22 = [v21 isEqualToString:@"MultipleAuthors"];

        if (!v22)
        {
          uint64_t v8 = [(BKLibraryAsset *)self author];
          goto LABEL_21;
        }
        goto LABEL_2;
      }
      uint64_t v17 = [v7 intValue] - 2;
      v18 = BKLibraryFrameworkBundle();
      unsigned __int8 v10 = [v18 localizedStringForKey:@"Library.Item.TwoAndOtherArtists", @"%@, %@, & %d others", &stru_D4160 value table];

      int v11 = [v5 objectAtIndexedSubscript:0];
      uint64_t v12 = [v5 objectAtIndexedSubscript:1];
      uint64_t v13 = (void *)v12;
      uint64_t v24 = v17;
    }
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v12, v24);
    goto LABEL_16;
  }
LABEL_2:
  uint64_t v8 = +[BKLibraryAsset multipleAuthors];
LABEL_21:
  uint64_t v16 = (void *)v8;
LABEL_22:

  return (NSString *)v16;
}

- (BOOL)isValid
{
  return [(BKLibraryAsset *)self isDeleted] ^ 1;
}

- (BOOL)isStore
{
  v2 = [(BKLibraryAsset *)self storeID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isDownloading
{
  return [(BKLibraryAsset *)self state] == 2;
}

- (BOOL)isLocal
{
  return [(BKLibraryAsset *)self state] == 1;
}

- (BOOL)isCloud
{
  return [(BKLibraryAsset *)self state] == 3;
}

- (BOOL)isNonLocalSample
{
  if (([(BKLibraryAsset *)self isSample] & 1) != 0
    || [(BKLibraryAsset *)self isLocal])
  {
    return 0;
  }

  return [(BKLibraryAsset *)self isInSamples];
}

- (BOOL)isAudiobookPreview
{
  if (([(BKLibraryAsset *)self isSample] & 1) != 0
    || [(BKLibraryAsset *)self isLocal])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    unsigned int v4 = [(BKLibraryAsset *)self isStoreAudiobook];
    if ([v4 BOOLValue]) {
      unsigned int v3 = ![(BKLibraryAsset *)self isOwned];
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)iTunesU
{
  unsigned int v3 = [(BKLibraryAsset *)self permlink];
  if (v3)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    uint64_t v5 = [(BKLibraryAsset *)self dataSourceIdentifier];
    if ([v5 isEqualToString:@"com.apple.ibooks.datasource.itunesu"])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      objc_super v6 = [(BKLibraryAsset *)self dataSourceIdentifier];
      unsigned __int8 v4 = [v6 isEqualToString:@"com.apple.ibooks.plugin.Bookshelf.platformDataSource.iTunesU"];
    }
  }

  return v4;
}

- (signed)seriesType
{
  if ([(BKLibraryAsset *)self contentType] == 5) {
    return 0;
  }
  unsigned __int8 v4 = [(BKLibraryAsset *)self seriesID];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [(BKLibraryAsset *)self sequenceDisplayName];
  if ([v5 length]) {
    signed __int16 v3 = 2;
  }
  else {
    signed __int16 v3 = 3;
  }

  return v3;
}

- (BOOL)isSeriesItem
{
  return [(BKLibraryAsset *)self state] == 5
      && [(BKLibraryAsset *)self contentType] != 5;
}

- (BOOL)needsGlobalAnnotation
{
  if ([(BKLibraryAsset *)self state] == 5) {
    return 0;
  }
  else {
    return ![(BKLibraryAsset *)self isStoreItem];
  }
}

- (BOOL)isStoreItem
{
  return [(BKLibraryAsset *)self state] == 6;
}

- (BOOL)isStoreOrSeriesItem
{
  if ([(BKLibraryAsset *)self isStoreItem]) {
    return 1;
  }

  return [(BKLibraryAsset *)self isSeriesItem];
}

- (BOOL)isOwned
{
  if (([(BKLibraryAsset *)self isSample] & 1) != 0
    || [(BKLibraryAsset *)self isStoreItem]
    || [(BKLibraryAsset *)self isSeriesItem]
    || [(BKLibraryAsset *)self isContainer])
  {
    return 0;
  }
  else
  {
    return ![(BKLibraryAsset *)self isPreorderBook];
  }
}

- (BOOL)isContainer
{
  return [(BKLibraryAsset *)self contentType] == 5;
}

- (BOOL)isImporting
{
  return [(BKLibraryAsset *)self state] == 4;
}

- (BOOL)isMemberOfCustomCollection
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(BKLibraryAsset *)self collectionMembers];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) collection];
        uint64_t v7 = v6;
        if (v6 && ([v6 isDefaultCollection] & 1) == 0)
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)isInSamples
{
  v2 = [(BKLibraryAsset *)self collectionMembers];
  id v3 = [v2 valueForKey:@"collectionID"];
  unsigned __int8 v4 = [v3 containsObject:kBKCollectionDefaultIDSamples];

  return v4;
}

- (BOOL)canEditMetadata
{
  unsigned int v3 = [(BKLibraryAsset *)self isLocal];
  if (v3)
  {
    if ([(BKLibraryAsset *)self isAudiobook]
      || ([(BKLibraryAsset *)self isProof] & 1) != 0
      || ([(BKLibraryAsset *)self isSample] & 1) != 0
      || ([(BKLibraryAsset *)self isHidden] & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = [(BKLibraryAsset *)self isLocked] ^ 1;
    }
  }
  return v3;
}

- (BOOL)titleEditsSavedInLibraryOnly
{
  return [(BKLibraryAsset *)self contentType] == 3;
}

- (void)setCreationDateToNow
{
  id v5 = +[NSDate date];
  [(BKLibraryAsset *)self setCreationDate:v5];
  unsigned int v3 = [(BKLibraryAsset *)self purchasedAndLocalParent];
  [v3 setCreationDate:v5];

  [(BKLibraryAsset *)self setModificationDate:v5];
  unsigned __int8 v4 = [(BKLibraryAsset *)self purchasedAndLocalParent];
  [v4 setModificationDate:v5];
}

- (void)nonUserUpdateLastOpenDateTo:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryAsset *)self assetDetailsModificationDate];
  [(BKLibraryAsset *)self setLastOpenDate:v4];

  [(BKLibraryAsset *)self setAssetDetailsModificationDate:v5];
}

- (id)seriesStackAssetIDs
{
  unsigned int v3 = [(BKLibraryAsset *)self seriesStackIDs];
  if (v3)
  {
    id v4 = [(BKLibraryAsset *)self seriesStackIDs];
    id v5 = [v4 componentsSeparatedByString:@","];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)assetLogID
{
  unsigned int v3 = [(BKLibraryAsset *)self assetGUID];
  id v4 = [v3 length];

  if (!v4)
  {
    [(BKLibraryAsset *)self willChangeValueForKey:@"assetGUID"];
    id v5 = +[NSString UUID];
    [(BKLibraryAsset *)self setPrimitiveValue:v5 forKey:@"assetGUID"];

    [(BKLibraryAsset *)self didChangeValueForKey:@"assetGUID"];
  }

  return (NSString *)[(BKLibraryAsset *)self assetGUID];
}

- (id)managedObjectContext
{
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAsset;
  v2 = [(BKLibraryAsset *)&v4 managedObjectContext];

  return v2;
}

- (BOOL)isRightToLeft
{
  unsigned int v3 = [(BKLibraryAsset *)self pageProgressionDirection];
  objc_super v4 = [v3 lowercaseString];

  if ([v4 isEqualToString:@"rtl"])
  {
    unsigned __int8 v5 = 1;
  }
  else if (([v4 isEqualToString:@"default"] & 1) != 0 {
         || !v4
  }
         || [v4 isEqualToString:&stru_D4160])
  {
    objc_super v6 = [(BKLibraryAsset *)self language];
    if (+[IMLanguageUtilities languageIsHebrew:v6])unsigned __int8 v5 = 1; {
    else
    }
      unsigned __int8 v5 = +[IMLanguageUtilities languageIsArabic:v6];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)streamable
{
  unsigned int v3 = BLAudiobookStreamingEnabled();
  if (v3)
  {
    if ([(BKLibraryAsset *)self isCloud]
      || (unsigned int v3 = [(BKLibraryAsset *)self isDownloading]) != 0)
    {
      unsigned int v3 = [(BKLibraryAsset *)self isAudiobook];
      if (v3) {
        LOBYTE(v3) = ![(BKLibraryAsset *)self isPreorderBook];
      }
    }
  }
  return v3;
}

- (BOOL)canOpen
{
  if ([(BKLibraryAsset *)self isLocal]) {
    return 1;
  }

  return [(BKLibraryAsset *)self streamable];
}

- (BOOL)isUbiquitousBook
{
  unsigned int v3 = [(BKLibraryAsset *)self path];
  if (v3)
  {
    if (![(NSString *)self->_cachedAssetPath isEqualToString:v3])
    {
      unsigned __int8 v5 = +[NSFileManager defaultManager];
      objc_super v6 = +[NSURL fileURLWithPath:v3];
      self->_BOOL cachedUbiquitousState = [v5 isUbiquitousItemAtURL:v6];

      objc_storeStrong((id *)&self->_cachedAssetPath, v3);
    }
    BOOL cachedUbiquitousState = self->_cachedUbiquitousState;
  }
  else
  {
    BOOL cachedUbiquitousState = 0;
  }

  return cachedUbiquitousState;
}

- (id)assetDetailRepresentation
{
  id v3 = objc_alloc((Class)BCMutableAssetDetail);
  objc_super v4 = [(BKLibraryAsset *)self assetID];
  id v5 = [v3 initWithAssetID:v4];

  [v5 setIsFinished:[self isFinished]];
  [v5 setNotFinished:[self notFinished]];
  objc_super v6 = [(BKLibraryAsset *)self lastOpenDate];
  [v5 setLastOpenDate:v6];

  uint64_t v7 = [(BKLibraryAsset *)self dateFinished];
  [v5 setDateFinished:v7];

  [v5 setFinishedDateKind:[self finishedDateKind]];
  [v5 setTaste:[self taste]];
  [v5 setTasteSyncedToStore:[self tasteSyncedToStore]];
  uint64_t v8 = [(BKLibraryAsset *)self assetDetailsModificationDate];
  [v5 setModificationDate:v8];

  if ([(BKLibraryAsset *)self isAudiobook])
  {
    [v5 setBookmarkTime:0.0];
    long long v9 = +[NSDate distantPast];
    [v5 setDatePlaybackTimeUpdated:v9];

    long long v10 = [(BKLibraryAsset *)self readingProgress];
    [v10 floatValue];
    [v5 setReadingProgress:];

    long long v11 = [(BKLibraryAsset *)self bookHighWaterMarkProgress];
    [v11 floatValue];
    [v5 setReadingProgressHighWaterMark:];
  }

  return v5;
}

- (BOOL)hasImportantAssetDetails
{
  if (([(BKLibraryAsset *)self isFinished] & 1) == 0
    && ([(BKLibraryAsset *)self notFinished] & 1) == 0
    && ![(BKLibraryAsset *)self taste]
    && ![(BKLibraryAsset *)self tasteSyncedToStore]
    && ![(BKLibraryAsset *)self isAudiobook])
  {
    if ([(BKLibraryAsset *)self isDownloading] || [(BKLibraryAsset *)self isSeriesItem])
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    uint64_t v7 = [(BKLibraryAsset *)self lastOpenDate];
    if (!v7
      || (+[NSDate distantPast],
          v2 = objc_claimAutoreleasedReturnValue(),
          [(BKLibraryAsset *)self lastOpenDate],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v2 isEqualToDate:v3]))
    {
      uint64_t v8 = [(BKLibraryAsset *)self dateFinished];
      if (v8)
      {
        long long v9 = (void *)v8;
        long long v10 = +[NSDate distantPast];
        long long v11 = [(BKLibraryAsset *)self dateFinished];
        unsigned int v5 = [v10 isEqualToDate:v11] ^ 1;

        if (!v7)
        {
LABEL_17:

          return v5;
        }
      }
      else
      {
        LOBYTE(v5) = 0;
        if (!v7) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }

    goto LABEL_17;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)configureFromAssetDetail:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKLibraryAsset *)self assetDetailsModificationDate];
  uint64_t v6 = [v4 modificationDate];
  uint64_t v7 = (void *)v6;
  if (!(v5 | v6))
  {
    long long v12 = +[BULogUtilities shared];
    unsigned int v13 = [v12 verboseLoggingEnabled];

    if (!v13) {
      goto LABEL_40;
    }
    id v14 = BKLibraryAssetDetailsDevelopmentLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    id v15 = [(BKLibraryAsset *)self title];
    *(_DWORD *)v54 = 138412290;
    *(void *)&v54[4] = v15;
    uint64_t v16 = "\"\\\"configureFromAssetDetail No local modDate, No assetDetail modDate for assetDetail %@\\\"\"";
LABEL_11:
    uint64_t v17 = v14;
    uint32_t v18 = 12;
LABEL_38:
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, v16, v54, v18);

    goto LABEL_39;
  }
  if (!v5 && v6)
  {
    uint64_t v8 = +[BULogUtilities shared];
    unsigned int v9 = [v8 verboseLoggingEnabled];

    if (v9)
    {
      long long v10 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        long long v11 = [(BKLibraryAsset *)self title];
        *(_DWORD *)v54 = 138412546;
        *(void *)&v54[4] = v7;
        *(_WORD *)&v54[12] = 2112;
        *(void *)&v54[14] = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "\"\\\"No local modDate, assetDetail has modDate:%@  for assetDetail %@ \\\"\"", v54, 0x16u);
      }
    }
    goto LABEL_21;
  }
  if (v5 && v6)
  {
    v19 = +[BULogUtilities shared];
    unsigned int v20 = [v19 verboseLoggingEnabled];

    if (v20)
    {
      id v21 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = [(BKLibraryAsset *)self title];
        *(_DWORD *)v54 = 138412802;
        *(void *)&v54[4] = v5;
        *(_WORD *)&v54[12] = 2112;
        *(void *)&v54[14] = v7;
        *(_WORD *)&v54[22] = 2112;
        v55 = v22;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "\"\\\"local has modDate:%@, assetDetail has modDate:%@ for assetDetail %@\\\"\"", v54, 0x20u);
      }
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_21;
    }
  }
  [v7 timeIntervalSinceReferenceDate];
  double v24 = v23;
  [(id)v5 timeIntervalSinceReferenceDate];
  if (v24 <= v25)
  {
    [v7 timeIntervalSinceReferenceDate];
    double v52 = v51;
    [(id)v5 timeIntervalSinceReferenceDate];
    if (v52 >= v53) {
      goto LABEL_40;
    }
    id v14 = BKLibraryAssetDetailsLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    id v15 = [(BKLibraryAsset *)self assetID];
    *(_DWORD *)v54 = 138412290;
    *(void *)&v54[4] = v15;
    uint64_t v16 = "BKLibraryAsset Not Taking changes from asset detail as my mod date is > detail mod date for asset: %@";
    goto LABEL_11;
  }
LABEL_21:
  unsigned int v26 = [(BKLibraryAsset *)self isFinished];
  if (v26 != [v4 isFinished]) {
    -[BKLibraryAsset setIsFinished:](self, "setIsFinished:", [v4 isFinished]);
  }
  unsigned int v27 = [(BKLibraryAsset *)self notFinished];
  if (v27 != [v4 notFinished]) {
    -[BKLibraryAsset setNotFinished:](self, "setNotFinished:", [v4 notFinished]);
  }
  v28 = [v4 dateFinished];
  [(BKLibraryAsset *)self setDifferentDate:v28 forKey:@"dateFinished"];

  LODWORD(v28) = [(BKLibraryAsset *)self finishedDateKind];
  if (v28 != [v4 finishedDateKind]) {
    -[BKLibraryAsset setFinishedDateKind:](self, "setFinishedDateKind:", [v4 finishedDateKind]);
  }
  v29 = [v4 lastOpenDate];
  [(BKLibraryAsset *)self setDifferentDate:v29 forKey:@"lastOpenDate"];

  LODWORD(v29) = [(BKLibraryAsset *)self taste];
  if (v29 != [v4 taste]) {
    -[BKLibraryAsset setTaste:](self, "setTaste:", [v4 taste]);
  }
  unsigned int v30 = [(BKLibraryAsset *)self tasteSyncedToStore];
  if (v30 != [v4 tasteSyncedToStore]) {
    -[BKLibraryAsset setTasteSyncedToStore:](self, "setTasteSyncedToStore:", [v4 tasteSyncedToStore]);
  }
  if ([(BKLibraryAsset *)self hasChanges])
  {
    [(BKLibraryAsset *)self setAssetDetailsModificationDate:v7];
    id v14 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(BKLibraryAsset *)self assetID];
      *(_DWORD *)v54 = 138412546;
      *(void *)&v54[4] = v15;
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v4;
      uint64_t v16 = "BKLibraryAsset %@ Configured with changes: %@";
LABEL_37:
      uint64_t v17 = v14;
      uint32_t v18 = 22;
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v31 = +[BULogUtilities shared];
  unsigned int v32 = [v31 verboseLoggingEnabled];

  if (v32)
  {
    id v14 = BKLibraryAssetDetailsDevelopmentLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(BKLibraryAsset *)self assetID];
      *(_DWORD *)v54 = 138412546;
      *(void *)&v54[4] = v15;
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v4;
      uint64_t v16 = "\"\\\"BKLibraryAsset %@ Configure - No changes for libraryAsset from assetDetail %@\\\"\"";
      goto LABEL_37;
    }
LABEL_39:
  }
LABEL_40:
  if (![(BKLibraryAsset *)self isAudiobook]) {
    goto LABEL_54;
  }
  v33 = [v4 readingPositionLocationUpdateDate];

  if (!v33) {
    goto LABEL_54;
  }
  v34 = [(BKLibraryAsset *)self readingProgress];
  [v34 doubleValue];
  double v36 = v35;
  [v4 readingProgress];
  double v38 = vabdd_f64(v36, v37);

  if (v38 >= 0.00001)
  {
    [v4 readingProgress];
    v39 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [(BKLibraryAsset *)self setReadingProgress:v39];
  }
  v40 = [(BKLibraryAsset *)self bookHighWaterMarkProgress];
  [v40 doubleValue];
  double v42 = v41;
  [v4 readingProgressHighWaterMark];
  double v44 = vabdd_f64(v42, v43);

  if (v44 >= 0.00001)
  {
    [v4 readingProgressHighWaterMark];
    v50 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [(BKLibraryAsset *)self setBookHighWaterMarkProgress:v50];

LABEL_50:
    v47 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [(BKLibraryAsset *)self assetID];
      *(_DWORD *)v54 = 138412546;
      *(void *)&v54[4] = v48;
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v4;
      v49 = "BKLibraryAsset %@ Configured with reading progress changes: %@";
      goto LABEL_52;
    }
LABEL_53:

    goto LABEL_54;
  }
  if (v38 >= 0.00001) {
    goto LABEL_50;
  }
  v45 = +[BULogUtilities shared];
  unsigned int v46 = [v45 verboseLoggingEnabled];

  if (v46)
  {
    v47 = BKLibraryAssetDetailsDevelopmentLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = [(BKLibraryAsset *)self assetID];
      *(_DWORD *)v54 = 138412546;
      *(void *)&v54[4] = v48;
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v4;
      v49 = "\"\\\"BKLibraryAsset %@ Configure - No reading progress changes for libraryAsset from assetDetail %@\\\"\"";
LABEL_52:
      _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, v49, v54, 0x16u);

      goto LABEL_53;
    }
    goto LABEL_53;
  }
LABEL_54:
}

- (id)readingNowDetailRepresentation
{
  id v3 = objc_alloc((Class)BCMutableReadingNowDetail);
  id v4 = [(BKLibraryAsset *)self assetID];
  id v5 = [v3 initWithAssetID:v4];

  [v5 setIsTrackedAsRecent:[self isTrackedAsRecent]];
  uint64_t v6 = [(BKLibraryAsset *)self lastEngagedDate];
  [v5 setLastEngagedDate:v6];

  uint64_t v7 = [(BKLibraryAsset *)self cloudAssetType];
  [v5 setCloudAssetType:v7];

  uint64_t v8 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_91C44(self, (uint64_t)v5, v8);
  }

  return v5;
}

- (BOOL)hasImportantReadingNowDetails
{
  if ([(BKLibraryAsset *)self isTrackedAsRecent]) {
    return 1;
  }
  id v4 = [(BKLibraryAsset *)self lastEngagedDate];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)configureFromReadingNowDetail:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryAsset *)self lastEngagedDate];
  uint64_t v6 = [v4 lastEngagedDate];
  uint64_t v7 = (char *)[v5 compare:v6];

  if (v7 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v8 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned int v9 = [(BKLibraryAsset *)self assetID];
      int v19 = 138412546;
      unsigned int v20 = v9;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "BKLibraryAsset %@ received unexpected Reading Now changes: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  long long v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isTrackedAsRecent]);
  [(BKLibraryAsset *)self setDifferentNumber:v10 forKey:@"isTrackedAsRecent"];

  long long v11 = [v4 lastEngagedDate];
  [(BKLibraryAsset *)self setDifferentDate:v11 forKey:@"lastEngagedDate"];

  if ([(BKLibraryAsset *)self hasChanges])
  {
    long long v12 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      unsigned int v13 = [(BKLibraryAsset *)self assetID];
      int v19 = 138412546;
      unsigned int v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      id v14 = "BKLibraryAsset %@ Configured with Reading Now changes: %@";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_0, v15, v16, v14, (uint8_t *)&v19, 0x16u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  uint64_t v17 = +[BULogUtilities shared];
  unsigned int v18 = [v17 verboseLoggingEnabled];

  if (v18)
  {
    long long v12 = BKLibraryAssetDetailsDevelopmentLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(BKLibraryAsset *)self assetID];
      int v19 = 138412546;
      unsigned int v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      id v14 = "\"\\\"BKLibraryAsset %@ Configure - No changes for libraryAsset from Reading Now %@\\\"\"";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }
LABEL_12:
  }
}

- (NSString)cloudAssetType
{
  if ([(BKLibraryAsset *)self isStore])
  {
    unsigned int v3 = [(BKLibraryAsset *)self isAudiobook];
    id v4 = (void **)&BDSCloudAssetTypeStoreEbook;
    id v5 = (void **)&BDSCloudAssetTypeStoreAudiobook;
  }
  else
  {
    unsigned int v3 = [(BKLibraryAsset *)self _isUbiquityItem];
    id v4 = (void **)&BDSCloudAssetTypeSideloadedLocal;
    id v5 = (void **)&BDSCloudAssetTypeSideloadedUbiquity;
  }
  if (v3) {
    id v4 = v5;
  }
  uint64_t v6 = *v4;

  return (NSString *)v6;
}

- (BOOL)_isUbiquityItem
{
  v2 = [(BKLibraryAsset *)self dataSourceIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.ibooks.datasource.ubiquity"];

  return v3;
}

- (BOOL)isAudiobook
{
  unsigned __int8 v3 = [(BKLibraryAsset *)self dataSourceIdentifier];
  BOOL v4 = ([v3 isEqualToString:@"com.apple.ibooks.datasource.audiobooks"] & 1) != 0
    || [(BKLibraryAsset *)self contentType] == 6;

  return v4;
}

- (BOOL)isBook
{
  unsigned int v3 = [(BKLibraryAsset *)self contentType];
  if (v3 != 1) {
    LOBYTE(v3) = [(BKLibraryAsset *)self contentType] == 3
  }
              || [(BKLibraryAsset *)self contentType] == 4;
  return v3;
}

- (BOOL)isPreorderBook
{
  v2 = [(BKLibraryAsset *)self expectedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isManagedBook
{
  v2 = [(BKLibraryAsset *)self dataSourceIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.ibooks.plist.managed"];

  return v3;
}

- (BOOL)isDeletable
{
  if ([(BKLibraryAsset *)self currentlyDownloading]
    || [(BKLibraryAsset *)self isSeriesItem])
  {
    return 0;
  }
  else
  {
    return ![(BKLibraryAsset *)self isContainer];
  }
}

- (BOOL)isPartOfSeries
{
  if ([(BKLibraryAsset *)self isContainer]) {
    return 0;
  }
  BOOL v4 = [(BKLibraryAsset *)self seriesID];
  if (v4)
  {
    id v5 = [(BKLibraryAsset *)self seriesID];
    BOOL v3 = [v5 unsignedLongLongValue] != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (NSString)shortBookTitle
{
  v2 = [(BKLibraryAsset *)self title];
  id v3 = [v2 rangeOfString:@": "];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL
    && (id v3 = [v2 rangeOfString:@"; "], v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    && (id v3 = [v2 rangeOfString:@" / "], v3 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v2 substringToIndex:v3];
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (BOOL)currentlyUploading
{
  return 0;
}

- (void)setLastOpenDate:(id)a3
{
  id v18 = a3;
  id v4 = [(BKLibraryAsset *)self lastOpenDate];
  unsigned __int8 v5 = [v4 isEqual:v18];

  if ((v5 & 1) == 0)
  {
    [(BKLibraryAsset *)self willChangeValueForKey:@"lastOpenDate"];
    [(BKLibraryAsset *)self setPrimitiveValue:v18 forKey:@"lastOpenDate"];
    [(BKLibraryAsset *)self didChangeValueForKey:@"lastOpenDate"];
    uint64_t v6 = [(BKLibraryAsset *)self seriesContainer];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      unsigned int v8 = [(BKLibraryAsset *)self isOwned];

      if (v8)
      {
        unsigned int v9 = [(BKLibraryAsset *)self lastOpenDate];
        [v9 timeIntervalSinceReferenceDate];
        double v11 = v10;
        long long v12 = [(BKLibraryAsset *)self seriesContainer];
        unsigned int v13 = [v12 lastOpenDate];
        [v13 timeIntervalSinceReferenceDate];
        double v15 = v14;

        if (v11 > v15)
        {
          os_log_type_t v16 = [(BKLibraryAsset *)self lastOpenDate];
          uint64_t v17 = [(BKLibraryAsset *)self seriesContainer];
          [v17 setLastOpenDate:v16];
        }
      }
    }
  }
}

- (int64_t)isRightToLeftValue
{
  return self->isRightToLeftValue;
}

- (void)setIsRightToLeftValue:(int64_t)a3
{
  self->isRightToLeftValue = a3;
}

- (BOOL)isDecompressing
{
  return self->isDecompressing;
}

- (void)setIsDecompressing:(BOOL)a3
{
  self->isDecompressing = a3;
}

- (void).cxx_destruct
{
}

- (BOOL)shouldBeInDownloadedCollection
{
  BOOL v3 = [(BKLibraryAsset *)self isLocal];
  if (v3)
  {
    if ([(BKLibraryAsset *)self isEphemeral]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(BKLibraryAsset *)self isContainer];
    }
  }
  return v3;
}

- (BOOL)shouldBeInMySamplesCollection
{
  unsigned int v3 = [(BKLibraryAsset *)self isSample];
  if (v3)
  {
    unsigned int v3 = [(BKLibraryAsset *)self isLocal];
    if (v3)
    {
      if ([(BKLibraryAsset *)self isEphemeral]) {
        LOBYTE(v3) = 0;
      }
      else {
        LOBYTE(v3) = ![(BKLibraryAsset *)self isContainer];
      }
    }
  }
  return v3;
}

@end