@interface COSPasscodeChangeComplexViewController
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)isComplex;
- (BOOL)isViewVisible;
- (COSPasscodeChangeComplexViewControllerDelegate)passcodeChangeDelegate;
- (id)detailText;
- (id)titleText;
- (void)setIsViewVisible:(BOOL)a3;
- (void)setPasscodeChangeDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSPasscodeChangeComplexViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSPasscodeChangeComplexViewController;
  [(COSPasscodeChangeComplexViewController *)&v4 viewWillAppear:a3];
  if (![(COSPasscodeChangeComplexViewController *)self isViewVisible]) {
    [(COSPasscodeChangeComplexViewController *)self setIsViewVisible:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSPasscodeChangeComplexViewController;
  [(COSPasscodeChangeComplexViewController *)&v4 viewDidDisappear:a3];
  if ([(COSPasscodeChangeComplexViewController *)self isViewVisible]) {
    [(COSPasscodeChangeComplexViewController *)self setIsViewVisible:0];
  }
}

- (void)setIsViewVisible:(BOOL)a3
{
  if (self->_isViewVisible != a3)
  {
    BOOL v3 = a3;
    self->_isViewVisible = a3;
    id v5 = [(COSPasscodeChangeComplexViewController *)self passcodeChangeDelegate];
    [v5 passcodeChangeComplexViewController:self didChangeVisibilityWithIsVisible:v3];
  }
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (id)titleText
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"PASSCODE_CHANGING_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailText
{
  v2 = +[MCProfileConnection sharedConnection];
  uint64_t v3 = [v2 valueRestrictionForFeature:MCFeatureMinimumPasscodeLength];

  if (v3) {
    objc_super v4 = (_UNKNOWN **)v3;
  }
  else {
    objc_super v4 = &off_10025C340;
  }
  id v5 = +[NSNumberFormatter localizedStringFromNumber:v4 numberStyle:5];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"PASSCODE_CHANGING_TEXT_COMPLEX_%@" value:&stru_100249230 table:@"Localizable"];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5);

  return v8;
}

- (BOOL)isComplex
{
  return 1;
}

- (COSPasscodeChangeComplexViewControllerDelegate)passcodeChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeChangeDelegate);

  return (COSPasscodeChangeComplexViewControllerDelegate *)WeakRetained;
}

- (void)setPasscodeChangeDelegate:(id)a3
{
}

- (BOOL)isViewVisible
{
  return self->_isViewVisible;
}

- (void).cxx_destruct
{
}

@end