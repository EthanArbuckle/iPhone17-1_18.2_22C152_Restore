@interface SKUICounterTimeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDate)endDate;
- (SKUICounterTimeView)initWithClientContext:(id)a3;
- (UIColor)textColor;
- (UIFont)valueFont;
- (double)_fieldSpacingForFieldCount:(int64_t)a3 fieldWidth:(double)a4 totalWidth:(double)a5;
- (id)_allFieldViews;
- (id)_visibleFieldViews;
- (unint64_t)visibleFields;
- (void)_setValuesUsingTimestamp:(int64_t)a3;
- (void)layoutSubviews;
- (void)reloadTimeValue;
- (void)setBackgroundColor:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setValueFont:(id)a3;
- (void)setVisibleFields:(unint64_t)a3;
@end

@implementation SKUICounterTimeView

- (SKUICounterTimeView)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICounterTimeView initWithClientContext:]();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUICounterTimeView;
  v6 = [(SKUICounterTimeView *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v7->_visibleFields = 255;
    v8 = objc_alloc_init(_SKUICounterTimeFieldView);
    daysFieldView = v7->_daysFieldView;
    v7->_daysFieldView = v8;

    v10 = [(_SKUICounterTimeFieldView *)v7->_daysFieldView labelLabel];
    if (v5) {
      [v5 localizedStringForKey:@"COUNTDOWN_DAYS"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"COUNTDOWN_DAYS" inBundles:0];
    }
    [v10 setText:v11];

    [(_SKUICounterTimeFieldView *)v7->_daysFieldView setVisibilityField:1];
    [(SKUICounterTimeView *)v7 addSubview:v7->_daysFieldView];
    v12 = objc_alloc_init(_SKUICounterTimeFieldView);
    hoursFieldView = v7->_hoursFieldView;
    v7->_hoursFieldView = v12;

    v14 = [(_SKUICounterTimeFieldView *)v7->_hoursFieldView labelLabel];
    if (v5) {
      [v5 localizedStringForKey:@"COUNTDOWN_HOURS"];
    }
    else {
    v15 = +[SKUIClientContext localizedStringForKey:@"COUNTDOWN_HOURS" inBundles:0];
    }
    [v14 setText:v15];

    [(_SKUICounterTimeFieldView *)v7->_hoursFieldView setVisibilityField:2];
    [(SKUICounterTimeView *)v7 addSubview:v7->_hoursFieldView];
    v16 = objc_alloc_init(_SKUICounterTimeFieldView);
    minutesFieldView = v7->_minutesFieldView;
    v7->_minutesFieldView = v16;

    v18 = [(_SKUICounterTimeFieldView *)v7->_minutesFieldView labelLabel];
    if (v5) {
      [v5 localizedStringForKey:@"COUNTDOWN_MINUTES"];
    }
    else {
    v19 = +[SKUIClientContext localizedStringForKey:@"COUNTDOWN_MINUTES" inBundles:0];
    }
    [v18 setText:v19];

    [(_SKUICounterTimeFieldView *)v7->_minutesFieldView setVisibilityField:4];
    [(SKUICounterTimeView *)v7 addSubview:v7->_minutesFieldView];
    v20 = objc_alloc_init(_SKUICounterTimeFieldView);
    secondsFieldView = v7->_secondsFieldView;
    v7->_secondsFieldView = v20;

    v22 = [(_SKUICounterTimeFieldView *)v7->_secondsFieldView labelLabel];
    if (v5) {
      [v5 localizedStringForKey:@"COUNTDOWN_SECONDS"];
    }
    else {
    v23 = +[SKUIClientContext localizedStringForKey:@"COUNTDOWN_SECONDS" inBundles:0];
    }
    [v22 setText:v23];

    [(_SKUICounterTimeFieldView *)v7->_secondsFieldView setVisibilityField:8];
    [(SKUICounterTimeView *)v7 addSubview:v7->_secondsFieldView];
  }

  return v7;
}

- (void)reloadTimeValue
{
  [(NSDate *)self->_endDate timeIntervalSinceNow];
  int64_t v4 = (uint64_t)v3 & ~((uint64_t)v3 >> 63);
  if (self->_lastTimeValue != v4)
  {
    self->_lastTimeValue = v4;
    -[SKUICounterTimeView _setValuesUsingTimestamp:](self, "_setValuesUsingTimestamp:");
  }
}

