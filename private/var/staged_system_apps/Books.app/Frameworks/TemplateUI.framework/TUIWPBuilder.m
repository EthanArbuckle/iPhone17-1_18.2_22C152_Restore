@interface TUIWPBuilder
- (BOOL)shouldHyphenate;
- (NSArray)axActions;
- (NSString)language;
- (TSWPCharacterStyle)characterStyle;
- (TUIFontSpec)fontSpec;
- (TUIWPBuilder)initWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 alignment:(int64_t)a6 writingDirection:(int64_t)a7 language:(id)a8 shouldHyphenate:(BOOL)a9 service:(id)a10;
- (TUIWPStorage)wpStorage;
- (UIColor)color;
- (_NSRange)appendWithBlock:(id)a3;
- (double)baselineOffset;
- (id)finalizeAnimationGroups;
- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5;
- (id)finalizeTextModelWithContext:(id)a3;
- (int64_t)alignment;
- (int64_t)writingDirection;
- (unint64_t)options;
- (void)_applyParagraphStyleWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5;
- (void)_configurePropertyMap:(id)a3 withFontSpec:(id)a4 style:(unint64_t)a5 color:(id)a6;
- (void)_createCharacterStyleWithParentStyle:(id)a3 style:(unint64_t)a4 color:(id)a5 fontSpec:(id)a6;
- (void)addBox:(id)a3;
- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4;
- (void)appendString:(id)a3;
- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6;
- (void)configureDropCapWithCount:(unint64_t)a3 lines:(unint64_t)a4 raised:(unint64_t)a5 style:(unint64_t)a6 color:(id)a7 fontSpec:(id)a8 backgroundColor:(id)a9 padding:(double)a10;
- (void)configureLineStylingForLines:(int64_t)a3 relativeToDropCapLines:(BOOL)a4 style:(unint64_t)a5 color:(id)a6 fontSpec:(id)a7;
- (void)configureParagraphStyle:(id)a3;
- (void)ensureParagraphBoundary;
- (void)finalizeModelsWithParent:(id)a3;
- (void)finalizeModelsWithParent:(id)a3 context:(id)a4;
- (void)setAXActions:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setCharacterStyle:(id)a3;
- (void)setColor:(id)a3;
- (void)setFontSpec:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setShouldHyphenate:(BOOL)a3;
- (void)setWritingDirection:(int64_t)a3;
@end

@implementation TUIWPBuilder

- (TUIWPBuilder)initWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 alignment:(int64_t)a6 writingDirection:(int64_t)a7 language:(id)a8 shouldHyphenate:(BOOL)a9 service:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  id v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)TUIWPBuilder;
  v20 = [(TUIWPBuilder *)&v34 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_fontSpec, a3);
    objc_storeStrong((id *)&v21->_color, a5);
    v21->_alignment = a6;
    v21->_writingDirection = a7;
    v22 = (NSString *)[v18 copy];
    language = v21->_language;
    v21->_language = v22;

    v21->_shouldHyphenate = a9;
    v24 = [TUIWPStorage alloc];
    v25 = [v19 context];
    v26 = [v19 stylesheet];
    v27 = [(TUIWPStorage *)v24 initWithContext:v25 string:&stru_257BF0 stylesheet:v26 kind:3];
    wpStorage = v21->_wpStorage;
    v21->_wpStorage = v27;

    v29 = [(TUIWPStorage *)v21->_wpStorage stylesheet];
    uint64_t v30 = [v29 defaultCharacterStyle];
    characterStyle = v21->_characterStyle;
    v21->_characterStyle = (TSWPCharacterStyle *)v30;

    v21->_usedDynamicColor = 0;
    [(TUIWPBuilder *)v21 _applyParagraphStyleWithStyle:a4 color:v17 fontSpec:v16];
  }

  return v21;
}

