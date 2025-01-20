@interface _UICalendarWeekdayView
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (_UICalendarDataModel)dataModel;
- (_UICalendarWeekdayView)initWithDataModel:(id)a3;
- (_UIDatePickerLinkedLabel)sizingLabel;
- (double)preferredLabelWidth;
- (void)_rebuildLabels;
- (void)_setNeedsRebuildLabels;
- (void)_updateFont;
- (void)layoutSubviews;
- (void)setPreferredLabelWidth:(double)a3;
@end

@implementation _UICalendarWeekdayView

- (_UICalendarWeekdayView)initWithDataModel:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICalendarWeekdayView;
  v6 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataModel, a3);
    [(_UICalendarWeekdayView *)v7 _rebuildLabels];
    [(UIView *)v7 setPreservesSuperviewLayoutMargins:1];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v9 = [(UIView *)v7 registerForTraitChanges:v8 withAction:sel__updateFont];
  }
  return v7;
}

- (void)_updateFont
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(UIView *)self traitCollection];
  double v4 = *(double *)off_1E52D6C00;
  id v5 = [(_UICalendarDataModel *)self->_dataModel fontDesign];
  v6 = _UICalendarFontWithWeight(@"UICTFontTextStyleFootnote", (uint64_t)v3, v5, v4);

  [(_UIDatePickerLinkedLabel *)self->_sizingLabel setFont:v6];
  [(UIView *)self->_sizingLabel invalidateIntrinsicContentSize];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_labels;
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
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setFont:", v6, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)_rebuildLabels
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v3 = self->_labels;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v49 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v5);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___UICalendarWeekdayView__rebuildLabels__block_invoke;
  aBlock[3] = &unk_1E5308C10;
  aBlock[4] = self;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  uint64_t v10 = [v9 shortStandaloneWeekdaySymbols];
  v44 = _UICalendarMap(v10, v8);

  uint64_t v11 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  [v11 veryShortStandaloneWeekdaySymbols];
  long long v12 = v45 = self;
  v43 = v8;
  long long v13 = _UICalendarMap(v12, v8);

  long long v14 = v45;
  long long v15 = [(UIView *)v45 traitCollection];
  uint64_t v16 = _UICalendarViewGetPlatformMetrics([v15 userInterfaceIdiom]);

  uint64_t v17 = [(UIView *)v45 traitCollection];
  double v18 = *(double *)off_1E52D6C00;
  v19 = [(_UICalendarDataModel *)v45->_dataModel fontDesign];
  uint64_t v20 = _UICalendarFontWithWeight(@"UICTFontTextStyleFootnote", (uint64_t)v17, v19, v18);

  sizingLabel = v45->_sizingLabel;
  v42 = (void *)v16;
  v22 = (void *)v20;
  if (sizingLabel) {
    v23 = sizingLabel;
  }
  else {
    v23 = (_UIDatePickerLinkedLabel *)objc_opt_new();
  }
  v46 = v23;
  v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v44];
  v53[0] = v24;
  v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
  v53[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  [(_UIDatePickerLinkedLabel *)v46 setPossibleTitles:v26];

  [(_UIDatePickerLinkedLabel *)v46 setFont:v22];
  objc_storeStrong((id *)&v45->_sizingLabel, v46);
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v44, "count"));
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v28 = v44;
  v29 = [(_UICalendarDataModel *)v45->_dataModel effectiveCalendar];
  uint64_t v30 = [v29 firstWeekday];

  uint64_t v31 = [v44 count];
  if (v31 >= 1)
  {
    uint64_t v32 = v31;
    uint64_t v33 = v30 - 1;
    uint64_t v34 = v31;
    do
    {
      v35 = objc_opt_new();
      v36 = [(_UIDatePickerLinkedLabel *)v46 storage];
      [v35 setStorage:v36];

      [v35 setFont:v22];
      v37 = [v28 objectAtIndexedSubscript:v33];
      v52[0] = v37;
      v38 = [v13 objectAtIndexedSubscript:v33];
      v52[1] = v38;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
      [v35 setTitles:v39];

      long long v14 = v45;
      v40 = [v42 weekdayLabelTextColor];
      [v35 setTextColor:v40];

      v28 = v44;
      [v35 setTextAlignment:1];
      [v35 setBackgroundColor:0];
      [(NSArray *)v27 addObject:v35];
      [(UIView *)v45 addSubview:v35];
      uint64_t v33 = (v33 + 1) % v32;

      --v34;
    }
    while (v34);
  }
  labels = v14->_labels;
  v14->_labels = v27;

  v14->_flags.rebuildLabels = 0;
}

