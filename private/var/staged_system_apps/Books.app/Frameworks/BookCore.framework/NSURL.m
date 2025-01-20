@interface NSURL
+ (BOOL)bc_BOOLFromResourceValue:(id)a3;
+ (BOOL)bc_isDownloadedWithResourceValue:(id)a3;
+ (BOOL)bc_isUbiquitousPromiseFromResourceDictionary:(id)a3;
+ (id)assetIDFromURL:(id)a3;
+ (id)supportediBooksInternalURLSchemes;
+ (id)supportediBooksStoreURLSchemes;
+ (id)supportediBooksURLSchemes;
+ (void)bc_datalessMaterializationOffForBlock:(id)a3;
+ (void)bc_setIOPolicyForThreadScope:(int)a3 type:(int)a4 forBlock:(id)a5;
+ (void)coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6;
+ (void)coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6;
- (BOOL)_actionMatchesString:(id)a3;
- (BOOL)_checkForBookStoreURLUsingRegularExpressions;
- (BOOL)_validateWithSheetInfo:(id)a3;
- (BOOL)bc_hasLegacyBookStoreScheme;
- (BOOL)bc_isBookStoreAddToWantToReadURL;
- (BOOL)bc_isBookStoreBuyNowURL;
- (BOOL)bc_isBookStoreStartListeningURL;
- (BOOL)bc_isBookStoreStartReadingURL;
- (BOOL)bc_isBookStoreViewInStoreURL;
- (BOOL)bc_isDownloaded;
- (BOOL)bc_isDownloading;
- (BOOL)bc_isUbiquitous;
- (BOOL)bc_isUbiquitousPromise;
- (BOOL)hasUnresolvedConflicts;
- (BOOL)isStoreBook;
- (BOOL)isStoreURL;
- (BOOL)isStoreURL_29693365;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (id)_defaultIXStoreSheetDictionary;
- (id)_lastModDateFormatter;
- (id)_valueForQueryItemWithName:(id)a3;
- (id)bc_pathWithoutPrecedingSlash;
- (void)bc_isBookStoreProductURLWithCompletion:(id)a3;
- (void)bc_isBookStoreURLWithCompletion:(id)a3;
- (void)bc_isStoreProductURLWithCompletion:(id)a3;
- (void)bc_isStoreURLWithCompletion:(id)a3;
@end

@implementation NSURL