- (void)_applyParagraphStyleWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  v9 = +[TSSPropertyMap propertyMap];
  [(TUIWPBuilder *)self _configurePropertyMap:v9 withFontSpec:v8 style:a3 color:v20];
  [v8 leading];
  if (v10 != 0.0)
  {
    id v11 = objc_alloc((Class)TSWPLineSpacing);
    [v8 leading];
    id v12 = [v11 initWithMode:2];
    [v9 setObject:v12 forProperty:85];
  }
  [v9 setBoolValue:(a3 >> 2) & 1 forProperty:51];
  unint64_t alignment = self->_alignment;
  if (alignment < 5) {
    [v9 setIntValue:dword_243060[alignment] forProperty:86];
  }
  if ((unint64_t)(self->_writingDirection + 1) <= 2) {
    [v9 setIntValue:LODWORD(self->_writingDirection) forProperty:44];
  }
  [v9 setBoolValue:self->_shouldHyphenate forProperty:93];
  [v9 setObject:self->_language forProperty:39];
  v14 = [(TUIWPStorage *)self->_wpStorage paragraphStyleAtCharIndex:0 effectiveRange:0];
  v15 = [(TUIWPStorage *)self->_wpStorage stylesheet];
  id v16 = [v15 variationOfStyle:v14 propertyMap:v9];

  wpStorage = self->_wpStorage;
  id v18 = [(TUIWPStorage *)wpStorage range];
  -[TUIWPStorage setParagraphStyle:forCharRange:undoTransaction:](wpStorage, "setParagraphStyle:forCharRange:undoTransaction:", v16, v18, v19, 0);
}

- (void)_createCharacterStyleWithParentStyle:(id)a3 style:(unint64_t)a4 color:(id)a5 fontSpec:(id)a6
{
  id v16 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[TSSPropertyMap propertyMap];
  [(TUIWPBuilder *)self _configurePropertyMap:v12 withFontSpec:v11 style:a4 color:v10];
  v13 = [(TUIWPStorage *)self->_wpStorage stylesheet];
  v14 = [v13 variationOfStyle:v16 propertyMap:v12];
  characterStyle = self->_characterStyle;
  self->_characterStyle = v14;
}

- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(void))a4;
  id v7 = objc_alloc((Class)TSWPHyperlinkField);
  id v8 = [(TUIWPStorage *)self->_wpStorage context];
  id v9 = [v7 initWithContext:v8 url:v12];

  id v10 = [(TUIWPStorage *)self->_wpStorage length];
  v6[2](v6);
  id v11 = [(TUIWPStorage *)self->_wpStorage length];
  if (v11 > v10) {
    -[TUIWPStorage addSmartField:toRange:dolcContext:undoTransaction:](self->_wpStorage, "addSmartField:toRange:dolcContext:undoTransaction:", v9, v10, v11 - v10, 0, 0);
  }
}

- (void)appendString:(id)a3
{
  id v6 = a3;
  v4 = [(TUIWPStorage *)self->_wpStorage length];
  -[TUIWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self->_wpStorage, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", [(TUIWPStorage *)self->_wpStorage length], 0, v6, 0, 0);
  v5 = [(TUIWPStorage *)self->_wpStorage length];
  if (v5 > v4) {
    -[TUIWPStorage setCharacterStyle:range:undoTransaction:](self->_wpStorage, "setCharacterStyle:range:undoTransaction:", self->_characterStyle, v4, v5 - v4, 0);
  }
}

- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6
{
  id v22 = a4;
  id v10 = a5;
  v21 = (void (**)(void))a6;
  id v11 = self->_characterStyle;
  id v12 = self->_color;
  v13 = self->_fontSpec;
  if (v10)
  {
    objc_storeStrong((id *)&self->_fontSpec, a5);
    goto LABEL_4;
  }
  if (a3)
  {
LABEL_4:
    v14 = v21;
    if (!v22)
    {
LABEL_6:
      [(TUIWPBuilder *)self _createCharacterStyleWithParentStyle:v11 style:a3 color:v22 fontSpec:v10];
      goto LABEL_7;
    }
LABEL_5:
    objc_storeStrong((id *)&self->_color, a4);
    goto LABEL_6;
  }
  v14 = v21;
  if (v22 && ([(UIColor *)self->_color isEqual:v22] & 1) == 0) {
    goto LABEL_5;
  }
LABEL_7:
  v14[2](v14);
  characterStyle = self->_characterStyle;
  self->_characterStyle = v11;
  id v16 = v11;

  color = self->_color;
  self->_color = v12;
  id v18 = v12;

  fontSpec = self->_fontSpec;
  self->_fontSpec = v13;
}

- (_NSRange)appendWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(TUIWPStorage *)self->_wpStorage length];
  if (v4) {
    v4[2](v4);
  }
  id v6 = (char *)((unsigned char *)[(TUIWPStorage *)self->_wpStorage length] - v5);

  NSUInteger v7 = (NSUInteger)v5;
  NSUInteger v8 = (NSUInteger)v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)finalizeTextModelWithContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_usedDynamicColor) {
    [v4 usedDynamicColor];
  }
  id v6 = self->_wpStorage;

  return v6;
}

