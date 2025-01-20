@interface THSectionLayout
- (BOOL)shouldFilterTextSource:(id)a3;
- (BOOL)useApplicationFontScaleForTextSource:(id)a3;
- (CGPoint)capturedInfoPositionForAttachment;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (unint64_t)fontSizeForTextSource:(id)a3;
- (void)dealloc;
- (void)setGeometry:(id)a3;
@end

@implementation THSectionLayout

- (void)dealloc
{
  [(THSectionLayout *)self setChildren:+[NSArray array]];
  v3.receiver = self;
  v3.super_class = (Class)THSectionLayout;
  [(THSectionLayout *)&v3 dealloc];
}

- (void)setGeometry:(id)a3
{
  if (objc_msgSend(-[THSectionLayout info](self, "info"), "anchorAtOrigin"))
  {
    id v5 = [a3 mutableCopy];
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9[1] = v6;
    v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v5 setTransform:v9];
    v8.receiver = self;
    v8.super_class = (Class)THSectionLayout;
    [(THSectionLayout *)&v8 setGeometry:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)THSectionLayout;
    [(THSectionLayout *)&v7 setGeometry:a3];
  }
}

- (id)computeLayoutGeometry
{
  objc_msgSend(objc_msgSend(-[THSectionLayout info](self, "info"), "pageController"), "i_rectForSectionLayout");
  double x = v3;
  double y = v5;
  double v8 = v7;
  double v10 = v9;
  if (objc_msgSend(-[THSectionLayout info](self, "info"), "anchorAtOrigin"))
  {
    double y = CGPointZero.y;
    double x = CGPointZero.x;
  }
  id v11 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:x, y, v8, v10];

  return v11;
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)dependentLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)THSectionLayout;
  id v3 = [[-[THSectionLayout parent](&v6, "parent")] children];
  v4 = (char *)[v3 indexOfObject:self] + 1;
  if (v4 >= [v3 count]) {
    return 0;
  }
  else {
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", [v3 objectAtIndex:v4]);
  }
}

- (BOOL)shouldFilterTextSource:(id)a3
{
  return 1;
}

- (BOOL)useApplicationFontScaleForTextSource:(id)a3
{
  return 1;
}

- (unint64_t)fontSizeForTextSource:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[THSectionLayout info](self, "info", a3), "pageController"), "presentationType");

  return (unint64_t)[v3 fontSize];
}

@end