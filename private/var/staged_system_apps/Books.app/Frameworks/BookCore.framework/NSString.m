@interface NSString
+ (NSString)stringWithDuration:(double)a3;
+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4;
+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4 adjustedForRate:(double)a5;
+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4 showsHours:(BOOL *)a5;
+ (NSString)stringWithDuration:(double)a3 unitStyle:(int64_t)a4 explicitPositive:(BOOL)a5 showsHours:(BOOL *)a6;
+ (id)UUID;
+ (id)_readingProgressFormatter;
+ (id)bc_formattedReadingProgress:(id)a3 isFinished:(BOOL)a4;
+ (id)bc_formattedReadingProgress:(id)a3 max:(float)a4;
+ (id)queryStringFromDictionary:(id)a3;
+ (id)stringForBCContentType:(int64_t)a3;
- (BOOL)bc_hasMatchInRegexPatterns:(id)a3;
- (BOOL)containsSubstring:(id)a3;
- (BOOL)imIsDefaultWritingMode;
- (BOOL)imIsHorizontalWritingMode;
- (BOOL)imIsVerticalWritingMode;
- (BOOL)isNotWhitespace;
- (BOOL)isWhitespace;
- (NSString)bc_redactedCFIString;
- (NSString)stringWithPercentEscape;
- (id)URLFragmentString;
- (id)flattenedAnnotationString;
- (id)imSanitizedFontFamilyName;
- (id)im_stringByCollapsingRunsOfWhitespaceAndNewlines;
- (id)im_stringByReplacingNewLinesWithHTMLBreaks;
- (id)im_stringByStrippingHTML;
- (id)im_stringByUnescapingHTMLEntities;
- (id)im_stringWithPathRelativeTo:(id)a3;
- (id)im_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4;
- (id)im_uppercaseStringWithLocale:(id)a3;
- (id)stringByConvertingControlCharactersToSpace;
- (id)stringByConvertingNewlineCharacterSetToSpace;
- (id)stringByEnclosingInQuotes;
- (id)stringByRemovingEnclosingQuotations;
- (id)stringByRemovingURLFragment;
- (id)stringByTruncatingToLength:(unint64_t)a3 options:(unint64_t)a4 truncationString:(id)a5;
- (int64_t)bcAssetContentType;
- (unint64_t)ae_occurrenceCountOfString:(id)a3;
- (unint64_t)tokenCountWithEnumerationOptions:(unint64_t)a3 maxTokenCount:(unint64_t)a4 outLimitLength:(unint64_t *)a5;
- (unint64_t)unsignedLongLongValue;
@end

@implementation NSString

+ (id)_readingProgressFormatter
{
  if (qword_3456B8 != -1) {
    dispatch_once(&qword_3456B8, &stru_2C5F20);
  }
  v2 = (void *)qword_3456B0;

  return v2;
}

+ (id)UUID
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);

  return v3;
}

- (NSString)bc_redactedCFIString
{
  CFUUIDRef v2 = self;
  if ([(NSString *)v2 hasPrefix:@"epubcfi(")]
  {
    id v10 = 0;
    v3 = +[NSRegularExpression regularExpressionWithPattern:@"\\[\\w+\\]" options:1 error:&v10];
    id v4 = v10;
    if (!v3)
    {
      v5 = BCIMLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1EAF3C((uint64_t)v4, v5);
      }
    }
    [v3 stringByReplacingMatchesInString:v2 options:0 range:[NSString length]:[redacted]];
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = v2;
  }
  v8 = v7;

  return v8;
}

- (id)URLFragmentString
{
  v3 = (char *)[(NSString *)self rangeOfString:@"#"];
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSString *)self substringFromIndex:v3 + 1];
  }

  return v4;
}

- (id)stringByRemovingURLFragment
{
  CFUUIDRef v2 = self;
  id v3 = [(NSString *)v2 rangeOfString:@"#"];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(NSString *)v2 substringToIndex:v3];

    CFUUIDRef v2 = (NSString *)v4;
  }

  return v2;
}

