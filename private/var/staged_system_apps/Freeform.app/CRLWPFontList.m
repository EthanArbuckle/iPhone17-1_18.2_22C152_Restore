@interface CRLWPFontList
+ (id)excludedFamilyNames;
+ (id)sharedInstance;
- (CRLWPFontList)init;
- (NSArray)recentBaseFonts;
- (NSArray)recentFontNames;
- (NSDictionary)knownFontFamilyFaces;
- (NSDictionary)knownFonts;
- (NSMutableArray)cachedAvailableFamilyFonts;
- (NSSet)downloadedFonts;
- (id)availableFontDescriptorsForAllFamilies;
- (id)availableFontFamilies;
- (id)baseFontWithDescriptor:(id)a3;
- (id)cacheKeyForFontDescriptor:(id)a3;
- (id)cacheKeyForFontWithPostScriptName:(id)a3 atSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6;
- (id)cachedFacesOfFontFamily:(id)a3;
- (id)description;
- (id)familiesForFontsInCollection:(__CTFontCollection *)a3;
- (id)familyNameFromFontDescriptor:(__CTFontDescriptor *)a3;
- (id)fontFacesForFontFamily:(id)a3;
- (id)fontForKey:(id)a3;
- (id)fontForPostscriptName:(id)a3;
- (id)fontForPostscriptName:(id)a3 atSize:(double)a4;
- (id)fontForPostscriptName:(id)a3 atSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6;
- (id)fontForStyles:(id)a3;
- (id)fontFromStyle:(id)a3;
- (id)fontPropertyResolver;
- (id)fontsForAvailableFamilies;
- (id)normalizeChangedFontUrlsToStrings:(id)a3 forKey:(id)a4;
- (id)postScriptNameForFamilyName:(id)a3;
- (id)sortedFontFamilies;
- (void)cacheFaces:(id)a3 forFontFamily:(id)a4;
- (void)cacheFont:(id)a3 forPostScriptName:(id)a4 atSize:(double)a5 bold:(BOOL)a6 italic:(BOOL)a7;
- (void)cacheFont:(id)a3 withKey:(id)a4;
- (void)downloadableFontsChanged:(id)a3;
- (void)dropFontsWithPSNamesInSet:(id)a3;
- (void)fontsChanged:(id)a3;
- (void)loadRecentFonts;
- (void)registerRecentFont:(id)a3;
- (void)reset;
- (void)saveRecentFontNames:(id)a3;
- (void)setCachedAvailableFamilyFonts:(id)a3;
- (void)setDownloadedFonts:(id)a3;
- (void)setFontPropertyResolver:(id)a3;
- (void)setKnownFontFamilyFaces:(id)a3;
- (void)setKnownFonts:(id)a3;
- (void)setRecentFontNames:(id)a3;
@end

@implementation CRLWPFontList

+ (id)sharedInstance
{
  if (qword_1016A9D78 != -1) {
    dispatch_once(&qword_1016A9D78, &stru_1014FDE08);
  }
  v2 = (void *)qword_1016A9D70;

  return v2;
}

+ (id)excludedFamilyNames
{
  if (qword_1016A9D88 != -1) {
    dispatch_once(&qword_1016A9D88, &stru_1014FDE28);
  }
  v2 = (void *)qword_1016A9D80;

  return v2;
}

- (CRLWPFontList)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPFontList;
  v2 = [(CRLWPFontList *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSDictionary dictionary];
    knownFonts = v2->_knownFonts;
    v2->_knownFonts = (NSDictionary *)v3;

    uint64_t v5 = +[NSDictionary dictionary];
    knownFontFamilyFaces = v2->_knownFontFamilyFaces;
    v2->_knownFontFamilyFaces = (NSDictionary *)v5;

    id fontPropertyResolver = v2->_fontPropertyResolver;
    v2->_id fontPropertyResolver = &stru_1014FDE68;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"downloadableFontsChanged:" name:@"CRLWPFontDownloadDidFinishNotification" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"fontsChanged:" name:kCTFontManagerRegisteredFontsChangedNotification object:0];

    [(CRLWPFontList *)v2 loadRecentFonts];
  }
  return v2;
}

