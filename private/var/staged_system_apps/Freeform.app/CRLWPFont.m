@interface CRLWPFont
+ (BOOL)isKeyValueProxyLeafType;
+ (BOOL)isSystemFontName:(id)a3;
+ (BOOL)isSystemUIFontIdentifier:(id)a3;
+ (BOOL)isSystemUIFontRef:(__CTFont *)a3;
+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3;
+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3 atSize:(double)a4;
+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3 fallbackFont:(id)a4 ofType:(unint64_t)a5;
+ (CRLWPFont)fontWithOpaqueIdentifier:(id)a3;
+ (id)baseFontForFamilyName:(id)a3;
+ (id)baseFontWithDescriptor:(id)a3;
+ (id)facesOfFontFamily:(id)a3;
+ (id)helveticaFont;
+ (id)loadPlatformFontForPostScriptName:(id)a3 size:(double)a4;
+ (id)loadPlatformFontOrFallbackForPostScriptName:(id)a3 size:(double)a4 foundType:(unint64_t *)a5;
+ (id)localizedFamilyNameForPlatformFont:(id)a3;
+ (id)localizedMasqueradingFontFamilyNames;
+ (id)masqueradingFontNames;
+ (id)missingFont;
+ (id)missingFontPostScriptName;
+ (id)postScriptNameForFamilyName:(id)a3;
+ (id)systemFont;
+ (id)systemFontOfSize:(double)a3 withWeight:(double)a4;
+ (id)systemFontWithWeight:(double)a3;
+ (id)systemUIFontName;
+ (unint64_t)optionsForLoadingPlatformFontWithPostScriptName:(id)a3;
- (BOOL)bold;
- (BOOL)isBaseFontEqualToBaseFontFor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFallbackFont;
- (BOOL)isMasqueradingFont;
- (BOOL)isMasqueradingFontName;
- (BOOL)isRequestedFont;
- (BOOL)italic;
- (CRLWPFont)baseFont;
- (CRLWPFont)init;
- (CRLWPFont)initWithDesiredPostScriptName:(id)a3;
- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 platformFontDescriptor:(id)a4 andPlatformFont:(id)a5 ofType:(unint64_t)a6;
- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 platformFontDescriptor:(id)a4 andPlatformFont:(id)a5 ofType:(unint64_t)a6 localizedFamilyName:(id)a7;
- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 size:(double)a4;
- (NSArray)creationBacktrace;
- (NSArray)familyFaces;
- (NSMutableDictionary)alternatePlatformFonts;
- (NSString)desiredPostScriptName;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)localizedFamilyName;
- (NSString)postScriptName;
- (UIFont)platformFont;
- (UIFontDescriptor)platformFontDescriptor;
- (__CTFont)ctFont;
- (__CTFont)ctFontForSize:(double)a3;
- (__CTFont)ctFontForSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5;
- (__CTFont)ctFontForSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5 traits:(id)a6;
- (double)size;
- (id)copyWithSize:(double)a3;
- (id)copyWithSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5;
- (id)copyWithSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5 traits:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)hashValue;
- (unint64_t)type;
- (void)setAlternatePlatformFonts:(id)a3;
- (void)setCreationBacktrace:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setHashValue:(unint64_t)a3;
- (void)setIsFallbackFont:(BOOL)a3;
- (void)setLocalizedFamilyName:(id)a3;
- (void)setPlatformFont:(id)a3;
- (void)setPlatformFontDescriptor:(id)a3;
- (void)setPostScriptName:(id)a3;
@end

@implementation CRLWPFont

+ (id)missingFontPostScriptName
{
  return @"Helvetica";
}

+ (id)missingFont
{
  v2 = [a1 missingFontPostScriptName];
  v3 = +[CRLWPFont fontWithDesiredPostScriptName:v2];

  return v3;
}

+ (id)helveticaFont
{
  return +[CRLWPFont fontWithDesiredPostScriptName:@"Helvetica"];
}

+ (id)systemUIFontName
{
  return +[CRLWPSystemFontNames baseName];
}

+ (id)systemFont
{
  return _[a1 systemFontWithWeight:UIFontWeightRegular];
}

+ (id)systemFontWithWeight:(double)a3
{
  return _[a1 systemFontOfSize:12.0 withWeight:a3];
}

