@interface PUILocationIndicatorExplanationView
- (PUILocationIndicatorExplanationView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (id)generalExplanationItemString;
- (void)layoutForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutSubviews;
@end

@implementation PUILocationIndicatorExplanationView

- (PUILocationIndicatorExplanationView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  if (loadLocationFillSystemImage_onceToken != -1) {
    dispatch_once(&loadLocationFillSystemImage_onceToken, &__block_literal_global_769);
  }
  v35.receiver = self;
  v35.super_class = (Class)PUILocationIndicatorExplanationView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[PUILocationIndicatorExplanationView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v11 = [v10 initWithImage:locationFillSystemImageWithSystemPurpleColor];
    activeIcon = v9->_activeIcon;
    v9->_activeIcon = (UIImageView *)v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    activeLabel = v9->_activeLabel;
    v9->_activeLabel = (UILabel *)v13;

    v15 = PUI_LocalizedStringForLocationServices(@"ACTIVE_EXPLANATION_ITEM");
    [(UILabel *)v9->_activeLabel setText:v15];

    v16 = PreferencesTableViewFooterFont();
    [(UILabel *)v9->_activeLabel setFont:v16];

    v17 = PreferencesTableViewFooterColor();
    [(UILabel *)v9->_activeLabel setTextColor:v17];

    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9->_activeLabel setBackgroundColor:v18];

    [(UILabel *)v9->_activeLabel setTextAlignment:4];
    [(UILabel *)v9->_activeLabel setLineBreakMode:0];
    [(UILabel *)v9->_activeLabel setNumberOfLines:0];
    id v19 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v20 = [v19 initWithImage:locationFillSystemImageWithSecondaryLabelColor];
    recentIcon = v9->_recentIcon;
    v9->_recentIcon = (UIImageView *)v20;

    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    recentLabel = v9->_recentLabel;
    v9->_recentLabel = (UILabel *)v22;

    v24 = PUI_LocalizedStringForLocationServices(@"RECENT_EXPLANATION_ITEM");
    [(UILabel *)v9->_recentLabel setText:v24];

    v25 = PreferencesTableViewFooterFont();
    [(UILabel *)v9->_recentLabel setFont:v25];

    [(UILabel *)v9->_recentLabel setTextAlignment:4];
    v26 = PreferencesTableViewFooterColor();
    [(UILabel *)v9->_recentLabel setTextColor:v26];

    v27 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9->_recentLabel setBackgroundColor:v27];

    [(UILabel *)v9->_recentLabel setLineBreakMode:0];
    [(UILabel *)v9->_recentLabel setNumberOfLines:0];
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    explanationLabel = v9->_explanationLabel;
    v9->_explanationLabel = (UILabel *)v28;

    v30 = [(PUILocationIndicatorExplanationView *)v9 generalExplanationItemString];
    [(UILabel *)v9->_explanationLabel setText:v30];

    v31 = PreferencesTableViewFooterFont();
    [(UILabel *)v9->_explanationLabel setFont:v31];

    v32 = PreferencesTableViewFooterColor();
    [(UILabel *)v9->_explanationLabel setTextColor:v32];

    v33 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9->_explanationLabel setBackgroundColor:v33];

    [(UILabel *)v9->_explanationLabel setTextAlignment:4];
    [(UILabel *)v9->_explanationLabel setLineBreakMode:0];
    [(UILabel *)v9->_explanationLabel setNumberOfLines:0];
    [(PUILocationIndicatorExplanationView *)v9 addSubview:v9->_activeIcon];
    [(PUILocationIndicatorExplanationView *)v9 addSubview:v9->_activeLabel];
    [(PUILocationIndicatorExplanationView *)v9 addSubview:v9->_recentIcon];
    [(PUILocationIndicatorExplanationView *)v9 addSubview:v9->_recentLabel];
    [(PUILocationIndicatorExplanationView *)v9 addSubview:v9->_explanationLabel];
  }

  return v9;
}

- (id)generalExplanationItemString
{
  return PUI_LocalizedStringForLocationServices(@"GENERAL_EXPLANATION_ITEM");
}

