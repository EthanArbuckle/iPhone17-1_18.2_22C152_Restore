@interface NTKCFaceDetailActionCell
+ (double)rowHeight;
- (NTKCFaceDetailActionCell)initWithAction:(int64_t)a3;
- (void)layoutSubviews;
@end

@implementation NTKCFaceDetailActionCell

+ (double)rowHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:44.0];
  double v4 = v3;

  return v4;
}

- (NTKCFaceDetailActionCell)initWithAction:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKCFaceDetailActionCell;
  double v4 = [(NTKCDetailTableViewCell *)&v16 init];
  v5 = v4;
  if (v4)
  {
    [(NTKCFaceDetailActionCell *)v4 setSelectionStyle:3];
    v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(NTKCFaceDetailActionCell *)v5 setBackgroundColor:v6];

    [(NTKCDetailTableViewCell *)v5 setShowsSeparator:1];
    -[NTKCFaceDetailActionCell setSeparatorInset:](v5, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    uint64_t v7 = objc_opt_new();
    topSeparator = v5->_topSeparator;
    v5->_topSeparator = (NTKCSeparatorView *)v7;

    [(NTKCFaceDetailActionCell *)v5 addSubview:v5->_topSeparator];
    if (a3 == 1)
    {
      v10 = NTKCCustomizationLocalizedString(@"ACTION_REMOVE", @"Remove", v9);
      uint64_t v11 = NTKCRemoveColor();
    }
    else
    {
      if (a3)
      {
        v10 = 0;
        v12 = 0;
        goto LABEL_8;
      }
      v10 = NTKCCustomizationLocalizedString(@"ACTION_SET_CURRENT", @"Select", v9);
      uint64_t v11 = NTKCActionColor();
    }
    v12 = (void *)v11;
LABEL_8:
    v13 = [(NTKCFaceDetailActionCell *)v5 textLabel];
    [v13 setText:v10];

    v14 = [(NTKCFaceDetailActionCell *)v5 textLabel];
    [v14 setTextColor:v12];
  }
  return v5;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)NTKCFaceDetailActionCell;
  [(NTKCDetailTableViewCell *)&v30 layoutSubviews];
  [(NTKCFaceDetailActionCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int IsRTL = CLKLayoutIsRTL();
  [(NTKCSeparatorView *)self->_topSeparator frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  [(NTKCFaceDetailActionCell *)self separatorInset];
  CGFloat v19 = v6 + v18;
  CGFloat v22 = v8 - (v20 + v21);
  v31.size.height = v10 - (v18 + v23);
  v31.origin.x = v4 + v20;
  v31.origin.y = v19;
  v31.size.width = v22;
  double Width = CGRectGetWidth(v31);
  if (IsRTL)
  {
    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    double v25 = CGRectGetWidth(v32);
    v33.origin.x = v13;
    v33.origin.y = v15;
    v33.size.width = Width;
    v33.size.height = v17;
    double v26 = v25 - CGRectGetWidth(v33);
    [(NTKCFaceDetailActionCell *)self separatorInset];
    double v28 = v26 - v27;
  }
  else
  {
    [(NTKCFaceDetailActionCell *)self separatorInset];
    double v28 = v29;
  }
  -[NTKCSeparatorView setFrame:](self->_topSeparator, "setFrame:", v28, 0.0, Width, v17);
}

- (void).cxx_destruct
{
}

@end