+ (id)systemFontOfSize:(double)a3 withWeight:(double)a4
{
  v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3);
  id v7 = objc_alloc((Class)a1);
  v8 = +[CRLWPSystemFontNames nameForWeight:a4];
  id v9 = [v7 initWithDesiredPostScriptName:v8 platformFontDescriptor:0 andPlatformFont:v6 ofType:1];

  return v9;
}

+ (id)masqueradingFontNames
{
  if (qword_1016A8D58 != -1) {
    dispatch_once(&qword_1016A8D58, &stru_1014CAC38);
  }
  v2 = (void *)qword_1016A8D50;

  return v2;
}

+ (id)localizedMasqueradingFontFamilyNames
{
  if (qword_1016A8D68 != -1) {
    dispatch_once(&qword_1016A8D68, &stru_1014CAC58);
  }
  v2 = (void *)qword_1016A8D60;

  return v2;
}

+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDesiredPostScriptName:v4 size:0.0];

  return (CRLWPFont *)v5;
}

+ (CRLWPFont)fontWithOpaqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 familyName];

  if (v5)
  {
    v6 = [v4 familyName];

    [a1 baseFontForFamilyName:v6];
  }
  else
  {
    v6 = [v4 desiredPostScriptName];

    [a1 fontWithDesiredPostScriptName:v6];
  id v7 = };

  return (CRLWPFont *)v7;
}

+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3 fallbackFont:(id)a4 ofType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  v11 = [v8 platformFont];

  id v12 = [v10 initWithDesiredPostScriptName:v9 platformFontDescriptor:0 andPlatformFont:v11 ofType:a5];

  return (CRLWPFont *)v12;
}

+ (CRLWPFont)fontWithDesiredPostScriptName:(id)a3 atSize:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithDesiredPostScriptName:v6 size:a4];

  return (CRLWPFont *)v7;
}

+ (id)baseFontWithDescriptor:(id)a3
{
  id v4 = (const __CTFontDescriptor *)a3;
  CTFontRef v5 = CTFontCreateWithFontDescriptor(v4, 0.0, 0);
  id v6 = objc_alloc((Class)a1);
  id v7 = [(__CTFontDescriptor *)v4 postscriptName];
  id v8 = [v6 initWithDesiredPostScriptName:v7 platformFontDescriptor:v4 andPlatformFont:v5 ofType:1];

  return v8;
}

+ (id)baseFontForFamilyName:(id)a3
{
  id v4 = a3;
  CTFontRef v5 = [a1 helveticaFont];
  id v6 = [v5 familyName];
  unsigned int v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [a1 helveticaFont];
  }
  else
  {
    if (v4)
    {
      CFStringRef v24 = kCTFontFamilyNameAttribute;
      id v25 = v4;
      CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v10 = CTFontDescriptorCreateWithAttributes(v9);
      if (v10)
      {
        v11 = v10;
        CTFontRef v12 = CTFontCreateWithFontDescriptor(v10, 0.0, 0);
        v13 = [(__CTFont *)v12 fontName];
        v14 = +[CRLWPFont missingFontPostScriptName];
        unsigned int v15 = [v13 isEqual:v14];

        v16 = [CRLWPFont alloc];
        v17 = v16;
        if (v15)
        {
          v18 = [(CRLWPFont *)v16 initWithDesiredPostScriptName:v4];
        }
        else
        {
          v22 = [(__CTFont *)v12 fontName];
          v18 = [(CRLWPFont *)v17 initWithDesiredPostScriptName:v22 platformFontDescriptor:v11 andPlatformFont:v12 ofType:1];
        }
        CFRelease(v11);

        if (v18) {
          goto LABEL_20;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CAC78);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010659AC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CAC98);
        }
        v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v19);
        }
        v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPFont baseFontForFamilyName:]");
        v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 165, 0, "invalid nil value for '%{public}s'", "desc");
      }
    }
    uint64_t v8 = [a1 missingFont];
  }
  v18 = (CRLWPFont *)v8;
LABEL_20:

  return v18;
}

