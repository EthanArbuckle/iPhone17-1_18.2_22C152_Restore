@interface PTUIChoiceViewController
- (BOOL)_canShowWhileLocked;
- (PTChoiceRow)row;
- (PTUIChoiceViewController)initWithPresentingRow:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_checkAppropriateCell;
- (void)dealloc;
- (void)rowDidReload:(id)a3;
- (void)setRow:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PTUIChoiceViewController

- (PTUIChoiceViewController)initWithPresentingRow:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PTUIChoiceViewController;
  v6 = [(PTUIChoiceViewController *)&v16 initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    p_row = (id *)&v6->_row;
    objc_storeStrong((id *)&v6->_row, a3);
    [*p_row addObserver:v7];
    v9 = [(PTUIChoiceViewController *)v7 navigationItem];
    v10 = [*p_row title];
    [v9 setTitle:v10];

    id v11 = *p_row;
    v12 = [*p_row value];
    uint64_t v13 = [v11 indexPathForValue:v12];
    valueIndexPath = v7->_valueIndexPath;
    v7->_valueIndexPath = (NSIndexPath *)v13;
  }
  return v7;
}

- (void)dealloc
{
  [(PTChoiceRow *)self->_row removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PTUIChoiceViewController;
  [(PTUIChoiceViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)rowDidReload:(id)a3
{
  id v3 = [(PTUIChoiceViewController *)self tableView];
  [v3 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(PTChoiceRow *)self->_row numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(PTChoiceRow *)self->_row numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v4 = [(PTChoiceRow *)self->_row titleForSection:a4];
  if ([v4 length])
  {
    id v5 = objc_opt_new();
    v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2B0]];
    [v5 setFont:v6];

    [v5 setText:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  if (!v7) {
    v7 = [[_PTUIChoiceCell alloc] initWithReuseIdentifier:@"cell"];
  }
  v8 = -[PTChoiceRow titleForRow:inSection:](self->_row, "titleForRow:inSection:", [v6 row], objc_msgSend(v6, "section"));
  [(_PTUIChoiceCell *)v7 setTitle:v8];

  row = self->_row;
  uint64_t v10 = [v6 row];
  uint64_t v11 = [v6 section];

  v12 = [(PTChoiceRow *)row valueForRow:v10 inSection:v11];
  uint64_t v13 = [(PTChoiceRow *)self->_row value];
  -[_PTUIChoiceCell setChecked:](v7, "setChecked:", [v13 isEqual:v12]);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  row = self->_row;
  uint64_t v8 = [v6 row];
  uint64_t v9 = [v6 section];

  id v12 = [(PTChoiceRow *)row valueForRow:v8 inSection:v9];
  [(PTChoiceRow *)self->_row setValue:v12];
  uint64_t v10 = [(PTUIChoiceViewController *)self navigationController];
  id v11 = (id)[v10 popViewControllerAnimated:1];
}

- (void)_checkAppropriateCell
{
  row = self->_row;
  v4 = [(PTChoiceRow *)row value];
  id v5 = [(PTChoiceRow *)row indexPathForValue:v4];

  id v6 = [(PTUIChoiceViewController *)self tableView];
  id v10 = [v6 cellForRowAtIndexPath:self->_valueIndexPath];

  [v10 setChecked:0];
  v7 = [(PTUIChoiceViewController *)self tableView];
  uint64_t v8 = [v7 cellForRowAtIndexPath:v5];

  [v8 setChecked:1];
  valueIndexPath = self->_valueIndexPath;
  self->_valueIndexPath = v5;
}

- (PTChoiceRow)row
{
  return self->_row;
}

- (void)setRow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row, 0);

  objc_storeStrong((id *)&self->_valueIndexPath, 0);
}

@end