@interface PXPath
+ (id)pathWithEllipseInRect:(CGRect)a3;
+ (id)pathWithRect:(CGRect)a3;
+ (id)pathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
- (CGPath)CGPath;
- (CGRect)boundingRect;
- (NSMutableArray)points;
- (PXPath)initWithPoints:(CGPoint *)a3 count:(int64_t)a4;
- (PXPath)initWithRect:(CGRect)a3 withRoundedCorners:(int)a4 cornerRadii:(id)a5 smoothPillShapes:(BOOL)a6;
- (void)addContinuousCornerToPath:(CGPath *)a3 trueCorner:(CGPoint)a4 cornerRadius:(CGSize)a5 corners:(unint64_t)a6 portion:(unint64_t)a7 clockwise:(BOOL)a8 fullRadius:(BOOL)a9;
- (void)addLineToPointX:(double)a3 y:(double)a4;
- (void)setCGPath:(CGPath *)a3;
- (void)setPoints:(id)a3;
@end

@implementation PXPath

- (void).cxx_destruct
{
}

- (void)setPoints:(id)a3
{
}

- (NSMutableArray)points
{
  return self->_points;
}

- (void)setCGPath:(CGPath *)a3
{
}

- (CGPath)CGPath
{
  return (CGPath *)objc_getProperty(self, a2, 8, 1);
}

