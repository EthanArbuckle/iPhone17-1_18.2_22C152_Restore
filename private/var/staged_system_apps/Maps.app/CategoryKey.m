@interface CategoryKey
- (BOOL)isCarPlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNightMode;
- (BOOL)renderAsTemplate;
- (BOOL)transitMode;
- (CGSize)size;
- (GEOSearchCategory)category;
- (NSString)prefix;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setCategory:(id)a3;
- (void)setIsCarPlay:(BOOL)a3;
- (void)setIsNightMode:(BOOL)a3;
- (void)setPrefix:(id)a3;
- (void)setRenderAsTemplate:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransitMode:(BOOL)a3;
@end

@implementation CategoryKey

- (id)description
{
  v3 = [(CategoryKey *)self category];
  v4 = [v3 displayString];
  v5 = [(CategoryKey *)self prefix];
  if ([(CategoryKey *)self transitMode]) {
    CFStringRef v6 = @"yes";
  }
  else {
    CFStringRef v6 = @"no";
  }
  [(CategoryKey *)self size];
  v7 = NSStringFromCGSize(v15);
  [(CategoryKey *)self scale];
  uint64_t v9 = v8;
  if ([(CategoryKey *)self isCarPlay]) {
    CFStringRef v10 = @"yes";
  }
  else {
    CFStringRef v10 = @"no";
  }
  if ([(CategoryKey *)self renderAsTemplate]) {
    CFStringRef v11 = @"yes";
  }
  else {
    CFStringRef v11 = @"no";
  }
  v12 = +[NSString stringWithFormat:@"CategoryKey: %@ <prefix:%@, transit:%@, size:%@, scale:%#.1f isCarplay=%@>, renderAsTemplate:%@", v4, v5, v6, v7, v9, v10, v11];

  return v12;
}

- (unint64_t)hash
{
  v3 = [(GEOSearchCategory *)self->_category styleAttributes];
  id v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_prefix hash];
  double scale = self->_scale;
  uint64_t v7 = scale;
  LODWORD(scale) = *(_DWORD *)&self->_transitMode;
  uint32x4_t v8 = vmovl_u16(vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&scale), (uint16x4_t)0x5000400030002));
  v9.i64[0] = v8.u32[2];
  v9.i64[1] = v8.u32[3];
  v10.i64[0] = 255;
  v10.i64[1] = 255;
  int64x2_t v11 = (int64x2_t)vandq_s8(v9, v10);
  v9.i64[0] = v8.u32[0];
  v9.i64[1] = v8.u32[1];
  unint64_t v12 = vaddvq_s64(vaddq_s64((int64x2_t)vandq_s8(v9, v10), v11)) + v7 + 2 * ((void)v4 + v5);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CategoryKey *)a3;
  NSUInteger v5 = v4;
  if (!v4) {
    goto LABEL_17;
  }
  if (v4 == self)
  {
    BOOL v12 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v6 = v5;
    uint64_t v7 = (id *)v6;
    if (self->_scale == v6[4]
      && (self->_size.width == v6[5] ? (BOOL v8 = self->_size.height == v6[6]) : (BOOL v8 = 0),
          v8
       && self->_transitMode == *((unsigned __int8 *)v6 + 8)
       && self->_isCarPlay == *((unsigned __int8 *)v6 + 9)
       && self->_isNightMode == *((unsigned __int8 *)v6 + 10)
       && self->_renderAsTemplate == *((unsigned __int8 *)v6 + 11)
       && ((prefix = self->_prefix, prefix == v7[3]) || -[NSString isEqualToString:](prefix, "isEqualToString:"))))
    {
      int8x16_t v10 = [(GEOSearchCategory *)self->_category styleAttributes];
      int64x2_t v11 = [v7[2] styleAttributes];
      BOOL v12 = GeoCodecsFeatureStyleAttributesCompare() == 0;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
LABEL_17:
    BOOL v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = self->_transitMode;
  objc_storeStrong((id *)v4 + 3, self->_prefix);
  objc_storeStrong((id *)v4 + 2, self->_category);
  *((void *)v4 + 4) = *(void *)&self->_scale;
  *(CGSize *)(v4 + 40) = self->_size;
  v4[9] = self->_isCarPlay;
  v4[10] = self->_isNightMode;
  v4[11] = self->_renderAsTemplate;
  return v4;
}

- (GEOSearchCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (BOOL)transitMode
{
  return self->_transitMode;
}

- (void)setTransitMode:(BOOL)a3
{
  self->_transitMode = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (BOOL)isNightMode
{
  return self->_isNightMode;
}

- (void)setIsNightMode:(BOOL)a3
{
  self->_isNightMode = a3;
}

- (BOOL)renderAsTemplate
{
  return self->_renderAsTemplate;
}

- (void)setRenderAsTemplate:(BOOL)a3
{
  self->_renderAsTemplate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end