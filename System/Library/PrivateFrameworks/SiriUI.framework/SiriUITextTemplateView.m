@interface SiriUITextTemplateView
- (SiriUITextTemplateView)initWithDataSource:(id)a3;
- (UIButton)disclosureButton;
- (UIImageView)chevronView;
- (UILabel)detailTextLabel;
- (void)_setupDisclosureButton;
- (void)addTargetForDisclosure:(id)a3 action:(SEL)a4;
- (void)layoutDetailText;
- (void)layoutSubviews;
- (void)reloadData;
- (void)removeTargetForDisclosure:(id)a3 action:(SEL)a4;
- (void)setChevronView:(id)a3;
- (void)setDetailTextLabel:(id)a3;
- (void)setDisclosureButton:(id)a3;
- (void)setupDisclosureIndicator;
@end

@implementation SiriUITextTemplateView

- (SiriUITextTemplateView)initWithDataSource:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUITextTemplateView;
  v3 = [(SiriUILabelStackTemplateView *)&v5 initWithDataSource:a3];
  [(SiriUITextTemplateView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SiriUITextTemplateView;
  [(SiriUITextTemplateView *)&v9 layoutSubviews];
  [(SiriUITextTemplateView *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  disclosureButton = self->_disclosureButton;
  double v8 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  -[UIButton setFrame:](disclosureButton, "setFrame:", 0.0, 0.0, v8, CGRectGetHeight(v11));
}

- (void)setupDisclosureIndicator
{
  id v3 = objc_alloc(MEMORY[0x263F1C6D0]);
  v4 = (void *)MEMORY[0x263F1C6B0];
  objc_super v5 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterGlyphColor");
  v6 = objc_msgSend(v4, "siriui_semiTransparentChevronImageWithColor:allowNaturalLayout:", v5, 0);
  v7 = (UIImageView *)[v3 initWithImage:v6];
  chevronView = self->_chevronView;
  self->_chevronView = v7;

  [(UIImageView *)self->_chevronView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_chevronView setContentMode:4];
  -[SiriUILabelStackTemplateView insertTrailingView:withMargins:](self, "insertTrailingView:withMargins:", self->_chevronView, 0.0, -7.0, 0.0, 0.0);
  objc_super v9 = self->_chevronView;
  LODWORD(v10) = 1144750080;
  [(UIImageView *)v9 setContentHuggingPriority:0 forAxis:v10];
}

- (void)_setupDisclosureButton
{
  id v3 = (UIButton *)objc_alloc_init(MEMORY[0x263F1C488]);
  disclosureButton = self->_disclosureButton;
  self->_disclosureButton = v3;

  [(UIButton *)self->_disclosureButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SiriUITextTemplateView *)self addSubview:self->_disclosureButton];
  id v5 = (id)-[UIButton siriui_pinToSuperviewWithEdgeInsets:](self->_disclosureButton, "siriui_pinToSuperviewWithEdgeInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
}

- (void)addTargetForDisclosure:(id)a3 action:(SEL)a4
{
}

- (void)removeTargetForDisclosure:(id)a3 action:(SEL)a4
{
}

- (void)layoutDetailText
{
  id v3 = [(SiriUIBaseTemplateView *)self dataSource];
  v4 = [v3 detailText];
  uint64_t v5 = [v4 length];

  if (v5 && !self->_detailTextLabel)
  {
    objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredBodyLabel");
    v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
    detailTextLabel = self->_detailTextLabel;
    self->_detailTextLabel = v6;

    [(UILabel *)self->_detailTextLabel setUseSecondaryTextColor];
    [(UILabel *)self->_detailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1144750080;
    [(UILabel *)self->_detailTextLabel setContentHuggingPriority:0 forAxis:v8];
    LODWORD(v9) = 1132068864;
    [(UILabel *)self->_detailTextLabel setContentCompressionResistancePriority:0 forAxis:v9];
    [(UILabel *)self->_detailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v10 = self->_detailTextLabel;
    CGRect v11 = [(SiriUIBaseTemplateView *)self dataSource];
    v12 = [v11 detailText];
    [(UILabel *)v10 setText:v12];

    [(UILabel *)self->_detailTextLabel sizeToFit];
    v13 = self->_detailTextLabel;
    double v14 = *MEMORY[0x263F1D1C0];
    double v15 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v16 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v17 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    -[SiriUILabelStackTemplateView insertTrailingView:withMargins:](self, "insertTrailingView:withMargins:", v13, v14, v15, v16, v17);
  }
}

- (void)reloadData
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUITextTemplateView;
  [(SiriUILabelStackTemplateView *)&v5 reloadData];
  [(SiriUITextTemplateView *)self layoutDetailText];
  id v3 = [(SiriUIBaseTemplateView *)self dataSource];
  int v4 = [v3 showsDisclosureIndicator];

  if (v4)
  {
    [(SiriUITextTemplateView *)self setupDisclosureIndicator];
    [(SiriUITextTemplateView *)self _setupDisclosureButton];
  }
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
}

- (UIButton)disclosureButton
{
  return self->_disclosureButton;
}

- (void)setDisclosureButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureButton, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
}

@end