- (void)addContinuousCornerToPath:(CGPath *)a3 trueCorner:(CGPoint)a4 cornerRadius:(CGSize)a5 corners:(unint64_t)a6 portion:(unint64_t)a7 clockwise:(BOOL)a8 fullRadius:(BOOL)a9
{
  BOOL v9 = a8;
  char v10 = a7;
  double x = a4.x;
  if (a5.width < a5.height) {
    a5.double height = a5.width;
  }
  double v14 = 0.980263;
  if (a9) {
    double v14 = 1.0;
  }
  double height = a5.height;
  if (a9) {
    double v15 = a5.height;
  }
  else {
    double v15 = a5.height * 0.95;
  }
  double v95 = v14;
  double v16 = 0.0;
  if (a6 - 1 <= 3) {
    double v16 = dbl_1AB35B4F8[a6 - 1];
  }
  double v17 = v15 * (1.0 - v14);
  if (a7 == 2)
  {
    double v96 = v16;
    double v18 = -v17;
    double v94 = 70.0;
    double v19 = *MEMORY[0x1E4F1DAD8];
  }
  else if (a7 == 1)
  {
    double v96 = v16 + 20.0;
    double v19 = -v17;
    double v94 = 70.0;
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else if (a7)
  {
    double v96 = v16 + 20.0;
    double v94 = 50.0;
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v19 = *MEMORY[0x1E4F1DAD8];
    double v15 = v15 / 1.528665;
  }
  else
  {
    double v96 = v16;
    double v18 = -v17;
    double v94 = 90.0;
    double v19 = -v17;
  }
  double v20 = _interiorPointForCorner(a6, v19, v18, *MEMORY[0x1E4F1DAD8]);
  CGFloat v91 = v21;
  CGFloat v92 = v20;
  double v22 = v15 * 0.33 * 0.666666667;
  double v23 = v22 * 1.05304313;
  double v24 = v22 * 0.33 / 1.05304313;
  double v25 = (v15 / 1.05304313 + v24) * 0.67;
  double v26 = v23 + v25;
  double v27 = v23 + v23 + v25;
  double v28 = v23 + v23 + v27;
  double v29 = v25 + v24 * 0.33;
  double v89 = _interiorPointForCorner(a6, v27, 0.0, x);
  double v90 = v30;
  double v87 = _interiorPointForCorner(a6, v26, 0.0, x);
  double v88 = v31;
  double v32 = _interiorPointForCorner(a6, v29, v24, x);
  double v79 = v33;
  double v80 = v32;
  double v34 = _interiorPointForCorner(a6, v24, v29, x);
  double v75 = v35;
  double v76 = v34;
  double v85 = _interiorPointForCorner(a6, 0.0, v26, x);
  double v86 = v36;
  double v83 = _interiorPointForCorner(a6, 0.0, v27, x);
  double v84 = v37;
  double v38 = _interiorPointForCorner(a6, 0.0, v28, x);
  double v81 = v39;
  double v82 = v38;
  double v40 = _interiorPointForCorner(a6, v28, 0.0, x);
  double v77 = v41;
  double v78 = v40;
  double v42 = _interiorPointForCorner(a6, v15, v15, x);
  CGFloat v44 = v43;
  double v45 = _interiorPointForCorner(a6, height, 0.0, x);
  double v47 = v46;
  double v48 = _interiorPointForCorner(a6, 0.0, height, x);
  double v50 = v49;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v92, v91);
  if (v9)
  {
    if (v10)
    {
      p_CGAffineTransform m = &m;
      v51 = a3;
      CGFloat v53 = v83;
      CGFloat v54 = v84;
      CGFloat v55 = v85;
      CGFloat v56 = v86;
      CGFloat v58 = v75;
      CGFloat v57 = v76;
    }
    else
    {
      v51 = a3;
      p_CGAffineTransform m = 0;
      CGFloat v53 = v48;
      CGFloat v54 = v50;
      CGFloat v55 = v48;
      CGFloat v56 = v50;
      CGFloat v57 = v48;
      CGFloat v58 = v50;
    }
    CGPathAddCurveToPoint(v51, p_m, v53, v54, v55, v56, v57, v58);
    CGPathAddArc(a3, &m, v42, v44, v95 * v15, (v94 + v96) * 0.0174532925, v96 * 0.0174532925, 1);
    if ((v10 & 2) != 0)
    {
      v68 = &m;
      v67 = a3;
      CGFloat v69 = v87;
      CGFloat v70 = v88;
      CGFloat v71 = v89;
      CGFloat v72 = v90;
      CGFloat v74 = v77;
      CGFloat v73 = v78;
    }
    else
    {
      v67 = a3;
      v68 = 0;
      CGFloat v69 = v45;
      CGFloat v70 = v47;
      CGFloat v71 = v45;
      CGFloat v72 = v47;
      CGFloat v73 = v45;
      CGFloat v74 = v47;
    }
  }
  else
  {
    if (v10)
    {
      v60 = &m;
      v59 = a3;
      CGFloat v61 = v89;
      CGFloat v62 = v90;
      CGFloat v63 = v87;
      CGFloat v64 = v88;
      CGFloat v66 = v79;
      CGFloat v65 = v80;
    }
    else
    {
      v59 = a3;
      v60 = 0;
      CGFloat v61 = v45;
      CGFloat v62 = v47;
      CGFloat v63 = v45;
      CGFloat v64 = v47;
      CGFloat v65 = v45;
      CGFloat v66 = v47;
    }
    CGPathAddCurveToPoint(v59, v60, v61, v62, v63, v64, v65, v66);
    CGPathAddArc(a3, &m, v42, v44, v95 * v15, v96 * 0.0174532925, (v94 + v96) * 0.0174532925, 0);
    if ((v10 & 2) != 0)
    {
      v68 = &m;
      v67 = a3;
      CGFloat v69 = v85;
      CGFloat v70 = v86;
      CGFloat v71 = v83;
      CGFloat v72 = v84;
      CGFloat v74 = v81;
      CGFloat v73 = v82;
    }
    else
    {
      v67 = a3;
      v68 = 0;
      CGFloat v69 = v48;
      CGFloat v70 = v50;
      CGFloat v71 = v48;
      CGFloat v72 = v50;
      CGFloat v73 = v48;
      CGFloat v74 = v50;
    }
  }
  CGPathAddCurveToPoint(v67, v68, v69, v70, v71, v72, v73, v74);
}