+ (id)loadPlatformFontOrFallbackForPostScriptName:(id)a3 size:(double)a4 foundType:(unint64_t *)a5
{
  id v8 = a3;
  *a5 = 1;
  CFDictionaryRef v9 = CRLBoardItemAccessibility;
  id v10 = +[CRLWPFontVerifier sharedInstance];
  if ([a1 isSystemUIFontIdentifier:v8])
  {
    +[CRLWPSystemFontNames weightForName:v8];
    uint64_t v12 = +[UIFont systemFontOfSize:a4 weight:v11];
    goto LABEL_5;
  }
  if ([v10 isFontWithPostscriptNameInstalled:v8])
  {
    uint64_t v12 = [a1 loadPlatformFontForPostScriptName:v8 size:a4];
LABEL_5:
    v13 = (void *)v12;
    if (!v12) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  v28 = +[CRLWPFallbackFontList sharedInstance];
  [v28 fallbackListForPostscriptFontName:v8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v17)
  {
    v13 = 0;
    goto LABEL_26;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v30;
  v27 = a5;
  while (2)
  {
    for (i = 0; i != v18; i = (char *)i + 1)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      if (objc_msgSend(v10, "isFontWithPostscriptNameInstalled:", v21, v27))
      {
        v13 = [a1 loadPlatformFontForPostScriptName:v21 size:a4];
        CFStringRef v24 = [a1 masqueradingFontNames];
        unsigned int v25 = [v24 containsObject:v21];

        uint64_t v26 = 2;
        if (v25) {
          uint64_t v26 = 3;
        }
        goto LABEL_25;
      }
      v22 = [a1 masqueradingFontNames];
      unsigned int v23 = [v22 containsObject:v21];

      if (v23)
      {
        v13 = [a1 loadPlatformFontForPostScriptName:v21 size:a4];
        uint64_t v26 = 3;
LABEL_25:
        a5 = v27;
        unint64_t *v27 = v26;
        CFDictionaryRef v9 = CRLBoardItemAccessibility;
        goto LABEL_26;
      }
    }
    id v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    v13 = 0;
    a5 = v27;
    CFDictionaryRef v9 = CRLBoardItemAccessibility;
    if (v18) {
      continue;
    }
    break;
  }
LABEL_26:

  if (!v13)
  {
LABEL_6:
    v14 = [&v9[70] missingFontName];
    v13 = [a1 loadPlatformFontForPostScriptName:v14 size:a4];

    *a5 = 2;
  }
LABEL_7:

  return v13;
}

+ (BOOL)isSystemFontName:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    BOOL v4 = [v3 characterAtIndex:0] == 46;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)isSystemUIFontIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CRLWPSystemFontNames allSystemFontNames];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

+ (unint64_t)optionsForLoadingPlatformFontWithPostScriptName:(id)a3
{
  if ([a1 isSystemFontName:a3]) {
    return 1024;
  }
  else {
    return 0;
  }
}

+ (id)loadPlatformFontForPostScriptName:(id)a3 size:(double)a4
{
  id v6 = (__CFString *)a3;
  CTFontRef v7 = CTFontCreateWithNameAndOptions(v6, a4, 0, (CTFontOptions)[a1 optionsForLoadingPlatformFontWithPostScriptName:v6]);

  return v7;
}

+ (id)localizedFamilyNameForPlatformFont:(id)a3
{
  id v4 = a3;
  if (+[CRLWPFont isSystemUIFontRef:v4])
  {
    unsigned __int8 v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"System Font" value:0 table:0];
  }
  else
  {
    CTFontRef v7 = [v4 fontName];
    unsigned int v8 = [a1 isSystemFontName:v7];

    if (v8 || (id v6 = (void *)CTFontCopyLocalizedName((CTFontRef)v4, kCTFontFamilyNameKey, 0)) == 0)
    {
      id v6 = [v4 familyName];
    }
  }

  return v6;
}

