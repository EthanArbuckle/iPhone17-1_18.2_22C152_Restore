@interface SearchUIScreenTimeView
- (SearchUIScreenTimeView)init;
- (TLKLabel)label;
- (void)setLabel:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIScreenTimeView

- (SearchUIScreenTimeView)init
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUIScreenTimeView;
  v2 = [(SearchUIScreenTimeView *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(NUIContainerStackView *)v2 setAlignment:3];
    +[SearchUIUtilities standardTableCellContentInset];
    double v5 = v4;
    +[SearchUIUtilities standardTableCellContentInset];
    -[SearchUIScreenTimeView setLayoutMargins:](v3, "setLayoutMargins:", 36.0, v5, 36.0, v6);
    [(SearchUIScreenTimeView *)v3 setLayoutMarginsRelativeArrangement:1];
    [(NUIContainerStackView *)v3 setSpacing:12.0];
    v7 = +[SearchUIUtilities imageForBlockedApp];
    v8 = +[SearchUIImageView imageViewWithImage:v7];

    +[SearchUIAutoLayout requireIntrinsicSizeForView:v8];
    [(SearchUIScreenTimeView *)v3 addArrangedSubview:v8];
    v9 = [MEMORY[0x1E4FAE0F8] secondaryLabel];
    v10 = [MEMORY[0x1E4FAE090] shortSubheadFont];
    [v9 setFont:v10];

    [v9 setNumberOfLines:0];
    [(SearchUIScreenTimeView *)v3 addArrangedSubview:v9];
    [(SearchUIScreenTimeView *)v3 setLabel:v9];
  }
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v5 = [a3 title];
  double v4 = [(SearchUIScreenTimeView *)self label];
  [v4 setText:v5];
}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end