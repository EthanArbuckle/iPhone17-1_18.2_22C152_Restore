@interface ScrollViewDelegateForwarder
- (BOOL)respondsToSelector:(SEL)a3;
- (UIScrollViewDelegate)originalDelegate;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)setOriginalDelegate:(id)a3;
@end

@implementation ScrollViewDelegateForwarder

- (void)setOriginalDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_originalDelegate, obj);
    self->_respondsTo_scrollViewDidEndScrollingAnimation = objc_opt_respondsToSelector() & 1;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if ("scrollViewDidEndScrollingAnimation:" == a3) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ScrollViewDelegateForwarder;
    BOOL v6 = [(ScrollViewDelegateForwarder *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);

  return WeakRetained;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v6 = a3;
  if (self->_respondsTo_scrollViewDidEndScrollingAnimation)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);
    [WeakRetained scrollViewDidEndScrollingAnimation:v6];
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"ScrollingFinishedNotification" object:v6];
}

- (UIScrollViewDelegate)originalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);

  return (UIScrollViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end