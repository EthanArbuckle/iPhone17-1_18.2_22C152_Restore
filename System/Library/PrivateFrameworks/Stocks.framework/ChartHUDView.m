@interface ChartHUDView
+ (id)_dateRangeSeparatorString;
+ (id)monoSpacedFontWithFont:(id)a3;
+ (id)newHUDLabel;
+ (id)stringForTimeIntervalSince1970:(double)a3 withInterval:(int64_t)a4 isDouble:(BOOL)a5 isLeft:(BOOL)a6;
+ (void)initializeDateFormattersIfNeededForInterval:(int64_t)a3 withTimeZone:(id)a4;
- (BOOL)enabled;
- (BOOL)isOverlayHidden;
- (BOOL)isTrackingTouches;
- (ChartHUDView)initWithFrame:(CGRect)a3;
- (StockChartView)chartView;
- (StockGraphView)graphView;
- (double)barHeight;
- (void)_showHUD;
- (void)layoutSubviews;
- (void)resetLocale;
- (void)resizeSelectedClipViewsIfNeeded;
- (void)setBarHeight:(double)a3;
- (void)setChartView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGraphView:(id)a3;
- (void)setOverlayHidden:(BOOL)a3;
- (void)setSelectedInterval:(int64_t)a3 timeZone:(id)a4;
- (void)setShowingTracking:(BOOL)a3 withTouchInfo:(id)a4 animated:(BOOL)a5;
- (void)tapDragGestureChanged:(id)a3;
@end

@implementation ChartHUDView

+ (id)_dateRangeSeparatorString
{
  v2 = (void *)_dateRangeSeparatorString_dateRangeSeparatorString;
  if (!_dateRangeSeparatorString_dateRangeSeparatorString)
  {
    uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 8211);
    v4 = (void *)_dateRangeSeparatorString_dateRangeSeparatorString;
    _dateRangeSeparatorString_dateRangeSeparatorString = v3;

    v2 = (void *)_dateRangeSeparatorString_dateRangeSeparatorString;
  }

  return v2;
}

+ (void)initializeDateFormattersIfNeededForInterval:(int64_t)a3 withTimeZone:(id)a4
{
  id v5 = a4;
  id v20 = v5;
  if (a3 < 2)
  {
    v13 = (void *)shortTermSingleDateFormatter;
    if (!shortTermSingleDateFormatter)
    {
      id v14 = objc_alloc_init(MEMORY[0x263F08790]);
      v15 = (void *)shortTermSingleDateFormatter;
      shortTermSingleDateFormatter = (uint64_t)v14;

      [(id)shortTermSingleDateFormatter setDateStyle:3];
      [(id)shortTermSingleDateFormatter setTimeStyle:2];
      id v16 = objc_alloc_init(MEMORY[0x263F08790]);
      v17 = (void *)shortTermDoubleDateFormatter;
      shortTermDoubleDateFormatter = (uint64_t)v16;

      [(id)shortTermDoubleDateFormatter setDateStyle:1];
      [(id)shortTermDoubleDateFormatter setTimeStyle:1];
      id v18 = objc_alloc_init(MEMORY[0x263F08790]);
      v19 = (void *)daySecondDateFormatter;
      daySecondDateFormatter = (uint64_t)v18;

      [(id)daySecondDateFormatter setDateStyle:0];
      [(id)daySecondDateFormatter setTimeStyle:1];
      v13 = (void *)shortTermSingleDateFormatter;
    }
    [v13 setTimeZone:v20];
    id v6 = v20;
    v7 = (void *)shortTermDoubleDateFormatter;
    v8 = &daySecondDateFormatter;
  }
  else
  {
    id v6 = v5;
    v7 = (void *)longTermSingleDateFormatter;
    v8 = &longTermDoubleDateFormatter;
    if (!longTermSingleDateFormatter)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F08790]);
      v10 = (void *)longTermSingleDateFormatter;
      longTermSingleDateFormatter = (uint64_t)v9;

      [(id)longTermSingleDateFormatter setDateStyle:3];
      [(id)longTermSingleDateFormatter setTimeStyle:0];
      id v11 = objc_alloc_init(MEMORY[0x263F08790]);
      v12 = (void *)longTermDoubleDateFormatter;
      longTermDoubleDateFormatter = (uint64_t)v11;

      [(id)longTermDoubleDateFormatter setDateStyle:2];
      [(id)longTermDoubleDateFormatter setTimeStyle:0];
      id v6 = v20;
      v7 = (void *)longTermSingleDateFormatter;
    }
  }
  [v7 setTimeZone:v6];
  [(id)*v8 setTimeZone:v20];
}

