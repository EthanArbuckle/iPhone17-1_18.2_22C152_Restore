@interface WFCompactPreviewThumbnailViewController
- (UIView)hostedView;
- (WFCompactPreviewThumbnailViewController)initWithContentItem:(id)a3;
- (WFContentItem)contentItem;
- (double)contentHeightForWidth:(double)a3;
- (unint64_t)preferredContentMode;
- (void)loadView;
- (void)setHostedView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFCompactPreviewThumbnailViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostedView);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

- (void)setHostedView:(id)a3
{
}

- (UIView)hostedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedView);
  return (UIView *)WeakRetained;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFCompactPreviewThumbnailViewController;
  id v4 = a3;
  [(WFCompactPreviewThumbnailViewController *)&v8 traitCollectionDidChange:v4];
  v5 = [(WFCompactPreviewThumbnailViewController *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(WFCompactThumbnailViewController *)self invalidateContentSize];
  }
}

- (double)contentHeightForWidth:(double)a3
{
  [(WFCompactPreviewThumbnailViewController *)self loadViewIfNeeded];
  v5 = [(WFCompactPreviewThumbnailViewController *)self hostedView];
  objc_msgSend(v5, "sizeThatFits:", a3, 1.79769313e308);
  double v7 = v6;

  return v7;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)WFCompactPreviewThumbnailViewController;
  [(WFCompactPreviewThumbnailViewController *)&v12 loadView];
  v3 = [(WFCompactPreviewThumbnailViewController *)self contentItem];
  id v4 = [v3 generatePagePreviewUIView];

  v5 = [(WFCompactPreviewThumbnailViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  objc_super v8 = [(WFCompactPreviewThumbnailViewController *)self view];
  [v8 bounds];
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, v7, v9 + -100.0);

  [v4 setAutoresizingMask:18];
  v10 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v10];

  v11 = [(WFCompactPreviewThumbnailViewController *)self view];
  [v11 addSubview:v4];

  [(WFCompactPreviewThumbnailViewController *)self setHostedView:v4];
}

- (unint64_t)preferredContentMode
{
  return 1;
}

- (WFCompactPreviewThumbnailViewController)initWithContentItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactPreviewThumbnailViewController;
  double v6 = [(WFCompactPreviewThumbnailViewController *)&v10 initWithNibName:0 bundle:0];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentItem, a3);
    objc_super v8 = v7;
  }

  return v7;
}

@end