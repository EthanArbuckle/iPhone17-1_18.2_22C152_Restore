@interface NSString
+ (id)_maps_ridesharingETA:(id)a3 partySize:(id)a4;
+ (id)_maps_ridesharingPairDetailString:(id)a3 withPartySize:(id)a4;
+ (id)_maps_ridesharingPartySizeString:(id)a3;
+ (id)_maps_ridesharingScheduledPickupWindowStart:(id)a3 partySize:(id)a4;
+ (id)_maps_stringWithRemainingTime:(double)a3;
+ (id)distanceStringFromLocation:(id)a3 toCoordinate:(CLLocationCoordinate2D)a4 withMapItem:(id)a5 showsDistance:(BOOL *)a6 onlyUseThreshold:(BOOL)a7 maximumDistance:(id)a8 useShortThreshold:(BOOL)a9;
+ (id)distanceStringFromLocation:(id)a3 toMapItem:(id)a4 showsDistance:(BOOL *)a5;
- (BOOL)_maps_containsExcessiveHeightCharacters;
- (BOOL)_maps_isEqualToSearchStringForCurrentLocationSearchResult;
- (BOOL)_mapstest_isCurrentLocationString;
- (BOOL)maps_isSubstringStartingAtRangeEscaped:(_NSRange)a3;
- (CGSize)_maps_sizeWithFont:(id)a3;
- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4;
- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4 options:(int64_t)a5;
- (NSString)_maps_sha1Hash;
- (NSString)_maps_stringByTrimmingLeadingWhitespace;
- (NSString)sha1Hash;
- (id)_maps_dataFromDataDescription;
- (id)_maps_prefixMatchesForSearchString:(id)a3;
- (id)_rap_substringWithNumberOfCharacters:(unint64_t)a3;
- (id)stringByRemovingPunctuation;
- (int64_t)fileCreationDateDescendingSort:(id)a3;
- (unint64_t)_rap_charactersCount;
- (void)_maps_drawAtPoint:(CGPoint)a3 withFont:(id)a4;
- (void)_maps_drawInRect:(CGRect)a3 withFont:(id)a4;
@end

@implementation NSString

- (NSString)_maps_stringByTrimmingLeadingWhitespace
{
  v3 = +[NSCharacterSet whitespaceCharacterSet];
  if ([(NSString *)self length])
  {
    uint64_t v4 = 0;
    while (objc_msgSend(v3, "characterIsMember:", -[NSString characterAtIndex:](self, "characterAtIndex:", v4)))
    {
      if (++v4 >= [(NSString *)self length]) {
        goto LABEL_7;
      }
    }
    if (!v4) {
      goto LABEL_8;
    }
LABEL_7:
    v5 = [(NSString *)self substringFromIndex:v4];
  }
  else
  {
LABEL_8:
    v5 = self;
  }
  v6 = v5;

  return v6;
}

- (CGSize)_maps_sizeWithFont:(id)a3
{
  if (a3)
  {
    NSAttributedStringKey v12 = NSFontAttributeName;
    id v13 = a3;
    id v4 = a3;
    v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  else
  {
    v5 = 0;
  }
  [(NSString *)self sizeWithAttributes:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (a3)
  {
    NSAttributedStringKey v15 = NSFontAttributeName;
    id v16 = a3;
    id v7 = a3;
    double v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    double v8 = 0;
  }
  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", 0, v8, 0, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4 options:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  if (a3)
  {
    NSAttributedStringKey v17 = NSFontAttributeName;
    id v18 = a3;
    id v9 = a3;
    double v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }
  else
  {
    double v10 = 0;
  }
  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", a5, v10, 0, width, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)_maps_drawAtPoint:(CGPoint)a3 withFont:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    NSAttributedStringKey v9 = NSFontAttributeName;
    id v10 = a4;
    id v7 = a4;
    double v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    double v8 = 0;
  }
  -[NSString drawAtPoint:withAttributes:](self, "drawAtPoint:withAttributes:", v8, x, y);
}

- (void)_maps_drawInRect:(CGRect)a3 withFont:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    NSAttributedStringKey v11 = NSFontAttributeName;
    id v12 = a4;
    id v9 = a4;
    id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  else
  {
    id v10 = 0;
  }
  -[NSString drawInRect:withAttributes:](self, "drawInRect:withAttributes:", v10, x, y, width, height);
}

+ (id)_maps_ridesharingETA:(id)a3 partySize:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    double v6 = +[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", 60 * (void)[a3 unsignedIntegerValue], 1);
    id v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"%@ wait [ridesharing]" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = +[NSString _maps_ridesharingPairDetailString:a3 withPartySize:v5];

  return v9;
}

