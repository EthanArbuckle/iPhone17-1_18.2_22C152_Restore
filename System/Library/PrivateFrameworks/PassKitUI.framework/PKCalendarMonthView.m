@interface PKCalendarMonthView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCalendarMonthView)init;
- (void)_formViewsWithDataSource:(id)a3 appearance:(id)a4 headerView:(id)a5;
- (void)calendarDayViewTapped:(id)a3 withDate:(id)a4;
- (void)layoutSubviews;
@end

@implementation PKCalendarMonthView

- (PKCalendarMonthView)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKCalendarMonthView;
  v2 = -[PKCalendarMonthView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    v4 = [(PKCalendarMonthView *)v2 layer];
    [v4 setCornerRadius:10.0];
    [v4 setMaskedCorners:15];
    v5 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(PKCalendarMonthView *)v3 setBackgroundColor:v5];

    [(PKCalendarMonthView *)v3 setClipsToBounds:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCalendarMonthView;
  [(PKCalendarMonthView *)&v3 layoutSubviews];
  [(PKCalendarMonthView *)self bounds];
  -[PKCalendarMonthView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKCalendarMonthView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double x = a3.origin.x;
  double width = a3.size.width;
  double y = a3.origin.y;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  double v7 = 0.0;
  if ([(NSArray *)self->_dayViews count])
  {
    v8 = [(NSArray *)self->_dayViews objectAtIndexedSubscript:0];
    [v8 count];
  }
  unint64_t v9 = [(NSArray *)self->_dayViews count];
  double v10 = width + -16.0;
  PKFloatRoundToPixel();
  double v12 = v11;
  if ([(NSArray *)self->_dayViews count])
  {
    v13 = [(NSArray *)self->_dayViews objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      v15 = [(NSArray *)self->_dayViews objectAtIndexedSubscript:0];
      v16 = [v15 objectAtIndexedSubscript:0];

      objc_msgSend(v16, "verticalMarginWithBounds:", x + 8.0, y + 0.0, v12, v12);
      double v7 = v17;
    }
  }
  double v18 = v7 + 0.0;
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  headerView = self->_headerView;
  double v64 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v65 = *MEMORY[0x1E4F1DB28];
  if (headerView)
  {
    double v22 = v7;
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", width + -32.0, 3.40282347e38);
    double v24 = width;
    PKRectCenteredXInRect();
    uint64_t v55 = v25;
    uint64_t v57 = v26;
    uint64_t v59 = v27;
    double v61 = v28;
    double v20 = v23;
    double v7 = v22;
    double v18 = v22 + v18 + v28;
  }
  else
  {
    double v24 = width;
    uint64_t v59 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    double v61 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v55 = *MEMORY[0x1E4F1DB28];
    uint64_t v57 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
  }
  if (self->_headerSeparatorView)
  {
    PKUIPixelLength();
    double v29 = v24;
    PKRectCenteredXInRect();
    double v65 = v30;
    double v66 = v31;
    double v68 = v32;
    double v64 = v33;
    double v18 = v18 + v33;
  }
  else
  {
    double v66 = v20;
    double v68 = v19;
    double v29 = v24;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v34 = self->_weekdayHeaders;
  uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v69 objects:v73 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v70;
    double v38 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v70 != v37) {
          objc_enumerationMutation(v34);
        }
        objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * i), "sizeThatFits:", v10, 3.40282347e38, v55, v57, v59, *(void *)&v61);
        double v38 = fmax(v38, v40);
      }
      uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v69 objects:v73 count:16];
    }
    while (v36);
  }
  else
  {
    double v38 = 0.0;
  }
  double v41 = (double)v9;

  double v42 = v18 + v38;
  if (!a4)
  {
    if ([(NSArray *)self->_weekdayHeaders count])
    {
      uint64_t v43 = 0;
      do
      {
        v44 = -[NSArray objectAtIndexedSubscript:](self->_weekdayHeaders, "objectAtIndexedSubscript:", v43, v55, v57, v59, *(void *)&v61);
        objc_msgSend(v44, "setFrame:", (double)v43 * v12 + 8.0, v42, v12, v38);

        ++v43;
      }
      while (v43 < [(NSArray *)self->_weekdayHeaders count]);
    }
    NSUInteger v45 = [(NSArray *)self->_weekdayHeaders count];
    double v46 = -0.0;
    if (v45) {
      double v46 = v7;
    }
    double v42 = v42 + v46;
    if (v9)
    {
      uint64_t v47 = 0;
      double v48 = 0.0;
      do
      {
        v49 = [(NSArray *)self->_dayViews objectAtIndexedSubscript:v47];
        if ([v49 count])
        {
          uint64_t v50 = 0;
          double v51 = v7 + v42 + v48 * v12;
          do
          {
            v52 = [v49 objectAtIndexedSubscript:v50];
            objc_msgSend(v52, "setFrame:", (double)v50 * v12 + 8.0, v51, v12, v12);

            ++v50;
          }
          while (v50 < (unint64_t)[v49 count]);
        }

        double v48 = (double)++v47;
      }
      while ((double)v47 < v41);
    }
    -[UIView setFrame:](self->_headerView, "setFrame:", v56, v58, v60, v62);
    -[UIView setFrame:](self->_headerSeparatorView, "setFrame:", v65, v68, v66, v64);
  }
  double v53 = v7 + v12 * v41 + v7 + 10.0 + v42;
  double v54 = v29;
  result.height = v53;
  result.double width = v54;
  return result;
}

