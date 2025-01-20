@interface PKRoundedPath
+ (id)pathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4;
- (CGPath)CGPath;
- (PKRoundedPath)init;
- (PKRoundedPath)initWithRect:(CGRect)a3 withRoundedCorners:(int)a4 cornerRadii:(id)a5 smoothPillShapes:(BOOL)a6;
- (void)addContinuousCornerToPath:(CGPath *)a3 trueCorner:(CGPoint)a4 cornerRadius:(CGSize)a5 corners:(unint64_t)a6 portion:(unint64_t)a7 clockwise:(BOOL)a8 fullRadius:(BOOL)a9;
- (void)dealloc;
@end

@implementation PKRoundedPath

- (void)dealloc
{
  CGPathRelease(self->_CGPath);
  v3.receiver = self;
  v3.super_class = (Class)PKRoundedPath;
  [(PKRoundedPath *)&v3 dealloc];
}

+ (id)pathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14[4] = *MEMORY[0x1E4F143B8];
  v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", a4, a4);
  id v10 = objc_alloc((Class)a1);
  v14[0] = v9;
  v14[1] = v9;
  v14[2] = v9;
  v14[3] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  v12 = objc_msgSend(v10, "initWithRect:withRoundedCorners:cornerRadii:smoothPillShapes:", 255, v11, 1, x, y, width, height);

  return v12;
}

- (PKRoundedPath)init
{
  return 0;
}

