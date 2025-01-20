@interface PKPayLaterScheduleView
+ (BOOL)canFormScheduleViewForDynamincContentItem:(id)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPayLaterDynamicContentPageItem)dynamicContentItem;
- (PKPayLaterScheduleView)initWithDynamicContentItem:(id)a3;
- (double)_minimumRequiredWidthForLeadingLabels;
- (void)_configureView;
- (void)layoutSubviews;
- (void)setDynamicContentItem:(id)a3;
@end

@implementation PKPayLaterScheduleView

- (PKPayLaterScheduleView)initWithDynamicContentItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterScheduleView;
  v6 = -[PKPayLaterScheduleView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dynamicContentItem, a3);
    [(PKPayLaterScheduleView *)v7 _configureView];
  }

  return v7;
}

+ (BOOL)canFormScheduleViewForDynamincContentItem:(id)a3
{
  v3 = [a3 sections];
  v4 = [v3 firstObject];
  id v5 = [v4 rows];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)setDynamicContentItem:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dynamicContentItem, a3);
    [(PKPayLaterScheduleView *)self _configureView];
    [(PKPayLaterScheduleView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterScheduleView;
  [(PKPayLaterScheduleView *)&v3 layoutSubviews];
  [(PKPayLaterScheduleView *)self bounds];
  -[PKPayLaterScheduleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPayLaterScheduleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  memset(&v76, 0, sizeof(v76));
  CGRect remainder = a3;
  double width = a3.size.width;
  double height = a3.size.height;
  int v5 = [(PKPayLaterScheduleView *)self _shouldReverseLayoutDirection];
  if (v5) {
    CGRectEdge v6 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v6 = CGRectMinXEdge;
  }
  if (v5) {
    CGRectEdge v7 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v7 = CGRectMaxXEdge;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obj = self->_horizontalStacks;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v72;
    double v57 = *MEMORY[0x1E4F1DB30];
    double v63 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v55 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v56 = *MEMORY[0x1E4F1DAD8];
    CGSize v64 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    CGPoint v65 = (CGPoint)*MEMORY[0x1E4F1DB28];
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v72 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        v14 = [v13 trailingLabel];
        v15 = [v13 leadingLabel];
        v16 = [v13 circleView];
        v17 = v16;
        if (v14) {
          double v18 = 10.0;
        }
        else {
          double v18 = 0.0;
        }
        if (v16) {
          double v19 = 3.0;
        }
        else {
          double v19 = 0.0;
        }
        objc_msgSend(v16, "sizeThatFits:", width, height);
        double v21 = v20;
        CGFloat amount = v19;
        double v22 = width - v20 - v19;
        double v23 = fmin(v22, self->_minimimLeadingLabelWidth);
        double v24 = v57;
        double v25 = v21;
        if (v14)
        {
          objc_msgSend(v14, "sizeThatFits:", v22 - v23 - v18, 1.79769313e308);
          double v21 = v25;
        }
        BOOL v26 = v14 != 0 && v24 > v22 - v23 - v18;
        double v27 = v22 * 0.5 - v18 * 0.5;
        if (v26) {
          double v28 = v22 * 0.5 - v18 * 0.5;
        }
        else {
          double v28 = v22 - v23 - v18;
        }
        CGFloat v29 = 0.0;
        double v30 = 0.0;
        double v31 = v63;
        if (v15)
        {
          if (v26) {
            double v30 = v27;
          }
          else {
            double v30 = v23;
          }
          objc_msgSend(v15, "sizeThatFits:", v30, 1.79769313e308, v21);
          double v21 = v25;
          double v31 = v32;
        }
        CGFloat v62 = v18;
        double v33 = v63;
        if (v14)
        {
          objc_msgSend(v14, "sizeThatFits:", v28, 1.79769313e308, v21);
          double v21 = v25;
          double v33 = v34;
          CGFloat v29 = v28;
        }
        double v35 = v21 + 8.0;
        if (!v17) {
          double v35 = 0.0;
        }
        double v36 = fmax(v31, fmax(v35, v33));
        memset(&slice, 0, sizeof(slice));
        double v37 = fmax(v31, fmax(v36, v33));
        CGFloat v38 = v21;
        CGRectDivide(remainder, &slice, &remainder, v37, CGRectMinYEdge);
        v69.origin = v65;
        v69.size = v64;
        if (v17)
        {
          CGRectDivide(slice, &v69, &slice, v38, v6);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v69.origin.x = v39;
          v69.origin.y = v40;
          v69.size.double width = v41;
          v69.size.double height = v42;
          CGAffineTransformMakeScale(&v68, 0.7, 0.7);
          [v17 setTransform:&v68];
          objc_msgSend(v17, "setBounds:", v56, v55, v38, v36);
          objc_msgSend(v17, "setBounds:", v56, v55, v69.size.width, v69.size.height);
          double MidX = CGRectGetMidX(v69);
          objc_msgSend(v17, "setCenter:", MidX, CGRectGetMidY(v69));
        }
        CGRectDivide(slice, &v76, &slice, amount, v6);
        v67.origin = v65;
        v67.size = v64;
        if (v15)
        {
          CGRectDivide(slice, &v67, &slice, v30, v6);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v67.origin.x = v44;
          v67.origin.y = v45;
          v67.size.double width = v46;
          v67.size.double height = v47;
        }
        CGRectDivide(slice, &v76, &slice, v62, v6);
        v66.origin = v65;
        v66.size = v64;
        if (v14)
        {
          CGRectDivide(slice, &v66, &slice, v29, v7);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v66.origin.x = v48;
          v66.origin.y = v49;
          v66.size.double width = v50;
          v66.size.double height = v51;
        }
        if (!a4)
        {
          objc_msgSend(v17, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
          objc_msgSend(v15, "setFrame:", v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
          objc_msgSend(v14, "setFrame:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);
        }
        [v17 setNeedsDisplay];
        double v11 = v11 + v37;
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  double v52 = width;
  double v53 = v11;
  result.double height = v53;
  result.double width = v52;
  return result;
}

- (void)_configureView
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  double v3 = self->_horizontalStacks;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v9 = [v8 allViews];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v54 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v53 + 1) + 8 * j) removeFromSuperview];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v53 objects:v63 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v5);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = [(PKPayLaterDynamicContentPageItem *)self->_dynamicContentItem sections];
  v16 = [v15 firstObject];

  v17 = [v16 rows];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    unint64_t v19 = 0;
    do
    {
      double v20 = [v16 rows];
      double v21 = [v20 objectAtIndexedSubscript:v19];

      if (v19)
      {
        double v22 = [v16 rows];
        if (v19 + 1 == [v22 count]) {
          uint64_t v23 = 2;
        }
        else {
          uint64_t v23 = 1;
        }
      }
      else
      {
        uint64_t v23 = 0;
      }
      double v24 = [PKPayLaterScheduleHorizontalStack alloc];
      double v25 = [v21 contentTitle];
      BOOL v26 = [v21 contentDetailTrailing];
      double v27 = [(PKPayLaterScheduleHorizontalStack *)v24 initWithLeadingText:v25 trailingText:v26 stackIndex:v23];

      [v14 safelyAddObject:v27];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      double v28 = [(PKPayLaterScheduleHorizontalStack *)v27 allViews];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v62 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v50;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v50 != v31) {
              objc_enumerationMutation(v28);
            }
            [(PKPayLaterScheduleView *)self addSubview:*(void *)(*((void *)&v49 + 1) + 8 * k)];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v62 count:16];
        }
        while (v30);
      }

      ++v19;
      double v33 = [v16 rows];
      unint64_t v34 = [v33 count];
    }
    while (v19 < v34);
  }
  double v35 = (NSArray *)[v14 copy];
  horizontalStacks = self->_horizontalStacks;
  self->_horizontalStacks = v35;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  double v37 = self->_horizontalStacks;
  uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v46;
    double v41 = 0.0;
    do
    {
      for (uint64_t m = 0; m != v39; ++m)
      {
        if (*(void *)v46 != v40) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * m) minimumLeadingLabelWidth];
        double v41 = fmax(v41, v43);
      }
      uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v45 objects:v61 count:16];
    }
    while (v39);
  }

  PKFloatCeilToPixel();
  self->_minimimLeadingLabelWidth = v44;
  [(PKPayLaterScheduleView *)self setAccessibilityIdentifier:*MEMORY[0x1E4F85960]];
}

- (double)_minimumRequiredWidthForLeadingLabels
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_horizontalStacks;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "minimumLeadingLabelWidth", (void)v10);
        double v6 = fmax(v6, v8);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  PKFloatCeilToPixel();
  return result;
}

- (PKPayLaterDynamicContentPageItem)dynamicContentItem
{
  return self->_dynamicContentItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentItem, 0);

  objc_storeStrong((id *)&self->_horizontalStacks, 0);
}

@end