@interface SBSearchScrollView
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (SBSearchScrollViewDelegate)searchDelegate;
- (void)setSearchDelegate:(id)a3;
@end

@implementation SBSearchScrollView

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (+[SBIconView isIconTapGestureRecognizer:v8])
  {
    BOOL v9 = 1;
  }
  else if (objc_msgSend((id)+[SBSearchScrollView superclass](SBSearchScrollView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSearchScrollView;
    BOOL v9 = [(SBSearchScrollView *)&v11 gestureRecognizer:v7 shouldRequireFailureOfGestureRecognizer:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  v4 = objc_msgSend(a4, "view", a3);
  NSClassFromString(&cfstr_Ncnotification.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSearchScrollView *)self panGestureRecognizer];

  if (v5 != v4
    || ([v4 translationInView:self], v7 >= 0.0)
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate),
        int v9 = [WeakRetained searchScrollViewShouldRecognize:self],
        WeakRetained,
        v9))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSearchScrollView;
    BOOL v6 = [(SBSearchScrollView *)&v11 gestureRecognizerShouldBegin:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (SBSearchScrollViewDelegate)searchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
  return (SBSearchScrollViewDelegate *)WeakRetained;
}

- (void)setSearchDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end