@interface MailboxEditingController
+ (OS_os_log)log;
- (BOOL)_queueMailboxOperation:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)textFieldShouldReturn:(id)a3;
- (EFCancelable)tableViewObserver;
- (MFMailboxUid)mailbox;
- (MFMailboxUid)parentMailbox;
- (MailAccount)account;
- (MailboxEditingController)initWithMailbox:(id)a3 account:(id)a4 validAccounts:(id)a5;
- (MailboxEditingControllerDelegate)delegate;
- (NSArray)validAccounts;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_deleteMailboxButtonTableViewCell;
- (id)createMailboxOperation;
- (id)deleteMailboxOperation;
- (id)moveMailboxOperation;
- (id)renameMailboxOperation;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_applyChangesAndDismissView;
- (void)_cancelButtonClicked:(id)a3;
- (void)_confirmDelete:(id)a3;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_createMailboxNameCell;
- (void)_updateParentMailbox;
- (void)_updateRowHeight;
- (void)_updateSaveButtonEnabledState;
- (void)dealloc;
- (void)mailboxParentPickerDidSelectMailbox:(id)a3;
- (void)setAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMailbox:(id)a3;
- (void)setParentMailbox:(id)a3;
- (void)setTableViewObserver:(id)a3;
- (void)setValidAccounts:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MailboxEditingController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6460;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006995B0 != -1) {
    dispatch_once(&qword_1006995B0, block);
  }
  v2 = (void *)qword_1006995A8;

  return (OS_os_log *)v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)MailboxEditingController;
  [(MailboxEditingController *)&v5 dealloc];
}

- (MailboxEditingController)initWithMailbox:(id)a3 account:(id)a4 validAccounts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MailboxEditingController;
  v11 = [(MailboxEditingController *)&v19 initWithStyle:2];
  v12 = v11;
  if (v11)
  {
    [(MailboxEditingController *)v11 setHidesBottomBarWhenPushed:1];
    [(MailboxEditingController *)v12 setMailbox:v8];
    if (v8)
    {
      v13 = +[MailChangeManager sharedChangeManager];
      v14 = [v13 parentForMailbox:v8];
    }
    else
    {
      v14 = [v9 rootMailbox];
    }
    [(MailboxEditingController *)v12 setParentMailbox:v14];
    objc_storeStrong((id *)&v12->_oldParentMailbox, v14);
    [(MailboxEditingController *)v12 setAccount:v9];
    v15 = (NSArray *)[v10 copy];
    validAccounts = v12->_validAccounts;
    v12->_validAccounts = v15;

    [(MailboxEditingController *)v12 _createMailboxNameCell];
    if (v8) {
      v12->_showDeleteButton = [v9 canMailboxBeDeleted:v8];
    }
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v12 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v12;
}

- (void)_createMailboxNameCell
{
  v3 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  id v10 = [v3 text];

  v4 = (UITableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:1000 reuseIdentifier:0];
  mailboxNameCell = self->_mailboxNameCell;
  self->_mailboxNameCell = v4;

  [(UITableViewCell *)self->_mailboxNameCell setTextFieldOffset:0.0];
  [(UITableViewCell *)self->_mailboxNameCell setSelectionStyle:0];
  v6 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"textChanged:" name:UITextFieldTextDidChangeNotification object:v6];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"MAILBOX_NAME_PLACEHOLDER" value:&stru_100619928 table:@"Main"];
  [v6 setPlaceholder:v9];

  [v6 setClearButtonMode:1];
  [v6 setReturnKeyType:9];
  [v6 setEnablesReturnKeyAutomatically:1];
  [v6 setAutocapitalizationType:2];
  [v6 _setDataOwnerForPaste:3];
  [v6 _setDataOwnerForCopy:3];
  [v6 setText:v10];
  [v6 setDelegate:self];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)MailboxEditingController;
  [(MailboxEditingController *)&v20 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"SAVE" value:&stru_100619928 table:@"Main"];

  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v4 style:2 target:self action:"_saveButtonClicked:"];
  [v5 setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxViewSaveButton];
  v6 = [(MailboxEditingController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = objc_alloc((Class)UIBarButtonItem);
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
  id v10 = [v7 initWithTitle:v9 style:0 target:self action:"_cancelButtonClicked:"];

  [v10 setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxViewCancelButton];
  v11 = [(MailboxEditingController *)self navigationItem];
  [v11 setLeftBarButtonItem:v10];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"EDIT_MAILBOX" value:&stru_100619928 table:@"Main"];

  v14 = [(MailboxEditingController *)self mailbox];

  if (!v14)
  {
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"NEW_MAILBOX" value:&stru_100619928 table:@"Main"];

    v13 = (void *)v16;
  }
  v17 = [(MailboxEditingController *)self navigationItem];
  [v17 setTitle:v13];

  v18 = [(MailboxEditingController *)self navigationItem];
  [v18 setAccessibilityIdentifier:v13];

  [(MailboxEditingController *)self _updateRowHeight];
  objc_super v19 = [(MailboxEditingController *)self navigationController];
  [v19 _setClipUnderlapWhileTransitioning:1];
}