- (void)ensureParagraphBoundary
{
  long long v5 = xmmword_243050;
  id v3 = [(TUIWPStorage *)self->_wpStorage paragraphStyleAtCharIndex:[(TUIWPStorage *)self->_wpStorage length] effectiveRange:&v5];
  id v4 = (id)v5;
  if (v4 != [(TUIWPStorage *)self->_wpStorage length]) {
    [(TUIWPStorage *)self->_wpStorage insertString:@"\n" atCharIndex:[(TUIWPStorage *)self->_wpStorage length] undoTransaction:0];
  }
}

- (void)_configurePropertyMap:(id)a3 withFontSpec:(id)a4 style:(unint64_t)a5 color:(id)a6
{
  char v7 = a5;
  id v31 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v10) {
    goto LABEL_17;
  }
  id v12 = +[TUIFontSpec defaultFontSpec];
  unsigned __int8 v13 = [v10 isEqual:v12];

  if (v13) {
    goto LABEL_17;
  }
  v14 = [v10 postscriptName];

  if (!v14)
  {
    if ([v10 isWeightSpecified])
    {
      [v10 weight];
      *(float *)&double v16 = v16;
      [v31 setFloatValue:50 forProperty:v16];
    }
    id v17 = [v10 fontDesignTrait];

    if (v17)
    {
      id v18 = [v10 fontDesignTrait];
      [v31 setObject:v18 forProperty:54];
    }
    else
    {
      uint64_t v19 = [v10 fontFamilyName];

      if (!v19) {
        goto LABEL_12;
      }
      id v20 = +[NSNull null];
      [v31 setObject:v20 forProperty:54];

      id v18 = [v10 fontFamilyName];
      [v31 setObject:v18 forProperty:55];
    }

LABEL_12:
    if ([v10 isMonospacedDigitsSpecified]) {
      [v31 setBoolValue:[v10 monospacedDigits] forProperty:56];
    }
    goto LABEL_14;
  }
  v15 = [v10 postscriptName];
  [v31 setObject:v15 forProperty:16];

LABEL_14:
  if ([v10 isPointSizeSpecified])
  {
    [v10 pointSize];
    *(float *)&double v21 = v21;
    [v31 setFloatValue:17 forProperty:v21];
  }
  [v10 tracking];
  [v10 tracking];
  double v23 = v22 / 1000.0;
  *(float *)&double v23 = v23;
  [v31 setFloatValue:35 forProperty:v23];
LABEL_17:
  if (v7)
  {
    [v31 floatValueForProperty:50];
    if (v24 == -1000.0 || v24 == INFINITY) {
      [(TSWPCharacterStyle *)self->_characterStyle floatValueForProperty:50];
    }
    if (v24 == -1000.0 || v24 == INFINITY || UIFontWeightRegular >= v24)
    {
      HIDWORD(v25) = HIDWORD(UIFontWeightBold);
      *(float *)&double v25 = UIFontWeightBold;
      [v31 setFloatValue:50 forProperty:v25];
    }
  }
  if ((v7 & 2) != 0) {
    [v31 setBoolValue:1 forProperty:20];
  }
  if ((v7 & 8) != 0) {
    [v31 setIntValue:1 forProperty:26];
  }
  if (v11)
  {
    if (self->_usedDynamicColor)
    {
      self->_usedDynamicColor = 1;
    }
    else
    {
      v26 = +[UITraitCollection currentTraitCollection];
      id v27 = [v11 resolvedColorWithTraitCollection:v26];
      self->_usedDynamicColor = v27 != v11;
    }
    v28 = +[TSUColor colorWithPlatformColor:v11];
    [v31 setObject:v28 forProperty:18];
  }
  id v29 = [v10 caps];
  uint64_t v30 = 0;
  switch((unint64_t)v29)
  {
    case 1uLL:
      goto LABEL_38;
    case 2uLL:
      uint64_t v30 = 1;
      goto LABEL_38;
    case 3uLL:
      [v31 setIntValue:2 forProperty:21];
      [v31 setBoolValue:1 forProperty:48];
      break;
    case 4uLL:
      uint64_t v30 = 3;
LABEL_38:
      [v31 setIntValue:v30 forProperty:21];
      break;
    default:
      break;
  }
}

