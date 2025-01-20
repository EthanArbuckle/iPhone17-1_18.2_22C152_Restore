@interface ICKeyboardHandler
+ (UIMenu)editKeyboardShortcutMenu;
+ (UIMenu)fileKeyboardShortcutMenu;
+ (UIMenu)goKeyboardShortcutMenu;
+ (UIMenu)viewKeyboardShortcutMenu;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)firstResponderInhibitsGlobalKeyCommands;
- (BOOL)globalKeyCommandsInhibited;
- (BOOL)isInHardwareKeyboardMode;
- (BOOL)mostRecentInhibitingGlobalKeyCommandResponderResult;
- (ICKeyboardHandler)initWithDelegate:(id)a3;
- (ICKeyboardHandlerDelegate)delegate;
- (UIResponder)mostRecentInhibitingGlobalKeyCommandResponder;
- (UIResponder)parentResponder;
- (id)nextResponder;
- (void)addFolder:(id)a3;
- (void)addNote:(id)a3;
- (void)cmd1:(id)a3;
- (void)cmd2:(id)a3;
- (void)cmd3:(id)a3;
- (void)collapseAllSections:(id)a3;
- (void)collapseSection:(id)a3;
- (void)expandAllSections:(id)a3;
- (void)expandSection:(id)a3;
- (void)gotoNextNote:(id)a3;
- (void)gotoPreviousNote:(id)a3;
- (void)handleAddLinkKey:(id)a3;
- (void)handleCmdReturnKey:(id)a3;
- (void)handleDeleteKey:(id)a3;
- (void)handleDeleteSystemPaperNote:(id)a3;
- (void)handleEnclosingFolderKey:(id)a3;
- (void)handleReturnKey:(id)a3;
- (void)keyboardDidChangeFrame:(id)a3;
- (void)performFindInNote:(id)a3;
- (void)printNote:(id)a3;
- (void)replaceInNote:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInHardwareKeyboardMode:(BOOL)a3;
- (void)setMostRecentInhibitingGlobalKeyCommandResponder:(id)a3;
- (void)setMostRecentInhibitingGlobalKeyCommandResponderResult:(BOOL)a3;
- (void)setParentResponder:(id)a3;
- (void)systemPaperNavigateLeft:(id)a3;
- (void)systemPaperNavigateRight:(id)a3;
- (void)systemPaperShowInNotes:(id)a3;
- (void)toggleEditorCallouts:(id)a3;
- (void)toggleNoteActivity:(id)a3;
- (void)toggleSearch:(id)a3;
- (void)updateHardwareKeyboardAvailability;
- (void)validateCommand:(id)a3;
@end

@implementation ICKeyboardHandler

- (ICKeyboardHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICKeyboardHandler;
  v5 = [(ICKeyboardHandler *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"keyboardDidChangeFrame:" name:UIKeyboardDidChangeFrameNotification object:0];

    [(ICKeyboardHandler *)v6 updateHardwareKeyboardAvailability];
  }

  return v6;
}

- (id)nextResponder
{
  v3 = [(ICKeyboardHandler *)self parentResponder];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICKeyboardHandler;
    id v5 = [(ICKeyboardHandler *)&v8 nextResponder];
  }
  v6 = v5;

  return v6;
}

- (UIResponder)parentResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentResponder);

  return (UIResponder *)WeakRetained;
}

- (void)setParentResponder:(id)a3
{
}

- (void)updateHardwareKeyboardAvailability
{
  BOOL v3 = GSEventIsHardwareKeyboardAttached() != 0;

  [(ICKeyboardHandler *)self setInHardwareKeyboardMode:v3];
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  if (self->_inHardwareKeyboardMode != a3)
  {
    self->_inHardwareKeyboardMode = a3;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"ICHardwareKeyboardModeDidChange" object:0];
  }
}

