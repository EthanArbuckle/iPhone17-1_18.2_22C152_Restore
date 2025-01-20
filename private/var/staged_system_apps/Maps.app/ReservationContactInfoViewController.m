@interface ReservationContactInfoViewController
- (ContactRequirements)requirements;
- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences;
- (NSArray)contactItems;
- (NSPersonNameComponents)initializedNameComponents;
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)footerText;
- (NSString)initializedEmailAddress;
- (NSString)initializedPhoneNumber;
- (NSString)phoneNumber;
- (ReservationContactInfoViewController)initWithNameComponents:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 guestDisplayPreferences:(id)a6 requirements:(id)a7;
- (ReservationContactInfoViewControllerDelegate)contactDelegate;
- (ReservationInputCell)emailCell;
- (ReservationInputCell)firstNameCell;
- (ReservationInputCell)lastNameCell;
- (ReservationInputCell)phoneNumberCell;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)inputCellForType:(unint64_t)a3;
- (id)itemsForGuestDisplayPreferences:(id)a3 requirements:(id)a4;
- (id)stringForNameMissing:(BOOL)a3 phoneNumberMissing:(BOOL)a4 emailAddressMissing:(BOOL)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)textFieldTextForContactCellType:(unint64_t)a3;
- (id)titleStringForContactCellType:(unint64_t)a3;
- (int64_t)inputCellTypeForContactCellType:(unint64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureCell:(id)a3 withItem:(id)a4;
- (void)configureContactItems;
- (void)configureTableView;
- (void)doneButtonTapped:(id)a3;
- (void)setContactDelegate:(id)a3;
- (void)setContactItems:(id)a3;
- (void)setEmailCell:(id)a3;
- (void)setFirstNameCell:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setGuestDisplayPreferences:(id)a3;
- (void)setInitializedEmailAddress:(id)a3;
- (void)setInitializedNameComponents:(id)a3;
- (void)setInitializedPhoneNumber:(id)a3;
- (void)setLastNameCell:(id)a3;
- (void)setPhoneNumberCell:(id)a3;
- (void)setRequirements:(id)a3;
- (void)syncStateForInputCell:(id)a3 type:(unint64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFooterText;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ReservationContactInfoViewController

- (ReservationContactInfoViewController)initWithNameComponents:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 guestDisplayPreferences:(id)a6 requirements:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ReservationContactInfoViewController;
  v18 = [(ReservationContactInfoViewController *)&v28 initWithStyle:1];
  if (v18)
  {
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"reservation_enter_info_key" value:@"localized string not found" table:0];
    [(ReservationContactInfoViewController *)v18 setTitle:v20];

    v21 = (INRestaurantGuestDisplayPreferences *)[v16 copy];
    guestDisplayPreferences = v18->_guestDisplayPreferences;
    v18->_guestDisplayPreferences = v21;

    objc_storeStrong((id *)&v18->_requirements, a7);
    [(ReservationContactInfoViewController *)v18 updateFooterText];
    v23 = (NSString *)[v14 copy];
    initializedEmailAddress = v18->_initializedEmailAddress;
    v18->_initializedEmailAddress = v23;

    v25 = (NSString *)[v15 copy];
    initializedPhoneNumber = v18->_initializedPhoneNumber;
    v18->_initializedPhoneNumber = v25;

    objc_storeStrong((id *)&v18->_initializedNameComponents, a3);
  }

  return v18;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ReservationContactInfoViewController;
  [(ReservationContactInfoViewController *)&v3 viewDidLoad];
  [(ReservationContactInfoViewController *)self configureContactItems];
  [(ReservationContactInfoViewController *)self configureTableView];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ReservationContactInfoViewController;
  [(ReservationContactInfoViewController *)&v5 viewWillDisappear:a3];
  v4 = [(ReservationContactInfoViewController *)self contactDelegate];
  [v4 reservationContactInfoViewControllerDidSelectDone:self];
}

- (void)configureContactItems
{
  id v5 = [(ReservationContactInfoViewController *)self guestDisplayPreferences];
  objc_super v3 = [(ReservationContactInfoViewController *)self requirements];
  v4 = [(ReservationContactInfoViewController *)self itemsForGuestDisplayPreferences:v5 requirements:v3];
  [(ReservationContactInfoViewController *)self setContactItems:v4];
}

