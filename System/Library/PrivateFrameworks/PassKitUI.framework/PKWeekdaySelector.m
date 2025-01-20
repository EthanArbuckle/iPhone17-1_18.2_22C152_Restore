@interface PKWeekdaySelector
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKWeekdaySelector)init;
- (PKWeekdaySelectorDelegate)delegate;
- (void)_weekdayTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSelectedDays:(id)a3 possibleDays:(id)a4;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PKWeekdaySelector

- (PKWeekdaySelector)init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKWeekdaySelector;
  v2 = [(PKWeekdaySelector *)&v26 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    selectedWeekdays = v2->_selectedWeekdays;
    v2->_selectedWeekdays = v3;

    v5 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v2->_stackView;
    v2->_stackView = v5;

    [(UIStackView *)v2->_stackView setLayoutMarginsRelativeArrangement:1];
    -[UIStackView setDirectionalLayoutMargins:](v2->_stackView, "setDirectionalLayoutMargins:", 0.0, 10.0, 0.0, 10.0);
    [(UIStackView *)v2->_stackView setDistribution:1];
    [(UIStackView *)v2->_stackView setAlignment:0];
    [(UIStackView *)v2->_stackView setAxis:0];
    [(PKWeekdaySelector *)v2 addSubview:v2->_stackView];
    v7 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    v8 = [v7 veryShortWeekdaySymbols];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v21 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v21) {
            objc_enumerationMutation(obj);
          }
          v12 = [[PKCalendarDayLabelView alloc] initWithDayString:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          v13 = [(UIStackView *)v2->_stackView arrangedSubviews];
          -[PKCalendarDayLabelView setTag:](v12, "setTag:", [v13 count] + 1);

          v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v2 action:sel__weekdayTapped_];
          [(PKCalendarDayLabelView *)v12 addGestureRecognizer:v14];
          v15 = [MEMORY[0x1E4FB1618] linkColor];
          v16 = [v15 colorWithAlphaComponent:0.2];

          [(PKCalendarDayLabelView *)v12 setHighlightBackgroundColor:v16];
          v17 = [MEMORY[0x1E4FB1618] linkColor];
          [(PKCalendarDayLabelView *)v12 setHighlightTextColor:v17];

          [(PKCalendarDayLabelView *)v12 setHighlightPadding:20.0];
          v18 = [MEMORY[0x1E4FB1618] grayColor];
          [(PKCalendarDayLabelView *)v12 setDisabledTextColor:v18];

          [(UIStackView *)v2->_stackView addArrangedSubview:v12];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }
  }
  return v2;
}

- (void)_weekdayTapped:(id)a3
{
  id v9 = [a3 view];
  int v4 = [v9 isSelected];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "tag"));
  selectedWeekdays = self->_selectedWeekdays;
  if (v4) {
    [(NSMutableSet *)selectedWeekdays removeObject:v5];
  }
  else {
    [(NSMutableSet *)selectedWeekdays addObject:v5];
  }
  [v9 setSelected:v4 ^ 1u];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = [(NSMutableSet *)self->_selectedWeekdays allObjects];
  [WeakRetained weekdaySelector:self didUpdateSelectedWeekdays:v8];
}

- (void)setSelectedDays:(id)a3 possibleDays:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = v6;
  v8 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v6];
  selectedWeekdays = self->_selectedWeekdays;
  self->_selectedWeekdays = v8;

  if (v7) {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v7];
  }
  else {
    uint64_t v10 = 0;
  }
  p_possibleWeekdays = &self->_possibleWeekdays;
  objc_storeStrong((id *)&self->_possibleWeekdays, v10);
  if (v7) {

  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v12 = [(UIStackView *)self->_stackView arrangedSubviews];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "tag"));
        objc_msgSend(v17, "setSelected:", -[NSMutableSet containsObject:](self->_selectedWeekdays, "containsObject:", v18));
        if (*p_possibleWeekdays) {
          uint64_t v19 = [(NSMutableSet *)*p_possibleWeekdays containsObject:v18];
        }
        else {
          uint64_t v19 = 1;
        }
        [v17 setUserInteractionEnabled:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKWeekdaySelector;
  -[PKWeekdaySelector setUserInteractionEnabled:](&v18, sel_setUserInteractionEnabled_);
  [(UIStackView *)self->_stackView setUserInteractionEnabled:v3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(UIStackView *)self->_stackView arrangedSubviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "tag"));
        possibleWeekdays = self->_possibleWeekdays;
        if (possibleWeekdays) {
          int v13 = [(NSMutableSet *)possibleWeekdays containsObject:v11];
        }
        else {
          int v13 = 1;
        }
        [v10 setUserInteractionEnabled:v3 & v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)PKWeekdaySelector;
  [(PKWeekdaySelector *)&v8 setDirectionalLayoutMargins:sel_setDirectionalLayoutMargins_];
  -[UIStackView setDirectionalLayoutMargins:](self->_stackView, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKWeekdaySelector;
  -[PKWeekdaySelector setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKWeekdaySelector *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKWeekdaySelector;
  [(PKWeekdaySelector *)&v3 layoutSubviews];
  [(PKWeekdaySelector *)self bounds];
  -[PKWeekdaySelector _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKWeekdaySelector _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width = a3.size.width;
  uint64_t v7 = [(UIStackView *)self->_stackView arrangedSubviews];
  objc_super v8 = [v7 firstObject];

  objc_msgSend(v8, "sizeThatFits:", width, 1.79769313e308);
  double v10 = v9;
  if (!a4)
  {
    -[UIStackView setFrame:](self->_stackView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, v9);
    [(UIStackView *)self->_stackView layoutSubviews];
  }

  double v11 = width;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (PKWeekdaySelectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKWeekdaySelectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_possibleWeekdays, 0);
  objc_storeStrong((id *)&self->_selectedWeekdays, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end