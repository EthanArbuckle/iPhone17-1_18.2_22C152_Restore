@interface SiriUICardSnippetView
- (BOOL)isHint;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)isLoading;
- (BOOL)isNavigating;
- (BOOL)shouldAutomaticallyScaleContentInAmbient;
- (BOOL)shouldClipTopOfCard;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriUICardSnippetView)initWithFrame:(CGRect)a3;
- (SiriUICardSnippetViewDataSource)dataSource;
- (SiriUICardSnippetViewDelegate)delegate;
- (SiriUISnippetViewController)backingViewController;
- (UIButton)backNavigationButton;
- (id)accessibilityIdentifier;
- (void)_sashViewRecognizedTapGestureWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDrillInAnimation;
- (void)prepareForPopAnimationOfType:(int64_t)a3;
- (void)setBackingViewController:(id)a3;
- (void)setCardView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setNavigating:(BOOL)a3;
- (void)setShouldClipTopOfCard:(BOOL)a3;
@end

@implementation SiriUICardSnippetView

- (SiriUICardSnippetView)initWithFrame:(CGRect)a3
{
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double Height = CGRectGetHeight(a3);
  if (Height >= 44.0) {
    double v8 = Height;
  }
  else {
    double v8 = 44.0;
  }
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.CGFloat width = width;
  v15.size.height = v8;
  double v9 = CGRectGetWidth(v15);
  if (v9 >= 100.0) {
    double v10 = v9;
  }
  else {
    double v10 = 100.0;
  }
  v14.receiver = self;
  v14.super_class = (Class)SiriUICardSnippetView;
  v11 = -[SiriUICardSnippetView initWithFrame:](&v14, sel_initWithFrame_, x, y, v10, v8);
  v12 = v11;
  if (v11)
  {
    [(SiriUICardSnippetView *)v11 _setOverrideVibrancyTrait:1];
    [(SiriUICardSnippetView *)v12 setShouldClipTopOfCard:0];
    v12->_isNavigating = 0;
  }
  return v12;
}

- (id)accessibilityIdentifier
{
  return @"SiriUICardSnippetViewAccessibilityIdentifier";
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    [(SiriUICardSnippetView *)self setNeedsLayout];
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  if (self->_isInAmbientInteractivity != a3)
  {
    self->_isInAmbientInteractivitdouble y = a3;
    [(SiriUICardSnippetView *)self setNeedsLayout];
  }
}

- (BOOL)shouldAutomaticallyScaleContentInAmbient
{
  return 1;
}

- (void)layoutSubviews
{
  [(UIView *)self->_cardView recursive_setSemanticContentAttribute:[(SiriUICardSnippetView *)self semanticContentAttribute]];
  v15.receiver = self;
  v15.super_class = (Class)SiriUICardSnippetView;
  [(SiriUICardSnippetView *)&v15 layoutSubviews];
  [(SiriUICardSnippetView *)self bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (self->_shouldClipTopOfCard) {
    double v11 = -8.0;
  }
  else {
    double v11 = 0.0;
  }
  double Width = CGRectGetWidth(*(CGRect *)&v3);
  v16.origin.double x = v7;
  v16.origin.double y = v8;
  v16.size.CGFloat width = v9;
  v16.size.height = v10;
  double Height = CGRectGetHeight(v16);
  double v14 = 8.0;
  if (!self->_shouldClipTopOfCard) {
    double v14 = 0.0;
  }
  -[UIView setFrame:](self->_cardView, "setFrame:", 0.0, v11, Width, Height + v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v5 = [(SiriUICardSnippetView *)self dataSource];
  [v5 preferredContentHeight];
  double v7 = 8.0;
  if (!self->_shouldClipTopOfCard) {
    double v7 = 0.0;
  }
  double v8 = v6 - v7;

  if (v8 <= 0.0)
  {
    CGFloat v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SiriUICardSnippetView sizeThatFits:]";
      _os_log_impl(&dword_2231EF000, v9, OS_LOG_TYPE_DEFAULT, "%s No card content height.", (uint8_t *)&v12, 0xCu);
    }
    double v8 = 0.0;
  }
  double v10 = width;
  double v11 = v8;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)setCardView:(id)a3
{
  double v5 = (UIView *)a3;
  p_cardView = &self->_cardView;
  cardView = self->_cardView;
  double v10 = v5;
  if (cardView != v5)
  {
    [(UIView *)cardView removeFromSuperview];
    objc_storeStrong((id *)&self->_cardView, a3);
    [(UIView *)*p_cardView setAccessibilityIdentifier:@"SiriUICardViewAccessibilityIdentifier"];
    [(SiriUICardSnippetView *)self addSubview:v10];
    [(SiriUICardSnippetView *)self setNeedsLayout];
    double v8 = [(UIView *)*p_cardView backgroundColor];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(SiriUICardSnippetView *)self reloadData];
    double v5 = obj;
  }
}

- (void)setNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (UIButton)backNavigationButton
{
  return 0;
}

- (void)prepareForDrillInAnimation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  cardView = self->_cardView;
  double v4 = [MEMORY[0x263F1C550] clearColor];
  [(UIView *)cardView setBackgroundColor:v4];

  double v5 = [(UIView *)self->_cardView subviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        getSearchUIBackgroundColorViewClass();
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setHidden:1];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)prepareForPopAnimationOfType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(UIView *)self->_cardView setBackgroundColor:self->_backgroundColor];
  double v4 = [(UIView *)self->_cardView subviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        getSearchUIBackgroundColorViewClass();
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 setHidden:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)isLoading
{
  v2 = [(SiriUICardSnippetView *)self backingViewController];
  char v3 = [v2 isLoading];

  return v3;
}

- (BOOL)isHint
{
  v2 = [(SiriUICardSnippetView *)self backingViewController];
  char v3 = [v2 isHint];

  return v3;
}

- (void)_sashViewRecognizedTapGestureWithGestureRecognizer:(id)a3
{
  id v4 = [(SiriUICardSnippetView *)self delegate];
  [v4 cardSnippetViewSashWasTapped:self];
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (BOOL)shouldClipTopOfCard
{
  return self->_shouldClipTopOfCard;
}

- (void)setShouldClipTopOfCard:(BOOL)a3
{
  self->_shouldClipTopOfCard = a3;
}

- (SiriUISnippetViewController)backingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backingViewController);
  return (SiriUISnippetViewController *)WeakRetained;
}

- (void)setBackingViewController:(id)a3
{
}

- (SiriUICardSnippetViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SiriUICardSnippetViewDataSource *)WeakRetained;
}

- (SiriUICardSnippetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUICardSnippetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_backingViewController);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
}

@end