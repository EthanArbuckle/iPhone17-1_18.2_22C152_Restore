@interface CarFloatingControlsButtonView
- (BOOL)is3DButtonEnabled;
- (BOOL)isTrackingButtonEnabled;
- (CarFloatingControlsButtonView)initWithFrame:(CGRect)a3;
- (CarFloatingControlsButtonViewDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (void)_pressed3DButton:(id)a3;
- (void)_rebuild;
- (void)set3DButtonState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEnable3DButton:(BOOL)a3;
- (void)setEnableTrackingButton:(BOOL)a3;
- (void)setTrackingController:(id)a3;
@end

@implementation CarFloatingControlsButtonView

- (CarFloatingControlsButtonView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CarFloatingControlsButtonView;
  v3 = -[CarMultiButtonView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[CarUserTrackingButton buttonWithUserTrackingView:0];
    userTrackingButton = v3->_userTrackingButton;
    v3->_userTrackingButton = (CarUserTrackingButton *)v4;

    v6 = -[Car3DButton initWithFrame:]([Car3DButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    mode3DButton = v3->_mode3DButton;
    v3->_mode3DButton = v6;

    [(Car3DButton *)v3->_mode3DButton addTarget:v3 action:"_pressed3DButton:" forControlEvents:64];
    [(CarFloatingControlsButtonView *)v3 setAccessibilityIdentifier:@"CarFloatingControlsButtonView"];
    v11[0] = v3->_userTrackingButton;
    v11[1] = v3->_mode3DButton;
    v8 = +[NSArray arrayWithObjects:v11 count:2];
    [(CarMultiButtonView *)v3 setButtons:v8];
  }
  return v3;
}

- (void)setTrackingController:(id)a3
{
}

- (void)_pressed3DButton:(id)a3
{
  uint64_t v4 = [(CarFloatingControlsButtonView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CarFloatingControlsButtonView *)self delegate];
    [v6 mode3DButtonPressed];
  }
}

- (void)setEnableTrackingButton:(BOOL)a3
{
  if (self->_enableTrackingButton != a3)
  {
    self->_enableTrackingButton = a3;
    [(CarFloatingControlsButtonView *)self _rebuild];
  }
}

- (void)setEnable3DButton:(BOOL)a3
{
  if (self->_enable3DButton != a3)
  {
    self->_enable3DButton = a3;
    [(CarFloatingControlsButtonView *)self _rebuild];
  }
}

- (void)set3DButtonState:(unint64_t)a3
{
}

- (void)_rebuild
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([(CarFloatingControlsButtonView *)self isTrackingButtonEnabled]) {
    [v4 addObject:self->_userTrackingButton];
  }
  if ([(CarFloatingControlsButtonView *)self is3DButtonEnabled]) {
    [v4 addObject:self->_mode3DButton];
  }
  id v3 = [v4 copy];
  [(CarMultiButtonView *)self setButtons:v3];
}

- (NSArray)focusOrderSubItems
{
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CarMultiButtonView *)self buttons];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 canBecomeFocused]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (CarFloatingControlsButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarFloatingControlsButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isTrackingButtonEnabled
{
  return self->_enableTrackingButton;
}

- (BOOL)is3DButtonEnabled
{
  return self->_enable3DButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mode3DButton, 0);

  objc_storeStrong((id *)&self->_userTrackingButton, 0);
}

@end