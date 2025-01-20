@interface AEAnnotation
+ (id)annotationsPredicate:(id)a3;
+ (id)highlightsPredicate:(id)a3;
+ (id)pageBookmarksPredicate:(id)a3;
+ (id)predicateForAnnotationsWithAssetID:(id)a3 ordinal:(int)a4;
- (BKLocation)location;
- (BOOL)isLocationSame:(id)a3;
- (int64_t)ordinal;
- (void)setLocation:(id)a3;
- (void)setOrdinal:(int64_t)a3;
@end

@implementation AEAnnotation

+ (id)predicateForAnnotationsWithAssetID:(id)a3 ordinal:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = +[AEAnnotation userAnnotationTypeValues];
  v7 = +[NSPredicate predicateWithFormat:@"annotationAssetID ==[n] %@ AND plLocationRangeStart == %d AND (annotationType IN %@) AND annotationDeleted == 0", v5, v4, v6, 0];

  return v7;
}

+ (id)annotationsPredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID ==[n] %@ AND (annotationType == %d) AND annotationDeleted == 0 AND plLocationRangeStart >= 0 AND annotationNote != ''", a3, 2];
}

+ (id)pageBookmarksPredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0", a3, 1, 0];
}

+ (id)highlightsPredicate:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0", a3, 2];
}

- (void)setLocation:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v7 cfiString];
    [(AEAnnotation *)self setAnnotationLocation:v4];

    [(AEAnnotation *)self setPlUserData:0];
  }
  else
  {
    if (v7)
    {
      id v5 = [v7 serializeLocationToData];
    }
    else
    {
      id v5 = 0;
    }
    [(AEAnnotation *)self setPlUserData:v5];
    [(AEAnnotation *)self setAnnotationLocation:0];
  }
  id v6 = [objc_alloc((Class)NSNumber) initWithInteger:[v7 ordinal]];
  [(AEAnnotation *)self setPlLocationRangeStart:v6];
}

- (BKLocation)location
{
  v3 = [(AEAnnotation *)self annotationLocation];
  if ([v3 length])
  {
    id v13 = 0;
    uint64_t v4 = +[BKEpubCFILocation locationForCFI:v3 error:&v13];
    id v5 = (char *)v13;
    if (v4) {
      goto LABEL_23;
    }
    id v6 = BCIMLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[AEAnnotation(BKBookmark) location]";
      __int16 v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/AlderModels/AEAnnotation+BKBookmark.m";
      __int16 v18 = 1024;
      int v19 = 89;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    id v7 = BCIMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "@\"Failed to create BKLocation from CFI {%@} error {%@}\"", buf, 0x16u);
    }
  }
  id v5 = [(AEAnnotation *)self plUserData];
  if (!v5)
  {
    uint64_t v4 = 0;
    goto LABEL_23;
  }
  v8 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:0];
  v9 = [v8 objectForKey:@"class"];
  if ([v9 isEqualToString:@"BKEpubLocation"])
  {
    uint64_t v4 = +[BKEpubLocation deserializeLocationFromDictionary:v8];
    BOOL v10 = [(AEAnnotation *)self annotationType] == 1
       || [(AEAnnotation *)self annotationType] == 3;
    [v4 setSinglePage:v10];
    goto LABEL_22;
  }
  if ([v9 isEqualToString:@"BKPageLocation"])
  {
    v11 = BKPageLocation;
  }
  else if ([v9 isEqualToString:@"BKLocation"])
  {
    v11 = BKLocation;
  }
  else
  {
    if (![v9 isEqualToString:@"BKEpubCFILocation"])
    {
      NSLog(@"Unknown Location Type: %@", v9);
      uint64_t v4 = 0;
      goto LABEL_22;
    }
    v11 = BKEpubCFILocation;
  }
  uint64_t v4 = [(__objc2_class *)v11 deserializeLocationFromDictionary:v8];
LABEL_22:

LABEL_23:

  return (BKLocation *)v4;
}

- (BOOL)isLocationSame:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self plUserData];

  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v4 cfiString];
      uint64_t v8 = [(AEAnnotation *)self annotationLocation];
      goto LABEL_6;
    }
LABEL_7:
    unsigned __int8 v10 = 0;
    goto LABEL_8;
  }
  id v6 = [(AEAnnotation *)self ordinal];
  if (v6 != [v4 ordinal]) {
    goto LABEL_7;
  }
  id v7 = [v4 serializeLocationToData];
  uint64_t v8 = [(AEAnnotation *)self plUserData];
LABEL_6:
  v9 = (void *)v8;
  unsigned __int8 v10 = [v7 isEqual:v8];

LABEL_8:
  return v10;
}

- (void)setOrdinal:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(AEAnnotation *)self setPlLocationRangeStart:v4];
}

- (int64_t)ordinal
{
  v2 = [(AEAnnotation *)self plLocationRangeStart];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

@end