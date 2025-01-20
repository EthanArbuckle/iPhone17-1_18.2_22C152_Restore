@interface SUUICounterView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)viewForElementIdentifier:(id)a3;
- (unint64_t)_visibleTimeFieldsForDateFormat:(int64_t)a3;
- (void)_addNumberViewWithViewElement:(id)a3 context:(id)a4;
- (void)_addTimeViewWithViewElement:(id)a3 context:(id)a4;
- (void)_reloadNumberValue;
- (void)_reloadUpdateTimer;
- (void)_startUpdateTimer;
- (void)_stopUpdateTimer;
- (void)_updateTimerAction;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setAlpha:(double)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation SUUICounterView

- (void)dealloc
{
  updateTimer = self->_updateTimer;
  if (updateTimer) {
    dispatch_source_cancel(updateTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUICounterView;
  [(SUUIViewReuseView *)&v4 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a5;
  v8 = [a3 backgroundImageElement];
  if (v8) {
    char v9 = [v7 prefetchResourcesForViewElement:v8 reason:a4];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5 = a4;
  v6 = [a3 backgroundImageElement];
  if (v6)
  {
    [v5 sizeForImageElement:v6];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  double v8 = (SUUICounterViewElement *)a3;
  id v9 = a5;
  if (self->_counterElement != v8)
  {
    [(SUUICounterView *)self _stopUpdateTimer];
    objc_storeStrong((id *)&self->_counterElement, a3);
    numberFormatter = self->_numberFormatter;
    self->_numberFormatter = 0;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__SUUICounterView_reloadWithViewElement_width_context___block_invoke;
  v15[3] = &unk_2654026E8;
  double v11 = v8;
  v16 = v11;
  v17 = self;
  id v12 = v9;
  id v18 = v12;
  [(SUUIViewReuseView *)self modifyUsingBlock:v15];
  uint64_t v13 = [(SUUICounterViewElement *)v11 counterType];
  if (!v13)
  {
    [(SUUICounterView *)self _addTimeViewWithViewElement:v11 context:v12];
    v14 = &OBJC_IVAR___SUUICounterView__numberView;
    goto LABEL_7;
  }
  if (v13 == 1)
  {
    [(SUUICounterView *)self _addNumberViewWithViewElement:v11 context:v12];
    v14 = &OBJC_IVAR___SUUICounterView__timeView;
LABEL_7:
    [*(id *)((char *)&self->super.super.super.super.isa + *v14) setHidden:1];
  }
  [(SUUICounterView *)self _reloadUpdateTimer];
}

void __55__SUUICounterView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) backgroundImageElement];
  if (v3)
  {
    objc_super v4 = [v5 addImageViewWithElement:v3 context:*(void *)(a1 + 48)];
  }
  else
  {
    objc_super v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 464), v4);
  if (v3) {
}
  }

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUICounterView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(SUUICounterViewElement *)self->_counterElement backgroundImageElement];
  if (v11
    && (uint64_t v12 = [v9 requestIdentifier],
        [v10 requestIdentifierForViewElement:v11],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 unsignedIntegerValue],
        v13,
        v12 == v14))
  {
    [(SUUIImageView *)self->_imageView setImage:v8];
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SUUICounterView;
  [(SUUICounterView *)&v3 didMoveToWindow];
  [(SUUICounterView *)self _reloadUpdateTimer];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)SUUICounterView;
  [(SUUICounterView *)&v3 didMoveToSuperview];
  [(SUUICounterView *)self _reloadUpdateTimer];
}