- (void)_updateRowHeight
{
  v6 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    double v4 = UITableViewAutomaticDimension;
  }
  else
  {
    +[MailboxTableCell defaultRowHeight];
    double v4 = v5;
  }
  id v7 = [(MailboxEditingController *)self tableView];
  [v7 setRowHeight:v4];
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[MailboxTableCell invalidateCachedLayoutInformation];
  [(MailboxEditingController *)self _updateRowHeight];
  [(MailboxEditingController *)self _createMailboxNameCell];
  deleteMailboxCell = self->_deleteMailboxCell;
  self->_deleteMailboxCell = 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxEditingController;
  [(MailboxEditingController *)&v5 traitCollectionDidChange:v4];
  [(MailboxEditingController *)self mf_updateTableViewBackgroundColorForPopover];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MailboxEditingController;
  [(MailboxEditingController *)&v14 viewWillAppear:a3];
  objc_super v5 = [(MailboxEditingController *)self tableView];
  [v5 setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxView];
  v6 = [(MailboxEditingController *)self mf_updatePreferredContentSizeBasedOnTableView];
  [(MailboxEditingController *)self setTableViewObserver:v6];

  [v5 reloadData];
  id v7 = +[NSIndexPath indexPathForRow:0 inSection:0];
  id v8 = [v5 cellForRowAtIndexPath:v7];

  mailboxNameCell = v8;
  if (v8 != self->_mailboxNameCell)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MailboxEditingController.m" lineNumber:170 description:@"unexpected cell"];

    mailboxNameCell = self->_mailboxNameCell;
  }
  id v10 = [(UITableViewCell *)mailboxNameCell editableTextField];
  [v10 setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxViewMailboxNameCell];
  if (self->_mailbox)
  {
    v11 = +[MailChangeManager sharedChangeManager];
    v12 = [v11 displayNameForMailbox:self->_mailbox];
    [v10 setText:v12];
  }
  [(MailboxEditingController *)self _updateSaveButtonEnabledState];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxEditingController;
  [(MailboxEditingController *)&v5 viewDidAppear:a3];
  id v4 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  [v4 becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad] ^ 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_showDeleteButton) {
    return 3;
  }
  else {
    return 2;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    if ([v5 section] == (id)1)
    {
      if (!self->_parentMailboxCell)
      {
        v6 = [[MailMailboxGroupedPickerTableCell alloc] initWithStyle:0 reuseIdentifier:0];
        parentMailboxCell = self->_parentMailboxCell;
        self->_parentMailboxCell = v6;

        [(MailMailboxGroupedPickerTableCell *)self->_parentMailboxCell setAlwaysDisplayAsTopLevel:1];
        [(MailMailboxGroupedPickerTableCell *)self->_parentMailboxCell setAccessoryType:1];
        [(MailMailboxGroupedPickerTableCell *)self->_parentMailboxCell setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxViewMailboxPickerButton];
      }
      [(MailboxEditingController *)self _updateParentMailbox];
      id v8 = self->_parentMailboxCell;
    }
    else
    {
      id v8 = [(MailboxEditingController *)self _deleteMailboxButtonTableViewCell];
    }
    p_super = &v8->super.super;
  }
  else
  {
    p_super = self->_mailboxNameCell;
    id v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v11 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
    [v11 setFont:v10];
  }

  return p_super;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"MAILBOX_LOCATION" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)mailboxParentPickerDidSelectMailbox:(id)a3
{
  id v5 = a3;
  -[MailboxEditingController setParentMailbox:](self, "setParentMailbox:");
  id v4 = [v5 account];
  [(MailboxEditingController *)self setAccount:v4];

  [(MailboxEditingController *)self _updateParentMailbox];
}