- (id)stringByConvertingControlCharactersToSpace
{
  id v3 = +[NSCharacterSet controlCharacterSet];
  uint64_t v4 = (char *)[(NSString *)self rangeOfCharacterFromSet:v3];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = self;
  }
  else
  {
    v7 = v4;
    uint64_t v8 = v5;
    v6 = +[NSMutableString stringWithString:self];
    v9 = &v7[v8];
    id v10 = (char *)((unsigned char *)[(NSString *)v6 length] - &v7[v8]);
    do
    {
      [(NSString *)v6 replaceCharactersInRange:v7, v8, @" " withString];
      v11 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v6, "rangeOfCharacterFromSet:options:range:", v3, 0, v9, v10);
      uint64_t v13 = (uint64_t)&v11[v12 - (void)&v7[v8]];
      v9 += v13;
      v10 -= v13;
      uint64_t v8 = v12;
      v7 = v11;
    }
    while (v11 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (id)stringByConvertingNewlineCharacterSetToSpace
{
  id v3 = +[NSCharacterSet newlineCharacterSet];
  uint64_t v4 = (char *)[(NSString *)self rangeOfCharacterFromSet:v3];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = self;
  }
  else
  {
    v7 = v4;
    uint64_t v8 = v5;
    v6 = +[NSMutableString stringWithString:self];
    v9 = &v7[v8];
    id v10 = (char *)((unsigned char *)[(NSString *)v6 length] - &v7[v8]);
    do
    {
      [(NSString *)v6 replaceCharactersInRange:v7, v8, @" " withString];
      v11 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v6, "rangeOfCharacterFromSet:options:range:", v3, 0, v9, v10);
      uint64_t v13 = (uint64_t)&v11[v12 - (void)&v7[v8]];
      v9 += v13;
      v10 -= v13;
      uint64_t v8 = v12;
      v7 = v11;
    }
    while (v11 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (NSString)stringWithPercentEscape
{
  CFUUIDRef v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)self, @"#", @"\uFFFC=,!$&'()*+;@?\n\"<>\t :",
                       0x8000100u);

  return (NSString *)v2;
}

