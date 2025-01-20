@interface PKDynamicPassBucketView
- (CGSize)_measureAndFitEvenlySizedSubviewsForSize:(CGSize)a3;
- (CGSize)_measureAndFitVariablySizedSubviewsForSize:(CGSize)a3;
- (CGSize)fittedSizeFor:(CGSize)a3;
- (NSArray)bucket;
- (NSString)labelBlendMode;
- (NSString)valueBlendMode;
- (PKDynamicPassBucketView)initWithBucket:(id)a3;
- (UIColor)labelTextColor;
- (UIColor)valueTextColor;
- (UIFont)labelFont;
- (UIFont)resizedValueFont;
- (UIFont)valueFont;
- (double)minResizeScale;
- (double)spacing;
- (double)verticalPadding;
- (id)_fieldViewsByWidth;
- (int64_t)distribution;
- (int64_t)layoutDirection;
- (int64_t)sizingRule;
- (void)_createFieldViewsIfNecessary;
- (void)layoutSubviews;
- (void)setDistribution:(int64_t)a3;
- (void)setLabelBlendMode:(id)a3;
- (void)setLabelFont:(id)a3;
- (void)setLabelTextColor:(id)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setMinResizeScale:(double)a3;
- (void)setSizingRule:(int64_t)a3;
- (void)setSpacing:(double)a3;
- (void)setValueBlendMode:(id)a3;
- (void)setValueFont:(id)a3;
- (void)setValueTextColor:(id)a3;
- (void)setVerticalPadding:(double)a3;
@end

@implementation PKDynamicPassBucketView

- (PKDynamicPassBucketView)initWithBucket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDynamicPassBucketView;
  v6 = [(PKDynamicPassBucketView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bucket, a3);
  }

  return v7;
}

- (void)setLabelTextColor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIColor *)self->_labelTextColor CGColor];
  id v6 = v4;
  if (!CGColorEqualToColor(v5, (CGColorRef)[v6 CGColor]))
  {
    objc_storeStrong((id *)&self->_labelTextColor, v6);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = self->_fieldViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setLabelTextColor:", v6, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)setLabelBlendMode:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self->_labelBlendMode;
  v7 = (NSString *)v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      BOOL v9 = [(NSString *)v6 isEqualToString:v7];

      if (v9) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_labelBlendMode, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = self->_fieldViews;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setLabelBlendMode:", v8, (void)v15);
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
LABEL_16:
}

- (void)setValueTextColor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIColor *)self->_valueTextColor CGColor];
  id v6 = v4;
  if (!CGColorEqualToColor(v5, (CGColorRef)[v6 CGColor]))
  {
    objc_storeStrong((id *)&self->_valueTextColor, v6);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = self->_fieldViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setValueTextColor:", v6, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)setValueBlendMode:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self->_valueBlendMode;
  v7 = (NSString *)v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      BOOL v9 = [(NSString *)v6 isEqualToString:v7];

      if (v9) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_valueBlendMode, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = self->_fieldViews;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setValueBlendMode:", v8, (void)v15);
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
LABEL_16:
}

