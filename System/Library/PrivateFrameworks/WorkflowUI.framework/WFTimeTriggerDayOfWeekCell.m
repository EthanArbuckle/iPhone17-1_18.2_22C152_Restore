@interface WFTimeTriggerDayOfWeekCell
- (NSArray)buttons;
- (NSSet)selectedRecurrences;
- (UIStackView)stackView;
- (WFTimeTriggerDayOfWeekCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFTimeTriggerDayOfWeekCellDelegate)delegate;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedRecurrences:(id)a3;
- (void)setStackView:(id)a3;
- (void)setupConstraints;
- (void)tintColorDidChange;
- (void)toggleWeekdayButton:(id)a3;
- (void)updateSelectedDays;
@end

@implementation WFTimeTriggerDayOfWeekCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_selectedRecurrences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setStackView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setButtons:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (NSSet)selectedRecurrences
{
  return self->_selectedRecurrences;
}

- (void)setDelegate:(id)a3
{
}

- (WFTimeTriggerDayOfWeekCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTimeTriggerDayOfWeekCellDelegate *)WeakRetained;
}

- (void)setupConstraints
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20 = self;
  v4 = [(WFTimeTriggerDayOfWeekCell *)self buttons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = [v9 widthAnchor];
        v11 = [v10 constraintEqualToConstant:48.0];

        LODWORD(v12) = 1144733696;
        [v11 setPriority:v12];
        [v3 addObject:v11];
        v13 = [v9 heightAnchor];
        v14 = [v9 widthAnchor];
        v15 = [v13 constraintEqualToAnchor:v14];
        [v3 addObject:v15];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  v16 = [(WFTimeTriggerDayOfWeekCell *)v20 stackView];
  v17 = [(WFTimeTriggerDayOfWeekCell *)v20 contentView];
  v18 = [v17 layoutMarginsGuide];
  id v19 = (id)objc_msgSend(v16, "wf_addConstraintsToFillLayoutGuide:", v18);

  [MEMORY[0x263F08938] activateConstraints:v3];
}

- (void)toggleWeekdayButton:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 tag] <= 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFTimeTriggerDayOfWeekCell.m", 107, @"Button tag was not setup: %@", v5 object file lineNumber description];
  }
  else
  {
    uint64_t v6 = [v5 tag];
    char v7 = [v5 isSelected];
    id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v8 setWeekday:v6];
    v9 = [(WFTimeTriggerDayOfWeekCell *)self selectedRecurrences];
    v10 = (void *)[v9 mutableCopy];

    if (v7)
    {
      SEL v21 = a2;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
LABEL_5:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
          if ([v16 weekday] == v6) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v13) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v18 = v16;

        if (!v18) {
          goto LABEL_12;
        }
      }
      else
      {
LABEL_11:

LABEL_12:
        v17 = [MEMORY[0x263F08690] currentHandler];
        [v17 handleFailureInMethod:v21, self, @"WFTimeTriggerDayOfWeekCell.m", 129, @"Asked to deselect date components (%@), which isn't in the set of currently-selected date components (%@)", v8, v11 object file lineNumber description];

        id v18 = 0;
      }
      [v11 removeObject:v18];
    }
    else
    {
      [v10 addObject:v8];
    }
    [(WFTimeTriggerDayOfWeekCell *)self setSelectedRecurrences:v10];
    id v19 = [(WFTimeTriggerDayOfWeekCell *)self delegate];
    v20 = [(WFTimeTriggerDayOfWeekCell *)self selectedRecurrences];
    [v19 dayOfWeekPickerCell:self didChangeSelectedRecurrences:v20];
  }
}