+ (id)_maps_ridesharingScheduledPickupWindowStart:(id)a3 partySize:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (qword_10160ECF8 != -1) {
      dispatch_once(&qword_10160ECF8, &stru_1012EAB08);
    }
    [(id)qword_10160ECF0 setTimeStyle:1];
    id v7 = +[NSLocale autoupdatingCurrentLocale];
    [(id)qword_10160ECF0 setLocale:v7];

    double v8 = [v5 timeZone];
    [(id)qword_10160ECF0 setTimeZone:v8];

    id v9 = +[NSCalendar autoupdatingCurrentCalendar];
    id v10 = [v9 dateFromComponents:v5];

    NSAttributedStringKey v11 = [(id)qword_10160ECF0 stringFromDate:v10];
    id v12 = [v5 timeZone];
    double v13 = [v12 abbreviation];

    double v14 = +[NSCalendar autoupdatingCurrentCalendar];
    double v15 = [v14 timeZone];
    double v16 = [v5 timeZone];
    id v17 = [v15 isEqualToTimeZone:v16];

    if (v17)
    {

      double v13 = 0;
    }
    uint64_t v32 = 0;
    id v18 = +[NSCalendar autoupdatingCurrentCalendar];
    v19 = [v5 timeZone];
    v20 = [v18 _navigation_transitRelativeDateStringForDate:v10 context:4 inTimeZone:v19 outUsedFormat:&v32];

    id v21 = [v5 hour];
    if (v13)
    {
      if (v21 == (id)1 || [v5 hour] == (id)13)
      {
        v22 = +[NSBundle mainBundle];
        v23 = v22;
        CFStringRef v24 = @"Pickup date and time with TimeZone [Ridesharing] at 1";
LABEL_14:
        v26 = [v22 localizedStringForKey:v24 value:@"localized string not found" table:0];

        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v20, v11);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        int v27 = 0;
        v25 = 0;
        goto LABEL_18;
      }
      v28 = +[NSBundle mainBundle];
      v29 = v28;
      CFStringRef v30 = @"Pickup date and time with timezone [Ridesharing] not at 1";
    }
    else
    {
      if (v21 == (id)1 || [v5 hour] == (id)13)
      {
        v22 = +[NSBundle mainBundle];
        v23 = v22;
        CFStringRef v24 = @"Pickup date and time [Ridesharing] at 1";
        goto LABEL_14;
      }
      v28 = +[NSBundle mainBundle];
      v29 = v28;
      CFStringRef v30 = @"Pickup date and time [Ridesharing] not at 1";
    }
    v26 = [v28 localizedStringForKey:v30 value:@"localized string not found" table:0];

    v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v20, v11);
    int v27 = 1;
LABEL_18:

    if (!v27) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v25 = 0;
LABEL_19:
  id v17 = +[NSString _maps_ridesharingPairDetailString:v25 withPartySize:v6];
LABEL_20:

  return v17;
}

+ (id)_maps_ridesharingPairDetailString:(id)a3 withPartySize:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSString string];
  double v8 = +[NSString _maps_ridesharingPartySizeString:v6];

  if (v5 && v8)
  {
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"detail • party size [ridesharing]" value:@"localized string not found" table:0];
    uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5, v8);

    id v7 = v9;
  }
  else
  {
    if (v5)
    {
      id v12 = v5;
    }
    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      id v12 = v8;
    }
    uint64_t v11 = (uint64_t)v12;
  }

  id v7 = (void *)v11;
LABEL_10:

  return v7;
}

