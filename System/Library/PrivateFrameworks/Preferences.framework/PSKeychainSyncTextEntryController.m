@interface PSKeychainSyncTextEntryController
- (BOOL)becomeFirstResponder;
- (BOOL)convertsNumeralsToASCII;
- (BOOL)hidesNextButton;
- (BOOL)secureTextEntry;
- (BOOL)textFieldHasRoundBorder;
- (Class)textEntryCellClass;
- (NSString)textValue;
- (PSKeychainSyncTextEntryController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)placeholderText;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)textEntryCell;
- (id)textEntrySpecifier;
- (id)textEntryText;
- (id)textEntryView;
- (int)textEntryType;
- (unint64_t)numberOfPasscodeFields;
- (void)dealloc;
- (void)didFinishEnteringText:(id)a3;
- (void)loadView;
- (void)nextPressed;
- (void)passcodeField:(id)a3 didUpdateEnteredPasscode:(id)a4;
- (void)setConvertsNumeralsToASCII:(BOOL)a3;
- (void)setHidesNextButton:(BOOL)a3;
- (void)setNumberOfPasscodeFields:(unint64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setTextEntryText:(id)a3;
- (void)setTextEntryType:(int)a3;
- (void)setTextFieldHasRoundBorder:(BOOL)a3;
- (void)setTextValue:(id)a3;
- (void)textFieldChanged:(id)a3;
- (void)updateNextButton;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation PSKeychainSyncTextEntryController

- (PSKeychainSyncTextEntryController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncTextEntryController;
  v2 = [(PSListController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_textFieldChanged_ name:*MEMORY[0x1E4F43E28] object:0];

    v2->_numberOfPasscodeFields = 6;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSListController *)&v4 dealloc];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSListController *)&v4 loadView];
  v3 = [(PSListController *)self table];
  [v3 setSeparatorStyle:0];
}

- (void)updateNextButton
{
  if (self->_textEntryType == 1 || [(PSKeychainSyncTextEntryController *)self hidesNextButton])
  {
    id v6 = [(PSKeychainSyncTextEntryController *)self navigationItem];
    [v6 setRightBarButtonItem:0];
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
    objc_super v4 = PS_LocalizedStringForKeychainSync(@"NEXT");
    id v6 = (id)[v3 initWithTitle:v4 style:2 target:self action:sel_nextPressed];

    [v6 setEnabled:0];
    objc_super v5 = [(PSKeychainSyncTextEntryController *)self navigationItem];
    [v5 setRightBarButtonItem:v6];
  }
}

- (void)nextPressed
{
  id v3 = [(PSKeychainSyncTextEntryController *)self textEntryView];
  [v3 resignFirstResponder];

  id v4 = [(PSKeychainSyncTextEntryController *)self textValue];
  [(PSKeychainSyncTextEntryController *)self didFinishEnteringText:v4];
}

- (void)didFinishEnteringText:(id)a3
{
  id v4 = a3;
  id v5 = [(PSKeychainSyncViewController *)self delegate];
  [v5 keychainSyncController:self didFinishWithResult:v4 error:0];
}

- (void)setHidesNextButton:(BOOL)a3
{
  self->_hidesNextButton = a3;
  [(PSKeychainSyncTextEntryController *)self updateNextButton];
}

- (void)setTextEntryType:(int)a3
{
  [(PSKeychainSyncTextEntryController *)self setTextEntryText:&stru_1EFB51FD0];
  self->_textEntryType = a3;
  if (self->super.super._specifiers)
  {
    [(PSListController *)self reloadSpecifiers];
  }
}

- (BOOL)becomeFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSKeychainSyncTextEntryController *)&v6 becomeFirstResponder];
  id v3 = [(PSKeychainSyncTextEntryController *)self textEntryView];
  char v4 = [v3 becomeFirstResponder];

  return v4;
}

- (void)willBecomeActive
{
  id v3 = [(PSKeychainSyncTextEntryController *)self textEntryView];
  [v3 becomeFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSViewController *)&v4 willBecomeActive];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PSKeychainSyncTextEntryController *)self updateNextButton];
  if (([(PSKeychainSyncTextEntryController *)self isMovingToParentViewController] & 1) == 0) {
    [(PSListController *)self reloadSpecifiers];
  }
  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSListController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSListController *)&v7 viewWillDisappear:a3];
  objc_super v4 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v6 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
    [v6 setDenyFirstResponder:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSListController *)&v7 viewDidDisappear:a3];
  objc_super v4 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v6 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
    [v6 setDenyFirstResponder:0];
  }
}

- (void)setTextEntryText:(id)a3
{
  id v4 = a3;
  -[PSKeychainSyncTextEntryController setTextValue:](self, "setTextValue:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIKeyInput *)self->_textEntryView setText:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIKeyInput *)self->_textEntryView setStringValue:v4];
    }
    else {
      [(PSListController *)self reloadSpecifier:self->_textEntrySpecifier];
    }
  }
}

