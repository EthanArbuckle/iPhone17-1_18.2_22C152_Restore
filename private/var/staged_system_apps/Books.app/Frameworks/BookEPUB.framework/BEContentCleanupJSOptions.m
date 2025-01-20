@interface BEContentCleanupJSOptions
+ (id)expandedContentOptions;
+ (id)fixedLayoutOptionsWithLanguage:(id)a3;
- (BEContentCleanupJSOptions)init;
- (BEContentCleanupJSOptions)initWithMode:(unint64_t)a3 useNewTextStyling:(BOOL)a4 fontFamily:(id)a5 language:(id)a6 respectImageSizeClass:(id)a7 respectImageSizeClassIsPrefix:(BOOL)a8 hasBuiltInFonts:(BOOL)a9 justification:(unint64_t)a10 fontWeight:(unint64_t)a11 overrideLineHeight:(BOOL)a12 overrideLetterSpacing:(BOOL)a13 overrideWordSpacing:(BOOL)a14 readingMode:(unint64_t)a15;
- (BOOL)hasBuiltInFonts;
- (BOOL)overrideFontFamily;
- (BOOL)overrideFontWeight;
- (BOOL)overrideLetterSpacing;
- (BOOL)overrideLineHeight;
- (BOOL)overrideTextAlign;
- (BOOL)overrideWordSpacing;
- (BOOL)respectImageSizeClassIsPrefix;
- (BOOL)useNewTextStyling;
- (NSString)fontFamily;
- (NSString)jsonRepresentation;
- (NSString)language;
- (NSString)respectImageSizeClass;
- (id)_dictionaryRepresentation;
- (id)description;
- (unint64_t)fontWeight;
- (unint64_t)justification;
- (unint64_t)mode;
- (unint64_t)readingMode;
@end

@implementation BEContentCleanupJSOptions

- (BEContentCleanupJSOptions)init
{
  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  LOBYTE(v3) = 0;
  return -[BEContentCleanupJSOptions initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:](self, "initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:", 0, 0, &stru_3D7B70, &stru_3D7B70, &stru_3D7B70, 0, v3, 0, 0, v4, 0);
}

- (BEContentCleanupJSOptions)initWithMode:(unint64_t)a3 useNewTextStyling:(BOOL)a4 fontFamily:(id)a5 language:(id)a6 respectImageSizeClass:(id)a7 respectImageSizeClassIsPrefix:(BOOL)a8 hasBuiltInFonts:(BOOL)a9 justification:(unint64_t)a10 fontWeight:(unint64_t)a11 overrideLineHeight:(BOOL)a12 overrideLetterSpacing:(BOOL)a13 overrideWordSpacing:(BOOL)a14 readingMode:(unint64_t)a15
{
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  v33.receiver = self;
  v33.super_class = (Class)BEContentCleanupJSOptions;
  v24 = [(BEContentCleanupJSOptions *)&v33 init];
  v25 = v24;
  if (v24)
  {
    v24->_mode = a3;
    v24->_useNewTextStyling = a4;
    v26 = (NSString *)[v21 copy];
    fontFamily = v25->_fontFamily;
    v25->_fontFamily = v26;

    v28 = (NSString *)[v22 copy];
    language = v25->_language;
    v25->_language = v28;

    v30 = (NSString *)[v23 copy];
    respectImageSizeClass = v25->_respectImageSizeClass;
    v25->_respectImageSizeClass = v30;

    v25->_respectImageSizeClassIsPrefix = a8;
    v25->_hasBuiltInFonts = a9;
    v25->_justification = a10;
    v25->_fontWeight = a11;
    v25->_overrideLineHeight = a12;
    v25->_overrideLetterSpacing = a13;
    v25->_overrideWordSpacing = a14;
    v25->_readingMode = a15;
  }

  return v25;
}

+ (id)fixedLayoutOptionsWithLanguage:(id)a3
{
  id v3 = a3;
  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  LOBYTE(v6) = 0;
  uint64_t v4 = -[BEContentCleanupJSOptions initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:]([BEContentCleanupJSOptions alloc], "initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:", 3, 0, 0, v3, 0, 0, v6, 0, 0, v7, 0);

  return v4;
}

+ (id)expandedContentOptions
{
  BYTE2(v5) = 0;
  LOWORD(v5) = 0;
  LOBYTE(v4) = 0;
  v2 = -[BEContentCleanupJSOptions initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:]([BEContentCleanupJSOptions alloc], "initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:", 1, 0, 0, 0, 0, 0, v4, 0, 0, v5, 0);

  return v2;
}

