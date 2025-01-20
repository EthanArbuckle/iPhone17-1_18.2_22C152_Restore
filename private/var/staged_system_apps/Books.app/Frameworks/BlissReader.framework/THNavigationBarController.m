@interface THNavigationBarController
- (BCNavigationBar)navigationBar;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSTimer)autohideTimer;
- (THNavigationBarController)init;
- (THNavigationBarControllerDelegate)delegate;
- (UIColor)backgroundColor;
- (UIColor)centerItemTextColor;
- (double)autohideTimeout;
- (double)showHideDuration;
- (id)view;
- (int64_t)positionForBar:(id)a3;
- (void)buildConstraintsFromParent:(id)a3 layoutGuide:(id)a4;
- (void)clearAutohideTimer;
- (void)completeNavigationBarFade;
- (void)dealloc;
- (void)p_autohideTimerAction;
- (void)p_hideNavigationBar;
- (void)p_showNavigationBar;
- (void)resetAutohideTimer;
- (void)setAutohideTimeout:(double)a3;
- (void)setAutohideTimer:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setCenterItemTextColor:(id)a3;
- (void)setCenterTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftItems:(id)a3 rightItems:(id)a4;
- (void)setNavigationBar:(id)a3;
- (void)setNavigationBarHidden:(BOOL)a3;
- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6;
- (void)setShowHideDuration:(double)a3;
- (void)setTopConstraint:(id)a3;
- (void)startNavigationBarFade;
- (void)updateViewStateWithThemeDelegate:(id)a3;
@end

@implementation THNavigationBarController

- (THNavigationBarController)init
{
  v3.receiver = self;
  v3.super_class = (Class)THNavigationBarController;
  result = [(THNavigationBarController *)&v3 init];
  if (result) {
    result->_showHideDuration = 0.2;
  }
  return result;
}

- (void)dealloc
{
  [(THNavigationBarController *)self setBottomConstraint:0];
  [(THNavigationBarController *)self setTopConstraint:0];
  [(THNavigationBarController *)self setNavigationBar:0];

  [(THNavigationBarController *)self clearAutohideTimer];
  v3.receiver = self;
  v3.super_class = (Class)THNavigationBarController;
  [(THNavigationBarController *)&v3 dealloc];
}

- (id)view
{
  return self->mNavigationBar;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THNavigationBarControllerDelegate *)a3;
}

- (void)buildConstraintsFromParent:(id)a3 layoutGuide:(id)a4
{
  if (!self->mBottomConstraint && !self->mTopConstraint)
  {
    objc_msgSend(objc_msgSend(-[BCNavigationBar leftAnchor](self->mNavigationBar, "leftAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "leftAnchor")), "setActive:", 1);
    objc_msgSend(objc_msgSend(-[BCNavigationBar rightAnchor](self->mNavigationBar, "rightAnchor"), "constraintEqualToAnchor:", objc_msgSend(a3, "rightAnchor")), "setActive:", 1);
    -[self setTopConstraint:[BCNavigationBar topAnchor].constraintEqualToAnchor:[a4 topAnchor] constant:0.0];
    [(NSLayoutConstraint *)[(THNavigationBarController *)self topConstraint] setActive:1];
    -[self setBottomConstraint:[BCNavigationBar bottomAnchor].constraintEqualToAnchor:[a3 topAnchor]];
    v7 = [(THNavigationBarController *)self bottomConstraint];
    [(NSLayoutConstraint *)v7 setActive:0];
  }
}

- (void)p_showNavigationBar
{
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setAlpha:1.0];

  [(THNavigationBarController *)self resetAutohideTimer];
}

- (void)p_hideNavigationBar
{
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setAlpha:0.0];

  [(THNavigationBarController *)self clearAutohideTimer];
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  if ([(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] isHidden] != a3)
  {
    [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setHidden:0];
    [(THNavigationBarControllerDelegate *)[(THNavigationBarController *)self delegate] willSetNavigationBarHidden:v9 animated:v8];
    if (v8)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_6CF00;
      v15[3] = &unk_457FF0;
      v15[4] = self;
      BOOL v16 = v9;
      BOOL v17 = v8;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_6CF6C;
      v12[3] = &unk_458018;
      BOOL v13 = v9;
      v12[4] = self;
      v12[5] = a6;
      BOOL v14 = v8;
      +[UIView animateWithDuration:v15 animations:v12 completion:a5];
    }
    else
    {
      [(THNavigationBarControllerDelegate *)[(THNavigationBarController *)self delegate] settingNavigationBarHidden:v9 animated:0];
      if (v9) {
        [(THNavigationBarController *)self p_hideNavigationBar];
      }
      else {
        [(THNavigationBarController *)self p_showNavigationBar];
      }
      [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setHidden:v9];
      if (a6) {
        (*((void (**)(id))a6 + 2))(a6);
      }
      v11 = [(THNavigationBarController *)self delegate];
      [(THNavigationBarControllerDelegate *)v11 didSetNavigationBarHidden:v9 animated:0];
    }
  }
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  [(THNavigationBarController *)self showHideDuration];

  -[THNavigationBarController setNavigationBarHidden:animated:duration:completion:](self, "setNavigationBarHidden:animated:duration:completion:", v7, v6, a5);
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(THNavigationBarController *)self showHideDuration];

  -[THNavigationBarController setNavigationBarHidden:animated:duration:](self, "setNavigationBarHidden:animated:duration:", v5, v4);
}