- (void)resetLocale
{
  v2 = (void *)longTermSingleDateFormatter;
  longTermSingleDateFormatter = 0;

  uint64_t v3 = (void *)longTermDoubleDateFormatter;
  longTermDoubleDateFormatter = 0;

  v4 = (void *)shortTermSingleDateFormatter;
  shortTermSingleDateFormatter = 0;

  id v5 = (void *)shortTermDoubleDateFormatter;
  shortTermDoubleDateFormatter = 0;

  id v6 = (void *)daySecondDateFormatter;
  daySecondDateFormatter = 0;
}

+ (id)stringForTimeIntervalSince1970:(double)a3 withInterval:(int64_t)a4 isDouble:(BOOL)a5 isLeft:(BOOL)a6
{
  if (a4 >= 2)
  {
    v7 = &longTermDoubleDateFormatter;
    if (!a5) {
      v7 = &longTermSingleDateFormatter;
    }
LABEL_11:
    id v9 = (void *)*v7;
    goto LABEL_13;
  }
  if (a5)
  {
    v7 = &shortTermDoubleDateFormatter;
    if (a4 != 1 && !a6) {
      v7 = &daySecondDateFormatter;
    }
    goto LABEL_11;
  }
  id v9 = (void *)shortTermSingleDateFormatter;
LABEL_13:
  id v10 = v9;
  id v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:a3];
  v12 = [v10 stringFromDate:v11];

  return v12;
}

+ (id)newHUDLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  v4 = +[StocksStyle sharedStyle];
  id v5 = [v4 lightFontOfSize:22.0];
  id v6 = [a1 monoSpacedFontWithFont:v5];
  [v3 setFont:v6];

  v7 = [MEMORY[0x263F1C550] colorWithWhite:0.8 alpha:1.0];
  [v3 setTextColor:v7];

  v8 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v8];

  [v3 setClipsToBounds:0];
  return v3;
}

+ (id)monoSpacedFontWithFont:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = [a3 fontDescriptor];
  uint64_t v14 = *MEMORY[0x263F1D1E8];
  uint64_t v4 = *MEMORY[0x263F1D218];
  v11[0] = *MEMORY[0x263F1D220];
  v11[1] = v4;
  v12[0] = &unk_26D5E9000;
  v12[1] = &unk_26D5E9018;
  id v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v13 = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  v15[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v8 = [v3 fontDescriptorByAddingAttributes:v7];

  id v9 = [MEMORY[0x263F1C658] fontWithDescriptor:v8 size:0.0];

  return v9;
}

