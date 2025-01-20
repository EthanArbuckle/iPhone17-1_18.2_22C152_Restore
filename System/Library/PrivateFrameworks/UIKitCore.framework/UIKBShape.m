@interface UIKBShape
+ (id)shape;
+ (id)shapeByCombining:(id)a3 withShape:(id)a4;
+ (id)shapeByResizingShape:(id)a3 byAmount:(CGSize)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)scaled;
- (BOOL)shouldUseGeometry;
- (CGRect)_scaleRect:(CGRect)a3 inYAxis:(BOOL)a4;
- (CGRect)frame;
- (CGRect)paddedFrame;
- (CGSize)concaveCornerOffset;
- (UIKBGeometry)geometry;
- (UIKBShape)init;
- (UIKBShape)initWithCoder:(id)a3;
- (UIKBShape)initWithGeometry:(id)a3 frame:(CGRect)a4 paddedFrame:(CGRect)a5;
- (UIKBShape)initWithGeometry:(id)a3 frame:(CGRect)a4 paddedFrame:(CGRect)a5 concaveCorner:(unint64_t)a6 concaveCornerOffset:(CGSize)a7;
- (UIKBShape)originalShape;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)concaveCorner;
- (unint64_t)hash;
- (unint64_t)uid;
- (void)addRectFrom:(id)a3;
- (void)addRectFrom:(id)a3 mergeActionFactors:(id)a4 inRightToLeft:(BOOL)a5;
- (void)addRectFrom:(id)a3 widthFraction:(double)a4 heightFraction:(double)a5 adjustOriginXFactor:(double)a6 adjustOriginYFactor:(double)a7;
- (void)addRectFrom:(id)a3 widthFraction:(double)a4 heightFraction:(double)a5 adjustOriginXFactor:(double)a6 adjustOriginYFactor:(double)a7 absoluteOriginFactors:(BOOL)a8;
- (void)encodeWithCoder:(id)a3;
- (void)makeLikeOther:(id)a3;
- (void)scaleIfNeeded:(double)a3 onlyYAxis:(BOOL)a4;
- (void)scaleWidth:(double)a3;
- (void)setConcaveCorner:(unint64_t)a3;
- (void)setConcaveCornerOffset:(CGSize)a3;
- (void)setConcaveCornerSize:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGeometry:(id)a3;
- (void)setOriginalShape:(id)a3;
- (void)setPaddedFrame:(CGRect)a3;
- (void)setScaled:(BOOL)a3;
@end

@implementation UIKBShape

+ (id)shape
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (UIKBShape)init
{
  v10.receiver = self;
  v10.super_class = (Class)UIKBShape;
  id v2 = [(UIKBShape *)&v10 init];
  v3 = v2;
  if (v2)
  {
    CGPoint v4 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v2->m_frame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->m_frame.size = v5;
    v2->m_paddedFrame.origin = v4;
    v2->m_paddedFrame.size = v5;
    uint64_t v6 = UIKBNextUID_counter++;
    v2->m_uid = v6;
    m_geometry = v2->m_geometry;
    v2->m_geometry = 0;

    v3->m_concaveCorner = 0;
    v3->m_concaveCornerOffset = (CGSize)*MEMORY[0x1E4F1DB30];
    v8 = v3;
  }

  return v3;
}

- (UIKBShape)initWithGeometry:(id)a3 frame:(CGRect)a4 paddedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  id v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIKBShape;
  v16 = [(UIKBShape *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->m_geometry, a3);
    v17->m_frame.origin.CGFloat x = v12;
    v17->m_frame.origin.CGFloat y = v11;
    v17->m_frame.size.CGFloat width = v10;
    v17->m_frame.size.CGFloat height = v9;
    v17->m_paddedFrame.origin.CGFloat x = x;
    v17->m_paddedFrame.origin.CGFloat y = y;
    v17->m_paddedFrame.size.CGFloat width = width;
    v17->m_paddedFrame.size.CGFloat height = height;
    uint64_t v18 = UIKBNextUID_counter++;
    v17->m_uid = v18;
    v17->m_concaveCorner = 0;
    v17->m_concaveCornerOffset = (CGSize)*MEMORY[0x1E4F1DB30];
    v19 = v17;
  }

  return v17;
}