+ (id)_maps_ridesharingPartySizeString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"[ridesharing] max party size" value:@"localized string not found" table:0];

    id v6 = [v3 unsignedLongLongValue];
    id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_maps_prefixMatchesForSearchString:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  id v8 = [v4 length];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1004E0250;
  v44[3] = &unk_1012ECF28;
  id v9 = v7;
  id v45 = v9;
  [v4 enumerateSubstringsInRange:0 options:v8 usingBlock:v44];
  id v10 = +[NSMutableArray array];
  NSUInteger v11 = [(NSString *)self length];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1004E025C;
  v42[3] = &unk_1012ECF28;
  id v12 = v10;
  id v43 = v12;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 1027, v42);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v9;
  id v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v33)
  {
    v31 = v5;
    uint64_t v32 = *(void *)v39;
    context = v6;
    id v28 = v4;
    CFStringRef v30 = v12;
    while (1)
    {
      uint64_t v13 = 0;
LABEL_4:
      if (*(void *)v39 != v32) {
        objc_enumerationMutation(obj);
      }
      double v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = [v12 copy];
      id v16 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (!v16) {
        break;
      }
      id v17 = v16;
      uint64_t v18 = *(void *)v35;
LABEL_8:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
        id v21 = [v20 objectAtIndexedSubscript:0];
        v22 = [v20 objectAtIndexedSubscript:1];
        id v23 = [v22 rangeValue];

        if (![v21 localizedStandardRangeOfString:v14]) {
          break;
        }

        if (v17 == (id)++v19)
        {
          id v17 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v17) {
            goto LABEL_8;
          }
          goto LABEL_18;
        }
      }
      CFStringRef v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v23, [v14 length]);
      id v5 = v31;
      [v31 addObject:v24];

      id v12 = v30;
      [v30 removeObject:v20];

      if ((id)++v13 != v33) {
        goto LABEL_4;
      }
      id v6 = context;
      id v4 = v28;
      id v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (!v33) {
        goto LABEL_17;
      }
    }
LABEL_18:

    id v25 = 0;
    id v4 = v28;
    id v5 = v31;
  }
  else
  {
LABEL_17:

    id v25 = v5;
  }

  return v25;
}

- (NSString)sha1Hash
{
  id v2 = [(NSString *)self dataUsingEncoding:4];
  CC_SHA1([v2 bytes], (CC_LONG)[v2 length], md);
  id v3 = objc_alloc_init((Class)NSMutableString);
  for (uint64_t i = 0; i != 20; ++i)
    [v3 appendFormat:@"%02x", md[i]];

  return (NSString *)v3;
}

- (BOOL)_maps_containsExcessiveHeightCharacters
{
  if (![(NSString *)self length]) {
    return 0;
  }
  id v3 = (void *)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  BOOL v4 = [(NSString *)self rangeOfCharacterFromSet:v3] != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (unint64_t)_rap_charactersCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100753898;
  v4[3] = &unk_1012F76B8;
  v4[4] = &v5;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, [(NSString *)self length], 2, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)_rap_substringWithNumberOfCharacters:(unint64_t)a3
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = sub_100103EDC;
  id v15 = sub_1001047F8;
  id v16 = 0;
  objc_initWeak(&location, self);
  NSUInteger v5 = [(NSString *)self length];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100753A60;
  v8[3] = &unk_1012F76E0;
  v8[4] = v17;
  v9[1] = (id)a3;
  objc_copyWeak(v9, &location);
  v8[5] = &v11;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  id v6 = (id)v12[5];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);

  return v6;
}

- (id)_maps_dataFromDataDescription
{
  NSUInteger v3 = [(NSString *)self length];
  BOOL v4 = objc_opt_new();
  NSUInteger v5 = +[NSScanner scannerWithString:self];
  if (([v5 isAtEnd] & 1) == 0)
  {
    do
    {
      unint64_t v7 = v3 - (void)[v5 scanLocation];
      int v9 = 0;
      [v5 scanHexInt:&v9];
      if (v7 < 5)
      {
        while (v7 != 2)
          [v4 appendBytes:&v8[v7--] length:1];
      }
      else
      {
        [v4 appendBytes:(char *)&v9 + 3 length:1];
        [v4 appendBytes:(char *)&v9 + 2 length:1];
        [v4 appendBytes:(char *)&v9 + 1 length:1];
        [v4 appendBytes:&v9 length:1];
      }
    }
    while (![v5 isAtEnd]);
  }

  return v4;
}

