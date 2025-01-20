@interface MFCategorizationTriageInteraction
+ (OS_os_log)log;
+ (id)interactionWithMessageListItemSelection:(id)a3 sender:(id)a4 groupedSenderDisplayName:(id)a5 origin:(int64_t)a6 actor:(int64_t)a7 bucket:(int64_t)a8 avatarGenerator:(id)a9 isAuthenticated:(BOOL)a10 changeOptions:(unint64_t)a11 showMenuWithOptions:(BOOL)a12;
- (BOOL)_requiresConfirmationPrompt;
- (BOOL)isAuthenticated;
- (BOOL)isRecategorizationAction;
- (BOOL)showMenuWithOptions;
- (NSString)displayName;
- (id)_iconImageName;
- (id)_menuWithPreparation:(id)a3 completion:(id)a4;
- (id)cardActionWithCompletion:(id)a3;
- (id)color;
- (id)previewTitle;
- (id)shortTitle;
- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4;
- (id)title;
- (id)triageAction;
- (void)_performInteractionIfPermittedWithContinuation:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setShowMenuWithOptions:(BOOL)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFCategorizationTriageInteraction

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017D288;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006999F8 != -1) {
    dispatch_once(&qword_1006999F8, block);
  }
  v2 = (void *)qword_1006999F0;

  return (OS_os_log *)v2;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 sender:(id)a4 groupedSenderDisplayName:(id)a5 origin:(int64_t)a6 actor:(int64_t)a7 bucket:(int64_t)a8 avatarGenerator:(id)a9 isAuthenticated:(BOOL)a10 changeOptions:(unint64_t)a11 showMenuWithOptions:(BOOL)a12
{
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___MFCategorizationTriageInteraction;
  v21 = [super interactionWithMessageListItemSelection:a3 undoManager:0 origin:a6 actor:a7];
  [v21 setBucket:a8];
  [v21 setSender:v18];
  [v21 setAvatarGenerator:v20];
  [v21 setChangeOptions:a11];
  [v21 setShowMenuWithOptions:a12];
  [v21 setDisplayName:v19];
  [v21 setIsAuthenticated:a10];

  return v21;
}

- (id)title
{
  v2 = [(MFTriageInteraction *)self messageListItemSelection];
  v3 = [v2 messageListItems];
  v4 = [v3 firstObject];
  v5 = [v4 senderList];
  v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = v6;
    v8 = [v7 emailAddressValue];
    v9 = [v8 em_displayableString];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v12 = [v8 simpleAddress];
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        v14 = [v7 stringValue];
      }
      v11 = v14;
    }
  }
  else
  {
    v11 = &stru_100619928;
  }
  if ([(__CFString *)v11 length])
  {
    v15 = _EFLocalizedStringFromTable();
    v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v11);
  }
  else
  {
    v16 = _EFLocalizedStringFromTable();
  }

  return v16;
}

- (BOOL)_requiresConfirmationPrompt
{
  return 1;
}

- (void)_performInteractionIfPermittedWithContinuation:(id)a3
{
  id v28 = a3;
  v5 = [(MFTriageInteraction *)self delegate];
  v6 = [v5 presentingViewControllerForTriageInteraction:self];

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10017DB68;
  v44[3] = &unk_10060AD80;
  v44[4] = self;
  id v7 = v28;
  id v46 = v7;
  id v8 = v6;
  id v45 = v8;
  v35 = objc_retainBlock(v44);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10017DBC4;
  v41[3] = &unk_10060ADA8;
  id v30 = v7;
  id v43 = v30;
  id v33 = v8;
  id v42 = v33;
  v34 = objc_retainBlock(v41);
  v9 = [(MFTriageInteraction *)self messageListItemSelection];
  v10 = [v9 messageListItems];
  SEL v29 = a2;
  v36 = [v10 firstObject];

  v11 = [MFCategorizationConfirmationViewController alloc];
  v32 = [(MFCategoryTriageInteraction *)self sender];
  v31 = [v36 category];
  v12 = [(MFCategorizationTriageInteraction *)self displayName];
  v13 = [v36 businessLogoID];
  int64_t v14 = [(MFCategoryTriageInteraction *)self bucket];
  v15 = +[UIApplication sharedApplication];
  v16 = [v15 avatarGenerator];
  unsigned __int8 v17 = [(MFCategorizationTriageInteraction *)self isAuthenticated];
  id v18 = +[UIApplication sharedApplication];
  id v19 = [v18 contactStore];
  LOBYTE(v27) = v17;
  id v20 = [(MFCategorizationConfirmationViewController *)v11 initWithSender:v32 category:v31 displayName:v12 businessLogoID:v13 bucket:v14 avatarGenerator:v16 isAuthenticated:v27 contactStore:v19 continueActionHandler:v35 cancelActionHandler:v34];

  v21 = v33;
  if (!v33)
  {
    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:v29 object:self file:@"MFCategoryTriageInteraction-BlackPearlUI.m" lineNumber:227 description:@"Presenting a triage interaction confirmation prompt requires a presentationSource."];

    v21 = 0;
  }
  v22 = [v21 sheetPresentationController];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10017DC14;
  v37[3] = &unk_1006061C8;
  v37[4] = self;
  objc_super v23 = v20;
  v38 = v23;
  id v24 = v21;
  id v39 = v24;
  id v25 = v22;
  id v40 = v25;
  [v25 animateChanges:v37];
  [v24 showViewController:v23 sender:0];
}