- (void)layoutSubviews
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)PKDynamicPassBucketView;
  [(PKDynamicPassBucketView *)&v59 layoutSubviews];
  if ([(NSArray *)self->_bucket count])
  {
    [(PKDynamicPassBucketView *)self _createFieldViewsIfNecessary];
    [(PKDynamicPassBucketView *)self bounds];
    double v5 = v3;
    int64_t sizingRule = self->_sizingRule;
    if (sizingRule == 1)
    {
      -[PKDynamicPassBucketView _measureAndFitEvenlySizedSubviewsForSize:](self, "_measureAndFitEvenlySizedSubviewsForSize:", v3, v4);
    }
    else if (!sizingRule)
    {
      -[PKDynamicPassBucketView _measureAndFitVariablySizedSubviewsForSize:](self, "_measureAndFitVariablySizedSubviewsForSize:", v3, v4);
    }
    int64_t layoutDirection = self->_layoutDirection;
    int64_t distribution = self->_distribution;
    if (distribution == 1)
    {
      NSUInteger v23 = [(NSArray *)self->_fieldViews count];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v24 = self->_fieldViews;
      uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v51 objects:v61 count:16];
      double v26 = 0.0;
      double v27 = 0.0;
      if (v25)
      {
        uint64_t v28 = v25;
        uint64_t v29 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v52 != v29) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v51 + 1) + 8 * i) frame];
            double v27 = v27 + v31 + self->_spacing;
          }
          uint64_t v28 = [(NSArray *)v24 countByEnumeratingWithState:&v51 objects:v61 count:16];
        }
        while (v28);
      }

      double v32 = v5 - (v27 - self->_spacing);
      if (v32 > 0.0 && v23 >= 2) {
        double v26 = v32 / (double)(v23 - 1);
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      BOOL v9 = self->_fieldViews;
      uint64_t v34 = [(NSArray *)v9 countByEnumeratingWithState:&v47 objects:v60 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        if (layoutDirection != 1) {
          double v5 = 0.0;
        }
        uint64_t v36 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v48 != v36) {
              objc_enumerationMutation(v9);
            }
            v38 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            objc_msgSend(v38, "frame", (void)v47);
            double v41 = v39;
            double v42 = v40;
            if (layoutDirection == 1) {
              double v44 = v5 - v39;
            }
            else {
              double v44 = v5;
            }
            uint64_t v45 = 0;
            if (layoutDirection == 1)
            {
              double v43 = v5 - v39;
              double v5 = CGRectGetMinX(*(CGRect *)(&v39 - 2)) - v26 - self->_spacing;
            }
            else
            {
              double v46 = v5;
              double v5 = v26 + CGRectGetMaxX(*(CGRect *)(&v39 - 2)) + self->_spacing;
            }
            objc_msgSend(v38, "setFrame:", v44, 0.0, v41, v42);
          }
          uint64_t v35 = [(NSArray *)v9 countByEnumeratingWithState:&v47 objects:v60 count:16];
        }
        while (v35);
      }
    }
    else
    {
      if (distribution) {
        return;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      BOOL v9 = self->_fieldViews;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        if (layoutDirection != 1) {
          double v5 = 0.0;
        }
        uint64_t v12 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v11; ++k)
          {
            if (*(void *)v56 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v55 + 1) + 8 * k);
            [v14 frame];
            double v17 = v15;
            double v18 = v16;
            if (layoutDirection == 1) {
              double v20 = v5 - v15;
            }
            else {
              double v20 = v5;
            }
            uint64_t v21 = 0;
            if (layoutDirection == 1)
            {
              double v19 = v5 - v15;
              double v5 = CGRectGetMinX(*(CGRect *)(&v15 - 2)) - self->_spacing;
            }
            else
            {
              double v22 = v5;
              double v5 = CGRectGetMaxX(*(CGRect *)(&v15 - 2)) + self->_spacing;
            }
            objc_msgSend(v14, "setFrame:", v20, 0.0, v17, v18);
          }
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v55 objects:v62 count:16];
        }
        while (v11);
      }
    }
  }
}

- (CGSize)fittedSizeFor:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKDynamicPassBucketView *)self _createFieldViewsIfNecessary];
  int64_t sizingRule = self->_sizingRule;
  if (sizingRule == 1)
  {
    -[PKDynamicPassBucketView _measureAndFitEvenlySizedSubviewsForSize:](self, "_measureAndFitEvenlySizedSubviewsForSize:", width, height);
  }
  else if (!sizingRule)
  {
    -[PKDynamicPassBucketView _measureAndFitVariablySizedSubviewsForSize:](self, "_measureAndFitVariablySizedSubviewsForSize:", width, height);
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)_createFieldViewsIfNecessary
{
  if (![(NSArray *)self->_fieldViews count])
  {
    sortedFieldViews = self->_sortedFieldViews;
    self->_sortedFieldViews = (NSArray *)MEMORY[0x1E4F1CBF0];

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bucket = self->_bucket;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __55__PKDynamicPassBucketView__createFieldViewsIfNecessary__block_invoke;
    uint64_t v12 = &unk_1E59CD910;
    uint64_t v13 = self;
    id v14 = v4;
    id v6 = v4;
    [(NSArray *)bucket enumerateObjectsUsingBlock:&v9];
    double v7 = (NSArray *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
    fieldViews = self->_fieldViews;
    self->_fieldViews = v7;
  }
}

void __55__PKDynamicPassBucketView__createFieldViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = [[_PKSimpleFieldView alloc] initWithField:v3];

  [*(id *)(a1 + 32) verticalPadding];
  -[_PKSimpleFieldView setVerticalPadding:](v10, "setVerticalPadding:");
  id v4 = [*(id *)(a1 + 32) labelFont];
  [(_PKSimpleFieldView *)v10 setLabelFont:v4];

  double v5 = [*(id *)(a1 + 32) labelTextColor];
  [(_PKSimpleFieldView *)v10 setLabelTextColor:v5];

  id v6 = [*(id *)(a1 + 32) labelBlendMode];
  [(_PKSimpleFieldView *)v10 setLabelBlendMode:v6];

  double v7 = [*(id *)(a1 + 32) valueFont];
  [(_PKSimpleFieldView *)v10 setValueFont:v7];

  uint64_t v8 = [*(id *)(a1 + 32) valueTextColor];
  [(_PKSimpleFieldView *)v10 setValueTextColor:v8];

  uint64_t v9 = [*(id *)(a1 + 32) valueBlendMode];
  [(_PKSimpleFieldView *)v10 setValueBlendMode:v9];

  [*(id *)(a1 + 40) addObject:v10];
  [*(id *)(a1 + 32) addSubview:v10];
}