- (void)loadRecentFonts
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  id v9 = [v3 arrayForKey:@"CRLWPFontRecentFontNames"];

  v4 = [v9 crl_arrayByMappingObjectsUsingBlock:&stru_1014FDEA8];
  uint64_t v5 = +[NSPredicate predicateWithBlock:&stru_1014FDEE8];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  [(CRLWPFontList *)self setRecentFontNames:v6];
  v7 = [(CRLWPFontList *)self recentFontNames];

  if (!v7)
  {
    v8 = +[NSArray array];
    [(CRLWPFontList *)self setRecentFontNames:v8];
  }
}

- (id)familiesForFontsInCollection:(__CTFontCollection *)a3
{
  uint64_t v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  CFArrayRef v6 = CTFontCollectionCreateMatchingFontDescriptors(a3);
  id v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = -[CRLWPFontList familyNameFromFontDescriptor:](self, "familyNameFromFontDescriptor:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)availableFontDescriptorsForAllFamilies
{
  CTFontCollectionRef v3 = CTFontCollectionCreateFromAvailableFonts(0);
  v4 = +[NSMutableArray array];
  if (v3)
  {
    uint64_t v5 = [(id)objc_opt_class() excludedFamilyNames];
    mandatoryAttributes = +[NSSet setWithObject:kCTFontFamilyNameAttribute];
    CFArrayRef v6 = +[NSMutableDictionary dictionary];
    CTFontCollectionRef cf = v3;
    [(CRLWPFontList *)self familiesForFontsInCollection:v3];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if (([v5 containsObject:v11] & 1) == 0)
          {
            CFStringRef v37 = kCTFontFamilyNameAttribute;
            uint64_t v38 = v11;
            CFDictionaryRef v12 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
            long long v13 = CTFontDescriptorCreateWithAttributes(v12);

            if (v13)
            {
              CTFontDescriptorRef MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v13, (CFSetRef)mandatoryAttributes);
              if (MatchingFontDescriptor)
              {
                CTFontDescriptorRef v15 = MatchingFontDescriptor;
                [v6 setObject:MatchingFontDescriptor forKeyedSubscript:v11];
              }
              CFRelease(v13);
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v8);
    }
    long long v16 = [v6 allKeys];
    v17 = [v16 sortedArrayUsingSelector:"compare:"];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
          [v4 addObject:v23];
        }
        id v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v20);
    }

    CFRelease(cf);
  }

  return v4;
}

- (id)sortedFontFamilies
{
  CTFontCollectionRef v3 = [(CRLWPFontList *)self availableFontDescriptorsForAllFamilies];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v23 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(CRLWPFontList *)self familyNameFromFontDescriptor:*(void *)(*((void *)&v26 + 1) + 8 * (void)v10)];
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            unsigned int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDF08);
            }
            long long v13 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v31 = v12;
              __int16 v32 = 2082;
              long long v33 = "-[CRLWPFontList sortedFontFamilies]";
              __int16 v34 = 2082;
              long long v35 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m";
              __int16 v36 = 1024;
              int v37 = 190;
              __int16 v38 = 2082;
              v39 = "familyName";
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FDF28);
            }
            long long v14 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v17 = v14;
              id v18 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v31 = v12;
              __int16 v32 = 2114;
              long long v33 = v18;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            CTFontDescriptorRef v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList sortedFontFamilies]");
            long long v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 190, 0, "invalid nil value for '%{public}s'", "familyName");
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v8);
    }

    v4 = v23;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(id)objc_opt_class() excludedFamilyNames];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10049CCE0;
  v24[3] = &unk_1014E5CF0;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v25;
  [v5 crl_removeObjectsPassingTest:v24];
  id v20 = [v5 allObjects];
  uint64_t v21 = [v20 sortedArrayUsingSelector:"compare:"];

  return v21;
}

- (id)familyNameFromFontDescriptor:(__CTFontDescriptor *)a3
{
  CFStringRef v3 = (const __CFString *)CTFontDescriptorCopyAttribute(a3, kCTFontFamilyNameAttribute);
  v4 = (__CFString *)v3;
  if (v3 && CFStringHasPrefix(v3, @"."))
  {
    CFRelease(v4);
    v4 = 0;
  }

  return v4;
}

