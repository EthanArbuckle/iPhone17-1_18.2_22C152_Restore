@interface TSDLayout
+ (id)layoutGeometryFittingLayoutGeometry:(id)a3 inFrame:(CGRect)a4;
+ (id)layoutGeometryFittingLayoutGeometry:(id)a3 inFrame:(CGRect)a4 scale:(double)a5;
- (THInteractiveCanvasController)interactiveCanvasController;
- (THPageLayout)pageLayout;
- (THSectionLayout)sectionLayout;
- (double)contentsScale;
- (unint64_t)pageIndex;
@end

@implementation TSDLayout

- (unint64_t)pageIndex
{
  id v2 = [(TSDLayout *)self parent];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0xFFFFFFFFLL;
  }

  return (unint64_t)[v2 pageIndex];
}

- (THPageLayout)pageLayout
{
  objc_opt_class();
  [(TSDLayout *)self parent];
  v3 = (void *)TSUDynamicCast();

  return (THPageLayout *)[v3 pageLayout];
}

- (THSectionLayout)sectionLayout
{
  objc_opt_class();
  [(TSDLayout *)self parent];
  v3 = (void *)TSUDynamicCast();

  return (THSectionLayout *)[v3 sectionLayout];
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  id v2 = [[self layoutController] canvas];
  if (![v2 isCanvasInteractive]) {
    return 0;
  }
  objc_opt_class();
  [v2 canvasController];

  return (THInteractiveCanvasController *)TSUDynamicCast();
}

+ (id)layoutGeometryFittingLayoutGeometry:(id)a3 inFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  memset(&v27, 0, sizeof(v27));
  if (a3) {
    [a3 transform];
  }
  [a3 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = THScaleNeededToFitSizeInSize(v12, v14, width, height);
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeTranslation(&t2, -v9 - v13 * 0.5, -v11 - v15 * 0.5);
  CGAffineTransform t1 = v27;
  CGAffineTransformConcat(&v26, &t1, &t2);
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&v23, v16, v16);
  CGAffineTransform v22 = v26;
  CGAffineTransformConcat(&t1, &v22, &v23);
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v21, x + width * 0.5, y + height * 0.5);
  CGAffineTransform v20 = t1;
  CGAffineTransformConcat(&v22, &v20, &v21);
  id v17 = objc_alloc((Class)TSDLayoutGeometry);
  [a3 size];
  CGAffineTransform v20 = v22;
  return [v17 initWithSize:&v20];
}

+ (id)layoutGeometryFittingLayoutGeometry:(id)a3 inFrame:(CGRect)a4 scale:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  memset(&v24, 0, sizeof(v24));
  if (a3) {
    [a3 transform];
  }
  [a3 frame];
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&t2, -v11 - v12 * 0.5, -v13 - v14 * 0.5);
  CGAffineTransform t1 = v24;
  CGAffineTransformConcat(&v23, &t1, &t2);
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&v20, a5, a5);
  CGAffineTransform v19 = v23;
  CGAffineTransformConcat(&t1, &v19, &v20);
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v18, x + width * 0.5, y + height * 0.5);
  CGAffineTransform v17 = t1;
  CGAffineTransformConcat(&v19, &v17, &v18);
  id v15 = objc_alloc((Class)TSDLayoutGeometry);
  [a3 size];
  CGAffineTransform v17 = v19;
  return [v15 initWithSize:&v17];
}

- (double)contentsScale
{
  id v2 = [[self layoutController] canvas];

  [v2 contentsScale];
  return result;
}

@end