- (ChartHUDView)initWithFrame:(CGRect)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  v52.receiver = self;
  v52.super_class = (Class)ChartHUDView;
  id v3 = -[ChartHUDView initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[ChartHUDView newHUDLabel];
    leftDateLabel = v3->_leftDateLabel;
    v3->_leftDateLabel = v4;

    [(ChartHUDView *)v3 addSubview:v4];
    id v6 = +[ChartHUDView newHUDLabel];
    centeredLabel = v3->_centeredLabel;
    v3->_centeredLabel = v6;

    [(ChartHUDView *)v3 addSubview:v6];
    v8 = +[ChartHUDView newHUDLabel];
    rightDateLabel = v3->_rightDateLabel;
    v3->_rightDateLabel = v8;

    [(ChartHUDView *)v3 addSubview:v8];
    id v10 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v11 = objc_alloc_init(HUDTouchInfo);
    v12 = objc_alloc_init(HUDTouchInfo);
    uint64_t v13 = objc_msgSend(v10, "initWithObjects:", v11, v12, 0);
    inactiveTouchInfoSet = v3->_inactiveTouchInfoSet;
    v3->_inactiveTouchInfoSet = (NSMutableSet *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
    touchInfoSet = v3->_touchInfoSet;
    v3->_touchInfoSet = (NSMutableSet *)v15;

    uint64_t v17 = +[StocksBundles getBundle:1];
    id v18 = (void *)MEMORY[0x263F1C6B0];
    v19 = [(ChartHUDView *)v3 traitCollection];
    v46 = (void *)v17;
    id v20 = [v18 imageNamed:@"HUDDot" inBundle:v17 compatibleWithTraitCollection:v19];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obj = v3->_inactiveTouchInfoSet;
    uint64_t v21 = [(NSMutableSet *)obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v48 + 1) + 8 * v24);
          v26 = objc_opt_new();
          [v25 setBar:v26];

          v27 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v20];
          [v25 setDot:v27];

          v28 = [v25 bar];
          [v28 setAlpha:0.0];

          v29 = +[StocksStyle sharedStyle];
          v30 = [v29 chartHighlightColor];
          v31 = [v25 bar];
          [v31 setBackgroundColor:v30];

          v32 = [v25 dot];
          [v32 setAlpha:0.0];

          v33 = [v25 bar];
          [(ChartHUDView *)v3 addSubview:v33];

          v34 = [v25 dot];
          [(ChartHUDView *)v3 addSubview:v34];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [(NSMutableSet *)obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v22);
    }

    v35 = [PricePopoverBar alloc];
    v36 = (void *)MEMORY[0x263F1C6B0];
    v37 = [(ChartHUDView *)v3 traitCollection];
    v38 = [v36 imageNamed:@"ButtonMask" inBundle:v46 compatibleWithTraitCollection:v37];
    double v39 = CeilToPixel(4.5);
    v40 = objc_msgSend(v38, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, v39, 0.0, CeilToPixel(4.5));
    uint64_t v41 = [(PricePopoverBar *)v35 initWithBackgroundImage:v40];
    pricePopoverBar = v3->_pricePopoverBar;
    v3->_pricePopoverBar = (PricePopoverBar *)v41;

    [(PricePopoverBar *)v3->_pricePopoverBar setAlpha:0.0];
    [(ChartHUDView *)v3 addSubview:v3->_pricePopoverBar];
    v43 = [[StocksTapDragGestureRecognizer alloc] initWithTarget:v3 action:sel_tapDragGestureChanged_];
    tapDragGesture = v3->_tapDragGesture;
    v3->_tapDragGesture = v43;

    [(StocksTapDragGestureRecognizer *)v3->_tapDragGesture setMaximumNumberOfTouches:2];
    [(StocksTapDragGestureRecognizer *)v3->_tapDragGesture setRequiredPressDelay:0.1];
    [(ChartHUDView *)v3 addGestureRecognizer:v3->_tapDragGesture];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)ChartHUDView;
  -[ChartHUDView setFrame:](&v22, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(StockGraphView *)self->_graphView frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
  -[ChartHUDView convertRect:fromView:](self, "convertRect:fromView:", WeakRetained, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;

  id v17 = objc_loadWeakRetained((id *)&self->_chartView);
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;

  -[StocksTapDragGestureRecognizer setTouchableBounds:](self->_tapDragGesture, "setTouchableBounds:", v14, v16, v19, v21 - v16);
}

- (void)setOverlayHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_overlayHidden = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(ChartHUDView *)self subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setHidden:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)resizeSelectedClipViewsIfNeeded
{
  uint64_t v3 = [(NSMutableSet *)self->_touchInfoSet count];
  id v35 = [(NSMutableSet *)self->_touchInfoSet allObjects];
  if (v3 == 2)
  {
    double v4 = [v35 objectAtIndex:0];
    [v4 plottedLocation];
    double v6 = v5;

    uint64_t v7 = [v35 objectAtIndex:1];
    [v7 plottedLocation];
    double v9 = v8;

    -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v6, 0.0);
    double v11 = v10;
    -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v9, 0.0);
    if (v11 >= v12) {
      double v13 = v12;
    }
    else {
      double v13 = v11;
    }
    if (v11 >= v12) {
      double v14 = v11;
    }
    else {
      double v14 = v12;
    }
    [(StockGraphView *)self->_graphView resizeSelectedLineClipViewWithLeftX:v13 rightX:v14];
  }
  if ([(NSMutableSet *)self->_touchInfoSet count])
  {
    double v15 = [(NSMutableSet *)self->_touchInfoSet allObjects];
    double v16 = [v15 firstObject];
    id v17 = [v16 touch];
    [v17 locationInView:self->_graphView];
    double v19 = v18;
    double v21 = v20;

    if (v3 == 2)
    {
      objc_super v22 = [v15 lastObject];
      uint64_t v23 = [v22 touch];
      [v23 locationInView:self->_graphView];
      double v25 = v24;
      double v27 = v26;

      if (v19 >= v25) {
        double v28 = v21;
      }
      else {
        double v28 = v27;
      }
      if (v19 < v25)
      {
        double v29 = v25;
      }
      else
      {
        double v21 = v27;
        double v29 = v19;
      }
      if (v19 >= v25) {
        double v19 = v25;
      }
    }
    else
    {
      double v29 = 0.0;
      double v28 = 0.0;
    }
    -[StockGraphView volumeBarRectNearestToPoint:](self->_graphView, "volumeBarRectNearestToPoint:", v19, v21);
    double v34 = v30;
    if (v3 == 2) {
      -[StockGraphView volumeBarRectNearestToPoint:](self->_graphView, "volumeBarRectNearestToPoint:", v29, v28);
    }
    [(StockGraphView *)self->_graphView resizeSelectedVolumeClipViewWithLeftX:v34 rightX:CGRectGetMaxX(*(CGRect *)&v30)];
  }
}