- (id)availableFontFamilies
{
  CFStringRef v3 = [(CRLWPFontList *)self sortedFontFamilies];
  v4 = [(CRLWPFontList *)self downloadedFonts];
  uint64_t v5 = [v4 allObjects];
  id v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (void)downloadableFontsChanged:(id)a3
{
  id v7 = [a3 object];
  v4 = [v7 objectForKeyedSubscript:@"CRLWPFontRegisteredByURLFamilyNames"];
  [(CRLWPFontList *)self registerDownloadedFontPostScriptNames:v4];

  uint64_t v5 = [v7 objectForKeyedSubscript:@"CRLWPFontDownloadMatchedNames"];
  [(CRLWPFontList *)self dropFontsWithPSNamesInSet:v5];
  id v6 = [v7 objectForKeyedSubscript:@"CRLWPFontDownloadUnmatchedNames"];
  [(CRLWPFontList *)self dropFontsWithPSNamesInSet:v6];
}

- (void)fontsChanged:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FDF48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9590();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FDF68);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList fontsChanged:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:282 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLWPFontList *)self setCachedAvailableFamilyFonts:0];
  id v8 = [(CRLWPFontList *)self normalizeChangedFontUrlsToStrings:v4 forKey:@"CTFontManagerAvailableFontURLsAdded"];
  uint64_t v9 = [(CRLWPFontList *)self normalizeChangedFontUrlsToStrings:v4 forKey:@"CTFontManagerAvailableFontURLsRemoved"];

  [(CRLWPFontList *)self dropFontsWithPSNamesInSet:v8];
  [(CRLWPFontList *)self dropFontsWithPSNamesInSet:v9];
  v12[0] = @"CRLWPFontsAdded";
  v12[1] = @"CRLWPFontsRemoved";
  v13[0] = v8;
  v13[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v11 = +[NSNotificationCenter defaultCenter];
  [v11 postNotificationName:@"CRLWPAvailableFontsChanged" object:0 userInfo:v10];
}

- (id)normalizeChangedFontUrlsToStrings:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v26 = +[NSMutableSet set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = [v5 userInfo];
  id v25 = v6;
  id v8 = [v7 objectForKeyedSubscript:v6];

  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = objc_opt_class();
        CTFontDescriptorRef v15 = sub_1002469D0(v14, v13);
        if (!v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CTFontDescriptorRef v15 = +[NSURL URLWithString:v13];
          }
          else
          {
            CTFontDescriptorRef v15 = 0;
          }
        }
        long long v16 = [v15 fragment];
        v17 = v16;
        if (v16 && ![v16 rangeOfString:@"postscript-name="])
        {
          unint64_t v19 = v18;
          id v20 = [v17 length];
          if (v19 <= (unint64_t)v20) {
            uint64_t v21 = v20;
          }
          else {
            uint64_t v21 = (unsigned char *)v19;
          }
          if (v19 >= (unint64_t)v20) {
            v22 = v20;
          }
          else {
            v22 = (unsigned char *)v19;
          }
          v23 = [v17 substringWithRange:v22, v21 - v22];
          [v26 addObject:v23];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  return v26;
}

- (id)postScriptNameForFamilyName:(id)a3
{
  return +[CRLWPFont postScriptNameForFamilyName:a3];
}

- (id)fontFacesForFontFamily:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLWPFontList *)self cachedFacesOfFontFamily:v4];
  if (!v5)
  {
    id v5 = +[CRLWPFont facesOfFontFamily:v4];
    [(CRLWPFontList *)self cacheFaces:v5 forFontFamily:v4];
  }

  return v5;
}

- (id)cachedFacesOfFontFamily:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLWPFontList *)self knownFontFamilyFaces];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)cacheFaces:(id)a3 forFontFamily:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRLWPFontList *)self knownFontFamilyFaces];
  id v9 = [v8 mutableCopy];

  [v9 setObject:v7 forKeyedSubscript:v6];
  [(CRLWPFontList *)self setKnownFontFamilyFaces:v9];
}

- (void)reset
{
  CFStringRef v3 = +[NSMutableDictionary dictionary];
  [(CRLWPFontList *)self setKnownFonts:v3];

  [(CRLWPFontList *)self setCachedAvailableFamilyFonts:0];
}

- (id)fontForPostscriptName:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLWPFontList *)self cacheKeyForFontWithPostScriptName:v4 atSize:0 bold:0 italic:0.0];
  id v6 = [(CRLWPFontList *)self fontForKey:v5];
  if (!v6)
  {
    id v6 = [[CRLWPFont alloc] initWithDesiredPostScriptName:v4 size:0.0];
    [(CRLWPFontList *)self cacheFont:v6 withKey:v5];
  }

  return v6;
}