- (BOOL)bc_hasLegacyBookStoreScheme
{
  v3 = [(NSURL *)self scheme];
  if ([v3 isEqualToString:@"itms-books"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    v5 = [(NSURL *)self scheme];
    unsigned __int8 v4 = [v5 isEqualToString:@"itms-bookss"];
  }
  return v4;
}

- (BOOL)bc_isBookStoreAddToWantToReadURL
{
  BOOL v3 = [(NSURL *)self bc_hasLegacyBookStoreScheme];
  if (v3)
  {
    LOBYTE(v3) = [(NSURL *)self _actionMatchesString:@"add-to-want-to-read"];
  }
  return v3;
}

- (BOOL)bc_isBookStoreBuyNowURL
{
  BOOL v3 = [(NSURL *)self bc_hasLegacyBookStoreScheme];
  if (v3)
  {
    LOBYTE(v3) = [(NSURL *)self _actionMatchesString:@"buy-now"];
  }
  return v3;
}

- (BOOL)bc_isBookStoreViewInStoreURL
{
  BOOL v3 = [(NSURL *)self bc_hasLegacyBookStoreScheme];
  if (v3)
  {
    LOBYTE(v3) = [(NSURL *)self _actionMatchesString:@"view-in-store"];
  }
  return v3;
}

- (BOOL)bc_isBookStoreStartReadingURL
{
  BOOL v3 = [(NSURL *)self bc_hasLegacyBookStoreScheme];
  if (v3)
  {
    LOBYTE(v3) = [(NSURL *)self _actionMatchesString:@"start-reading"];
  }
  return v3;
}

- (BOOL)bc_isBookStoreStartListeningURL
{
  BOOL v3 = [(NSURL *)self bc_hasLegacyBookStoreScheme];
  if (v3)
  {
    LOBYTE(v3) = [(NSURL *)self _actionMatchesString:@"start-listening"];
  }
  return v3;
}

+ (id)supportediBooksURLSchemes
{
  if (qword_3455C0 != -1) {
    dispatch_once(&qword_3455C0, &stru_2C50A8);
  }
  BOOL v3 = (void *)qword_3455B8;
  unsigned __int8 v4 = [a1 supportediBooksStoreURLSchemes];
  v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

+ (id)supportediBooksInternalURLSchemes
{
  if (qword_3455D0 != -1) {
    dispatch_once(&qword_3455D0, &stru_2C50C8);
  }
  BOOL v3 = (void *)qword_3455C8;
  unsigned __int8 v4 = [a1 supportediBooksStoreURLSchemes];
  v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

+ (id)supportediBooksStoreURLSchemes
{
  if (qword_3455E0 != -1) {
    dispatch_once(&qword_3455E0, &stru_2C50E8);
  }
  v2 = (void *)qword_3455D8;

  return v2;
}

+ (id)assetIDFromURL:(id)a3
{
  return [a3 bu_assetIDFromURL];
}

- (BOOL)_checkForBookStoreURLUsingRegularExpressions
{
  if (qword_3455F8 != -1) {
    dispatch_once(&qword_3455F8, &stru_2C5108);
  }
  BOOL v3 = [(NSURL *)self host];
  unsigned __int8 v4 = v3;
  if (!qword_3455E8
    || (objc_msgSend(v3, "bc_hasMatchInRegexPatterns:") ? (BOOL v5 = qword_3455F0 == 0) : (BOOL v5 = 1), v5))
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    id v7 = [objc_alloc((Class)NSURLComponents) initWithURL:self resolvingAgainstBaseURL:0];
    id v8 = [v7 rangeOfPath];
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [(NSURL *)self path];
    }
    else
    {
      id v10 = v8;
      v11 = [v7 string];
      v9 = [v11 substringFromIndex:v10];
    }
    unsigned __int8 v6 = [v9 bc_hasMatchInRegexPatterns:qword_3455F0];
  }
  return v6;
}

- (void)bc_isBookStoreProductURLWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BUBag defaultBag];
  unsigned __int8 v6 = [v5 ixStoreSheetBooks];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3A5D0;
  v8[3] = &unk_2C5130;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 jsa_valueWithCompletion:v8];
}

- (void)bc_isBookStoreURLWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(NSURL *)self host];
    if ([v5 length])
    {
      unsigned __int8 v6 = [(NSURL *)self path];
      id v7 = [v6 length];

      if (v7)
      {
        id v8 = dispatch_group_create();
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x3032000000;
        v38[3] = sub_3AAB8;
        v38[4] = sub_3AAC8;
        id v39 = 0;
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x3032000000;
        v36[3] = sub_3AAB8;
        v36[4] = sub_3AAC8;
        id v37 = 0;
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x3032000000;
        v34[3] = sub_3AAB8;
        v34[4] = sub_3AAC8;
        id v35 = 0;
        dispatch_group_enter(v8);
        id v9 = +[BUBag defaultBag];
        id v10 = [v9 p2LaunchEbookstoreHostPatterns];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_3AAD0;
        v31[3] = &unk_2C5158;
        v33 = v38;
        v11 = v8;
        v32 = v11;
        [v10 jsa_valueWithCompletion:v31];

        dispatch_group_enter(v11);
        v12 = +[BUBag defaultBag];
        v13 = [v12 p2LaunchEbookstorePathPatterns];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_3AB30;
        v28[3] = &unk_2C5158;
        v30 = v36;
        v14 = v11;
        v29 = v14;
        [v13 jsa_valueWithCompletion:v28];

        dispatch_group_enter(v14);
        v15 = +[BUBag defaultBag];
        v16 = [v15 p2LaunchAudioBookStorePathPatterns];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_3AB90;
        v25[3] = &unk_2C5158;
        v27 = v34;
        v17 = v14;
        v26 = v17;
        [v16 jsa_valueWithCompletion:v25];

        v18 = dispatch_get_global_queue(21, 0);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_3ABF0;
        v20[3] = &unk_2C5180;
        v20[4] = self;
        v22 = v38;
        v23 = v36;
        v24 = v34;
        id v21 = v4;
        dispatch_group_notify(v17, v18, v20);

        _Block_object_dispose(v34, 8);
        _Block_object_dispose(v36, 8);

        _Block_object_dispose(v38, 8);
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
    }
    v19 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3AAA4;
    block[3] = &unk_2C4280;
    v41 = v4;
    dispatch_async(v19, block);

    v17 = v41;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)bc_isStoreProductURLWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BUBag defaultBag];
  unsigned __int8 v6 = [v5 ixStoreSheet];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3ADDC;
  v8[3] = &unk_2C51A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 jsa_valueWithCompletion:v8];
}