- (CGSize)_measureAndFitEvenlySizedSubviewsForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  [(PKDynamicPassBucketView *)self bounds];
  if (v7 == width)
  {
    double v9 = v8;
    double v10 = v7;
  }
  else
  {
    uint64_t v11 = [(NSArray *)self->_fieldViews count];
    double spacing = self->_spacing;
    uint64_t v13 = self->_valueFont;
    resizedValueFont = self->_resizedValueFont;
    self->_resizedValueFont = 0;

    [(UIFont *)v13 pointSize];
    double v71 = v15;
    double minResizeScale = self->_minResizeScale;
    double v17 = [(PKDynamicPassBucketView *)self labelFont];
    [v17 capHeight];
    double v19 = v18;
    [(UIFont *)v13 capHeight];
    double v21 = v19 / v20;
    if (minResizeScale > v19 / v20)
    {
      double v25 = self->_minResizeScale;
    }
    else
    {
      id v3 = [(PKDynamicPassBucketView *)self labelFont];
      [v3 capHeight];
      double v23 = v22;
      [(UIFont *)v13 capHeight];
      double v25 = v23 / v24;
    }
    double v70 = 1.0;
    if (v25 <= 1.0)
    {
      double v26 = self->_minResizeScale;
      double v27 = [(PKDynamicPassBucketView *)self labelFont];
      [v27 capHeight];
      double v29 = v28;
      [(UIFont *)v13 capHeight];
      if (v26 <= v29 / v30)
      {
        double v31 = [(PKDynamicPassBucketView *)self labelFont];
        [v31 capHeight];
        double v33 = v32;
        [(UIFont *)v13 capHeight];
        double v70 = v33 / v34;
      }
      else
      {
        double v70 = self->_minResizeScale;
      }
    }
    if (minResizeScale <= v21) {

    }
    double v72 = height;
    double v10 = width;
    double v35 = (width - (double)(v11 - 1) * spacing) / (double)v11;

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v36 = self->_fieldViews;
    uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v77 objects:v82 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v78;
      double v40 = *MEMORY[0x1E4F1DAD8];
      double v41 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v9 = 0.0;
      double v42 = v71;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v78 != v39) {
            objc_enumerationMutation(v36);
          }
          double v44 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          [v44 setValueFont:v13];
          objc_msgSend(v44, "sizeThatFits:", v10, v72);
          double v46 = v45;
          double v48 = v47;
          objc_msgSend(v44, "setFrame:", v40, v41, v45, v47);
          long long v49 = [v44 valueLabel];
          objc_msgSend(v49, "sizeThatFits:", v46, v48);
          double v51 = v50;

          if (v51 > v35)
          {
            double v52 = v35 / v51;
            if (v35 / v51 <= v70) {
              double v52 = v70;
            }
            double v53 = floor(v71 * v52);
            if (v53 < v42) {
              double v42 = v53;
            }
          }
          if (v9 <= v48) {
            double v9 = v48;
          }
        }
        uint64_t v38 = [(NSArray *)v36 countByEnumeratingWithState:&v77 objects:v82 count:16];
      }
      while (v38);
    }
    else
    {
      double v9 = 0.0;
      double v42 = v71;
    }

    if (v42 != v71)
    {
      long long v54 = (void *)MEMORY[0x1E4FB08E0];
      long long v55 = [(UIFont *)v13 fontDescriptor];
      long long v56 = [v54 fontWithDescriptor:v55 size:v42];

      objc_storeStrong((id *)&self->_resizedValueFont, v56);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v57 = self->_fieldViews;
      uint64_t v58 = [(NSArray *)v57 countByEnumeratingWithState:&v73 objects:v81 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v74;
        double v61 = *MEMORY[0x1E4F1DAD8];
        double v62 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v9 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v59; ++j)
          {
            if (*(void *)v74 != v60) {
              objc_enumerationMutation(v57);
            }
            v64 = *(void **)(*((void *)&v73 + 1) + 8 * j);
            [v64 setValueFont:v56];
            objc_msgSend(v64, "sizeThatFits:", v35, v72);
            double v66 = v65;
            objc_msgSend(v64, "setFrame:", v61, v62, v67, v65);
            if (v9 <= v66) {
              double v9 = v66;
            }
          }
          uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v73 objects:v81 count:16];
        }
        while (v59);
      }
      else
      {
        double v9 = 0.0;
      }
    }
  }
  double v68 = v10;
  double v69 = v9;
  result.CGFloat height = v69;
  result.double width = v68;
  return result;
}