- (id)fontForPostscriptName:(id)a3 atSize:(double)a4
{
  id v5 = [(CRLWPFontList *)self fontForPostscriptName:a3];
  id v6 = [v5 copyWithSize:a4];

  return v6;
}

- (id)fontForPostscriptName:(id)a3 atSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = [(CRLWPFontList *)self cacheKeyForFontWithPostScriptName:v10 atSize:v7 bold:v6 italic:a4];
  id v12 = [(CRLWPFontList *)self fontForKey:v11];
  if (!v12)
  {
    long long v13 = [(CRLWPFontList *)self fontForPostscriptName:v10];
    id v12 = [v13 copyWithSize:v7 bold:v6 italic:a4];
    [(CRLWPFontList *)self cacheFont:v12 withKey:v11];
  }

  return v12;
}

- (void)cacheFont:(id)a3 forPostScriptName:(id)a4 atSize:(double)a5 bold:(BOOL)a6 italic:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = [(CRLWPFontList *)self cacheKeyForFontWithPostScriptName:a4 atSize:v8 bold:v7 italic:a5];
  [(CRLWPFontList *)self cacheFont:v12 withKey:v13];
}

- (void)cacheFont:(id)a3 withKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRLWPFontList *)self knownFonts];
  id v9 = [v8 mutableCopy];

  [v9 setObject:v7 forKeyedSubscript:v6];
  [(CRLWPFontList *)self setKnownFonts:v9];
}

- (id)fontForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLWPFontList *)self knownFonts];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)cacheKeyForFontWithPostScriptName:(id)a3 atSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6
{
  return +[NSString stringWithFormat:@"%@|%f|%d|%d", a3, *(void *)&a4, a5, a6];
}

- (id)cacheKeyForFontDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 postscriptName];
  [v3 pointSize];
  uint64_t v6 = v5;

  id v7 = +[NSString stringWithFormat:@"%@|%f|%d|%d", v4, v6, 0, 0];

  return v7;
}

- (void)dropFontsWithPSNamesInSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLWPFontList *)self knownFonts];
  id v6 = [v5 mutableCopy];

  id v7 = [v6 allKeys];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10049DB28;
  v10[3] = &unk_1014FDF90;
  id v11 = v4;
  id v8 = v4;
  id v9 = [v7 crl_arrayByTransformingWithBlock:v10];
  [v6 removeObjectsForKeys:v9];
  [(CRLWPFontList *)self setKnownFonts:v6];
}

- (id)fontFromStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 valueForProperty:7];
  id v7 = sub_1002469D0(v5, v6);

  if (v7
    || (uint64_t v8 = objc_opt_class(),
        [v4 valueForProperty:9],
        id v9 = objc_claimAutoreleasedReturnValue(),
        sub_1002469D0(v8, v9),
        id v7 = objc_claimAutoreleasedReturnValue(),
        v9,
        v7))
  {
    id v10 = [(CRLWPFontList *)self fontForPostscriptName:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)fontsForAvailableFamilies
{
  id v3 = [(CRLWPFontList *)self cachedAvailableFamilyFonts];

  if (!v3)
  {
    id v4 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [(CRLWPFontList *)self availableFontDescriptorsForAllFamilies];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [(CRLWPFontList *)self baseFontWithDescriptor:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9)];
          [v4 addObject:v10];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [(CRLWPFontList *)self setCachedAvailableFamilyFonts:v4];
  }
  id v11 = [(CRLWPFontList *)self cachedAvailableFamilyFonts];

  return v11;
}

- (id)baseFontWithDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLWPFontList *)self cacheKeyForFontDescriptor:v4];
  id v6 = [(CRLWPFontList *)self fontForKey:v5];
  if (!v6)
  {
    id v6 = +[CRLWPFont baseFontWithDescriptor:v4];
    [(CRLWPFontList *)self cacheFont:v6 withKey:v5];
  }

  return v6;
}

