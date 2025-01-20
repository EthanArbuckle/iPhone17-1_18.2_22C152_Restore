@interface SiriUISelectionTemplateView
- (SiriUISelectionTemplateView)initWithDataSource:(id)a3;
- (void)addTargetForSelectionEvent:(id)a3 action:(SEL)a4;
- (void)layoutSubviews;
- (void)reloadData;
- (void)removeTargetForSelectionEvent:(id)a3 action:(SEL)a4;
@end

@implementation SiriUISelectionTemplateView

- (SiriUISelectionTemplateView)initWithDataSource:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUISelectionTemplateView;
  v3 = [(SiriUISettingTemplateView *)&v13 initWithDataSource:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark"];
    v5 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterTextColor");
    v6 = [v4 _flatImageWithColor:v5];
    v7 = [v6 imageFlippedForRightToLeftLayoutDirection];

    uint64_t v8 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v7];
    checkmarkImageView = v3->_checkmarkImageView;
    v3->_checkmarkImageView = (UIImageView *)v8;

    uint64_t v10 = [MEMORY[0x263F1C488] buttonWithType:0];
    selectionButton = v3->_selectionButton;
    v3->_selectionButton = (UIButton *)v10;

    [(SiriUISelectionTemplateView *)v3 addSubview:v3->_checkmarkImageView];
    [(SiriUISelectionTemplateView *)v3 addSubview:v3->_selectionButton];
    [(SiriUISelectionTemplateView *)v3 reloadData];
  }
  return v3;
}

- (void)reloadData
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUISelectionTemplateView;
  [(SiriUISettingTemplateView *)&v4 reloadData];
  v3 = [(SiriUIBaseTemplateView *)self dataSource];
  -[UIImageView setHidden:](self->_checkmarkImageView, "setHidden:", [v3 selected] ^ 1);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUISelectionTemplateView;
  [(SiriUISettingTemplateView *)&v13 layoutSubviews];
  [(SiriUISelectionTemplateView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SiriUIBaseTemplateView *)self templatedSuperview];
  [v11 templatedContentMargins];

  uint64_t v12 = [(SiriUISelectionTemplateView *)self semanticContentAttribute];
  -[UIImageView sizeThatFits:](self->_checkmarkImageView, "sizeThatFits:", v8, v10);
  if (v12 != 4)
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    CGRectGetWidth(v14);
    [(UIImageView *)self->_checkmarkImageView frame];
    CGRectGetWidth(v15);
  }
  UIRectCenteredYInRect();
  -[UIImageView setFrame:](self->_checkmarkImageView, "setFrame:");
  -[UIButton setFrame:](self->_selectionButton, "setFrame:", v4, v6, v8, v10);
}

- (void)addTargetForSelectionEvent:(id)a3 action:(SEL)a4
{
}

- (void)removeTargetForSelectionEvent:(id)a3 action:(SEL)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionButton, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end