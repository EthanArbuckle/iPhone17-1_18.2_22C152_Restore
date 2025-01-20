@interface PDFView
+ (void)be_enableAutoscaleHacks;
- (BOOL)be_useOverrideAutoScale;
- (double)be_autoScaleFactor;
- (double)be_overrideAutoScale;
- (id)be_associatedPageViewController;
- (void)setBe_overrideAutoScale:(double)a3;
- (void)setBe_useOverrideAutoScale:(BOOL)a3;
@end

@implementation PDFView

+ (void)be_enableAutoscaleHacks
{
  if (qword_22B800[0] != -1) {
    dispatch_once(qword_22B800, &stru_1DE118);
  }
}

- (double)be_autoScaleFactor
{
  if ([(PDFView *)self be_useOverrideAutoScale])
  {
    [(PDFView *)self be_overrideAutoScale];
  }
  else
  {
    [(PDFView *)self be_autoScaleFactor];
  }
  return result;
}

- (void)setBe_overrideAutoScale:(double)a3
{
  id v7 = [(PDFView *)self be_associatedPageViewController];
  [v7 be_pdfView];
  v5 = (PDFView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self) {
    [v7 setBe_overrideAutoScale:a3];
  }
  v6 = +[NSNumber numberWithDouble:a3];
  objc_setAssociatedObject(self, "be_overrideAutoScale", v6, (char *)&dword_0 + 1);
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
  BOOL v3 = a3;
  id v7 = [(PDFView *)self be_associatedPageViewController];
  [v7 be_pdfView];
  v5 = (PDFView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self) {
    [v7 setBe_useOverrideAutoScale:v3];
  }
  v6 = +[NSNumber numberWithBool:v3];
  objc_setAssociatedObject(self, "be_useOverrideAutoScale", v6, (char *)&dword_0 + 1);
}

- (BOOL)be_useOverrideAutoScale
{
  v2 = objc_getAssociatedObject(self, "be_useOverrideAutoScale");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)be_associatedPageViewController
{
  v2 = [(PDFView *)self valueForKeyPath:@"_private.documentViewController"];
  objc_opt_class();
  unsigned __int8 v3 = BUDynamicCast();
  double v4 = [v3 viewControllers];
  v5 = [v4 firstObject];

  return v5;
}

@end