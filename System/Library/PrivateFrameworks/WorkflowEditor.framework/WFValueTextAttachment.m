@interface WFValueTextAttachment
+ (id)humanReadableStringFromValueTextAttributedString:(id)a3;
- (BOOL)requiresRedraw;
- (BOOL)selected;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (NSAttributedString)displayString;
- (NSDictionary)attributes;
- (NSString)stringValue;
- (NSString)valueName;
- (UIEdgeInsets)borderInsets;
- (UIEdgeInsets)textInsets;
- (WFValueTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (double)cornerRadius;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (id)value;
- (void)setAttributes:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setRequiresRedraw:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStringValue:(id)a3;
@end

@implementation WFValueTextAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)requiresRedraw
{
  return self->_requiresRedraw;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setStringValue:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)valueName
{
  return 0;
}

- (id)value
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(WFValueTextAttachment *)self textInsets];
  double v31 = v8;
  double v32 = v7;
  double v10 = v9;
  double v12 = v11;
  [(WFValueTextAttachment *)self borderInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(WFValueTextAttachment *)self displayString];
  [v21 size];
  double v23 = v22;
  double v25 = v24;

  double v26 = v20 + v10 + v12 + v16 + v23;
  double v27 = v18 + v32 + v31 + v14;
  double v28 = v27 + v25;
  double v29 = y - v27;
  double v30 = x;
  result.size.height = v28;
  result.size.width = v26;
  result.origin.double y = v29;
  result.origin.CGFloat x = v30;
  return result;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  [(WFValueTextAttachment *)self borderInsets];
  double v11 = v8 + v10;
  double v13 = v9 + v12;
  double v15 = width - (v10 + v14);
  double v17 = height - (v12 + v16);
  v41.double width = width;
  v41.double height = height;
  UIGraphicsBeginImageContextWithOptions(v41, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  double v19 = [(WFValueTextAttachment *)self displayString];
  [(WFValueTextAttachment *)self textInsets];
  objc_msgSend(v19, "drawInRect:", v11 + v23, v13 + v20, v15 - (v23 + v21), v17 - (v20 + v22));

  [(WFValueTextAttachment *)self setRequiresRedraw:0];
  if ([(WFValueTextAttachment *)self selected])
  {
    v42.origin.CGFloat x = v8;
    v42.origin.double y = v9;
    v42.size.double width = width;
    v42.size.double height = height;
    v39.b = 0.0;
    v39.c = 0.0;
    v39.a = 1.0;
    *(_OWORD *)&v39.d = xmmword_234B795D0;
    v39.tdouble y = CGRectGetHeight(v42);
    CGContextConcatCTM(CurrentContext, &v39);
    Image = CGBitmapContextCreateImage(CurrentContext);
    size_t v25 = CGImageGetWidth(Image);
    size_t v26 = CGImageGetHeight(Image);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
    size_t BytesPerRow = CGImageGetBytesPerRow(Image);
    DataProvider = CGImageGetDataProvider(Image);
    Decode = CGImageGetDecode(Image);
    BOOL ShouldInterpolate = CGImageGetShouldInterpolate(Image);
    v33 = CGImageMaskCreate(v25, v26, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, Decode, ShouldInterpolate);
    v43.origin.CGFloat x = v8;
    v43.origin.double y = v9;
    v43.size.double width = width;
    v43.size.double height = height;
    CGContextClearRect(CurrentContext, v43);
    v44.origin.CGFloat x = v8;
    v44.origin.double y = v9;
    v44.size.double width = width;
    v44.size.double height = height;
    CGContextClipToMask(CurrentContext, v44, v33);
    v34 = [(WFValueTextAttachment *)self attributes];
    id v35 = [v34 objectForKey:*MEMORY[0x263F81500]];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v35 CGColor]);

    v45.origin.CGFloat x = v11;
    v45.origin.double y = v13;
    v45.size.double width = v15;
    v45.size.double height = v17;
    v36 = CGPathCreateWithRoundedRect(v45, 3.0, 3.0, 0);
    CGContextAddPath(CurrentContext, v36);
    CGContextFillPath(CurrentContext);
    CGPathRelease(v36);
    v37 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(v33);
    CGImageRelease(Image);
  }
  else
  {
    v37 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(WFValueTextAttachment *)self setImage:v37];
  }
  return v37;
}