- (id)textEntryText
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(UIKeyInput *)self->_textEntryView text];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v3 = [(UIKeyInput *)self->_textEntryView stringValue];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (id)specifiers
{
  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    [(UIKeyInput *)self->_textEntryView removeFromSuperview];
    textEntryView = self->_textEntryView;
    self->_textEntryView = 0;

    [(PSTableCell *)self->_textEntryCell removeFromSuperview];
    textEntryCell = self->_textEntryCell;
    self->_textEntryCell = 0;

    textEntrySpecifier = self->_textEntrySpecifier;
    self->_textEntrySpecifier = 0;

    if (self->_secureTextEntry)
    {
      textValue = self->_textValue;
      self->_textValue = 0;
    }
    v12.receiver = self;
    v12.super_class = (Class)PSKeychainSyncTextEntryController;
    v8 = [(PSKeychainSyncViewController *)&v12 specifiers];
    v9 = [(PSKeychainSyncTextEntryController *)self textEntrySpecifier];
    [(NSArray *)v8 addObject:v9];

    v10 = self->super.super._specifiers;
    self->super.super._specifiers = v8;

    specifiers = self->super.super._specifiers;
  }
  return specifiers;
}

- (id)placeholderText
{
  return 0;
}

- (id)textEntrySpecifier
{
  if (!self->_textEntrySpecifier)
  {
    int textEntryType = self->_textEntryType;
    if (textEntryType == 2)
    {
      v8 = +[PSTextFieldSpecifier preferenceSpecifierNamed:0 target:self set:sel_setTextValue_forSpecifier_ get:sel_getTextValueForSpecifier_ detail:0 cell:8 edit:0];
      textEntrySpecifier = self->_textEntrySpecifier;
      self->_textEntrySpecifier = v8;

      v10 = self->_textEntrySpecifier;
      objc_super v7 = [(PSKeychainSyncTextEntryController *)self placeholderText];
      [(PSSpecifier *)v10 setPlaceholder:v7];
    }
    else
    {
      if (textEntryType != 1) {
        goto LABEL_7;
      }
      id v4 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:sel_setTextValue_forSpecifier_ get:sel_getTextValueForSpecifier_ detail:0 cell:3 edit:0];
      objc_super v5 = self->_textEntrySpecifier;
      self->_textEntrySpecifier = v4;

      [(PSSpecifier *)self->_textEntrySpecifier setProperty:objc_opt_class() forKey:@"cellClass"];
      objc_super v6 = self->_textEntrySpecifier;
      objc_super v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[PSKeychainSyncTextEntryController numberOfPasscodeFields](self, "numberOfPasscodeFields"));
      [(PSSpecifier *)v6 setProperty:v7 forKey:@"numberOfPasscodeFields"];
    }
  }
LABEL_7:
  v11 = self->_textEntrySpecifier;
  return v11;
}

- (Class)textEntryCellClass
{
  id v2 = (id)objc_opt_class();
  return (Class)v2;
}

- (id)textEntryCell
{
  if (!self->_textEntryCell)
  {
    BOOL v3 = [(PSKeychainSyncTextEntryController *)self textEntryCellClass];
    id v4 = [v3 alloc];
    uint64_t v5 = [(objc_class *)v3 cellStyle];
    objc_super v6 = [(PSKeychainSyncTextEntryController *)self textEntrySpecifier];
    objc_super v7 = [(objc_class *)v3 reuseIdentifierForSpecifier:v6];
    v8 = [(PSKeychainSyncTextEntryController *)self textEntrySpecifier];
    v9 = (PSTableCell *)[v4 initWithStyle:v5 reuseIdentifier:v7 specifier:v8];
    textEntryCell = self->_textEntryCell;
    self->_textEntryCell = v9;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PSTableCell *)self->_textEntryCell setConvertsNumeralsToASCII:[(PSKeychainSyncTextEntryController *)self convertsNumeralsToASCII]];
    }
    int textEntryType = self->_textEntryType;
    if (textEntryType == 2)
    {
      v14 = [(PSTableCell *)self->_textEntryCell editableTextField];
      textEntryView = self->_textEntryView;
      self->_textEntryView = v14;
    }
    else if (textEntryType == 1)
    {
      objc_super v12 = [(PSTableCell *)self->_textEntryCell passcodeField];
      v13 = self->_textEntryView;
      self->_textEntryView = v12;

      [(PSTableCell *)self->_textEntryCell setDelegate:self];
    }
    [(PSTableCell *)self->_textEntryCell setSpecifier:self->_textEntrySpecifier];
    [(PSTableCell *)self->_textEntryCell refreshCellContentsWithSpecifier:self->_textEntrySpecifier];
    if (objc_opt_respondsToSelector()) {
      [(UIKeyInput *)self->_textEntryView setSecureTextEntry:self->_secureTextEntry];
    }
  }
  v16 = self->_textEntryCell;
  return v16;
}