- (CRLWPFont)init
{
  return [(CRLWPFont *)self initWithDesiredPostScriptName:@"Helvetica" size:0.0];
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3
{
  return [(CRLWPFont *)self initWithDesiredPostScriptName:a3 size:0.0];
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 size:(double)a4
{
  uint64_t v10 = 0;
  id v6 = a3;
  CTFontRef v7 = [(id)objc_opt_class() loadPlatformFontOrFallbackForPostScriptName:v6 size:&v10 foundType:a4];
  unsigned int v8 = [(CRLWPFont *)self initWithDesiredPostScriptName:v6 platformFontDescriptor:0 andPlatformFont:v7 ofType:v10];

  return v8;
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 platformFontDescriptor:(id)a4 andPlatformFont:(id)a5 ofType:(unint64_t)a6 localizedFamilyName:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    id v17 = v14;
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CACB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101065B60();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CACD8);
    }
    id v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    uint64_t v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:]");
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 300, 0, "invalid nil value for '%{public}s'", "desiredPostScriptName");

    id v14 = v17;
    id v13 = 0;
  }
  v47.receiver = self;
  v47.super_class = (Class)CRLWPFont;
  uint64_t v21 = [(CRLWPFont *)&v47 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_desiredPostScriptName, a3);
    v22->_type = a6;
    objc_storeStrong((id *)&v22->_platformFont, a5);
    if (v14) {
      CTFontDescriptorRef v23 = (CTFontDescriptorRef)v14;
    }
    else {
      CTFontDescriptorRef v23 = CTFontCopyFontDescriptor((CTFontRef)v22->_platformFont);
    }
    platformFontDescriptor = v22->_platformFontDescriptor;
    v22->_platformFontDescriptor = (UIFontDescriptor *)v23;

    unsigned int v25 = [v15 familyName];

    if (v25)
    {
      uint64_t v26 = [v15 familyName];
      familyName = v22->_familyName;
      v22->_familyName = (NSString *)v26;
    }
    else
    {
      familyName = v22->_familyName;
      v22->_familyName = (NSString *)&stru_101538650;
    }

    v28 = (NSString *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v22->_platformFontDescriptor, kCTFontNameAttribute);
    postScriptName = v22->_postScriptName;
    v22->_postScriptName = v28;

    if (!v22->_postScriptName)
    {
      uint64_t v30 = [v15 fontName];
      long long v31 = v22->_postScriptName;
      v22->_postScriptName = (NSString *)v30;
    }
    long long v32 = +[CRLWPFallbackFontList sharedInstance];
    v33 = (NSString *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)v22->_platformFontDescriptor, kCTFontFamilyNameAttribute);
    v34 = v22->_familyName;
    v22->_familyName = v33;

    if (v16)
    {
      v35 = (NSString *)[v16 copy];
    }
    else
    {
      if (a6 == 3)
      {
        uint64_t v36 = [v32 localizedNameForMasqueradingFontName:v13];
        localizedFamilyName = v22->_localizedFamilyName;
        v22->_localizedFamilyName = (NSString *)v36;

        if (v22->_localizedFamilyName)
        {
LABEL_36:
          if (!v22->_localizedFamilyName)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CAD38);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_101065A40();
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CAD58);
            }
            v41 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10106590C(v41);
            }
            v42 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:]");
            v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"];
            +[CRLAssertionHandler handleFailureInFunction:v42, v43, 335, 0, "Unable to acquire a localized family name for: %@", v22 file lineNumber isFatal description];
          }
          uint64_t v44 = +[NSMutableDictionary dictionary];
          alternatePlatformFonts = v22->_alternatePlatformFonts;
          v22->_alternatePlatformFonts = (NSMutableDictionary *)v44;

          goto LABEL_47;
        }
        objc_storeStrong((id *)&v22->_localizedFamilyName, a3);
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CACF8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101065AD0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CAD18);
        }
        v38 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v38);
        }
        v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFont initWithDesiredPostScriptName:platformFontDescriptor:andPlatformFont:ofType:localizedFamilyName:]");
        v40 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"];
        +[CRLAssertionHandler handleFailureInFunction:v39, v40, 330, 0, "Masquerading font with no localized name found: %@", v22 file lineNumber isFatal description];

        id v16 = 0;
LABEL_35:

        goto LABEL_36;
      }
      v35 = [(id)objc_opt_class() localizedFamilyNameForPlatformFont:v15];
    }
    v39 = v22->_localizedFamilyName;
    v22->_localizedFamilyName = v35;
    goto LABEL_35;
  }
LABEL_47:

  return v22;
}

- (CRLWPFont)initWithDesiredPostScriptName:(id)a3 platformFontDescriptor:(id)a4 andPlatformFont:(id)a5 ofType:(unint64_t)a6
{
  return [(CRLWPFont *)self initWithDesiredPostScriptName:a3 platformFontDescriptor:a4 andPlatformFont:a5 ofType:a6 localizedFamilyName:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CRLWPFont alloc];
  unsigned __int8 v5 = [(CRLWPFont *)self desiredPostScriptName];
  id v6 = [(CRLWPFont *)self platformFont];
  unint64_t v7 = [(CRLWPFont *)self type];
  unsigned int v8 = [(CRLWPFont *)self localizedFamilyName];
  CFDictionaryRef v9 = [(CRLWPFont *)v4 initWithDesiredPostScriptName:v5 platformFontDescriptor:0 andPlatformFont:v6 ofType:v7 localizedFamilyName:v8];

  return v9;
}

+ (BOOL)isSystemUIFontRef:(__CTFont *)a3
{
  return CTFontGetTextStyle() != 0;
}