- (void)layoutSubviews
{
  [(SUUICounterView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  imageView = self->_imageView;
  if (imageView)
  {
    double v12 = v3 - self->_contentInset.left - self->_contentInset.right;
    double v13 = v4 - self->_contentInset.bottom - self->_contentInset.top;
    [(SUUIImageView *)imageView frame];
    -[SUUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v9, v10);
    SUUIImageRectForBounds(0, v14, v15, v6, v8, v9, v10);
    double v9 = v16;
    double v10 = v17;
    float v18 = self->_contentInset.left + (v12 - v16) * 0.5;
    double v6 = floorf(v18);
    float v19 = self->_contentInset.top + (v13 - v17) * 0.5;
    double v8 = floorf(v19);
    -[SUUIImageView setFrame:](self->_imageView, "setFrame:", v6, v8, v16, v17);
  }
  v20 = self->_timeView;
  v21 = v20;
  if (v20 && ![(SUUICounterTimeView *)v20 isHidden]
    || (v22 = self->_numberView, v21, (v21 = v22) != 0))
  {
    if (([v21 isHidden] & 1) == 0)
    {
      v23 = [(SUUICounterViewElement *)self->_counterElement style];
      unsigned __int8 v42 = 0;
      double v24 = SUUIViewElementPaddingForStyle(v23, (char *)&v42);
      double v40 = v25;
      double v41 = v24;
      int v26 = v42;
      [v21 frame];
      double v28 = v27;
      objc_msgSend(v21, "sizeThatFits:", v9, v10);
      double v30 = v29;
      double v32 = v31;
      *(float *)&double v29 = v6 + (v9 - v29) * 0.5;
      double v33 = floorf(*(float *)&v29);
      unint64_t v34 = [v23 elementPosition];
      if (v34 <= 9)
      {
        if (((1 << v34) & 0x309) != 0)
        {
          if (v26) {
            double v39 = v40;
          }
          else {
            double v39 = 4.0;
          }
          v43.origin.x = v6;
          v43.origin.y = v8;
          v43.size.width = v9;
          v43.size.height = v10;
          double v28 = CGRectGetMaxY(v43) - v32 - v39;
        }
        else
        {
          float v35 = v8 + (v10 - v32) * 0.5;
          double v36 = floorf(v35);
          double v37 = 4.0;
          if (v26) {
            double v37 = v41;
          }
          double v38 = v8 + v37;
          if (((1 << v34) & 0x32) != 0) {
            double v28 = v36;
          }
          else {
            double v28 = v38;
          }
        }
      }
      objc_msgSend(v21, "setFrame:", v33, v28, v30, v32);
    }
  }
  [(SUUICounterView *)self _reloadUpdateTimer];
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUICounterView;
  [(SUUICounterView *)&v4 setAlpha:a3];
  [(SUUICounterView *)self _reloadUpdateTimer];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUICounterView;
  [(SUUICounterView *)&v4 setHidden:a3];
  [(SUUICounterView *)self _reloadUpdateTimer];
}

- (void)_addNumberViewWithViewElement:(id)a3 context:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (!self->_numberView)
  {
    double v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numberView = self->_numberView;
    self->_numberView = v7;

    double v9 = self->_numberView;
    double v10 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    [(UILabel *)self->_numberView setTextAlignment:1];
  }
  double v11 = [v16 style];
  double v12 = self->_numberView;
  double v13 = SUUIViewElementFontWithStyle(v11);
  [(UILabel *)v12 setFont:v13];

  double v14 = [v6 tintColor];
  double v15 = SUUIViewElementPlainColorWithStyle(v11, v14);

  [(UILabel *)self->_numberView setTextColor:v15];
  [(UILabel *)self->_numberView setHidden:0];
  [(SUUICounterView *)self addSubview:self->_numberView];
  [(SUUICounterView *)self _reloadNumberValue];
}

- (void)_addTimeViewWithViewElement:(id)a3 context:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (!self->_timeView)
  {
    double v7 = [SUUICounterTimeView alloc];
    double v8 = [v6 clientContext];
    double v9 = [(SUUICounterTimeView *)v7 initWithClientContext:v8];
    timeView = self->_timeView;
    self->_timeView = v9;

    double v11 = self->_timeView;
    double v12 = [MEMORY[0x263F825C8] clearColor];
    [(SUUICounterTimeView *)v11 setBackgroundColor:v12];
  }
  double v13 = [v20 style];
  double v14 = self->_timeView;
  double v15 = [v20 endDate];
  [(SUUICounterTimeView *)v14 setEndDate:v15];

  id v16 = [v6 tintColor];
  double v17 = SUUIViewElementPlainColorWithStyle(v13, v16);

  [(SUUICounterTimeView *)self->_timeView setTextColor:v17];
  float v18 = self->_timeView;
  float v19 = SUUIViewElementFontWithStyle(v13);
  [(SUUICounterTimeView *)v18 setValueFont:v19];

  -[SUUICounterTimeView setVisibleFields:](self->_timeView, "setVisibleFields:", -[SUUICounterView _visibleTimeFieldsForDateFormat:](self, "_visibleTimeFieldsForDateFormat:", [v20 dateFormatType]));
  [(SUUICounterTimeView *)self->_timeView setHidden:0];
  [(SUUICounterView *)self addSubview:self->_timeView];
}

