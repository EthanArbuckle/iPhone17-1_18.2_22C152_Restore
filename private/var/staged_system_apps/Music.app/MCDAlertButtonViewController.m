@interface MCDAlertButtonViewController
- (CGSize)preferredContentSize;
- (MCDAlertButtonView)contentView;
- (MCDAlertButtonViewController)initWithTitle:(id)a3 image:(id)a4;
- (id)completionHandler;
- (void)_dismissAlertController;
- (void)_handleTouch:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setCompletionHandler:(id)a3;
- (void)setContentView:(id)a3;
@end

@implementation MCDAlertButtonViewController

- (MCDAlertButtonViewController)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCDAlertButtonViewController;
  v8 = [(MCDAlertButtonViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [[MCDAlertButtonView alloc] initWithTitle:v6 image:v7];
    contentView = v8->_contentView;
    v8->_contentView = v9;
  }
  return v8;
}

- (CGSize)preferredContentSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTouch:"];
  [v3 setAllowedPressTypes:&off_101027658];
  v4 = [(MCDAlertButtonViewController *)self contentView];
  [v4 addGestureRecognizer:v3];

  id v5 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleTouch:"];
  [v5 setAllowedTouchTypes:&off_101027670];
  [v5 setMinimumPressDuration:0.0];
  [v5 setCancelsTouchesInView:0];
  id v6 = [(MCDAlertButtonViewController *)self contentView];
  [v6 addGestureRecognizer:v5];

  objc_initWeak(&location, self);
  id v7 = [(MCDAlertButtonViewController *)self contentView];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1000B3B54;
  objc_super v12 = &unk_100FC4180;
  objc_copyWeak(&v13, &location);
  [v7 setAccessibilityActivateBlock:&v9];

  v8 = [(MCDAlertButtonViewController *)self contentView];
  [(MCDAlertButtonViewController *)self setView:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_handleTouch:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(MCDAlertButtonViewController *)self _dismissAlertController];
  }
}

- (void)_dismissAlertController
{
  [(MCDAlertButtonView *)self->_contentView setHighlighted:0];

  [(MCDAlertButtonViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  [(MCDAlertButtonViewController *)self completionHandler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B3CE8;
  v8[3] = &unk_100FC41A8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)MCDAlertButtonViewController;
  id v6 = v9;
  [(MCDAlertButtonViewController *)&v7 dismissViewControllerAnimated:v4 completion:v8];
}

- (MCDAlertButtonView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end