@interface MailSplitViewController
+ (NSArray)menuCommands;
+ (id)conversationViewArrowCommands;
+ (id)log;
- (BOOL)_conversationViewControllerHasReferenceMessage;
- (BOOL)conversationViewControllerCanPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)hasFinishedInitialLayout;
- (BOOL)isCollapsed;
- (BOOL)isTransitioningSize;
- (BOOL)messageListCanPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)messageListHasFocus;
- (ConversationViewController)conversationViewController;
- (MailDetailNavigationController)messageDetailNavController;
- (MailNavigationController)mailboxPickerNavController;
- (MailNavigationController)messageListNavController;
- (MailSplitViewController)initWithMailboxPickerNavigationController:(id)a3 messageListNavigationController:(id)a4 mailDetailNavigationController:(id)a5 scene:(id)a6;
- (MailboxPickerOutlineController)mailboxPickerController;
- (MailboxSelectionCapable)scene;
- (MessageListContainerViewController)messageListContainerViewController;
- (NSNumber)previouslyFocusedColumn;
- (UIBarButtonItem)supplementaryButtonItem;
- (id)keyCommands;
- (id)mf_preferredTitle;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)_dismissVisiblePopoverInSplitViewController;
- (void)_notifyViewStateChanged:(int64_t)a3;
- (void)_showMessageListViewController;
- (void)restorePrimaryNavigationState:(int64_t)a3;
- (void)setFocusedViewController:(id)a3;
- (void)setMailboxPickerController:(id)a3;
- (void)setMailboxPickerNavController:(id)a3;
- (void)setMessageListHasFocus:(BOOL)a3;
- (void)setPreviouslyFocusedColumn:(id)a3;
- (void)setScene:(id)a3;
- (void)setSupplementaryButtonItem:(id)a3;
- (void)setTransitioningSize:(BOOL)a3;
- (void)showConversationViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)showMailboxPickerController:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)showMessageListViewController:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)splitViewControllerDidCollapse:(id)a3;
- (void)splitViewControllerDidExpand:(id)a3;
- (void)splitViewControllerInteractivePresentationGestureDidEnd:(id)a3;
- (void)splitViewControllerInteractivePresentationGestureWillBegin:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MailSplitViewController

- (void)splitViewControllerDidCollapse:(id)a3
{
  id v4 = a3;
  self->_hasFinishedInitialLayout = 1;
  id v5 = v4;
  -[MailSplitViewController _notifyViewStateChanged:](self, "_notifyViewStateChanged:", [v4 displayMode]);
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MailSplitViewController;
  [(MailSplitViewController *)&v5 traitCollectionDidChange:a3];
  transitionalTraitCollection = self->_transitionalTraitCollection;
  self->_transitionalTraitCollection = 0;
}

- (MailboxPickerOutlineController)mailboxPickerController
{
  v2 = [(MailSplitViewController *)self mailboxPickerNavController];
  v3 = [v2 viewControllers];
  id v4 = [v3 objectAtIndexedSubscript:0];

  return (MailboxPickerOutlineController *)v4;
}

- (void)showMessageListViewController:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = +[MailSplitViewController log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    __int16 v11 = 1024;
    BOOL v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "showMessageListViewController: %{BOOL}d, animated: %{BOOL}d", (uint8_t *)v10, 0xEu);
  }

  [(MailSplitViewController *)self mf_setColumn:1 visible:v6 animated:v5 completion:v8];
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1) {
    [(MailSplitViewController *)self _dismissVisiblePopoverInSplitViewController];
  }
  [(MailSplitViewController *)self _notifyViewStateChanged:a4];
}