- (id)itemsForGuestDisplayPreferences:(id)a3 requirements:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSMutableArray arrayWithCapacity:4];
  if ([v5 nameFieldShouldBeDisplayed])
  {
    if ([v5 nameFieldFirstNameOptional]) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = [v6 nameRequired] ^ 1;
    }
    if ([v5 nameFieldLastNameOptional]) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = [v6 nameRequired] ^ 1;
    }
    if ([v6 nameRequired] && objc_msgSend(v5, "nameFieldFirstNameOptional"))
    {
      unsigned int v10 = [v5 nameFieldLastNameOptional];
      v9 &= ~v10;
      v8 |= v10;
    }
    v11 = -[ContactCellItem initWithType:editable:required:]([ContactCellItem alloc], "initWithType:editable:required:", 0, [v5 nameEditable], v8 ^ 1);
    v12 = -[ContactCellItem initWithType:editable:required:]([ContactCellItem alloc], "initWithType:editable:required:", 1, [v5 nameEditable], v9 ^ 1);
    v18[0] = v11;
    v18[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v18 count:2];
    [v7 addObjectsFromArray:v13];
  }
  if ([v5 phoneNumberFieldShouldBeDisplayed])
  {
    id v14 = [[ContactCellItem alloc] initWithType:3 editable:[v5 phoneNumberEditable] required:[v6 phoneNumberRequired]];
    [v7 addObject:v14];
  }
  if ([v5 emailAddressFieldShouldBeDisplayed])
  {
    id v15 = [[ContactCellItem alloc] initWithType:2 editable:[v5 emailAddressEditable] required:[v6 emailAddressRequired]];
    [v7 addObject:v15];
  }
  id v16 = +[NSArray arrayWithArray:v7];

  return v16;
}