- (void)configureDropCapWithCount:(unint64_t)a3 lines:(unint64_t)a4 raised:(unint64_t)a5 style:(unint64_t)a6 color:(id)a7 fontSpec:(id)a8 backgroundColor:(id)a9 padding:(double)a10
{
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  long long v29 = xmmword_243050;
  id v20 = [(TUIWPStorage *)self->_wpStorage paragraphStyleAtCharIndex:[(TUIWPStorage *)self->_wpStorage length] effectiveRange:&v29];
  if (a3)
  {
    id v28 = v17;
    double v21 = +[TSWPDropCapSpacing dropCapSpacingWithLineCount:a4 elevatedLineCount:a5];
    [v21 setPadding:a10];
    [v21 setFollowingLineCount:0];
    double v22 = +[TSSPropertyMap propertyMap];
    [(TUIWPBuilder *)self _configurePropertyMap:v22 withFontSpec:v18 style:a6 color:v17];
    if (v19)
    {
      double v23 = +[TSUColor colorWithPlatformColor:v19];
      [v22 setObject:v23 forProperty:38];
    }
    float v24 = +[TSWPDropCap dropCapWithCharCount:a3 characterStyleOverridePropertyMap:v22 spacing:v21];
    double v25 = +[TSSPropertyMap propertyMap];
    [v25 setObject:v24 forProperty:109];
    v26 = [(TUIWPStorage *)self->_wpStorage stylesheet];
    id v27 = [v26 variationOfStyle:v20 propertyMap:v25];

    [(TUIWPStorage *)self->_wpStorage setParagraphStyle:v27 forCharRange:v29 undoTransaction:0];
    id v17 = v28;
  }
}

- (void)configureLineStylingForLines:(int64_t)a3 relativeToDropCapLines:(BOOL)a4 style:(unint64_t)a5 color:(id)a6 fontSpec:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  if (a3 >= 1)
  {
    long long v21 = xmmword_243050;
    v14 = [(TUIWPStorage *)self->_wpStorage paragraphStyleAtCharIndex:[(TUIWPStorage *)self->_wpStorage length] effectiveRange:&v21];
    if (v9) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 0;
    }
    double v16 = +[TSSPropertyMap propertyMap];
    [(TUIWPBuilder *)self _configurePropertyMap:v16 withFontSpec:v13 style:a5 color:v12];
    id v17 = +[TSWPLineStyling lineStylingWithLineCount:a3 options:v15 additionalCharacterStylePropertyMap:0 overrideCharacterStylePropertyMap:v16];
    id v18 = +[TSSPropertyMap propertyMap];
    [v18 setObject:v17 forProperty:111];
    id v19 = [(TUIWPStorage *)self->_wpStorage stylesheet];
    id v20 = [v19 variationOfStyle:v14 propertyMap:v18];

    [(TUIWPStorage *)self->_wpStorage setParagraphStyle:v20 forCharRange:v21 undoTransaction:0];
  }
}