- (UIKBShape)initWithGeometry:(id)a3 frame:(CGRect)a4 paddedFrame:(CGRect)a5 concaveCorner:(unint64_t)a6 concaveCornerOffset:(CGSize)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v12 = a4.size.height;
  CGFloat v13 = a4.size.width;
  CGFloat v14 = a4.origin.y;
  CGFloat v15 = a4.origin.x;
  id v18 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UIKBShape;
  v19 = [(UIKBShape *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->m_geometry, a3);
    v20->m_frame.origin.CGFloat x = v15;
    v20->m_frame.origin.CGFloat y = v14;
    v20->m_frame.size.CGFloat width = v13;
    v20->m_frame.size.CGFloat height = v12;
    v20->m_paddedFrame.origin.CGFloat x = x;
    v20->m_paddedFrame.origin.CGFloat y = y;
    v20->m_paddedFrame.size.CGFloat width = width;
    v20->m_paddedFrame.size.CGFloat height = height;
    uint64_t v21 = UIKBNextUID_counter++;
    v20->m_uid = v21;
    v20->m_concaveCorner = a6;
    v20->m_concaveCornerOffset.CGFloat width = v25;
    v20->m_concaveCornerOffset.CGFloat height = v26;
    v22 = v20;
  }

  return v20;
}

- (UIKBShape)initWithCoder:(id)a3
{
  id v4 = a3;
  CGSize v5 = [v4 decodeObjectForKey:@"geometry"];
  m_geometrCGFloat y = self->m_geometry;
  self->m_geometrCGFloat y = v5;

  [v4 decodeFloatForKey:@"frame.x"];
  float v8 = v7;
  [v4 decodeFloatForKey:@"frame.y"];
  float v10 = v9;
  [v4 decodeFloatForKey:@"frame.w"];
  float v12 = v11;
  [v4 decodeFloatForKey:@"frame.h"];
  self->m_frame.origin.CGFloat x = v8;
  self->m_frame.origin.CGFloat y = v10;
  self->m_frame.size.CGFloat width = v12;
  self->m_frame.size.CGFloat height = v13;
  [v4 decodeFloatForKey:@"paddedFrame.x"];
  float v15 = v14;
  [v4 decodeFloatForKey:@"paddedFrame.y"];
  float v17 = v16;
  [v4 decodeFloatForKey:@"paddedFrame.w"];
  float v19 = v18;
  [v4 decodeFloatForKey:@"paddedFrame.h"];
  float v21 = v20;

  self->m_paddedFrame.origin.CGFloat x = v15;
  self->m_paddedFrame.origin.CGFloat y = v17;
  self->m_paddedFrame.size.CGFloat width = v19;
  self->m_paddedFrame.size.CGFloat height = v21;
  unint64_t v22 = UIKBNextUID_counter++;
  self->m_uid = v22;
  self->m_concaveCorner = 0;
  self->m_concaveCornerOffset = (CGSize)*MEMORY[0x1E4F1DB30];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  m_geometrCGFloat y = self->m_geometry;
  id v13 = a3;
  [v13 encodeObject:m_geometry forKey:@"geometry"];
  CGFloat x = self->m_frame.origin.x;
  *(float *)&CGFloat x = x;
  [v13 encodeFloat:@"frame.x" forKey:x];
  CGFloat y = self->m_frame.origin.y;
  *(float *)&CGFloat y = y;
  [v13 encodeFloat:@"frame.y" forKey:y];
  CGFloat width = self->m_frame.size.width;
  *(float *)&CGFloat width = width;
  [v13 encodeFloat:@"frame.w" forKey:width];
  CGFloat height = self->m_frame.size.height;
  *(float *)&CGFloat height = height;
  [v13 encodeFloat:@"frame.h" forKey:height];
  CGFloat v9 = self->m_paddedFrame.origin.x;
  *(float *)&CGFloat v9 = v9;
  [v13 encodeFloat:@"paddedFrame.x" forKey:v9];
  CGFloat v10 = self->m_paddedFrame.origin.y;
  *(float *)&CGFloat v10 = v10;
  [v13 encodeFloat:@"paddedFrame.y" forKey:v10];
  CGFloat v11 = self->m_paddedFrame.size.width;
  *(float *)&CGFloat v11 = v11;
  [v13 encodeFloat:@"paddedFrame.w" forKey:v11];
  CGFloat v12 = self->m_paddedFrame.size.height;
  *(float *)&CGFloat v12 = v12;
  [v13 encodeFloat:@"paddedFrame.h" forKey:v12];
}

