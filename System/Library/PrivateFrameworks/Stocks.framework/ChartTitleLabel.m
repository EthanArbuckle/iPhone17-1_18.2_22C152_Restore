@interface ChartTitleLabel
- (ChartTitleLabel)init;
- (void)_stockWillBeRemoved:(id)a3;
- (void)layoutSubviews;
- (void)prepareStringsForDeferredStockIfNeeded;
- (void)prepareStringsWithStock:(id)a3 width:(double)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLabelsHidden:(BOOL)a3;
- (void)setOpaque:(BOOL)a3;
@end

@implementation ChartTitleLabel

- (ChartTitleLabel)init
{
  v9.receiver = self;
  v9.super_class = (Class)ChartTitleLabel;
  v2 = [(ChartTitleLabel *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(LabelSequenceView);
    leftView = v2->_leftView;
    v2->_leftView = v3;

    [(ChartTitleLabel *)v2 addSubview:v3];
    v5 = objc_alloc_init(LabelSequenceView);
    rightView = v2->_rightView;
    v2->_rightView = v5;

    [(ChartTitleLabel *)v2 addSubview:v5];
    v7 = [(ChartTitleLabel *)v2 layer];
    [v7 setNeedsLayoutOnGeometryChange:0];
  }
  return v2;
}

- (void)setLabelsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  -[LabelSequenceView setHidden:](self->_leftView, "setHidden:");
  rightView = self->_rightView;

  [(LabelSequenceView *)rightView setHidden:v3];
}

- (void)layoutSubviews
{
  [(ChartTitleLabel *)self bounds];
  CGFloat y = v21.origin.y;
  double height = v21.size.height;
  double v6 = v5 + -32.0;
  v21.origin.x = 16.0;
  v21.size.width = v5 + -32.0;
  if (!CGRectIsEmpty(v21))
  {
    [(LabelSequenceView *)self->_leftView requiredSize];
    double v8 = v7;
    double v10 = v9;
    [(LabelSequenceView *)self->_rightView requiredSize];
    double v13 = v11;
    if (v12 > height) {
      double v13 = v11 * ((v12 - (v12 - height)) / v12);
    }
    if (v10 > height) {
      double v8 = v8 * ((v10 - (v10 - height)) / v10);
    }
    double v14 = v6 - v8 - v13;
    if (v14 < 15.0)
    {
      double v15 = 15.0 - v14;
      double v16 = v8 / (v13 + v8);
      double v8 = v8 - v16 * v15;
      double v13 = v13 - (1.0 - v16) * v15;
    }
    -[LabelSequenceView setFrame:](self->_leftView, "setFrame:", 16.0, 0.0, v8, height);
    v22.origin.x = 16.0;
    v22.origin.CGFloat y = y;
    v22.size.width = v6;
    v22.size.double height = height;
    CGFloat MaxX = CGRectGetMaxX(v22);
    rightView = self->_rightView;
    double v19 = MaxX - v13;
    -[LabelSequenceView setFrame:](rightView, "setFrame:", v19, 0.0, v13, height);
  }
}

