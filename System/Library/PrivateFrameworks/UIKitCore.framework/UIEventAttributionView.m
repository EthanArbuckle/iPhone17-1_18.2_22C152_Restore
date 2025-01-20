@interface UIEventAttributionView
+ (BKSHIDEventAuthenticationMessage)lastEventMessage;
+ (void)_attemptAuthenticationWithEvent:(uint64_t)a1;
+ (void)setLastEventMessage:(id)a3;
- (UIEventAttributionView)initWithCoder:(id)a3;
- (UIEventAttributionView)initWithFrame:(CGRect)a3;
- (void)_commonInit;
- (void)_updateLayerContents;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)setHidden:(BOOL)a3;
@end

@implementation UIEventAttributionView

+ (void)_attemptAuthenticationWithEvent:(uint64_t)a1
{
  id v6 = a2;
  v2 = self;
  v3 = v6;
  if (__slotContent)
  {
    v4 = [v6 _authenticationMessage];
    v5 = v4;
    if (v4 && [v4 context] == 1589136771) {
      [v2 setLastEventMessage:v5];
    }

    v3 = v6;
  }
}

- (UIEventAttributionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIEventAttributionView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UIEventAttributionView *)v3 _commonInit];
  }
  return v4;
}

- (UIEventAttributionView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIEventAttributionView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(UIEventAttributionView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(UIView *)self setUserInteractionEnabled:0];
  [(UIEventAttributionView *)self _updateLayerContents];
}

- (void)_updateLayerContents
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__UIEventAttributionView__updateLayerContents__block_invoke;
  v2[3] = &unk_1E52DC308;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__UIEventAttributionView__updateLayerContents__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (_slotContent_onceToken != -1) {
      dispatch_once(&_slotContent_onceToken, &__block_literal_global_419);
    }
    v2 = [(id)__slotContent image];
    id v3 = [v4 layer];
    [v3 setContents:v2];

    id WeakRetained = v4;
  }
}

- (void)setHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIEventAttributionView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (!a3) {
    [(UIEventAttributionView *)self _updateLayerContents];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIEventAttributionView;
  [(UIView *)&v3 didMoveToWindow];
  [(UIEventAttributionView *)self _updateLayerContents];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)UIEventAttributionView;
  [(UIView *)&v3 didMoveToSuperview];
  [(UIEventAttributionView *)self _updateLayerContents];
}

+ (BKSHIDEventAuthenticationMessage)lastEventMessage
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__154;
  v10 = __Block_byref_object_dispose__154;
  id v11 = 0;
  v2 = _eventMessageQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__UIEventAttributionView_lastEventMessage__block_invoke;
  block[3] = &unk_1E52D9900;
  block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKSHIDEventAuthenticationMessage *)v3;
}

void __42__UIEventAttributionView_lastEventMessage__block_invoke(uint64_t a1)
{
}

+ (void)setLastEventMessage:(id)a3
{
  id v3 = a3;
  id v4 = _eventMessageQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__UIEventAttributionView_setLastEventMessage___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

void __46__UIEventAttributionView_setLastEventMessage___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) copy];
  v2 = (void *)__eventMessageQueue_lastEventAttributionAuthenticationMessage;
  __eventMessageQueue_lastEventAttributionAuthenticationMessage = v1;
}

@end