- (BOOL)containsSubstring:(id)a3
{
  return [(NSString *)self rangeOfString:a3 options:2] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isWhitespace
{
  id v3 = +[NSCharacterSet whitespaceCharacterSet];
  uint64_t v4 = [(NSString *)self stringByTrimmingCharactersInSet:v3];
  BOOL v5 = [v4 length] == 0;

  return v5;
}

- (BOOL)isNotWhitespace
{
  return ![(NSString *)self isWhitespace];
}

+ (NSString)stringWithDuration:(double)a3
{
  return (NSString *)_[a1 stringWithDuration:0 explicitPositive:0 showsHours:a3];
}

+ (id)bc_formattedReadingProgress:(id)a3 isFinished:(BOOL)a4
{
  LODWORD(v4) = 1065185444;
  if (a4) {
    *(float *)&double v4 = 1.0;
  }
  return [a1 bc_formattedReadingProgress:a3 max:v4];
}

+ (id)bc_formattedReadingProgress:(id)a3 max:(float)a4
{
  id v6 = a3;
  [v6 floatValue];
  if (*(float *)&v7 <= a4)
  {
    [v6 floatValue];
    if (v9 >= 0.01) {
      goto LABEL_6;
    }
    uint64_t v8 = &off_2EAFA8;
  }
  else
  {
    *(float *)&double v7 = a4;
    uint64_t v8 = +[NSNumber numberWithFloat:v7];
  }

  id v6 = v8;
LABEL_6:
  id v10 = [a1 _readingProgressFormatter];
  v11 = [v10 stringFromNumber:v6];

  return v11;
}

+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4
{
  return (NSString *)_[a1 stringWithDuration:a4 explicitPositive:0 showsHours:a3];
}

+ (NSString)stringWithDuration:(double)a3 unitStyle:(int64_t)a4 explicitPositive:(BOOL)a5 showsHours:(BOOL *)a6
{
  BOOL v7 = a5;
  double v10 = fabs(a3) + 0.5;
  v11 = objc_opt_new();
  uint64_t v12 = +[NSCalendar currentCalendar];
  [v11 setCalendar:v12];

  [v11 setUnitsStyle:a4];
  if (v10 >= 60.0) {
    uint64_t v13 = 224;
  }
  else {
    uint64_t v13 = 192;
  }
  [v11 setAllowedUnits:v13];
  [v11 setZeroFormattingBehavior:2 * (v10 >= 60.0)];
  if (a6) {
    *a6 = v10 > 3600.0;
  }
  v14 = [v11 stringFromTimeInterval:v10];
  if (v10 >= 1.0)
  {
    if (a3 >= 0.0 && v7)
    {
      v15 = IMCommonCoreBundle();
      v16 = v15;
      CFStringRef v17 = @"+%@";
LABEL_12:
      v18 = [v15 localizedStringForKey:v17 value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

      goto LABEL_14;
    }
    if (a3 < 0.0)
    {
      v15 = IMCommonCoreBundle();
      v16 = v15;
      CFStringRef v17 = @"-%@";
      goto LABEL_12;
    }
  }
  v18 = @"%@";
LABEL_14:
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v14);

  return (NSString *)v19;
}

+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4 showsHours:(BOOL *)a5
{
  return +[NSString stringWithDuration:0 unitStyle:a4 explicitPositive:a5 showsHours:a3];
}

+ (NSString)stringWithDuration:(double)a3 explicitPositive:(BOOL)a4 adjustedForRate:(double)a5
{
  if (fabs(a5) < 0.00999999978) {
    a5 = 1.0;
  }
  return +[NSString stringWithDuration:a4 explicitPositive:0 showsHours:a3 / a5];
}

+ (id)queryStringFromDictionary:(id)a3
{
  id v3 = a3;
  double v4 = +[NSMutableString stringWithCapacity:16];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    char v9 = 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKey:v11];
        uint64_t v13 = (void *)v12;
        if (v9) {
          CFStringRef v14 = @"%@=%@";
        }
        else {
          CFStringRef v14 = @"&%@=%@";
        }
        [v4 appendFormat:v14, v11, v12, v16];

        char v9 = 0;
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      char v9 = 0;
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)tokenCountWithEnumerationOptions:(unint64_t)a3 maxTokenCount:(unint64_t)a4 outLimitLength:(unint64_t *)a5
{
  if (a5) {
    *a5 = [(NSString *)self length];
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_63B80;
  v11[3] = &unk_2C5F48;
  v11[4] = &v12;
  v11[5] = a4;
  v11[6] = a5;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, [(NSString *)self length], a3, v11);
  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)stringByTruncatingToLength:(unint64_t)a3 options:(unint64_t)a4 truncationString:(id)a5
{
  id v8 = a5;
  if ([(NSString *)self length] <= a3)
  {
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    NSUInteger v9 = [(NSString *)self length];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_63D48;
    v16[3] = &unk_2C5F70;
    unint64_t v19 = a3;
    id v10 = v8;
    id v17 = v10;
    long long v18 = &v20;
    -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, a4, v16);
    unint64_t v11 = v21[3];
    if (!v11)
    {
      v21[3] = a3;
      unint64_t v11 = a3;
    }
    uint64_t v12 = [(NSString *)self substringToIndex:v11];
    uint64_t v13 = v12;
    if (v10)
    {
      uint64_t v14 = [(NSString *)v12 stringByAppendingString:v10];

      uint64_t v13 = (NSString *)v14;
    }

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

- (id)stringByEnclosingInQuotes
{
  CFUUIDRef v2 = [(NSString *)self stringByRemovingEnclosingQuotations];
  id v3 = IMCommonCoreBundle();
  double v4 = [v3 localizedStringForKey:@"\\U201C%@\\U201D" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v2);

  return v5;
}

- (id)im_uppercaseStringWithLocale:(id)a3
{
  CFLocaleRef v4 = (const __CFLocale *)a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(NSString *)self uppercaseStringWithLocale:v4];
  }
  else
  {
    id v6 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithString:self];
    CFStringUppercase(v6, v4);

    id v5 = 0;
  }

  return v5;
}