+ (NSArray)menuCommands
{
  v2 = (void *)qword_100699750;
  if (!qword_100699750)
  {
    v3 = sub_10002C68C();
    id v4 = sub_10002BDA4();
    uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];
    id v6 = (void *)qword_100699750;
    qword_100699750 = v5;

    v2 = (void *)qword_100699750;
  }

  return (NSArray *)v2;
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6 = [(MailSplitViewController *)self previouslyFocusedColumn];

  if (v6)
  {
    v7 = [(MailSplitViewController *)self previouslyFocusedColumn];
    a4 = (int64_t)[v7 integerValue];

    [(MailSplitViewController *)self setPreviouslyFocusedColumn:0];
  }
  else if ([(MailSplitViewController *)self _conversationViewControllerHasReferenceMessage]&& ![(MailSplitViewController *)self messageListHasFocus])
  {
    id v8 = [(MailSplitViewController *)self viewControllerForColumn:0];
    unsigned int v9 = [v8 isEditing];

    if (v9) {
      a4 = 0;
    }
  }
  else
  {
    a4 = 1;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100057790;
  v12[3] = &unk_1006047A0;
  v12[4] = self;
  +[UIView performWithoutAnimation:v12];
  v10 = [(MailSplitViewController *)self mailboxPickerController];
  [v10 updateForSplitViewCollapseStateChanged:1];

  return a4;
}

- (NSNumber)previouslyFocusedColumn
{
  return self->_previouslyFocusedColumn;
}

- (MailSplitViewController)initWithMailboxPickerNavigationController:(id)a3 messageListNavigationController:(id)a4 mailDetailNavigationController:(id)a5 scene:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MailSplitViewController;
  v15 = [(MailSplitViewController *)&v26 initWithStyle:2];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageListNavController, a4);
    objc_storeStrong((id *)&v16->_messageDetailNavController, a5);
    objc_storeStrong((id *)&v16->_mailboxPickerNavController, a3);
    uint64_t v17 = [v11 topViewController];
    mailboxPickerController = v16->_mailboxPickerController;
    v16->_mailboxPickerController = (MailboxPickerOutlineController *)v17;

    objc_storeWeak((id *)&v16->_scene, v14);
    [(MailSplitViewController *)v16 setDelegate:v16];
    v19 = +[UIColor mailSplitViewBackgroundColor];
    v20 = [(MailSplitViewController *)v16 view];
    [v20 setBackgroundColor:v19];

    v21 = [(MailSplitViewController *)v16 view];
    [v21 setOpaque:0];

    [(MailSplitViewController *)v16 _setPrefersOverlayInRegularWidthPhone:1];
    [(MailSplitViewController *)v16 setViewController:v11 forColumn:0];
    [(MailSplitViewController *)v16 setViewController:v12 forColumn:1];
    [(MailSplitViewController *)v16 setViewController:v13 forColumn:2];
    v22 = objc_opt_new();
    v23 = +[UIColor mailSplitViewBorderColor];
    [v22 setBorderColor:v23];

    [(MailSplitViewController *)v16 setConfiguration:v22];
    v16->_messageListHasFocus = 1;
    previouslyFocusedColumn = v16->_previouslyFocusedColumn;
    v16->_previouslyFocusedColumn = (NSNumber *)&off_10062A980;
  }
  return v16;
}

- (void)_notifyViewStateChanged:(int64_t)a3
{
  id v9 = (id)objc_opt_new();
  uint64_t v5 = +[NSNumber numberWithInteger:a3];
  [v9 setObject:v5 forKeyedSubscript:@"MailSplitViewControllerNewDisplayModeKey"];

  id v6 = +[NSNumber numberWithBool:[(MailSplitViewController *)self isCollapsed]];
  [v9 setObject:v6 forKeyedSubscript:@"MailSplitViewControllerIsCollapsedKey"];

  transitionalTraitCollection = self->_transitionalTraitCollection;
  if (transitionalTraitCollection) {
    [v9 setObject:transitionalTraitCollection forKeyedSubscript:@"MailSplitViewControllerNewTraitCollectionKey"];
  }
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"MailSplitViewControllerViewStateChangedNotification" object:self userInfo:v9];
}

- (MailDetailNavigationController)messageDetailNavController
{
  return self->_messageDetailNavController;
}

