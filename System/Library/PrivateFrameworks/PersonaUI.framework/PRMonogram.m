@interface PRMonogram
+ (CAGradientLayer)plateOverlayLayer;
+ (double)kerningForFontIndex:(unint64_t)a3 fontSize:(double)a4;
+ (id)_fontSpecs;
+ (id)fontForIndex:(unint64_t)a3 plateDiameter:(double)a4;
+ (id)monogram;
+ (id)monogramWithData:(id)a3;
+ (unint64_t)countOfFonts;
+ (void)updatePlateOverlayLayer:(id)a3;
- (BOOL)_renderTextInContext:(CGContext *)a3 frame:(CGRect)a4;
- (NSString)text;
- (PRMonogram)init;
- (PRMonogram)initWithText:(id)a3 fontIndex:(unint64_t)a4 monogramColor:(id)a5;
- (PRMonogramColor)monogramColor;
- (UIColor)color;
- (UIColor)plateGradientEndColor;
- (UIColor)plateGradientStartColor;
- (UIColor)plateSelectedActiveColor;
- (UIColor)plateSelectedActiveTextColor;
- (UIColor)plateSelectedInactiveColor;
- (id)_initWithData:(id)a3;
- (id)dataRepresentation;
- (id)dataRepresentationWithVersion:(unsigned __int8)a3;
- (id)description;
- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5;
- (id)stringAttributesForDiameter:(double)a3;
- (unint64_t)fontIndex;
- (void)_takeValuesFromDataRepresentation:(id)a3;
- (void)appendToRecipe:(id)a3 text:(id)a4;
- (void)appendToRecipe:(id)a3 text:(id)a4 fontIndex:(unsigned __int8)a5;
- (void)setColor:(id)a3;
- (void)setFontIndex:(unint64_t)a3;
- (void)setFontIndexToUnsupportedValue;
- (void)setMonogramColor:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PRMonogram

- (id)dataRepresentation
{
  return [(PRMonogram *)self dataRepresentationWithVersion:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (id)dataRepresentationWithVersion:(unsigned __int8)a3
{
  unsigned __int8 v23 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
  [v4 appendBytes:&v23 length:1];
  v5 = [(PRMonogram *)self text];

  if (v5)
  {
    id v6 = [(PRMonogram *)self text];
    uint64_t v7 = [v6 UTF8String];

    if (!v7) {
      NSLog(&cfstr_PrmonogramCann_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_PrmonogramCann.isa);
  }
  v8 = [(PRMonogram *)self text];
  [(PRMonogram *)self appendToRecipe:v4 text:v8 fontIndex:[(PRMonogram *)self fontIndex]];

  if (v23)
  {
    v9 = [(PRMonogram *)self monogramColor];
    v10 = [v9 colorName];
    [(PRMonogram *)self appendToRecipe:v4 text:v10];
  }
  else
  {
    double v21 = 0.0;
    double v22 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    v11 = [(PRMonogram *)self color];
    int v12 = [v11 getRed:&v22 green:&v21 blue:&v20 alpha:&v19];

    if (v12)
    {
      int v13 = (int)(v22 * 255.0);
      int v14 = (int)(v21 * 255.0);
      int v15 = (int)(v20 * 255.0);
      int v16 = (int)(v19 * 255.0);
    }
    else
    {
      double v19 = 1.0;
      double v20 = 1.0;
      double v21 = 1.0;
      double v22 = 1.0;
      LOBYTE(v16) = -1;
      LOBYTE(v15) = -1;
      LOBYTE(v14) = -1;
      LOBYTE(v13) = -1;
    }
    v18[0] = v13;
    v18[1] = v14;
    v18[2] = v15;
    v18[3] = v16;
    [v4 appendBytes:v18 length:4];
  }
  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)appendToRecipe:(id)a3 text:(id)a4 fontIndex:(unsigned __int8)a5
{
  id v7 = a3;
  v8 = (void *)[a4 copy];
  v9 = v8;
  if (v8 && (id v10 = v8, [v10 UTF8String]))
  {
    id v11 = v10;
    size_t v12 = strlen((const char *)[v11 UTF8String]);
    char v17 = a5 & 0xF | (16 * v12);
    [v7 appendBytes:&v17 length:1];
    int v13 = (char *)[v11 UTF8String];
    int v14 = v7;
    uint64_t v15 = v12;
  }
  else
  {
    char v16 = a5 & 0xF;
    int v13 = &v16;
    int v14 = v7;
    uint64_t v15 = 1;
  }
  [v14 appendBytes:v13 length:v15];
}

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

void __24__PRMonogram__fontSpecs__block_invoke()
{
  v11[9] = *MEMORY[0x263EF8340];
  v0 = +[_PRMonogramFontSpec specForFontWithName:0 baseSize:105.0 tracking:0.0];
  v1 = +[_PRMonogramFontSpec specForFontWithName:@"AmericanTypewriter-CondensedBold", 113.0, 30.0, v0 baseSize tracking];
  v11[1] = v1;
  v2 = +[_PRMonogramFontSpec specForFontWithName:@"Baskerville-Bold" baseSize:98.0 tracking:0.0];
  v11[2] = v2;
  v3 = +[_PRMonogramFontSpec specForFontWithName:@"Futura-Medium" baseSize:89.0 tracking:-20.0];
  v11[3] = v3;
  id v4 = +[_PRMonogramFontSpec specForFontWithName:@"Cochin-BoldItalic" baseSize:86.0 tracking:40.0];
  v11[4] = v4;
  v5 = +[_PRMonogramFontSpec specForFontWithName:@"SuperClarendon-Regular" baseSize:94.0 tracking:-20.0];
  v11[5] = v5;
  id v6 = +[_PRMonogramFontSpec specForFontWithName:@"Palatino-Bold" baseSize:95.0 tracking:-10.0];
  v11[6] = v6;
  id v7 = +[_PRMonogramFontSpec specForFontWithName:@"Noteworthy-Bold" baseSize:105.0 tracking:0.0];
  v11[7] = v7;
  v8 = +[_PRMonogramFontSpec specForFontWithName:@"HoeflerText-Regular" baseSize:118.0 tracking:-20.0];
  v11[8] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:9];
  id v10 = (void *)_fontSpecs_fontSpecs;
  _fontSpecs_fontSpecs = v9;
}

- (PRMonogram)initWithText:(id)a3 fontIndex:(unint64_t)a4 monogramColor:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PRMonogram;
  id v10 = [(PRMonogram *)&v14 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_text, a3);
    v11->_fontIndex = 0;
    objc_storeStrong((id *)&v11->_monogramColor, a5);
    size_t v12 = v11;
  }

  return v11;
}

