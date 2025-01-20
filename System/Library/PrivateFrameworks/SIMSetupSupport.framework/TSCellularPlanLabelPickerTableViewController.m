@interface TSCellularPlanLabelPickerTableViewController
- (CTCellularPlanItem)associatedPlanItem;
- (CTUserLabel)chosenLabel;
- (CTUserLabel)customLabel;
- (CTUserLabel)initialLabel;
- (NSArray)predefinedUserLabels;
- (NSIndexPath)chosenLabelIndexPath;
- (TSCellularPlanLabelPickerTableViewController)init;
- (id)customLabelIndexPath;
- (id)customLabelRowValue;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonTapped;
- (void)setAssociatedPlanItem:(id)a3;
- (void)setChosenLabelIndexPath:(id)a3;
- (void)setCustomLabel:(id)a3;
- (void)setInitialLabel:(id)a3;
- (void)setPredefinedUserLabels:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSCellularPlanLabelPickerTableViewController

- (TSCellularPlanLabelPickerTableViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanLabelPickerTableViewController;
  v2 = [(TSCellularPlanLabelPickerTableViewController *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F82C78]);
    v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(TSCellularPlanLabelPickerTableViewController *)v2 setTableView:v4];

    v5 = [(TSCellularPlanLabelPickerTableViewController *)v2 tableView];
    [v5 setAllowsMultipleSelection:0];

    v6 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 0.0, 1.0);
    v7 = [(TSCellularPlanLabelPickerTableViewController *)v2 tableView];
    [v7 setTableHeaderView:v6];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v27.receiver = self;
  v27.super_class = (Class)TSCellularPlanLabelPickerTableViewController;
  [(TSCellularPlanLabelPickerTableViewController *)&v27 viewWillAppear:a3];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v5 = [(TSCellularPlanLabelPickerTableViewController *)self navigationController];
  v6 = [v5 view];
  [v6 setBackgroundColor:v4];

  initialLabel = self->_initialLabel;
  if (!initialLabel)
  {
    v8 = [(NSArray *)self->_predefinedUserLabels objectAtIndexedSubscript:0];
    objc_super v9 = self->_initialLabel;
    self->_initialLabel = v8;

    initialLabel = self->_initialLabel;
  }
  uint64_t v10 = [(CTUserLabel *)initialLabel indexInPredefinedLabels:self->_predefinedUserLabels];
  if (v10 == -1)
  {
    v11 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
    objc_storeStrong((id *)&self->_customLabel, self->_initialLabel);
  }
  else
  {
    v11 = [MEMORY[0x263F088C8] indexPathForRow:v10 inSection:0];
  }
  objc_storeStrong((id *)&self->_chosenLabelIndexPath, v11);
  v12 = [(TSCellularPlanLabelPickerTableViewController *)self tableView];
  [v12 reloadData];

  v13 = [(TSCellularPlanLabelPickerTableViewController *)self navigationItem];
  [v13 setRightBarButtonItem:0 animated:0];

  v14 = [(TSCellularPlanLabelPickerTableViewController *)self navigationItem];
  v15 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped];
  [v14 setLeftBarButtonItem:v15 animated:0];

  v16 = [(CTCellularPlanItem *)self->_associatedPlanItem phoneNumber];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [(TSCellularPlanLabelPickerTableViewController *)self navigationItem];
    v19 = [(CTCellularPlanItem *)self->_associatedPlanItem phoneNumber];
    uint64_t v20 = +[TSUtilities formattedPhoneNumber:v19 withCountryCode:0];
  }
  else
  {
    v22 = [(CTCellularPlanItem *)self->_associatedPlanItem carrierName];
    uint64_t v23 = [v22 length];

    v18 = [(TSCellularPlanLabelPickerTableViewController *)self navigationItem];
    if (v23)
    {
      v24 = NSString;
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v21 = [v19 localizedStringForKey:@"TITLE_%@_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];
      v25 = [(CTCellularPlanItem *)self->_associatedPlanItem carrierName];
      v26 = objc_msgSend(v24, "stringWithFormat:", v21, v25);
      [v18 setTitle:v26];

      goto LABEL_11;
    }
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v19 localizedStringForKey:@"CELLULAR_PLAN_LABEL" value:&stru_26DBE8E78 table:@"Localizable"];
  }
  v21 = (void *)v20;
  [v18 setTitle:v20];
