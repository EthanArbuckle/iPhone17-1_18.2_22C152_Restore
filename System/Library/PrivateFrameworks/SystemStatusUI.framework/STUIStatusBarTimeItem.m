@interface STUIStatusBarTimeItem
+ (STUIStatusBarIdentifier)dateDisplayIdentifier;
+ (STUIStatusBarIdentifier)pillTimeDisplayIdentifier;
+ (STUIStatusBarIdentifier)shortTimeDisplayIdentifier;
+ (STUIStatusBarIdentifier)timeDisplayIdentifier;
- (STUIStatusBarStringView)dateView;
- (STUIStatusBarStringView)pillTimeView;
- (STUIStatusBarStringView)shortTimeView;
- (STUIStatusBarStringView)timeView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)viewForIdentifier:(id)a3;
- (void)_create_dateView;
- (void)_create_pillTimeView;
- (void)_create_shortTimeView;
- (void)_create_timeView;
- (void)setDateView:(id)a3;
- (void)setPillTimeView:(id)a3;
- (void)setShortTimeView:(id)a3;
- (void)setTimeView:(id)a3;
@end

@implementation STUIStatusBarTimeItem

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() timeDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v9 = [(STUIStatusBarTimeItem *)self timeView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() shortTimeDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v9 = [(STUIStatusBarTimeItem *)self shortTimeView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() pillTimeDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v9 = [(STUIStatusBarTimeItem *)self pillTimeView];
      }
      else
      {
        id v8 = [(id)objc_opt_class() dateDisplayIdentifier];

        if (v8 == v4)
        {
          uint64_t v9 = [(STUIStatusBarTimeItem *)self dateView];
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)STUIStatusBarTimeItem;
          uint64_t v9 = [(STUIStatusBarItem *)&v12 viewForIdentifier:v4];
        }
      }
    }
  }
  v10 = (void *)v9;

  return v10;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)STUIStatusBarTimeItem;
  id v8 = [(STUIStatusBarItem *)&v38 applyUpdate:v6 toDisplayItem:v7];
  if ([v6 dataChanged])
  {
    uint64_t v9 = [v7 identifier];
    v10 = [(id)objc_opt_class() timeDisplayIdentifier];
    if (v9 == v10)
    {
      v18 = [v6 data];
      v19 = [v18 timeEntry];

      if (v19)
      {
        if ([v7 isEnabled])
        {
          v20 = [v6 data];
          v21 = [v20 timeEntry];
          objc_msgSend(v7, "setEnabled:", objc_msgSend(v21, "isEnabled"));
        }
        else
        {
          [v7 setEnabled:0];
        }
        if (![v7 isEnabled]) {
          goto LABEL_36;
        }
        v15 = [v6 data];
        v17 = [v15 timeEntry];
        v34 = [v17 stringValue];
        v35 = [(STUIStatusBarTimeItem *)self timeView];
        goto LABEL_34;
      }
    }
    else
    {
    }
    v11 = [v7 identifier];
    objc_super v12 = [(id)objc_opt_class() shortTimeDisplayIdentifier];
    if (v11 == v12)
    {
      v22 = [v6 data];
      v23 = [v22 shortTimeEntry];

      if (v23)
      {
        if ([v7 isEnabled])
        {
          v24 = [v6 data];
          v25 = [v24 shortTimeEntry];
          objc_msgSend(v7, "setEnabled:", objc_msgSend(v25, "isEnabled"));
        }
        else
        {
          [v7 setEnabled:0];
        }
        if (![v7 isEnabled]) {
          goto LABEL_36;
        }
        v15 = [v6 data];
        v17 = [v15 shortTimeEntry];
        v34 = [v17 stringValue];
        v35 = [(STUIStatusBarTimeItem *)self shortTimeView];
        goto LABEL_34;
      }
    }
    else
    {
    }
    v13 = [v7 identifier];
    v14 = [(id)objc_opt_class() pillTimeDisplayIdentifier];
    if (v13 == v14)
    {
      v26 = [v6 data];
      v27 = [v26 shortTimeEntry];

      if (v27)
      {
        if ([v7 isEnabled])
        {
          v28 = [v6 data];
          v29 = [v28 shortTimeEntry];
          objc_msgSend(v7, "setEnabled:", objc_msgSend(v29, "isEnabled"));
        }
        else
        {
          [v7 setEnabled:0];
        }
        if (![v7 isEnabled]) {
          goto LABEL_36;
        }
        v15 = [v6 data];
        v17 = [v15 shortTimeEntry];
        v34 = [v17 stringValue];
        v35 = [(STUIStatusBarTimeItem *)self pillTimeView];
        goto LABEL_34;
      }
    }
    else
    {
    }
    v15 = [v7 identifier];
    uint64_t v16 = [(id)objc_opt_class() dateDisplayIdentifier];
    if (v15 != (void *)v16)
    {
      v17 = (void *)v16;
LABEL_35:

      goto LABEL_36;
    }
    v30 = [v6 data];
    v31 = [v30 dateEntry];

    if (!v31) {
      goto LABEL_36;
    }
    if ([v7 isEnabled])
    {
      v32 = [v6 data];
      v33 = [v32 dateEntry];
      objc_msgSend(v7, "setEnabled:", objc_msgSend(v33, "isEnabled"));
    }
    else
    {
      [v7 setEnabled:0];
    }
    if (![v7 isEnabled]) {
      goto LABEL_36;
    }
    v15 = [v6 data];
    v17 = [v15 dateEntry];
    v34 = [v17 stringValue];
    v35 = [(STUIStatusBarTimeItem *)self dateView];
LABEL_34:
    v36 = v35;
    [v35 setText:v34];

    goto LABEL_35;
  }
