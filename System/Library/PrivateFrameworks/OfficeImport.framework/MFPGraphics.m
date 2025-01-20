@interface MFPGraphics
+ (float)unitsPerInch:(int)a3;
- (BOOL)areThereOpenContainers;
- (CGAffineTransform)pageTransformWithScale:(SEL)a3 unit:(float)a4;
- (CGRect)canvas;
- (MFPGraphics)initWithCanvas:(CGRect)a3;
- (float)pixelsPerUnit:(int)a3 direction:(int)a4;
- (id)currentState;
- (id)fontNameForUppercaseFontName:(id)a3;
- (id)objectTable;
- (void)beginContainerNoParamsWithId:(unsigned int)a3;
- (void)beginContainerWithId:(unsigned int)a3 boundsInParent:(CGRect)a4 bounds:(CGRect)a5 boundsUnit:(int)a6;
- (void)beginContainerWithId:(unsigned int)a3 containerTransform:(CGAffineTransform *)a4;
- (void)fillPath:(id)a3 brush:(id)a4;
- (void)restoreGraphicsStateOrEndContainerWithId:(unsigned int)a3;
- (void)saveGraphicsStateWithId:(unsigned int)a3;
- (void)setHorizontalDpi:(int)a3 verticalDpi:(int)a4;
- (void)strokePath:(id)a3 pen:(id)a4;
@end

@implementation MFPGraphics

- (MFPGraphics)initWithCanvas:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)MFPGraphics;
  v7 = [(MFPGraphics *)&v23 init];
  v8 = v7;
  if (v7)
  {
    v7->mCanvas.origin.CGFloat x = x;
    v7->mCanvas.origin.CGFloat y = y;
    v7->mCanvas.size.CGFloat width = width;
    v7->mCanvas.size.CGFloat height = height;
    v9 = [[MFPGraphicsState alloc] initWithDefaults];
    mCurrentState = v8->mCurrentState;
    v8->mCurrentState = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mStateStack = v8->mStateStack;
    v8->mStateStack = v11;

    v13 = objc_alloc_init(MFPObjectTable);
    mObjectTable = v8->mObjectTable;
    v8->mObjectTable = v13;

    v15 = TCFontFamilyNames();
    uint64_t v16 = [v15 count];
    uint64_t v17 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v16];
    mAvailableFonts = v8->mAvailableFonts;
    v8->mAvailableFonts = (NSMutableDictionary *)v17;

    if (v16)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        v20 = [v15 objectAtIndex:i];
        v21 = [v20 uppercaseString];
        [(NSMutableDictionary *)v8->mAvailableFonts setObject:v20 forKey:v21];
      }
    }
  }
  return v8;
}

- (void)setHorizontalDpi:(int)a3 verticalDpi:(int)a4
{
  self->mHorzDpuint64_t i = a3;
  self->mVertDpuint64_t i = a4;
}

- (CGRect)canvas
{
  double x = self->mCanvas.origin.x;
  double y = self->mCanvas.origin.y;
  double width = self->mCanvas.size.width;
  double height = self->mCanvas.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)objectTable
{
  return self->mObjectTable;
}

+ (float)unitsPerInch:(int)a3
{
  float result = 0.0;
  if ((a3 - 3) <= 3) {
    return flt_238EDE4D0[a3 - 3];
  }
  return result;
}

- (float)pixelsPerUnit:(int)a3 direction:(int)a4
{
  float v4 = 1.0;
  if (a3 >= 3)
  {
    +[MFPGraphics unitsPerInch:](MFPGraphics, "unitsPerInch:");
    if (!a4)
    {
      uint64_t v8 = 40;
      return (float)*(int *)((char *)&self->super.isa + v8) / v7;
    }
    float v4 = 0.0;
    if (a4 == 1)
    {
      uint64_t v8 = 44;
      return (float)*(int *)((char *)&self->super.isa + v8) / v7;
    }
  }
  return v4;
}

