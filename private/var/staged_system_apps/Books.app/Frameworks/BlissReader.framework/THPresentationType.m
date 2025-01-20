@interface THPresentationType
+ (BOOL)supportsSecureCoding;
+ (id)flowPresentationTypeInContext:(id)a3;
+ (id)flowPresentationTypeInContext:(id)a3 pageSize:(CGSize)a4;
+ (id)paginatedPresentationTypeInContext:(id)a3;
+ (id)paginatedPresentationTypeInContext:(id)a3 pageSize:(CGSize)a4;
- (BOOL)isCompactHeight;
- (BOOL)isCompactWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIncludingSize:(id)a3;
- (BOOL)isFlow;
- (BOOL)isMutableViaDelegate;
- (BOOL)isPaginated;
- (CGSize)pageSize;
- (NSString)name;
- (THPresentationType)initWithCoder:(id)a3;
- (THPresentationType)initWithString:(id)a3 context:(id)a4;
- (THPresentationTypePageSizeDelegate)pageSizeDelegate;
- (UIEdgeInsets)contentInsets;
- (double)gutterWidth;
- (id)copyFixingSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)columnCount;
- (unint64_t)fontSize;
- (unint64_t)hash;
- (unint64_t)hashIncludingSize;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setColumnCount:(int64_t)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setFontSize:(unint64_t)a3;
- (void)setGutterWidth:(double)a3;
- (void)setName:(id)a3;
- (void)setPageSize:(CGSize)a3;
- (void)setPageSizeDelegate:(id)a3;
@end

@implementation THPresentationType

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  [(THPresentationType *)self willModify];
  v5 = (NSString *)[a3 copy];

  self->mName = v5;
}

- (THPresentationType)initWithString:(id)a3 context:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THPresentationType;
  v5 = [(THPresentationType *)&v9 initWithContext:a4];
  v6 = v5;
  if (v5)
  {
    [(THPresentationType *)v5 setName:a3];
    v6->_pageSize = CGSizeZero;
    v6->_fontSize = 0;
    v6->_columnCount = 0;
    v6->_gutterWidth = 0.0;
    long long v7 = *(_OWORD *)&TSDEdgeInsetsZero[2];
    *(_OWORD *)&v6->_contentInsets.top = *(_OWORD *)TSDEdgeInsetsZero;
    *(_OWORD *)&v6->_contentInsets.bottom = v7;
    v6->_compactWidth = -1;
    v6->_compactHeight = -1;
  }
  return v6;
}

- (void)dealloc
{
  self->mName = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPresentationType;
  [(THPresentationType *)&v3 dealloc];
}

- (CGSize)pageSize
{
  double width = self->_pageSize.width;
  double height = self->_pageSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height) {
    [(THPresentationTypePageSizeDelegate *)[(THPresentationType *)self pageSizeDelegate] pageSizeForPresentationType:self];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)fontSize
{
  unint64_t result = self->_fontSize;
  if (!result)
  {
    unint64_t result = [(THPresentationType *)self pageSizeDelegate];
    if (result)
    {
      v4 = [(THPresentationType *)self pageSizeDelegate];
      return (unint64_t)[(THPresentationTypePageSizeDelegate *)v4 fontSizeForPresentationType:self];
    }
  }
  return result;
}

- (int64_t)columnCount
{
  int64_t result = self->_columnCount;
  if (!result)
  {
    int64_t result = [(THPresentationType *)self pageSizeDelegate];
    if (result)
    {
      v4 = [(THPresentationType *)self pageSizeDelegate];
      return (int64_t)[(THPresentationTypePageSizeDelegate *)v4 columnCountForPresentationType:self];
    }
  }
  return result;
}

- (double)gutterWidth
{
  double gutterWidth = self->_gutterWidth;
  if (gutterWidth != 0.0 || ![(THPresentationType *)self pageSizeDelegate]) {
    return gutterWidth;
  }
  v4 = [(THPresentationType *)self pageSizeDelegate];

  [(THPresentationTypePageSizeDelegate *)v4 gutterWidthForPresentationType:self];
  return result;
}