- (void)_updateParentMailbox
{
}

- (void)_updateSaveButtonEnabledState
{
  parentMailbox = self->_parentMailbox;
  id v10 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  id v4 = [v10 text];
  id v5 = [v4 length];

  id v11 = [(MailboxEditingController *)self navigationItem];
  v6 = [v11 rightBarButtonItem];
  id v7 = v6;
  if (v5) {
    BOOL v8 = parentMailbox == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  [v6 setEnabled:v9];
}

- (id)_deleteMailboxButtonTableViewCell
{
  deleteMailboxCell = self->_deleteMailboxCell;
  if (!deleteMailboxCell)
  {
    id v4 = (UITableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_deleteMailboxCell;
    self->_deleteMailboxCell = v4;

    [(UITableViewCell *)self->_deleteMailboxCell setSelectionStyle:0];
    v6 = +[UIButton buttonWithType:1];
    id v7 = +[UIButtonConfiguration plainButtonConfiguration];
    BOOL v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"DELETE_MAILBOX" value:&stru_100619928 table:@"Main"];
    [v7 setTitle:v9];

    id v10 = +[UIColor systemRedColor];
    [v7 setBaseForegroundColor:v10];

    [v6 setConfiguration:v7];
    [v6 setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxViewDeleteMailboxButton];
    [v6 addTarget:self action:"_confirmDelete:" forControlEvents:64];
    id v11 = [(UITableViewCell *)self->_deleteMailboxCell contentView];
    [v11 addSubview:v6];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [v6 superview];
    [v6 mf_pinToView:v12 usingLayoutMargins:0];

    deleteMailboxCell = self->_deleteMailboxCell;
  }

  return deleteMailboxCell;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  [v5 sectionHeaderHeight];
  double v7 = v6;
  if (a4 == 1)
  {
    BOOL v8 = [UIApp preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

    if (!IsAccessibilityCategory)
    {
      if (+[UIDevice mf_isPad]) {
        double v7 = 34.0;
      }
      else {
        double v7 = 26.0;
      }
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  [v5 sectionFooterHeight];
  double v7 = v6;
  if (((a4 == 1) & +[UIDevice mf_isPad]) != 0) {
    double v7 = 25.0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 section] == (id)1)
  {
    double v7 = [[MailboxParentPickerController alloc] initWithMailboxUid:self->_mailbox parentMailbox:self->_parentMailbox visibleAccounts:self->_validAccounts];
    [(MailboxParentPickerController *)v7 setAccessibilityIdentifier:MSAccessibilityIdentifierMailEditMailboxViewMailboxPickerView];
    [(MailboxParentPickerController *)v7 setMailboxSelectionTarget:self];
    BOOL v8 = [(MailboxEditingController *)self navigationController];
    [v8 pushViewController:v7 animated:1];

    [v9 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];
}

- (void)_applyChangesAndDismissView
{
  if (self->_isDeletingMailbox)
  {
    v3 = [(MailboxEditingController *)self deleteMailboxOperation];
    [(MailboxEditingController *)self _queueMailboxOperation:v3];

    id v4 = 0;
    id v5 = 0;
LABEL_3:
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"MVMailboxListHasPendingChangesNotification" object:0];

    goto LABEL_4;
  }
  BOOL v8 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  v49 = v8;
  if ([v8 isEditing])
  {
    [v8 resignFirstResponder];
    [v8 becomeFirstResponder];
  }
  id v9 = [v8 text];
  id v10 = [(MailboxEditingController *)self parentMailbox];
  if (!v10)
  {
    id v10 = [(MailAccount *)self->_account rootMailbox];
  }
  id v11 = [v10 account];
  uint64_t v12 = [v11 rootMailbox];

  v51 = (void *)v12;
  v13 = [v10 pathRelativeToMailbox:v12];
  uint64_t v14 = [v13 stringByAppendingPathComponent:v9];

  v48 = (void *)v14;
  id v5 = [(MailAccount *)self->_account mailboxUidForRelativePath:v14 create:0];

  int v15 = v5 == 0;
  if (v5)
  {
    uint64_t v16 = [v10 pathRelativeToMailboxForDisplay:v51];
    v17 = [v16 stringByAppendingPathComponent:v9];

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v19 = [v18 localizedStringForKey:@"MAILBOX_ALREADY_EXISTS" value:&stru_100619928 table:@"Main"];

    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v17);
  }
  account = self->_account;
  id v52 = 0;
  unsigned __int8 v21 = [(MailAccount *)account newMailboxNameIsAcceptable:v9 reasonForFailure:&v52];
  id v22 = v52;
  id v23 = v22;
  if ((v21 & 1) == 0)
  {
    id v24 = v22;

    int v15 = 0;
    id v5 = v24;
  }
  v50 = v23;
  if (![v9 length])
  {
    int v27 = 0;
    BOOL v28 = 0;
    id v4 = 0;
LABEL_40:
    v30 = v51;
    goto LABEL_41;
  }
  if (self->_mailbox)
  {
    v47 = [(MailAccount *)self->_account _uidNameForPathComponent:v9];
    v25 = [(MFMailboxUid *)self->_mailbox name];
    BOOL v26 = ([v47 isEqualToString:v25] & 1) == 0 && [v47 length] != 0;

    v31 = [(MailboxEditingController *)self parentMailbox];
    oldParentMailbox = self->_oldParentMailbox;

    int v33 = v31 != oldParentMailbox || v26;
    int v46 = v33 & ~v15;
    if (v46 == 1)
    {
      v34 = +[NSBundle bundleForClass:objc_opt_class()];
      v35 = v34;
      if (v26) {
        CFStringRef v36 = @"ERROR_RENAMING_MAILBOX_TITLE";
      }
      else {
        CFStringRef v36 = @"ERROR_MOVING_MAILBOX_TITLE";
      }
      id v4 = [v34 localizedStringForKey:v36 value:&stru_100619928 table:@"Main"];
      int v37 = 1;
    }
    else
    {
      if (v26)
      {
        v38 = [(MailboxEditingController *)self renameMailboxOperation];
        unsigned __int8 v39 = [(MailboxEditingController *)self _queueMailboxOperation:v38];

        if (v39)
        {
          int v37 = 0;
          id v4 = 0;
          int v27 = 1;
        }
        else
        {
          v41 = +[NSBundle bundleForClass:objc_opt_class()];
          id v4 = [v41 localizedStringForKey:@"ERROR_RENAMING_MAILBOX_TITLE" value:&stru_100619928 table:@"Main"];

          uint64_t v42 = sub_1000E819C();

          int v27 = 0;
          int v37 = 1;
          id v5 = (void *)v42;
        }
      }
      else
      {
        int v27 = 0;
        int v37 = 0;
        id v4 = 0;
      }
      if (v31 == oldParentMailbox) {
        goto LABEL_39;
      }
      v35 = [(MailboxEditingController *)self moveMailboxOperation];
      [(MailboxEditingController *)self _queueMailboxOperation:v35];
    }
    int v27 = v46 ^ 1;

LABEL_39:
    BOOL v28 = v37 != 0;
    goto LABEL_40;
  }
  if (v15)
  {
    v29 = [(MailboxEditingController *)self createMailboxOperation];
    v30 = v51;
    [(MailboxEditingController *)self _queueMailboxOperation:v29];

    int v27 = 0;
    BOOL v28 = 0;
    id v4 = 0;
  }
  else
  {
    v40 = +[NSBundle bundleForClass:objc_opt_class()];
    v30 = v51;
    id v4 = [v40 localizedStringForKey:@"ERROR_CREATING_MAILBOX_TITLE" value:&stru_100619928 table:@"Main"];

    int v27 = 0;
    BOOL v28 = 1;
  }
LABEL_41:

  if (v28)
  {
    double v7 = +[UIAlertController alertControllerWithTitle:v4 message:v5 preferredStyle:1];
    v43 = +[NSBundle bundleForClass:objc_opt_class()];
    v44 = [v43 localizedStringForKey:@"OK" value:&stru_100619928 table:@"Main"];
    v45 = +[UIAlertAction actionWithTitle:v44 style:0 handler:0];
    [v7 addAction:v45];

    [(MailboxEditingController *)self presentViewController:v7 animated:1 completion:0];
    goto LABEL_5;
  }
  if (v27) {
    goto LABEL_3;
  }
LABEL_4:
  double v7 = [(MailboxEditingController *)self delegate];
  [v7 mailboxEditingControllerDidFinish:self];
LABEL_5:
}

- (void)_cancelButtonClicked:(id)a3
{
  id v4 = [(MailboxEditingController *)self delegate];
  [v4 mailboxEditingControllerDidFinish:self];
}

- (void)_confirmDelete:(id)a3
{
  id v4 = +[MailChangeManager sharedChangeManager];
  unsigned int v5 = [v4 mailboxHasSubMailboxes:self->_mailbox];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  double v7 = v6;
  if (v5) {
    [v6 localizedStringForKey:@"MAILBOX_WITH_SUBMAILBOXES_DELETE_DESCRIPTION_FORMAT" value:&stru_100619928 table:@"Main"];
  }
  else {
  BOOL v8 = [v6 localizedStringForKey:@"MAILBOX_DELETE_DESCRIPTION_FORMAT" value:&stru_100619928 table:@"Main"];
  }

  id v9 = +[MailChangeManager sharedChangeManager];
  id v10 = [v9 displayNameForMailbox:self->_mailbox];
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10);

  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"DELETE_MAILBOX" value:&stru_100619928 table:@"Main"];
  uint64_t v14 = +[UIAlertController alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  int v15 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"DELETE" value:&stru_100619928 table:@"Main"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E85F4;
  v21[3] = &unk_1006079A8;
  v21[4] = self;
  v17 = +[UIAlertAction actionWithTitle:v16 style:2 handler:v21];
  [v14 addAction:v17];

  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
  objc_super v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:0];
  [v14 addAction:v20];

  [(MailboxEditingController *)self presentViewController:v14 animated:1 completion:0];
}