- (NSString)desiredPostScriptName
{
  if (+[CRLWPFont isSystemUIFontRef:[(CRLWPFont *)self ctFont]])
  {
    [(CRLWPFont *)self ctFont];
    CTFontGetWeight();
    +[CRLWPSystemFontNames nameForWeight:](_TtC8Freeform20CRLWPSystemFontNames, "nameForWeight:");
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = self->_desiredPostScriptName;
  }

  return v3;
}

- (BOOL)isMasqueradingFontName
{
  id v3 = +[CRLWPFont masqueradingFontNames];
  id v4 = [(CRLWPFont *)self postScriptName];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)isMasqueradingFont
{
  return (id)[(CRLWPFont *)self type] == (id)3;
}

- (BOOL)isFallbackFont
{
  return (id)[(CRLWPFont *)self type] == (id)2;
}

- (BOOL)isRequestedFont
{
  return (id)[(CRLWPFont *)self type] == (id)1;
}

- (BOOL)isBaseFontEqualToBaseFontFor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CRLWPFont *)self baseFont];
  id v6 = [v4 baseFont];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  sub_1002469D0(v5, v4);
  id v6 = (CRLWPFont *)objc_claimAutoreleasedReturnValue();

  if (v6 == self) {
    goto LABEL_5;
  }
  if (!v6) {
    goto LABEL_7;
  }
  unint64_t v7 = [(CRLWPFont *)self platformFont];
  unsigned int v8 = [(CRLWPFont *)v6 platformFont];
  if (([v7 isEqual:v8] & 1) == 0)
  {

    goto LABEL_7;
  }
  CFDictionaryRef v9 = [(CRLWPFont *)self desiredPostScriptName];
  uint64_t v10 = [(CRLWPFont *)v6 desiredPostScriptName];
  unsigned __int8 v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
LABEL_5:
  BOOL v12 = 1;
LABEL_8:

  return v12;
}

- (unint64_t)hash
{
  if (![(CRLWPFont *)self hashValue])
  {
    id v3 = objc_alloc_init(CRLHasher);
    [(CRLHasher *)v3 addObject:self->_postScriptName];
    [(CRLHasher *)v3 addObject:self->_desiredPostScriptName];
    [(UIFont *)self->_platformFont pointSize];
    [(CRLHasher *)v3 addInt:(int)(v4 * 1000.0)];
    [(CRLWPFont *)self setHashValue:[(CRLHasher *)v3 hashValue]];
  }

  return [(CRLWPFont *)self hashValue];
}

- (__CTFont)ctFont
{
  v2 = [(CRLWPFont *)self platformFont];
  CFTypeRef v3 = CFRetain(v2);
  double v4 = (__CTFont *)CFAutorelease(v3);

  return v4;
}

- (__CTFont)ctFontForSize:(double)a3
{
  [(CRLWPFont *)self size];
  if (v5 == a3)
  {
    return [(CRLWPFont *)self ctFont];
  }
  else
  {
    unint64_t v7 = [(CRLWPFont *)self postScriptName];
    unsigned int v8 = +[CRLWPFontCacheKey cacheKeyWithFontName:v7 size:a3];

    CFDictionaryRef v9 = [(CRLWPFont *)self alternatePlatformFonts];
    objc_sync_enter(v9);
    uint64_t v10 = [(CRLWPFont *)self alternatePlatformFonts];
    unsigned __int8 v11 = [v10 objectForKeyedSubscript:v8];

    if (v11)
    {
      BOOL v12 = [(CRLWPFont *)self alternatePlatformFonts];
      id v13 = [v12 objectForKeyedSubscript:v8];
      CFTypeRef v14 = CFRetain(v13);
      id v15 = (__CTFont *)CFAutorelease(v14);

      objc_sync_exit(v9);
    }
    else
    {
      objc_sync_exit(v9);

      CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes([(CRLWPFont *)self ctFont], a3, 0, 0);
      id v17 = [(CRLWPFont *)self alternatePlatformFonts];
      objc_sync_enter(v17);
      id v18 = [(CRLWPFont *)self alternatePlatformFonts];
      [v18 setObject:CopyWithAttributes forKeyedSubscript:v8];

      objc_sync_exit(v17);
      id v15 = (__CTFont *)CFAutorelease(CopyWithAttributes);
    }

    return v15;
  }
}