- (PXPath)initWithRect:(CGRect)a3 withRoundedCorners:(int)a4 cornerRadii:(id)a5 smoothPillShapes:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  id v12 = a5;
  Mutable = CGPathCreateMutable();
  double v14 = [v12 objectAtIndex:0];
  [v14 sizeValue];
  double v16 = v15 * 1.528665;
  double v17 = [v12 objectAtIndex:0];
  [v17 sizeValue];
  double v72 = v18 * 1.528665;

  double v19 = [v12 objectAtIndex:1];
  [v19 sizeValue];
  double v74 = v20 * 1.528665;
  double v21 = [v12 objectAtIndex:1];
  [v21 sizeValue];
  double y = v22;

  uint64_t v23 = 3;
  double v24 = [v12 objectAtIndex:3];
  [v24 sizeValue];
  double v26 = v25 * 1.528665;
  double v27 = [v12 objectAtIndex:3];
  [v27 sizeValue];
  double v67 = v28;

  double v29 = [v12 objectAtIndex:2];
  [v29 sizeValue];
  double v31 = v30 * 1.528665;
  double v32 = [v12 objectAtIndex:2];

  [v32 sizeValue];
  double v73 = v33 * 1.528665;

  double v34 = v74;
  double v71 = v16;
  BOOL v35 = v16 + v74 >= width;
  uint64_t v36 = 3;
  if (v16 + v74 >= width)
  {
    double v34 = width * 0.5;
    uint64_t v36 = 2;
    uint64_t v23 = 1;
    double v71 = width * 0.5;
  }
  double v75 = v34;
  double v37 = y * 1.528665;
  double v38 = v67 * 1.528665;
  double v39 = width * 0.5;
  if (v26 + v31 >= width) {
    double v40 = width * 0.5;
  }
  else {
    double v40 = v31;
  }
  if (v26 + v31 < width) {
    double v39 = v26;
  }
  double v66 = v39;
  double v68 = v40;
  if (v26 + v31 >= width) {
    uint64_t v41 = 1;
  }
  else {
    uint64_t v41 = 3;
  }
  if (v26 + v31 >= width) {
    uint64_t v42 = 2;
  }
  else {
    uint64_t v42 = 3;
  }
  if (v26 + v31 >= width) {
    BOOL v35 = 1;
  }
  BOOL v43 = v72 + v73 >= height;
  if (v72 + v73 >= height)
  {
    v23 &= 2u;
    v42 &= 1u;
    double v72 = height * 0.5;
    double v73 = height * 0.5;
  }
  BOOL v44 = v37 + v38 < height;
  if (v37 + v38 >= height) {
    double v38 = height * 0.5;
  }
  double v62 = v38;
  if (v44) {
    uint64_t v45 = v36;
  }
  else {
    uint64_t v45 = v36 & 1;
  }
  if (v44) {
    uint64_t v46 = v41;
  }
  else {
    uint64_t v46 = v41 & 2;
  }
  int v47 = !v44 || v43;
  if (!v44) {
    double v37 = height * 0.5;
  }
  double v64 = v37;
  uint64_t v48 = v42 | v23 | v45 | v46;
  if (!v48) {
    BOOL v6 = 0;
  }
  int v49 = v35 && v6;
  v76.origin.double x = v10;
  v76.origin.double y = v9;
  v76.size.double width = width;
  v76.size.double height = height;
  double MinX = CGRectGetMinX(v76);
  v77.origin.double x = v10;
  v77.origin.double y = v9;
  v77.size.double width = width;
  v77.size.double height = height;
  double ya = CGRectGetMinY(v77);
  v78.origin.double x = v10;
  v78.origin.double y = v9;
  v78.size.double width = width;
  v78.size.double height = height;
  double MaxX = CGRectGetMaxX(v78);
  v79.origin.double x = v10;
  v79.origin.double y = v9;
  v79.size.double width = width;
  v79.size.double height = height;
  double MinY = CGRectGetMinY(v79);
  v80.origin.double x = v10;
  v80.origin.double y = v9;
  v80.size.double width = width;
  v80.size.double height = height;
  double v52 = CGRectGetMinX(v80);
  v81.origin.double x = v10;
  v81.origin.double y = v9;
  v81.size.double width = width;
  v81.size.double height = height;
  double MaxY = CGRectGetMaxY(v81);
  v82.origin.double x = v10;
  v82.origin.double y = v9;
  v82.size.double width = width;
  v82.size.double height = height;
  double v53 = CGRectGetMaxX(v82);
  v83.origin.double x = v10;
  v83.origin.double y = v9;
  v83.size.double width = width;
  v83.size.double height = height;
  double v54 = CGRectGetMaxY(v83);
  if (v49 == 1)
  {
    double v55 = v71;
    double MinX = MinX + v71 * 0.05;
    double v56 = v75;
    double MaxX = MaxX - v75 * 0.05;
    double v52 = v52 + v68 * 0.05;
    double v53 = v53 - v66 * 0.05;
  }
  else
  {
    double v55 = v71;
    if ((v47 & v6) == 1)
    {
      double ya = ya + v72 * 0.05;
      double MinY = MinY + v64 * 0.05;
      double MaxY = MaxY - v73 * 0.05;
      double v54 = v54 - v62 * 0.05;
    }
    double v56 = v75;
  }
  double x = v55 + MinX;
  CGPathMoveToPoint(Mutable, 0, v55 + MinX, ya);
  CGPathAddLineToPoint(Mutable, 0, MaxX - v56, MinY);
  double v58 = *MEMORY[0x1E4F1DB30];
  double v57 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v56 != *MEMORY[0x1E4F1DB30] || v64 != v57) {
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 2, v45, 0, v48 == 0, MaxX, MinY, v56, v64, *(void *)&x);
  }
  CGPathAddLineToPoint(Mutable, 0, v53, v54 - v62);
  if (v66 != v58 || v62 != v57) {
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 8, v46, 0, v48 == 0, v53, v54, v66, v62);
  }
  CGPathAddLineToPoint(Mutable, 0, v68 + v52, MaxY);
  if (v68 != v58 || v73 != v57) {
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 4, v42, 0, v48 == 0, v52, MaxY, v68, v73);
  }
  CGPathAddLineToPoint(Mutable, 0, MinX, v72 + ya);
  if (v71 != v58 || v72 != v57) {
    -[PXPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](self, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 1, v23, 0, v48 == 0, MinX, ya, v71, v72);
  }
  CGPathAddLineToPoint(Mutable, 0, x, ya);
  v59 = objc_alloc_init(PXPath);
  [(PXPath *)v59 setCGPath:Mutable];
  CGPathRelease(Mutable);

  return v59;
}