- (UIEdgeInsets)contentInsets
{
  float64x2_t v2 = *(float64x2_t *)&self->_contentInsets.top;
  float64x2_t v3 = *(float64x2_t *)&self->_contentInsets.bottom;
  CGFloat left = self->_contentInsets.left;
  CGFloat right = self->_contentInsets.right;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v2, TSDEdgeInsetsZero[0]), (int32x4_t)vceqq_f64(v3, TSDEdgeInsetsZero[1]))), 0xFuLL))))
  {
    long long v12 = *(_OWORD *)&self->_contentInsets.bottom;
    long long v13 = *(_OWORD *)&self->_contentInsets.top;
    long long v7 = [(THPresentationType *)self pageSizeDelegate];
    *(void *)&v3.f64[0] = v12;
    *(void *)&v2.f64[0] = v13;
    if (v7)
    {
      [(THPresentationTypePageSizeDelegate *)[(THPresentationType *)self pageSizeDelegate] contentInsetsForPresentationType:self];
      CGFloat left = v8;
      CGFloat right = v9;
    }
  }
  double v10 = left;
  double v11 = right;
  result.bottom = v3.f64[0];
  result.top = v2.f64[0];
  result.CGFloat right = v11;
  result.CGFloat left = v10;
  return result;
}

- (BOOL)isCompactWidth
{
  int compactWidth = self->_compactWidth;
  if (compactWidth < 0) {
    return [(THPresentationTypePageSizeDelegate *)self->_pageSizeDelegate isCompactWidthForPresentationType:self];
  }
  else {
    return compactWidth != 0;
  }
}

- (BOOL)isCompactHeight
{
  int compactHeight = self->_compactHeight;
  if (compactHeight < 0) {
    return [(THPresentationTypePageSizeDelegate *)self->_pageSizeDelegate isCompactHeightForPresentationType:self];
  }
  else {
    return compactHeight != 0;
  }
}

- (id)copyFixingSize
{
  float64x2_t v3 = [objc_allocWithZone((Class)objc_opt_class()) initWithString:[self name] context:[self context]];
  [(THPresentationType *)self pageSize];
  [v3 setPageSize:];
  [v3 setFontSize:[self fontSize]];
  [v3 setColumnCount:[self columnCount]];
  [(THPresentationType *)self gutterWidth];
  [v3 setGutterWidth:];
  [(THPresentationType *)self contentInsets];
  [v3 setContentInsets:];
  v3[16] = [(THPresentationType *)self isCompactWidth];
  v3[17] = [(THPresentationType *)self isCompactHeight];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithString:context:", -[THPresentationType name](self, "name"), -[THPresentationType context](self, "context"));
  [v4 setPageSizeDelegate:self->_pageSizeDelegate];
  [v4 setPageSize:self->_pageSize.width, self->_pageSize.height];
  [v4 setFontSize:self->_fontSize];
  [v4 setColumnCount:self->_columnCount];
  [v4 setGutterWidth:self->_gutterWidth];
  [v4 setContentInsets:self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right];
  v4[16] = self->_compactWidth;
  v4[17] = self->_compactHeight;
  return v4;
}

+ (id)flowPresentationTypeInContext:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithString:@"THFlowPresentationType" context:a3];

  return v3;
}

+ (id)paginatedPresentationTypeInContext:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithString:@"THPaginatedPresentationType" context:a3];

  return v3;
}

+ (id)flowPresentationTypeInContext:(id)a3 pageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [a1 flowPresentationTypeInContext:a3];
  [v6 setPageSize:width, height];
  return v6;
}

+ (id)paginatedPresentationTypeInContext:(id)a3 pageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [a1 paginatedPresentationTypeInContext:a3];
  [v6 setPageSize:width, height];
  return v6;
}

- (BOOL)isFlow
{
  float64x2_t v2 = [(THPresentationType *)self name];

  return [(NSString *)v2 isEqualToString:@"THFlowPresentationType"];
}

- (BOOL)isPaginated
{
  float64x2_t v2 = [(THPresentationType *)self name];

  return [(NSString *)v2 isEqualToString:@"THPaginatedPresentationType"];
}

- (BOOL)isMutableViaDelegate
{
  id v3 = [(THPresentationType *)self pageSizeDelegate];
  if (v3) {
    LOBYTE(v3) = self->_pageSize.height == CGSizeZero.height && self->_pageSize.width == CGSizeZero.width;
  }
  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  v5 = [(THPresentationType *)self name];
  id v6 = [v4 name];

  return [(NSString *)v5 isEqualToString:v6];
}