- (void)prepareStringsWithStock:(id)a3 width:(double)a4
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  double v7 = (Stock *)a3;
  if (self->_stock != v7)
  {
    double v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 removeObserver:self];
    deferredStock = self->_deferredStock;
    self->_deferredStock = 0;

    objc_storeStrong((id *)&self->_stock, a3);
    if (self->_stock)
    {
      v96 = v8;
      [v8 addObserver:self selector:sel__stockWillBeRemoved_ name:StockWillBeRemovedNotification[0] object:0];
      BOOL v98 = [(Stock *)v7 changeIsNegative];
      double v10 = [(Stock *)v7 price];
      [v10 floatValue];
      float v12 = v11;

      double v13 = &stru_26D5DA820;
      double v14 = &stru_26D5DA820;
      double v15 = &stru_26D5DA820;
      if (v12 > 0.0)
      {
        double v15 = [(Stock *)v7 formattedPrice];
        double v16 = [(Stock *)v7 formattedChangePercent:0];
        v17 = [(Stock *)v7 formattedChangePercent:1];
        v18 = @"+";
        if (v98) {
          v18 = @"-";
        }
        double v19 = (void *)MEMORY[0x263F089D8];
        v20 = v18;
        double v14 = [v19 stringWithFormat:@"%@%@", v20, v16];
        double v13 = [MEMORY[0x263F089D8] stringWithFormat:@"%@%@", v20, v17];
      }
      CGRect v21 = (void *)MEMORY[0x263EFF8C0];
      CGRect v22 = [(Stock *)v7 symbol];
      v97 = v7;
      uint64_t v23 = [(Stock *)v7 companyName];
      v24 = (void *)v23;
      if (v23) {
        v25 = (__CFString *)v23;
      }
      else {
        v25 = &stru_26D5DA820;
      }
      v93 = v13;
      v94 = v14;
      v95 = v15;
      v26 = objc_msgSend(v21, "arrayWithObjects:", v22, v25, v15, v14, v13, 0);

      v27 = +[StocksStyle sharedStyle];
      v28 = [v27 lightFontOfSize:22.0];

      v99 = self;
      self->_width = a4;
      double v29 = a4 + -15.0;
      v30 = [MEMORY[0x263F1C358] defaultParagraphStyle];
      v31 = (void *)[v30 mutableCopy];

      v101 = v31;
      [v31 setLineBreakMode:5];
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v106 = 0u;
      uint64_t v32 = [v26 count];
      uint64_t v33 = *MEMORY[0x263F1C238];
      uint64_t v34 = *MEMORY[0x263F1C268];
      if (v32)
      {
        unint64_t v35 = 0;
        v36 = (double *)&v106 + 1;
        double v37 = 0.0;
        do
        {
          if (v35 == 1)
          {
            id v38 = [v28 fontWithSize:14.0];
          }
          else
          {
            id v38 = v28;
          }
          v39 = v38;
          v104[0] = v33;
          v104[1] = v34;
          v105[0] = v38;
          v105[1] = v101;
          v40 = [NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
          v41 = [v26 objectAtIndex:v35];
          [v41 sizeWithAttributes:v40];
          double v43 = v42;
          *(v36 - 1) = v42;
          *(void *)v36 = v44;

          double v37 = v37 + v43;
          ++v35;
          v36 += 2;
        }
        while (v35 < [v26 count]);
      }
      else
      {
        double v37 = 0.0;
      }
      double v45 = v29 + -45.0;
      id v46 = v28;
      double v47 = 21.0;
      v100 = v46;
      while (v47 >= 14.0 && v37 > v45)
      {
        v49 = [v100 fontWithSize:v47];

        if ([v26 count])
        {
          unint64_t v50 = 0;
          if (v47 + -8.0 >= 14.0) {
            double v51 = v47 + -8.0;
          }
          else {
            double v51 = 14.0;
          }
          v52 = &v106;
          do
          {
            double v53 = *(double *)v52;
            if (v50 == 1)
            {
              id v54 = [v100 fontWithSize:v51];
            }
            else
            {
              id v54 = v49;
            }
            v55 = v54;
            double v56 = v37 - v53;
            v102[0] = v33;
            v102[1] = v34;
            v103[0] = v54;
            v103[1] = v101;
            v57 = [NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:2];
            v58 = [v26 objectAtIndex:v50];
            [v58 sizeWithAttributes:v57];
            double v60 = v59;
            *(double *)v52 = v59;
            *((void *)v52 + 1) = v61;

            double v37 = v56 + v60;
            ++v50;
            unint64_t v62 = [v26 count];
            BOOL v63 = v37 > v45;
            if (v50 >= v62) {
              break;
            }
            ++v52;
          }
          while (v37 > v45);
        }
        else
        {
          BOOL v63 = 1;
        }
        double v47 = v47 + -1.0;
        BOOL v64 = v47 >= 14.0 || !v63;
        id v46 = v49;
        if (!v64)
        {
          *(double *)&long long v107 = *(double *)&v107 - (v37 - v45);
          break;
        }
      }
      v65 = [v26 objectAtIndex:0];
      v66 = [MEMORY[0x263F1C550] whiteColor];
      v67 = +[StringDrawingInfo stringDrawingInfoWithString:v65 color:v66 font:v46 size:v106];

      v68 = [v26 objectAtIndex:1];
      v69 = [MEMORY[0x263F1C550] colorWithWhite:0.8 alpha:1.0];
      double v70 = v47 + -8.0;
      if (v47 + -8.0 < 14.0) {
        double v70 = 14.0;
      }
      v71 = [v100 fontWithSize:v70];
      v72 = +[StringDrawingInfo stringDrawingInfoWithString:v68 color:v69 font:v71 size:v107];

      v73 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v67, v72, 0);
      [(LabelSequenceView *)v99->_leftView setStringDrawingInfoValues:v73];

      v74 = +[StocksStyle sharedStyle];
      v75 = v74;
      if (v98) {
        [v74 lossColor];
      }
      else {
      v76 = [v74 gainColor];
      }

      v77 = [v26 objectAtIndex:2];
      v78 = [MEMORY[0x263F1C550] colorWithWhite:0.8 alpha:1.0];
      v79 = +[StringDrawingInfo stringDrawingInfoWithString:v77 color:v78 font:v46 size:v108];

      v80 = [v26 objectAtIndex:3];
      v81 = +[StringDrawingInfo stringDrawingInfoWithString:v80 color:v76 font:v46 size:v109];

      v82 = [v26 objectAtIndex:4];
      v83 = +[StringDrawingInfo stringDrawingInfoWithString:v82 color:v76 font:v46 size:v110];

      v84 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v79, v81, v83, 0);
      [(LabelSequenceView *)v99->_rightView setStringDrawingInfoValues:v84];

      leftView = v99->_leftView;
      double v86 = *MEMORY[0x263F00148];
      double v87 = *(double *)(MEMORY[0x263F00148] + 8);
      [(LabelSequenceView *)leftView requiredSize];
      double v89 = v88;
      [(ChartTitleLabel *)v99 bounds];
      -[LabelSequenceView setFrame:](leftView, "setFrame:", v86, v87, v89);
      rightView = v99->_rightView;
      [(LabelSequenceView *)rightView requiredSize];
      double v92 = v91;
      [(ChartTitleLabel *)v99 bounds];
      -[LabelSequenceView setFrame:](rightView, "setFrame:", v86, v87, v92);
      [(LabelSequenceView *)v99->_leftView setNeedsDisplay];
      [(LabelSequenceView *)v99->_rightView setNeedsDisplay];
      [(ChartTitleLabel *)v99 layoutSubviews];

      double v8 = v96;
      double v7 = v97;
    }
  }
}