- (BOOL)_queueMailboxOperation:(id)a3
{
  id v3 = a3;
  id v4 = _os_activity_create((void *)&_mh_execute_header, "mailbox operation", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v4, &state);
  unsigned int v5 = +[MailboxEditingController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Queueing mailbox operation %@", buf, 0xCu);
  }

  id v6 = [[MailMailboxChangeSet alloc] initWithOperation:v3];
  double v7 = +[MailChangeManager sharedChangeManager];
  [v7 pause];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E8824;
  v11[3] = &unk_1006079F8;
  BOOL v8 = v6;
  uint64_t v12 = v8;
  unsigned __int8 v9 = [v7 addChange:v8 currentAndPendingChangesBlock:v11];
  [v7 resume];

  os_activity_scope_leave(&state);
  return v9;
}

- (id)deleteMailboxOperation
{
  v2 = [[MCSDeleteMailboxOperation alloc] initWithMailboxToDelete:self->_mailbox];

  return v2;
}

- (id)renameMailboxOperation
{
  id v3 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  id v4 = [v3 text];

  if ([v4 length]) {
    unsigned int v5 = [[MCSRenameMailboxOperation alloc] initWithMailboxToRename:self->_mailbox toName:v4];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)moveMailboxOperation
{
  id v3 = [(MailboxEditingController *)self parentMailbox];
  id v4 = [[MCSMoveMailboxOperation alloc] initWithMailboxToMove:self->_mailbox toParent:v3];

  return v4;
}

- (id)createMailboxOperation
{
  id v3 = [(UITableViewCell *)self->_mailboxNameCell editableTextField];
  id v4 = [v3 text];

  unsigned int v5 = [(MailboxEditingController *)self parentMailbox];
  if (!v5)
  {
    unsigned int v5 = [(MailAccount *)self->_account rootMailbox];
  }
  id v6 = [[MCSCreateMailboxOperation alloc] initWithName:v4 parentMailbox:v5];

  return v6;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
}

- (MFMailboxUid)parentMailbox
{
  return self->_parentMailbox;
}

- (void)setParentMailbox:(id)a3
{
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MailboxEditingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailboxEditingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)validAccounts
{
  return self->_validAccounts;
}

- (void)setValidAccounts:(id)a3
{
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewObserver, 0);
  objc_storeStrong((id *)&self->_validAccounts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_parentMailbox, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_parentMailboxCell, 0);
  objc_storeStrong((id *)&self->_deleteMailboxCell, 0);
  objc_storeStrong((id *)&self->_mailboxNameCell, 0);

  objc_storeStrong((id *)&self->_oldParentMailbox, 0);
}

@end