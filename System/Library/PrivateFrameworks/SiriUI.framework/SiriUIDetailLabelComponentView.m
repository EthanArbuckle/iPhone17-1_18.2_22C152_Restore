@interface SiriUIDetailLabelComponentView
+ (id)viewForComponent:(id)a3;
- (UILabel)detailLabel;
- (UILabel)mainLabel;
- (void)addSubviewsForComponentModel:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setMainLabel:(id)a3;
@end

@implementation SiriUIDetailLabelComponentView

+ (id)viewForComponent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubviewsForComponentModel:v4];

  return v6;
}

- (void)addSubviewsForComponentModel:(id)a3
{
  id v19 = a3;
  switch([v19 style])
  {
    case 0:
      objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredHeadlineLabel");
      id v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredBodyLabel");
      id v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredSubheadLabel");
      id v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredCaptionLabel");
      id v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      mainLabel = self->_mainLabel;
      self->_mainLabel = v4;

      break;
    default:
      break;
  }
  v6 = self->_mainLabel;
  if (v6)
  {
    [(UILabel *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = self->_mainLabel;
    v8 = [v19 text];
    [(UILabel *)v7 setText:v8];

    [(SiriUIDetailLabelComponentView *)self addSubview:self->_mainLabel];
  }
  objc_msgSend(MEMORY[0x263F1C768], "siriui_configuredBodyLabel");
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  detailLabel = self->_detailLabel;
  self->_detailLabel = v9;

  [(UILabel *)self->_detailLabel setUseSecondaryTextColor];
  [(SiriUIDetailLabelComponentView *)self addSubview:self->_detailLabel];
  LODWORD(v11) = 1132068864;
  [(UILabel *)self->_mainLabel setContentCompressionResistancePriority:0 forAxis:v11];
  v12 = self->_detailLabel;
  v13 = [v19 detailText];
  [(UILabel *)v12 setText:v13];

  if (self->_detailLabel)
  {
    -[SiriUIDetailLabelComponentView addSubview:](self, "addSubview:");
    [(UILabel *)self->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v14 = (id)[(UILabel *)self->_detailLabel siriui_centerVerticallyWithItem:self->_mainLabel withMargin:0.0];
  }
  v15 = -[UILabel siriui_pinToSuperviewWithEdgeInsets:](self->_mainLabel, "siriui_pinToSuperviewWithEdgeInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  v16 = [v15 objectForKeyedSubscript:&unk_26D657FF8];
  [(SiriUIDetailLabelComponentView *)self removeConstraint:v16];

  id v17 = (id)[(UILabel *)self->_mainLabel siriui_pinTrailingToLeadingEdgeOf:self->_detailLabel withMargin:0.0];
  id v18 = (id)[(UILabel *)self->_detailLabel siriui_pinTrailingToTrailingEdgeOf:self withMargin:0.0];
}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
}

@end