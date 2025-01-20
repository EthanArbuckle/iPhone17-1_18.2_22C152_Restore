@interface TPSPageControl
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (TPSPageControl)init;
- (TPSPageControlHudDelegate)hudDelegate;
- (void)handleLongPressForAccessibilityHUDView:(id)a3;
- (void)setHudDelegate:(id)a3;
@end

@implementation TPSPageControl

- (TPSPageControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSPageControl;
  v2 = [(TPSPageControl *)&v5 init];
  if (v2
    && +[TPSDefaultsManager showPagingLabelOnLongPress])
  {
    id v3 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v2 action:"handleLongPressForAccessibilityHUDView:"];
    [v3 setDelegate:v2];
    [(TPSPageControl *)v2 addGestureRecognizer:v3];
  }
  return v2;
}

- (void)handleLongPressForAccessibilityHUDView:(id)a3
{
  v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != (char *)1) {
      return;
    }
    if ([(TPSPageControl *)self currentPage] == (id)0x7FFFFFFFFFFFFFFFLL
      || (uint64_t)[(TPSPageControl *)self numberOfPages] < 1)
    {
      id v6 = 0;
      objc_super v5 = 0;
    }
    else
    {
      objc_super v5 = (char *)[(TPSPageControl *)self currentPage] + 1;
      id v6 = [(TPSPageControl *)self numberOfPages];
    }
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"TIP_NUMBER_X_OF_Y" value:&stru_1000B98B0 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v5, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    v9 = [(TPSPageControl *)self hudDelegate];
    [v9 pageControlLongPressedForHUD:self withText:v10];
  }
  else
  {
    id v10 = [(TPSPageControl *)self hudDelegate];
    [v10 pageControlCancelLongPressedForHUD:self];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (TPSPageControlHudDelegate)hudDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hudDelegate);

  return (TPSPageControlHudDelegate *)WeakRetained;
}

- (void)setHudDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end