+ (UIMenu)fileKeyboardShortcutMenu
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"New Note" value:&stru_10063F3D8 table:0];
  id v4 = +[UIKeyCommand ic_keyCommandWithInput:@"n" modifierFlags:0x100000 action:"addNote:" discoverabilityTitle:v3];

  id v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"New Folder" value:&stru_10063F3D8 table:0];
  v7 = +[UIKeyCommand ic_keyCommandWithInput:@"n" modifierFlags:1179648 action:"addFolder:" discoverabilityTitle:v6];

  objc_super v8 = +[NSBundle mainBundle];
  objc_super v9 = [v8 localizedStringForKey:@"Print" value:&stru_10063F3D8 table:0];
  v10 = +[UIKeyCommand ic_keyCommandWithInput:@"p" modifierFlags:0x100000 action:"printNote:" discoverabilityTitle:v9];

  v14[0] = v4;
  v14[1] = v7;
  v14[2] = v10;
  v11 = +[NSArray arrayWithObjects:v14 count:3];
  v12 = +[UIMenu menuWithTitle:&stru_10063F3D8 image:0 identifier:0 options:1 children:v11];

  return (UIMenu *)v12;
}

+ (UIMenu)editKeyboardShortcutMenu
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Note List Search"];
  v28 = +[UIKeyCommand ic_keyCommandWithInput:@"f" modifierFlags:1572864 action:"toggleSearch:" discoverabilityTitle:v3];

  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Find and Replace" value:&stru_10063F3D8 table:0];
  v25 = +[UIKeyCommand ic_keyCommandWithInput:@"f" modifierFlags:1179648 action:"replaceInNote:" discoverabilityTitle:v5];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Delete" value:&stru_10063F3D8 table:0];
  v27 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputDelete modifierFlags:0 action:"handleDeleteKey:" discoverabilityTitle:v7];

  objc_super v8 = +[NSBundle mainBundle];
  objc_super v9 = [v8 localizedStringForKey:@"Delete Quick Note" value:&stru_10063F3D8 table:0];
  v26 = +[UIKeyCommand ic_keyCommandWithInput:@"\b" modifierFlags:0x100000 action:"handleDeleteSystemPaperNote:" discoverabilityTitle:v9];

  [v26 setWantsPriorityOverSystemBehavior:1];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Edit Note" value:&stru_10063F3D8 table:0];
  v12 = +[UIKeyCommand ic_keyCommandWithInput:@"\r" modifierFlags:0 action:"handleReturnKey:" discoverabilityTitle:v11];

  [v12 setWantsPriorityOverSystemBehavior:1];
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"End Editing" value:&stru_10063F3D8 table:0];
  uint64_t v15 = +[UIKeyCommand ic_keyCommandWithInput:@"\r" modifierFlags:0x100000 action:"handleCmdReturnKey:" discoverabilityTitle:v14];

  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"Add Link" value:&stru_10063F3D8 table:0];
  v18 = +[UIKeyCommand ic_keyCommandWithInput:@"k" modifierFlags:0x100000 action:"handleAddLinkKey:" discoverabilityTitle:v17];

  [v18 setWantsPriorityOverSystemBehavior:1];
  v29[0] = v25;
  v29[1] = v28;
  v29[2] = v27;
  v29[3] = v26;
  v29[4] = v12;
  v29[5] = v15;
  v19 = (void *)v15;
  v29[6] = v18;
  v20 = +[NSArray arrayWithObjects:v29 count:7];
  v21 = +[NSMutableArray arrayWithArray:v20];

  id v22 = [v21 copy];
  v23 = +[UIMenu menuWithTitle:&stru_10063F3D8 image:0 identifier:0 options:1 children:v22];

  return (UIMenu *)v23;
}