- (void)prepareStringsForDeferredStockIfNeeded
{
  if (self->_deferredStock) {
    -[ChartTitleLabel prepareStringsWithStock:width:](self, "prepareStringsWithStock:width:", self->_width);
  }
}

- (void)_stockWillBeRemoved:(id)a3
{
  v4 = [a3 object];
  if (self->_stock == v4)
  {
    self->_stock = 0;
    double v5 = v4;

    v4 = v5;
  }
  if (self->_deferredStock == v4)
  {
    self->_deferredStock = 0;
    double v6 = v4;

    v4 = v6;
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ChartTitleLabel *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)ChartTitleLabel;
  -[ChartTitleLabel setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(ChartTitleLabel *)self layoutSubviews];
  }
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ChartTitleLabel;
  -[ChartTitleLabel setOpaque:](&v5, sel_setOpaque_);
  [(LabelSequenceView *)self->_leftView setOpaque:v3];
  [(LabelSequenceView *)self->_rightView setOpaque:v3];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ChartTitleLabel;
  id v4 = a3;
  [(ChartTitleLabel *)&v5 setBackgroundColor:v4];
  -[LabelSequenceView setBackgroundColor:](self->_leftView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  [(LabelSequenceView *)self->_rightView setBackgroundColor:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredStock, 0);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_rightView, 0);

  objc_storeStrong((id *)&self->_leftView, 0);
}

@end