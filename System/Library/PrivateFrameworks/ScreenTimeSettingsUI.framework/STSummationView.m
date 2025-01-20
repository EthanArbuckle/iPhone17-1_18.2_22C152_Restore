@interface STSummationView
- (STSummationView)initWithTitle:(id)a3 detailText:(id)a4;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (void)setDetailLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation STSummationView

- (STSummationView)initWithTitle:(id)a3 detailText:(id)a4
{
  v45[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)STSummationView;
  v8 = -[STSummationView initWithFrame:](&v43, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v8)
  {
    [MEMORY[0x263F825C8] systemBackgroundColor];
    v9 = id v42 = v7;
    [(STSummationView *)v8 setBackgroundColor:v9];

    uint64_t v10 = objc_opt_new();
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = (UILabel *)v10;

    [(UILabel *)v8->_titleLabel setAttributedText:v6];
    [(UILabel *)v8->_titleLabel setNumberOfLines:0];
    [(UILabel *)v8->_titleLabel setLineBreakMode:0];
    v12 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v8->_titleLabel setTextColor:v12];

    [(UILabel *)v8->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_titleLabel sizeToFit];
    [(STSummationView *)v8 addSubview:v8->_titleLabel];
    v35 = (void *)MEMORY[0x263F08938];
    v39 = [(UILabel *)v8->_titleLabel topAnchor];
    v37 = [(STSummationView *)v8 topAnchor];
    v13 = [v39 constraintEqualToAnchor:v37 constant:10.0];
    v45[0] = v13;
    v14 = [(UILabel *)v8->_titleLabel leadingAnchor];
    v15 = [(STSummationView *)v8 leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:16.0];
    v45[1] = v16;
    v17 = [(UILabel *)v8->_titleLabel trailingAnchor];
    v18 = [(STSummationView *)v8 trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:-16.0];
    v45[2] = v19;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
    v20 = id v41 = v6;
    [v35 activateConstraints:v20];

    uint64_t v21 = objc_opt_new();
    detailLabel = v8->_detailLabel;
    v8->_detailLabel = (UILabel *)v21;

    [(UILabel *)v8->_detailLabel setAttributedText:v42];
    [(UILabel *)v8->_detailLabel setNumberOfLines:0];
    [(UILabel *)v8->_detailLabel setLineBreakMode:0];
    [(UILabel *)v8->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_detailLabel sizeToFit];
    [(STSummationView *)v8 addSubview:v8->_detailLabel];
    v33 = (void *)MEMORY[0x263F08938];
    v40 = [(UILabel *)v8->_detailLabel topAnchor];
    v38 = [(UILabel *)v8->_titleLabel bottomAnchor];
    v36 = [v40 constraintEqualToAnchor:v38 constant:2.0];
    v44[0] = v36;
    v34 = [(UILabel *)v8->_detailLabel leadingAnchor];
    v23 = [(STSummationView *)v8 leadingAnchor];
    v24 = [v34 constraintEqualToAnchor:v23 constant:16.0];
    v44[1] = v24;
    v25 = [(UILabel *)v8->_detailLabel trailingAnchor];
    v26 = [(STSummationView *)v8 trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:-16.0];
    v44[2] = v27;
    v28 = [(UILabel *)v8->_detailLabel bottomAnchor];
    v29 = [(STSummationView *)v8 bottomAnchor];
    v30 = [v28 constraintLessThanOrEqualToAnchor:v29 constant:-11.0];
    v44[3] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
    [v33 activateConstraints:v31];

    id v6 = v41;
    id v7 = v42;
  }
  return v8;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
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

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end