+ (UIMenu)viewKeyboardShortcutMenu
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"View Notes as List" value:&stru_10063F3D8 table:0];
  v47 = +[UIKeyCommand ic_keyCommandWithInput:@"1" modifierFlags:0x100000 action:"cmd1:" discoverabilityTitle:v3];

  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"View Notes as Gallery" value:&stru_10063F3D8 table:0];
  v46 = +[UIKeyCommand ic_keyCommandWithInput:@"2" modifierFlags:0x100000 action:"cmd2:" discoverabilityTitle:v5];

  v45 = +[UIKeyCommand keyCommandWithInput:@"3" modifierFlags:0x100000 action:"cmd3:"];
  v44 = +[UIKeyCommand keyCommandWithInput:@"i" modifierFlags:1310720 action:"toggleEditorCallouts:"];
  uint64_t v6 = +[UIKeyCommand keyCommandWithInput:@"k" modifierFlags:1310720 action:"toggleNoteActivity:"];
  v7 = +[NSBundle mainBundle];
  objc_super v8 = [v7 localizedStringForKey:@"Navigate Left" value:&stru_10063F3D8 table:0];
  objc_super v9 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:0x100000 action:"systemPaperNavigateLeft:" discoverabilityTitle:v8];

  [v9 setWantsPriorityOverSystemBehavior:1];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Navigate Right" value:&stru_10063F3D8 table:0];
  v12 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputRightArrow modifierFlags:0x100000 action:"systemPaperNavigateRight:" discoverabilityTitle:v11];

  [v12 setWantsPriorityOverSystemBehavior:1];
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Show In Notes" value:&stru_10063F3D8 table:0];
  uint64_t v15 = +[UIKeyCommand ic_keyCommandWithInput:@"r" modifierFlags:0x100000 action:"systemPaperShowInNotes:" discoverabilityTitle:v14];

  v50[0] = v47;
  v50[1] = v46;
  v50[2] = v45;
  v50[3] = v44;
  v42 = v9;
  v43 = (void *)v6;
  v50[4] = v6;
  v50[5] = v9;
  v40 = (void *)v15;
  v41 = v12;
  v50[6] = v12;
  v50[7] = v15;
  v16 = +[NSArray arrayWithObjects:v50 count:8];
  id v17 = [v16 mutableCopy];

  if (ICInternalSettingsIsCollapsibleSectionsEnabled())
  {
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"Expand Section" value:&stru_10063F3D8 table:0];
    v39 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputRightArrow modifierFlags:1572864 action:"expandSection:" discoverabilityTitle:v19];

    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"Expand All Sections" value:&stru_10063F3D8 table:0];
    id v22 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputRightArrow modifierFlags:1703936 action:"expandAllSections:" discoverabilityTitle:v21];

    v23 = +[NSBundle mainBundle];
    v24 = [v23 localizedStringForKey:@"Collapse Section" value:&stru_10063F3D8 table:0];
    v25 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:1572864 action:"collapseSection:" discoverabilityTitle:v24];

    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"Collapse All Sections" value:&stru_10063F3D8 table:0];
    v28 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:1703936 action:"collapseAllSections:" discoverabilityTitle:v27];

    v49[0] = v39;
    v49[1] = v22;
    v49[2] = v25;
    v49[3] = v28;
    v29 = +[NSArray arrayWithObjects:v49 count:4];
    [v17 addObjectsFromArray:v29];
  }
  v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"Previous Note" value:&stru_10063F3D8 table:0];
  v32 = +[UIKeyCommand ic_keyCommandWithInput:@"[" modifierFlags:1572864 action:"gotoPreviousNote:" discoverabilityTitle:v31];

  v33 = +[NSBundle mainBundle];
  v34 = [v33 localizedStringForKey:@"Next Note" value:&stru_10063F3D8 table:0];
  v35 = +[UIKeyCommand ic_keyCommandWithInput:@"]" modifierFlags:1572864 action:"gotoNextNote:" discoverabilityTitle:v34];

  v48[0] = v32;
  v48[1] = v35;
  v36 = +[NSArray arrayWithObjects:v48 count:2];
  [v17 addObjectsFromArray:v36];

  v37 = +[UIMenu menuWithTitle:&stru_10063F3D8 image:0 identifier:0 options:1 children:v17];

  return (UIMenu *)v37;
}