- (void)makeLikeOther:(id)a3
{
  id v27 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  CGSize v5 = v27;
  if (isKindOfClass)
  {
    id v6 = v27;
    float v7 = [(UIKBShape *)self geometry];

    if (!v7)
    {
      float v8 = [v6 geometry];
      CGFloat v9 = (void *)[v8 copy];
      [(UIKBShape *)self setGeometry:v9];

      CGFloat v10 = [v6 geometry];
      CGFloat v11 = [v10 name];
      CGFloat v12 = (void *)[v11 copy];
      id v13 = [(UIKBShape *)self geometry];
      [v13 setName:v12];
    }
    CGFloat v14 = *MEMORY[0x1E4F1DB28];
    CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v29.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
    v29.origin.CGFloat y = v15;
    v29.size.CGFloat width = v16;
    v29.size.CGFloat height = v17;
    if (!CGRectEqualToRect(self->m_frame, v29))
    {
      [v6 frame];
      self->m_frame.origin.CGFloat x = v18;
      self->m_frame.origin.CGFloat y = v19;
      self->m_frame.size.CGFloat width = v20;
      self->m_frame.size.CGFloat height = v21;
    }
    v30.origin.CGFloat x = v14;
    v30.origin.CGFloat y = v15;
    v30.size.CGFloat width = v16;
    v30.size.CGFloat height = v17;
    if (!CGRectEqualToRect(self->m_paddedFrame, v30))
    {
      [v6 paddedFrame];
      self->m_paddedFrame.origin.CGFloat x = v22;
      self->m_paddedFrame.origin.CGFloat y = v23;
      self->m_paddedFrame.size.CGFloat width = v24;
      self->m_paddedFrame.size.CGFloat height = v25;
    }
    CGFloat v26 = [v6 originalShape];
    [(UIKBShape *)self setOriginalShape:v26];

    CGSize v5 = v27;
  }
}

- (unint64_t)hash
{
  unint64_t v2 = [(UIKBShape *)self uid];
  unint64_t v3 = 9 * ((v2 + ~(v2 << 15)) ^ ((v2 + ~(v2 << 15)) >> 10));
  unint64_t v4 = (v3 ^ (v3 >> 6)) + ~((v3 ^ (v3 >> 6)) << 11);
  return v4 ^ (v4 >> 16);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(UIKBShape *)self frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v5 frame];
    v46.origin.CGFloat x = v14;
    v46.origin.CGFloat y = v15;
    v46.size.CGFloat width = v16;
    v46.size.CGFloat height = v17;
    v44.origin.CGFloat x = v7;
    v44.origin.CGFloat y = v9;
    v44.size.CGFloat width = v11;
    v44.size.CGFloat height = v13;
    BOOL v18 = CGRectEqualToRect(v44, v46);
    [(UIKBShape *)self paddedFrame];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    [v5 paddedFrame];
    v47.origin.CGFloat x = v27;
    v47.origin.CGFloat y = v28;
    v47.size.CGFloat width = v29;
    v47.size.CGFloat height = v30;
    v45.origin.CGFloat x = v20;
    v45.origin.CGFloat y = v22;
    v45.size.CGFloat width = v24;
    v45.size.CGFloat height = v26;
    BOOL v31 = CGRectEqualToRect(v45, v47);
    unint64_t v32 = [(UIKBShape *)self concaveCorner];
    uint64_t v33 = [v5 concaveCorner];
    [(UIKBShape *)self concaveCornerOffset];
    double v35 = v34;
    double v37 = v36;
    [v5 concaveCornerOffset];
    char v40 = 0;
    if (v18 && v31 && v32 == v33 && v35 == v38 && v37 == v39)
    {
      v41 = [(UIKBShape *)self geometry];
      v42 = [v5 geometry];
      char v40 = [v41 isEqual:v42];
    }
  }
  else
  {
    char v40 = 0;
  }

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UIKBShape);
  id v5 = [(UIKBShape *)self geometry];
  double v6 = (void *)[v5 copy];
  [(UIKBShape *)v4 setGeometry:v6];

  [(UIKBShape *)self frame];
  -[UIKBShape setFrame:](v4, "setFrame:");
  [(UIKBShape *)self paddedFrame];
  -[UIKBShape setPaddedFrame:](v4, "setPaddedFrame:");
  CGFloat v7 = [(UIKBShape *)self originalShape];
  [(UIKBShape *)v4 setOriginalShape:v7];

  [(UIKBShape *)v4 setConcaveCorner:[(UIKBShape *)self concaveCorner]];
  [(UIKBShape *)self concaveCornerOffset];
  -[UIKBShape setConcaveCornerOffset:](v4, "setConcaveCornerOffset:");
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  self->m_frame = a3;
}