- (void)appendToRecipe:(id)a3 text:(id)a4
{
}

- (id)stringAttributesForDiameter:(double)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v4 = +[PRMonogram fontForIndex:[(PRMonogram *)self fontIndex] plateDiameter:a3];
  unint64_t v5 = [(PRMonogram *)self fontIndex];
  [v4 pointSize];
  +[PRMonogram kerningForFontIndex:fontSize:](PRMonogram, "kerningForFontIndex:fontSize:", v5);
  double v7 = v6;
  id v8 = objc_opt_new();
  [v8 setAlignment:1];
  [v8 setAllowsDefaultTighteningForTruncation:1];
  uint64_t v9 = *MEMORY[0x263F814F0];
  v16[0] = v4;
  uint64_t v10 = *MEMORY[0x263F81500];
  v15[0] = v9;
  v15[1] = v10;
  id v11 = [MEMORY[0x263F1C550] whiteColor];
  v16[1] = v11;
  v15[2] = *MEMORY[0x263F81510];
  size_t v12 = [NSNumber numberWithDouble:v7];
  v15[3] = *MEMORY[0x263F81540];
  v16[2] = v12;
  v16[3] = v8;
  int v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v13;
}

- (unint64_t)fontIndex
{
  return self->_fontIndex;
}

- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    uint64_t v10 = DeviceRGB;
    size_t v11 = (unint64_t)(width * a4);
    CGContextRef v12 = CGBitmapContextCreate(0, v11, v11, 8uLL, 4 * v11, DeviceRGB, 0x2001u);
    if (v12)
    {
      int v13 = v12;
      double v14 = (double)v11;
      id v15 = [MEMORY[0x263F1C550] whiteColor];
      CGContextSetFillColorWithColor(v13, (CGColorRef)[v15 CGColor]);

      CGContextSetAlpha(v13, 0.9);
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      v31.size.double width = v14;
      v31.size.double height = v14;
      CGContextFillRect(v13, v31);
      id v16 = [(PRMonogram *)self plateGradientStartColor];
      CGColorRef v17 = CGColorRetain((CGColorRef)[v16 CGColor]);

      if (v17)
      {
        id v18 = [(PRMonogram *)self plateGradientEndColor];
        CGColorRef v19 = CGColorRetain((CGColorRef)[v18 CGColor]);

        if (v19)
        {
          Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x263EFFF70]);
          if (Mutable)
          {
            double v21 = Mutable;
            CFArrayAppendValue(Mutable, v17);
            CFArrayAppendValue(v21, v19);
            CGContextSetAlpha(v13, 1.0);
            double v22 = CGGradientCreateWithColors(v10, v21, 0);
            if (v22)
            {
              unsigned __int8 v23 = v22;
              v29.x = 0.0;
              v29.y = 0.0;
              v30.x = 0.0;
              v30.y = v14;
              CGContextDrawLinearGradient(v13, v22, v29, v30, 0);
              -[PRMonogram _renderTextInContext:frame:](self, "_renderTextInContext:frame:", v13, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v14, v14);
              CGImageRef Image = CGBitmapContextCreateImage(v13);
              if (Image)
              {
                v25 = Image;
                v26 = objc_msgSend(MEMORY[0x263F1C6B0], "pr_imageWithCGImage:size:scale:", Image, width, height, a4);
                CGImageRelease(v25);
              }
              else
              {
                v26 = 0;
              }
              CGGradientRelease(v23);
            }
            else
            {
              v26 = 0;
            }
            CFRelease(v21);
          }
          else
          {
            v26 = 0;
          }
          CGColorRelease(v19);
        }
        else
        {
          v26 = 0;
        }
        CGColorRelease(v17);
      }
      else
      {
        v26 = 0;
      }
      CGContextRelease(v13);
    }
    else
    {
      v26 = 0;
    }
    CGColorSpaceRelease(v10);
  }
  else
  {
    v26 = 0;
  }
  return v26;
}