- (void)bc_isStoreURLWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BUBag defaultBag];
  unsigned __int8 v6 = [v5 trustedDomains];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3AF5C;
  v8[3] = &unk_2C51D0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 jsa_valueWithCompletion:v8];
}

- (BOOL)isStoreURL
{
  if ([(NSURL *)self _checkForBookStoreURLUsingRegularExpressions]) {
    return 1;
  }
  id v4 = [(NSURL *)self host];
  if (v4)
  {
    BOOL v5 = [(NSURL *)self host];
    if ([v5 caseInsensitiveCompare:@"itunes.apple.com"])
    {
      unsigned __int8 v6 = [(NSURL *)self host];
      if ([v6 caseInsensitiveCompare:@"buy.itunes.apple.com"])
      {
        id v7 = [(NSURL *)self host];
        if ([v7 caseInsensitiveCompare:@"finance-app.itunes.apple.com"])
        {
          id v8 = [(NSURL *)self host];
          if ([v8 caseInsensitiveCompare:@"itun.es"])
          {
            id v9 = [(NSURL *)self host];
            char v3 = [v9 caseInsensitiveCompare:@"storepreview.apple.com"] == 0;
          }
          else
          {
            char v3 = 1;
          }
        }
        else
        {
          char v3 = 1;
        }
      }
      else
      {
        char v3 = 1;
      }
    }
    else
    {
      char v3 = 1;
    }
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isStoreURL_29693365
{
  if ([(NSURL *)self _checkForBookStoreURLUsingRegularExpressions]) {
    return 1;
  }
  id v4 = [(NSURL *)self host];
  BOOL v5 = [v4 lowercaseString];

  if (v5)
  {
    if (([v5 hasSuffix:@"itunes.apple.com"] & 1) != 0
      || ([v5 isEqualToString:@"itun.es"] & 1) != 0)
    {
      unsigned __int8 v3 = 1;
    }
    else
    {
      unsigned __int8 v3 = [v5 isEqualToString:@"itunes.com"];
    }
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)isStoreBook
{
  if (![(NSURL *)self isStoreURL]) {
    return 0;
  }
  unsigned __int8 v3 = [(NSURL *)self path];
  id v4 = [v3 lowercaseString];
  if ([v4 containsSubstring:@"/book/"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v6 = [(NSURL *)self path];
    id v7 = [v6 lowercaseString];
    if ([v7 containsSubstring:@"/books/isbn"])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      id v8 = [(NSURL *)self scheme];
      unsigned __int8 v5 = [v8 hasPrefix:@"itms-books"];
    }
  }

  return v5;
}

- (id)bc_pathWithoutPrecedingSlash
{
  v2 = [(NSURL *)self path];
  if ([v2 hasPrefix:@"/"])
  {
    do
    {
      unsigned __int8 v3 = [v2 substringFromIndex:([@"/" length])];

      v2 = v3;
    }
    while (([v3 hasPrefix:@"/"] & 1) != 0);
  }
  else
  {
    unsigned __int8 v3 = v2;
  }

  return v3;
}

- (id)_lastModDateFormatter
{
  v2 = +[NSThread currentThread];
  unsigned __int8 v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"_lastModDateFormatter"];

  if (!v4)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    [v4 setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"];
    id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
    [v4 setLocale:v5];

    unsigned __int8 v6 = +[NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [v4 setTimeZone:v6];

    id v7 = +[NSThread currentThread];
    id v8 = [v7 threadDictionary];
    [v8 setObject:v4 forKey:@"_lastModDateFormatter"];
  }

  return v4;
}

- (BOOL)_actionMatchesString:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self _valueForQueryItemWithName:@"action"];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)_valueForQueryItemWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self bu_dictionaryForQueryItems];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)_validateWithSheetInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 objectForKey:@"host-patterns"];
  unsigned __int8 v6 = BUDynamicCast();

  if (v6
    && ([(NSURL *)self host],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = objc_msgSend(v7, "bc_hasMatchInRegexPatterns:", v6),
        v7,
        !v8))
  {
    unsigned __int8 v17 = 0;
  }
  else
  {
    objc_opt_class();
    id v9 = [v4 objectForKey:@"path-patterns"];
    id v10 = BUDynamicCast();

    if (v10)
    {
      v11 = [(NSURL *)self path];
      id v12 = [v11 mutableCopy];

      if (v12)
      {
        v13 = [(NSURL *)self query];

        if (v13)
        {
          v14 = [(NSURL *)self query];
          [v12 appendFormat:@"?%@", v14];
        }
        v15 = [(NSURL *)self fragment];

        if (v15)
        {
          v16 = [(NSURL *)self fragment];
          [v12 appendFormat:@"#%@", v16];
        }
        unsigned __int8 v17 = [v12 bc_hasMatchInRegexPatterns:v10];
      }
      else
      {
        unsigned __int8 v17 = 0;
      }
    }
    else
    {
      unsigned __int8 v17 = 1;
    }
  }
  return v17;
}