- (void)configureParagraphStyle:(id)a3
{
  id v4 = a3;
  long long v15 = xmmword_243050;
  long long v5 = [(TUIWPStorage *)self->_wpStorage paragraphStyleAtCharIndex:[(TUIWPStorage *)self->_wpStorage length] effectiveRange:&v15];
  id v6 = +[TSSPropertyMap propertyMap];
  char v7 = [v4 fontSpec];
  id v8 = [v4 style];
  BOOL v9 = [v4 color];
  [(TUIWPBuilder *)self _configurePropertyMap:v6 withFontSpec:v7 style:v8 color:v9];

  [v4 indentFirstLine];
  *(float *)&double v10 = v10;
  [v6 setFloatValue:80 forProperty:v10];
  [v4 indentLeading];
  *(float *)&double v11 = v11;
  [v6 setFloatValue:81 forProperty:v11];
  [v4 indentTrailing];
  *(float *)&double v12 = v12;
  [v6 setFloatValue:82 forProperty:v12];
  id v13 = [(TUIWPStorage *)self->_wpStorage stylesheet];
  v14 = [v13 variationOfStyle:v5 propertyMap:v6];

  [(TUIWPStorage *)self->_wpStorage setParagraphStyle:v14 forCharRange:v15 undoTransaction:0];
}

- (void)addBox:(id)a3
{
  id v4 = a3;
  childBoxes = self->_childBoxes;
  id v23 = v4;
  if (!childBoxes)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    char v7 = self->_childBoxes;
    self->_childBoxes = v6;

    childBoxes = self->_childBoxes;
    id v4 = v23;
  }
  [(NSMutableArray *)childBoxes addObject:v4];
  id v8 = [_TUIWPInlineDrawable alloc];
  BOOL v9 = [(TUIWPStorage *)self->_wpStorage context];
  double v10 = [(_TUIWPInlineDrawable *)v8 initWithContext:v9 box:v23 baselineOffset:self->_baselineOffset];

  id v11 = objc_alloc((Class)TSWPDrawableAttachment);
  double v12 = [(TUIWPStorage *)self->_wpStorage context];
  id v13 = [v11 initWithContext:v12 drawable:v10];

  v14 = [(TUIWPStorage *)self->_wpStorage length];
  -[TUIWPStorage insertAttachmentOrFootnote:range:](self->_wpStorage, "insertAttachmentOrFootnote:range:", v13, [(TUIWPStorage *)self->_wpStorage length], 0);
  long long v15 = [(TUIWPStorage *)self->_wpStorage length];
  double v16 = self->_characterStyle;
  id v17 = (char *)[v23 layoutDirection];
  if (v17)
  {
    id v18 = +[TSSPropertyMap propertyMap];
    id v19 = v18;
    if (v17 == (unsigned char *)&def_141F14 + 2)
    {
      uint64_t v20 = 1;
    }
    else
    {
      if (v17 != (unsigned char *)&def_141F14 + 1)
      {
LABEL_9:
        long long v21 = [(TUIWPStorage *)self->_wpStorage stylesheet];
        uint64_t v22 = [v21 variationOfStyle:self->_characterStyle propertyMap:v19];

        double v16 = (TSWPCharacterStyle *)v22;
        goto LABEL_10;
      }
      uint64_t v20 = 0;
    }
    [v18 setIntValue:v20 forProperty:44];
    goto LABEL_9;
  }
LABEL_10:
  if (v15 > v14) {
    -[TUIWPStorage setCharacterStyle:range:undoTransaction:](self->_wpStorage, "setCharacterStyle:range:undoTransaction:", v16, v14, v15 - v14, 0);
  }
}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  [a3 updateModelChildren:self->_childBoxes a4, a5];
  childBoxes = self->_childBoxes;

  return childBoxes;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
}

- (void)finalizeModelsWithParent:(id)a3
{
}

- (id)finalizeAnimationGroups
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
}

- (TUIWPStorage)wpStorage
{
  return self->_wpStorage;
}

- (TSWPCharacterStyle)characterStyle
{
  return self->_characterStyle;
}

- (void)setCharacterStyle:(id)a3
{
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_unint64_t alignment = a3;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (void)setShouldHyphenate:(BOOL)a3
{
  self->_shouldHyphenate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_characterStyle, 0);
  objc_storeStrong((id *)&self->_wpStorage, 0);
  objc_storeStrong((id *)&self->_axActions, 0);

  objc_storeStrong((id *)&self->_childBoxes, 0);
}

@end