- (void)setEndDate:(id)a3
{
  id v4 = a3;
  uint64_t endDate = (uint64_t)self->_endDate;
  if ((id)endDate != v4)
  {
    v9 = v4;
    uint64_t endDate = [(id)endDate isEqualToDate:v4];
    id v4 = v9;
    if ((endDate & 1) == 0)
    {
      v6 = (NSDate *)[v9 copy];
      v7 = self->_endDate;
      self->_uint64_t endDate = v6;

      [(NSDate *)self->_endDate timeIntervalSinceNow];
      self->_lastTimeValue = (uint64_t)fmax(v8, 0.0);
      uint64_t endDate = -[SKUICounterTimeView _setValuesUsingTimestamp:](self, "_setValuesUsingTimestamp:");
      id v4 = v9;
    }
  }

  MEMORY[0x1F41817F8](endDate, v4);
}

- (void)setTextColor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_textColor != a3)
  {
    id v4 = (UIColor *)[a3 copy];
    textColor = self->_textColor;
    self->_textColor = v4;

    v6 = [(SKUICounterTimeView *)self _allFieldViews];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v12 = [v11 labelLabel];
          [v12 setTextColor:self->_textColor];

          v13 = [v11 valueLabel];
          [v13 setTextColor:self->_textColor];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)setValueFont:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_valueFont != a3)
  {
    id v4 = (UIFont *)[a3 copy];
    valueFont = self->_valueFont;
    self->_valueFont = v4;

    v6 = [(SKUICounterTimeView *)self _allFieldViews];
    uint64_t v7 = self->_valueFont;
    [(UIFont *)v7 pointSize];
    uint64_t v9 = [(UIFont *)v7 fontWithSize:fmax(v8 * 0.5, 8.0)];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v16 = objc_msgSend(v15, "labelLabel", (void)v18);
          [v16 setFont:v9];

          long long v17 = [v15 valueLabel];
          [v17 setFont:self->_valueFont];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [(SKUICounterTimeView *)self setNeedsLayout];
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    [(SKUICounterTimeView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  double v3 = [(SKUICounterTimeView *)self _allFieldViews];
  id v4 = [(SKUICounterTimeView *)self _visibleFieldViews];
  [(SKUICounterTimeView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        int v17 = [v4 containsObject:v16];
        if (v17)
        {
          [v16 frame];
          double v19 = v18;
          double v21 = v20;
          objc_msgSend(v16, "sizeThatFits:", v6, v8);
          if (v10 < v23) {
            double v10 = v23;
          }
          double v9 = v9 + v22;
          objc_msgSend(v16, "setFrame:", v19, v21, v22, v23);
        }
        [v16 setHidden:v17 ^ 1u];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v13);
  }

  uint64_t v24 = [v4 count];
  [(SKUICounterTimeView *)self _fieldSpacingForFieldCount:v24 fieldWidth:v9 totalWidth:v6];
  double v26 = v25;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v27 = v4;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    float v30 = v8 - v10;
    float v31 = (v6 - (v9 + (double)(v24 + 1) * v26)) * 0.5;
    double v32 = v26 + floorf(v31);
    uint64_t v33 = *(void *)v43;
    double v34 = v10 + (float)(floorf(v30) * 0.5);
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v43 != v33) {
          objc_enumerationMutation(v27);
        }
        v36 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        objc_msgSend(v36, "frame", (void)v42);
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v41 = v34 - v39;
        objc_msgSend(v36, "setFrame:", v32, v34 - v39);
        v53.origin.x = v32;
        v53.origin.y = v41;
        v53.size.width = v38;
        v53.size.height = v40;
        double v32 = v26 + CGRectGetMaxX(v53);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v29);
  }
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SKUICounterTimeView *)self _allFieldViews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setBackgroundColor:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUICounterTimeView;
  [(SKUICounterTimeView *)&v10 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double v7 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v8 = [(SKUICounterTimeView *)self _visibleFieldViews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12), "sizeThatFits:", width, height);
        if (v6 < v14) {
          double v6 = v14;
        }
        double v7 = v7 + v13;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  uint64_t v15 = [v8 count];
  double v16 = (double)(v15 + 1);
  [(SKUICounterTimeView *)self _fieldSpacingForFieldCount:v15 fieldWidth:v7 totalWidth:width];
  double v18 = v7 + v16 * v17;
  if (v18 < width) {
    double width = v18;
  }

  double v19 = width;
  double v20 = v6;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (id)_allFieldViews
{
  v6[4] = *MEMORY[0x1E4F143B8];
  hoursFieldView = self->_hoursFieldView;
  v6[0] = self->_daysFieldView;
  v6[1] = hoursFieldView;
  secondsFieldView = self->_secondsFieldView;
  v6[2] = self->_minutesFieldView;
  v6[3] = secondsFieldView;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return v4;
}

