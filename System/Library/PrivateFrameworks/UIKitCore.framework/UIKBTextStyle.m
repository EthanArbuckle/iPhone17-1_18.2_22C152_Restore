@interface UIKBTextStyle
+ (id)styleWithFontName:(id)a3 withFontSize:(double)a4;
+ (id)styleWithTextColor:(id)a3;
- (BOOL)ignoreTextMarginOnKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertical;
- (BOOL)usesSymbolImage;
- (CGPoint)etchOffset;
- (CGPoint)textOffset;
- (NSString)etchColor;
- (NSString)fontName;
- (NSString)textColor;
- (UIKBTextStyle)init;
- (double)fontSize;
- (double)fontSizeForSymbolImage;
- (double)fontWeight;
- (double)fontWeightForSymbolImage;
- (double)fontWidth;
- (double)imageScale;
- (double)kerning;
- (double)minFontSize;
- (double)pathWeight;
- (double)textOpacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)alignment;
- (int64_t)selector;
- (int64_t)symbolScale;
- (unint64_t)anchorCorner;
- (void)overlayWithStyle:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAnchorCorner:(unint64_t)a3;
- (void)setEtchColor:(id)a3;
- (void)setEtchOffset:(CGPoint)a3;
- (void)setFontName:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setFontSizeForSymbolImage:(double)a3;
- (void)setFontWeight:(double)a3;
- (void)setFontWeightForSymbolImage:(double)a3;
- (void)setFontWidth:(double)a3;
- (void)setIgnoreTextMarginOnKey:(BOOL)a3;
- (void)setImageScale:(double)a3;
- (void)setIsVertical:(BOOL)a3;
- (void)setKerning:(double)a3;
- (void)setMinFontSize:(double)a3;
- (void)setPathWeight:(double)a3;
- (void)setSelector:(int64_t)a3;
- (void)setSymbolScale:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextOffset:(CGPoint)a3;
- (void)setTextOpacity:(double)a3;
- (void)setUsesSymbolImage:(BOOL)a3;
@end

@implementation UIKBTextStyle

+ (id)styleWithFontName:(id)a3 withFontSize:(double)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(UIKBTextStyle);
  [(UIKBTextStyle *)v6 setTextOpacity:1.0];
  [(UIKBTextStyle *)v6 setImageScale:1.0];
  [(UIKBTextStyle *)v6 setFontName:v5];

  [(UIKBTextStyle *)v6 setFontSize:a4];
  [(UIKBTextStyle *)v6 setFontWeight:0.0];
  [(UIKBTextStyle *)v6 setFontWidth:*(double *)off_1E52D6C18];
  [(UIKBTextStyle *)v6 setIgnoreTextMarginOnKey:0];
  [(UIKBTextStyle *)v6 setAnchorCorner:0];
  [(UIKBTextStyle *)v6 setSymbolScale:0];
  return v6;
}

+ (id)styleWithTextColor:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UIKBTextStyle);
  [(UIKBTextStyle *)v4 setFontWeight:0.0];
  [(UIKBTextStyle *)v4 setFontWidth:*(double *)off_1E52D6C18];
  [(UIKBTextStyle *)v4 setTextOpacity:1.0];
  [(UIKBTextStyle *)v4 setImageScale:1.0];
  [(UIKBTextStyle *)v4 setTextColor:v3];

  [(UIKBTextStyle *)v4 setIgnoreTextMarginOnKey:0];
  [(UIKBTextStyle *)v4 setAnchorCorner:0];
  [(UIKBTextStyle *)v4 setSymbolScale:0];
  return v4;
}