- (__CTFont)ctFontForSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5 traits:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  unsigned __int8 v11 = [(CRLWPFont *)self postScriptName];
  BOOL v12 = +[CRLWPFontCacheKey cacheKeyWithFontName:v11 fontSize:v7 bold:v6 italic:v10 fontFeatures:a3];

  id v13 = [(CRLWPFont *)self alternatePlatformFonts];
  objc_sync_enter(v13);
  CFTypeRef v14 = [(CRLWPFont *)self alternatePlatformFonts];
  id v15 = [v14 objectForKeyedSubscript:v12];

  if (v15)
  {
    id v16 = [(CRLWPFont *)self alternatePlatformFonts];
    id v17 = [v16 objectForKeyedSubscript:v12];
    CFTypeRef v18 = CFRetain(v17);
    uint64_t v19 = (__CTFont *)CFAutorelease(v18);
  }
  else
  {
    objc_sync_exit(v13);

    uint64_t v19 = [(CRLWPFont *)self ctFontForSize:v7 bold:v6 italic:a3];
    if ([v10 count])
    {
      CTFontDescriptorRef v20 = CTFontCopyFontDescriptor(v19);
      if (v20)
      {
        uint64_t v21 = v20;
        CFDictionaryRef v22 = (const __CFDictionary *)[objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v10, kCTFontFeatureSettingsAttribute, 0];
        CTFontRef CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v21, v22);
        CFRelease(v21);
        if (CopyWithAttributes)
        {
          CTFontRef v24 = CTFontCreateWithFontDescriptor(CopyWithAttributes, a3, 0);
          CFRelease(CopyWithAttributes);
          if (v24) {
            uint64_t v19 = (__CTFont *)CFAutorelease(v24);
          }
        }
      }
    }
    id v13 = [(CRLWPFont *)self alternatePlatformFonts];
    objc_sync_enter(v13);
    id v16 = [(CRLWPFont *)self alternatePlatformFonts];
    [v16 setObject:v19 forKeyedSubscript:v12];
  }

  objc_sync_exit(v13);
  return v19;
}

- (__CTFont)ctFontForSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  CFDictionaryRef v9 = [(CRLWPFont *)self postScriptName];
  id v10 = +[CRLWPFontCacheKey cacheKeyWithFontName:v9 fontSize:v6 bold:v5 italic:0 fontFeatures:a3];

  unsigned __int8 v11 = [(CRLWPFont *)self alternatePlatformFonts];
  objc_sync_enter(v11);
  BOOL v12 = [(CRLWPFont *)self alternatePlatformFonts];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    CFTypeRef v14 = [(CRLWPFont *)self alternatePlatformFonts];
    id v15 = [v14 objectForKeyedSubscript:v10];
    CFTypeRef v16 = CFRetain(v15);
    id v17 = (__CTFont *)CFAutorelease(v16);

    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    CFTypeRef v18 = (const __CTFont *)CFRetain([(CRLWPFont *)self ctFontForSize:a3]);
    CTFontSymbolicTraits SymbolicTraits = CTFontGetSymbolicTraits(v18);
    CTFontSymbolicTraits v20 = SymbolicTraits;
    if (((SymbolicTraits & 2) == 0) == v6)
    {
      int v21 = v6 ? 2 : 0;
      CopyWithCTFontSymbolicTraits SymbolicTraits = CTFontCreateCopyWithSymbolicTraits(v18, a3, 0, SymbolicTraits & 0xFFFFFFFD | v21, 2u);
      if (CopyWithSymbolicTraits)
      {
        CTFontDescriptorRef v23 = CopyWithSymbolicTraits;
        if (v18 == CopyWithSymbolicTraits)
        {
          CFRelease(v18);
        }
        else
        {
          CFRelease(v18);
          CFTypeRef v18 = v23;
        }
      }
    }
    if (((v20 & 1) == 0) == v5)
    {
      CTFontRef v24 = CTFontCreateCopyWithSymbolicTraits(v18, a3, 0, v20 & 0xFFFFFFFE | v5, 1u);
      if (v24)
      {
        unsigned int v25 = v24;
        if (v18 == v24)
        {
          CFRelease(v18);
        }
        else
        {
          CFRelease(v18);
          CFTypeRef v18 = v25;
        }
      }
    }
    uint64_t v26 = [(CRLWPFont *)self alternatePlatformFonts];
    objc_sync_enter(v26);
    v27 = [(CRLWPFont *)self alternatePlatformFonts];
    [v27 setObject:v18 forKeyedSubscript:v10];

    objc_sync_exit(v26);
    id v17 = (__CTFont *)CFAutorelease(v18);
  }

  return v17;
}