- (UIColor)plateGradientStartColor
{
  v3 = [(PRMonogram *)self monogramColor];
  if (v3)
  {
    id v4 = [(PRMonogram *)self monogramColor];
    unint64_t v5 = [v4 gradientStartColor];
  }
  else
  {
    unint64_t v5 = +[PRMonogramColor defaultGradientStartColor];
  }

  return (UIColor *)v5;
}

- (UIColor)plateGradientEndColor
{
  v3 = [(PRMonogram *)self monogramColor];
  if (v3)
  {
    id v4 = [(PRMonogram *)self monogramColor];
    unint64_t v5 = [v4 gradientEndColor];
  }
  else
  {
    unint64_t v5 = +[PRMonogramColor defaultGradientEndColor];
  }

  return (UIColor *)v5;
}

- (BOOL)_renderTextInContext:(CGContext *)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v10 = [(PRMonogram *)self text];
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  [(PRMonogram *)self stringAttributesForDiameter:CGRectGetWidth(v22)];
  size_t v11 = (const __CTLine *)CTLineCreateWithString();

  if (!v11) {
    return 0;
  }
  CGFloat descent = 0.0;
  CGFloat ascent = 0.0;
  double TypographicBounds = CTLineGetTypographicBounds(v11, &ascent, &descent, 0);
  BOOL v13 = TypographicBounds > 0.0;
  if (TypographicBounds > 0.0)
  {
    double v14 = TypographicBounds;
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat MidX = CGRectGetMidX(v23);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v24);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double v17 = CGRectGetWidth(v25) * 0.800000012 / v14;
    if (v17 > 1.0) {
      double v17 = 1.0;
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __41__PRMonogram__renderTextInContext_frame___block_invoke;
    v19[3] = &__block_descriptor_88_e5_v8__0l;
    v19[4] = a3;
    *(CGFloat *)&v19[5] = MidX;
    *(CGFloat *)&v19[6] = MidY;
    *(double *)&v19[7] = v17;
    *(double *)&v19[8] = v14 * 0.5;
    *(double *)&v19[9] = (ascent - descent) * 0.5;
    v19[10] = v11;
    UIGraphicsPushContext(a3);
    __41__PRMonogram__renderTextInContext_frame___block_invoke((uint64_t)v19);
    UIGraphicsPopContext();
  }
  CFRelease(v11);
  return v13;
}

void __41__PRMonogram__renderTextInContext_frame___block_invoke(uint64_t a1)
{
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(*(CGContextRef *)(a1 + 32), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56));
  CGContextSetTextPosition(*(CGContextRef *)(a1 + 32), -*(double *)(a1 + 64), -*(double *)(a1 + 72));
  v2 = *(const __CTLine **)(a1 + 80);
  v3 = *(CGContext **)(a1 + 32);
  CTLineDraw(v2, v3);
}