LABEL_11:
}

- (CTUserLabel)chosenLabel
{
  id v3 = self->_chosenLabelIndexPath;
  if ([(NSIndexPath *)v3 section])
  {
    id v4 = objc_alloc(MEMORY[0x263F31990]);
    v5 = [(TSCellularPlanLabelPickerTableViewController *)self tableView];
    v6 = [(NSIndexPath *)v5 cellForRowAtIndexPath:v3];

    v7 = [v6 editableTextField];
    v8 = [v7 text];
    objc_super v9 = (void *)[v4 initWithLabel:v8];

    id v3 = v5;
  }
  else
  {
    objc_super v9 = [(NSArray *)self->_predefinedUserLabels objectAtIndexedSubscript:[(NSIndexPath *)v3 row]];
  }

  return (CTUserLabel *)v9;
}

- (id)customLabelIndexPath
{
  return (id)[MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
}

- (id)customLabelRowValue
{
  id v3 = [(TSCellularPlanLabelPickerTableViewController *)self tableView];
  id v4 = [(TSCellularPlanLabelPickerTableViewController *)self customLabelIndexPath];
  v5 = [v3 cellForRowAtIndexPath:v4];
  v6 = [v5 editableTextField];
  v7 = [v6 text];

  return v7;
}

- (void)_doneButtonTapped
{
  id v3 = [(TSCellularPlanLabelPickerTableViewController *)self view];
  [v3 endEditing:1];

  id v5 = [(TSCellularPlanLabelPickerTableViewController *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return [(NSArray *)self->_predefinedUserLabels count];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"CUSTOM_LABEL" value:&stru_26DBE8E78 table:@"Localizable"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    v6 = (TSCellularPlanLabelTableViewCell *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1000 reuseIdentifier:@"customlabel"];
    predefinedUserLabels = self->_predefinedUserLabels;
    v8 = [(TSCellularPlanLabelPickerTableViewController *)self chosenLabel];
    BOOL v9 = [(NSArray *)predefinedUserLabels containsObject:v8];

    int v10 = [(NSIndexPath *)self->_chosenLabelIndexPath isEqual:v5];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"TYPE_LABEL_HERE" value:&stru_26DBE8E78 table:@"Localizable"];
    v13 = [(TSCellularPlanLabelTableViewCell *)v6 editableTextField];
    [v13 setPlaceholder:v12];

    v14 = [(CTUserLabel *)self->_customLabel label];
    v15 = [(TSCellularPlanLabelTableViewCell *)v6 editableTextField];
    [v15 setText:v14];

    v16 = [(TSCellularPlanLabelTableViewCell *)v6 editableTextField];
    [v16 setReturnKeyType:9];

    uint64_t v17 = [(TSCellularPlanLabelTableViewCell *)v6 editableTextField];
    [v17 setClearButtonMode:1];

    v18 = [(TSCellularPlanLabelTableViewCell *)v6 editableTextField];
    [v18 setReturnKeyType:0];

    v19 = [(TSCellularPlanLabelTableViewCell *)v6 editableTextField];
    [v19 setDelegate:self];

    [(TSCellularPlanLabelTableViewCell *)v6 setSelectionStyle:0];
    [(TSCellularPlanLabelTableViewCell *)v6 setTextFieldOffset:0.01];
    if (v9)
    {
      BOOL v20 = 0;
    }
    else
    {
      self = [(CTUserLabel *)self->_customLabel label];
      BOOL v20 = [(TSCellularPlanLabelPickerTableViewController *)self length] == 0;
    }
    v28 = [(TSCellularPlanLabelTableViewCell *)v6 textLabel];
    [v28 setEnabled:v20];

    if (!v9) {
    if (v10)
    }
      uint64_t v29 = 3;
    else {
      uint64_t v29 = 0;
    }
    [(TSCellularPlanLabelTableViewCell *)v6 setAccessoryType:v29];
  }
  else
  {
    int v21 = [(NSIndexPath *)self->_chosenLabelIndexPath isEqual:v5];
    v22 = [[TSCellularPlanLabelTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"label"];
    v6 = v22;
    if (v21) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 0;
    }
    [(TSCellularPlanLabelTableViewCell *)v22 setAccessoryType:v23];
    v24 = self->_predefinedUserLabels;
    uint64_t v25 = [v5 row];

    v26 = [(NSArray *)v24 objectAtIndexedSubscript:v25];
    objc_super v27 = [v26 label];
    [(TSCellularPlanLabelTableViewCell *)v6 setLabelWithNoBadge:v27];
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (![v6 section])
  {
    BOOL v9 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
    int v10 = [v17 cellForRowAtIndexPath:v9];
    v11 = [v10 editableTextField];
    v12 = [v11 text];
    uint64_t v13 = [v12 length];

    if (!v13)
    {
      v14 = (CTUserLabel *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:&stru_26DBE8E78];
      customLabel = self->_customLabel;
      self->_customLabel = v14;
    }
    goto LABEL_7;
  }
  if ([v6 section] == 1)
  {
    v7 = [(TSCellularPlanLabelPickerTableViewController *)self customLabelRowValue];
    uint64_t v8 = [v7 length];

    if (v8) {
LABEL_7:
    }
      objc_storeStrong((id *)&self->_chosenLabelIndexPath, a4);
  }
  v16 = [(TSCellularPlanLabelPickerTableViewController *)self tableView];
  [v16 reloadData];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v16 = [a3 text];
  id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v5 = [v16 stringByTrimmingCharactersInSet:v4];

  if ([v5 length])
  {
    if ((unint64_t)[v5 length] >= 0x1F)
    {
      unint64_t v6 = [v5 length];
      if (v6 >= 0x1E) {
        uint64_t v7 = 30;
      }
      else {
        uint64_t v7 = v6;
      }
      uint64_t v8 = objc_msgSend(v5, "rangeOfComposedCharacterSequencesForRange:", 0, v7);
      uint64_t v10 = objc_msgSend(v5, "substringWithRange:", v8, v9);

      id v5 = (void *)v10;
    }
    v11 = (CTUserLabel *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:v5];
    customLabel = self->_customLabel;
    self->_customLabel = v11;

    uint64_t v13 = [(TSCellularPlanLabelPickerTableViewController *)self customLabelIndexPath];
    chosenLabelIndexPath = self->_chosenLabelIndexPath;
    self->_chosenLabelIndexPath = v13;
  }
  v15 = [(TSCellularPlanLabelPickerTableViewController *)self tableView];
  [v15 reloadData];
}

- (CTCellularPlanItem)associatedPlanItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setAssociatedPlanItem:(id)a3
{
}

- (CTUserLabel)initialLabel
{
  return (CTUserLabel *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setInitialLabel:(id)a3
{
}

- (NSArray)predefinedUserLabels
{
  return (NSArray *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setPredefinedUserLabels:(id)a3
{
}

- (NSIndexPath)chosenLabelIndexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setChosenLabelIndexPath:(id)a3
{
}

- (CTUserLabel)customLabel
{
  return (CTUserLabel *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setCustomLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_chosenLabelIndexPath, 0);
  objc_storeStrong((id *)&self->_predefinedUserLabels, 0);
  objc_storeStrong((id *)&self->_initialLabel, 0);
  objc_storeStrong((id *)&self->_associatedPlanItem, 0);
}

@end