- (void)calendarDayViewTapped:(id)a3 withDate:(id)a4
{
  v5 = (PKCalendarDayView *)a3;
  [(PKCalendarDayView *)self->_selectedDayView setSelected:0];
  selectedDayView = self->_selectedDayView;
  self->_selectedDayView = v5;
  double v7 = v5;

  [(PKCalendarDayView *)self->_selectedDayView setSelected:1];
}

- (void)_formViewsWithDataSource:(id)a3 appearance:(id)a4 headerView:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v55 = a4;
  id v48 = a5;
  id v49 = a5;
  selectedDayView = self->_selectedDayView;
  self->_selectedDayView = 0;

  p_headerView = &self->_headerView;
  [(UIView *)self->_headerView removeFromSuperview];
  [(UIView *)self->_headerSeparatorView removeFromSuperview];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v9 = self->_weekdayHeaders;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v70 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v69 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v11);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v14 = self->_dayViews;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v66 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v62;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v62 != v23) {
                objc_enumerationMutation(v20);
              }
              [*(id *)(*((void *)&v61 + 1) + 8 * k) removeFromSuperview];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v61 objects:v73 count:16];
          }
          while (v22);
        }
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v16);
  }

  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v57 = [v60 calendarMonthStartDate];
  double v56 = [v60 calendar];
  uint64_t v25 = [v60 numberOfWeeks];
  uint64_t v26 = [v60 numberOfDaysInWeek];
  uint64_t v51 = v25;
  uint64_t v27 = v55;
  if (v25 >= 1)
  {
    uint64_t v28 = v26;
    uint64_t v29 = 0;
    uint64_t v59 = 0;
    uint64_t v50 = v26;
    do
    {
      id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v53 = v29;
      uint64_t v30 = v28;
      if (v28 >= 1)
      {
        do
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
          [v31 setDay:v29];
          double v32 = [v56 dateByAddingComponents:v31 toDate:v57 options:0];
          double v33 = [v60 stringForDay:v32];
          v34 = [[PKCalendarDayView alloc] initWithDate:v32 dayString:v33 delegate:self];
          uint64_t v35 = [v27 decorationViewForDayView:v34 date:v32];
          -[PKCalendarDayView setHideDayLabel:](v34, "setHideDayLabel:", [v60 shouldShowDate:v32] ^ 1);
          -[PKCalendarDayView setSelectable:](v34, "setSelectable:", [v60 canSelectDate:v32]);
          -[PKCalendarDayView setSelected:](v34, "setSelected:", [v60 isDateSelected:v32]);
          [(PKCalendarDayView *)v34 setDecorationView:v35];
          [v58 addObject:v34];
          [(PKCalendarMonthView *)self addSubview:v34];
          if (!v59)
          {
            uint64_t v36 = self;
            uint64_t v37 = [v60 stringForWeekday:v32];
            if (v37)
            {
              double v38 = [[PKCalendarWeekdayHeaderView alloc] initWithWeekdayString:v37];
              [v54 addObject:v38];
              [(PKCalendarMonthView *)v36 addSubview:v38];

              uint64_t v27 = v55;
            }

            self = v36;
          }

          ++v29;
          --v30;
        }
        while (v30);
      }
      [v52 addObject:v58];

      uint64_t v28 = v50;
      uint64_t v29 = v53 + v50;
      ++v59;
    }
    while (v59 != v51);
  }
  objc_storeStrong((id *)p_headerView, v48);
  [(PKCalendarMonthView *)self addSubview:*p_headerView];
  if (*p_headerView)
  {
    v39 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    headerSeparatorView = self->_headerSeparatorView;
    self->_headerSeparatorView = v39;

    double v41 = self->_headerSeparatorView;
    double v42 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v41 setBackgroundColor:v42];

    [(PKCalendarMonthView *)self addSubview:self->_headerSeparatorView];
  }
  uint64_t v43 = (NSArray *)[v52 copy];
  dayViews = self->_dayViews;
  self->_dayViews = v43;

  NSUInteger v45 = (NSArray *)[v54 count];
  if (v45) {
    NSUInteger v45 = (NSArray *)[v54 copy];
  }
  weekdayHeaders = self->_weekdayHeaders;
  self->_weekdayHeaders = v45;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSeparatorView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_selectedDayView, 0);
  objc_storeStrong((id *)&self->_weekdayHeaders, 0);

  objc_storeStrong((id *)&self->_dayViews, 0);
}

@end