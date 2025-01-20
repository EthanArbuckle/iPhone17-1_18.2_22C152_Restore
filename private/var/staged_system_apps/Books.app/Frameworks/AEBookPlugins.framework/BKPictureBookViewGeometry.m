@interface BKPictureBookViewGeometry
+ (CGSize)imageSizeForSize:(CGSize)a3;
+ (id)geometryWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 containerBounds:(CGRect)a6;
+ (id)geometryWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 ignoresPadding:(BOOL)a6 containerBounds:(CGRect)a7;
- (BKPictureBookViewGeometry)initWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 ignoresPadding:(BOOL)a6 containerBounds:(CGRect)a7;
- (BKThumbnailBookViewConfiguring)configuration;
- (BOOL)drawsSpine;
- (BOOL)ignoresPadding;
- (CGRect)containerBounds;
- (CGSize)contentSize;
- (CGSize)imageSizeForSpread:(BOOL)a3 landscape:(BOOL)a4;
- (CGSize)maximumSize;
- (CGSize)sizeForSpread:(BOOL)a3 landscape:(BOOL)a4;
- (double)scaleForSize:(CGSize)a3;
- (double)scaleForSpread:(BOOL)a3 landscape:(BOOL)a4;
- (id)imageSizes;
- (id)sizes;
- (void)setConfiguration:(id)a3;
- (void)setContainerBounds:(CGRect)a3;
- (void)setIgnoresPadding:(BOOL)a3;
@end

@implementation BKPictureBookViewGeometry

+ (id)geometryWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 ignoresPadding:(BOOL)a6 containerBounds:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  BOOL v11 = a6;
  BOOL v12 = a5;
  double v13 = a3.height;
  double v14 = a3.width;
  id v16 = a4;
  id v17 = [objc_alloc((Class)a1) initWithContentSize:v16 configuration:v12 drawsSpine:v11 ignoresPadding:v14 containerBounds:x, y, width, height];

  return v17;
}

+ (id)geometryWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 containerBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v10 = a5;
  double v11 = a3.height;
  double v12 = a3.width;
  id v14 = a4;
  id v15 = [objc_alloc((Class)a1) initWithContentSize:v14 configuration:v10 drawsSpine:0 ignoresPadding:v12 containerBounds:x, y, width, height];

  return v15;
}

- (BKPictureBookViewGeometry)initWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 ignoresPadding:(BOOL)a6 containerBounds:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  CGFloat v14 = a3.height;
  CGFloat v15 = a3.width;
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BKPictureBookViewGeometry;
  v18 = [(BKPictureBookViewGeometry *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_contentSize.CGFloat width = v15;
    v18->_contentSize.CGFloat height = v14;
    v18->_drawsSpine = a5;
    objc_storeStrong((id *)&v18->_configuration, a4);
    v19->_ignoresPadding = a6;
    v19->_containerBounds.origin.CGFloat x = x;
    v19->_containerBounds.origin.CGFloat y = y;
    v19->_containerBounds.size.CGFloat width = width;
    v19->_containerBounds.size.CGFloat height = height;
  }

  return v19;
}

- (CGSize)sizeForSpread:(BOOL)a3 landscape:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(BKPictureBookViewGeometry *)self contentSize];
  if (v7 <= 0.0 || ([(BKPictureBookViewGeometry *)self contentSize], v8 <= 0.0))
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    [(BKPictureBookViewGeometry *)self contentSize];
    double v10 = v9;
    [(BKPictureBookViewGeometry *)self contentSize];
    double v12 = v10 / v11;
    [(BKPictureBookViewGeometry *)self scaleForSpread:v5 landscape:v4];
    [(BKPictureBookViewGeometry *)self contentSize];
    CGSizeScale();
    double v14 = floor(v13);
    char v15 = vcvtmd_s64_f64(v13);
    double width = v14 + 1.0;
    if ((v15 & 1) == 0) {
      double width = v14;
    }
    double height = floor(1.0 / v12 * width);
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scaleForSpread:(BOOL)a3 landscape:(BOOL)a4
{
  [(BKPictureBookViewGeometry *)self contentSize];
  if (v6 <= 0.0) {
    return 1.0;
  }
  [(BKPictureBookViewGeometry *)self contentSize];
  if (v7 <= 0.0 || CGRectIsEmpty(self->_containerBounds)) {
    return 1.0;
  }
  [(BKPictureBookViewGeometry *)self contentSize];
  [(BKPictureBookViewGeometry *)self contentSize];
  IMActionSafeRectForRect();
  if (!a3 && !self->_ignoresPadding)
  {
    double v9 = [(BKPictureBookViewGeometry *)self configuration];
    [v9 singlePagePadding];
  }

  CGSizeScaleThatFitsInCGSize();
  return result;
}

