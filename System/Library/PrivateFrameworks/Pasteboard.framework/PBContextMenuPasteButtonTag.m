@interface PBContextMenuPasteButtonTag
+ (BOOL)supportsSecureCoding;
- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3;
- (BOOL)hasTrailingGutter;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CGPoint)titleOrigin;
- (CGSize)size;
- (PBContextMenuPasteButtonTag)initWithCoder:(id)a3;
- (PBContextMenuPasteButtonTag)initWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 layoutSize:(int64_t)a6 hasTrailingGutter:(BOOL)a7;
- (float)backgroundStatisticsFailingContrastForStyle:(id)a3;
- (float)backgroundStatisticsForegroundForStyle:(id)a3;
- (float)backgroundStatisticsPassingContrastForStyle:(id)a3;
- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8;
- (id)resolvedStyleForStyle:(id)a3;
- (int64_t)initialSampleEventForStyle:(id)a3;
- (int64_t)layoutSize;
- (unint64_t)authenticationMessageContextForStyle:(id)a3;
- (unint64_t)hash;
- (unsigned)secureName;
- (unsigned)secureNameForStyle:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBContextMenuPasteButtonTag

- (PBContextMenuPasteButtonTag)initWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 layoutSize:(int64_t)a6 hasTrailingGutter:(BOOL)a7
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)PBContextMenuPasteButtonTag;
  result = [(PBContextMenuPasteButtonTag *)&v15 init];
  if (result)
  {
    result->_secureName = a3;
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_titleOrigin.CGFloat x = x;
    result->_titleOrigin.CGFloat y = y;
    result->_layoutSize = a6;
    result->_hasTrailingGutter = a7;
  }
  return result;
}

- (PBContextMenuPasteButtonTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBContextMenuPasteButtonTag;
  v5 = [(PBPasteButtonTag *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_secureName = [v4 decodeInt32ForKey:@"secureName"];
    [v4 decodeSizeForKey:@"size"];
    v5->_size.CGFloat width = v6;
    v5->_size.CGFloat height = v7;
    [v4 decodePointForKey:@"titleOrigin"];
    v5->_titleOrigin.CGFloat x = v8;
    v5->_titleOrigin.CGFloat y = v9;
    v5->_layoutSize = [v4 decodeIntegerForKey:@"layoutSize"];
    v5->_hasTrailingGutter = [v4 decodeBoolForKey:@"hasTrailingGutter"];
  }

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  if ([a3 userInterfaceStyle]) {
    return 0xA9745AB1695ED68BLL;
  }
  else {
    return 0xF635B19E69CD15ECLL;
  }
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegionForStyle:(id)a3
{
  return ($BEA516A46C1BA1F84587E5D243A711F7)(0x5000500050005 * [a3 displayScale]);
}

- (float)backgroundStatisticsPassingContrastForStyle:(id)a3
{
  id v4 = a3;
  if ([v4 userInterfaceStyle] == 1)
  {
    float v5 = 2.1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBContextMenuPasteButtonTag;
    [(PBPasteButtonTag *)&v8 backgroundStatisticsPassingContrastForStyle:v4];
    float v5 = v6;
  }

  return v5;
}

- (float)backgroundStatisticsFailingContrastForStyle:(id)a3
{
  id v4 = a3;
  if ([v4 userInterfaceStyle] == 1)
  {
    float v5 = 1.9;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PBContextMenuPasteButtonTag;
    [(PBPasteButtonTag *)&v8 backgroundStatisticsFailingContrastForStyle:v4];
    float v5 = v6;
  }

  return v5;
}

- (float)backgroundStatisticsForegroundForStyle:(id)a3
{
  uint64_t v3 = [a3 userInterfaceStyle];
  float result = NAN;
  if (v3 == 1) {
    float result = 1.0;
  }
  if (!v3) {
    return 0.0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBContextMenuPasteButtonTag;
  id v4 = a3;
  [(PBPasteButtonTag *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_secureName, @"secureName", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeSize:forKey:", @"size", self->_size.width, self->_size.height);
  objc_msgSend(v4, "encodePoint:forKey:", @"titleOrigin", self->_titleOrigin.x, self->_titleOrigin.y);
  [v4 encodeInteger:self->_layoutSize forKey:@"layoutSize"];
  [v4 encodeBool:self->_hasTrailingGutter forKey:@"hasTrailingGutter"];
}

- (unint64_t)hash
{
  uint64_t v3 = +[PBContextMenuPasteButtonTag hash];
  int8x16_t v4 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_size), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_titleOrigin));
  return *(unint64_t *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ self->_hasTrailingGutter ^ self->_layoutSize ^ v3 ^ self->_secureName;
}

- (int64_t)initialSampleEventForStyle:(id)a3
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  int8x16_t v4 = (double *)a3;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_secureName == *((_DWORD *)v4 + 3)
    && (self->_size.width == v4[3] ? (BOOL v5 = self->_size.height == v4[4]) : (BOOL v5 = 0),
        v5
     && (self->_titleOrigin.x == v4[5] ? (BOOL v6 = self->_titleOrigin.y == v4[6]) : (BOOL v6 = 0),
         v6 && self->_layoutSize == *((void *)v4 + 2)))
    && self->_hasTrailingGutter == *((unsigned __int8 *)v4 + 8);

  return v7;
}

- (BOOL)isValid
{
  if ((self->_secureName & 0xFFFFFFFC) != 0x10000) {
    return 0;
  }
  double x = self->_titleOrigin.x;
  double width = self->_size.width;
  if (x > width) {
    return 0;
  }
  double y = self->_titleOrigin.y;
  double height = self->_size.height;
  if (y > height) {
    return 0;
  }
  unint64_t v6 = ((*(void *)&width & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  unint64_t v7 = *(void *)&width - 1;
  if (width >= 0.0)
  {
    BOOL v8 = v6 >= 0x3FE;
    BOOL v9 = v6 == 1022;
  }
  else
  {
    BOOL v8 = 1;
    BOOL v9 = 0;
  }
  if (!v9 && v8)
  {
    BOOL v10 = v7 >= 0xFFFFFFFFFFFFELL;
    BOOL v11 = v7 == 0xFFFFFFFFFFFFELL;
  }
  else
  {
    BOOL v10 = 0;
    BOOL v11 = 0;
  }
  if (!v11 && v10) {
    return 0;
  }
  unint64_t v12 = ((*(void *)&height & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  unint64_t v13 = *(void *)&height - 1;
  if (height >= 0.0)
  {
    BOOL v14 = v12 >= 0x3FE;
    BOOL v15 = v12 == 1022;
  }
  else
  {
    BOOL v14 = 1;
    BOOL v15 = 0;
  }
  if (!v15 && v14)
  {
    BOOL v16 = v13 >= 0xFFFFFFFFFFFFELL;
    BOOL v17 = v13 == 0xFFFFFFFFFFFFELL;
  }
  else
  {
    BOOL v16 = 0;
    BOOL v17 = 0;
  }
  if (!v17 && v16) {
    return 0;
  }
  uint64_t v18 = *(void *)&x & 0x7FFFFFFFFFFFFFFFLL;
  BOOL v19 = (*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v20 = ((*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (x >= 0.0) {
    BOOL v20 = 0;
  }
  if (self->_titleOrigin.x >= 0.0) {
    BOOL v19 = 0;
  }
  BOOL v23 = __OFSUB__(v18, 0x7FF0000000000000);
  BOOL v21 = v18 == 0x7FF0000000000000;
  BOOL v22 = v18 - 0x7FF0000000000000 < 0;
  int v24 = v18 == 0x7FF0000000000000 || v19;
  if (!(v22 ^ v23 | v21)) {
    int v24 = 1;
  }
  if ((v24 | v20)) {
    return 0;
  }
  BOOL v25 = (*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v26 = ((*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (y >= 0.0)
  {
    BOOL v26 = 0;
    BOOL v25 = 0;
  }
  if ((*(void *)&y & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000) {
    BOOL v25 = 1;
  }
  if ((*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000) {
    BOOL v25 = 1;
  }
  return !v25 && !v26 && self->_layoutSize < 3;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PBContextMenuPasteButtonTag_resolvedStyleForStyle___block_invoke;
  v8[3] = &unk_1E55556E0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  unint64_t v6 = (void *)[v5 copyWithChangeBlock:v8];

  return v6;
}

void __53__PBContextMenuPasteButtonTag_resolvedStyleForStyle___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setAccessibilityButtonShapes:0];
  [v4 setAccessibilityContrast:0];
  [v4 setDisplayRange:0];
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)[*(id *)(a1 + 32) baseForegroundColorForStyle:*(void *)(a1 + 40)], 0.96);
  [v4 setTintColor:CopyWithAlpha];
  CFRelease(CopyWithAlpha);
  [v4 setUserInterfaceIdiom:0];
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
  if (a7)
  {
    id v9 = (*((void (**)(id, PBContextMenuPasteButtonTag *, id, id, id, id))a7 + 2))(a7, self, a3, a4, a5, a6);
  }
  else
  {
    id v9 = 0;
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

- (int64_t)layoutSize
{
  return self->_layoutSize;
}

- (BOOL)hasTrailingGutter
{
  return self->_hasTrailingGutter;
}

@end