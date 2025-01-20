@interface THWAdornmentWPStyleProvider
- (BOOL)shouldFilterTextSource:(id)a3;
- (BOOL)useDarkAppearance;
- (NSString)fontName;
- (THWAdornmentWPStyleProvider)initWithStorage:(id)a3;
- (TSWPStorage)storage;
- (double)fontSize;
- (double)leftIndent;
- (id)modifiedCharacterStyle:(id)a3 atCharIndex:(unint64_t)a4;
- (id)p_textColor;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (unsigned)textAlignment;
- (void)dealloc;
- (void)setFontName:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setLeftIndent:(double)a3;
- (void)setTextAlignment:(unsigned int)a3;
- (void)setUseDarkAppearance:(BOOL)a3;
@end

@implementation THWAdornmentWPStyleProvider

- (THWAdornmentWPStyleProvider)initWithStorage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWAdornmentWPStyleProvider;
  v4 = [(THWAdornmentWPStyleProvider *)&v6 init];
  if (v4)
  {
    v4->_storage = (TSWPStorage *)a3;
    v4->_fontSize = 10.0;
    v4->_textAlignment = 0;
    v4->_fontName = 0;
    v4->_leftIndent = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentWPStyleProvider;
  [(THWAdornmentWPStyleProvider *)&v3 dealloc];
}

- (id)p_textColor
{
  if (self->_useDarkAppearance) {
    return +[TSUColor whiteColor];
  }
  else {
    return +[TSUColor colorWithWhite:0.203921571 alpha:1.0];
  }
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v7 = +[TSSPropertyMap propertyMap];
  double fontSize = self->_fontSize;
  *(float *)&double fontSize = fontSize;
  [v7 setFloatValue:17 forProperty:fontSize];
  fontName = self->_fontName;
  if (fontName) {
    [v7 setObject:fontName forProperty:16];
  }
  [v7 setObject:[self p_textColor] forProperty:18];
  uint64_t textAlignment = self->_textAlignment;
  if (textAlignment != 4) {
    [v7 setIntValue:textAlignment forProperty:86];
  }
  double leftIndent = self->_leftIndent;
  *(float *)&double leftIndent = leftIndent;
  [v7 setFloatValue:80 forProperty:leftIndent];
  double v12 = self->_leftIndent;
  *(float *)&double v12 = v12;
  [v7 setFloatValue:81 forProperty:v12];
  [v7 setFloatValue:82 forProperty:0.0];
  [v7 setIntValue:0 forProperty:102];
  id v13 = [objc_alloc((Class)TSWPLineSpacing) initWithMode:0 amount:1.1];
  [v7 setObject:v13 forProperty:85];

  id v14 = [TSWPStorageStyleProvider styleProviderForStorage:self->_storage].paragraphStyleAtParIndex:a3 effectiveRange:a4];
  id v15 = [v14 stylesheet];

  return [v15 variationOfStyle:v14 propertyMap:v7];
}

- (id)modifiedCharacterStyle:(id)a3 atCharIndex:(unint64_t)a4
{
  id v6 = +[TSSPropertyMap propertyMap];
  [v6 setObject:[self p_textColor] forProperty:18];
  double fontSize = self->_fontSize;
  *(float *)&double fontSize = fontSize;
  [v6 setFloatValue:17 forProperty:fontSize];
  fontName = self->_fontName;
  if (fontName) {
    [v6 setObject:fontName forProperty:16];
  }
  id v9 = [a3 stylesheet];

  return [v9 variationOfStyle:a3 propertyMap:v6];
}

- (BOOL)shouldFilterTextSource:(id)a3
{
  return 0;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (BOOL)useDarkAppearance
{
  return self->_useDarkAppearance;
}

- (void)setUseDarkAppearance:(BOOL)a3
{
  self->_useDarkAppearance = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_double fontSize = a3;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  self->_fontName = (NSString *)a3;
}

- (unsigned)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unsigned int)a3
{
  self->_uint64_t textAlignment = a3;
}

- (double)leftIndent
{
  return self->_leftIndent;
}

- (void)setLeftIndent:(double)a3
{
  self->_double leftIndent = a3;
}

@end