- (id)im_stringWithPathRelativeTo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSString *)self stringByStandardizingPath];
    id v6 = [v5 pathComponents];

    id v7 = [v4 stringByStandardizingPath];
    id v8 = [v7 pathComponents];

    NSUInteger v9 = (char *)[v6 count];
    id v10 = (char *)[v8 count];
    if (v9 < v10) {
      goto LABEL_10;
    }
    unint64_t v11 = (unint64_t)v10;
    if (!v10) {
      goto LABEL_8;
    }
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      uint64_t v14 = [v8 objectAtIndex:v12];
      uint64_t v15 = [v6 objectAtIndex:v12];
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) == 0) {
        break;
      }
      uint64_t v12 = v13;
    }
    while (v11 > v13++);
    if (v11 != v12)
    {
LABEL_10:
      long long v18 = 0;
    }
    else
    {
LABEL_8:
      if (v9 == (char *)v11)
      {
        long long v18 = &stru_2CE418;
      }
      else
      {
        uint64_t v20 = [v6 subarrayWithRange:v11, &v9[-v11]];
        long long v18 = +[NSString pathWithComponents:v20];
      }
    }
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)im_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = [(NSString *)self stringByStandardizingPath];
    id v8 = [v7 pathComponents];

    NSUInteger v9 = [v6 stringByStandardizingPath];
    id v10 = [v9 pathComponents];

    unint64_t v11 = (char *)[v8 count];
    uint64_t v12 = (char *)[v10 count];
    unsigned int v13 = v12;
    if (v12 >= v11) {
      unint64_t v14 = (unint64_t)v11;
    }
    else {
      unint64_t v14 = (unint64_t)v12;
    }
    if (v14)
    {
      uint64_t v15 = 0;
      unsigned __int8 v16 = 0;
      do
      {
        id v17 = [v10 objectAtIndex:v15];
        long long v18 = [v8 objectAtIndex:v15];
        unsigned int v19 = [v17 isEqualToString:v18];

        if (!v19) {
          break;
        }
        uint64_t v15 = ++v16;
      }
      while (v14 > v16);
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
    int64_t v21 = v13 - v16;
    if (v13 <= v16)
    {
      uint64_t v23 = &stru_2CE418;
    }
    else
    {
      uint64_t v22 = &stru_2CE418;
      do
      {
        uint64_t v23 = [(__CFString *)v22 stringByAppendingPathComponent:@".."];

        uint64_t v22 = v23;
        --v21;
      }
      while (v21);
    }
    if (v16 >= v11)
    {
      uint64_t v20 = v23;
    }
    else
    {
      do
      {
        v24 = [v8 objectAtIndex:v16];
        uint64_t v20 = [(__CFString *)v23 stringByAppendingPathComponent:v24];

        ++v16;
        uint64_t v23 = v20;
      }
      while (v11 != v16);
    }
  }
  else
  {
    uint64_t v20 = [(NSString *)self im_stringWithPathRelativeTo:v6];
  }

  return v20;
}

- (id)imSanitizedFontFamilyName
{
  CFUUIDRef v2 = [(NSString *)self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

  return v3;
}

- (BOOL)bc_hasMatchInRegexPatterns:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
      id v10 = objc_alloc((Class)NSRegularExpression);
      BOOL v11 = 1;
      id v12 = [v10 initWithPattern:v9 options:1 error:0 v15];
      id v13 = [v12 rangeOfFirstMatchInString:self options:0 range:[NSString length]:[self length]];

      if (v13 != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v11 = 0;
  }

  return v11;
}

- (id)stringByRemovingEnclosingQuotations
{
  if (qword_3456C8 != -1) {
    dispatch_once(&qword_3456C8, &stru_2C5F90);
  }
  id v3 = self;
  id v4 = -[NSString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", qword_3456C0, 0, 0, 1);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", v4, v5, &stru_2CE418);

    id v3 = (NSString *)v6;
  }
  if ([(NSString *)v3 length] >= 2)
  {
    id v7 = -[NSString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", qword_3456C0, 0, (char *)[(NSString *)v3 length] - 1, 1);
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", v7, v8, &stru_2CE418);

      id v3 = (NSString *)v9;
    }
  }

  return v3;
}

