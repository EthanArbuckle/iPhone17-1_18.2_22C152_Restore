@interface CarAlertButtonViewController
- (CGSize)preferredContentSize;
- (CarAlertButtonViewController)initWithTitle:(id)a3 image:(id)a4;
- (id)completionHandler;
- (void)_dismissAlertController;
- (void)_handleTouch:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setCompletionHandler:(id)a3;
@end

@implementation CarAlertButtonViewController

- (CarAlertButtonViewController)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CarAlertButtonViewController;
  v8 = [(CarAlertButtonViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [[CarAlertButtonView alloc] initWithTitle:v6 image:v7];
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
  id v4 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTouch:"];
  [v4 setAllowedPressTypes:&off_1013AE400];
  [(CarAlertButtonView *)self->_contentView addGestureRecognizer:v4];
  id v3 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleTouch:"];
  [v3 setAllowedTouchTypes:&off_1013AE418];
  [v3 setMinimumPressDuration:0.0];
  [v3 setCancelsTouchesInView:0];
  [(CarAlertButtonView *)self->_contentView addGestureRecognizer:v3];
  [(CarAlertButtonViewController *)self setView:self->_contentView];
}

- (void)_handleTouch:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(CarAlertButtonViewController *)self _dismissAlertController];
  }
}

- (void)_dismissAlertController
{
  [(CarAlertButtonView *)self->_contentView setHighlighted:0];

  [(CarAlertButtonViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  [(CarAlertButtonViewController *)self completionHandler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A3332C;
  v8[3] = &unk_1012E6EA8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)CarAlertButtonViewController;
  id v6 = v9;
  [(CarAlertButtonViewController *)&v7 dismissViewControllerAnimated:v4 completion:v8];
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