LABEL_36:

  return v8;
}

- (STUIStatusBarStringView)shortTimeView
{
  shortTimeView = self->_shortTimeView;
  if (!shortTimeView)
  {
    [(STUIStatusBarTimeItem *)self _create_shortTimeView];
    shortTimeView = self->_shortTimeView;
  }
  return shortTimeView;
}

+ (STUIStatusBarIdentifier)shortTimeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"shortTimeDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)timeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"timeDisplayIdentifier"];
}

- (void)_create_shortTimeView
{
  v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  shortTimeView = self->_shortTimeView;
  self->_shortTimeView = v4;

  [(STUIStatusBarStringView *)self->_shortTimeView setFontStyle:1];
  id v6 = self->_shortTimeView;
  [(STUIStatusBarStringView *)v6 setAdjustsFontSizeToFitWidth:1];
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA9800], *MEMORY[0x1E4FA97D8], *MEMORY[0x1E4FA9750], 0);
}

- (STUIStatusBarStringView)dateView
{
  dateView = self->_dateView;
  if (!dateView)
  {
    [(STUIStatusBarTimeItem *)self _create_dateView];
    dateView = self->_dateView;
  }
  return dateView;
}

- (void)_create_dateView
{
  v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dateView = self->_dateView;
  self->_dateView = v4;
  MEMORY[0x1F41817F8](v4, dateView);
}

- (STUIStatusBarStringView)pillTimeView
{
  pillTimeView = self->_pillTimeView;
  if (!pillTimeView)
  {
    [(STUIStatusBarTimeItem *)self _create_pillTimeView];
    pillTimeView = self->_pillTimeView;
  }
  return pillTimeView;
}

- (void)_create_pillTimeView
{
  v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  pillTimeView = self->_pillTimeView;
  self->_pillTimeView = v4;

  [(STUIStatusBarStringView *)self->_pillTimeView setFontStyle:1];
  [(STUIStatusBarStringView *)self->_pillTimeView setAdjustsFontSizeToFitWidth:1];
  [(STUIStatusBarStringView *)self->_pillTimeView setBaselineAdjustment:1];
  id v6 = self->_pillTimeView;
  LODWORD(v7) = 1132003328;
  [(STUIStatusBarStringView *)v6 setContentCompressionResistancePriority:0 forAxis:v7];
}

- (STUIStatusBarStringView)timeView
{
  timeView = self->_timeView;
  if (!timeView)
  {
    [(STUIStatusBarTimeItem *)self _create_timeView];
    timeView = self->_timeView;
  }
  return timeView;
}

- (void)_create_timeView
{
  v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  timeView = self->_timeView;
  self->_timeView = v4;

  [(STUIStatusBarStringView *)self->_timeView setFontStyle:1];
  id v6 = self->_timeView;
  [(STUIStatusBarStringView *)v6 setAdjustsFontSizeToFitWidth:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_pillTimeView, 0);
  objc_storeStrong((id *)&self->_shortTimeView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
}

+ (STUIStatusBarIdentifier)pillTimeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"pillTimeDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)dateDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"dateDisplayIdentifier"];
}

- (void)setTimeView:(id)a3
{
}

- (void)setShortTimeView:(id)a3
{
}

- (void)setPillTimeView:(id)a3
{
}

- (void)setDateView:(id)a3
{
}

@end