- (id)copyWithSize:(double)a3
{
  double v4 = [(CRLWPFont *)self ctFontForSize:a3];
  BOOL v5 = [(__CTFont *)v4 fontName];
  if (![(CRLWPFont *)self isRequestedFont])
  {
    uint64_t v6 = [(CRLWPFont *)self desiredPostScriptName];

    BOOL v5 = (void *)v6;
  }
  BOOL v7 = [CRLWPFont alloc];
  unint64_t v8 = [(CRLWPFont *)self type];
  CFDictionaryRef v9 = [(CRLWPFont *)self localizedFamilyName];
  id v10 = [(CRLWPFont *)v7 initWithDesiredPostScriptName:v5 platformFontDescriptor:0 andPlatformFont:v4 ofType:v8 localizedFamilyName:v9];

  return v10;
}

- (id)copyWithSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  uint64_t v6 = [(CRLWPFont *)self ctFontForSize:a4 bold:a5 italic:a3];
  BOOL v7 = [(__CTFont *)v6 fontName];
  if (![(CRLWPFont *)self isRequestedFont])
  {
    uint64_t v8 = [(CRLWPFont *)self desiredPostScriptName];

    BOOL v7 = (void *)v8;
  }
  CFDictionaryRef v9 = [CRLWPFont alloc];
  unint64_t v10 = [(CRLWPFont *)self type];
  unsigned __int8 v11 = [(CRLWPFont *)self localizedFamilyName];
  BOOL v12 = [(CRLWPFont *)v9 initWithDesiredPostScriptName:v7 platformFontDescriptor:0 andPlatformFont:v6 ofType:v10 localizedFamilyName:v11];

  return v12;
}

- (id)copyWithSize:(double)a3 bold:(BOOL)a4 italic:(BOOL)a5 traits:(id)a6
{
  BOOL v7 = [(CRLWPFont *)self ctFontForSize:a4 bold:a5 italic:a6 traits:a3];
  uint64_t v8 = [(__CTFont *)v7 fontName];
  if (![(CRLWPFont *)self isRequestedFont])
  {
    uint64_t v9 = [(CRLWPFont *)self desiredPostScriptName];

    uint64_t v8 = (void *)v9;
  }
  unint64_t v10 = [CRLWPFont alloc];
  unint64_t v11 = [(CRLWPFont *)self type];
  BOOL v12 = [(CRLWPFont *)self localizedFamilyName];
  id v13 = [(CRLWPFont *)v10 initWithDesiredPostScriptName:v8 platformFontDescriptor:0 andPlatformFont:v7 ofType:v11 localizedFamilyName:v12];

  return v13;
}