- (double)_fieldSpacingForFieldCount:(int64_t)a3 fieldWidth:(double)a4 totalWidth:(double)a5
{
  float v5 = (a5 - a4) / (double)(a3 + 1);
  float v6 = floorf(v5);
  float v7 = 5.0;
  if (v6 > 5.0) {
    float v7 = v6;
  }
  double v8 = v7;
  BOOL v9 = v6 <= 14.0;
  double result = 14.0;
  if (v9) {
    return v8;
  }
  return result;
}

- (void)_setValuesUsingTimestamp:(int64_t)a3
{
  if (!_setValuesUsingTimestamp__sActualValueFormatter)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    float v6 = (void *)_setValuesUsingTimestamp__sActualValueFormatter;
    _setValuesUsingTimestamp__sActualValueFormatter = (uint64_t)v5;

    [(id)_setValuesUsingTimestamp__sActualValueFormatter setNumberStyle:1];
  }
  if (!_setValuesUsingTimestamp__sPaddedValueFormatter)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    double v8 = (void *)_setValuesUsingTimestamp__sPaddedValueFormatter;
    _setValuesUsingTimestamp__sPaddedValueFormatter = (uint64_t)v7;

    [(id)_setValuesUsingTimestamp__sPaddedValueFormatter setNumberStyle:1];
    [(id)_setValuesUsingTimestamp__sPaddedValueFormatter setPositiveFormat:@"00"];
  }
  id v24 = (id)_setValuesUsingTimestamp__sActualValueFormatter;
  BOOL v9 = [(_SKUICounterTimeFieldView *)self->_daysFieldView valueLabel];
  uint64_t v10 = [NSNumber numberWithInteger:a3 / 86400];
  uint64_t v11 = [v24 stringFromNumber:v10];
  [v9 setText:v11];

  if (a3 > 86399)
  {
    id v12 = (id)_setValuesUsingTimestamp__sPaddedValueFormatter;

    id v24 = v12;
  }
  double v13 = [(_SKUICounterTimeFieldView *)self->_hoursFieldView valueLabel];
  double v14 = [NSNumber numberWithInteger:a3 / 3600 % 24];
  uint64_t v15 = [v24 stringFromNumber:v14];
  [v13 setText:v15];

  if (a3 / 3600 % 24 >= 1)
  {
    id v16 = (id)_setValuesUsingTimestamp__sPaddedValueFormatter;

    id v24 = v16;
  }
  double v17 = [(_SKUICounterTimeFieldView *)self->_minutesFieldView valueLabel];
  double v18 = [NSNumber numberWithInteger:a3 / 60 % 60];
  double v19 = [v24 stringFromNumber:v18];
  [v17 setText:v19];

  double v20 = [(_SKUICounterTimeFieldView *)self->_secondsFieldView valueLabel];
  long long v21 = (void *)_setValuesUsingTimestamp__sPaddedValueFormatter;
  long long v22 = [NSNumber numberWithInteger:a3 % 60];
  long long v23 = [v21 stringFromNumber:v22];
  [v20 setText:v23];

  [(SKUICounterTimeView *)self setNeedsLayout];
}

- (id)_visibleFieldViews
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v3 = [(SKUICounterTimeView *)self _allFieldViews];
  id v15 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 valueLabel];
        uint64_t v11 = [v10 text];
        if ([v11 length])
        {
          unint64_t visibleFields = self->_visibleFields;
          uint64_t v13 = [v9 visibilityField] & visibleFields;

          if (v13) {
            [v15 addObject:v9];
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v15;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_secondsFieldView, 0);
  objc_storeStrong((id *)&self->_minutesFieldView, 0);
  objc_storeStrong((id *)&self->_hoursFieldView, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_daysFieldView, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICounterTimeView initWithClientContext:]";
}

@end