+ (id)monogramWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[PRMonogram alloc] _initWithData:v3];

  return v4;
}

+ (id)monogram
{
  v2 = objc_alloc_init(PRMonogram);
  return v2;
}

- (id)_initWithData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PRMonogram *)self init];
  double v6 = v5;
  if (v4 && v5) {
    [(PRMonogram *)v5 _takeValuesFromDataRepresentation:v4];
  }

  return v6;
}

- (PRMonogram)init
{
  return [(PRMonogram *)self initWithText:&stru_26C639EC0 fontIndex:0 monogramColor:0];
}

- (void)_takeValuesFromDataRepresentation:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 length] <= 2)
  {
    unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    NSLog(&cfstr_PrmonogramFail.isa, v5);
LABEL_3:

    goto LABEL_4;
  }
  id v6 = v4;
  double v7 = (unsigned __int8 *)[v6 bytes];
  uint64_t v8 = *v7;
  if (v8 > 1)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_4;
    }
    unint64_t v22 = v7[1];
    unint64_t v23 = v22 >> 4;
    if (v22 > 0xCF || [v6 length] < v23 + 2)
    {
      unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      CGRect v24 = [NSNumber numberWithUnsignedChar:v8];
      CGRect v25 = [NSNumber numberWithUnsignedChar:v23];
      NSLog(&cfstr_PrmonogramFail_0.isa, v5, v24, v25);

      goto LABEL_3;
    }
    objc_msgSend(v6, "getBytes:range:", v32, 2, v23);
    double v21 = (void *)[[NSString alloc] initWithBytes:v32 length:v23 encoding:4];
    [(PRMonogram *)self setText:v21];
LABEL_20:

    goto LABEL_4;
  }
  unint64_t v9 = v7[1];
  unint64_t v10 = v9 >> 4;
  size_t v11 = &v7[v9 >> 4];
  unsigned int v14 = v11[2];
  CGContextRef v12 = v11 + 2;
  unint64_t v13 = v14;
  if ((v9 & 0xF) <= 8) {
    unint64_t v15 = v9 & 0xF;
  }
  else {
    unint64_t v15 = 0;
  }
  self->_fontIndeCGFloat x = v15;
  if (!v8 && v9 <= 0xCF && [v6 length] == v10 + 6)
  {
    objc_msgSend(v6, "getBytes:range:", v32, 2, v10);
    id v16 = (void *)[[NSString alloc] initWithBytes:v32 length:v10 encoding:4];
    [(PRMonogram *)self setText:v16];

    LOBYTE(v17) = *v12;
    LOBYTE(v18) = v12[1];
    LOBYTE(v19) = v12[2];
    LOBYTE(v20) = v12[3];
    double v21 = [MEMORY[0x263F1C550] colorWithRed:(double)v17 / 255.0 green:(double)v18 / 255.0 blue:(double)v19 / 255.0 alpha:(double)v20 / 255.0];
    [(PRMonogram *)self setColor:v21];
    goto LABEL_20;
  }
  objc_msgSend(v6, "getBytes:range:", v32, 2, v10);
  v26 = (void *)[[NSString alloc] initWithBytes:v32 length:v10 encoding:4];
  [(PRMonogram *)self setText:v26];

  if (v13 >= 0x10)
  {
    MEMORY[0x270FA5388]();
    v28 = &v31[-v27];
    objc_msgSend(v6, "getBytes:range:", &v31[-v27]);
    CGPoint v29 = (void *)[[NSString alloc] initWithBytes:v28 length:v13 >> 4 encoding:4];
    CGPoint v30 = [[PRMonogramColor alloc] initWithColorName:v29];
    [(PRMonogram *)self setMonogramColor:v30];
  }
LABEL_4:
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    unint64_t v5 = [v4 lengthOfBytesUsingEncoding:4];
    if (v5 <= 0xC)
    {
      id v6 = (NSString *)[v9 copy];
      text = self->_text;
      self->_text = v6;
      goto LABEL_6;
    }
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    NSLog(&cfstr_PrmonogramSett.isa, v9, v8, &unk_26C63B9F0);
  }
  text = self->_text;
  self->_text = (NSString *)&stru_26C639EC0;
LABEL_6:
}