- (void)setNavigationBarHidden:(BOOL)a3
{
}

- (void)startNavigationBarFade
{
  v2 = [(THNavigationBarController *)self navigationBar];

  [(BCNavigationBar *)v2 setAlpha:0.0];
}

- (void)completeNavigationBarFade
{
  [(THNavigationBarController *)self p_hideNavigationBar];
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setAlpha:1.0];
  objc_super v3 = [(THNavigationBarController *)self navigationBar];

  [(BCNavigationBar *)v3 setHidden:1];
}

- (void)p_autohideTimerAction
{
  if ([(THNavigationBarController *)self delegate]
    && [(THNavigationBarControllerDelegate *)[(THNavigationBarController *)self delegate] shouldAutohideNavigationBar])
  {
    [(THNavigationBarController *)self setNavigationBarHidden:1 animated:1];
  }
  else
  {
    [(THNavigationBarController *)self resetAutohideTimer];
  }
}

- (void)clearAutohideTimer
{
  if ([(THNavigationBarController *)self autohideTimer])
  {
    [(NSTimer *)[(THNavigationBarController *)self autohideTimer] invalidate];
    [(THNavigationBarController *)self setAutohideTimer:0];
  }
}

- (void)resetAutohideTimer
{
  [(THNavigationBarController *)self clearAutohideTimer];
  [(THNavigationBarController *)self autohideTimeout];
  if (v3 > 0.0)
  {
    [(THNavigationBarController *)self autohideTimeout];
    BOOL v4 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_autohideTimerAction", 0, 0);
    [(THNavigationBarController *)self setAutohideTimer:v4];
  }
}

- (double)autohideTimeout
{
  return self->mAutohideTimeout;
}

- (void)setAutohideTimeout:(double)a3
{
  self->mAutohideTimeout = a3;
  [(THNavigationBarController *)self resetAutohideTimer];
}

- (void)setCenterTitle:(id)a3
{
  unsigned int v5 = [(THNavigationBarControllerDelegate *)[(THNavigationBarController *)self delegate] shouldShowChapterTitle];
  BOOL v6 = [(THNavigationBarController *)self navigationBar];
  if (v5) {
    id v7 = a3;
  }
  else {
    id v7 = 0;
  }

  [(BCNavigationBar *)v6 setTitle:v7];
}

- (void)setLeftItems:(id)a3 rightItems:(id)a4
{
  id v7 = [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] isHidden];
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setHidden:0];
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setLeftItems:a3];
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setRightItems:a4];
  BOOL v8 = [(THNavigationBarController *)self navigationBar];

  [(BCNavigationBar *)v8 setHidden:v7];
}

- (void)updateViewStateWithThemeDelegate:(id)a3
{
  unsigned int v5 = (UIColor *)[a3 titleColorForNavigationBar:[self navigationBar]];
  id v6 = [a3 foregroundTintColorForNavigationBar:[self navigationBar]];
  id v7 = [a3 backgroundColorForNavigationBar:[self navigationBar]];
  id v8 = [a3 navigationBarIsTranslucent:[self navigationBar]];
  id v9 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v9 setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
  [v9 setLineBreakMode:5];
  [v9 setAlignment:1];
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setTranslucent:v8];
  v10 = v5;
  if (!v5) {
    v10 = +[UIColor blackColor];
  }
  [(THNavigationBarController *)self setCenterItemTextColor:v10];
  v11[0] = NSFontAttributeName;
  v12[0] = +[UIFont boldSystemFontOfSize:17.0];
  v11[1] = NSForegroundColorAttributeName;
  v11[2] = NSParagraphStyleAttributeName;
  v12[1] = [(THNavigationBarController *)self centerItemTextColor];
  v12[2] = v9;
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setTitleTextAttributes:+[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3]];

  [(THNavigationBarController *)self setCenterItemTextColor:v5];
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setTintColor:v6];
  [(BCNavigationBar *)[(THNavigationBarController *)self navigationBar] setBarTintColor:v7];
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (BCNavigationBar)navigationBar
{
  return self->mNavigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (NSTimer)autohideTimer
{
  return self->mAutohideTimer;
}

- (void)setAutohideTimer:(id)a3
{
}

- (THNavigationBarControllerDelegate)delegate
{
  return self->mDelegate;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->mBottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->mTopConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)centerItemTextColor
{
  return self->_centerItemTextColor;
}

- (void)setCenterItemTextColor:(id)a3
{
}

- (double)showHideDuration
{
  return self->_showHideDuration;
}

- (void)setShowHideDuration:(double)a3
{
  self->_showHideDuration = a3;
}

@end