- (void)configureTableView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v4 = [(ReservationContactInfoViewController *)self tableView];
  [v4 setTableFooterView:v3];

  id v5 = [(ReservationContactInfoViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  unsigned int v8 = NSStringFromClass(v7);
  [v5 registerClass:v6 forCellReuseIdentifier:v8];

  unsigned int v9 = [(ReservationContactInfoViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];

  id v10 = [(ReservationContactInfoViewController *)self tableView];
  [v10 setScrollEnabled:1];
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = [(ReservationContactInfoViewController *)self contactDelegate];
  [v4 reservationContactInfoViewControllerDidSelectDone:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ReservationContactInfoViewController;
  [(ReservationContactInfoViewController *)&v8 viewDidAppear:a3];
  id v4 = [(ReservationContactInfoViewController *)self contactItems];
  id v5 = [v4 firstObject];

  uint64_t v6 = -[ReservationContactInfoViewController inputCellForType:](self, "inputCellForType:", [v5 type]);
  v7 = [v6 textField];
  [v7 becomeFirstResponder];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v5 textField];
    [v4 becomeFirstResponder];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(ReservationContactInfoViewController *)self contactItems];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (objc_class *)objc_opt_class();
  unsigned int v9 = NSStringFromClass(v8);
  id v10 = [v7 dequeueReusableCellWithIdentifier:v9];

  if (((unint64_t)[v6 row] & 0x8000000000000000) == 0)
  {
    id v11 = [v6 row];
    v12 = [(ReservationContactInfoViewController *)self contactItems];
    id v13 = [v12 count];

    if (v11 < v13)
    {
      id v14 = [(ReservationContactInfoViewController *)self contactItems];
      id v15 = [v14 objectAtIndexedSubscript:[v6 row]];

      [(ReservationContactInfoViewController *)self configureCell:v10 withItem:v15];
      -[ReservationContactInfoViewController syncStateForInputCell:type:](self, "syncStateForInputCell:type:", v10, [v15 type]);
    }
  }

  return v10;
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  unsigned int v7 = [v6 required];
  objc_super v8 = +[NSBundle mainBundle];
  unsigned int v9 = v8;
  if (v7) {
    CFStringRef v10 = @"reservation_required_key";
  }
  else {
    CFStringRef v10 = @"reservation_optional_key";
  }
  id v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
  [v18 setPlaceholderText:v11];

  id v12 = [v6 editable];
  id v13 = [v18 textField];
  [v13 setEnabled:v12];

  id v14 = [v18 textField];
  if ([v14 isEnabled]) {
    +[UIColor labelColor];
  }
  else {
  id v15 = +[UIColor secondaryLabelColor];
  }
  [v18 setDetailTextColor:v15];

  id v16 = -[ReservationContactInfoViewController titleStringForContactCellType:](self, "titleStringForContactCellType:", [v6 type]);
  [v18 setTitleText:v16];

  id v17 = -[ReservationContactInfoViewController textFieldTextForContactCellType:](self, "textFieldTextForContactCellType:", [v6 type]);
  [v18 setText:v17];

  [v18 setType:[self inputCellTypeForContactCellType:[v6 type]]];
  objc_msgSend(v18, "setRequired:", objc_msgSend(v6, "required"));
  [v18 setSelectionStyle:0];
}

- (id)textFieldTextForContactCellType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = [(ReservationContactInfoViewController *)self initializedNameComponents];
      id v5 = [v4 givenName];

      if ([v5 length])
      {
        id v6 = [(ReservationContactInfoViewController *)self firstNameCell];

        if (!v6) {
          goto LABEL_22;
        }
      }
      unsigned int v7 = [(ReservationContactInfoViewController *)self firstNameCell];

      if (!v7) {
        goto LABEL_21;
      }
      objc_super v8 = [(ReservationContactInfoViewController *)self firstNameCell];
      goto LABEL_10;
    case 1uLL:
      unsigned int v9 = [(ReservationContactInfoViewController *)self initializedNameComponents];
      id v5 = [v9 familyName];

      if ([v5 length])
      {
        CFStringRef v10 = [(ReservationContactInfoViewController *)self lastNameCell];

        if (!v10)
        {
LABEL_22:
          v23 = v5;
          goto LABEL_23;
        }
      }
      id v11 = [(ReservationContactInfoViewController *)self lastNameCell];

      if (v11)
      {
        objc_super v8 = [(ReservationContactInfoViewController *)self lastNameCell];
LABEL_10:
        id v12 = v8;
        id v13 = [v8 text];
      }
      else
      {
LABEL_21:
        id v13 = &stru_101324E70;
      }
      goto LABEL_24;
    case 2uLL:
      uint64_t v14 = [(ReservationContactInfoViewController *)self initializedEmailAddress];
      if (v14)
      {
        id v15 = (void *)v14;
        id v16 = [(ReservationContactInfoViewController *)self emailCell];

        if (!v16)
        {
          uint64_t v25 = [(ReservationContactInfoViewController *)self initializedEmailAddress];
          goto LABEL_30;
        }
      }
      id v17 = [(ReservationContactInfoViewController *)self emailCell];

      if (!v17) {
        goto LABEL_20;
      }
      id v18 = [(ReservationContactInfoViewController *)self emailCell];
      goto LABEL_19;
    case 3uLL:
      uint64_t v19 = [(ReservationContactInfoViewController *)self initializedPhoneNumber];
      if (v19
        && (v20 = (void *)v19,
            [(ReservationContactInfoViewController *)self phoneNumberCell],
            v21 = objc_claimAutoreleasedReturnValue(),
            v21,
            v20,
            !v21))
      {
        uint64_t v25 = [(ReservationContactInfoViewController *)self initializedPhoneNumber];
LABEL_30:
        id v13 = (__CFString *)v25;
      }
      else
      {
        v22 = [(ReservationContactInfoViewController *)self phoneNumberCell];

        if (v22)
        {
          id v18 = [(ReservationContactInfoViewController *)self phoneNumberCell];
LABEL_19:
          id v5 = v18;
          v23 = [v18 text];
LABEL_23:
          id v13 = v23;
LABEL_24:
        }
        else
        {
LABEL_20:
          id v13 = &stru_101324E70;
        }
      }
      return v13;
    default:
      goto LABEL_20;
  }
}