- (void)layoutSubviews
{
  uint64_t v194 = *MEMORY[0x263EF8340];
  if ([(NSMutableSet *)self->_touchInfoSet count])
  {
    [(ChartHUDView *)self alpha];
    if (v5 != 0.0)
    {
      [(StockGraphView *)self->_graphView frame];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
      -[ChartHUDView convertRect:fromView:](self, "convertRect:fromView:", WeakRetained, v7, v9, v11, v13);
      CGFloat v169 = v16;
      double v170 = v15;
      double v18 = v17;
      CGFloat rect = v19;

      [(PricePopoverBar *)self->_pricePopoverBar frame];
      double v171 = v20;
      double v172 = v21;
      double v166 = v22;
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      uint64_t v23 = [(NSMutableSet *)self->_touchInfoSet setByAddingObjectsFromSet:self->_inactiveTouchInfoSet];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v187 objects:v193 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t j = *(void *)v188;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v188 != j) {
              objc_enumerationMutation(v23);
            }
            double v27 = *(void **)(*((void *)&v187 + 1) + 8 * i);
            double v28 = [v27 bar];
            double v29 = [v27 bar];
            [v29 frame];
            double v31 = v30;
            v2 = [MEMORY[0x263F1C920] mainScreen];
            [v2 scale];
            objc_msgSend(v28, "setFrame:", v31, v18 + 1.0 / v32, RoundToPixel(0.5), self->_barHeight);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v187 objects:v193 count:16];
        }
        while (v25);
      }

      BOOL forceTouchUpdate = self->_forceTouchUpdate;
      self->_BOOL forceTouchUpdate = 0;
      long long v183 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      long long v186 = 0u;
      double v34 = self->_touchInfoSet;
      uint64_t v35 = [(NSMutableSet *)v34 countByEnumeratingWithState:&v183 objects:v192 count:16];
      BOOL v36 = forceTouchUpdate;
      if (v35)
      {
        uint64_t v37 = v35;
        v2 = *(void **)v184;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void **)v184 != v2) {
              objc_enumerationMutation(v34);
            }
            v38 = *(void **)(*((void *)&v183 + 1) + 8 * j);
            double v39 = [v38 touch];
            [v39 locationInView:self];
            double v41 = v40;
            double v43 = v42;

            objc_msgSend(v38, "setLocationInHUD:", v41, v43);
            double v177 = 0.0;
            double v178 = 0.0;
            -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v41, v43);
            double v177 = v44;
            double v178 = v45;
            graphView = self->_graphView;
            if (graphView)
            {
              [(StockGraphView *)graphView plottedPointNearestToPoint:&v177];
            }
            else
            {
              long long v181 = 0uLL;
              uint64_t v182 = 0;
            }
            long long v179 = v181;
            uint64_t v180 = v182;
            [v38 setStockValue:&v179];
            -[ChartHUDView convertPoint:fromView:](self, "convertPoint:fromView:", self->_graphView, v177, v178);
            double v48 = v47;
            double v50 = v49;
            [v38 plottedLocation];
            if (v48 != v52 || v50 != v51)
            {
              objc_msgSend(v38, "setPlottedLocation:", v48, v50);
              uint64_t v54 = [v38 dot];
              objc_msgSend(v54, "setCenter:", v48, v50);

              v55 = [v38 bar];
              [v55 frame];
              double v57 = v56;
              double v59 = v58;
              double v61 = v60;

              double v62 = v18;
              double v63 = RoundToPixel(v48 + v59 * -0.5);
              v64 = [v38 bar];
              double v65 = v63;
              double v18 = v62;
              objc_msgSend(v64, "setFrame:", v65, v57, v59, v61);

              -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v48, v50);
              double v177 = v66;
              double v178 = v67;
              BOOL v36 = 1;
            }
            if ([(NSMutableSet *)self->_touchInfoSet count] == 1)
            {
              v195.size.width = v169;
              v195.origin.x = v170;
              v195.origin.y = v18;
              v195.size.height = rect;
              double v68 = CGRectGetMaxX(v195) - v172;
              double v69 = RoundToPixel(v48 - v172 * 0.5);
              if (v170 >= v69) {
                double v69 = v170;
              }
              if (v68 < v69) {
                double v69 = v68;
              }
              double v171 = v69;
            }
          }
          uint64_t v37 = [(NSMutableSet *)v34 countByEnumeratingWithState:&v183 objects:v192 count:16];
        }
        while (v37);
      }

      if (v36 && [(NSMutableSet *)self->_touchInfoSet count])
      {
        [(ChartHUDView *)self resizeSelectedClipViewsIfNeeded];
        v70 = +[StocksStyle sharedStyle];
        uint64_t v71 = [v70 chartHighlightColor];

        v164 = (void *)v71;
        if ([(NSMutableSet *)self->_touchInfoSet count] == 1)
        {
          v72 = [(NSMutableSet *)self->_touchInfoSet anyObject];
          v73 = v72;
          if (v72)
          {
            [v72 stockValue];
            double v75 = v177;
            double v74 = v178;

            v76 = NSNumber;
            if (v74 >= 1000.0)
            {
              double v74 = RoundToPixel(v74);
              int v77 = 0;
            }
            else
            {
              int v77 = 1;
            }
          }
          else
          {

            v76 = NSNumber;
            double v75 = 0.0;
            int v77 = 1;
            double v74 = 0.0;
          }
          v78 = [v76 numberWithDouble:v74];
          v114 = +[StockDataFormatter sharedDataFormatter];
          if (v77)
          {
            v2 = [(ChartHUDView *)self chartView];
            uint64_t j = [v2 stock];
            uint64_t v115 = [(id)j pricePrecision];
          }
          else
          {
            uint64_t v115 = 0;
          }
          uint64_t v108 = [v114 formattedNumber:v78 withPrecision:v115 useGroupSeparator:1];
          if (v77)
          {
          }
          [(PricePopoverBar *)self->_pricePopoverBar setImageMaskColor:v71];
          [(PricePopoverBar *)self->_pricePopoverBar setChangeImage:0];
          v106 = 0;
          double v92 = 0.0;
        }
        else
        {
          v78 = [(NSMutableSet *)self->_touchInfoSet allObjects];
          v79 = [v78 objectAtIndex:0];
          [v79 locationInHUD];
          double v81 = v80;
          v82 = [v78 objectAtIndex:1];
          [v82 locationInHUD];
          double v84 = v83;
          BOOL v85 = v81 >= v83;

          v86 = [v78 objectAtIndex:v85];
          v87 = v86;
          double v88 = 0.0;
          double v89 = 0.0;
          double v75 = 0.0;
          if (v86)
          {
            [v86 stockValue];
            double v75 = v177;
            double v89 = v178;
          }

          v90 = [v78 objectAtIndex:v81 < v84];
          v91 = v90;
          double v92 = 0.0;
          if (v90)
          {
            [v90 stockValue];
            double v92 = v177;
            double v88 = v178;
          }

          double v93 = v88 - v89;
          float v94 = (v88 - v89) / v89;
          float v95 = v93;
          double v96 = fabsf(v94);
          if (v96 >= 0.0001) {
            float v97 = v95;
          }
          else {
            float v97 = 0.0;
          }
          if (v96 >= 0.0001) {
            float v98 = v94;
          }
          else {
            float v98 = 0.0;
          }
          v99 = +[StockDataFormatter sharedDataFormatter];
          v100 = [NSNumber numberWithDouble:fabsf(v97)];
          v101 = [(ChartHUDView *)self chartView];
          v102 = [v101 stock];
          v103 = objc_msgSend(v99, "formattedNumber:withPrecision:useGroupSeparator:", v100, objc_msgSend(v102, "pricePrecision"), 1);

          v104 = +[StockDataFormatter sharedDataFormatter];
          v105 = [NSNumber numberWithDouble:fabsf(v98)];
          v106 = [v104 formattedPercent:v105];

          v107 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"+-"];
          uint64_t v108 = [v103 stringByTrimmingCharactersInSet:v107];

          if (v96 >= 0.0001)
          {
            v165 = v106;
            pricePopoverBar = self->_pricePopoverBar;
            v110 = +[StocksStyle sharedStyle];
            v111 = v110;
            if (v94 >= 0.0)
            {
              v112 = [v110 gainColor];
              v113 = @"PlusSign";
            }
            else
            {
              v112 = [v110 lossColor];
              v113 = @"MinusSign";
            }
            [(PricePopoverBar *)pricePopoverBar setImageMaskColor:v112];

            v116 = +[StocksBundles getBundle:1];
            v117 = self->_pricePopoverBar;
            v118 = (void *)MEMORY[0x263F1C6B0];
            v119 = [(ChartHUDView *)self traitCollection];
            v120 = [v118 imageNamed:v113 inBundle:v116 compatibleWithTraitCollection:v119];
            [(PricePopoverBar *)v117 setChangeImage:v120];

            v106 = v165;
          }
          else
          {
            [(PricePopoverBar *)self->_pricePopoverBar setImageMaskColor:v164];
            [(PricePopoverBar *)self->_pricePopoverBar setChangeImage:0];
          }
        }

        v167 = (void *)v108;
        [(PricePopoverBar *)self->_pricePopoverBar setPriceString:v108];
        [(PricePopoverBar *)self->_pricePopoverBar setPercentChange:v106];
        v121 = +[ChartHUDView stringForTimeIntervalSince1970:self->_interval withInterval:[(NSMutableSet *)self->_touchInfoSet count] == 2 isDouble:1 isLeft:v75];
        v122 = [(UILabel *)self->_leftDateLabel font];
        if ([(NSMutableSet *)self->_touchInfoSet count] != 2 || v92 == v75)
        {
          double v132 = *MEMORY[0x263F001B0];
          double v134 = *(double *)(MEMORY[0x263F001B0] + 8);
          [(UILabel *)self->_centeredLabel setText:v121];
          p_rightDateLabel = &self->_rightDateLabel;
          [(UILabel *)self->_rightDateLabel setText:0];
          [(UILabel *)self->_leftDateLabel setText:0];
          double v135 = 0.0;
          double v129 = v134;
          double v127 = v132;
        }
        else
        {
          v123 = +[ChartHUDView _dateRangeSeparatorString];
          [(UILabel *)self->_centeredLabel setText:v123];

          [(UILabel *)self->_leftDateLabel setText:v121];
          v124 = +[ChartHUDView stringForTimeIntervalSince1970:self->_interval withInterval:[(NSMutableSet *)self->_touchInfoSet count] == 2 isDouble:0 isLeft:v92];
          p_rightDateLabel = &self->_rightDateLabel;
          [(UILabel *)self->_rightDateLabel setText:v124];

          objc_msgSend(v121, "_legacy_sizeWithFont:", v122);
          double v127 = v126;
          double v129 = v128;
          v130 = [(UILabel *)self->_rightDateLabel text];
          objc_msgSend(v130, "_legacy_sizeWithFont:", v122);
          double v132 = v131;
          double v134 = v133;

          double v135 = 1.0;
        }
        [(UILabel *)*p_rightDateLabel setAlpha:v135];
        [(UILabel *)self->_leftDateLabel setAlpha:v135];
        v136 = [(UILabel *)self->_centeredLabel font];
        [v136 ascender];
        double v138 = RoundToPixel(22.0 - v137);

        v139 = [(UILabel *)self->_centeredLabel text];
        objc_msgSend(v139, "_legacy_sizeWithFont:", v122);
        double v141 = v140;
        double v163 = v142;

        double v162 = v138 - RoundToPixel(1.5);
        int64_t interval = self->_interval;
        [(ChartHUDView *)self bounds];
        if (interval) {
          double v145 = RoundToPixel((v144 - v141) * 0.5);
        }
        else {
          double v145 = v127 + RoundToPixel((v144 - v127 - v141 - v132) * 0.5);
        }
        -[UILabel setFrame:](self->_centeredLabel, "setFrame:", v145, v162, v141, v163);
        uint64_t v146 = objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[ChartHUDView semanticContentAttribute](self, "semanticContentAttribute"));
        leftDateLabel = self->_leftDateLabel;
        if (v146)
        {
          -[UILabel setFrame:](leftDateLabel, "setFrame:", v141 + v145 + 3.0, v138, v127, v129);
          double v148 = v145 - v132;
          double v149 = -3.0;
        }
        else
        {
          -[UILabel setFrame:](leftDateLabel, "setFrame:", v145 - v127 + -3.0, v138, v127, v129);
          double v148 = v141 + v145;
          double v149 = 3.0;
        }
        -[UILabel setFrame:](self->_rightDateLabel, "setFrame:", v148 + v149, v138, v132, v134);
      }
      long long v175 = 0u;
      long long v176 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      v150 = self->_touchInfoSet;
      uint64_t v151 = [(NSMutableSet *)v150 countByEnumeratingWithState:&v173 objects:v191 count:16];
      if (v151)
      {
        uint64_t v152 = v151;
        uint64_t v153 = *(void *)v174;
        double v154 = 0.0;
        do
        {
          for (uint64_t k = 0; k != v152; ++k)
          {
            if (*(void *)v174 != v153) {
              objc_enumerationMutation(v150);
            }
            [*(id *)(*((void *)&v173 + 1) + 8 * k) locationInHUD];
            double v154 = v154 + v156 / (float)(unint64_t)[(NSMutableSet *)self->_touchInfoSet count];
          }
          uint64_t v152 = [(NSMutableSet *)v150 countByEnumeratingWithState:&v173 objects:v191 count:16];
        }
        while (v152);
      }
      else
      {
        double v154 = 0.0;
      }

      [(StockGraphView *)self->_graphView rightmostPlottedPoint];
      -[ChartHUDView convertPoint:fromView:](self, "convertPoint:fromView:", self->_graphView);
      double v158 = v157;
      uint64_t v159 = [(NSMutableSet *)self->_touchInfoSet count];
      double v160 = v171;
      if (v159 == 2)
      {
        if (v154 >= v158) {
          double v154 = v158;
        }
        v196.size.width = v169;
        v196.origin.x = v170;
        v196.origin.y = v18;
        v196.size.height = rect;
        double v160 = CGRectGetMaxX(v196) - v172;
        double v161 = fmax(round(v154 + v172 * -0.5), 16.0);
        if (v160 >= v161) {
          double v160 = v161;
        }
      }
      -[PricePopoverBar setFrame:](self->_pricePopoverBar, "setFrame:", v160, v18 - v166 + -3.0, v172);
    }
  }
}