- (id)textEntryView
{
  id v3 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
  textEntryView = self->_textEntryView;
  return textEntryView;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  if (self->_secureTextEntry != a3)
  {
    BOOL v3 = a3;
    self->_secureTextEntry = a3;
    if (objc_opt_respondsToSelector())
    {
      textEntryView = self->_textEntryView;
      [(UIKeyInput *)textEntryView setSecureTextEntry:v3];
    }
  }
}

- (void)textFieldChanged:(id)a3
{
  id v10 = a3;
  id v4 = [(PSKeychainSyncTextEntryController *)self textEntryView];
  uint64_t v5 = [v10 object];

  if (v5 == v4)
  {
    objc_super v6 = [(PSKeychainSyncTextEntryController *)self navigationItem];
    objc_super v7 = [v6 rightBarButtonItem];
    v8 = [v4 text];
    objc_msgSend(v7, "setEnabled:", objc_msgSend(v8, "length") != 0);

    v9 = [v10 object];
    [(PSKeychainSyncTextEntryController *)self textEntryViewDidChange:v9];
  }
}

- (void)passcodeField:(id)a3 didUpdateEnteredPasscode:(id)a4
{
  id v5 = a4;
  if ((unint64_t)[v5 length] >= 4) {
    [(PSKeychainSyncTextEntryController *)self didFinishEnteringText:v5];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:v7]];
  v9 = [(PSKeychainSyncTextEntryController *)self textEntrySpecifier];

  if (v8 == v9)
  {
    id v10 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
    if (objc_opt_respondsToSelector()) {
      [(UIKeyInput *)self->_textEntryView setAutocorrectionType:1];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PSKeychainSyncTextEntryController;
    id v10 = [(PSListController *)&v12 tableView:v6 cellForRowAtIndexPath:v7];
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:v7]];
  v9 = [(PSKeychainSyncTextEntryController *)self textEntrySpecifier];
  if (v8 == v9)
  {
    int textEntryType = self->_textEntryType;

    if (textEntryType == 1)
    {
      [MEMORY[0x1E4F42C40] defaultHeight];
      if (v11 == 0.0) {
        double v12 = 52.0;
      }
      else {
        double v12 = v11;
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  v27.receiver = self;
  v27.super_class = (Class)PSKeychainSyncTextEntryController;
  [(PSListController *)&v27 tableView:v6 heightForRowAtIndexPath:v7];
  double v12 = v13;
  BOOL v14 = [(PSKeychainSyncTextEntryController *)self textFieldHasRoundBorder];
  v15 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
  v16 = [v15 contentView];
  v17 = [v16 layer];
  v18 = v17;
  if (v14)
  {
    [v17 setBorderWidth:1.0];

    v19 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
    v20 = [v19 contentView];
    v21 = [v20 layer];
    id v22 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v21, "setBorderColor:", objc_msgSend(v22, "CGColor"));

    v23 = [(PSKeychainSyncTextEntryController *)self textEntryCell];
    v24 = [v23 contentView];
    v25 = [v24 layer];
    [v25 setCornerRadius:10.0];

    if (v12 < 50.0) {
      double v12 = 50.0;
    }
  }
  else
  {
    [v17 setBorderWidth:0.0];
  }
LABEL_12:

  return v12;
}

- (int)textEntryType
{
  return self->_textEntryType;
}

- (BOOL)hidesNextButton
{
  return self->_hidesNextButton;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (BOOL)textFieldHasRoundBorder
{
  return self->_textFieldHasRoundBorder;
}

- (void)setTextFieldHasRoundBorder:(BOOL)a3
{
  self->_textFieldHasRoundBorder = a3;
}

- (BOOL)convertsNumeralsToASCII
{
  return self->_convertsNumeralsToASCII;
}

- (void)setConvertsNumeralsToASCII:(BOOL)a3
{
  self->_convertsNumeralsToASCII = a3;
}

- (unint64_t)numberOfPasscodeFields
{
  return self->_numberOfPasscodeFields;
}

- (void)setNumberOfPasscodeFields:(unint64_t)a3
{
  self->_numberOfPasscodeFields = a3;
}

- (NSString)textValue
{
  return self->_textValue;
}

- (void)setTextValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textValue, 0);
  objc_storeStrong((id *)&self->_textEntrySpecifier, 0);
  objc_storeStrong((id *)&self->_textEntryView, 0);
  objc_storeStrong((id *)&self->_textEntryCell, 0);
}

@end