- (CGRect)boundingRect
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v2 = [(PXPath *)self points];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    double v6 = 0.0;
    double v7 = 1.79769313e308;
    double v8 = 0.0;
    double v9 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v11 x];
        if (v12 < v9)
        {
          [v11 x];
          double v9 = v13;
        }
        [v11 x];
        if (v14 > v6)
        {
          [v11 x];
          double v6 = v15;
        }
        [v11 y];
        if (v16 < v7)
        {
          [v11 y];
          double v7 = v17;
        }
        [v11 y];
        if (v18 > v8)
        {
          [v11 y];
          double v8 = v19;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
    double v7 = 1.79769313e308;
    double v8 = 0.0;
    double v9 = 1.79769313e308;
  }

  double v20 = v6 - v9;
  double v21 = v8 - v7;
  double v22 = v9;
  double v23 = v7;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)addLineToPointX:(double)a3 y:(double)a4
{
  id v6 = +[SPCCurvePoint pointWithX:a3 y:a4];
  uint64_t v5 = [(PXPath *)self points];
  [v5 addObject:v6];
}

- (PXPath)initWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PXPath;
  id v6 = [(PXPath *)&v11 init];
  if (v6)
  {
    double v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    points = v6->_points;
    v6->_points = v7;

    if (a4 >= 1)
    {
      p_double y = &a3->y;
      do
      {
        [(PXPath *)v6 addLineToPointX:*(p_y - 1) y:*p_y];
        p_y += 2;
        --a4;
      }
      while (a4);
    }
  }
  return v6;
}

+ (id)pathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14[4] = *MEMORY[0x1E4F143B8];
  double v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", a4, a4);
  id v10 = objc_alloc((Class)a1);
  v14[0] = v9;
  v14[1] = v9;
  v14[2] = v9;
  v14[3] = v9;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  double v12 = objc_msgSend(v10, "initWithRect:withRoundedCorners:cornerRadii:smoothPillShapes:", 255, v11, 1, x, y, width, height);

  return v12;
}

+ (id)pathWithEllipseInRect:(CGRect)a3
{
  id v3 = objc_alloc_init((Class)a1);
  return v3;
}

+ (id)pathWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CGFloat MinX = CGRectGetMinX(a3);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  *(CGFloat *)double v13 = MinX;
  *(CGFloat *)&v13[1] = MinY;
  *(CGFloat *)&v13[2] = MinX;
  CGFloat MaxY = CGRectGetMaxY(v23);
  CGFloat v15 = MaxX;
  CGFloat v16 = MaxY;
  CGFloat v17 = MaxX;
  CGFloat v18 = MinY;
  objc_super v11 = (void *)[objc_alloc((Class)a1) initWithPoints:v13 count:4];
  [v11 closeSubpath];
  return v11;
}

@end