- (id)fontForStyles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLWPFontList *)self fontPropertyResolver];
  id v6 = ((void (**)(void, id, uint64_t))v5)[2](v5, v4, 7);

  if (v6)
  {
    id v7 = v6;
LABEL_4:
    id v9 = [(CRLWPFontList *)self fontPropertyResolver];
    id v10 = ((void (**)(void, id, uint64_t))v9)[2](v9, v4, 1);

    id v11 = [(CRLWPFontList *)self fontPropertyResolver];
    id v12 = ((void (**)(void, id, uint64_t))v11)[2](v11, v4, 13);

    long long v13 = [(CRLWPFontList *)self fontPropertyResolver];
    long long v14 = ((void (**)(void, id, uint64_t))v13)[2](v13, v4, 11);

    long long v15 = [(CRLWPFontList *)self fontForPostscriptName:v7];
    [v14 doubleValue];
    id v17 = [v15 copyWithSize:[v10 BOOLValue] bold:[v12 BOOLValue] italic:v16];

    goto LABEL_5;
  }
  uint64_t v8 = [(CRLWPFontList *)self fontPropertyResolver];
  ((void (**)(void, id, uint64_t))v8)[2](v8, v4, 9);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7) {
    goto LABEL_4;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FDFB0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B96B8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FDFD0);
  }
  unint64_t v19 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v19);
  }
  id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList fontForStyles:]");
  uint64_t v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 482, 0, "invalid nil value for '%{public}s'", "currentFontName");

  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FDFF0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B9624();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FE010);
  }
  v22 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v22);
  }
  v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList fontForStyles:]");
  v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"];
  +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:491 isFatal:0 description:"Failed to resolve font name"];

  id v7 = +[CRLWPFont missingFontPostScriptName];
  id v17 = [(CRLWPFontList *)self fontForPostscriptName:v7];
LABEL_5:

  return v17;
}

- (void)registerRecentFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE030);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9768();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE050);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontList registerRecentFont:]");
    id v6 = (CRLWPOpaqueFontID *)objc_claimAutoreleasedReturnValue();
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontList.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v8, 499, 0, "invalid nil value for '%{public}s'", "recentFont");
    goto LABEL_14;
  }
  if (([v4 isFallbackFont] & 1) == 0)
  {
    id v6 = [[CRLWPOpaqueFontID alloc] initWithFont:v5];
    id v7 = [(CRLWPFontList *)self recentFontNames];
    id v8 = [v7 mutableCopy];

    [v8 removeObject:v6];
    [v8 insertObject:v6 atIndex:0];
    [v8 crl_trimObjectsFromIndex:6];
    id v9 = [(CRLWPFontList *)self recentFontNames];
    unsigned __int8 v10 = [v9 isEqualToArray:v8];

    if ((v10 & 1) == 0)
    {
      [(CRLWPFontList *)self setRecentFontNames:v8];
      [(CRLWPFontList *)self saveRecentFontNames:v8];
      id v11 = +[NSNotificationCenter defaultCenter];
      [v11 postNotificationName:@"CRLWPRecentsFontsChangedNotification" object:v5];
    }
LABEL_14:
  }
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = +[NSMutableString stringWithFormat:@"%@: <%p> Known Fonts: \n", v4, self];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(CRLWPFontList *)self knownFonts];
  id v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 appendFormat:@"\t%@\n", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v5;
}

- (NSArray)recentBaseFonts
{
  v2 = [(CRLWPFontList *)self recentFontNames];
  id v3 = [v2 crl_arrayByMappingObjectsUsingBlock:&stru_1014FE090];

  id v4 = +[NSPredicate predicateWithBlock:&stru_1014FE0B0];
  uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

  return (NSArray *)v5;
}

- (void)saveRecentFontNames:(id)a3
{
  [a3 crl_arrayByMappingObjectsUsingBlock:&stru_1014FE0F0];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setObject:v4 forKey:@"CRLWPFontRecentFontNames"];
}

- (NSDictionary)knownFonts
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKnownFonts:(id)a3
{
}

- (id)fontPropertyResolver
{
  return self->_fontPropertyResolver;
}

- (void)setFontPropertyResolver:(id)a3
{
}

- (NSSet)downloadedFonts
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDownloadedFonts:(id)a3
{
}

- (NSDictionary)knownFontFamilyFaces
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKnownFontFamilyFaces:(id)a3
{
}

- (NSArray)recentFontNames
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecentFontNames:(id)a3
{
}

- (NSMutableArray)cachedAvailableFamilyFonts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedAvailableFamilyFonts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableFamilyFonts, 0);
  objc_storeStrong((id *)&self->_recentFontNames, 0);
  objc_storeStrong((id *)&self->_knownFontFamilyFaces, 0);
  objc_storeStrong((id *)&self->_downloadedFonts, 0);
  objc_storeStrong(&self->_fontPropertyResolver, 0);

  objc_storeStrong((id *)&self->_knownFonts, 0);
}

@end