- (void)updateSelectedDays
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(WFTimeTriggerDayOfWeekCell *)self selectedRecurrences];
  v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_11900);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(WFTimeTriggerDayOfWeekCell *)self buttons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "tag"));
        objc_msgSend(v10, "setSelected:", objc_msgSend(v4, "containsObject:", v11));

        if ([v10 isSelected]) {
          [(WFTimeTriggerDayOfWeekCell *)self tintColor];
        }
        else {
        uint64_t v12 = [MEMORY[0x263F825C8] systemGrayColor];
        }
        [v10 setBackgroundColor:v12];

        uint64_t v13 = [MEMORY[0x263F825C8] whiteColor];
        [v10 setTitleColor:v13 forState:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

id __48__WFTimeTriggerDayOfWeekCell_updateSelectedDays__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 weekday] < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "weekday"));
  }

  return v3;
}

- (void)setSelectedRecurrences:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRecurrences, a3);
  [(WFTimeTriggerDayOfWeekCell *)self updateSelectedDays];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFTimeTriggerDayOfWeekCell;
  [(WFTimeTriggerDayOfWeekCell *)&v3 tintColorDidChange];
  [(WFTimeTriggerDayOfWeekCell *)self updateSelectedDays];
}

- (WFTimeTriggerDayOfWeekCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)WFTimeTriggerDayOfWeekCell;
  v4 = [(WFTimeTriggerDayOfWeekCell *)&v26 initWithStyle:0 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(WFTimeTriggerDayOfWeekCell *)v4 setSelectionStyle:0];
    uint64_t v6 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackView = v5->_stackView;
    v5->_stackView = v6;

    [(UIStackView *)v5->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v5->_stackView setSpacing:14.0];
    [(UIStackView *)v5->_stackView setDistribution:1];
    uint64_t v8 = [(WFTimeTriggerDayOfWeekCell *)v5 contentView];
    [v8 addSubview:v5->_stackView];

    v9 = objc_opt_new();
    v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v11 = [v10 veryShortWeekdaySymbols];

    uint64_t v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v13 = [v12 firstWeekday];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __60__WFTimeTriggerDayOfWeekCell_initWithStyle_reuseIdentifier___block_invoke;
    v22[3] = &unk_2649CB608;
    long long v14 = v5;
    id v24 = v9;
    uint64_t v25 = v13;
    long long v23 = v14;
    id v15 = v9;
    [v11 enumerateObjectsUsingBlock:v22];
    [(WFTimeTriggerDayOfWeekCell *)v14 setButtons:v15];
    [(WFTimeTriggerDayOfWeekCell *)v14 setupConstraints];
    [(WFTimeTriggerDayOfWeekCell *)v14 updateSelectedDays];
    long long v16 = [(WFTimeTriggerDayOfWeekCell *)v14 stackView];
    long long v17 = [(WFTimeTriggerDayOfWeekCell *)v14 contentView];
    id v18 = [v17 layoutMarginsGuide];
    id v19 = (id)objc_msgSend(v16, "wf_addConstraintsToFillLayoutGuide:", v18);

    v20 = v14;
  }

  return v5;
}

void __60__WFTimeTriggerDayOfWeekCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v11 = +[WFDayOfWeekButton buttonWithType:0];
  [v11 setTitle:v5 forState:0];

  uint64_t v6 = [MEMORY[0x263F81708] systemFontOfSize:*MEMORY[0x263F81788] weight:17.0 design:*MEMORY[0x263F81828]];
  uint64_t v7 = [v11 titleLabel];
  [v7 setFont:v6];

  uint64_t v8 = [v11 titleLabel];
  [v8 setTextAlignment:1];

  [v11 setTag:a3 + 1];
  [v11 addTarget:*(void *)(a1 + 32) action:sel_toggleWeekdayButton_ forControlEvents:64];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ((unint64_t)[v11 tag] >= *(void *)(a1 + 48))
  {
    uint64_t v10 = [v11 tag] - *(void *)(a1 + 48);
    [*(id *)(a1 + 40) insertObject:v11 atIndex:v10];
    v9 = [*(id *)(a1 + 32) stackView];
    [v9 insertArrangedSubview:v11 atIndex:v10];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v11];
    v9 = [*(id *)(a1 + 32) stackView];
    [v9 addArrangedSubview:v11];
  }
}

@end