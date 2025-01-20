@interface ExplanationCollectionViewCell
- (ExplanationCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILabel)bodyLabel;
- (UILabel)headerLabel;
- (void)layoutSubviews;
@end

@implementation ExplanationCollectionViewCell

- (ExplanationCollectionViewCell)initWithFrame:(CGRect)a3
{
  v39[7] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)ExplanationCollectionViewCell;
  v3 = -[ExplanationCollectionViewCell initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v4;

    [(UILabel *)v3->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_headerLabel setTextColor:v6];

    [(UILabel *)v3->_headerLabel setTextAlignment:1];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v7;

    [(UILabel *)v3->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_bodyLabel setTextColor:v9];

    [(UILabel *)v3->_bodyLabel setNumberOfLines:0];
    [(UILabel *)v3->_bodyLabel setTextAlignment:1];
    v37 = [(ExplanationCollectionViewCell *)v3 contentView];
    v10 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
    [v37 setBackgroundColor:v10];

    [v37 _setOverrideUserInterfaceStyle:2];
    [v37 _setContinuousCornerRadius:8.0];
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v37, "setLayoutMargins:");
    [v37 addSubview:v3->_headerLabel];
    [v37 addSubview:v3->_bodyLabel];
    v11 = [v37 layoutMarginsGuide];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(UILabel *)v3->_headerLabel leadingAnchor];
    v35 = [v11 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v39[0] = v34;
    v33 = [(UILabel *)v3->_headerLabel trailingAnchor];
    v32 = [v11 trailingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v39[1] = v31;
    v30 = [(UILabel *)v3->_headerLabel topAnchor];
    v29 = [v11 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v39[2] = v28;
    v26 = [(UILabel *)v3->_bodyLabel topAnchor];
    v25 = [(UILabel *)v3->_headerLabel bottomAnchor];
    v24 = [v26 constraintEqualToSystemSpacingBelowAnchor:v25 multiplier:1.0];
    v39[3] = v24;
    v23 = [(UILabel *)v3->_bodyLabel leadingAnchor];
    v22 = [v11 leadingAnchor];
    v12 = [v23 constraintEqualToAnchor:v22];
    v39[4] = v12;
    v13 = [(UILabel *)v3->_bodyLabel trailingAnchor];
    v14 = [v11 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v39[5] = v15;
    v16 = [(UILabel *)v3->_bodyLabel bottomAnchor];
    v17 = [v11 bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v39[6] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];
    [v27 activateConstraints:v19];

    v20 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ExplanationCollectionViewCell;
  [(ExplanationCollectionViewCell *)&v5 layoutSubviews];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [(UILabel *)self->_headerLabel setFont:v3];

  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_bodyLabel setFont:v4];

  [(UILabel *)self->_bodyLabel bounds];
  [(UILabel *)self->_bodyLabel setPreferredMaxLayoutWidth:CGRectGetWidth(v6)];
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end