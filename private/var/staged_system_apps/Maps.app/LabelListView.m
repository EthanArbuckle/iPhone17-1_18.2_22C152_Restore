@interface LabelListView
+ (double)heightForWidth:(double)a3 strings:(id)a4 fonts:(id)a5;
+ (double)heightForWidth:(double)a3 strings:(id)a4 fonts:(id)a5 spacings:(id)a6;
+ (id)spacingForNumberOfStrings:(unint64_t)a3;
- (LabelListView)initWithFrame:(CGRect)a3;
- (NSArray)labels;
- (UIColor)shadowColor;
- (UIColor)textColor;
- (int64_t)textAlignment;
- (void)addLabelWithText:(id)a3 accessibilityText:(id)a4 font:(id)a5;
- (void)addLabelWithText:(id)a3 attributedText:(id)a4 accessibilityText:(id)a5 font:(id)a6 color:(id)a7;
- (void)layoutToFitSize:(CGSize)a3;
- (void)layoutToFitSize:(CGSize)a3 spacings:(id)a4;
- (void)removeAllLabels;
- (void)setShadowColor:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation LabelListView

+ (double)heightForWidth:(double)a3 strings:(id)a4 fonts:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 spacingForNumberOfStrings:[v9 count]];
  [a1 heightForWidth:v9 strings:v8 fonts:v10 spacings:a3];
  double v12 = v11;

  return v12;
}

+ (double)heightForWidth:(double)a3 strings:(id)a4 fonts:(id)a5 spacings:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 count];
  if (v12)
  {
    id v13 = v12;
    unint64_t v14 = 0;
    double v15 = 0.0;
    do
    {
      v16 = [v9 objectAtIndexedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v10 objectAtIndexedSubscript:v14];
        [v16 _maps_sizeWithFont:v17 constrainedToSize:1 a3:3.40282347e38];
        double v15 = v15 + v18;

        if (v14 < (unint64_t)[v11 count])
        {
          v19 = [v11 objectAtIndexedSubscript:v14];
          [v19 floatValue];
          double v15 = v15 + v20;
        }
      }

      ++v14;
    }
    while (v13 != (id)v14);
  }
  else
  {
    double v15 = 0.0;
  }

  return v15;
}

+ (id)spacingForNumberOfStrings:(unint64_t)a3
{
  if (a3) {
    unint64_t v4 = a3 - 1;
  }
  else {
    unint64_t v4 = 0;
  }
  v5 = +[NSMutableArray arrayWithCapacity:v4];
  if (a3 >= 2)
  {
    unint64_t v6 = 0;
    do
    {
      if (v6) {
        v7 = &off_1013A7030;
      }
      else {
        v7 = &off_1013A7018;
      }
      [v5 addObject:v7];
      ++v6;
    }
    while (v6 < v4);
  }

  return v5;
}

- (LabelListView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LabelListView;
  v3 = -[LabelListView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    unint64_t v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    labels = v3->_labels;
    v3->_labels = v4;

    uint64_t v6 = +[UIColor whiteColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v6;

    v3->_textAlignment = 0;
    id v8 = v3;
  }

  return v3;
}

- (void)addLabelWithText:(id)a3 accessibilityText:(id)a4 font:(id)a5
{
}

- (void)addLabelWithText:(id)a3 attributedText:(id)a4 accessibilityText:(id)a5 font:(id)a6 color:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (UIColor *)a7;
  if (!v18) {
    goto LABEL_10;
  }
  id v15 = +[UILabel newStandardTextLabelWithFont:a6];
  [v15 setLineBreakMode:0];
  [v15 setTextAlignment:self->_textAlignment];
  [v15 setNumberOfLines:0];
  if (!v12)
  {
    [v15 setText:v18];
    if (!v13) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [v15 setAttributedText:v12];
  if (v13) {
LABEL_4:
  }
    [v15 setAccessibilityLabel:v13];
LABEL_5:
  textColor = v14;
  if (!v14) {
    textColor = self->_textColor;
  }
  [v15 setTextColor:textColor];
  if (sub_1000BBB44(self) == 5)
  {
    v17 = +[UIColor systemWhiteColor];
    [v15 setHighlightedTextColor:v17];
  }
  [v15 setShadowColor:self->_shadowColor];
  [(LabelListView *)self addSubview:v15];
  [(NSMutableArray *)self->_labels addObject:v15];

LABEL_10:
}

- (void)layoutToFitSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [objc_opt_class() spacingForNumberOfStrings:[self->_labels count]];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LabelListView layoutToFitSize:spacings:](self, "layoutToFitSize:spacings:", v6, width, height);
}

- (void)layoutToFitSize:(CGSize)a3 spacings:(id)a4
{
  double width = a3.width;
  id v19 = a4;
  [(LabelListView *)self frame];
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = (char *)[(NSMutableArray *)self->_labels count];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    double MaxY = 0.0;
    do
    {
      unint64_t v14 = [(NSMutableArray *)self->_labels objectAtIndexedSubscript:v12];
      [v14 textRectForBounds:0 limitedToNumberOfLines:0.0 width:0.0 1.79769313e308];
      double v16 = v15;
      if (v12 && v12 - 1 < [v19 count])
      {
        v17 = [v19 objectAtIndexedSubscript:v12 - 1];
        [v17 floatValue];
        double MaxY = MaxY + v18;
      }
      [v14 setFrame:CGRectMake(0.0, MaxY, width, v16)];
      v21.origin.x = 0.0;
      v21.origin.y = MaxY;
      v21.size.double width = width;
      v21.size.double height = v16;
      double MaxY = CGRectGetMaxY(v21);

      ++v12;
    }
    while (v11 != v12);
  }
  else
  {
    double MaxY = 0.0;
  }
  -[LabelListView setFrame:](self, "setFrame:", v7, v9, width, MaxY);
}

- (void)removeAllLabels
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_labels;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeFromSuperview];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_labels removeAllObjects];
}

- (void)setTextColor:(id)a3
{
  p_textColor = &self->_textColor;
  uint64_t v6 = (UIColor *)a3;
  double v7 = v6;
  if (*p_textColor != v6)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    uint64_t v6 = *p_textColor;
  }
  [(NSMutableArray *)self->_labels makeObjectsPerformSelector:"setTextColor:" withObject:v6];
}

- (void)setShadowColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_shadowColor != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_shadowColor, a3);
    [(NSMutableArray *)self->_labels makeObjectsPerformSelector:"setShadowColor:" withObject:self->_shadowColor];
    id v5 = v6;
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_labels;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setTextAlignment:self->_textAlignment v9];
          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (NSArray)labels
{
  return &self->_labels->super;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

@end