- (id)_defaultIXStoreSheetDictionary
{
  return &off_2E7948;
}

- (BOOL)bc_isUbiquitous
{
  id v8 = 0;
  id v7 = 0;
  [(NSURL *)self getResourceValue:&v8 forKey:NSURLIsUbiquitousItemKey error:&v7];
  id v2 = v8;
  id v3 = v7;
  if (v3)
  {
    id v4 = BCIMLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1EDC84();
    }

    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [objc_opt_class() bc_BOOLFromResourceValue:v2];
  }

  return v5;
}

- (BOOL)hasUnresolvedConflicts
{
  id v3 = 0;
  [(NSURL *)self getResourceValue:&v3 forKey:NSURLUbiquitousItemHasUnresolvedConflictsKey error:0];
  return [v3 BOOLValue];
}

- (BOOL)bc_isDownloaded
{
  id v8 = 0;
  id v7 = 0;
  [(NSURL *)self getResourceValue:&v8 forKey:NSURLUbiquitousItemDownloadingStatusKey error:&v7];
  id v2 = v8;
  id v3 = v7;
  if (v3)
  {
    id v4 = BCIMLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1EDCEC();
    }

    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [objc_opt_class() bc_isDownloadedWithResourceValue:v2];
  }

  return v5;
}

- (BOOL)bc_isDownloading
{
  id v8 = 0;
  id v7 = 0;
  [(NSURL *)self getResourceValue:&v8 forKey:NSURLUbiquitousItemIsDownloadingKey error:&v7];
  id v2 = v8;
  id v3 = v7;
  if (v3)
  {
    id v4 = BCIMLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1EDD54();
    }

    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [objc_opt_class() bc_BOOLFromResourceValue:v2];
  }

  return v5;
}

- (BOOL)isUploaded
{
  id v3 = 0;
  [(NSURL *)self getResourceValue:&v3 forKey:NSURLUbiquitousItemIsUploadedKey error:0];
  return [v3 BOOLValue];
}

- (BOOL)isUploading
{
  id v3 = 0;
  [(NSURL *)self getResourceValue:&v3 forKey:NSURLUbiquitousItemIsUploadingKey error:0];
  return [v3 BOOLValue];
}

