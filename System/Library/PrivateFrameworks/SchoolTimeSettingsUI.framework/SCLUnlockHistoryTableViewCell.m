@interface SCLUnlockHistoryTableViewCell
- (SCLHistoryItemView)historyItemView;
- (SCLUnlockHistoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation SCLUnlockHistoryTableViewCell

- (SCLUnlockHistoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v37[4] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)SCLUnlockHistoryTableViewCell;
  v5 = [(PSTableCell *)&v36 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(SCLUnlockHistoryTableViewCell *)v5 textLabel];
    [v7 setHidden:1];

    v8 = [(SCLUnlockHistoryTableViewCell *)v6 detailTextLabel];
    [v8 setHidden:1];

    v9 = [SCLHistoryItemView alloc];
    v10 = [(SCLUnlockHistoryTableViewCell *)v6 contentView];
    [v10 bounds];
    uint64_t v11 = -[SCLHistoryItemView initWithFrame:](v9, "initWithFrame:");
    historyItemView = v6->_historyItemView;
    v6->_historyItemView = (SCLHistoryItemView *)v11;

    [(SCLHistoryItemView *)v6->_historyItemView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(SCLUnlockHistoryTableViewCell *)v6 contentView];
    [v13 addSubview:v6->_historyItemView];

    id v14 = objc_alloc(MEMORY[0x263F1C668]);
    v15 = (void *)[v14 initForTextStyle:*MEMORY[0x263F1D260]];
    v16 = [(SCLUnlockHistoryTableViewCell *)v6 contentView];
    v17 = [v16 bottomAnchor];
    v18 = [(SCLHistoryItemView *)v6->_historyItemView bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];

    [v19 setIdentifier:@"contentView.bottom"];
    LODWORD(v20) = 1148829696;
    [v19 setPriority:v20];
    v21 = [(SCLHistoryItemView *)v6->_historyItemView leadingAnchor];
    v22 = [(SCLUnlockHistoryTableViewCell *)v6 contentView];
    v23 = [v22 leadingAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];

    [v24 setIdentifier:@"contentView.leading"];
    v25 = [(SCLHistoryItemView *)v6->_historyItemView firstBaselineAnchor];
    v26 = [(SCLUnlockHistoryTableViewCell *)v6 contentView];
    v27 = [v26 topAnchor];
    [v15 scaledValueForValue:30.0];
    v28 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);

    [v28 setIdentifier:@"historyView.baselineDifference"];
    v29 = [(SCLHistoryItemView *)v6->_historyItemView trailingAnchor];
    v30 = [(SCLUnlockHistoryTableViewCell *)v6 contentView];
    v31 = [v30 trailingAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];

    [v32 setIdentifier:@"contentView.trailing"];
    v33 = (void *)MEMORY[0x263F08938];
    v37[0] = v28;
    v37[1] = v19;
    v37[2] = v24;
    v37[3] = v32;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [v33 activateConstraints:v34];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCLUnlockHistoryTableViewCell;
  id v4 = a3;
  [(PSTableCell *)&v8 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F60308], v8.receiver, v8.super_class);

  v6 = [(SCLUnlockHistoryTableViewCell *)self historyItemView];
  [v6 setHistoryGroup:v5];

  v7 = [(SCLUnlockHistoryTableViewCell *)self historyItemView];
  [v7 layoutIfNeeded];
}

- (SCLHistoryItemView)historyItemView
{
  return self->_historyItemView;
}

- (void).cxx_destruct
{
}

@end