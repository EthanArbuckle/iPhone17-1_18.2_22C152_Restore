@interface PXMessagesStackAdditionalItemsView
- (CGRect)clippingRect;
- (PXMessagesStackAdditionalItemsView)initWithFrame:(CGRect)a3;
- (PXMessagesStackAdditionalItemsViewUserData)userData;
- (id)_localizedTitleForAdditionalItemsCount:(id)a3;
- (void)becomeReusable;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXMessagesStackAdditionalItemsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

- (PXMessagesStackAdditionalItemsViewUserData)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->clippingRect.origin.x;
  double y = self->clippingRect.origin.y;
  double width = self->clippingRect.size.width;
  double height = self->clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)becomeReusable
{
}

- (void)setUserData:(id)a3
{
  if (self->_userData != a3)
  {
    id v4 = a3;
    v5 = (PXMessagesStackAdditionalItemsViewUserData *)[v4 copy];
    userData = self->_userData;
    self->_userData = v5;

    uint64_t v7 = [v4 additionalItemsCount];
    uint64_t v9 = v8;

    -[PXMessagesStackAdditionalItemsView _localizedTitleForAdditionalItemsCount:](self, "_localizedTitleForAdditionalItemsCount:", v7, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(UILabel *)self->_label setText:v10];
    [(PXMessagesStackAdditionalItemsView *)self setNeedsLayout];
  }
}

- (id)_localizedTitleForAdditionalItemsCount:(id)a3
{
  if (a3.var0)
  {
    v3 = PXLocalizationKeyForMediaType(a3.var1, @"PXMessagesStackAdditionalNumberOfPhotosTitle", @"PXMessagesStackAdditionalNumberOfVideosTitle ", @"PXMessagesStackAdditionalNumberOfItemsTitle");
    id v4 = PXLocalizedStringFromTable(v3, @"PhotosUICore");
    PXLocalizedStringWithValidatedFormat(v4, @"%lu");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1F00B0030;
  }
  return v5;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackAdditionalItemsView;
  [(PXMessagesStackAdditionalItemsView *)&v11 layoutSubviews];
  [(PXMessagesStackAdditionalItemsView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:");
  v12.origin.double x = v4;
  v12.origin.double y = v6;
  v12.size.double width = v8;
  v12.size.double height = v10;
  CGRect v13 = CGRectInset(v12, v8 * -0.05, v10 * -0.05);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v13.size.width, v13.size.height);
  PXRectGetCenter();
}

- (PXMessagesStackAdditionalItemsView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXMessagesStackAdditionalItemsView;
  double v3 = -[PXMessagesStackAdditionalItemsView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CGFloat v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXMessagesStackAdditionalItemsView *)v3 setBackgroundColor:v4];

    [(PXMessagesStackAdditionalItemsView *)v3 setUserInteractionEnabled:0];
    uint64_t v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v5;

    [(UIVisualEffectView *)v3->_visualEffectView setUserInteractionEnabled:0];
    [(PXMessagesStackAdditionalItemsView *)v3 addSubview:v3->_visualEffectView];
    id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v8;

    [(UILabel *)v3->_label setNumberOfLines:0];
    double v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UILabel *)v3->_label setTextColor:v10];

    [(UILabel *)v3->_label setText:&stru_1F00B0030];
    PXCappedFontWithTextStyleAndWeight();
  }
  return 0;
}

@end