- (void)setSelectedInterval:(int64_t)a3 timeZone:(id)a4
{
  self->_int64_t interval = a3;
  +[ChartHUDView initializeDateFormattersIfNeededForInterval:withTimeZone:](ChartHUDView, "initializeDateFormattersIfNeededForInterval:withTimeZone:");
}

- (void)setShowingTracking:(BOOL)a3 withTouchInfo:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (v6) {
    [(ChartHUDView *)self setNeedsLayout];
  }
  double v9 = (void *)MEMORY[0x263F1CB60];
  v12[1] = 3221225472;
  v12[0] = MEMORY[0x263EF8330];
  void v12[2] = __58__ChartHUDView_setShowingTracking_withTouchInfo_animated___block_invoke;
  v12[3] = &unk_26467DB98;
  if (v5) {
    double v10 = 0.150000002;
  }
  else {
    double v10 = 0.0;
  }
  BOOL v15 = v6;
  id v13 = v8;
  double v14 = self;
  id v11 = v8;
  [v9 animateWithDuration:v12 animations:v10];
}

uint64_t __58__ChartHUDView_setShowingTracking_withTouchInfo_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dot];
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 48)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  [v2 setAlpha:v4];

  BOOL v5 = [*(id *)(a1 + 32) bar];
  BOOL v6 = v5;
  if (*(unsigned char *)(a1 + 48)) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [v5 setAlpha:v7];

  uint64_t v8 = *(void *)(a1 + 40);
  double v9 = *(void **)(v8 + 464);
  if ([*(id *)(v8 + 448) count]) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  [v9 setAlpha:v10];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 496), "setShowingSelectedVolumeRegion:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 448), "count") != 0);
  uint64_t v11 = *(void *)(a1 + 40);
  double v12 = *(void **)(v11 + 496);
  BOOL v13 = [*(id *)(v11 + 448) count] == 2;

  return [v12 setShowingSelectedLine:v13];
}