- (unint64_t)unsignedLongLongValue
{
  CFUUIDRef v2 = [(NSString *)self UTF8String];

  return strtoull(v2, 0, 0);
}

- (BOOL)imIsDefaultWritingMode
{
  if ([(NSString *)self imIsVerticalWritingMode]) {
    return 0;
  }
  else {
    return ![(NSString *)self imIsHorizontalWritingMode];
  }
}

- (BOOL)imIsHorizontalWritingMode
{
  return [(NSString *)self isEqualToString:@"horizontal"];
}

- (BOOL)imIsVerticalWritingMode
{
  return [(NSString *)self isEqualToString:@"vertical"];
}

- (id)im_stringByCollapsingRunsOfWhitespaceAndNewlines
{
  id v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [(NSString *)self componentsSeparatedByCharactersInSet:v3];

  uint64_t v5 = [v4 bu_objectsMatching:&stru_2C5FD0];
  uint64_t v6 = [v5 componentsJoinedByString:@" "];

  return v6;
}

- (id)im_stringByStrippingHTML
{
  id v2 = [(NSString *)self copy];
  id v3 = [v2 rangeOfString:@"<br[ /]*>" options:1024];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v2;
  }
  else
  {
    id v6 = v3;
    do
    {
      uint64_t v5 = [v2 stringByReplacingCharactersInRange:v6 withString:v4];

      id v6 = [v5 rangeOfString:@"<br[ /]*>" options:1024];
      id v2 = v5;
    }
    while (v6 != (id)0x7FFFFFFFFFFFFFFFLL);
  }
  id v7 = [v5 rangeOfString:@"<[^>]+>" options:1024];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v5;
  }
  else
  {
    id v10 = v7;
    do
    {
      uint64_t v9 = [v5 stringByReplacingCharactersInRange:v10 withString:v8];

      id v10 = [v9 rangeOfString:@"<[^>]+>" options:1024];
      uint64_t v5 = v9;
    }
    while (v10 != (id)0x7FFFFFFFFFFFFFFFLL);
  }
  BOOL v11 = [v9 im_stringByUnescapingHTMLEntities];

  return v11;
}

- (id)im_stringByUnescapingHTMLEntities
{
  id v2 = BC_CFXMLCreateStringByUnescapingEntities(kCFAllocatorDefault, (CFStringRef)self, 0);

  return v2;
}

- (id)im_stringByReplacingNewLinesWithHTMLBreaks
{
  NSUInteger v3 = [(NSString *)self length];

  return [(NSString *)self stringByReplacingOccurrencesOfString:@"\n", @"<br>\n", 2, 0, v3 withString options range];
}

- (id)flattenedAnnotationString
{
  if (qword_345CC0 != -1) {
    dispatch_once(&qword_345CC0, &stru_2C8B90);
  }
  NSUInteger v3 = [(NSString *)self componentsSeparatedByCharactersInSet:qword_345CB8];
  uint64_t v4 = [v3 componentsJoinedByString:@" "];

  return v4;
}

- (unint64_t)ae_occurrenceCountOfString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    NSUInteger v5 = [(NSString *)self length];
    unint64_t v6 = 0;
    id v7 = 0;
    do
    {
      uint64_t v8 = (char *)-[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v4, 2, v7, v5);
      if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      ++v6;
      id v7 = &v8[v9];
      unint64_t v10 = [(NSString *)self length];
      NSUInteger v5 = v10 - (void)v7;
    }
    while (v10 <= [(NSString *)self length]);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)stringForBCContentType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return *(&off_2C9960 + a3);
  }
}

- (int64_t)bcAssetContentType
{
  if (qword_3492B8 != -1) {
    dispatch_once(&qword_3492B8, &stru_2C9940);
  }
  NSUInteger v3 = [(id)qword_3492B0 objectForKey:self];
  id v4 = v3;
  if (v3) {
    int64_t v5 = (int)[v3 intValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

@end