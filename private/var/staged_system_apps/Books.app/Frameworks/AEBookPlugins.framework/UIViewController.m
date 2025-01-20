@interface UIViewController
+ (Class)be_PDFPageViewControllerClass;
+ (void)be_enablePDFPageViewControllerHacks;
- (BOOL)be_useOverrideAutoScale;
- (PDFView)be_pdfView;
- (double)be_autoScaleFactor;
- (double)be_overrideAutoScale;
- (void)setBe_overrideAutoScale:(double)a3;
- (void)setBe_useOverrideAutoScale:(BOOL)a3;
@end

@implementation UIViewController

- (double)be_autoScaleFactor
{
  v3 = [(UIViewController *)self be_pdfView];
  if ([(UIViewController *)self be_useOverrideAutoScale]
    || objc_msgSend(v3, "be_useOverrideAutoScale"))
  {
    [(UIViewController *)self be_overrideAutoScale];
    double v5 = v4;
    [v3 be_overrideAutoScale];
    if (v5 < v6) {
      double v5 = v6;
    }
  }
  else
  {
    [(UIViewController *)self be_autoScaleFactor];
    double v5 = v7;
  }

  return v5;
}

- (void)setBe_overrideAutoScale:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:a3];
  objc_setAssociatedObject(self, "be_overrideAutoScale", v4, (char *)&dword_0 + 1);
}

- (double)be_overrideAutoScale
{
  v2 = objc_getAssociatedObject(self, "be_overrideAutoScale");
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setBe_useOverrideAutoScale:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, "be_useOverrideAutoScale", v4, (char *)&dword_0 + 1);
}

- (BOOL)be_useOverrideAutoScale
{
  v2 = objc_getAssociatedObject(self, "be_useOverrideAutoScale");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (PDFView)be_pdfView
{
  +[UIViewController be_PDFPageViewControllerClass];
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    unsigned __int8 v3 = [(UIViewController *)self valueForKeyPath:@"_private.pdfView"];
    id v4 = BUDynamicCast();
  }
  else
  {
    id v4 = 0;
  }

  return (PDFView *)v4;
}

+ (void)be_enablePDFPageViewControllerHacks
{
  if (qword_22B7E8 != -1) {
    dispatch_once(&qword_22B7E8, &stru_1DE0D8);
  }
}

+ (Class)be_PDFPageViewControllerClass
{
  if (qword_22B7F8 != -1) {
    dispatch_once(&qword_22B7F8, &stru_1DE0F8);
  }
  v2 = (void *)qword_22B7F0;

  return (Class)v2;
}

@end