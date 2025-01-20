@interface SearchUIContactPickerViewController
- (CNContact)contact;
- (SearchUIContactPickerViewController)initWithContact:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)setContact:(id)a3;
@end

@implementation SearchUIContactPickerViewController

- (SearchUIContactPickerViewController)initWithContact:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIContactPickerViewController;
  v5 = [(SearchUIContactPickerViewController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(CNContactPickerViewController *)v5 setAllowsCancel:1];
    [(CNContactPickerViewController *)v6 setAutocloses:0];
    [(CNContactPickerViewController *)v6 setMode:2];
    v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    [(CNContactPickerViewController *)v6 setPredicateForSelectionOfContact:v7];

    [(CNContactPickerViewController *)v6 setDelegate:v6];
    [(SearchUIContactPickerViewController *)v6 setContact:v4];
  }

  return v6;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1BBA8];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [(SearchUIContactPickerViewController *)self contact];
  id v11 = [v6 viewControllerForUpdatingContact:v7 withPropertiesFromContact:v9];

  [v11 setDelegate:self];
  v10 = [v8 navigationController];

  [v10 pushViewController:v11 animated:1];
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (void).cxx_destruct
{
}

@end