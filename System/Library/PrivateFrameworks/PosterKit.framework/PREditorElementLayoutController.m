@interface PREditorElementLayoutController
+ (CGRect)boundsForElements:(unint64_t)a3;
+ (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4;
+ (CGRect)frameForElements:(unint64_t)a3;
+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4;
+ (void)clearRegisteredBoundingRectForTitleLayout:(unint64_t)a3;
+ (void)registerBoundingRect:(CGRect)a3 forTitleLayout:(unint64_t)a4 variant:(unint64_t)a5;
- (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5;
- (CGRect)boundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5;
- (CGRect)frameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4;
- (CSProminentLayoutController)csLayoutController;
- (PREditorElementLayoutController)initWithTraitEnvironment:(id)a3;
- (UITraitEnvironment)traitEnvironment;
- (id)boundsAttributesForElements:(unint64_t)a3 variant:(unint64_t)a4 titleLayout:(unint64_t)a5 withBoundingRect:(CGRect)a6;
- (id)frameAttributesForElements:(unint64_t)a3 variant:(unint64_t)a4 titleLayout:(unint64_t)a5 withBoundingRect:(CGRect)a6;
- (void)setFourDigitTime:(BOOL)a3;
- (void)setNumberingSystem:(id)a3;
- (void)setTraitEnvironment:(id)a3;
@end

@implementation PREditorElementLayoutController

+ (void)registerBoundingRect:(CGRect)a3 forTitleLayout:(unint64_t)a4 variant:(unint64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11 = (void *)registeredTitleLayoutToBoundingRects;
  if (!registeredTitleLayoutToBoundingRects)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v13 = (void *)registeredTitleLayoutToBoundingRects;
    registeredTitleLayoutToBoundingRects = v12;

    v11 = (void *)registeredTitleLayoutToBoundingRects;
  }
  v14 = [NSNumber numberWithUnsignedInteger:a4];
  v15 = [v11 objectForKeyedSubscript:v14];

  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v17 = (void *)registeredTitleLayoutToBoundingRects;
    v18 = [NSNumber numberWithUnsignedInteger:a4];
    [v17 setObject:v16 forKeyedSubscript:v18];
  }
  *(CGFloat *)v24 = x;
  *(CGFloat *)&v24[1] = y;
  *(CGFloat *)&v24[2] = width;
  *(CGFloat *)&v24[3] = height;
  v19 = [MEMORY[0x1E4F29238] valueWithBytes:v24 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v20 = (void *)registeredTitleLayoutToBoundingRects;
  v21 = [NSNumber numberWithUnsignedInteger:a4];
  v22 = [v20 objectForKeyedSubscript:v21];
  v23 = [NSNumber numberWithUnsignedInteger:a5];
  [v22 setObject:v19 forKeyedSubscript:v23];
}

+ (void)clearRegisteredBoundingRectForTitleLayout:(unint64_t)a3
{
  v3 = (void *)registeredTitleLayoutToBoundingRects;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v3 removeObjectForKey:v4];
}