- (BOOL)bc_isUbiquitousPromise
{
  v10[0] = NSURLIsUbiquitousItemKey;
  v10[1] = NSURLUbiquitousItemDownloadingStatusKey;
  v10[2] = NSURLUbiquitousItemIsDownloadingKey;
  id v3 = +[NSArray arrayWithObjects:v10 count:3];
  id v9 = 0;
  id v4 = [(NSURL *)self resourceValuesForKeys:v3 error:&v9];
  id v5 = v9;

  if (v5)
  {
    unsigned __int8 v6 = BCIMLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1EDDBC();
    }

    unsigned __int8 v7 = 0;
  }
  else
  {
    unsigned __int8 v7 = [objc_opt_class() bc_isUbiquitousPromiseFromResourceDictionary:v4];
  }

  return v7;
}

+ (BOOL)bc_isUbiquitousPromiseFromResourceDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:NSURLIsUbiquitousItemKey];
  unsigned __int8 v6 = [a1 bc_BOOLFromResourceValue:v5];

  unsigned __int8 v7 = [v4 objectForKeyedSubscript:NSURLUbiquitousItemIsDownloadingKey];
  unsigned __int8 v8 = [a1 bc_BOOLFromResourceValue:v7];

  id v9 = [v4 objectForKeyedSubscript:NSURLUbiquitousItemDownloadingStatusKey];

  LOBYTE(a1) = [a1 bc_isDownloadedWithResourceValue:v9];
  return v6 & ((v8 | a1) ^ 1);
}

+ (BOOL)bc_BOOLFromResourceValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = BUDynamicCast();

  LOBYTE(v3) = [v4 BOOLValue];
  return (char)v3;
}

+ (BOOL)bc_isDownloadedWithResourceValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = BUDynamicCast();

  if ([v4 isEqualToString:NSURLUbiquitousItemDownloadingStatusCurrent]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:NSURLUbiquitousItemDownloadingStatusDownloaded];
  }

  return v5;
}

+ (void)bc_setIOPolicyForThreadScope:(int)a3 type:(int)a4 forBlock:(id)a5
{
  id v7 = a5;
  int v8 = getiopolicy_np(a4, 1);
  if (v8 == -1)
  {
    v14 = BKLibraryDataSourceUbiquityLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1EDE24();
    }
  }
  else
  {
    int v9 = v8;
    if (v8 != a3)
    {
      if (setiopolicy_np(a4, 1, a3))
      {
        id v10 = BKLibraryDataSourceUbiquityLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1EDEF4();
        }
      }
      id v11 = objc_retainBlock(v7);
      id v12 = v11;
      if (v11) {
        (*((void (**)(id))v11 + 2))(v11);
      }

      if ((v9 & 0x80000000) == 0 && setiopolicy_np(a4, 1, v9))
      {
        v13 = BKLibraryDataSourceUbiquityLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1EDE8C();
        }
      }
      goto LABEL_20;
    }
  }
  id v15 = objc_retainBlock(v7);
  v16 = v15;
  if (v15) {
    (*((void (**)(id))v15 + 2))(v15);
  }

LABEL_20:
}

+ (void)bc_datalessMaterializationOffForBlock:(id)a3
{
}

+ (void)coordinateReadingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  int v9 = (char *)a3;
  id v10 = a6;
  if (+[NSThread isMainThread])
  {
    id v11 = BCIMLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315650;
      id v15 = "+[NSURL(IMCoordinated) coordinateReadingItemAtURL:options:error:byAccessor:]";
      __int16 v16 = 2080;
      unsigned __int8 v17 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/NSURL+BCCoordinated.m";
      __int16 v18 = 1024;
      int v19 = 24;
      _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v14, 0x1Cu);
    }

    id v12 = BCIMLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "@\"This should not be called from the foreground thread. [URL: %@]\"", (uint8_t *)&v14, 0xCu);
    }
  }
  v13 = objc_opt_new();
  [v13 coordinateReadingItemAtURL:v9 options:a4 error:a5 byAccessor:v10];
}

+ (void)coordinateWritingItemAtURL:(id)a3 options:(unint64_t)a4 error:(id *)a5 byAccessor:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [v11 coordinateWritingItemAtURL:v10 options:a4 error:a5 byAccessor:v9];
}

@end