@interface TLKContentsView
+ (id)detailsLabel;
- (NSMutableArray)detailsLabels;
- (TLKContentsView)init;
- (TLKLabel)titleLabel;
- (void)setDetailsLabels:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateWithTitle:(id)a3 contents:(id)a4;
@end

@implementation TLKContentsView

- (TLKContentsView)init
{
  v8.receiver = self;
  v8.super_class = (Class)TLKContentsView;
  v2 = [(TLKContentsView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(TLKStackView *)v2 setAxis:1];
    v4 = objc_opt_new();
    v5 = +[TLKFontUtilities shortSubheadBoldFont];
    [v4 setFont:v5];

    [(TLKContentsView *)v3 setTitleLabel:v4];
    [(TLKStackView *)v3 addArrangedSubview:v4];
    [(NUIContainerStackView *)v3 setCustomSpacing:v4 afterView:4.0];
    v6 = objc_opt_new();
    [(TLKContentsView *)v3 setDetailsLabels:v6];
  }
  return v3;
}

+ (id)detailsLabel
{
  v2 = objc_opt_new();
  v3 = +[TLKFontUtilities shortFootnoteFont];
  [v2 setFont:v3];

  [v2 setLineBreakMode:0];
  return v2;
}

- (void)updateWithTitle:(id)a3 contents:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  v7 = [(TLKContentsView *)self titleLabel];
  [v7 setMultilineText:v30];

  objc_super v8 = [v30 text];
  v9 = [(TLKContentsView *)self titleLabel];
  [v9 setHidden:v8 == 0];

  uint64_t v10 = [v6 count];
  v11 = [(TLKContentsView *)self detailsLabels];
  uint64_t v12 = [v11 count];

  if (v10 != v12)
  {
    unint64_t v17 = [v6 count];
    v18 = [(TLKContentsView *)self detailsLabels];
    unint64_t v19 = [v18 count];

    if (v17 <= v19)
    {
      for (unint64_t i = [v6 count]; ; ++i)
      {
        v26 = [(TLKContentsView *)self detailsLabels];
        unint64_t v27 = [v26 count];

        if (i >= v27) {
          break;
        }
        v28 = [(TLKContentsView *)self detailsLabels];
        v29 = [v28 objectAtIndexedSubscript:i];
        [v29 setHidden:1];
      }
    }
    else
    {
      while (1)
      {
        v20 = [(TLKContentsView *)self detailsLabels];
        unint64_t v21 = [v20 count];
        unint64_t v22 = [v6 count];

        if (v21 >= v22) {
          break;
        }
        v23 = [(id)objc_opt_class() detailsLabel];
        v24 = [(TLKContentsView *)self detailsLabels];
        [v24 addObject:v23];

        [(TLKStackView *)self addArrangedSubview:v23];
      }
    }
  }
  if ([v6 count])
  {
    unint64_t v13 = 0;
    do
    {
      v14 = [v6 objectAtIndexedSubscript:v13];
      v15 = [(TLKContentsView *)self detailsLabels];
      v16 = [v15 objectAtIndexedSubscript:v13];
      [v16 setMultilineText:v14];

      ++v13;
    }
    while (v13 < [v6 count]);
  }
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSMutableArray)detailsLabels
{
  return self->_detailsLabels;
}

- (void)setDetailsLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end