- (void)setAttributes:(id)a3
{
  id v7 = (id)[a3 mutableCopy];
  [v7 removeObjectForKey:*MEMORY[0x263F814A0]];
  v4 = (NSDictionary *)[v7 copy];
  if ([(WFValueTextAttachment *)self requiresRedraw]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [(NSDictionary *)self->_attributes isEqual:v4] ^ 1;
  }
  [(WFValueTextAttachment *)self setRequiresRedraw:v5];
  attributes = self->_attributes;
  self->_attributes = v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WFValueTextAttachment *)self requiresRedraw]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = self->_selected != v3;
  }
  [(WFValueTextAttachment *)self setRequiresRedraw:v5];
  self->_selected = v3;
}

- (void)setRequiresRedraw:(BOOL)a3
{
  if (a3)
  {
    displayString = self->_displayString;
    self->_displayString = 0;
  }
  self->_requiresRedraw = a3;
}

- (NSAttributedString)displayString
{
  displayString = self->_displayString;
  if (!displayString)
  {
    v4 = [(WFValueTextAttachment *)self attributes];
    BOOL v5 = (void *)[v4 mutableCopy];

    id v6 = objc_alloc(MEMORY[0x263F089B8]);
    id v7 = [(WFValueTextAttachment *)self valueName];
    if (v7)
    {
      double v8 = (NSAttributedString *)[v6 initWithString:v7 attributes:v5];
    }
    else
    {
      double v9 = [(WFValueTextAttachment *)self stringValue];
      double v8 = (NSAttributedString *)[v6 initWithString:v9 attributes:v5];
    }
    double v10 = [MEMORY[0x263F825C8] grayColor];
    [v5 setObject:v10 forKey:*MEMORY[0x263F81500]];

    if (!self->_selected)
    {
      double v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@", ", v5 attributes];
      [(NSAttributedString *)v8 appendAttributedString:v11];
    }
    double v12 = self->_displayString;
    self->_displayString = v8;

    displayString = self->_displayString;
  }
  return displayString;
}

- (UIEdgeInsets)borderInsets
{
  double v2 = 0.0;
  if (self->_selected) {
    double v3 = 3.0;
  }
  else {
    double v3 = 0.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)textInsets
{
  double v2 = 3.0;
  double v3 = 0.0;
  if (self->_selected) {
    double v3 = 3.0;
  }
  double v4 = 3.0;
  double v5 = v3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (WFValueTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFValueTextAttachment;
  double v4 = [(WFValueTextAttachment *)&v8 initWithData:a3 ofType:a4];
  double v5 = v4;
  if (v4)
  {
    [(WFValueTextAttachment *)v4 setCornerRadius:3.0];
    id v6 = v5;
  }

  return v5;
}

+ (id)humanReadableStringFromValueTextAttributedString:(id)a3
{
  double v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = *MEMORY[0x263F814A0];
  uint64_t v5 = [v3 length];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__WFValueTextAttachment_humanReadableStringFromValueTextAttributedString___block_invoke;
  v9[3] = &unk_264BFCFB0;
  id v10 = v3;
  id v6 = v3;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v9);
  id v7 = [v6 string];

  return v7;
}

void __74__WFValueTextAttachment_humanReadableStringFromValueTextAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v8 = v14;
  if (isKindOfClass)
  {
    double v9 = [v14 valueName];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v14 stringValue];
    }
    double v12 = v11;

    if (a3 + a4 != [*(id *)(a1 + 32) length])
    {
      uint64_t v13 = [v12 stringByAppendingString:@", "];

      double v12 = (void *)v13;
    }
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v12);

    objc_super v8 = v14;
  }
}

@end