+ (UIMenu)goKeyboardShortcutMenu
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Enclosing Folder" value:&stru_10063F3D8 table:0];
  id v4 = +[UIKeyCommand ic_keyCommandWithInput:UIKeyInputUpArrow modifierFlags:0x100000 action:"handleEnclosingFolderKey:" discoverabilityTitle:v3];

  id v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"Go" value:&stru_10063F3D8 table:0];
  v10 = v4;
  v7 = +[NSArray arrayWithObjects:&v10 count:1];
  objc_super v8 = +[UIMenu menuWithTitle:v6 image:0 identifier:0 options:1 children:v7];

  return (UIMenu *)v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("addNote:" == a3
    && ([(ICKeyboardHandler *)self delegate],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformAddNote];
  }
  else if ("addFolder:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v11 = objc_claimAutoreleasedReturnValue(),
             char v12 = objc_opt_respondsToSelector(),
             v11,
             (v12 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformAddFolder];
  }
  else if ("toggleSearch:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v13 = objc_claimAutoreleasedReturnValue(),
             char v14 = objc_opt_respondsToSelector(),
             v13,
             (v14 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformToggleSearch];
  }
  else if ("cmd1:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             uint64_t v15 = objc_claimAutoreleasedReturnValue(),
             char v16 = objc_opt_respondsToSelector(),
             v15,
             (v16 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformCmd1];
  }
  else if ("cmd2:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             id v17 = objc_claimAutoreleasedReturnValue(),
             char v18 = objc_opt_respondsToSelector(),
             v17,
             (v18 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformCmd2];
  }
  else if ("cmd3:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v19 = objc_claimAutoreleasedReturnValue(),
             char v20 = objc_opt_respondsToSelector(),
             v19,
             (v20 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformCmd3];
  }
  else if ("handleReturnKey:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v21 = objc_claimAutoreleasedReturnValue(),
             char v22 = objc_opt_respondsToSelector(),
             v21,
             (v22 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformReturnKey];
  }
  else if ("handleCmdReturnKey:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v23 = objc_claimAutoreleasedReturnValue(),
             char v24 = objc_opt_respondsToSelector(),
             v23,
             (v24 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformCmdReturnKey];
  }
  else if ("handleAddLinkKey:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v25 = objc_claimAutoreleasedReturnValue(),
             char v26 = objc_opt_respondsToSelector(),
             v25,
             (v26 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformAddLink];
  }
  else if ("handleEnclosingFolderKey:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v27 = objc_claimAutoreleasedReturnValue(),
             char v28 = objc_opt_respondsToSelector(),
             v27,
             (v28 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformEnclosingFolderKey];
  }
  else if (("performFindInNote:" == a3 || "find:" == a3) {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v29 = objc_claimAutoreleasedReturnValue(),
             char v30 = objc_opt_respondsToSelector(),
             v29,
             (v30 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformFindInNote];
  }
  else if ("replaceInNote:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v31 = objc_claimAutoreleasedReturnValue(),
             char v32 = objc_opt_respondsToSelector(),
             v31,
             (v32 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformReplaceInNote];
  }
  else if ("handleDeleteKey:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v33 = objc_claimAutoreleasedReturnValue(),
             char v34 = objc_opt_respondsToSelector(),
             v33,
             (v34 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformDeleteKey];
  }
  else if ("handleDeleteSystemPaperNote:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v35 = objc_claimAutoreleasedReturnValue(),
             char v36 = objc_opt_respondsToSelector(),
             v35,
             (v36 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformDeleteSystemPaperNote];
  }
  else if ("printNote:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v37 = objc_claimAutoreleasedReturnValue(),
             char v38 = objc_opt_respondsToSelector(),
             v37,
             (v38 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformPrintNote];
  }
  else if ("toggleEditorCallouts:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v39 = objc_claimAutoreleasedReturnValue(),
             char v40 = objc_opt_respondsToSelector(),
             v39,
             (v40 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformToggleEditorCallouts];
  }
  else if ("toggleNoteActivity:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v41 = objc_claimAutoreleasedReturnValue(),
             char v42 = objc_opt_respondsToSelector(),
             v41,
             (v42 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformToggleNoteActivity];
  }
  else if ("systemPaperNavigateLeft:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v43 = objc_claimAutoreleasedReturnValue(),
             char v44 = objc_opt_respondsToSelector(),
             v43,
             (v44 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformSystemPaperNavigateLeft];
  }
  else if ("systemPaperNavigateRight:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v45 = objc_claimAutoreleasedReturnValue(),
             char v46 = objc_opt_respondsToSelector(),
             v45,
             (v46 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformSystemPaperNavigateRight];
  }
  else if ("systemPaperShowInNotes:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v47 = objc_claimAutoreleasedReturnValue(),
             char v48 = objc_opt_respondsToSelector(),
             v47,
             (v48 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformSystemPaperShowInNotes];
  }
  else if ("expandSection:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v49 = objc_claimAutoreleasedReturnValue(),
             char v50 = objc_opt_respondsToSelector(),
             v49,
             (v50 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformExpandSection];
  }
  else if ("expandAllSections:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v51 = objc_claimAutoreleasedReturnValue(),
             char v52 = objc_opt_respondsToSelector(),
             v51,
             (v52 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformExpandAllSections];
  }
  else if ("collapseSection:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v53 = objc_claimAutoreleasedReturnValue(),
             char v54 = objc_opt_respondsToSelector(),
             v53,
             (v54 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformCollapseSection];
  }
  else if ("collapseAllSections:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v55 = objc_claimAutoreleasedReturnValue(),
             char v56 = objc_opt_respondsToSelector(),
             v55,
             (v56 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformCollapseAllSections];
  }
  else if ("gotoPreviousNote:" == a3 {
         && ([(ICKeyboardHandler *)self delegate],
  }
             v57 = objc_claimAutoreleasedReturnValue(),
             char v58 = objc_opt_respondsToSelector(),
             v57,
             (v58 & 1) != 0))
  {
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformGotoPreviousNote];
  }
  else
  {
    if ("gotoNextNote:" != a3
      || ([(ICKeyboardHandler *)self delegate],
          v59 = objc_claimAutoreleasedReturnValue(),
          char v60 = objc_opt_respondsToSelector(),
          v59,
          (v60 & 1) == 0))
    {
      v63.receiver = self;
      v63.super_class = (Class)ICKeyboardHandler;
      BOOL v61 = [(ICKeyboardHandler *)&v63 canPerformAction:a3 withSender:v6];
      goto LABEL_81;
    }
    objc_super v9 = [(ICKeyboardHandler *)self delegate];
    unsigned __int8 v10 = [v9 canPerformGotoNextNote];
  }
  BOOL v61 = v10;