- (CGSize)_measureAndFitVariablySizedSubviewsForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  [(PKDynamicPassBucketView *)self bounds];
  if (v7 == width)
  {
    double v9 = v8;
    double width = v7;
    goto LABEL_48;
  }
  double v82 = height;
  NSUInteger v10 = [(NSArray *)self->_fieldViews count];
  double spacing = self->_spacing;
  uint64_t v12 = self->_valueFont;
  resizedValueFont = self->_resizedValueFont;
  self->_resizedValueFont = 0;

  double minResizeScale = self->_minResizeScale;
  double v15 = [(PKDynamicPassBucketView *)self labelFont];
  [v15 capHeight];
  double v17 = v16;
  [(UIFont *)v12 capHeight];
  double v19 = v17 / v18;
  if (minResizeScale > v17 / v18)
  {
    double v23 = self->_minResizeScale;
  }
  else
  {
    id v3 = [(PKDynamicPassBucketView *)self labelFont];
    [v3 capHeight];
    double v21 = v20;
    [(UIFont *)v12 capHeight];
    double v23 = v21 / v22;
  }
  uint64_t v24 = v10 - 1;
  double v25 = 1.0;
  if (v23 <= 1.0)
  {
    double v26 = self->_minResizeScale;
    double v27 = [(PKDynamicPassBucketView *)self labelFont];
    [v27 capHeight];
    double v29 = v28;
    [(UIFont *)v12 capHeight];
    if (v26 <= v29 / v30)
    {
      double v31 = [(PKDynamicPassBucketView *)self labelFont];
      [v31 capHeight];
      double v33 = v32;
      [(UIFont *)v12 capHeight];
      double v25 = v33 / v34;
    }
    else
    {
      double v25 = self->_minResizeScale;
    }
  }
  if (minResizeScale <= v19) {

  }
  double v35 = width - (double)v24 * spacing;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v36 = self->_fieldViews;
  uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v90 objects:v95 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    double v80 = v25;
    double v81 = width - (double)v24 * spacing;
    uint64_t v39 = *(void *)v91;
    double v40 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v83 = *MEMORY[0x1E4F1DAD8];
    double v9 = 0.0;
    double v41 = 0.0;
    double v42 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v91 != v39) {
          objc_enumerationMutation(v36);
        }
        double v44 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        [v44 setValueFont:v12];
        objc_msgSend(v44, "sizeThatFits:", width, v82);
        double v46 = v45;
        double v48 = v47;
        objc_msgSend(v44, "setFrame:", v83, v40, v45, v47);
        double v42 = v42 + v46;
        long long v49 = [v44 labelLabel];
        objc_msgSend(v49, "sizeThatFits:", v46, v48);
        double v50 = width;
        double v52 = v51;

        double v53 = [v44 valueLabel];
        objc_msgSend(v53, "sizeThatFits:", v46, v48);
        double v55 = v54;

        BOOL v56 = v52 < v55;
        double width = v50;
        double v57 = -0.0;
        if (v56) {
          double v57 = v55;
        }
        double v41 = v41 + v57;
        if (v9 <= v48) {
          double v9 = v48;
        }
      }
      uint64_t v38 = [(NSArray *)v36 countByEnumeratingWithState:&v90 objects:v95 count:16];
    }
    while (v38);

    double v35 = v81;
    if (v42 <= v81 || v41 <= 0.0) {
      goto LABEL_42;
    }
    [(UIFont *)v12 pointSize];
    double v59 = (v81 - (v42 - v41)) / v41;
    if (v59 < v80) {
      double v59 = v80;
    }
    float v60 = v59 * v58;
    double v61 = floorf(v60);
    double v62 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v63 = [(UIFont *)v12 fontDescriptor];
    uint64_t v36 = [v62 fontWithDescriptor:v63 size:v61];

    objc_storeStrong((id *)&self->_resizedValueFont, v36);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v64 = self->_fieldViews;
    uint64_t v65 = [(NSArray *)v64 countByEnumeratingWithState:&v86 objects:v94 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v87;
      double v9 = 0.0;
      double v42 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v87 != v67) {
            objc_enumerationMutation(v64);
          }
          double v69 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          [v69 setValueFont:v36];
          objc_msgSend(v69, "sizeThatFits:", width, v82);
          double v71 = v70;
          double v73 = v72;
          objc_msgSend(v69, "setFrame:", v83, v40, v70, v72);
          double v42 = v42 + v71;
          if (v9 <= v73) {
            double v9 = v73;
          }
        }
        uint64_t v66 = [(NSArray *)v64 countByEnumeratingWithState:&v86 objects:v94 count:16];
      }
      while (v66);
    }
    else
    {
      double v9 = 0.0;
      double v42 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
    double v42 = 0.0;
  }

