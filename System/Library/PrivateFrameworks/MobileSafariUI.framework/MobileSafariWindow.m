@interface MobileSafariWindow
- (MobileSafariWindow)initWithWindowScene:(id)a3;
- (MobileSafariWindowDelegate)safariWindowDelegate;
- (void)_didCompleteSystemSnapshot;
- (void)_willBeginSystemSnapshot;
- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4;
- (void)sendEvent:(id)a3;
- (void)setSafariWindowDelegate:(id)a3;
@end

@implementation MobileSafariWindow

- (void)setSafariWindowDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safariWindowDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_safariWindowDelegate, obj);
    self->_safariWindowDelegateRespondsToStatusBarChangedFromHeightToHeight = objc_opt_respondsToSelector() & 1;
    self->_safariWindowDelegateRespondsToDidEndAllTouchesAtPoint = objc_opt_respondsToSelector() & 1;
  }
}

- (MobileSafariWindow)initWithWindowScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MobileSafariWindow;
  v3 = [(MobileSafariWindow *)&v7 initWithWindowScene:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__willBeginSystemSnapshot name:*MEMORY[0x1E4FB32A0] object:0];
    [v4 addObserver:v3 selector:sel__didCompleteSystemSnapshot name:*MEMORY[0x1E4FB3298] object:0];
    v5 = v3;
  }
  return v3;
}

- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MobileSafariWindow;
  -[MobileSafariWindow handleStatusBarChangeFromHeight:toHeight:](&v8, sel_handleStatusBarChangeFromHeight_toHeight_);
  if (self->_safariWindowDelegateRespondsToStatusBarChangedFromHeightToHeight)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_safariWindowDelegate);
    [WeakRetained safariWindow:self statusBarChangedFromHeight:a3 toHeight:a4];
  }
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MobileSafariWindow;
  [(MobileSafariWindow *)&v9 sendEvent:v4];
  if (self->_safariWindowDelegateRespondsToDidEndAllTouchesAtPoint && ![v4 type])
  {
    v5 = [v4 allTouches];
    v6 = [v5 anyObject];

    id WeakRetained = [v4 allTouches];
    if ([WeakRetained count] == 1)
    {
      uint64_t v8 = [v6 phase];

      if (v8 != 3)
      {
LABEL_7:

        goto LABEL_8;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_safariWindowDelegate);
      [v6 locationInView:self];
      objc_msgSend(WeakRetained, "safariWindow:didEndAllTouchesAtPoint:", self);
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_willBeginSystemSnapshot
{
  self->_shouldBecomeKeyWindowAfterSnapshot = [(MobileSafariWindow *)self isKeyWindow];
}

- (void)_didCompleteSystemSnapshot
{
  if (self->_shouldBecomeKeyWindowAfterSnapshot) {
    [(MobileSafariWindow *)self makeKeyWindow];
  }
}

- (MobileSafariWindowDelegate)safariWindowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safariWindowDelegate);
  return (MobileSafariWindowDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end