+ (id)conversationViewArrowCommands
{
  v2 = (void *)qword_100699740;
  if (!qword_100699740)
  {
    v3 = sub_10002C588(0, (uint64_t)UIKeyInputUpArrow, 0, (uint64_t)"_selectNextMessageCommandInvoked:", 0, 0, 0);
    v10[0] = v3;
    id v4 = sub_10002C588((uint64_t)v3, (uint64_t)UIKeyInputUpArrow, 0x100000, (uint64_t)"_selectNextMessageCommandInvoked:", 0, 0, (uint64_t)&off_10062B710);
    v10[1] = v4;
    uint64_t v5 = sub_10002C588((uint64_t)v4, (uint64_t)UIKeyInputDownArrow, 0, (uint64_t)"_selectPreviousMessageCommandInvoked:", 0, 0, 0);
    _DWORD v10[2] = v5;
    id v6 = sub_10002C588((uint64_t)v5, (uint64_t)UIKeyInputDownArrow, 0x100000, (uint64_t)"_selectPreviousMessageCommandInvoked:", 0, 0, (uint64_t)&off_10062B738);
    v10[3] = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:v10 count:4];
    id v8 = (void *)qword_100699740;
    qword_100699740 = v7;

    v2 = (void *)qword_100699740;
  }

  return v2;
}

- (id)mf_preferredTitle
{
  v2 = [(MailSplitViewController *)self messageListContainerViewController];
  v3 = [v2 mf_preferredTitle];

  return v3;
}

- (MessageListContainerViewController)messageListContainerViewController
{
  v2 = [(MailSplitViewController *)self messageListNavController];
  v3 = [v2 viewControllers];
  id v4 = [v3 objectAtIndexedSubscript:0];

  return (MessageListContainerViewController *)v4;
}

- (MailNavigationController)messageListNavController
{
  return self->_messageListNavController;
}

- (BOOL)isCollapsed
{
  return [(MailSplitViewController *)self _isCollapsed];
}

- (void)setPreviouslyFocusedColumn:(id)a3
{
}

- (MailNavigationController)mailboxPickerNavController
{
  return self->_mailboxPickerNavController;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A780;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699730 != -1) {
    dispatch_once(&qword_100699730, block);
  }
  v2 = (void *)qword_100699728;

  return v2;
}

- (void)setFocusedViewController:(id)a3
{
  id v5 = a3;
  id v4 = [(MailNavigationController *)self->_messageListNavController viewControllers];
  -[MailSplitViewController setMessageListHasFocus:](self, "setMessageListHasFocus:", [v4 containsObject:v5]);
}

- (void)setMessageListHasFocus:(BOOL)a3
{
  if (self->_messageListHasFocus != a3)
  {
    BOOL v3 = a3;
    self->_messageListHasFocus = a3;
    id v4 = +[MailSplitViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"conversation view";
      if (v3) {
        CFStringRef v5 = @"message list";
      }
      int v6 = 138543362;
      CFStringRef v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Changed split view focus to %{public}@.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)showMailboxPickerController:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = +[MailSplitViewController log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    __int16 v11 = 1024;
    BOOL v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "showMailboxPickerController: %{BOOL}d, animated: %{BOOL}d", (uint8_t *)v10, 0xEu);
  }

  [(MailSplitViewController *)self mf_setColumn:0 visible:v6 animated:v5 completion:v8];
}

- (void)showConversationViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = +[MailSplitViewController log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "showConversationViewController animated: %{BOOL}d", buf, 8u);
  }

  id v8 = [(MailSplitViewController *)self scene];
  if ([v8 isInExpandedEnvironment] | !v4)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(MailDetailNavigationController *)self->_messageDetailNavController conversationViewController];
  }

  if (_os_feature_enabled_impl())
  {
    int v10 = EMIsGreymatterAvailableWithOverride();
    if (!v9) {
      goto LABEL_22;
    }
  }
  else
  {
    int v10 = 0;
    if (!v9) {
      goto LABEL_22;
    }
  }
  if (![v9 conversationSortOrder] || v10)
  {
    __int16 v11 = [(MailSplitViewController *)self conversationViewController];
    unsigned int v12 = [v11 isShowingGroupedSenderMessageList];

    if ((v12 | v10))
    {
      if (v12) {
        goto LABEL_22;
      }
    }
    else
    {
      id v13 = [v9 messageCountHint];
      id v14 = [v13 resultWithTimeout:0 error:0.0299999993];

      if (v14)
      {
        BOOL v15 = (uint64_t)[v14 integerValue] > 1;

        if (!v15) {
          goto LABEL_22;
        }
      }
      else
      {
        v16 = +[MailSplitViewController log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10045B278(v16);
        }
      }
    }
    uint64_t v17 = objc_opt_new();
    v18 = [v9 navigationItem];
    [v18 setScrollEdgeAppearance:v17];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001237D0;
    v19[3] = &unk_100608CD0;
    char v22 = v10;
    id v20 = v9;
    id v21 = v6;
    id v6 = objc_retainBlock(v19);
  }
