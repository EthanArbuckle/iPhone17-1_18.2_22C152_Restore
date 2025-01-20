@interface SKUICounterView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
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

@implementation SKUICounterView

- (void)dealloc
{
  updateTimer = self->_updateTimer;
  if (updateTimer) {
    dispatch_source_cancel(updateTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUICounterView;
  [(SKUIViewReuseView *)&v4 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUICounterView prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v17 = [v7 backgroundImageElement];
  if (v17) {
    char v18 = [v8 prefetchResourcesForViewElement:v17 reason:a4];
  }
  else {
    char v18 = 0;
  }

  return v18;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUICounterView preferredSizeForViewElement:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [v5 backgroundImageElement];
  if (v15)
  {
    [v6 sizeForImageElement:v15];
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB30];
    double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUICounterView requestLayoutForViewElement:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUICounterView sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  [a1 preferredSizeForViewElement:v7 context:v8];
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = (SKUICounterViewElement *)a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUICounterView reloadWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  if (self->_counterElement != v8)
  {
    [(SKUICounterView *)self _stopUpdateTimer];
    objc_storeStrong((id *)&self->_counterElement, a3);
    numberFormatter = self->_numberFormatter;
    self->_numberFormatter = 0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__SKUICounterView_reloadWithViewElement_width_context___block_invoke;
  v23[3] = &unk_1E6422380;
  double v19 = v8;
  v24 = v19;
  v25 = self;
  id v20 = v9;
  id v26 = v20;
  [(SKUIViewReuseView *)self modifyUsingBlock:v23];
  uint64_t v21 = [(SKUICounterViewElement *)v19 counterType];
  if (!v21)
  {
    [(SKUICounterView *)self _addTimeViewWithViewElement:v19 context:v20];
    double v22 = &OBJC_IVAR___SKUICounterView__numberView;
    goto LABEL_11;
  }
  if (v21 == 1)
  {
    [(SKUICounterView *)self _addNumberViewWithViewElement:v19 context:v20];
    double v22 = &OBJC_IVAR___SKUICounterView__timeView;
LABEL_11:
    [*(id *)((char *)&self->super.super.super.super.isa + *v22) setHidden:1];
  }
  [(SKUICounterView *)self _reloadUpdateTimer];
}

void __55__SKUICounterView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
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
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUICounterView setContentInset:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = self->_contentInset.top;
  if (self->_contentInset.left != left
    || v16 != top
    || self->_contentInset.right != right
    || self->_contentInset.bottom != bottom)
  {
    self->_contentInset.double top = top;
    self->_contentInset.double left = left;
    self->_contentInset.double bottom = bottom;
    self->_contentInset.double right = right;
    [(SKUICounterView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v11) {
        -[SKUICounterView setImage:forArtworkRequest:context:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  double v19 = [(SKUICounterViewElement *)self->_counterElement backgroundImageElement];
  if (v19
    && (uint64_t v20 = [v9 requestIdentifier],
        [v10 requestIdentifierForViewElement:v19],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v22 = [v21 unsignedIntegerValue],
        v21,
        v20 == v22))
  {
    [(SKUIImageView *)self->_imageView setImage:v8];
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICounterView updateWithItemState:context:animated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUICounterView viewForElementIdentifier:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)didMoveToWindow
{
}

- (void)didMoveToSuperview
{
}

- (void)layoutSubviews
{
}

- (void)setAlpha:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICounterView setAlpha:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICounterView;
  [(SKUICounterView *)&v13 setAlpha:a3];
  [(SKUICounterView *)self _reloadUpdateTimer];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICounterView setHidden:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICounterView;
  [(SKUICounterView *)&v13 setHidden:v3];
  [(SKUICounterView *)self _reloadUpdateTimer];
}

- (void)_addNumberViewWithViewElement:(id)a3 context:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (!self->_numberView)
  {
    uint64_t v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    numberView = self->_numberView;
    self->_numberView = v7;

    uint64_t v9 = self->_numberView;
    uint64_t v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    [(UILabel *)self->_numberView setTextAlignment:1];
  }
  uint64_t v11 = [v16 style];
  uint64_t v12 = self->_numberView;
  objc_super v13 = SKUIViewElementFontWithStyle(v11);
  [(UILabel *)v12 setFont:v13];

  uint64_t v14 = [v6 tintColor];
  uint64_t v15 = SKUIViewElementPlainColorWithStyle(v11, v14);

  [(UILabel *)self->_numberView setTextColor:v15];
  [(UILabel *)self->_numberView setHidden:0];
  [(SKUICounterView *)self addSubview:self->_numberView];
  [(SKUICounterView *)self _reloadNumberValue];
}

- (void)_addTimeViewWithViewElement:(id)a3 context:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (!self->_timeView)
  {
    uint64_t v7 = [SKUICounterTimeView alloc];
    uint64_t v8 = [v6 clientContext];
    uint64_t v9 = [(SKUICounterTimeView *)v7 initWithClientContext:v8];
    timeView = self->_timeView;
    self->_timeView = v9;

    uint64_t v11 = self->_timeView;
    uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUICounterTimeView *)v11 setBackgroundColor:v12];
  }
  objc_super v13 = [v20 style];
  uint64_t v14 = self->_timeView;
  uint64_t v15 = [v20 endDate];
  [(SKUICounterTimeView *)v14 setEndDate:v15];

  id v16 = [v6 tintColor];
  uint64_t v17 = SKUIViewElementPlainColorWithStyle(v13, v16);

  [(SKUICounterTimeView *)self->_timeView setTextColor:v17];
  uint64_t v18 = self->_timeView;
  double v19 = SKUIViewElementFontWithStyle(v13);
  [(SKUICounterTimeView *)v18 setValueFont:v19];

  -[SKUICounterTimeView setVisibleFields:](self->_timeView, "setVisibleFields:", -[SKUICounterView _visibleTimeFieldsForDateFormat:](self, "_visibleTimeFieldsForDateFormat:", [v20 dateFormatType]));
  [(SKUICounterTimeView *)self->_timeView setHidden:0];
  [(SKUICounterView *)self addSubview:self->_timeView];
}

- (void)_reloadNumberValue
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    uint64_t v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    BOOL v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:1];
    id v6 = self->_numberFormatter;
    uint64_t v7 = [(SKUICounterViewElement *)self->_counterElement numberFormat];
    [(NSNumberFormatter *)v6 setPositiveFormat:v7];

    numberFormatter = self->_numberFormatter;
  }
  numberView = self->_numberView;
  objc_msgSend(NSNumber, "numberWithLongLong:", -[SKUICounterViewElement currentNumberValue](self->_counterElement, "currentNumberValue"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v10];
  [(UILabel *)numberView setText:v9];
}

- (void)_reloadUpdateTimer
{
  if (([(SKUICounterView *)self isHidden] & 1) != 0
    || ([(SKUICounterView *)self alpha], v3 < 0.00000011920929)
    || ([(SKUICounterView *)self window],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    [(SKUICounterView *)self _stopUpdateTimer];
  }
  else
  {
    [(SKUICounterView *)self _startUpdateTimer];
  }
}

- (void)_startUpdateTimer
{
  if (!self->_updateTimer)
  {
    double v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v3;

    if ([(SKUICounterViewElement *)self->_counterElement counterType] == 1)
    {
      [(SKUICounterViewElement *)self->_counterElement changeRatePerSecond];
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
    uint64_t v11 = self->_updateTimer;
    dispatch_time_t v12 = dispatch_time(0, v10);
    dispatch_source_set_timer(v11, v12, v10, 0);
    objc_initWeak(&location, self);
    objc_super v13 = self->_updateTimer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__SKUICounterView__startUpdateTimer__block_invoke;
    v14[3] = &unk_1E6422250;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __36__SKUICounterView__startUpdateTimer__block_invoke(uint64_t a1)
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
    uint64_t v4 = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

- (void)_updateTimerAction
{
  timeView = self->_timeView;
  if (timeView && ([(SKUICounterTimeView *)timeView isHidden] & 1) == 0) {
    [(SKUICounterTimeView *)self->_timeView reloadTimeValue];
  }
  numberView = self->_numberView;
  if (numberView && ([(UILabel *)numberView isHidden] & 1) == 0)
  {
    [(SKUICounterView *)self _reloadNumberValue];
  }
}

- (unint64_t)_visibleTimeFieldsForDateFormat:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 7;
  }
  else {
    return qword_1C1CCC308[a3];
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

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setAlpha:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setHidden:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end