- (int64_t)inputCellTypeForContactCellType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 2;
  }
  else {
    return qword_100F6F530[a3 - 1];
  }
}

- (id)titleStringForContactCellType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"reservation_name_key_given";
      goto LABEL_7;
    case 1uLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"reservation_name_key_last";
      goto LABEL_7;
    case 2uLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"reservation_email_key";
      goto LABEL_7;
    case 3uLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"reservation_phone_key";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      id v6 = &stru_101324E70;
      break;
  }

  return v6;
}

- (void)syncStateForInputCell:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 0uLL:
      [(ReservationContactInfoViewController *)self setFirstNameCell:v6];
      goto LABEL_6;
    case 1uLL:
      [(ReservationContactInfoViewController *)self setLastNameCell:v6];
      goto LABEL_6;
    case 2uLL:
      [(ReservationContactInfoViewController *)self setEmailCell:v6];
      goto LABEL_6;
    case 3uLL:
      [(ReservationContactInfoViewController *)self setPhoneNumberCell:v6];
LABEL_6:
      id v6 = v7;
      break;
    default:
      break;
  }
}

- (id)inputCellForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      CFStringRef v5 = [(ReservationContactInfoViewController *)self firstNameCell];
      goto LABEL_9;
    case 1uLL:
      CFStringRef v5 = [(ReservationContactInfoViewController *)self lastNameCell];
      goto LABEL_9;
    case 2uLL:
      CFStringRef v5 = [(ReservationContactInfoViewController *)self emailCell];
      goto LABEL_9;
    case 3uLL:
      CFStringRef v5 = [(ReservationContactInfoViewController *)self phoneNumberCell];
LABEL_9:
      break;
    default:
      CFStringRef v5 = 0;
      break;
  }
  return v5;
}

- (void)updateFooterText
{
  id v8 = [(ReservationContactInfoViewController *)self requirements];
  id v3 = [v8 nameRequired];
  uint64_t v4 = [(ReservationContactInfoViewController *)self requirements];
  id v5 = [v4 phoneNumberRequired];
  id v6 = [(ReservationContactInfoViewController *)self requirements];
  id v7 = -[ReservationContactInfoViewController stringForNameMissing:phoneNumberMissing:emailAddressMissing:](self, "stringForNameMissing:phoneNumberMissing:emailAddressMissing:", v3, v5, [v6 emailAddressRequired]);
  [(ReservationContactInfoViewController *)self setFooterText:v7];
}

- (id)stringForNameMissing:(BOOL)a3 phoneNumberMissing:(BOOL)a4 emailAddressMissing:(BOOL)a5
{
  BOOL v5 = !a3 || !a4;
  BOOL v6 = !a5;
  if (v5 || v6)
  {
    if (v5 || a5)
    {
      BOOL v10 = !a3 || a4;
      if (v10 || v6)
      {
        BOOL v11 = !a4 || a3;
        if (v11 || v6)
        {
          if (a3 || a4 || v6)
          {
            if (v11 || a5)
            {
              if (v10 || a5)
              {
                id v12 = &stru_101324E70;
                goto LABEL_18;
              }
              id v7 = +[NSBundle mainBundle];
              id v8 = v7;
              CFStringRef v9 = @"reservation_name_missing_key";
            }
            else
            {
              id v7 = +[NSBundle mainBundle];
              id v8 = v7;
              CFStringRef v9 = @"reservation_phone_missing_key";
            }
          }
          else
          {
            id v7 = +[NSBundle mainBundle];
            id v8 = v7;
            CFStringRef v9 = @"reservation_email_missing_key";
          }
        }
        else
        {
          id v7 = +[NSBundle mainBundle];
          id v8 = v7;
          CFStringRef v9 = @"reservation_phone_email_missing_key";
        }
      }
      else
      {
        id v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"reservation_name_email_missing_key";
      }
    }
    else
    {
      id v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"reservation_name_phone_missing_key";
    }
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"reservation_name_email_phone_missing_key";
  }
  id v12 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];

LABEL_18:

  return v12;
}