LABEL_81:
  return v61;
}

- (void)addNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performAddNote:v7];
  }
}

- (void)addFolder:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performAddFolder:v7];
  }
}

- (void)toggleSearch:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performToggleSearch:v7];
  }
}

- (void)printNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performPrintNote:v7];
  }
}

- (void)cmd1:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performCmd1:v7];
  }
}

- (void)cmd2:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performCmd2:v7];
  }
}

- (void)cmd3:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performCmd3:v7];
  }
}

- (void)toggleEditorCallouts:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performToggleEditorCallouts:v7];
  }
}

- (void)toggleNoteActivity:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performToggleNoteActivity:v7];
  }
}

- (void)handleDeleteKey:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performDeleteKey:v7];
  }
}

- (void)handleDeleteSystemPaperNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performDeleteQuickNoteKey:v7];
  }
}

- (void)systemPaperNavigateLeft:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 systemPaperNavigateLeft:v7];
  }
}

- (void)systemPaperNavigateRight:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 systemPaperNavigateRight:v7];
  }
}

- (void)systemPaperShowInNotes:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 systemPaperShowInNotes:v7];
  }
}

- (void)handleReturnKey:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performReturnKey:v7];
  }
}

- (void)handleCmdReturnKey:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performCmdReturnKey:v7];
  }
}

- (void)handleAddLinkKey:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performAddLinkKey:v7];
  }
}

- (void)handleEnclosingFolderKey:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performEnclosingFolderKey:v7];
  }
}

- (void)performFindInNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performFindInNote:v7];
  }
}

- (void)replaceInNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performReplaceInNote:v7];
  }
}

- (void)expandSection:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performExpandSection:v7];
  }
}

- (void)expandAllSections:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performExpandAllSections:v7];
  }
}

- (void)collapseSection:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performCollapseSection:v7];
  }
}

- (void)collapseAllSections:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performCollapseAllSections:v7];
  }
}

