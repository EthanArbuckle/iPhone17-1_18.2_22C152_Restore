@interface ConversationSearchOverlayView
- (ConversationSearchOverlayView)initWithFrame:(CGRect)a3;
- (void)hide;
- (void)show;
@end

@implementation ConversationSearchOverlayView

- (ConversationSearchOverlayView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ConversationSearchOverlayView;
  v3 = -[ConversationSearchOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(ConversationSearchOverlayView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)show
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  objc_super v6 = __37__ConversationSearchOverlayView_show__block_invoke;
  v7 = &unk_1E6D1A8F8;
  objc_copyWeak(&v8, &location);
  v3 = objc_msgSend(v2, "initWithDuration:controlPoint1:controlPoint2:animations:", &v4, 0.2, 0.445, 0.05, 0.55, 0.95);
  objc_msgSend(v3, "startAnimation", v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __37__ConversationSearchOverlayView_show__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4FB1618] mailConversationViewFindOverlayColor];
  [WeakRetained setBackgroundColor:v1];
}

- (void)hide
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  objc_super v6 = __37__ConversationSearchOverlayView_hide__block_invoke;
  v7 = &unk_1E6D1A8F8;
  objc_copyWeak(&v8, &location);
  v3 = objc_msgSend(v2, "initWithDuration:controlPoint1:controlPoint2:animations:", &v4, 0.2, 0.445, 0.05, 0.55, 0.95);
  objc_msgSend(v3, "startAnimation", v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __37__ConversationSearchOverlayView_hide__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4FB1618] clearColor];
  [WeakRetained setBackgroundColor:v1];
}

@end