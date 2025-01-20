@interface PKFamilyMemberTableViewCell
- (PKFamilyMemberRowModel)rowModel;
- (void)prepareForReuse;
- (void)setRowModel:(id)a3;
@end

@implementation PKFamilyMemberTableViewCell

- (void)setRowModel:(id)a3
{
  id v19 = a3;
  v4 = [(PKFamilyMemberTableViewCell *)self defaultContentConfiguration];
  v5 = [v19 titleText];
  [v4 setText:v5];

  v6 = [v19 image];
  [v4 setImage:v6];

  v7 = [v19 detailText];
  [v4 setSecondaryText:v7];

  uint64_t v8 = [v19 cellStyle];
  if (v8)
  {
    if (v8 == 1)
    {
      v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
      [v4 setPrefersSideBySideTextAndSecondaryText:1];
      double v10 = 0.0;
      double v11 = 5.0;
      double v12 = 10.0;
      double v13 = 35.0;
      double v14 = 35.0;
      double v15 = 5.0;
    }
    else
    {
      v9 = 0;
      double v15 = *MEMORY[0x1E4FB12A8];
      double v10 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
      double v11 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
      double v12 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
      double v14 = *MEMORY[0x1E4F1DB30];
      double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    double v11 = 10.0;
    double v12 = 0.0;
    double v13 = 40.0;
    double v14 = 40.0;
    double v10 = 0.0;
    double v15 = 10.0;
  }
  objc_msgSend(v4, "setDirectionalLayoutMargins:", v15, v10, v11, v12);
  v16 = [v4 imageProperties];
  objc_msgSend(v16, "setMaximumSize:", v14, v13);
  v17 = [v4 secondaryTextProperties];
  v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v17 setColor:v18];

  [v17 setFont:v9];
  [(PKFamilyMemberTableViewCell *)self setContentConfiguration:v4];
  -[PKFamilyMemberTableViewCell setAccessoryType:](self, "setAccessoryType:", [v19 accessoryType]);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKFamilyMemberTableViewCell;
  [(PKFamilyMemberTableViewCell *)&v3 prepareForReuse];
  [(PKFamilyMemberTableViewCell *)self setAccessoryType:0];
}

- (PKFamilyMemberRowModel)rowModel
{
  return self->_rowModel;
}

- (void).cxx_destruct
{
}

@end