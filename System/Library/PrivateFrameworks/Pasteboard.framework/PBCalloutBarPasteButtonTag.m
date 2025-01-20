@interface PBCalloutBarPasteButtonTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CGPoint)titleOrigin;
- (CGSize)size;
- (PBCalloutBarPasteButtonTag)initWithCoder:(id)a3;
- (PBCalloutBarPasteButtonTag)initWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 titleWidth:(double)a6 contentScaleLevel:(unint64_t)a7;
- (double)titleWidth;
- (float)backgroundStatisticsForegroundForStyle:(id)a3;
- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8;
- (id)resolvedStyleForStyle:(id)a3;
- (unint64_t)authenticationMessageContextForStyle:(id)a3;
- (unint64_t)contentScaleLevel;
- (unint64_t)hash;
- (unsigned)secureName;
- (unsigned)secureNameForStyle:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBCalloutBarPasteButtonTag

- (PBCalloutBarPasteButtonTag)initWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 titleWidth:(double)a6 contentScaleLevel:(unint64_t)a7
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)PBCalloutBarPasteButtonTag;
  result = [(PBCalloutBarPasteButtonTag *)&v15 init];
  if (result)
  {
    result->_secureName = a3;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_titleOrigin.CGFloat x = x;
    result->_titleOrigin.CGFloat y = y;
    result->_titleWidth = a6;
    result->_contentScaleLevel = a7;
  }
  return result;
}

- (PBCalloutBarPasteButtonTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PBCalloutBarPasteButtonTag;
  v5 = [(PBPasteButtonTag *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_secureName = [v4 decodeInt32ForKey:@"secureName"];
    [v4 decodeSizeForKey:@"size"];
    v5->_size.CGFloat width = v6;
    v5->_size.CGFloat height = v7;
    [v4 decodePointForKey:@"titleOrigin"];
    v5->_titleOrigin.CGFloat x = v8;
    v5->_titleOrigin.CGFloat y = v9;
    [v4 decodeDoubleForKey:@"titleWidth"];
    v5->_titleWidth = v10;
    v5->_contentScaleLevel = [v4 decodeIntegerForKey:@"contentScaleLevel"];
  }

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return 0xA16D1C5A60C000E1;
}

- (float)backgroundStatisticsForegroundForStyle:(id)a3
{
  unint64_t v3 = [a3 userInterfaceStyle];
  float result = NAN;
  if (v3 < 2) {
    return 1.0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBCalloutBarPasteButtonTag;
  id v4 = a3;
  [(PBPasteButtonTag *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_secureName, @"secureName", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeSize:forKey:", @"size", self->_size.width, self->_size.height);
  objc_msgSend(v4, "encodePoint:forKey:", @"titleOrigin", self->_titleOrigin.x, self->_titleOrigin.y);
  [v4 encodeDouble:@"titleWidth" forKey:self->_titleWidth];
  [v4 encodeInteger:self->_contentScaleLevel forKey:@"contentScaleLevel"];
}

- (unint64_t)hash
{
  uint64_t v3 = +[PBCalloutBarPasteButtonTag hash];
  int8x16_t v4 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_size), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_titleOrigin));
  return *(void *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ (unint64_t)self->_titleWidth ^ self->_contentScaleLevel ^ v3 ^ self->_secureName;
}

- (BOOL)isEqual:(id)a3
{
  int8x16_t v4 = (double *)a3;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_secureName == *((_DWORD *)v4 + 2)
    && (self->_size.width == v4[4] ? (BOOL v5 = self->_size.height == v4[5]) : (BOOL v5 = 0),
        v5
     && (self->_titleOrigin.x == v4[6] ? (BOOL v6 = self->_titleOrigin.y == v4[7]) : (BOOL v6 = 0),
         v6 && self->_titleWidth == v4[2]))
    && self->_contentScaleLevel == *((void *)v4 + 3);

  return v7;
}

- (BOOL)isValid
{
  if ((self->_secureName & 0xFFFFFFFC) != 0x10000) {
    return 0;
  }
  if (self->_contentScaleLevel - 1 > 9) {
    return 0;
  }
  double x = self->_titleOrigin.x;
  double width = self->_size.width;
  if (x > width) {
    return 0;
  }
  double y = self->_titleOrigin.y;
  double height = self->_size.height;
  if (y > height || x + self->_titleWidth > width) {
    return 0;
  }
  BOOL v6 = width < 0.0 || ((*(void *)&width & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
  if (v6 && (unint64_t)(*(void *)&width - 1) > 0xFFFFFFFFFFFFELL) {
    return 0;
  }
  BOOL v8 = height < 0.0 || ((*(void *)&height & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
  if (v8 && (unint64_t)(*(void *)&height - 1) > 0xFFFFFFFFFFFFELL) {
    return 0;
  }
  BOOL v10 = (*(void *)&x & 0x7FFFFFFFFFFFFFFFLL) == 0;
  if ((unint64_t)(*(void *)&x - 1) < 0xFFFFFFFFFFFFFLL) {
    BOOL v10 = 1;
  }
  char v12 = ((*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && x >= 0.0 || v10;
  BOOL v13 = (unint64_t)(*(void *)&y - 1) < 0xFFFFFFFFFFFFFLL || (*(void *)&y & 0x7FFFFFFFFFFFFFFFLL) == 0;
  char v15 = ((*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && y >= 0.0 || v13;
  return v12 & v15;
}

- (id)resolvedStyleForStyle:(id)a3
{
  uint64_t v3 = (void *)[a3 copyWithChangeBlock:&__block_literal_global];
  return v3;
}

void __52__PBCalloutBarPasteButtonTag_resolvedStyleForStyle___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setAccessibilityContrast:0];
  [v5 setDisplayRange:0];
  [v5 setLayoutDirection:0];
  [v5 setLegibilityWeight:0];
  unint64_t v2 = [v5 preferredContentSizeCategory];
  if (v2 <= 3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = v2;
  }
  [v5 setPreferredContentSizeCategory:v3];
  GenericGrayGamma2_2 = CGColorCreateGenericGrayGamma2_2(1.0, 0.96);
  [v5 setTintColor:GenericGrayGamma2_2];
  CGColorRelease(GenericGrayGamma2_2);
  [v5 setUserInterfaceIdiom:0];
  [v5 setUserInterfaceStyle:0];
}

- (unsigned)secureNameForStyle:(id)a3
{
  return self->_secureName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8
{
  if (a3)
  {
    CGFloat v9 = (*((void (**)(id, PBCalloutBarPasteButtonTag *))a3 + 2))(a3, self);
  }
  else
  {
    CGFloat v9 = 0;
  }
  return v9;
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGPoint)titleOrigin
{
  objc_copyStruct(v4, &self->_titleOrigin, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (double)titleWidth
{
  return self->_titleWidth;
}

- (unint64_t)contentScaleLevel
{
  return self->_contentScaleLevel;
}

@end