- (CGSize)maximumSize
{
  [(BKPictureBookViewGeometry *)self contentSize];
  if (v3 <= 0.0 || ([(BKPictureBookViewGeometry *)self contentSize], v4 <= 0.0))
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    [(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:1];
    double v6 = v5;
    double v8 = v7;
    [(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:0];
    if (v6 > width)
    {
      double width = v6;
      double height = v8;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scaleForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:1];
  BOOL v8 = width == v7 && height == v6;
  if (v8
    || (([(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:1], width == v10)
      ? (BOOL v11 = height == v9)
      : (BOOL v11 = 0),
        v11
     || (([(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:1], width == v13)
       ? (BOOL v14 = height == v12)
       : (BOOL v14 = 0),
         v14
      || ([(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:1], width == v16)
      && height == v15)))
  {
    [(BKPictureBookViewGeometry *)self scaleForSpread:0 landscape:1];
  }
  else
  {
    [(BKPictureBookViewGeometry *)self contentSize];
    return width / v18;
  }
  return result;
}

- (id)sizes
{
  double v3 = +[NSMutableArray array];
  [(BKPictureBookViewGeometry *)self sizeForSpread:1 landscape:1];
  double v30 = v5;
  double v31 = v4;
  [(BKPictureBookViewGeometry *)self sizeForSpread:1 landscape:0];
  double v7 = v6;
  double v9 = v8;
  [(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:1];
  double v11 = v10;
  double v13 = v12;
  [(BKPictureBookViewGeometry *)self sizeForSpread:0 landscape:0];
  double v15 = v14;
  double v17 = v16;
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  v20 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, v9);
  [v3 addObject:v20];

  objc_super v21 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v31, v30);
  [v3 addObject:v21];

  BOOL v22 = height < width;
  if (height >= width) {
    double v23 = v11;
  }
  else {
    double v23 = v15;
  }
  if (height >= width) {
    double v24 = v13;
  }
  else {
    double v24 = v17;
  }
  if (height >= width) {
    double v25 = v15;
  }
  else {
    double v25 = v11;
  }
  if (v22) {
    double v26 = v13;
  }
  else {
    double v26 = v17;
  }
  v27 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v23, v24);
  [v3 addObject:v27];

  v28 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v25, v26);
  [v3 addObject:v28];

  return v3;
}

- (id)imageSizes
{
  double v3 = +[NSMutableArray array];
  [(BKPictureBookViewGeometry *)self imageSizeForSpread:1 landscape:1];
  double v30 = v5;
  double v31 = v4;
  [(BKPictureBookViewGeometry *)self imageSizeForSpread:1 landscape:0];
  double v7 = v6;
  double v9 = v8;
  [(BKPictureBookViewGeometry *)self imageSizeForSpread:0 landscape:1];
  double v11 = v10;
  double v13 = v12;
  [(BKPictureBookViewGeometry *)self imageSizeForSpread:0 landscape:0];
  double v15 = v14;
  double v17 = v16;
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  v20 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, v9);
  [v3 addObject:v20];

  objc_super v21 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v31, v30);
  [v3 addObject:v21];

  BOOL v22 = height < width;
  if (height >= width) {
    double v23 = v11;
  }
  else {
    double v23 = v15;
  }
  if (height >= width) {
    double v24 = v13;
  }
  else {
    double v24 = v17;
  }
  if (height >= width) {
    double v25 = v15;
  }
  else {
    double v25 = v11;
  }
  if (v22) {
    double v26 = v13;
  }
  else {
    double v26 = v17;
  }
  v27 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v23, v24);
  [v3 addObject:v27];

  v28 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v25, v26);
  [v3 addObject:v28];

  return v3;
}

- (CGSize)imageSizeForSpread:(BOOL)a3 landscape:(BOOL)a4
{
  [(BKPictureBookViewGeometry *)self sizeForSpread:a3 landscape:a4];
  double v5 = v4;
  double v7 = v6;
  double v8 = objc_opt_class();

  [v8 imageSizeForSize:v5, v7];
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)imageSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  double v8 = width * v7;
  double v9 = height * v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)contentSize
{
  objc_copyStruct(v4, &self->_contentSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (BKThumbnailBookViewConfiguring)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CGRect)containerBounds
{
  double x = self->_containerBounds.origin.x;
  double y = self->_containerBounds.origin.y;
  double width = self->_containerBounds.size.width;
  double height = self->_containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (BOOL)ignoresPadding
{
  return self->_ignoresPadding;
}

- (void)setIgnoresPadding:(BOOL)a3
{
  self->_ignoresPadding = a3;
}

- (void).cxx_destruct
{
}

@end