- (id)previewTitle
{
  if ((unint64_t)[(MFCategoryTriageInteraction *)self bucket] > 4)
  {
    v2 = 0;
  }
  else
  {
    v2 = _EFLocalizedString();
  }

  return v2;
}

- (id)shortTitle
{
  [(MFCategoryTriageInteraction *)self bucket];

  return (id)MUILocalizedStringFromBucket();
}

- (id)color
{
  unint64_t v2 = [(MFCategoryTriageInteraction *)self bucket];
  if (v2 <= 5)
  {
    if (((1 << v2) & 0x1C) != 0) {
      +[UIColor systemYellowColor];
    }
    else {
    unint64_t v2 = +[UIColor mailDarkGrayColor];
    }
  }

  return (id)v2;
}

- (id)_iconImageName
{
  [(MFCategoryTriageInteraction *)self bucket];

  return (id)MUIImageNameForBucket();
}

- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFCategorizationTriageInteraction *)self shortTitle];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017E090;
  v14[3] = &unk_10060ADF8;
  v14[4] = self;
  v9 = +[UIContextualAction contextualActionWithStyle:0 title:v8 handler:v14];

  v10 = [(MFCategorizationTriageInteraction *)self color];
  [v9 setBackgroundColor:v10];

  v11 = [(MFTriageInteraction *)self swipeActionIcon];
  [v9 setImage:v11];

  v12 = [(MFCategorizationTriageInteraction *)self _menuWithPreparation:v6 completion:v7];
  [v9 _setMenu:v12];

  return v9;
}

- (id)_menuWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v9 = _EFLocalizedStringFromTable();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10017E448;
  v27[3] = &unk_10060AE20;
  id v10 = v6;
  id v28 = v10;
  id v11 = v7;
  id v29 = v11;
  v27[4] = self;
  v12 = +[UIAction actionWithTitle:v9 image:0 identifier:0 handler:v27];
  [v8 addObject:v12];

  v13 = _EFLocalizedStringFromTable();
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_10017E488;
  objc_super v23 = &unk_10060AE48;
  id v24 = self;
  id v14 = v10;
  id v25 = v14;
  id v15 = v11;
  id v26 = v15;
  v16 = +[UIAction actionWithTitle:v13 image:0 identifier:0 handler:&v20];
  [v8 addObject:v16, v20, v21, v22, v23, v24];

  if ((char *)[(MFCategoryTriageInteraction *)self bucket] - 2 >= (char *)3)
  {
    unsigned __int8 v17 = 0;
  }
  else
  {
    unsigned __int8 v17 = _EFLocalizedStringFromTable();
  }
  id v18 = +[UIMenu menuWithTitle:v17 image:0 identifier:0 options:0 children:v8];

  return v18;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4 = a3;
  [(MFCategoryTriageInteraction *)self bucket];
  v5 = MUILocalizedStringFromBucket();
  [(MFCategoryTriageInteraction *)self bucket];
  id v6 = MUISelectedImageNameForBucket();
  unsigned __int8 v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_10017E730;
  id v20 = &unk_10060ABB8;
  uint64_t v21 = self;
  id v7 = v4;
  id v22 = v7;
  id v8 = +[MFRecategorizationCardAction cardActionWithTitle:v5 shortTitle:0 imageName:v6 tintColor:0 handler:&v17];

  int64_t v9 = [(MFCategoryTriageInteraction *)self bucket];
  id v10 = [(MFTriageInteraction *)self messageListItemSelection];
  id v11 = [v10 messageListItems];
  v12 = [v11 firstObject];
  v13 = [v12 category];

  if ([v13 state] == (id)3)
  {
    [v13 type];
    uint64_t v14 = MUIBucketFromEMCategoryType();
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v9 == v14) {
    [v8 setIsSelected:1];
  }
  [v8 setCategoryType:v9];
  id v15 = MUIPlatformColorForBucket();
  [v8 setTintColor:v15];

  return v8;
}

- (BOOL)isRecategorizationAction
{
  return 1;
}

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSCategoryTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    int64_t v6 = [(MFTriageInteraction *)self origin];
    int64_t v7 = [(MFTriageInteraction *)self actor];
    [(MFCategoryTriageInteraction *)self bucket];
    id v8 = [v4 initWithMessageListSelection:v5 origin:v6 actor:v7 delegate:0 categoryType:EMCategoryTypeForBucket() changeOptions:[self changeOptions]];
    int64_t v9 = self->_triageAction;
    self->_triageAction = v8;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (void)setTriageAction:(id)a3
{
}

- (BOOL)showMenuWithOptions
{
  return self->_showMenuWithOptions;
}

- (void)setShowMenuWithOptions:(BOOL)a3
{
  self->_showMenuWithOptions = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end