LABEL_42:
  if (v42 > v35)
  {
    long long v74 = [(PKDynamicPassBucketView *)self _fieldViewsByWidth];
    long long v75 = 0;
    uint64_t v76 = [v74 count] - 1;
    do
    {
      long long v77 = v75;
      long long v75 = [v74 objectAtIndex:v76];

      [v75 frame];
      memset(&remainder, 0, sizeof(remainder));
      memset(&slice, 0, sizeof(slice));
      CGRectDivide(v98, &slice, &remainder, v42 - v35, CGRectMaxXEdge);
      objc_msgSend(v75, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      if (!v76) {
        break;
      }
      double v42 = v42 - slice.size.width;
      --v76;
    }
    while (v42 > v35);
  }
LABEL_48:
  double v78 = width;
  double v79 = v9;
  result.CGFloat height = v79;
  result.double width = v78;
  return result;
}

- (id)_fieldViewsByWidth
{
  if (![(NSArray *)self->_sortedFieldViews count])
  {
    id v3 = [(NSArray *)self->_fieldViews sortedArrayUsingComparator:&__block_literal_global_242];
    sortedFieldViews = self->_sortedFieldViews;
    self->_sortedFieldViews = v3;
  }
  double v5 = self->_sortedFieldViews;

  return v5;
}

uint64_t __45__PKDynamicPassBucketView__fieldViewsByWidth__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 bounds];
  double v6 = v5;
  [v4 bounds];
  double v8 = v7;

  if (v6 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 > v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (NSArray)bucket
{
  return self->_bucket;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_int64_t layoutDirection = a3;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (void)setDistribution:(int64_t)a3
{
  self->_int64_t distribution = a3;
}

- (int64_t)sizingRule
{
  return self->_sizingRule;
}

- (void)setSizingRule:(int64_t)a3
{
  self->_int64_t sizingRule = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_double spacing = a3;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (NSString)labelBlendMode
{
  return self->_labelBlendMode;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
}

- (UIColor)valueTextColor
{
  return self->_valueTextColor;
}

- (NSString)valueBlendMode
{
  return self->_valueBlendMode;
}

- (double)minResizeScale
{
  return self->_minResizeScale;
}

- (void)setMinResizeScale:(double)a3
{
  self->_double minResizeScale = a3;
}

- (UIFont)resizedValueFont
{
  return self->_resizedValueFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizedValueFont, 0);
  objc_storeStrong((id *)&self->_valueBlendMode, 0);
  objc_storeStrong((id *)&self->_valueTextColor, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_labelBlendMode, 0);
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_sortedFieldViews, 0);

  objc_storeStrong((id *)&self->_fieldViews, 0);
}

@end