- (void)layoutForWidth:(double)a3 inTableView:(id)a4
{
  [a4 _backgroundInset];
  double v7 = v6 + 12.0;
  [(UIImageView *)self->_activeIcon frame];
  double v9 = v8;
  double v60 = v10;
  [(UILabel *)self->_activeLabel frame];
  [(UIImageView *)self->_recentIcon frame];
  double v12 = v11;
  double v59 = v13;
  [(UILabel *)self->_recentLabel frame];
  [(UILabel *)self->_explanationLabel frame];
  v14 = [(UILabel *)self->_explanationLabel text];
  v15 = [(UILabel *)self->_explanationLabel font];
  objc_msgSend(v14, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v15, -[UILabel lineBreakMode](self->_explanationLabel, "lineBreakMode"), a3 + (v7 + 4.0) * -2.0, 1.79769313e308);
  double v58 = v16;
  double v18 = v17;

  id v19 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v20 = [v19 userInterfaceLayoutDirection];

  if (v20)
  {
    v21 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v22 = [v21 userInterfaceIdiom];

    if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v23 = v7 + 4.0;
    }
    else {
      double v23 = v7;
    }
    double v57 = v9 + v23;
  }
  else
  {
    double v57 = v7 + 4.0;
  }
  v24 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v25 = [v24 userInterfaceLayoutDirection];

  if (v25) {
    double v26 = a3 - v7 - v9;
  }
  else {
    double v26 = v7;
  }
  PSRoundToPixel();
  double v28 = v27;
  PSRoundToPixel();
  double v56 = v18;
  double v30 = v29;
  PSRoundToPixel();
  double v55 = v12;
  double v32 = a3 + v7 * -2.0 + -10.0 - v31;
  v33 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v34 = [v33 userInterfaceLayoutDirection];

  double v35 = v30 + 10.0;
  if (v34) {
    double v35 = v7;
  }
  double v54 = v35;
  v36 = [(UILabel *)self->_activeLabel text];
  v37 = [(UILabel *)self->_activeLabel font];
  objc_msgSend(v36, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v37, -[UILabel lineBreakMode](self->_activeLabel, "lineBreakMode"), v32, 1.79769313e308);
  double v52 = v38;
  double v53 = v39;

  PSRoundToPixel();
  double v41 = v40;
  v42 = [(UILabel *)self->_recentLabel text];
  v43 = [(UILabel *)self->_recentLabel font];
  objc_msgSend(v42, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v43, -[UILabel lineBreakMode](self->_recentLabel, "lineBreakMode"), v32, 1.79769313e308);
  double v45 = v44;
  double v51 = v46;

  v47 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v48 = [v47 userInterfaceLayoutDirection];

  if (v48 == 1) {
    double v49 = v32;
  }
  else {
    double v49 = v58;
  }
  if (v48 == 1) {
    double v45 = v32;
  }
  else {
    double v32 = v52;
  }
  -[UIImageView setFrame:](self->_activeIcon, "setFrame:", v26, v28, v9, v60);
  -[UILabel setFrame:](self->_activeLabel, "setFrame:", v54, v28 + -3.0, v32, v53);
  -[UIImageView setFrame:](self->_recentIcon, "setFrame:", v26, v41, v55, v59);
  -[UILabel setFrame:](self->_recentLabel, "setFrame:", v54, v41 + -3.0, v45, v51);
  explanationLabel = self->_explanationLabel;
  -[UILabel setFrame:](explanationLabel, "setFrame:", v57, 12.0, v49, v56);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PUILocationIndicatorExplanationView;
  [(PUILocationIndicatorExplanationView *)&v6 layoutSubviews];
  [(PUILocationIndicatorExplanationView *)self bounds];
  double v4 = v3;
  double v5 = [(PUILocationIndicatorExplanationView *)self superview];
  [(PUILocationIndicatorExplanationView *)self layoutForWidth:v5 inTableView:v4];
}

- (double)preferredHeightForWidth:(double)a3
{
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  [(PUILocationIndicatorExplanationView *)self layoutForWidth:a4 inTableView:a3];
  [(UIImageView *)self->_recentIcon frame];
  double v7 = v5 + v6;
  [(UILabel *)self->_recentLabel frame];
  double v10 = v8 + v9;
  if (v7 >= v8 + v9) {
    double v10 = v7;
  }
  return v10 + 24.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_recentLabel, 0);
  objc_storeStrong((id *)&self->_recentIcon, 0);
  objc_storeStrong((id *)&self->_activeLabel, 0);
  objc_storeStrong((id *)&self->_activeIcon, 0);
}

@end