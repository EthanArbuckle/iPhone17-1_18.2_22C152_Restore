@interface WFCompactTextThumbnailViewController
- (NSString)string;
- (UILabel)label;
- (WFCompactTextThumbnailViewController)initWithString:(id)a3;
- (double)contentHeightForWidth:(double)a3;
- (unint64_t)preferredContentMode;
- (void)loadView;
- (void)setLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFCompactTextThumbnailViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_string, 0);
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (UILabel *)WeakRetained;
}

- (NSString)string
{
  return self->_string;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFCompactTextThumbnailViewController;
  id v4 = a3;
  [(WFCompactTextThumbnailViewController *)&v8 traitCollectionDidChange:v4];
  v5 = [(WFCompactTextThumbnailViewController *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(WFCompactThumbnailViewController *)self invalidateContentSize];
  }
}

- (double)contentHeightForWidth:(double)a3
{
  [(WFCompactTextThumbnailViewController *)self loadViewIfNeeded];
  v5 = [(WFCompactTextThumbnailViewController *)self label];
  objc_msgSend(v5, "sizeThatFits:", a3, 1.79769313e308);
  double v7 = v6 + 10.0;

  return v7;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)WFCompactTextThumbnailViewController;
  [(WFCompactTextThumbnailViewController *)&v11 loadView];
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v4 = [(WFCompactTextThumbnailViewController *)self view];
  [v4 bounds];
  CGRect v13 = CGRectInset(v12, 22.0, 0.0);
  objc_msgSend(v3, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);

  [v3 setAutoresizingMask:18];
  [v3 setNumberOfLines:0];
  v5 = [(WFCompactTextThumbnailViewController *)self string];
  [v3 setText:v5];

  double v6 = [MEMORY[0x263F825C8] labelColor];
  [v3 setTextColor:v6];

  int v7 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];
  objc_super v8 = (void *)MEMORY[0x263F83628];
  if (!v7) {
    objc_super v8 = (void *)MEMORY[0x263F83570];
  }
  v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*v8];
  [v3 setFont:v9];

  [v3 setAdjustsFontForContentSizeCategory:1];
  v10 = [(WFCompactTextThumbnailViewController *)self view];
  [v10 addSubview:v3];

  [(WFCompactTextThumbnailViewController *)self setLabel:v3];
}

- (unint64_t)preferredContentMode
{
  return 1;
}

- (WFCompactTextThumbnailViewController)initWithString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactTextThumbnailViewController;
  v5 = [(WFCompactTextThumbnailViewController *)&v10 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    objc_super v8 = v5;
  }

  return v5;
}

@end