- (void)_reloadNumberValue
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    objc_super v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    double v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:1];
    id v6 = self->_numberFormatter;
    double v7 = [(SUUICounterViewElement *)self->_counterElement numberFormat];
    [(NSNumberFormatter *)v6 setPositiveFormat:v7];

    numberFormatter = self->_numberFormatter;
  }
  numberView = self->_numberView;
  objc_msgSend(NSNumber, "numberWithLongLong:", -[SUUICounterViewElement currentNumberValue](self->_counterElement, "currentNumberValue"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v10];
  [(UILabel *)numberView setText:v9];
}

- (void)_reloadUpdateTimer
{
  if (([(SUUICounterView *)self isHidden] & 1) != 0
    || ([(SUUICounterView *)self alpha], v3 < 0.00000011920929)
    || ([(SUUICounterView *)self window],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    [(SUUICounterView *)self _stopUpdateTimer];
  }
  else
  {
    [(SUUICounterView *)self _startUpdateTimer];
  }
}

- (void)_startUpdateTimer
{
  if (!self->_updateTimer)
  {
    double v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v3;

    if ([(SUUICounterViewElement *)self->_counterElement counterType] == 1)
    {
      [(SUUICounterViewElement *)self->_counterElement changeRatePerSecond];
      double v6 = 1.0 / v5;
      double v7 = v6 * 1000000000.0;
      BOOL v8 = v6 <= 0.333333333;
      double v9 = 333333333.0;
      if (!v8) {
        double v9 = v7;
      }
      unint64_t v10 = (unint64_t)v9;
    }
    else
    {
      unint64_t v10 = 1000000000;
    }
    double v11 = self->_updateTimer;
    dispatch_time_t v12 = dispatch_time(0, v10);
    dispatch_source_set_timer(v11, v12, v10, 0);
    objc_initWeak(&location, self);
    double v13 = self->_updateTimer;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __36__SUUICounterView__startUpdateTimer__block_invoke;
    v14[3] = &unk_265401538;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __36__SUUICounterView__startUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTimerAction];
}

- (void)_stopUpdateTimer
{
  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_source_cancel(updateTimer);
    objc_super v4 = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

- (void)_updateTimerAction
{
  timeView = self->_timeView;
  if (timeView && ([(SUUICounterTimeView *)timeView isHidden] & 1) == 0) {
    [(SUUICounterTimeView *)self->_timeView reloadTimeValue];
  }
  numberView = self->_numberView;
  if (numberView && ([(UILabel *)numberView isHidden] & 1) == 0)
  {
    [(SUUICounterView *)self _reloadNumberValue];
  }
}

- (unint64_t)_visibleTimeFieldsForDateFormat:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 7;
  }
  else {
    return qword_2568A1018[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_numberView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_counterElement, 0);
}

@end