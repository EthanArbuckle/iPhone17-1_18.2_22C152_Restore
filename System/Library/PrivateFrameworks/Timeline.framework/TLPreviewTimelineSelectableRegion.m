@interface TLPreviewTimelineSelectableRegion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)rect;
- (NSString)path;
- (TLPreviewTimelineSelectableRegion)initWithCoder:(id)a3;
- (TLPreviewTimelineSelectableRegion)initWithPath:(id)a3 rect:(CGRect)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TLPreviewTimelineSelectableRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLPreviewTimelineSelectableRegion)initWithPath:(id)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TLPreviewTimelineSelectableRegion;
  v10 = [(TLPreviewTimelineSelectableRegion *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    path = v10->_path;
    v10->_path = (NSString *)v11;

    v10->_rect.origin.CGFloat x = x;
    v10->_rect.origin.CGFloat y = y;
    v10->_rect.size.CGFloat width = width;
    v10->_rect.size.CGFloat height = height;
  }

  return v10;
}

- (TLPreviewTimelineSelectableRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TLPreviewTimelineSelectableRegion *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v5->_rect.origin = 0u;
    v5->_rect.size = 0u;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TLPreviewTimelineSelectableRegion *)self path];
  [(TLPreviewTimelineSelectableRegion *)self rect];
  objc_msgSend(v4, "encodeObject:forKey:", v5, @"path", v6, v7, v8, v9);
  v10 = [MEMORY[0x263F08D40] valueWithBytes:&v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v4 encodeObject:v10 forKey:@"rect"];
}

- (unint64_t)hash
{
  v2 = [(TLPreviewTimelineSelectableRegion *)self path];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 path];
    uint64_t v6 = [(TLPreviewTimelineSelectableRegion *)self path];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      uint64_t v7 = [v4 path];
      uint64_t v8 = [(TLPreviewTimelineSelectableRegion *)self path];
      char v9 = [v7 isEqual:v8];
    }
    [(TLPreviewTimelineSelectableRegion *)self rect];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v4 rect];
    if (v22 == v12)
    {
      BOOL v23 = v20 == v16;
      if (v21 != v18) {
        BOOL v23 = 0;
      }
      if (v19 != v14) {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
    BOOL v10 = v9 & v23;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(TLPreviewTimelineSelectableRegion *)self path];
  [(TLPreviewTimelineSelectableRegion *)self rect];
  char v9 = -[TLPreviewTimelineSelectableRegion initWithPath:rect:]([TLPreviewTimelineSelectableRegion alloc], "initWithPath:rect:", v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end