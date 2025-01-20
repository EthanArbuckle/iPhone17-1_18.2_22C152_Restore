@interface NTKCompanionMonogramEntryViewController
+ (NSString)localizedDescription;
+ (NSString)localizedTitle;
- (BOOL)showsDoneButton;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (NTKCompanionMonogramEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITextField)monogramEntry;
- (id)customMonogram:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_doneTapped;
- (void)_resetEntryField;
- (void)returnPressedAtEnd;
- (void)setCustomMonogram:(id)a3 specifier:(id)a4;
- (void)setMonogramEntry:(id)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NTKCompanionMonogramEntryViewController

+ (NSString)localizedTitle
{
  return (NSString *)NTKCBundleLocalizedString(@"MONOGRAM", @"Monogram");
}

+ (NSString)localizedDescription
{
  v2 = [MEMORY[0x1E4F19A30] currentDevice];
  if ([v2 deviceCategory] == 1)
  {
    v3 = @"MONOGRAM_DESCRIPTION";
  }
  else
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"];
    char v5 = [v2 supportsCapability:v4];

    if (v5)
    {
      v3 = @"MONOGRAM_DESCRIPTION_TYPOGRAPH";
    }
    else if ([v2 isRunningGraceOrLater])
    {
      v3 = @"MONOGRAM_DESCRIPTION_MERIDIAN_CALIFORNIA";
    }
    else
    {
      v3 = @"MONOGRAM_DESCRIPTION_INFOGRAPH";
    }
  }
  v6 = NTKCBundleLocalizedString(v3, @"description");

  return (NSString *)v6;
}

- (NTKCompanionMonogramEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCompanionMonogramEntryViewController;
  v4 = [(NTKCompanionMonogramEntryViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    char v5 = +[NTKCompanionMonogramEntryViewController localizedTitle];
    [(NTKCompanionMonogramEntryViewController *)v4 setTitle:v5];
  }
  return v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCompanionMonogramEntryViewController;
  [(NTKCompanionMonogramEntryViewController *)&v5 viewWillDisappear:a3];
  v4 = [(NTKCompanionMonogramEntryViewController *)self presentingViewController];

  if (v4) {
    [(UITextField *)self->_monogramEntry resignFirstResponder];
  }
}

- (id)specifiers
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    v6 = [MEMORY[0x1E4F92EB0] preferenceSpecifierNamed:0 target:self set:sel_setCustomMonogram_specifier_ get:sel_customMonogram_ detail:0 cell:8 edit:0];
    objc_super v7 = +[NTKCompanionMonogramEntryViewController localizedDescription];
    [v5 setProperty:v7 forKey:*MEMORY[0x1E4F93170]];

    v11[0] = v5;
    v11[1] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCompanionMonogramEntryViewController;
  objc_super v5 = [(NTKCompanionMonogramEntryViewController *)&v10 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 8)
  {
    v6 = [v5 editableTextField];
    [(NTKCompanionMonogramEntryViewController *)self setMonogramEntry:v6];

    [(UITextField *)self->_monogramEntry setAcceptsEmoji:0];
    [(UITextField *)self->_monogramEntry setAutocorrectionType:1];
    [(UITextField *)self->_monogramEntry setSpellCheckingType:1];
    [(UITextField *)self->_monogramEntry becomeFirstResponder];
    objc_super v7 = [v5 editableTextField];
    [v7 setClearButtonMode:3];

    v8 = [v5 editableTextField];
    [v8 setDelegate:self];
  }
  return v5;
}

- (void)returnPressedAtEnd
{
  id v3 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
  v2 = [v3 firstResponder];
  [v2 resignFirstResponder];
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return objc_msgSend(a5, "ntk_containsOnlyValidMonogramCharacters", a3, a4.location, a4.length);
}

- (void)textFieldDidEndEditing:(id)a3
{
  v4 = [(UITextField *)self->_monogramEntry text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(UITextField *)self->_monogramEntry text];
    unint64_t v7 = [v6 length];

    if (v7 >= 5) {
      uint64_t v8 = 5;
    }
    else {
      uint64_t v8 = v7;
    }
    v9 = [(UITextField *)self->_monogramEntry text];
    uint64_t v10 = objc_msgSend(v9, "rangeOfComposedCharacterSequencesForRange:", 0, v8);
    uint64_t v12 = v11;

    v13 = [(UITextField *)self->_monogramEntry text];
    v14 = objc_msgSend(v13, "substringWithRange:", v10, v12);

    v15 = [MEMORY[0x1E4F1CA20] currentLocale];
    v16 = [v14 uppercaseStringWithLocale:v15];

    [(UITextField *)self->_monogramEntry setText:v16];
  }
  v17 = [(UITextField *)self->_monogramEntry text];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    id v19 = [(UITextField *)self->_monogramEntry text];
    [(NTKCompanionMonogramEntryViewController *)self setCustomMonogram:v19 specifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0])];
  }
}

- (void)setCustomMonogram:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  if (objc_msgSend(v5, "ntk_isValidMonogram"))
  {
    v4 = +[NTKCustomMonogramStore sharedInstance];
    [v4 setCustomMonogram:v5];
  }
}

- (id)customMonogram:(id)a3
{
  return +[NTKMonogram monogram];
}

- (void)setShowsDoneButton:(BOOL)a3
{
  if (self->_showsDoneButton != a3)
  {
    self->_showsDoneButton = a3;
    if (a3)
    {
      id v5 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneTapped];
      v4 = [(NTKCompanionMonogramEntryViewController *)self navigationItem];
      [v4 setRightBarButtonItem:v5];
    }
    else
    {
      id v5 = [(NTKCompanionMonogramEntryViewController *)self navigationItem];
      [v5 setRightBarButtonItem:0];
    }
  }
}

- (void)_resetEntryField
{
  id v3 = [(NTKCompanionMonogramEntryViewController *)self customMonogram:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0])];
  [(UITextField *)self->_monogramEntry setText:v3];
}

- (void)_doneTapped
{
  id v2 = [(NTKCompanionMonogramEntryViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (UITextField)monogramEntry
{
  return self->_monogramEntry;
}

- (void)setMonogramEntry:(id)a3
{
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void).cxx_destruct
{
}

@end