- (CGAffineTransform)pageTransformWithScale:(SEL)a3 unit:(float)a4
{
  uint64_t v7 = MEMORY[0x263F000D0];
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v7 + 32);
  if (a5 >= 2)
  {
    uint64_t v9 = *(void *)&a5;
    v10 = self;
    -[CGAffineTransform pixelsPerUnit:direction:](self, "pixelsPerUnit:direction:");
    float v12 = v11 * a4;
    [(CGAffineTransform *)v10 pixelsPerUnit:v9 direction:1];
    return CGAffineTransformMakeScale(retstr, v12, (float)(v13 * a4));
  }
  return self;
}

- (void)saveGraphicsStateWithId:(unsigned int)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v5 = [[MFPGraphicsState alloc] initWithGraphicsState:self->mCurrentState];
  -[NSMutableArray addObject:](self->mStateStack, "addObject:");
}

- (void)beginContainerWithId:(unsigned int)a3 containerTransform:(CGAffineTransform *)a4
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  uint64_t v7 = [MFPGraphicsContainer alloc];
  mCurrentState = self->mCurrentState;
  long long v9 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v9;
  v13[2] = *(_OWORD *)&a4->tx;
  v10 = [(MFPGraphicsContainer *)v7 initWithParentGraphicsState:mCurrentState containerTransform:v13];
  [(NSMutableArray *)self->mStateStack addObject:v10];
  float v11 = [[MFPGraphicsState alloc] initWithDefaults];
  float v12 = self->mCurrentState;
  self->mCurrentState = v11;
}

- (void)beginContainerNoParamsWithId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  memset(&v8, 0, sizeof(v8));
  mCurrentState = self->mCurrentState;
  if (mCurrentState) {
    [(MFPGraphicsState *)mCurrentState pageTransform];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CGAffineTransformInvert(&v8, &v7);
  CGAffineTransform v6 = v8;
  [(MFPGraphics *)self beginContainerWithId:v3 containerTransform:&v6];
}

- (void)beginContainerWithId:(unsigned int)a3 boundsInParent:(CGRect)a4 bounds:(CGRect)a5 boundsUnit:(int)a6
{
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v8 = *(void *)&a3;
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v22 = *MEMORY[0x263F000D0];
  long long v23 = v10;
  long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (a6 >= 2)
  {
    uint64_t v11 = *(void *)&a6;
    double height = a5.size.height;
    double width = a5.size.width;
    double v14 = a5.origin.y;
    double v15 = a5.origin.x;
    CGFloat v16 = a4.size.width;
    CGFloat v20 = a4.size.height;
    [(MFPGraphics *)self pixelsPerUnit:*(void *)&a6 direction:0];
    float v18 = v17;
    [(MFPGraphics *)self pixelsPerUnit:v11 direction:1];
    mapSrcRectOntoDstRect((uint64_t)&v22, v15 * v18, v14 * v19, width * v18, height * v19, x, y, v16, v20);
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  [(MFPGraphics *)self beginContainerWithId:v8 containerTransform:v21];
}

- (void)restoreGraphicsStateOrEndContainerWithId:(unsigned int)a3
{
  while ([(NSMutableArray *)self->mStateStack count] > (unint64_t)a3)
  {
    v5 = [(NSMutableArray *)self->mStateStack lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [v5 parentGraphicsState];
    }
    CGAffineTransform v7 = v6;
    objc_storeStrong((id *)&self->mCurrentState, v6);
    [(NSMutableArray *)self->mStateStack removeLastObject];
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextRestoreGState(CurrentContext);
  }
}

- (BOOL)areThereOpenContainers
{
  if ([(NSMutableArray *)self->mStateStack count])
  {
    unint64_t v3 = 0;
    do
    {
      float v4 = [(NSMutableArray *)self->mStateStack objectAtIndex:v3];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      ++v3;
    }
    while (v3 < [(NSMutableArray *)self->mStateStack count]);
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)currentState
{
  return self->mCurrentState;
}

- (void)fillPath:(id)a3 brush:(id)a4
{
}

- (void)strokePath:(id)a3 pen:(id)a4
{
}

- (id)fontNameForUppercaseFontName:(id)a3
{
  unint64_t v3 = [(NSMutableDictionary *)self->mAvailableFonts objectForKey:a3];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAvailableFonts, 0);
  objc_storeStrong((id *)&self->mObjectTable, 0);
  objc_storeStrong((id *)&self->mStateStack, 0);
  objc_storeStrong((id *)&self->mCurrentState, 0);
}

@end