- (void)setPaddedFrame:(CGRect)a3
{
  self->m_paddedFrame = a3;
}

- (void)setConcaveCorner:(unint64_t)a3
{
  self->m_concaveCorner = a3;
}

- (void)setConcaveCornerSize:(CGSize)a3
{
  self->m_concaveCornerOffset = a3;
}

- (BOOL)isEmpty
{
  CGFloat v3 = *MEMORY[0x1E4F1DB28];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v13.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v13.origin.CGFloat y = v4;
  v13.size.CGFloat width = v5;
  v13.size.CGFloat height = v6;
  BOOL v7 = CGRectEqualToRect(self->m_frame, v13);
  v14.origin.CGFloat x = v3;
  v14.origin.CGFloat y = v4;
  v14.size.CGFloat width = v5;
  v14.size.CGFloat height = v6;
  BOOL v8 = CGRectEqualToRect(self->m_paddedFrame, v14);
  m_geometrCGFloat y = self->m_geometry;
  if (m_geometry)
  {
    double v10 = +[UIKBGeometry geometry];
    char v11 = [(UIKBGeometry *)m_geometry isEqual:v10];
  }
  else
  {
    char v11 = 1;
  }
  return (v7 && v8) & v11;
}

- (BOOL)shouldUseGeometry
{
  CGFloat v3 = *MEMORY[0x1E4F1DB28];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v10.origin.CGFloat y = v4;
  v10.size.CGFloat width = v5;
  v10.size.CGFloat height = v6;
  BOOL v7 = CGRectEqualToRect(self->m_frame, v10);
  v11.origin.CGFloat x = v3;
  v11.origin.CGFloat y = v4;
  v11.size.CGFloat width = v5;
  v11.size.CGFloat height = v6;
  BOOL v8 = v7 & CGRectEqualToRect(self->m_paddedFrame, v11);
  return self->m_geometry && v8;
}

- (id)description
{
  CGFloat v3 = [(UIKBShape *)self geometry];

  if (v3)
  {
    CGFloat v4 = [(UIKBShape *)self geometry];
    CGFloat v5 = [v4 shortDescription];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIKBShape;
    CGFloat v6 = [(UIKBShape *)&v13 description];
    [(UIKBShape *)self frame];
    BOOL v7 = NSStringFromCGRect(v16);
    [(UIKBShape *)self paddedFrame];
    BOOL v8 = NSStringFromCGRect(v17);
    CGFloat v5 = [v6 stringByAppendingFormat:@" - %@_%@", v7, v8];

    if ([(UIKBShape *)self concaveCorner])
    {
      unint64_t v9 = [(UIKBShape *)self concaveCorner];
      [(UIKBShape *)self concaveCornerOffset];
      CGRect v10 = NSStringFromCGSize(v15);
      uint64_t v11 = [v5 stringByAppendingFormat:@"_concaveCorner=%lux_concaveCornerOffset=%@", v9, v10];

      CGFloat v5 = (void *)v11;
    }
  }
  return v5;
}