- (BOOL)overrideFontFamily
{
  return [(NSString *)self->_fontFamily length] != 0;
}

- (BOOL)overrideTextAlign
{
  return self->_justification != 0;
}

- (BOOL)overrideFontWeight
{
  return self->_fontWeight != 0;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = +[NSNumber numberWithBool:self->_useNewTextStyling];
  [v3 setObject:v4 forKeyedSubscript:@"useNewTextStyling"];

  if (self->_useNewTextStyling)
  {
    uint64_t v5 = +[NSNumber numberWithBool:[(BEContentCleanupJSOptions *)self overrideFontFamily]];
    [v3 setObject:v5 forKeyedSubscript:@"overrideFontFamily"];

    uint64_t v6 = +[NSNumber numberWithBool:[(BEContentCleanupJSOptions *)self hasBuiltInFonts]];
    CFStringRef v7 = @"hasBuiltInFonts";
    v8 = v3;
    v9 = v6;
LABEL_5:
    [v8 setObject:v9 forKeyedSubscript:v7];

    goto LABEL_6;
  }
  if ([(BEContentCleanupJSOptions *)self overrideFontFamily])
  {
    v10 = [(NSString *)self->_fontFamily be_sanitizedFontFamilyName];
    uint64_t v6 = +[NSString stringWithFormat:@"iBooks_%@", v10];

    [v3 setObject:v6 forKeyedSubscript:@"fontFamily"];
    v9 = &__kCFBooleanTrue;
    CFStringRef v7 = @"customFontFamily";
    v8 = v3;
    goto LABEL_5;
  }
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"customFontFamily"];
LABEL_6:
  if ([(NSString *)self->_language length]) {
    [v3 setObject:self->_language forKeyedSubscript:@"language"];
  }
  if ([(NSString *)self->_respectImageSizeClass length]) {
    [v3 setObject:self->_respectImageSizeClass forKeyedSubscript:@"respectImageSizeClass"];
  }
  v11 = +[NSNumber numberWithBool:self->_respectImageSizeClassIsPrefix];
  [v3 setObject:v11 forKeyedSubscript:@"respectImageSizeClassIsPrefix"];

  if (self->_useNewTextStyling)
  {
    v12 = +[NSNumber numberWithBool:[(BEContentCleanupJSOptions *)self overrideTextAlign]];
    [v3 setObject:v12 forKeyedSubscript:@"overrideTextAlign"];

    v13 = +[NSNumber numberWithBool:[(BEContentCleanupJSOptions *)self overrideFontWeight]];
    [v3 setObject:v13 forKeyedSubscript:@"overrideFontWeight"];

    v14 = +[NSNumber numberWithBool:[(BEContentCleanupJSOptions *)self overrideLineHeight]];
    [v3 setObject:v14 forKeyedSubscript:@"overrideLineHeight"];

    v15 = +[NSNumber numberWithBool:[(BEContentCleanupJSOptions *)self overrideLetterSpacing]];
    [v3 setObject:v15 forKeyedSubscript:@"overrideLetterSpacing"];

    v16 = +[NSNumber numberWithBool:[(BEContentCleanupJSOptions *)self overrideWordSpacing]];
    [v3 setObject:v16 forKeyedSubscript:@"overrideWordSpacing"];

    goto LABEL_23;
  }
  unint64_t justification = self->_justification;
  if (justification == 1)
  {
    v18 = &__kCFBooleanTrue;
  }
  else
  {
    if (justification != 2) {
      goto LABEL_18;
    }
    v18 = &__kCFBooleanFalse;
  }
  [v3 setObject:v18 forKeyedSubscript:@"justification"];
LABEL_18:
  unint64_t fontWeight = self->_fontWeight;
  if (fontWeight == 2)
  {
    v20 = &__kCFBooleanTrue;
  }
  else
  {
    if (fontWeight != 1) {
      goto LABEL_23;
    }
    v20 = &__kCFBooleanFalse;
  }
  [v3 setObject:v20 forKeyedSubscript:@"boldWeight"];
LABEL_23:
  id v21 = +[NSNumber numberWithUnsignedInteger:self->_mode];
  [v3 setObject:v21 forKeyedSubscript:@"mode"];

  id v22 = +[NSNumber numberWithUnsignedInteger:self->_readingMode];
  [v3 setObject:v22 forKeyedSubscript:@"readingMode"];

  return v3;
}

