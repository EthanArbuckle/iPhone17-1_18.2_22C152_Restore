@interface PKTransitPassProductHeaderView
- (NSString)headerLabelText;
- (PKTransitPassProductHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)setHeaderLabelText:(id)a3;
@end

@implementation PKTransitPassProductHeaderView

- (PKTransitPassProductHeaderView)initWithReuseIdentifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKTransitPassProductHeaderView;
  v3 = [(PKTransitPassProductHeaderView *)&v11 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    labelView = v3->_labelView;
    v3->_labelView = (UILabel *)v5;

    v7 = v3->_labelView;
    v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    [(UILabel *)v7 setFont:v8];

    v9 = [(PKTransitPassProductHeaderView *)v3 contentView];
    [v9 addSubview:v3->_labelView];
  }
  return v3;
}

- (void)setHeaderLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabelText, a3);
  id v5 = a3;
  [(UILabel *)self->_labelView setText:v5];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKTransitPassProductHeaderView;
  [(PKTransitPassProductHeaderView *)&v14 layoutSubviews];
  v3 = [(PKTransitPassProductHeaderView *)self contentView];
  int v4 = [v3 _shouldReverseLayoutDirection];
  double v5 = *MEMORY[0x1E4FB2848];
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  if (v4) {
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24) + 6.0;
  }
  else {
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  if (v4) {
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  else {
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8) + 6.0;
  }
  labelView = self->_labelView;
  [v3 bounds];
  -[UILabel setFrame:](labelView, "setFrame:", v8 + v10, v5 + v11, v12 - (v8 + v7), v13 - (v5 + v6));
}

- (NSString)headerLabelText
{
  return self->_headerLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabelText, 0);

  objc_storeStrong((id *)&self->_labelView, 0);
}

@end