- (UIKBTextStyle)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBTextStyle;
  result = [(UIKBTextStyle *)&v3 init];
  if (result)
  {
    result->_imageScale = 1.0;
    result->_alignment = 1;
    result->_pathWeight = 1.0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(UIKBTextStyle *)self fontName];
  [v3 appendFormat:@"; fontName = %@", v4];

  [(UIKBTextStyle *)self fontSize];
  objc_msgSend(v3, "appendFormat:", @"; fontSize = %f", v5);
  [(UIKBTextStyle *)self fontWeight];
  objc_msgSend(v3, "appendFormat:", @"; fontWeight = %f", v6);
  [(UIKBTextStyle *)self fontWidth];
  objc_msgSend(v3, "appendFormat:", @"; fontWidth = %f", v7);
  [(UIKBTextStyle *)self minFontSize];
  if (v8 != 0.0)
  {
    [(UIKBTextStyle *)self minFontSize];
    objc_msgSend(v3, "appendFormat:", @"; minFontSize = %f", v9);
  }
  [(UIKBTextStyle *)self fontSizeForSymbolImage];
  if (v10 > 0.0)
  {
    [(UIKBTextStyle *)self fontSizeForSymbolImage];
    objc_msgSend(v3, "appendFormat:", @"; fontSizeForSymbolImage = %f", v11);
  }
  [(UIKBTextStyle *)self kerning];
  if (v12 != 0.0)
  {
    [(UIKBTextStyle *)self kerning];
    objc_msgSend(v3, "appendFormat:", @"; kerning = %f", v13);
  }
  [(UIKBTextStyle *)self textOpacity];
  if (v14 != 1.0)
  {
    [(UIKBTextStyle *)self textOpacity];
    objc_msgSend(v3, "appendFormat:", @"; textOpacity = %f", v15);
  }
  v16 = [(UIKBTextStyle *)self textColor];

  if (v16)
  {
    v17 = [(UIKBTextStyle *)self textColor];
    [v3 appendFormat:@"; textColor = %@", v17];
  }
  v18 = [(UIKBTextStyle *)self etchColor];

  if (v18)
  {
    v19 = [(UIKBTextStyle *)self etchColor];
    [v3 appendFormat:@"; etchColor = %@", v19];
  }
  if ([(UIKBTextStyle *)self alignment] != 1) {
    objc_msgSend(v3, "appendFormat:", @"; alignment = %d", -[UIKBTextStyle alignment](self, "alignment"));
  }
  [(UIKBTextStyle *)self textOffset];
  double v22 = *MEMORY[0x1E4F1DAD8];
  double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v23 != *MEMORY[0x1E4F1DAD8] || v20 != v21)
  {
    [(UIKBTextStyle *)self textOffset];
    v24 = NSStringFromCGPoint(v32);
    [v3 appendFormat:@"; textOffset = %@", v24];
  }
  [(UIKBTextStyle *)self etchOffset];
  if (v26 != v22 || v25 != v21)
  {
    [(UIKBTextStyle *)self etchOffset];
    v27 = NSStringFromCGPoint(v33);
    [v3 appendFormat:@"; etchOffset = %@", v27];
  }
  [(UIKBTextStyle *)self pathWeight];
  if (v28 != 0.0)
  {
    [(UIKBTextStyle *)self pathWeight];
    objc_msgSend(v3, "appendFormat:", @"; pathWeight = %f", v29);
  }
  if ([(UIKBTextStyle *)self selector]) {
    objc_msgSend(v3, "appendFormat:", @"; selector = %d", -[UIKBTextStyle selector](self, "selector"));
  }
  objc_msgSend(v3, "appendFormat:", @"; ignoreTextMarginOnKey = %d",
    [(UIKBTextStyle *)self ignoreTextMarginOnKey]);
  objc_msgSend(v3, "appendFormat:", @"; anchorCorner = %lu", -[UIKBTextStyle anchorCorner](self, "anchorCorner"));
  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIKBTextStyle *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  fontName = self->_fontName;
  if ((v4->_fontName == 0) == (fontName != 0)
    || fontName && !-[NSString isEqualToString:](fontName, "isEqualToString:"))
  {
    goto LABEL_31;
  }
  if (self->_fontSize != v4->_fontSize) {
    goto LABEL_31;
  }
  if (self->_fontSizeForSymbolImage != v4->_fontSizeForSymbolImage) {
    goto LABEL_31;
  }
  if (self->_minFontSize != v4->_minFontSize) {
    goto LABEL_31;
  }
  if (self->_kerning != v4->_kerning) {
    goto LABEL_31;
  }
  if (self->_textOpacity != v4->_textOpacity) {
    goto LABEL_31;
  }
  textColor = self->_textColor;
  if ((textColor != 0) == (v4->_textColor == 0)
    || textColor && !-[NSString isEqualToString:](textColor, "isEqualToString:"))
  {
    goto LABEL_31;
  }
  etchColor = self->_etchColor;
  if ((etchColor != 0) == (v4->_etchColor == 0)
    || etchColor && !-[NSString isEqualToString:](etchColor, "isEqualToString:"))
  {
    goto LABEL_31;
  }
  if (self->_alignment != v4->_alignment) {
    goto LABEL_31;
  }
  BOOL v8 = 0;
  if (self->_textOffset.x == v4->_textOffset.x && self->_textOffset.y == v4->_textOffset.y)
  {
    BOOL v8 = 0;
    if (self->_etchOffset.x == v4->_etchOffset.x && self->_etchOffset.y == v4->_etchOffset.y)
    {
      if (self->_pathWeight == v4->_pathWeight
        && self->_fontWeight == v4->_fontWeight
        && self->_fontWidth == v4->_fontWidth
        && self->_fontWeightForSymbolImage == v4->_fontWeightForSymbolImage
        && self->_anchorCorner == v4->_anchorCorner
        && self->_selector == v4->_selector
        && self->_ignoreTextMarginOnKey == v4->_ignoreTextMarginOnKey
        && self->_isVertical == v4->_isVertical)
      {
        BOOL v8 = self->_symbolScale == v4->_symbolScale;
        goto LABEL_33;
      }
LABEL_31:
      BOOL v8 = 0;
    }
  }