- (void)gotoPreviousNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performGotoPreviousNote:v7];
  }
}

- (void)gotoNextNote:(id)a3
{
  id v7 = a3;
  id v4 = [(ICKeyboardHandler *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICKeyboardHandler *)self delegate];
    [v6 performGotoNextNote:v7];
  }
}

- (void)validateCommand:(id)a3
{
  id v7 = a3;
  if ([v7 action] == "cmd3:")
  {
    id v4 = [(ICKeyboardHandler *)self delegate];
    uint64_t v5 = [v4 cmd3Title];
  }
  else if ([v7 action] == "toggleEditorCallouts:")
  {
    id v4 = [(ICKeyboardHandler *)self delegate];
    uint64_t v5 = [v4 toggleEditorCalloutsTitle];
  }
  else
  {
    if ([v7 action] != "toggleNoteActivity:") {
      goto LABEL_8;
    }
    id v4 = [(ICKeyboardHandler *)self delegate];
    uint64_t v5 = [v4 toggleNoteActivityTitle];
  }
  id v6 = (void *)v5;
  [v7 setDiscoverabilityTitle:v5];

LABEL_8:
}

- (void)keyboardDidChangeFrame:(id)a3
{
  id v4 = +[UIKeyboard isInHardwareKeyboardMode];

  [(ICKeyboardHandler *)self setInHardwareKeyboardMode:v4];
}

- (BOOL)globalKeyCommandsInhibited
{
  if ((+[UIDevice ic_isiPad] & 1) == 0
    && !+[UIDevice ic_isVision])
  {
    return 1;
  }
  id v3 = +[ICAppDelegate sharedInstance];
  if ([v3 isAnyWelcomeScreenVisible]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(ICKeyboardHandler *)self firstResponderInhibitsGlobalKeyCommands];
  }

  return v4;
}

- (BOOL)firstResponderInhibitsGlobalKeyCommands
{
  id v3 = [(ICKeyboardHandler *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(ICKeyboardHandler *)self delegate];
  id v6 = [v5 firstResponder];

  id v7 = v6;
  if (v7)
  {
    id v8 = [(ICKeyboardHandler *)self mostRecentInhibitingGlobalKeyCommandResponder];

    if (v7 == v8)
    {
      LODWORD(v11) = [(ICKeyboardHandler *)self mostRecentInhibitingGlobalKeyCommandResponderResult];
    }
    else
    {
      objc_super v9 = v7;
      while (1)
      {
        id v10 = [v9 ic_inhibitsGlobalKeyCommands];
        if (v10) {
          break;
        }
        uint64_t v11 = [v9 nextResponder];

        objc_super v9 = (void *)v11;
        if (!v11) {
          goto LABEL_12;
        }
      }
      LODWORD(v11) = 1;
LABEL_12:
      [(ICKeyboardHandler *)self setMostRecentInhibitingGlobalKeyCommandResponder:v7];
      [(ICKeyboardHandler *)self setMostRecentInhibitingGlobalKeyCommandResponderResult:v10];
    }
  }
  else
  {
    [(ICKeyboardHandler *)self setMostRecentInhibitingGlobalKeyCommandResponder:0];
    LODWORD(v11) = 0;
  }

  return v11 != 0;
}

- (BOOL)isInHardwareKeyboardMode
{
  return self->_inHardwareKeyboardMode;
}

- (ICKeyboardHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICKeyboardHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIResponder)mostRecentInhibitingGlobalKeyCommandResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mostRecentInhibitingGlobalKeyCommandResponder);

  return (UIResponder *)WeakRetained;
}

- (void)setMostRecentInhibitingGlobalKeyCommandResponder:(id)a3
{
}

- (BOOL)mostRecentInhibitingGlobalKeyCommandResponderResult
{
  return self->_mostRecentInhibitingGlobalKeyCommandResponderResult;
}

- (void)setMostRecentInhibitingGlobalKeyCommandResponderResult:(BOOL)a3
{
  self->_mostRecentInhibitingGlobalKeyCommandResponderResult = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mostRecentInhibitingGlobalKeyCommandResponder);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_parentResponder);
}

@end