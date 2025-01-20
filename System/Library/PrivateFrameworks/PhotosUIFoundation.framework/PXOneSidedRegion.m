@interface PXOneSidedRegion
+ (PXOneSidedRegion)identityRegion;
- (BOOL)_getIntersectionWithLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 intersectionFromPoint:(CGPoint *)a5 toPoint:(CGPoint *)a6;
- (BOOL)isEqual:(id)a3;
- (CGPath)createPathInRect:(CGRect)a3;
- (PXOneSidedRegion)init;
- (PXOneSidedRegion)initWithA:(double)a3 b:(double)a4 c:(double)a5;
- (PXOneSidedRegion)initWithSideAngle:(double)a3 point:(CGPoint)a4 width:(double)a5 offset:(double)a6;
- (double)a;
- (double)b;
- (double)c;
- (double)valueAtPoint:(CGPoint)a3;
- (id)transformedWithAffineTransform:(CGAffineTransform *)a3;
- (unint64_t)hash;
@end

@implementation PXOneSidedRegion

- (double)c
{
  return self->_c;
}

- (double)b
{
  return self->_b;
}

- (double)a
{
  return self->_a;
}

- (unint64_t)hash
{
  [(PXOneSidedRegion *)self a];
  double v4 = v3;
  [(PXOneSidedRegion *)self b];
  double v6 = v4 + v5;
  [(PXOneSidedRegion *)self c];
  return (unint64_t)(v6 + v7);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXOneSidedRegion *)a3;
  v18.receiver = self;
  v18.super_class = (Class)PXOneSidedRegion;
  unsigned int v5 = [(PXOneSidedRegion *)&v18 isEqual:v4];
  BOOL v6 = v5;
  if (v4 != self && v5)
  {
    double v7 = v4;
    [(PXOneSidedRegion *)self a];
    double v9 = v8;
    [(PXOneSidedRegion *)v7 a];
    if (v9 == v10 && ([(PXOneSidedRegion *)self b], double v12 = v11, [(PXOneSidedRegion *)v7 b], v12 == v13))
    {
      [(PXOneSidedRegion *)self c];
      double v15 = v14;
      [(PXOneSidedRegion *)v7 c];
      BOOL v6 = v15 == v16;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (BOOL)_getIntersectionWithLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 intersectionFromPoint:(CGPoint *)a5 toPoint:(CGPoint *)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PXOneSidedRegion__getIntersectionWithLineFromPoint_toPoint_intersectionFromPoint_toPoint___block_invoke;
  aBlock[3] = &unk_26545B818;
  aBlock[4] = self;
  double v12 = (double (**)(double, double))_Block_copy(aBlock);
  double v13 = v12[2](v11, v10);
  ((void (*)(double (**)(double, double), double, double))v12[2])(v12, x, y);
  BOOL v15 = v14 >= 0.0 || v13 >= 0.0;
  if (!v15 || v13 >= 0.0 && v14 >= 0.0)
  {
LABEL_9:
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v13 >= 0.0)
  {
    double v16 = -v14 / (v13 - v14);
    double x = x + v16 * (v11 - x);
    double y = y + v16 * (v10 - y);
    goto LABEL_9;
  }
  double v18 = -v13 / (v14 - v13);
  double v11 = v11 + v18 * (x - v11);
  double v10 = v10 + v18 * (y - v10);
  if (a5)
  {
LABEL_10:
    a5->double x = v11;
    a5->double y = v10;
  }
LABEL_11:
  if (a6)
  {
    a6->double x = x;
    a6->double y = y;
  }

  return v15;
}

double __92__PXOneSidedRegion__getIntersectionWithLineFromPoint_toPoint_intersectionFromPoint_toPoint___block_invoke(uint64_t a1, double a2, double a3)
{
  return a3 * *(double *)(*(void *)(a1 + 32) + 16)
       + *(double *)(*(void *)(a1 + 32) + 8) * a2
       + *(double *)(*(void *)(a1 + 32) + 24);
}

- (CGPath)createPathInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PXOneSidedRegion_createPathInRect___block_invoke;
  aBlock[3] = &unk_26545B7C8;
  aBlock[4] = self;
  void aBlock[5] = &v29;
  aBlock[6] = Mutable;
  double v9 = _Block_copy(aBlock);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3010000000;
  v26[3] = &unk_259D809E3;
  long long v27 = PXPointNull;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __37__PXOneSidedRegion_createPathInRect___block_invoke_2;
  v23[3] = &unk_26545B7F0;
  v25 = v26;
  id v10 = v9;
  id v24 = v10;
  double v11 = (void (**)(void, double, double))_Block_copy(v23);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v34);
  v11[2](v11, MinX, MinY);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMinY(v36);
  v11[2](v11, MaxX, v15);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double v16 = CGRectGetMaxX(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v38);
  v11[2](v11, v16, MaxY);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double v18 = CGRectGetMinX(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v19 = CGRectGetMaxY(v40);
  v11[2](v11, v18, v19);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v20 = CGRectGetMinX(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGFloat v21 = CGRectGetMinY(v42);
  v11[2](v11, v20, v21);
  if (*((unsigned char *)v30 + 24)) {
    CGPathCloseSubpath(Mutable);
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v29, 8);
  return Mutable;
}

void __37__PXOneSidedRegion_createPathInRect___block_invoke(uint64_t a1)
{
  CGFloat v5 = 0.0;
  CGFloat v6 = 0.0;
  CGFloat v3 = 0.0;
  CGFloat v4 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "_getIntersectionWithLineFromPoint:toPoint:intersectionFromPoint:toPoint:", &v5, &v3))
  {
    v2 = *(CGPath **)(a1 + 48);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      CGPathAddLineToPoint(v2, 0, v5, v6);
    }
    else
    {
      CGPathMoveToPoint(v2, 0, v5, v6);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 48), 0, v3, v4);
  }
}