- (id)stringByRemovingPunctuation
{
  if (!qword_101610468)
  {
    uint64_t v3 = +[NSCharacterSet punctuationCharacterSet];
    BOOL v4 = (void *)qword_101610468;
    qword_101610468 = v3;
  }
  unint64_t v5 = [(NSString *)self length];
  id v6 = (char *)&v13 - ((2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  [(NSString *)self getCharacters:&v13];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  unsigned int v9 = 1;
  do
  {
    if (([(id)qword_101610468 characterIsMember:*(unsigned __int16 *)&v6[2 * v7]] & 1) == 0) {
      *(_WORD *)&v6[2 * v8++] = *(_WORD *)&v6[2 * v7];
    }
    uint64_t v7 = v9;
  }
  while (v5 > v9++);
  if (v8)
  {
    uint64_t v11 = +[NSString stringWithCharacters:v6 length:v8];
  }
  else
  {
LABEL_10:
    uint64_t v11 = self;
  }

  return v11;
}

+ (id)_maps_stringWithRemainingTime:(double)a3
{
  if (a3 < 0.0) {
    a3 = -a3;
  }
  return [a1 _navigation_stringWithSeconds:vcvtad_u64_f64(a3) abbreviated:1];
}

+ (id)distanceStringFromLocation:(id)a3 toMapItem:(id)a4 showsDistance:(BOOL *)a5
{
  id v8 = a4;
  id v9 = a3;
  [v8 _coordinate];
  id v10 = [a1 distanceStringFromLocation:v9 toCoordinate:v8 withMapItem:a5 showsDistance:0 onlyUseThreshold:0 maximumDistance:1 useShortThreshold:1];

  return v10;
}

+ (id)distanceStringFromLocation:(id)a3 toCoordinate:(CLLocationCoordinate2D)a4 withMapItem:(id)a5 showsDistance:(BOOL *)a6 onlyUseThreshold:(BOOL)a7 maximumDistance:(id)a8 useShortThreshold:(BOOL)a9
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  if (!v16) {
    goto LABEL_8;
  }
  uint64_t v19 = 0;
  if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
  {
    [v16 coordinate];
    GEOCalculateDistance();
    double v21 = v20;
    if (v18)
    {
      [v18 doubleValue];
      if (v21 > v22)
      {
LABEL_8:
        uint64_t v19 = 0;
        goto LABEL_9;
      }
    }
    CFStringRef v24 = [v17 _geoMapItem];
    double v25 = (double)[v24 _resultSnippetDistanceDisplayThreshold];

    if (v21 < v25
      || ([v17 _geoMapItem],
          v26 = objc_claimAutoreleasedReturnValue(),
          [v26 _resultSnippetLocationString],
          int v27 = objc_claimAutoreleasedReturnValue(),
          v27,
          v26,
          uint64_t v19 = 0,
          !v27)
      && !a7)
    {
      if (v21 <= 50.0 && a9)
      {
        id v28 = +[NSBundle mainBundle];
        v29 = [v28 localizedStringForKey:@"Less than %@" value:@"localized string not found" table:0];
        CFStringRef v30 = +[NSString _navigation_localizedStringForDistance:0 detail:1 unitFormat:0 locale:0 useMetric:0 useYards:50.0];
        uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v30);
      }
      else
      {
        *a6 = 1;
        uint64_t v19 = +[NSString _navigation_localizedStringForDistance:0 detail:1 unitFormat:0 locale:0 useMetric:0 useYards:v21];
      }
    }
  }
LABEL_9:

  return v19;
}

- (int64_t)fileCreationDateDescendingSort:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSFileManager defaultManager];
  id v6 = [v5 attributesOfItemAtPath:self error:0];
  uint64_t v7 = [v6 fileModificationDate];

  id v8 = +[NSFileManager defaultManager];
  id v9 = [v8 attributesOfItemAtPath:v4 error:0];
  id v10 = [v9 fileModificationDate];

  if ([v7 isEqualToDate:v10])
  {
    NSComparisonResult v11 = [(NSString *)self compare:v4];
  }
  else
  {
    [v7 timeIntervalSinceDate:v10];
    if (v12 <= 0.0) {
      NSComparisonResult v11 = NSOrderedDescending;
    }
    else {
      NSComparisonResult v11 = NSOrderedAscending;
    }
  }

  return v11;
}

- (BOOL)_maps_isEqualToSearchStringForCurrentLocationSearchResult
{
  uint64_t v3 = MKLocalizedStringForCurrentLocation();
  LOBYTE(self) = [(NSString *)self localizedCaseInsensitiveCompare:v3] == NSOrderedSame;

  return (char)self;
}

- (BOOL)maps_isSubstringStartingAtRangeEscaped:(_NSRange)a3
{
  if (!a3.location) {
    return 0;
  }
  uint64_t v3 = -[NSString substringWithRange:](self, "substringWithRange:", a3.location - 1, 1);
  unsigned __int8 v4 = [v3 isEqualToString:@"\\""];

  return v4;
}

- (BOOL)_mapstest_isCurrentLocationString
{
  return [(NSString *)self isEqualToString:@"CURRENT_LOCATION"];
}

- (NSString)_maps_sha1Hash
{
  id v2 = [(NSString *)self dataUsingEncoding:4];
  CC_SHA1([v2 bytes], (CC_LONG)[v2 length], md);
  id v3 = objc_alloc_init((Class)NSMutableString);
  for (uint64_t i = 0; i != 20; ++i)
    [v3 appendFormat:@"%02x", md[i]];

  return (NSString *)v3;
}

@end