- (BOOL)isTrackingTouches
{
  return [(NSMutableSet *)self->_touchInfoSet count] != 0;
}

- (void)_showHUD
{
  p_chartView = &self->_chartView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
  id v8 = [WeakRetained chartData];

  uint64_t v5 = [v8 chartInterval];
  BOOL v6 = [v8 marketTimeZone];
  [(ChartHUDView *)self setSelectedInterval:v5 timeZone:v6];

  id v7 = objc_loadWeakRetained((id *)p_chartView);
  [v7 setShowingHUD:1];

  [(ChartHUDView *)self setNeedsLayout];
}

- (void)tapDragGestureChanged:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v44 = a3;
  uint64_t v4 = [v44 state];
  switch(v4)
  {
    case 3:
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      double v32 = self->_touchInfoSet;
      uint64_t v33 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v49 objects:v66 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(v32);
            }
            [(NSMutableSet *)self->_inactiveTouchInfoSet addObject:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          }
          uint64_t v34 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v49 objects:v66 count:16];
        }
        while (v34);
      }

      [(NSMutableSet *)self->_touchInfoSet removeAllObjects];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v37 = self->_inactiveTouchInfoSet;
      uint64_t v38 = [(NSMutableSet *)v37 countByEnumeratingWithState:&v45 objects:v65 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v46 != v40) {
              objc_enumerationMutation(v37);
            }
            double v42 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            [v42 setTouch:0];
            [(ChartHUDView *)self setShowingTracking:0 withTouchInfo:v42 animated:1];
          }
          uint64_t v39 = [(NSMutableSet *)v37 countByEnumeratingWithState:&v45 objects:v65 count:16];
        }
        while (v39);
      }

      self->_BOOL forceTouchUpdate = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
      [WeakRetained setShowingHUD:0];
      goto LABEL_48;
    case 2:
LABEL_5:
      uint64_t v5 = [MEMORY[0x263EFF9C0] set];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      BOOL v6 = self->_touchInfoSet;
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v62;
        do
        {
          for (uint64_t k = 0; k != v8; ++k)
          {
            if (*(void *)v62 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v61 + 1) + 8 * k);
            double v12 = [v44 touches];
            BOOL v13 = [v11 touch];
            char v14 = [v12 containsObject:v13];

            if ((v14 & 1) == 0) {
              [v5 addObject:v11];
            }
          }
          uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v61 objects:v69 count:16];
        }
        while (v8);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v15 = v5;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v68 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v58;
        do
        {
          for (uint64_t m = 0; m != v17; ++m)
          {
            if (*(void *)v58 != v18) {
              objc_enumerationMutation(v15);
            }
            double v20 = *(void **)(*((void *)&v57 + 1) + 8 * m);
            [v20 setTouch:0];
            [(NSMutableSet *)self->_touchInfoSet removeObject:v20];
            [(NSMutableSet *)self->_inactiveTouchInfoSet addObject:v20];
            [(ChartHUDView *)self setShowingTracking:0 withTouchInfo:v20 animated:1];
            self->_BOOL forceTouchUpdate = 1;
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v68 count:16];
        }
        while (v17);
      }
      id v43 = v15;

      double v21 = [(NSMutableSet *)self->_touchInfoSet valueForKey:@"touch"];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      double v22 = [v44 touches];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v67 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v54;
        do
        {
          for (uint64_t n = 0; n != v24; ++n)
          {
            if (*(void *)v54 != v25) {
              objc_enumerationMutation(v22);
            }
            double v27 = *(void **)(*((void *)&v53 + 1) + 8 * n);
            if (([v21 containsObject:v27] & 1) == 0)
            {
              double v28 = [(NSMutableSet *)self->_inactiveTouchInfoSet anyObject];
              double v29 = v28;
              if (v28)
              {
                [v28 setTouch:v27];
                [v27 locationInView:self];
                objc_msgSend(v29, "setLocationInHUD:");
                [(NSMutableSet *)self->_touchInfoSet addObject:v29];
                [(NSMutableSet *)self->_inactiveTouchInfoSet removeObject:v29];
                [(ChartHUDView *)self alpha];
                [(ChartHUDView *)self setShowingTracking:1 withTouchInfo:v29 animated:v30 != 0.0];
                self->_BOOL forceTouchUpdate = 1;
              }
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v67 count:16];
        }
        while (v24);
      }

      [(ChartHUDView *)self setNeedsLayout];
      id WeakRetained = v43;
LABEL_48:

      break;
    case 1:
      [(ChartHUDView *)self _showHUD];
      goto LABEL_5;
  }
}

- (StockChartView)chartView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);

  return (StockChartView *)WeakRetained;
}

- (void)setChartView:(id)a3
{
}

- (StockGraphView)graphView
{
  return self->_graphView;
}

- (void)setGraphView:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)isOverlayHidden
{
  return self->_overlayHidden;
}

- (double)barHeight
{
  return self->_barHeight;
}

- (void)setBarHeight:(double)a3
{
  self->_barHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_destroyWeak((id *)&self->_chartView);
  objc_storeStrong((id *)&self->_tapDragGesture, 0);
  objc_storeStrong((id *)&self->_pricePopoverBar, 0);
  objc_storeStrong((id *)&self->_touchInfoSet, 0);
  objc_storeStrong((id *)&self->_inactiveTouchInfoSet, 0);
  objc_storeStrong((id *)&self->_rightDateLabel, 0);
  objc_storeStrong((id *)&self->_centeredLabel, 0);

  objc_storeStrong((id *)&self->_leftDateLabel, 0);
}

@end