- (void)setPreferredLabelWidth:(double)a3
{
  self->_preferredLabelWidth = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)_setNeedsRebuildLabels
{
  self->_flags.rebuildLabels = 1;
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)_UICalendarWeekdayView;
  [(UIView *)&v44 layoutSubviews];
  if (self->_flags.rebuildLabels) {
    [(_UICalendarWeekdayView *)self _rebuildLabels];
  }
  [(UIView *)self bounds];
  if (v3 != 0.0)
  {
    uint64_t v4 = [(UIView *)self traitCollection];
    uint64_t v5 = _UICalendarViewGetPlatformMetrics([v4 userInterfaceIdiom]);

    uint64_t v6 = [(NSArray *)self->_labels count];
    [(UIView *)self bounds];
    double v8 = v7;
    [(UIView *)self layoutMargins];
    double v11 = v8 - (v9 + v10);
    BOOL v12 = [(UIView *)self _shouldReverseLayoutDirection];
    double v13 = (double)v6;
    UIRoundToViewScale(self);
    double v15 = v14;
    sizingLabel = self->_sizingLabel;
    [(UIView *)self bounds];
    -[_UIDatePickerLinkedLabel sizeThatFits:](sizingLabel, "sizeThatFits:", v15, v17);
    double v43 = v18;
    double v20 = v19;
    [(_UICalendarWeekdayView *)self preferredLabelWidth];
    double v42 = v21;
    [v5 dateViewCellSpacing];
    double v22 = 0.0;
    if (v23 > 0.0)
    {
      [v5 dateViewCellSpacing];
      double v22 = v24 * 0.5;
    }
    [(UIView *)self layoutMargins];
    double v26 = v25;
    [(UIView *)self layoutMargins];
    double v28 = v27;
    [(UIView *)self bounds];
    double v30 = v29;
    [(UIView *)self bounds];
    uint64_t v32 = v6 - 1;
    if (v6 >= 1)
    {
      uint64_t v33 = 0;
      double v34 = fmax(v42, fmin(v43, v15));
      double v35 = (v11 - v34 * v13) / (double)(v6 - 1) * 0.5;
      double v36 = v22 + fmax(v26 - v35, 0.0);
      double v37 = (v30 - v36 - (v22 + fmax(v28 - v35, 0.0))) / v13;
      double v38 = v31 * 0.5;
      double v39 = v36 + v37 * 0.5;
      do
      {
        if (v12) {
          uint64_t v40 = v32;
        }
        else {
          uint64_t v40 = v33;
        }
        v41 = [(NSArray *)self->_labels objectAtIndex:v40];
        objc_msgSend(v41, "setBounds:", 0.0, 0.0, v34, v20);
        objc_msgSend(v41, "setCenter:", v39, v38);
        double v39 = v37 + v39;

        ++v33;
        --v32;
      }
      while (v32 != -1);
    }
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = (double)[(NSArray *)self->_labels count];
  -[_UIDatePickerLinkedLabel sizeThatFits:](self->_sizingLabel, "sizeThatFits:", width / v6, height);
  double v8 = v7;
  double v10 = v9 * v6;
  double v11 = [(UIView *)self traitCollection];
  BOOL v12 = _UICalendarViewGetPlatformMetrics([v11 userInterfaceIdiom]);

  [v12 weekdayViewMinimumHeight];
  double v14 = fmax(v8, v13);

  double v15 = fmax(v10, width);
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (_UICalendarDataModel)dataModel
{
  return self->_dataModel;
}

- (_UIDatePickerLinkedLabel)sizingLabel
{
  return self->_sizingLabel;
}

- (double)preferredLabelWidth
{
  return self->_preferredLabelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingLabel, 0);
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end