+ (id)fontForIndex:(unint64_t)a3 plateDiameter:(double)a4
{
  id v6 = [a1 _fontSpecs];
  double v7 = [v6 objectAtIndexedSubscript:a3];

  [v7 baseSize];
  double v9 = v8 * a4 / 225.0;
  unint64_t v10 = [v7 fontName];

  size_t v11 = (void *)MEMORY[0x263F81708];
  if (v10)
  {
    CGContextRef v12 = [v7 fontName];
    unint64_t v13 = [v11 fontWithName:v12 size:v9];
  }
  else
  {
    unint64_t v13 = [MEMORY[0x263F81708] systemFontOfSize:*MEMORY[0x263F03B70] weight:v9 design:*MEMORY[0x263F03BF0]];
  }

  return v13;
}

+ (double)kerningForFontIndex:(unint64_t)a3 fontSize:(double)a4
{
  id v6 = [a1 _fontSpecs];
  double v7 = [v6 objectAtIndexedSubscript:a3];

  [v7 tracking];
  double v9 = v8 * a4 / 1000.0;

  return v9;
}

+ (id)_fontSpecs
{
  if (_fontSpecs_onceToken != -1) {
    dispatch_once(&_fontSpecs_onceToken, &__block_literal_global);
  }
  v2 = (void *)_fontSpecs_fontSpecs;
  return v2;
}

- (UIColor)color
{
  color = self->_color;
  if (color)
  {
    id v3 = color;
  }
  else
  {
    id v3 = [(PRMonogram *)self plateFlatColor];
  }
  return v3;
}

- (UIColor)plateSelectedActiveColor
{
  id v3 = [(PRMonogram *)self monogramColor];
  if (v3)
  {
    id v4 = [(PRMonogram *)self monogramColor];
    unint64_t v5 = [v4 selectedActiveColor];
  }
  else
  {
    unint64_t v5 = +[PRMonogramColor defaultSelectedActiveColor];
  }

  return (UIColor *)v5;
}

- (UIColor)plateSelectedInactiveColor
{
  id v3 = [(PRMonogram *)self monogramColor];
  if (v3)
  {
    id v4 = [(PRMonogram *)self monogramColor];
    unint64_t v5 = [v4 selectedInactiveColor];
  }
  else
  {
    unint64_t v5 = +[PRMonogramColor defaultSelectedInactiveColor];
  }

  return (UIColor *)v5;
}

- (UIColor)plateSelectedActiveTextColor
{
  id v3 = [(PRMonogram *)self monogramColor];
  if (v3)
  {
    id v4 = [(PRMonogram *)self monogramColor];
    unint64_t v5 = [v4 selectedActiveTextColor];
  }
  else
  {
    unint64_t v5 = +[PRMonogramColor defaultSelectedActiveTextColor];
  }

  return (UIColor *)v5;
}

- (void)setFontIndex:(unint64_t)a3
{
  if (a3 >= 9)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    NSLog(&cfstr_PrmonogramSetf.isa, v4, &unk_26C63BA08);

    a3 = 0;
  }
  self->_fontIndeCGFloat x = a3;
}

- (void)setFontIndexToUnsupportedValue
{
  self->_fontIndeCGFloat x = 9;
}

- (id)description
{
  id v3 = NSString;
  text = self->_text;
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_fontIndex];
  id v6 = [v3 stringWithFormat:@"<PRMonogram %p _text %@ _fontIndex %@>", self, text, v5];

  double v7 = [(PRMonogram *)self monogramColor];

  if (v7)
  {
    double v8 = [(PRMonogram *)self monogramColor];
    double v9 = [v8 colorName];
    uint64_t v10 = [v6 stringByAppendingFormat:@" color %@", v9];

    id v6 = (void *)v10;
  }
  return v6;
}

+ (unint64_t)countOfFonts
{
  v2 = [a1 _fontSpecs];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (CAGradientLayer)plateOverlayLayer
{
  id v3 = objc_alloc_init(MEMORY[0x263F157D0]);
  [a1 updatePlateOverlayLayer:v3];
  return (CAGradientLayer *)v3;
}

+ (void)updatePlateOverlayLayer:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[PRMonogramColor defaultGradientStartColor];
  v7[0] = [v4 CGColor];
  id v5 = +[PRMonogramColor defaultGradientEndColor];
  v7[1] = [v5 CGColor];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  [v3 setColors:v6];

  objc_msgSend(v3, "setStartPoint:", 0.5, 1.0);
  objc_msgSend(v3, "setEndPoint:", 0.5, 0.0);
}

- (void)setColor:(id)a3
{
}

- (void)setMonogramColor:(id)a3
{
}

@end