- (PKRoundedPath)initWithRect:(CGRect)a3 withRoundedCorners:(int)a4 cornerRadii:(id)a5 smoothPillShapes:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  v71.receiver = self;
  v71.super_class = (Class)PKRoundedPath;
  v13 = [(PKRoundedPath *)&v71 init];
  if (v13)
  {
    Mutable = CGPathCreateMutable();
    v15 = [v12 objectAtIndex:0];
    [v15 sizeValue];
    double v17 = v16 * 1.528665;
    v18 = [v12 objectAtIndex:0];
    [v18 sizeValue];
    double v64 = v19;

    v20 = [v12 objectAtIndex:1];
    [v20 sizeValue];
    double v22 = v21 * 1.528665;
    v23 = [v12 objectAtIndex:1];
    [v23 sizeValue];
    double y = v24;

    uint64_t v25 = 3;
    v26 = [v12 objectAtIndex:3];
    [v26 sizeValue];
    double v69 = v27 * 1.528665;
    v28 = [v12 objectAtIndex:3];
    [v28 sizeValue];
    double v62 = v29;

    v30 = [v12 objectAtIndex:2];
    [v30 sizeValue];
    double v70 = v31 * 1.528665;
    v32 = [v12 objectAtIndex:2];
    [v32 sizeValue];
    double v34 = v33;

    double v68 = v17;
    BOOL v35 = v17 + v22 >= width;
    uint64_t v36 = 3;
    if (v17 + v22 >= width)
    {
      double v22 = width * 0.5;
      uint64_t v36 = 2;
      uint64_t v25 = 1;
      double v68 = width * 0.5;
    }
    double v37 = v64 * 1.528665;
    double v38 = v34 * 1.528665;
    if (v69 + v70 >= width)
    {
      uint64_t v39 = 1;
      uint64_t v40 = 2;
      double v69 = width * 0.5;
      double v70 = width * 0.5;
      BOOL v35 = 1;
    }
    else
    {
      uint64_t v39 = 3;
      uint64_t v40 = 3;
    }
    BOOL v41 = v37 + v38 >= height;
    if (v37 + v38 >= height)
    {
      double v38 = height * 0.5;
      v25 &= 2u;
      v40 &= 1u;
      double v37 = height * 0.5;
    }
    double v57 = v22;
    double v60 = v38;
    double v61 = v37;
    if (y * 1.528665 + v62 * 1.528665 >= height)
    {
      v36 &= 1u;
      v39 &= 2u;
      BOOL v41 = 1;
      double v58 = height * 0.5;
      double v59 = height * 0.5;
    }
    else
    {
      double v58 = y * 1.528665;
      double v59 = v62 * 1.528665;
    }
    uint64_t v55 = v25;
    uint64_t v42 = v40 | v25 | v36 | v39;
    if (!v42) {
      BOOL v6 = 0;
    }
    int v43 = v35 && v6;
    v72.origin.CGFloat x = x;
    v72.origin.double y = v9;
    v72.size.double width = width;
    v72.size.double height = height;
    double MinX = CGRectGetMinX(v72);
    v73.origin.CGFloat x = x;
    v73.origin.double y = v9;
    v73.size.double width = width;
    v73.size.double height = height;
    double ya = CGRectGetMinY(v73);
    v74.origin.CGFloat x = x;
    v74.origin.double y = v9;
    v74.size.double width = width;
    v74.size.double height = height;
    double MaxX = CGRectGetMaxX(v74);
    v75.origin.CGFloat x = x;
    v75.origin.double y = v9;
    v75.size.double width = width;
    v75.size.double height = height;
    double MinY = CGRectGetMinY(v75);
    v76.origin.CGFloat x = x;
    v76.origin.double y = v9;
    v76.size.double width = width;
    v76.size.double height = height;
    double v46 = CGRectGetMinX(v76);
    v77.origin.CGFloat x = x;
    v77.origin.double y = v9;
    v77.size.double width = width;
    v77.size.double height = height;
    double MaxY = CGRectGetMaxY(v77);
    v78.origin.CGFloat x = x;
    v78.origin.double y = v9;
    v78.size.double width = width;
    v78.size.double height = height;
    double v47 = CGRectGetMaxX(v78);
    v79.origin.CGFloat x = x;
    v79.origin.double y = v9;
    v79.size.double width = width;
    v79.size.double height = height;
    double v48 = CGRectGetMaxY(v79);
    if (v43 == 1)
    {
      double v49 = v68;
      double MinX = MinX + v68 * 0.05;
      double v50 = v57;
      double MaxX = MaxX - v57 * 0.05;
      double v46 = v46 + v70 * 0.05;
      double v47 = v47 - v69 * 0.05;
    }
    else
    {
      double v49 = v68;
      if (v41 && v6)
      {
        double MinY = MinY + v58 * 0.05;
        double ya = ya + v61 * 0.05;
        double MaxY = MaxY - v60 * 0.05;
        double v48 = v48 - v59 * 0.05;
      }
      double v50 = v57;
    }
    CGFloat v56 = MinX;
    double v51 = v49 + MinX;
    CGPathMoveToPoint(Mutable, 0, v51, ya);
    CGPathAddLineToPoint(Mutable, 0, MaxX - v50, MinY);
    double v53 = *MEMORY[0x1E4F1DB30];
    double v52 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v50 != *MEMORY[0x1E4F1DB30] || v58 != v52) {
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 2, v36, 0, v42 == 0, MaxX, MinY, v50, v58);
    }
    CGPathAddLineToPoint(Mutable, 0, v47, v48 - v59);
    if (v69 != v53 || v59 != v52) {
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 8, v39, 0, v42 == 0, v47, v48, v69, v59);
    }
    CGPathAddLineToPoint(Mutable, 0, v70 + v46, MaxY);
    if (v70 != v53 || v60 != v52) {
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 4, v40, 0, v42 == 0, v46, MaxY, v70, v60);
    }
    CGPathAddLineToPoint(Mutable, 0, v56, v61 + ya);
    if (v68 != v53 || v61 != v52) {
      -[PKRoundedPath addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:](v13, "addContinuousCornerToPath:trueCorner:cornerRadius:corners:portion:clockwise:fullRadius:", Mutable, 1, v55, 0, v42 == 0, v56, ya, v68, v61);
    }
    CGPathAddLineToPoint(Mutable, 0, v51, ya);
    v13->_CGPath = Mutable;
  }

  return v13;
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
    double v16 = dbl_191674E58[a6 - 1];
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
      double v51 = a3;
      CGFloat v53 = v83;
      CGFloat v54 = v84;
      CGFloat v55 = v85;
      CGFloat v56 = v86;
      CGFloat v58 = v75;
      CGFloat v57 = v76;
    }
    else
    {
      double v51 = a3;
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
      double v68 = &m;
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
      double v68 = 0;
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
      double v60 = &m;
      double v59 = a3;
      CGFloat v61 = v89;
      CGFloat v62 = v90;
      CGFloat v63 = v87;
      CGFloat v64 = v88;
      CGFloat v66 = v79;
      CGFloat v65 = v80;
    }
    else
    {
      double v59 = a3;
      double v60 = 0;
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
      double v68 = &m;
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
      double v68 = 0;
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

- (CGPath)CGPath
{
  return self->_CGPath;
}

@end