- (void)addRectFrom:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 frame];
    v17.origin.CGFloat x = v5;
    v17.origin.CGFloat y = v6;
    v17.size.CGFloat width = v7;
    v17.size.CGFloat height = v8;
    self->m_frame = CGRectUnion(self->m_frame, v17);
    [v4 paddedFrame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v18.origin.CGFloat x = v10;
    v18.origin.CGFloat y = v12;
    v18.size.CGFloat width = v14;
    v18.size.CGFloat height = v16;
    self->m_paddedFrame = CGRectUnion(self->m_paddedFrame, v18);
  }
}

- (void)addRectFrom:(id)a3 widthFraction:(double)a4 heightFraction:(double)a5 adjustOriginXFactor:(double)a6 adjustOriginYFactor:(double)a7
{
}

- (void)addRectFrom:(id)a3 widthFraction:(double)a4 heightFraction:(double)a5 adjustOriginXFactor:(double)a6 adjustOriginYFactor:(double)a7 absoluteOriginFactors:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  if (v14)
  {
    id v25 = v14;
    [v14 frame];
    double v16 = ceil(v15 * a4);
    [v25 frame];
    double v18 = ceil(v17 * a5);
    CGFloat v19 = self->m_frame.size.height + v18;
    self->m_frame.size.CGFloat width = self->m_frame.size.width + v16;
    self->m_frame.size.CGFloat height = v19;
    CGFloat v20 = v18 + self->m_paddedFrame.size.height;
    self->m_paddedFrame.size.CGFloat width = v16 + self->m_paddedFrame.size.width;
    self->m_paddedFrame.size.CGFloat height = v20;
    if (a6 != 0.0)
    {
      if (v8)
      {
        [v25 frame];
        double v16 = v21;
      }
      double v22 = floor(v16 * a6);
      self->m_frame.origin.CGFloat x = self->m_frame.origin.x + v22;
      self->m_paddedFrame.origin.CGFloat x = v22 + self->m_paddedFrame.origin.x;
    }
    id v14 = v25;
    if (a7 != 0.0)
    {
      if (v8)
      {
        [v25 frame];
        id v14 = v25;
        double v18 = v23;
      }
      double v24 = floor(v18 * a7);
      self->m_frame.origin.CGFloat y = self->m_frame.origin.y + v24;
      self->m_paddedFrame.origin.CGFloat y = v24 + self->m_paddedFrame.origin.y;
    }
  }
}

- (void)addRectFrom:(id)a3 mergeActionFactors:(id)a4 inRightToLeft:(BOOL)a5
{
  BOOL v5 = a5;
  v51 = (UIKBShape *)a3;
  id v8 = a4;
  if (self != v51)
  {
    [(UIKBShape *)self frame];
    double v11 = v10 + v9 * 0.5;
    [(UIKBShape *)v51 frame];
    double v14 = vabdd_f64(v11, v13 + v12 * 0.5);
    [(UIKBShape *)self frame];
    double v17 = v16 + v15 * 0.5;
    [(UIKBShape *)v51 frame];
    double v20 = vabdd_f64(v17, v19 + v18 * 0.5);
    double v21 = 0.0;
    BOOL v22 = v14 < 1.0;
    double v23 = 0.0;
    double v24 = 0.0;
    if (v22)
    {
      double v25 = COERCE_DOUBLE([v8 w]);
      [v8 w];
      if (v26 == 2)
      {
        double v24 = v25 * 0.01;
      }
      else
      {
        [(UIKBShape *)v51 frame];
        double v24 = v25 / v27;
      }
      double v28 = COERCE_DOUBLE([v8 x]);
      [v8 x];
      if (v29 == 2)
      {
        double v30 = v28 * 0.01;
        BOOL v31 = v51;
      }
      else
      {
        [(UIKBShape *)v51 frame];
        BOOL v31 = v51;
        double v30 = v28 / v32;
      }
      [(UIKBShape *)v31 frame];
      if (v33 >= self->m_frame.origin.x) {
        double v34 = v30;
      }
      else {
        double v34 = -v30;
      }
      double v35 = 0.0;
      if (v5) {
        double v35 = v24;
      }
      double v23 = v34 - v35;
    }
    BOOL v22 = v20 < 1.0;
    double v36 = 0.0;
    if (v22)
    {
      double v37 = COERCE_DOUBLE([v8 h]);
      [v8 h];
      if (v38 == 2)
      {
        double v36 = v37 * 0.01;
      }
      else
      {
        [(UIKBShape *)v51 frame];
        double v36 = v37 / v39;
      }
      double v40 = COERCE_DOUBLE([v8 y]);
      [v8 y];
      if (v41 == 2)
      {
        double v21 = v40 * 0.01;
        v42 = v51;
      }
      else
      {
        [(UIKBShape *)v51 frame];
        v42 = v51;
        double v21 = v40 / v43;
      }
      [(UIKBShape *)v42 frame];
      if (v44 < self->m_frame.origin.y) {
        double v21 = -v21;
      }
    }
    [(UIKBShape *)self addRectFrom:v51 widthFraction:1 heightFraction:v24 adjustOriginXFactor:v36 adjustOriginYFactor:v23 absoluteOriginFactors:v21];
    [v8 w];
    if (v45 == 100 || ([v8 h], v46 == 100))
    {
      [(UIKBShape *)v51 frame];
      self->m_frame.size.CGFloat width = v47;
      self->m_frame.size.CGFloat height = v48;
      [(UIKBShape *)v51 paddedFrame];
      self->m_paddedFrame.size.CGFloat width = v49;
      self->m_paddedFrame.size.CGFloat height = v50;
    }
  }
}

