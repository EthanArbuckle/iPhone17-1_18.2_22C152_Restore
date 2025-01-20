@interface SiriSharedUILatencyView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriSharedUIContentLabel)utteranceView;
- (SiriSharedUILatencyView)initWithContentInsets:(UIEdgeInsets)a3;
- (SiriSharedUILatencyViewDelegate)delegate;
- (SiriSharedUILatencyViewModel)viewModel;
- (UIEdgeInsets)contentInsets;
- (id)_createLabelForUtterance:(id)a3;
- (id)_fontForUtteranceLabel;
- (id)_getTextFromUtteranceView;
- (id)_utteranceLabel;
- (void)_clear;
- (void)_setTextForLabel:(id)a3 text:(id)a4;
- (void)_setUtterance:(id)a3;
- (void)_setViewModel:(id)a3;
- (void)_update;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setUtteranceView:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation SiriSharedUILatencyView

- (SiriSharedUILatencyView)initWithContentInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUILatencyView;
  v7 = -[SiriSharedUILatencyView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_contentInsets.CGFloat top = top;
    v7->_contentInsets.CGFloat left = left;
    v7->_contentInsets.CGFloat bottom = bottom;
    v7->_contentInsets.CGFloat right = right;
    v9 = [[SiriSharedUILatencyViewModel alloc] initWithUserUtterance:0 shouldSuppress:0];
    viewModel = v8->_viewModel;
    v8->_viewModel = v9;
  }
  return v8;
}

- (void)setViewModel:(id)a3
{
  id v7 = a3;
  if (!-[SiriSharedUILatencyViewModel isEqualToViewModel:](self->_viewModel, "isEqualToViewModel:"))
  {
    int v4 = [v7 viewShouldUpdateFromOldModel:self->_viewModel];
    v5 = (SiriSharedUILatencyViewModel *)[v7 copy];
    viewModel = self->_viewModel;
    self->_viewModel = v5;

    if (v4) {
      [(SiriSharedUILatencyView *)self _update];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SiriSharedUILatencyView *)self _getTextFromUtteranceView];
  id v7 = v6;
  if (v6 && [v6 length])
  {
    -[SiriSharedUIContentLabel sizeThatFits:](self->_utteranceView, "sizeThatFits:", width - self->_contentInsets.left - self->_contentInsets.right, height - self->_contentInsets.top - self->_contentInsets.bottom);
    double v9 = self->_contentInsets.left + v8 + self->_contentInsets.right;
    double v11 = v10 + self->_contentInsets.top + self->_contentInsets.bottom;
    if (v9 < width) {
      double width = v9;
    }
    if (v11 < height) {
      double height = v11;
    }
  }
  else
  {
    double width = *MEMORY[0x263F001B0];
    double height = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v12 = width;
  double v13 = height;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUILatencyView;
  [(SiriSharedUILatencyView *)&v12 layoutSubviews];
  v3 = [(SiriSharedUILatencyView *)self _getTextFromUtteranceView];
  int v4 = v3;
  if (v3 && [v3 length])
  {
    [(SiriSharedUILatencyView *)self bounds];
    CGFloat x = v13.origin.x;
    CGFloat y = v13.origin.y;
    CGFloat width = v13.size.width;
    CGFloat height = v13.size.height;
    CGFloat v9 = CGRectGetMinX(v13) + self->_contentInsets.left;
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGFloat v10 = CGRectGetMinY(v14) + self->_contentInsets.top;
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGFloat v11 = CGRectGetWidth(v15) - (self->_contentInsets.left + self->_contentInsets.right);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    -[SiriSharedUIContentLabel setFrame:](self->_utteranceView, "setFrame:", v9, v10, v11, CGRectGetHeight(v16) - (self->_contentInsets.top + self->_contentInsets.bottom));
  }
}

- (void)_update
{
  v3 = [(SiriSharedUILatencyView *)self viewModel];
  int v4 = [v3 shouldDisplay];

  if (v4)
  {
    id v6 = [(SiriSharedUILatencyView *)self viewModel];
    v5 = [v6 userUtterance];
    [(SiriSharedUILatencyView *)self _setUtterance:v5];
  }
  else
  {
    [(SiriSharedUILatencyView *)self _clear];
  }
}

- (void)_setUtterance:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v4 = [(id)v4 isEqualToString:&stru_26C1A19D8];
    uint64_t v5 = v8;
    if ((v4 & 1) == 0)
    {
      id v6 = [(SiriSharedUILatencyView *)self _createLabelForUtterance:v8];
      utteranceView = self->_utteranceView;
      self->_utteranceView = v6;

      [(SiriSharedUILatencyView *)self addSubview:self->_utteranceView];
      uint64_t v4 = [(SiriSharedUILatencyView *)self setNeedsLayout];
      uint64_t v5 = v8;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_clear
{
  [(SiriSharedUIContentLabel *)self->_utteranceView removeFromSuperview];
  utteranceView = self->_utteranceView;
  self->_utteranceView = 0;

  [(SiriSharedUILatencyView *)self setNeedsLayout];
}

- (id)_createLabelForUtterance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SiriSharedUILatencyView *)self _utteranceLabel];
  [(SiriSharedUILatencyView *)self _setTextForLabel:v5 text:v4];

  return v5;
}

- (id)_utteranceLabel
{
  utteranceView = self->_utteranceView;
  if (utteranceView)
  {
    v3 = utteranceView;
  }
  else
  {
    v3 = objc_alloc_init(SiriSharedUIContentLabel);
    uint64_t v5 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(SiriSharedUIContentLabel *)v3 setTextColor:v5];

    id v6 = [(SiriSharedUILatencyView *)self _fontForUtteranceLabel];
    [(SiriSharedUIContentLabel *)v3 setFont:v6];

    [(SiriSharedUIContentLabel *)v3 setNumberOfLines:0];
  }
  return v3;
}

- (id)_getTextFromUtteranceView
{
  utteranceView = self->_utteranceView;
  if (utteranceView)
  {
    utteranceView = [utteranceView text];
  }
  return utteranceView;
}

- (void)_setTextForLabel:(id)a3 text:(id)a4
{
}

- (id)_fontForUtteranceLabel
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] variant:1280];
}

- (void)_setViewModel:(id)a3
{
}

- (SiriSharedUILatencyViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUILatencyViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SiriSharedUILatencyViewModel)viewModel
{
  return self->_viewModel;
}

- (SiriSharedUIContentLabel)utteranceView
{
  return self->_utteranceView;
}

- (void)setUtteranceView:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end