LABEL_22:
  [(MailSplitViewController *)self mf_setColumn:2 visible:1 animated:v4 completion:v6];
}

- (ConversationViewController)conversationViewController
{
  v2 = [(MailSplitViewController *)self messageDetailNavController];
  BOOL v3 = [v2 viewControllers];
  BOOL v4 = [v3 objectAtIndexedSubscript:0];

  return (ConversationViewController *)v4;
}

- (void)_dismissVisiblePopoverInSplitViewController
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MailSplitViewController *)self splitViewController];
  BOOL v3 = [v2 viewControllers];

  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) mf_dismissPresentedViewControllerInPopover];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)_conversationViewControllerHasReferenceMessage
{
  v2 = [(MailDetailNavigationController *)self->_messageDetailNavController conversationViewController];
  BOOL v3 = [v2 referenceMessageListItem];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(MailSplitViewController *)self setTransitioningSize:1];
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_100123CF4;
  v10[3] = &unk_100606048;
  void v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100123F9C;
  v9[3] = &unk_100606048;
  [v7 animateAlongsideTransition:v10 completion:v9];
  v8.receiver = self;
  v8.super_class = (Class)MailSplitViewController;
  -[MailSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = (UITraitCollection *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MailSplitViewController;
  [(MailSplitViewController *)&v8 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  transitionalTraitCollection = self->_transitionalTraitCollection;
  self->_transitionalTraitCollection = v6;
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  unsigned __int8 v6 = [(MailSplitViewController *)self isTransitioningSize];
  if (a4 == 1 && (v6 & 1) == 0)
  {
    id v7 = [(MailSplitViewController *)self messageListContainerViewController];
    [v7 updateForSplitViewControllerHidingMessageList];
  }
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001241D8;
  v6[3] = &unk_1006047A0;
  v6[4] = self;
  +[UIView performWithoutAnimation:v6];
  return a4;
}

- (void)splitViewControllerDidExpand:(id)a3
{
  id v4 = a3;
  self->_hasFinishedInitialLayout = 1;
  id v5 = v4;
  -[MailSplitViewController _notifyViewStateChanged:](self, "_notifyViewStateChanged:", [v4 displayMode]);
}

- (void)splitViewControllerInteractivePresentationGestureWillBegin:(id)a3
{
  id v3 = [(MailDetailNavigationController *)self->_messageDetailNavController conversationViewController];
  if (v3) {
    [v3 beginInteractiveResizing];
  }
}

- (void)splitViewControllerInteractivePresentationGestureDidEnd:(id)a3
{
  id v3 = [(MailDetailNavigationController *)self->_messageDetailNavController conversationViewController];
  if (v3) {
    [v3 endResizing];
  }
}

- (UIBarButtonItem)supplementaryButtonItem
{
  if (!self->_supplementaryButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithTitle:0 style:0 target:self action:"_showMessageListViewController"];
    [(UIBarButtonItem *)v4 _setShowsBackButtonIndicator:1];
    supplementaryButtonItem = self->_supplementaryButtonItem;
    self->_supplementaryButtonItem = v4;
  }
  unsigned __int8 v6 = [(MailSplitViewController *)self messageListContainerViewController];
  id v7 = [v6 navigationItem];
  objc_super v8 = [v7 title];
  long long v9 = v8;
  if (!v8)
  {
    v2 = +[NSBundle mainBundle];
    long long v9 = [v2 localizedStringForKey:@"BACK" value:&stru_100619928 table:@"Main"];
  }
  [(UIBarButtonItem *)self->_supplementaryButtonItem setTitle:v9];
  if (!v8)
  {
  }
  long long v10 = self->_supplementaryButtonItem;

  return v10;
}

- (void)_showMessageListViewController
{
}

- (void)restorePrimaryNavigationState:(int64_t)a3
{
  if (a3 == 2)
  {
    previouslyFocusedColumn = self->_previouslyFocusedColumn;
    id v5 = (NSNumber *)&off_10062A9B0;
  }
  else
  {
    previouslyFocusedColumn = self->_previouslyFocusedColumn;
    if (a3) {
      id v5 = (NSNumber *)&off_10062A980;
    }
    else {
      id v5 = (NSNumber *)&off_10062A998;
    }
  }
  self->_previouslyFocusedColumn = v5;

  self->_messageListHasFocus = (id)[(NSNumber *)self->_previouslyFocusedColumn integerValue] == (id)1;
}

- (id)keyCommands
{
  if ([(MailSplitViewController *)self displayMode] == (id)1
    || [(MailSplitViewController *)self isCollapsed])
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v4 = [(MailSplitViewController *)self scene];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  id v5 = +[MailSplitViewController conversationViewArrowCommands];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100124718;
  v8[3] = &unk_100608CF0;
  char v9 = isKindOfClass & 1;
  unsigned __int8 v6 = [v5 ef_map:v8];

  return v6;
}

- (BOOL)messageListCanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (sub_100124A28(self, (char *)a3, v7))
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      char v9 = [(MailSplitViewController *)self messageListContainerViewController];
      unsigned int v10 = [v9 canHandleAction:a3 withMailMenuCommand:v7];

      BOOL v11 = "_favoriteMailboxShortcutInvoked:" == a3;
      if ("_favoriteMailboxShortcutInvoked:" == a3) {
        LOBYTE(v8) = 0;
      }
      else {
        LOBYTE(v8) = v10;
      }
      if (v11 && ((v10 ^ 1) & 1) == 0)
      {
        unsigned int v12 = [(MailSplitViewController *)self mailboxPickerController];
        unsigned int v8 = [v12 isEditing] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)conversationViewControllerCanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    unsigned int v8 = [(MailDetailNavigationController *)self->_messageDetailNavController conversationViewController];
    if (sub_100124A28(self, (char *)a3, v7) == 1) {
      unsigned __int8 v9 = [v8 canHandleAction:a3 withMailMenuCommand:v7];
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v7 = a4;
  uint64_t v8 = sub_100124A28(self, (char *)a3, v7);
  switch(v8)
  {
    case 0:
      unsigned __int8 v9 = [(MailSplitViewController *)self messageListContainerViewController];
      uint64_t v10 = [v9 messageListViewController];
LABEL_7:
      id v4 = (void *)v10;

      break;
    case 1:
      unsigned __int8 v9 = [(MailSplitViewController *)self messageListContainerViewController];
      uint64_t v10 = [v9 conversationViewController];
      goto LABEL_7;
    case 2:
      v12.receiver = self;
      v12.super_class = (Class)MailSplitViewController;
      id v4 = [(MailSplitViewController *)&v12 targetForAction:a3 withSender:v7];
      break;
  }

  return v4;
}

- (void)setMailboxPickerNavController:(id)a3
{
}

- (void)setMailboxPickerController:(id)a3
{
}

- (void)setSupplementaryButtonItem:(id)a3
{
}

- (BOOL)messageListHasFocus
{
  return self->_messageListHasFocus;
}

- (BOOL)hasFinishedInitialLayout
{
  return self->_hasFinishedInitialLayout;
}

- (MailboxSelectionCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailboxSelectionCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (BOOL)isTransitioningSize
{
  return self->_transitioningSize;
}

- (void)setTransitioningSize:(BOOL)a3
{
  self->_transitioningSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyFocusedColumn, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_supplementaryButtonItem, 0);
  objc_storeStrong((id *)&self->_mailboxPickerController, 0);
  objc_storeStrong((id *)&self->_mailboxPickerNavController, 0);
  objc_storeStrong((id *)&self->_messageDetailNavController, 0);
  objc_storeStrong((id *)&self->_messageListNavController, 0);

  objc_storeStrong((id *)&self->_transitionalTraitCollection, 0);
}

@end