- (NSPersonNameComponents)nameComponents
{
  id v3 = [(ReservationContactInfoViewController *)self guestDisplayPreferences];
  unsigned int v4 = [v3 nameFieldShouldBeDisplayed];

  BOOL v5 = [(ReservationContactInfoViewController *)self initializedNameComponents];
  id v6 = v5;
  if (v4)
  {

    if (v6)
    {
      id v7 = [(ReservationContactInfoViewController *)self initializedNameComponents];
      id v6 = [v7 copy];
    }
    else
    {
      id v6 = objc_alloc_init((Class)NSPersonNameComponents);
    }
    id v8 = [(ReservationContactInfoViewController *)self firstNameCell];
    CFStringRef v9 = [v8 text];
    [v6 setGivenName:v9];

    BOOL v10 = [(ReservationContactInfoViewController *)self lastNameCell];
    BOOL v11 = [v10 text];
    [v6 setFamilyName:v11];
  }

  return (NSPersonNameComponents *)v6;
}

- (NSString)emailAddress
{
  id v3 = [(ReservationContactInfoViewController *)self guestDisplayPreferences];
  if ([v3 emailAddressFieldShouldBeDisplayed])
  {
    unsigned int v4 = [(ReservationContactInfoViewController *)self emailCell];
    BOOL v5 = [v4 text];
  }
  else
  {
    BOOL v5 = [(ReservationContactInfoViewController *)self initializedEmailAddress];
  }

  return (NSString *)v5;
}

- (NSString)phoneNumber
{
  id v3 = [(ReservationContactInfoViewController *)self guestDisplayPreferences];
  if ([v3 phoneNumberFieldShouldBeDisplayed])
  {
    unsigned int v4 = [(ReservationContactInfoViewController *)self phoneNumberCell];
    BOOL v5 = [v4 text];
  }
  else
  {
    BOOL v5 = [(ReservationContactInfoViewController *)self initializedPhoneNumber];
  }

  return (NSString *)v5;
}

- (ReservationContactInfoViewControllerDelegate)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDelegate);

  return (ReservationContactInfoViewControllerDelegate *)WeakRetained;
}

- (void)setContactDelegate:(id)a3
{
}

- (ReservationInputCell)firstNameCell
{
  return self->_firstNameCell;
}

- (void)setFirstNameCell:(id)a3
{
}

- (ReservationInputCell)lastNameCell
{
  return self->_lastNameCell;
}

- (void)setLastNameCell:(id)a3
{
}

- (ReservationInputCell)phoneNumberCell
{
  return self->_phoneNumberCell;
}

- (void)setPhoneNumberCell:(id)a3
{
}

- (ReservationInputCell)emailCell
{
  return self->_emailCell;
}

- (void)setEmailCell:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSPersonNameComponents)initializedNameComponents
{
  return self->_initializedNameComponents;
}

- (void)setInitializedNameComponents:(id)a3
{
}

- (NSString)initializedPhoneNumber
{
  return self->_initializedPhoneNumber;
}

- (void)setInitializedPhoneNumber:(id)a3
{
}

- (NSString)initializedEmailAddress
{
  return self->_initializedEmailAddress;
}

- (void)setInitializedEmailAddress:(id)a3
{
}

- (NSArray)contactItems
{
  return self->_contactItems;
}

- (void)setContactItems:(id)a3
{
}

- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences
{
  return self->_guestDisplayPreferences;
}

- (void)setGuestDisplayPreferences:(id)a3
{
}

- (ContactRequirements)requirements
{
  return self->_requirements;
}

- (void)setRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_guestDisplayPreferences, 0);
  objc_storeStrong((id *)&self->_contactItems, 0);
  objc_storeStrong((id *)&self->_initializedEmailAddress, 0);
  objc_storeStrong((id *)&self->_initializedPhoneNumber, 0);
  objc_storeStrong((id *)&self->_initializedNameComponents, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_emailCell, 0);
  objc_storeStrong((id *)&self->_phoneNumberCell, 0);
  objc_storeStrong((id *)&self->_lastNameCell, 0);
  objc_storeStrong((id *)&self->_firstNameCell, 0);

  objc_destroyWeak((id *)&self->_contactDelegate);
}

@end