- (NSString)displayName
{
  CFTypeRef v3 = [(CRLWPFont *)self localizedFamilyName];
  if ([(CRLWPFont *)self isFallbackFont] || !v3)
  {
    uint64_t v4 = [(CRLWPFont *)self desiredPostScriptName];

    CFTypeRef v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (id)description
{
  CFTypeRef v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  BOOL v5 = [(CRLWPFont *)self displayName];
  uint64_t v6 = [(CRLWPFont *)self desiredPostScriptName];
  if ([(CRLWPFont *)self isFallbackFont]) {
    CFStringRef v7 = @"Fallback";
  }
  else {
    CFStringRef v7 = @"Requested";
  }
  uint64_t v8 = [(CRLWPFont *)self postScriptName];
  [(CRLWPFont *)self size];
  unint64_t v10 = +[NSString stringWithFormat:@"%@: <%p> Display: %@ (Wanted: %@ - Status: %@ as: %@) @ %.2fpts", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSArray)familyFaces
{
  CFTypeRef v3 = objc_opt_class();
  uint64_t v4 = [(CRLWPFont *)self familyName];
  BOOL v5 = [v3 facesOfFontFamily:v4];

  return (NSArray *)v5;
}

- (double)size
{
  v2 = [(CRLWPFont *)self platformFont];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (BOOL)bold
{
  return (CTFontGetSymbolicTraits([(CRLWPFont *)self ctFont]) >> 1) & 1;
}

- (BOOL)italic
{
  return CTFontGetSymbolicTraits([(CRLWPFont *)self ctFont]) & 1;
}

- (CRLWPFont)baseFont
{
  if ([(CRLWPFont *)self isRequestedFont])
  {
    double v3 = objc_opt_class();
    double v4 = [(CRLWPFont *)self familyName];
    BOOL v5 = [v3 postScriptNameForFamilyName:v4];
    uint64_t v6 = +[CRLWPFont fontWithDesiredPostScriptName:v5];
  }
  else
  {
    double v4 = [(CRLWPFont *)self desiredPostScriptName];
    uint64_t v6 = +[CRLWPFont fontWithDesiredPostScriptName:v4];
  }

  return (CRLWPFont *)v6;
}

+ (id)facesOfFontFamily:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    CFStringRef v31 = kCTFontFamilyNameAttribute;
    id v32 = v3;
    CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v6 = CTFontDescriptorCreateWithAttributes(v5);
    id v24 = (id)objc_opt_new();
    if (!v6) {
      goto LABEL_25;
    }
    MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v6, 0);
    if (MatchingFontDescriptors)
    {
      CTFontSymbolicTraits v20 = v6;
      CFDictionaryRef v22 = v5;
      CTFontDescriptorRef v23 = v4;
      id v8 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[MatchingFontDescriptors count]];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      int v21 = MatchingFontDescriptors;
      id obj = MatchingFontDescriptors;
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(const __CTFontDescriptor **)(*((void *)&v26 + 1) + 8 * i);
            CFDictionaryRef v14 = CTFontDescriptorCopyAttributes(v13);
            if (([v8 containsObject:v14] & 1) == 0)
            {
              id v15 = (void *)CTFontDescriptorCopyLocalizedAttribute(v13, kCTFontStyleNameAttribute, 0);
              CFTypeRef v16 = (void *)CTFontDescriptorCopyAttribute(v13, kCTFontNameAttribute);
              id v17 = +[CRLWPFontFace fontFaceWithPostScriptName:v16 faceName:v15];
              [v24 addObject:v17];

              [v8 addObject:v14];
            }
          }
          id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v10);
      }

      CFDictionaryRef v5 = v22;
      double v4 = v23;
      uint64_t v6 = v20;
      MatchingFontDescriptors = v21;
    }
    CFRelease(v6);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CAD78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101065BF4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CAD98);
    }
    CFTypeRef v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPFont facesOfFontFamily:]");
    CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    MatchingFontDescriptors = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, MatchingFontDescriptors, 590, 0, "invalid nil value for '%{public}s'", "fontFamily");
    id v24 = &__NSArray0__struct;
  }

LABEL_25:

  return v24;
}

+ (id)postScriptNameForFamilyName:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    CFStringRef v13 = kCTFontFamilyNameAttribute;
    id v14 = v3;
    CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v6 = CTFontDescriptorCreateWithAttributes(v5);
    if (v6)
    {
      CFStringRef v7 = v6;
      id v8 = (void *)CTFontDescriptorCopyAttribute(v6, kCTFontNameAttribute);
      CFRelease(v7);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CADB8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101065C88();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CADD8);
      }
      id v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPFont postScriptNameForFamilyName:]");
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFont.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 627, 0, "invalid nil value for '%{public}s'", "desc");

      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)isKeyValueProxyLeafType
{
  return 1;
}

- (NSString)postScriptName
{
  return self->_postScriptName;
}

- (void)setPostScriptName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (void)setIsFallbackFont:(BOOL)a3
{
  self->_isFallbackFont = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (UIFont)platformFont
{
  return self->_platformFont;
}

- (void)setPlatformFont:(id)a3
{
}

- (NSString)localizedFamilyName
{
  return self->_localizedFamilyName;
}

- (void)setLocalizedFamilyName:(id)a3
{
}

- (UIFontDescriptor)platformFontDescriptor
{
  return self->_platformFontDescriptor;
}

- (void)setPlatformFontDescriptor:(id)a3
{
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

- (void)setHashValue:(unint64_t)a3
{
  self->_hashValue = a3;
}

- (NSMutableDictionary)alternatePlatformFonts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlternatePlatformFonts:(id)a3
{
}

- (NSArray)creationBacktrace
{
  return self->_creationBacktrace;
}

- (void)setCreationBacktrace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationBacktrace, 0);
  objc_storeStrong((id *)&self->_alternatePlatformFonts, 0);
  objc_storeStrong((id *)&self->_platformFontDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedFamilyName, 0);
  objc_storeStrong((id *)&self->_platformFont, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_postScriptName, 0);

  objc_storeStrong((id *)&self->_desiredPostScriptName, 0);
}

@end