uint64_t __37__PXOneSidedRegion_createPathInRect___block_invoke_2(uint64_t result, double a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
  if (*(double *)(v5 + 32) != INFINITY || *(double *)(v5 + 40) != INFINITY)
  {
    uint64_t v7 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    uint64_t v5 = *(void *)(*(void *)(v7 + 40) + 8);
  }
  *(double *)(v5 + 32) = a2;
  *(double *)(v5 + 40) = a3;
  return result;
}

- (double)valueAtPoint:(CGPoint)a3
{
  return a3.y * self->_b + self->_a * a3.x + self->_c;
}

- (id)transformedWithAffineTransform:(CGAffineTransform *)a3
{
  if (a3->b != 0.0 || a3->c != 0.0)
  {
    uint64_t v5 = PXAssertGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v9 = 0;
      _os_log_error_impl(&dword_259CDA000, v5, OS_LOG_TYPE_ERROR, "currently only supporting non-rotational transforms", v9, 2u);
    }
  }
  double v6 = self->_b / a3->d;
  uint64_t v7 = [[PXOneSidedRegion alloc] initWithA:self->_a / a3->a b:v6 c:self->_c - self->_a / a3->a * a3->tx - v6 * a3->ty];

  return v7;
}

- (PXOneSidedRegion)initWithA:(double)a3 b:(double)a4 c:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PXOneSidedRegion;
  result = [(PXOneSidedRegion *)&v9 init];
  if (result)
  {
    result->_a = a3;
    result->_b = a4;
    result->_c = a5;
  }
  return result;
}

- (PXOneSidedRegion)initWithSideAngle:(double)a3 point:(CGPoint)a4 width:(double)a5 offset:(double)a6
{
  __sincos_stret(a3);

  return -[PXOneSidedRegion initWithA:b:c:](self, "initWithA:b:c:");
}

- (PXOneSidedRegion)init
{
  return [(PXOneSidedRegion *)self initWithA:0.0 b:0.0 c:0.0];
}

+ (PXOneSidedRegion)identityRegion
{
  if (identityRegion_onceToken != -1) {
    dispatch_once(&identityRegion_onceToken, &__block_literal_global_7752);
  }
  v2 = (void *)identityRegion_identityRegion;

  return (PXOneSidedRegion *)v2;
}

uint64_t __34__PXOneSidedRegion_identityRegion__block_invoke()
{
  v0 = [[PXOneSidedRegion alloc] initWithA:0.0 b:0.0 c:1.0];
  uint64_t v1 = identityRegion_identityRegion;
  identityRegion_identityRegion = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end