- (void)scaleWidth:(double)a3
{
  double width = self->m_paddedFrame.size.width;
  double v4 = width * a3;
  self->m_frame.size.double width = self->m_frame.size.width - v4;
  self->m_paddedFrame.size.double width = width - v4;
}

- (CGRect)_scaleRect:(CGRect)a3 inYAxis:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4) {
    double v8 = a3.origin.y;
  }
  else {
    double v8 = a3.origin.x;
  }
  if (a4) {
    double v9 = a3.size.height;
  }
  else {
    double v9 = a3.size.width;
  }
  double v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v11 = [v10 preferencesActions];
  [v11 rivenSizeFactor:v8];
  double v13 = v12;

  double v14 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v15 = [v14 preferencesActions];
  [v15 rivenSizeFactor:v9];
  double v17 = v16;

  double v18 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v19 = [v18 preferencesActions];
  [v19 rivenSizeFactor:1.0];
  double v21 = v20;

  BOOL v22 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v23 = [v22 preferencesActions];
  [v23 rivenSizeFactor:1.0];
  double v25 = v9 * v24;
  BOOL v26 = v25 <= 150.0;
  double v27 = v8 * v21 - v13 + v25 - v17;
  if (v4 && v26) {
    double v27 = 0.0;
  }
  double v28 = v17 + round(v27);
  if (v4) {
    double v29 = x;
  }
  else {
    double v29 = v13;
  }
  if (v4) {
    double y = v13;
  }
  else {
    double width = v28;
  }
  if (v4) {
    double v30 = v28;
  }
  else {
    double v30 = height;
  }

  double v31 = v29;
  double v32 = y;
  double v33 = width;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)scaleIfNeeded:(double)a3 onlyYAxis:(BOOL)a4
{
  if (!self->m_scaled)
  {
    BOOL v7 = a3 == 0.0 || a4;
    double x = self->m_frame.origin.x;
    if (!v7)
    {
      double x = x - a3;
      self->m_frame.origin.double x = x;
      self->m_paddedFrame.origin.double x = self->m_paddedFrame.origin.x - a3;
    }
    -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 1, x, self->m_frame.origin.y, self->m_frame.size.width, self->m_frame.size.height);
    self->m_frame.origin.double x = v9;
    self->m_frame.origin.double y = v10;
    self->m_frame.size.double width = v11;
    self->m_frame.size.double height = v12;
    -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 1, self->m_paddedFrame.origin.x, self->m_paddedFrame.origin.y, self->m_paddedFrame.size.width, self->m_paddedFrame.size.height);
    self->m_paddedFrame.origin.double x = v13;
    self->m_paddedFrame.origin.double y = v14;
    self->m_paddedFrame.size.double width = v15;
    self->m_paddedFrame.size.double height = v16;
    if (!a4)
    {
      -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 0, self->m_frame.origin.x, self->m_frame.origin.y, self->m_frame.size.width, self->m_frame.size.height);
      self->m_frame.origin.double x = v17;
      self->m_frame.origin.double y = v18;
      self->m_frame.size.double width = v19;
      self->m_frame.size.double height = v20;
      -[UIKBShape _scaleRect:inYAxis:](self, "_scaleRect:inYAxis:", 0, self->m_paddedFrame.origin.x, self->m_paddedFrame.origin.y, self->m_paddedFrame.size.width, self->m_paddedFrame.size.height);
      self->m_paddedFrame.origin.double x = v21;
      self->m_paddedFrame.origin.double y = v22;
      self->m_paddedFrame.size.double width = v23;
      self->m_paddedFrame.size.double height = v24;
      if (!v7)
      {
        self->m_frame.origin.double x = self->m_frame.origin.x + a3;
        self->m_paddedFrame.origin.double x = v21 + a3;
      }
    }
    self->m_scaled = 1;
  }
}