- (NSString)jsonRepresentation
{
  v2 = [(BEContentCleanupJSOptions *)self _dictionaryRepresentation];
  uint64_t v6 = 0;
  id v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:&v6];

  if ([v3 length]) {
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  unint64_t v5 = [(BEContentCleanupJSOptions *)self mode];
  if (v5 - 1 > 2) {
    CFStringRef v6 = @"unknown";
  }
  else {
    CFStringRef v6 = (const __CFString *)*((void *)&off_3C0B30 + v5 - 1);
  }
  CFStringRef v25 = v6;
  CFStringRef v7 = @"NO";
  if ([(BEContentCleanupJSOptions *)self useNewTextStyling]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  CFStringRef v29 = v8;
  objc_super v33 = [(BEContentCleanupJSOptions *)self fontFamily];
  id v32 = [v33 length];
  if (v32)
  {
    CFStringRef v9 = [(BEContentCleanupJSOptions *)self fontFamily];
  }
  else
  {
    CFStringRef v9 = @"original";
  }
  v30 = [(BEContentCleanupJSOptions *)self language];
  id v28 = [v30 length];
  if (v28)
  {
    CFStringRef v10 = [(BEContentCleanupJSOptions *)self language];
  }
  else
  {
    CFStringRef v10 = @"{unset}";
  }
  v11 = [(BEContentCleanupJSOptions *)self respectImageSizeClass];
  id v12 = [v11 length];
  v34 = (void *)v4;
  v31 = (__CFString *)v9;
  v27 = (__CFString *)v10;
  if (v12)
  {
    v26 = [(BEContentCleanupJSOptions *)self respectImageSizeClass];
  }
  else
  {
    v26 = @"{unset}";
  }
  CFStringRef v13 = @"NO";
  if ([(BEContentCleanupJSOptions *)self respectImageSizeClassIsPrefix]) {
    CFStringRef v7 = @"YES";
  }
  unint64_t v14 = [(BEContentCleanupJSOptions *)self justification];
  v15 = @"full-justify";
  if (v14 != 1) {
    v15 = @"unset";
  }
  if (v14 == 2) {
    v15 = @"no-justify";
  }
  v16 = v15;
  unint64_t v17 = [(BEContentCleanupJSOptions *)self fontWeight];
  v18 = @"light";
  if (v17 != 1) {
    v18 = @"unset";
  }
  if (v17 == 2) {
    v18 = @"heavy";
  }
  v19 = v18;
  if ([(BEContentCleanupJSOptions *)self overrideLineHeight]) {
    CFStringRef v20 = @"YES";
  }
  else {
    CFStringRef v20 = @"NO";
  }
  if ([(BEContentCleanupJSOptions *)self overrideLetterSpacing]) {
    CFStringRef v21 = @"YES";
  }
  else {
    CFStringRef v21 = @"NO";
  }
  if ([(BEContentCleanupJSOptions *)self overrideWordSpacing]) {
    CFStringRef v13 = @"YES";
  }
  id v22 = +[NSNumber numberWithUnsignedInteger:[(BEContentCleanupJSOptions *)self readingMode]];
  id v23 = +[NSString stringWithFormat:@"<%@ %p mode=%@ useNewTextStyling=%@ fontFamily=%@ language=%@respectImageSizeClass=%@ respectImageSizeClassIsPrefix=%@ justification=%@ fontWeight=%@ overrideLineHeight=%@ overrideLetterSpacing=%@ overrideWordSpacing=%@ readingMode=%@>", v34, self, v25, v29, v31, v27, v26, v7, v16, v19, v20, v21, v13, v22];

  if (v12) {
  if (v28)
  }

  if (v32) {

  }
  return v23;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)useNewTextStyling
{
  return self->_useNewTextStyling;
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)respectImageSizeClass
{
  return self->_respectImageSizeClass;
}

- (BOOL)respectImageSizeClassIsPrefix
{
  return self->_respectImageSizeClassIsPrefix;
}

- (BOOL)hasBuiltInFonts
{
  return self->_hasBuiltInFonts;
}

- (unint64_t)justification
{
  return self->_justification;
}

- (unint64_t)fontWeight
{
  return self->_fontWeight;
}

- (BOOL)overrideLineHeight
{
  return self->_overrideLineHeight;
}

- (BOOL)overrideLetterSpacing
{
  return self->_overrideLetterSpacing;
}

- (BOOL)overrideWordSpacing
{
  return self->_overrideWordSpacing;
}

- (unint64_t)readingMode
{
  return self->_readingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_respectImageSizeClass, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_fontFamily, 0);
}

@end