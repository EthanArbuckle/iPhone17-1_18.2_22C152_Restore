@interface SXIssueCoverComponentView
- (SXIssueCoverComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 viewProvider:(id)a7;
- (SXIssueCoverViewProvider)viewProvider;
- (UIView)coverView;
- (void)discardContents;
- (void)presentComponentWithChanges:(id)a3;
- (void)renderContents;
- (void)renderIssueCover;
- (void)setCoverView:(id)a3;
@end

@implementation SXIssueCoverComponentView

- (SXIssueCoverComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 viewProvider:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXIssueCoverComponentView;
  v14 = [(SXComponentView *)&v17 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_viewProvider, a7);
  }

  return v15;
}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)SXIssueCoverComponentView;
  [(SXComponentView *)&v6 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  if (var0)
  {
    v5 = [(SXIssueCoverComponentView *)self coverView];

    if (v5) {
      [(SXIssueCoverComponentView *)self renderIssueCover];
    }
  }
}

- (void)renderContents
{
  v3.receiver = self;
  v3.super_class = (Class)SXIssueCoverComponentView;
  [(SXComponentView *)&v3 renderContents];
  [(SXIssueCoverComponentView *)self renderIssueCover];
}

- (void)discardContents
{
  v4.receiver = self;
  v4.super_class = (Class)SXIssueCoverComponentView;
  [(SXComponentView *)&v4 discardContents];
  objc_super v3 = [(SXIssueCoverComponentView *)self coverView];
  [v3 removeFromSuperview];

  [(SXIssueCoverComponentView *)self setCoverView:0];
}

- (void)renderIssueCover
{
  objc_super v3 = [SXIssueCover alloc];
  objc_super v4 = [(SXComponentView *)self component];
  v5 = [v4 issueIdentifier];
  v26 = [(SXIssueCover *)v3 initWithIssueIdentifier:v5];

  objc_super v6 = [(SXIssueCoverComponentView *)self coverView];

  if (!v6)
  {
    v7 = [(SXIssueCoverComponentView *)self viewProvider];
    v8 = [v7 viewForIssueCover:v26];
    [(SXIssueCoverComponentView *)self setCoverView:v8];

    v9 = [(SXIssueCoverComponentView *)self coverView];
    [v9 setAccessibilityIgnoresInvertColors:1];

    v10 = [(SXComponentView *)self contentView];
    v11 = [(SXIssueCoverComponentView *)self coverView];
    [v10 addSubview:v11];
  }
  v12 = [SXIssueCoverPresentationOptions alloc];
  [(SXComponentView *)self contentFrame];
  double v14 = v13;
  double v16 = v15;
  objc_super v17 = [(SXComponentView *)self component];
  uint64_t v18 = [v17 videoPlaybackEnabled];
  v19 = [(SXComponentView *)self DOMObjectProvider];
  v20 = [v19 documentStyle];
  v21 = [v20 backgroundColor];
  v22 = -[SXIssueCoverPresentationOptions initWithSize:videoPlaybackEnabled:parentBackgroundColor:](v12, "initWithSize:videoPlaybackEnabled:parentBackgroundColor:", v18, v21, v14, v16);

  v23 = [(SXIssueCoverComponentView *)self viewProvider];
  v24 = [(SXIssueCoverComponentView *)self coverView];
  [v23 presentIssueCover:v26 onView:v24 options:v22];

  v25 = [(SXIssueCoverComponentView *)self coverView];
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v25, "setFrame:");
}

- (SXIssueCoverViewProvider)viewProvider
{
  return self->_viewProvider;
}

- (UIView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverView, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

@end