+ (id)shapeByCombining:(id)a3 withShape:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v5 frame];
  v46.origin.double x = v15;
  v46.origin.double y = v16;
  v46.size.double width = v17;
  v46.size.double height = v18;
  v42.origin.double x = v8;
  v42.origin.double y = v10;
  v42.size.double width = v12;
  v42.size.double height = v14;
  CGRect v43 = CGRectUnion(v42, v46);
  double y = v43.origin.y;
  double x = v43.origin.x;
  double height = v43.size.height;
  double width = v43.size.width;
  [v6 paddedFrame];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  [v5 paddedFrame];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v44.origin.double x = v20;
  v44.origin.double y = v22;
  v44.size.double width = v24;
  v44.size.double height = v26;
  v47.origin.double x = v28;
  v47.origin.double y = v30;
  v47.size.double width = v32;
  v47.size.double height = v34;
  CGRect v45 = CGRectUnion(v44, v47);
  double v35 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, x, y, width, height, v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
  return v35;
}

+ (id)shapeByResizingShape:(id)a3 byAmount:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 frame];
  double v24 = v7;
  double v9 = v8;
  [v6 frame];
  double v11 = v10 - width;
  [v6 frame];
  double v13 = v12 - height;
  [v6 paddedFrame];
  double v15 = v14;
  double v17 = v16;
  [v6 paddedFrame];
  double v19 = v18 - width;
  [v6 paddedFrame];
  double v21 = v20;

  CGFloat v22 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, v24, v9, v11, v13, v15, v17, v19, v21 - height);
  return v22;
}

- (UIKBGeometry)geometry
{
  return self->m_geometry;
}

- (void)setGeometry:(id)a3
{
}

- (CGRect)frame
{
  double x = self->m_frame.origin.x;
  double y = self->m_frame.origin.y;
  double width = self->m_frame.size.width;
  double height = self->m_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)paddedFrame
{
  double x = self->m_paddedFrame.origin.x;
  double y = self->m_paddedFrame.origin.y;
  double width = self->m_paddedFrame.size.width;
  double height = self->m_paddedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)concaveCorner
{
  return self->m_concaveCorner;
}

- (CGSize)concaveCornerOffset
{
  double width = self->m_concaveCornerOffset.width;
  double height = self->m_concaveCornerOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setConcaveCornerOffset:(CGSize)a3
{
  self->m_concaveCornerOffset = a3;
}

- (unint64_t)uid
{
  return self->m_uid;
}

- (BOOL)scaled
{
  return self->m_scaled;
}

- (void)setScaled:(BOOL)a3
{
  self->m_scaled = a3;
}

- (UIKBShape)originalShape
{
  return self->m_originalShape;
}

- (void)setOriginalShape:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_originalShape, 0);
  objc_storeStrong((id *)&self->m_geometry, 0);
}

@end