- (BOOL)isEqualIncludingSize:(id)a3
{
  unsigned int v5 = -[NSString isEqualToString:](-[THPresentationType name](self, "name"), "isEqualToString:", [a3 name]);
  if (v5)
  {
    [(THPresentationType *)self pageSize];
    [a3 pageSize];
    unsigned int v5 = TSDNearlyEqualSizes();
    if (v5)
    {
      id v6 = [(THPresentationType *)self fontSize];
      if (v6 != [a3 fontSize]) {
        goto LABEL_11;
      }
      id v7 = [(THPresentationType *)self columnCount];
      if (v7 != [a3 columnCount]) {
        goto LABEL_11;
      }
      [(THPresentationType *)self gutterWidth];
      double v9 = v8;
      [a3 gutterWidth];
      if (v9 != v10) {
        goto LABEL_11;
      }
      [(THPresentationType *)self contentInsets];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      [a3 contentInsets];
      LOBYTE(v5) = 0;
      if (v14 == v22 && v12 == v19 && v18 == v21 && v16 == v20)
      {
        unsigned int v23 = [(THPresentationType *)self isCompactWidth];
        if (v23 != [a3 isCompactWidth])
        {
LABEL_11:
          LOBYTE(v5) = 0;
          return v5;
        }
        unsigned __int8 v24 = [(THPresentationType *)self isCompactHeight];
        LOBYTE(v5) = v24 ^ [a3 isCompactHeight] ^ 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  float64x2_t v2 = [(THPresentationType *)self name];

  return [(NSString *)v2 hash];
}

- (unint64_t)hashIncludingSize
{
  CGFloat v3 = self->_pageSize.width
     + (double)[(NSString *)[(THPresentationType *)self name] hash]
     + self->_pageSize.height
     + (double)self->_fontSize
     + (double)self->_columnCount
     + self->_gutterWidth
     + self->_contentInsets.left
     + self->_contentInsets.right
     + self->_contentInsets.bottom
     + self->_contentInsets.top;
  CGFloat v4 = v3 + (double)[(THPresentationType *)self isCompactWidth];
  return (unint64_t)(v4 + (double)[(THPresentationType *)self isCompactHeight]);
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p> name=%@ size={%f,%f}", objc_opt_class(), self, self->mName, *(void *)&self->_pageSize.width, *(void *)&self->_pageSize.height];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THPresentationType)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)THPresentationType;
  CGFloat v4 = [(THPresentationType *)&v17 initWithContext:0];
  if (v4)
  {
    -[THPresentationType setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"pageSize"];
    p_pageSize = &v4->_pageSize;
    if (v5)
    {
      [v5 CGSizeValue];
      p_pageSize->double width = v7;
      v4->_pageSize.double height = v8;
    }
    else
    {
      CGSize *p_pageSize = CGSizeZero;
    }
    [a3 decodeFloatForKey:@"fontSize"];
    v4->_fontSize = (unint64_t)v9;
    v4->_columnCount = (int64_t)[a3 decodeIntegerForKey:@"columnCount"];
    [a3 decodeFloatForKey:@"gutterWidth"];
    v4->_double gutterWidth = v10;
    id v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"contentInsets"];
    if (v11)
    {
      [v11 TSDEdgeInsetsValue];
      v4->_contentInsets.top = v12;
      v4->_contentInsets.CGFloat left = v13;
      v4->_contentInsets.bottom = v14;
      v4->_contentInsets.CGFloat right = v15;
    }
    v4->_int compactWidth = [a3 decodeBoolForKey:@"compactWidth"];
    v4->_int compactHeight = [a3 decodeBoolForKey:@"compactHeight"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:[self name] forKey:@"name"];
  [(THPresentationType *)self pageSize];
  [a3 encodeObject:[NSValue valueWithCGSize:] forKey:@"pageSize"];
  *(float *)&double v5 = (float)[(THPresentationType *)self fontSize];
  [a3 encodeFloat:@"fontSize" forKey:v5];
  [a3 encodeInteger:[self columnCount] forKey:@"columnCount"];
  [(THPresentationType *)self gutterWidth];
  *(float *)&double v6 = v6;
  [a3 encodeFloat:@"gutterWidth" forKey:v6];
  [(THPresentationType *)self contentInsets];
  [a3 encodeObject:[NSValue valueWithTSDEdgeInsets:] forKey:@"contentInsets"];
  [a3 encodeBool:[self isCompactWidth] forKey:@"compactWidth"];
  BOOL v7 = [(THPresentationType *)self isCompactHeight];

  [a3 encodeBool:v7 forKey:@"compactHeight"];
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (void)setFontSize:(unint64_t)a3
{
  self->_fontSize = a3;
}

- (void)setColumnCount:(int64_t)a3
{
  self->_columnCount = a3;
}

- (void)setGutterWidth:(double)a3
{
  self->_double gutterWidth = a3;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (THPresentationTypePageSizeDelegate)pageSizeDelegate
{
  return self->_pageSizeDelegate;
}

- (void)setPageSizeDelegate:(id)a3
{
  self->_pageSizeDelegate = (THPresentationTypePageSizeDelegate *)a3;
}

@end