+ (CGRect)frameForElements:(unint64_t)a3
{
  [a1 frameForElements:a3 variant:0];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3
{
  [a1 boundsForElements:a3 variant:0];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

+ (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v7 = (void *)frameForElements_variant__mainScreenLayoutController;
  if (!frameForElements_variant__mainScreenLayoutController)
  {
    v8 = [[PREditorElementLayoutController alloc] initWithTraitEnvironment:v6];
    v9 = (void *)frameForElements_variant__mainScreenLayoutController;
    frameForElements_variant__mainScreenLayoutController = (uint64_t)v8;

    v7 = (void *)frameForElements_variant__mainScreenLayoutController;
  }
  [v6 bounds];
  objc_msgSend(v7, "frameForElements:variant:withBoundingRect:", a3, a4);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

+ (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4
{
  [a1 frameForElements:a3 variant:a4];
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (PREditorElementLayoutController)initWithTraitEnvironment:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PREditorElementLayoutController;
  double v5 = [(PREditorElementLayoutController *)&v10 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_traitEnvironment, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F5E4D0]) initWithTraitEnvironment:v4];
    csLayoutController = v6->_csLayoutController;
    v6->_csLayoutController = (CSProminentLayoutController *)v7;
  }
  return v6;
}

- (void)setNumberingSystem:(id)a3
{
  csLayoutController = self->_csLayoutController;
  uint64_t v4 = CSTimeNumberingSystemStringToType();
  [(CSProminentLayoutController *)csLayoutController setNumberingSystem:v4];
}

- (void)setFourDigitTime:(BOOL)a3
{
}

- (CGRect)frameForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](self, "frameForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 withBoundingRect:(CGRect)a4
{
  -[PREditorElementLayoutController boundsForElements:variant:withBoundingRect:](self, "boundsForElements:variant:withBoundingRect:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)frameForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  double v5 = -[PREditorElementLayoutController frameAttributesForElements:variant:titleLayout:withBoundingRect:](self, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  [v5 rect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)boundsForElements:(unint64_t)a3 variant:(unint64_t)a4 withBoundingRect:(CGRect)a5
{
  double v5 = -[PREditorElementLayoutController boundsAttributesForElements:variant:titleLayout:withBoundingRect:](self, "boundsAttributesForElements:variant:titleLayout:withBoundingRect:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  [v5 rect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)frameAttributesForElements:(unint64_t)a3 variant:(unint64_t)a4 titleLayout:(unint64_t)a5 withBoundingRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  unint64_t v11 = a3;
  double v13 = *MEMORY[0x1E4F1DB20];
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (a3)
  {
    double v17 = (void *)registeredTitleLayoutToBoundingRects;
    double v18 = [NSNumber numberWithUnsignedInteger:a5];
    double v19 = [v17 objectForKeyedSubscript:v18];
    double v20 = [NSNumber numberWithUnsignedInteger:a4];
    double v21 = [v19 objectForKeyedSubscript:v20];

    if (!v21)
    {
LABEL_5:
      if (a4 - 1 >= 3) {
        unint64_t v26 = 0;
      }
      else {
        unint64_t v26 = a4;
      }
      -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](self->_csLayoutController, "frameForElements:variant:withBoundingRect:", v11 & 0x1F | (((v11 >> 5) & 3) << 6), v26, x, y, width, height);
      v39.origin.double x = v27;
      v39.origin.double y = v28;
      v39.size.double width = v29;
      v39.size.double height = v30;
      v36.origin.double x = v13;
      v36.origin.double y = v14;
      v36.size.double width = v15;
      v36.size.double height = v16;
      CGRect v37 = CGRectUnion(v36, v39);
      double v13 = v37.origin.x;
      double v14 = v37.origin.y;
      double v15 = v37.size.width;
      double v16 = v37.size.height;
      goto LABEL_9;
    }
    [v21 CGRectValue];
    v38.origin.double x = v22;
    v38.origin.double y = v23;
    v38.size.double width = v24;
    v38.size.double height = v25;
    v34.origin.double x = v13;
    v34.origin.double y = v14;
    v34.size.double width = v15;
    v34.size.double height = v16;
    CGRect v35 = CGRectUnion(v34, v38);
    double v13 = v35.origin.x;
    double v14 = v35.origin.y;
    double v15 = v35.size.width;
    double v16 = v35.size.height;

    v11 &= ~1uLL;
  }
  if (v11) {
    goto LABEL_5;
  }
LABEL_9:
  v31 = -[PREditorElementLayoutAttributes initWithRect:variant:resolvedTitleLayout:]([PREditorElementLayoutAttributes alloc], "initWithRect:variant:resolvedTitleLayout:", a4, 0, v13, v14, v15, v16);
  return v31;
}

- (id)boundsAttributesForElements:(unint64_t)a3 variant:(unint64_t)a4 titleLayout:(unint64_t)a5 withBoundingRect:(CGRect)a6
{
  double v7 = -[PREditorElementLayoutController frameAttributesForElements:variant:titleLayout:withBoundingRect:](self, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  [v7 rect];
  double v10 = -[PREditorElementLayoutAttributes initWithRect:variant:resolvedTitleLayout:]([PREditorElementLayoutAttributes alloc], "initWithRect:variant:resolvedTitleLayout:", a4, [v7 resolvedTitleLayout], 0.0, 0.0, v8, v9);

  return v10;
}

- (UITraitEnvironment)traitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (void)setTraitEnvironment:(id)a3
{
}

- (CSProminentLayoutController)csLayoutController
{
  return self->_csLayoutController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csLayoutController, 0);
  objc_destroyWeak((id *)&self->_traitEnvironment);
}

@end