LABEL_33:

  return v8;
}

- (void)overlayWithStyle:(id)a3
{
  id v24 = a3;
  v4 = [v24 fontName];

  if (v4)
  {
    uint64_t v5 = [v24 fontName];
    [(UIKBTextStyle *)self setFontName:v5];
  }
  [v24 fontSize];
  if (v6 > 0.0)
  {
    [v24 fontSize];
    -[UIKBTextStyle setFontSize:](self, "setFontSize:");
  }
  [v24 fontSizeForSymbolImage];
  if (v7 > 0.0)
  {
    [v24 fontSizeForSymbolImage];
    -[UIKBTextStyle setFontSizeForSymbolImage:](self, "setFontSizeForSymbolImage:");
  }
  [v24 minFontSize];
  if (v8 > 0.0)
  {
    [v24 minFontSize];
    -[UIKBTextStyle setMinFontSize:](self, "setMinFontSize:");
  }
  [v24 kerning];
  if (fabs(v9) >= 2.22044605e-16)
  {
    [v24 kerning];
    -[UIKBTextStyle setKerning:](self, "setKerning:");
  }
  [v24 textOpacity];
  if (fabs(v10 + -1.0) >= 2.22044605e-16)
  {
    [v24 textOpacity];
    -[UIKBTextStyle setTextOpacity:](self, "setTextOpacity:");
  }
  uint64_t v11 = [v24 textColor];

  if (v11)
  {
    double v12 = [v24 textColor];
    [(UIKBTextStyle *)self setTextColor:v12];
  }
  uint64_t v13 = [v24 etchColor];

  if (v13)
  {
    double v14 = [v24 etchColor];
    [(UIKBTextStyle *)self setEtchColor:v14];
  }
  if ([v24 alignment] != 1) {
    -[UIKBTextStyle setAlignment:](self, "setAlignment:", [v24 alignment]);
  }
  if ([v24 anchorCorner])
  {
    double v16 = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [v24 textOffset];
    double v16 = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (*MEMORY[0x1E4F1DAD8] != v18 || v15 != v17)
    {
      [v24 textOffset];
      -[UIKBTextStyle setTextOffset:](self, "setTextOffset:");
    }
  }
  [v24 etchOffset];
  if (v16 != v20 || v15 != v19)
  {
    [v24 etchOffset];
    -[UIKBTextStyle setEtchOffset:](self, "setEtchOffset:");
  }
  [v24 pathWeight];
  if (v21 != 0.0)
  {
    [v24 pathWeight];
    -[UIKBTextStyle setPathWeight:](self, "setPathWeight:");
  }
  [v24 fontWeight];
  if (v22 != 0.0)
  {
    [v24 fontWeight];
    -[UIKBTextStyle setFontWeight:](self, "setFontWeight:");
  }
  [v24 fontWidth];
  if (v23 != 0.0)
  {
    [v24 fontWidth];
    -[UIKBTextStyle setFontWidth:](self, "setFontWidth:");
  }
  if ([v24 selector]) {
    -[UIKBTextStyle setSelector:](self, "setSelector:", [v24 selector]);
  }
  if ([v24 isVertical]) {
    -[UIKBTextStyle setIsVertical:](self, "setIsVertical:", [v24 isVertical]);
  }
  -[UIKBTextStyle setIgnoreTextMarginOnKey:](self, "setIgnoreTextMarginOnKey:", [v24 ignoreTextMarginOnKey]);
  if ([v24 symbolScale]) {
    -[UIKBTextStyle setSymbolScale:](self, "setSymbolScale:", [v24 symbolScale]);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[UIKBTextStyle allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_fontName copy];
  fontName = v4->_fontName;
  v4->_fontName = (NSString *)v5;

  v4->_fontSize = self->_fontSize;
  v4->_fontSizeForSymbolImage = self->_fontSizeForSymbolImage;
  v4->_minFontSize = self->_minFontSize;
  v4->_kerning = self->_kerning;
  v4->_textOpacity = self->_textOpacity;
  uint64_t v7 = [(NSString *)self->_textColor copy];
  textColor = v4->_textColor;
  v4->_textColor = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_etchColor copy];
  etchColor = v4->_etchColor;
  v4->_etchColor = (NSString *)v9;

  v4->_alignment = self->_alignment;
  v4->_textOffset = self->_textOffset;
  v4->_etchOffset = self->_etchOffset;
  v4->_pathWeight = self->_pathWeight;
  v4->_fontWeight = self->_fontWeight;
  v4->_fontWeightForSymbolImage = self->_fontWeightForSymbolImage;
  v4->_fontWidth = self->_fontWidth;
  v4->_anchorCorner = self->_anchorCorner;
  v4->_selector = self->_selector;
  v4->_usesSymbolImage = self->_usesSymbolImage;
  v4->_isVertical = self->_isVertical;
  v4->_symbolScale = self->_symbolScale;
  return v4;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (void)setImageScale:(double)a3
{
  self->_imageScale = a3;
}

- (double)minFontSize
{
  return self->_minFontSize;
}

- (void)setMinFontSize:(double)a3
{
  self->_minFontSize = a3;
}

- (double)kerning
{
  return self->_kerning;
}

- (void)setKerning:(double)a3
{
  self->_kerning = a3;
}

- (double)textOpacity
{
  return self->_textOpacity;
}

- (void)setTextOpacity:(double)a3
{
  self->_textOpacity = a3;
}

- (NSString)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (NSString)etchColor
{
  return self->_etchColor;
}

- (void)setEtchColor:(id)a3
{
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (CGPoint)textOffset
{
  double x = self->_textOffset.x;
  double y = self->_textOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTextOffset:(CGPoint)a3
{
  self->_textOffset = a3;
}

- (CGPoint)etchOffset
{
  double x = self->_etchOffset.x;
  double y = self->_etchOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEtchOffset:(CGPoint)a3
{
  self->_etchOffset = a3;
}

- (double)pathWeight
{
  return self->_pathWeight;
}

- (void)setPathWeight:(double)a3
{
  self->_pathWeight = a3;
}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(double)a3
{
  self->_fontWeight = a3;
}

- (double)fontWidth
{
  return self->_fontWidth;
}

- (void)setFontWidth:(double)a3
{
  self->_fontWidth = a3;
}

- (unint64_t)anchorCorner
{
  return self->_anchorCorner;
}

- (void)setAnchorCorner:(unint64_t)a3
{
  self->_anchorCorner = a3;
}

- (int64_t)selector
{
  return self->_selector;
}

- (void)setSelector:(int64_t)a3
{
  self->_selector = a3;
}

- (BOOL)ignoreTextMarginOnKey
{
  return self->_ignoreTextMarginOnKey;
}

- (void)setIgnoreTextMarginOnKey:(BOOL)a3
{
  self->_ignoreTextMarginOnKedouble y = a3;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (void)setIsVertical:(BOOL)a3
{
  self->_isVertical = a3;
}

- (double)fontSizeForSymbolImage
{
  return self->_fontSizeForSymbolImage;
}

- (void)setFontSizeForSymbolImage:(double)a3
{
  self->_fontSizeForSymbolImage = a3;
}

- (double)fontWeightForSymbolImage
{
  return self->_fontWeightForSymbolImage;
}

- (void)setFontWeightForSymbolImage:(double)a3
{
  self->_fontWeightForSymbolImage = a3;
}

- (BOOL)usesSymbolImage
{
  return self->_usesSymbolImage;
}

- (void)setUsesSymbolImage:(BOOL)a3
{
  self->_usesSymbolImage = a3;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_symbolScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etchColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end