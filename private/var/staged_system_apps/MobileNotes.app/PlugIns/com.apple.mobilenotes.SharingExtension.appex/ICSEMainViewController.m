@interface ICSEMainViewController
- (BOOL)bottomTextViewCollapsed;
- (BOOL)brickViewCollapsed;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canShareToFolder:(id)a3;
- (BOOL)canShareToNote:(id)a3;
- (BOOL)imageViewCollapsed;
- (BOOL)isSaving;
- (BOOL)isShowingPlaceholderText;
- (BOOL)keyboardResizerAutoscrollAboveKeyboard;
- (BOOL)prefersSystemPaper;
- (BOOL)shouldRetrieveLastSelectedNote;
- (BOOL)titleViewTapped;
- (ICAttachmentBrickView)attachmentBrickView;
- (ICFolder)selectedFolder;
- (ICNote)selectedNote;
- (ICNote)temporaryNewNote;
- (ICRegulatoryLogger)regulatoryLogger;
- (ICSEContainerViewController)containerViewController;
- (ICSEImagesView)imagesView;
- (ICSENoteTitleView)titleView;
- (ICSERootViewController)rootViewController;
- (ICScrollViewKeyboardResizer)scrollViewResizer;
- (NSArray)accounts;
- (NSArray)attachments;
- (NSAttributedString)textAfter;
- (NSAttributedString)textBefore;
- (NSLayoutConstraint)bottomTextViewBottomConstraint;
- (NSLayoutConstraint)bottomTextViewMinHeightConstraint;
- (NSLayoutConstraint)bottomTextviewCollapsibleZeroHeightConstraint;
- (NSLayoutConstraint)brickCollapsibleZeroHeightConstraint;
- (NSLayoutConstraint)brickContainerHeightConstraint;
- (NSLayoutConstraint)imageCollapsibleZeroWidthConstraint;
- (NSLayoutConstraint)titleFooterViewHeightConstraint;
- (NSLayoutConstraint)titleViewMinHeightConstraint;
- (NSLayoutConstraint)topTextViewMinHeightConstraint;
- (NSLayoutConstraint)topTextViewTopConstraint;
- (NSString)lastSelectedFolderIdentifier;
- (NSString)lastSelectedNoteIdentifier;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIBarButtonItem)activityIndicatorBarButtonItem;
- (UIBarButtonItem)saveToNoteBarButtonItem;
- (UILabel)saveToHeaderLabel;
- (UILabel)titleFooterLabel;
- (UIScrollView)scrollView;
- (UITextView)bottomTextView;
- (UITextView)topTextView;
- (UIView)brickContainer;
- (UIView)contentViewContainer;
- (UIView)contentViewTopSeparator;
- (UIView)titleFooterView;
- (UIView)titleHeaderView;
- (UIView)titleViewContainer;
- (double)consumedBottomAreaForResizer:(id)a3;
- (double)topInsetForResizer:(id)a3;
- (id)stringForTitleFooter;
- (unint64_t)layoutType;
- (void)attachmentsAvailable;
- (void)cancel:(id)a3;
- (void)cleanupTemporaryImageFilesIfNecessary;
- (void)cleanupTemporaryNewNoteIfNecesary;
- (void)configureUI;
- (void)contentSizeCategoryChanged:(id)a3;
- (void)dealloc;
- (void)dismissRootViewController;
- (void)extensionHostDidBecomeActive:(id)a3;
- (void)installBrickForAttachmentInfo:(id)a3;
- (void)installImagesViewForAttachments:(id)a3;
- (void)loadAccountsAndAttachments;
- (void)purgeAttachments;
- (void)saveToNote:(id)a3;
- (void)scrollTextToVisibleForTextView:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setActivityIndicatorBarButtonItem:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setAttachmentBrickView:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBottomTextView:(id)a3;
- (void)setBottomTextViewBottomConstraint:(id)a3;
- (void)setBottomTextViewCollapsed:(BOOL)a3;
- (void)setBottomTextViewMinHeightConstraint:(id)a3;
- (void)setBottomTextviewCollapsibleZeroHeightConstraint:(id)a3;
- (void)setBrickCollapsibleZeroHeightConstraint:(id)a3;
- (void)setBrickContainer:(id)a3;
- (void)setBrickContainerHeightConstraint:(id)a3;
- (void)setBrickViewCollapsed:(BOOL)a3;
- (void)setContainerViewController:(id)a3;
- (void)setContentViewContainer:(id)a3;
- (void)setContentViewTopSeparator:(id)a3;
- (void)setImageCollapsibleZeroWidthConstraint:(id)a3;
- (void)setImageViewCollapsed:(BOOL)a3;
- (void)setImagesView:(id)a3;
- (void)setIsSaving:(BOOL)a3;
- (void)setLastSelectedFolderIdentifier:(id)a3;
- (void)setLastSelectedNoteIdentifier:(id)a3;
- (void)setLayoutType:(unint64_t)a3;
- (void)setPrefersSystemPaper:(BOOL)a3;
- (void)setRegulatoryLogger:(id)a3;
- (void)setSaveToHeaderLabel:(id)a3;
- (void)setSaveToNoteBarButtonItem:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewResizer:(id)a3;
- (void)setSelectedFolder:(id)a3;
- (void)setSelectedNote:(id)a3;
- (void)setSelectionToNote:(id)a3 folder:(id)a4 prefersSystemPaper:(BOOL)a5;
- (void)setShowingPlaceholderText:(BOOL)a3;
- (void)setTemporaryNewNote:(id)a3;
- (void)setTitleFooterLabel:(id)a3;
- (void)setTitleFooterView:(id)a3;
- (void)setTitleFooterViewHeightConstraint:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleViewContainer:(id)a3;
- (void)setTitleViewMinHeightConstraint:(id)a3;
- (void)setTitleViewTapped:(BOOL)a3;
- (void)setTopTextView:(id)a3;
- (void)setTopTextViewMinHeightConstraint:(id)a3;
- (void)setTopTextViewTopConstraint:(id)a3;
- (void)setUpForLayoutType:(unint64_t)a3;
- (void)showActivityIndicator;
- (void)showPlaceholderText:(BOOL)a3;
- (void)showSaveButton;
- (void)tabKeyPressed:(id)a3;
- (void)tableController:(id)a3 didSelectNote:(id)a4 folder:(id)a5 prefersSystemPaper:(BOOL)a6;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)titleViewDidTap:(id)a3;
- (void)updateBrickContainerHeightConstraint;
- (void)updateTextViewsForContentSizeChangeIfNecessary;
- (void)updateTitleFooter;
- (void)updateTitleViewHeightConstraint;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICSEMainViewController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  [(ICSEMainViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  [(ICSEMainViewController *)&v4 viewDidLoad];
  [(ICSEMainViewController *)self configureUI];
  [(ICSEMainViewController *)self loadAccountsAndAttachments];
  id v3 = objc_alloc_init((Class)ICRegulatoryLogger);
  [(ICSEMainViewController *)self setRegulatoryLogger:v3];
}

- (void)configureUI
{
  id v3 = [objc_alloc((Class)ICScrollViewKeyboardResizer) initWithDelegate:self];
  [(ICSEMainViewController *)self setScrollViewResizer:v3];

  objc_super v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Notes" value:&stru_1000F2510 table:0];
  v6 = [(ICSEMainViewController *)self navigationItem];
  [v6 setTitle:v5];

  v7 = [(ICSEMainViewController *)self navigationController];
  v8 = [v7 navigationBar];
  [v8 setForceFullHeightInLandscape:1];

  if (+[UIDevice ic_isVision])
  {
    v9 = [(ICSEMainViewController *)self navigationController];
    v10 = [v9 navigationBar];
    [v10 setBackgroundColor:0];

    v11 = [(ICSEMainViewController *)self view];
    [v11 setBackgroundColor:0];

    v12 = [(ICSEMainViewController *)self scrollView];
    [v12 setBackgroundColor:0];
  }
  else
  {
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
      +[UIColor ICDarkenedTintColor];
    }
    else {
    v12 = +[UIColor ICTintColor];
    }
    v13 = [(ICSEMainViewController *)self navigationController];
    v14 = [v13 navigationBar];
    [v14 setTintColor:v12];
  }
  id v15 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v15 setBackgroundImage:0];
  v16 = [(ICSEMainViewController *)self navigationItem];
  v85 = v15;
  [v16 setScrollEdgeAppearance:v15];

  v17 = [(ICSEMainViewController *)self scrollView];
  [v17 setDelegate:self];

  [(ICSEMainViewController *)self showPlaceholderText:1];
  id v18 = +[ICSENoteTitleView newNoteTitleView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 addTarget:self action:"titleViewDidTap:" forControlEvents:64];
  if (+[UIDevice ic_isVision])
  {
    v19 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    v20 = [v19 ic_fontWithSingleLineA];
    v21 = [(ICSEMainViewController *)self saveToHeaderLabel];
    [v21 setFont:v20];

    v22 = [(ICSEMainViewController *)self titleFooterLabel];
    [v22 setTextAlignment:1];

    v23 = [(ICSEMainViewController *)self titleFooterViewHeightConstraint];
    v88 = v23;
    v24 = +[NSArray arrayWithObjects:&v88 count:1];
    +[NSLayoutConstraint deactivateConstraints:v24];

    v25 = [(ICSEMainViewController *)self titleFooterView];
    v26 = [v25 bottomAnchor];
    v27 = [(ICSEMainViewController *)self contentViewTopSeparator];
    v28 = [v27 topAnchor];
    v29 = [v26 constraintLessThanOrEqualToAnchor:v28 constant:-16.0];
    v87 = v29;
    v30 = +[NSArray arrayWithObjects:&v87 count:1];
    +[NSLayoutConstraint activateConstraints:v30];
  }
  v31 = [(ICSEMainViewController *)self titleViewContainer];
  [v31 ic_applyRoundedCorners];

  v32 = [(ICSEMainViewController *)self titleViewContainer];
  [v32 addSubview:v18];

  v33 = +[UIColor tableCellGroupedBackgroundColor];
  v34 = [(ICSEMainViewController *)self titleViewContainer];
  [v34 setBackgroundColor:v33];

  v35 = [(ICSEMainViewController *)self titleViewContainer];
  [v35 setAccessibilityIdentifier:@"titleViewContainer"];

  [(ICSEMainViewController *)self updateTitleViewHeightConstraint];
  v82 = [v18 leadingAnchor];
  v84 = [(ICSEMainViewController *)self titleViewContainer];
  v83 = [v84 layoutMarginsGuide];
  v81 = [v83 leadingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81 constant:8.0];
  v86[0] = v80;
  v77 = [v18 trailingAnchor];
  v79 = [(ICSEMainViewController *)self titleViewContainer];
  v78 = [v79 layoutMarginsGuide];
  v76 = [v78 trailingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:-8.0];
  v86[1] = v75;
  v74 = [v18 topAnchor];
  v36 = [(ICSEMainViewController *)self titleViewContainer];
  v37 = [v36 topAnchor];
  v38 = [v74 constraintEqualToAnchor:v37];
  v86[2] = v38;
  v39 = [v18 bottomAnchor];
  [(ICSEMainViewController *)self titleViewContainer];
  v41 = id v40 = v18;
  v42 = [v41 bottomAnchor];
  v43 = [v39 constraintEqualToAnchor:v42];
  v86[3] = v43;
  v44 = +[NSArray arrayWithObjects:v86 count:4];
  +[NSLayoutConstraint activateConstraints:v44];

  v45 = v40;
  [(ICSEMainViewController *)self setTitleView:v40];
  v46 = [(ICSEMainViewController *)self contentViewContainer];
  [v46 ic_applyRoundedCorners];

  v47 = +[UIColor tableCellGroupedBackgroundColor];
  v48 = [(ICSEMainViewController *)self contentViewContainer];
  [v48 setBackgroundColor:v47];

  id v49 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(ICSEMainViewController *)self setActivityIndicatorView:v49];

  id v50 = objc_alloc((Class)UIBarButtonItem);
  v51 = [(ICSEMainViewController *)self activityIndicatorView];
  id v52 = [v50 initWithCustomView:v51];
  [(ICSEMainViewController *)self setActivityIndicatorBarButtonItem:v52];

  v53 = [(ICSEMainViewController *)self saveToNoteBarButtonItem];
  [v53 setEnabled:0];

  if (![(ICSEMainViewController *)self layoutType]) {
    [(ICSEMainViewController *)self setUpForLayoutType:3];
  }
  v54 = [(ICSEMainViewController *)self topTextView];
  [v54 setDelegate:self];

  v55 = [(ICSEMainViewController *)self bottomTextView];
  [v55 setDelegate:self];

  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    v59 = [(ICSEMainViewController *)self topTextView];
    [v59 setTextContainerInset:UIEdgeInsetsZero.top, left, bottom, right];

    v60 = [(ICSEMainViewController *)self topTextView];
    v61 = [v60 textContainer];
    [v61 setLineFragmentPadding:0.0];

    v62 = [(ICSEMainViewController *)self bottomTextView];
    [v62 setTextContainerInset:UIEdgeInsetsZero.top, left, bottom, right];

    v63 = [(ICSEMainViewController *)self bottomTextView];
    v64 = [v63 textContainer];
    [v64 setLineFragmentPadding:0.0];
  }
  v65 = [(ICSEMainViewController *)self topTextViewMinHeightConstraint];
  [v65 setConstant:48.0];

  v66 = [(ICSEMainViewController *)self bottomTextviewCollapsibleZeroHeightConstraint];
  [v66 setConstant:72.0];

  [(ICSEMainViewController *)self updateTextViewsForContentSizeChangeIfNecessary];
  v67 = +[NSBundle mainBundle];
  v68 = [v67 localizedStringForKey:@"Save" value:&stru_1000F2510 table:0];
  v69 = +[UIKeyCommand ic_keyCommandWithInput:@"\r" modifierFlags:0x100000 action:"saveToNote:" discoverabilityTitle:v68];
  [(ICSEMainViewController *)self addKeyCommand:v69];

  v70 = +[UIKeyCommand keyCommandWithInput:@"\t" modifierFlags:0 action:"tabKeyPressed:"];
  [(ICSEMainViewController *)self addKeyCommand:v70];

  v71 = +[UIKeyCommand keyCommandWithInput:@"\t" modifierFlags:0x20000 action:"tabKeyPressed:"];
  [(ICSEMainViewController *)self addKeyCommand:v71];

  v72 = +[NSNotificationCenter defaultCenter];
  [v72 addObserver:self selector:"contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v73 = +[NSNotificationCenter defaultCenter];
  [v73 addObserver:self selector:"updateBrickContainerHeightConstraint" name:ICAttachmentDidChangePreferredSizeNotification object:0];
}

- (void)showActivityIndicator
{
  id v3 = [(ICSEMainViewController *)self activityIndicatorBarButtonItem];
  objc_super v4 = [(ICSEMainViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = [(ICSEMainViewController *)self activityIndicatorView];
  [v5 startAnimating];
}

- (void)showSaveButton
{
  id v4 = [(ICSEMainViewController *)self saveToNoteBarButtonItem];
  id v3 = [(ICSEMainViewController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)loadAccountsAndAttachments
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];
  id v5 = +[ICAccount allActiveAccountsInContextSortedByAccountType:v4];

  if (v5 && [v5 count])
  {
    [(ICSEMainViewController *)self setAccounts:v5];
    v6 = [(ICSEMainViewController *)self containerViewController];
    v7 = [v6 tableViewController];
    [v7 setAccounts:v5];

    v8 = +[ICNoteContext sharedContext];
    v9 = [v8 managedObjectContext];
    v10 = +[ICFolder defaultFolderInContext:v9];
    os_log_t v11 = (os_log_t)+[ICNote newEmptyNoteInFolder:v10];

    [v11 markForDeletion];
    [(ICSEMainViewController *)self setTemporaryNewNote:v11];
    v12 = +[ICSharingExtensionAttachmentsManager sharedManager];
    v13 = [v12 lastNoteSavedTo];

    -[ICSEMainViewController setSelectionToNote:folder:prefersSystemPaper:](self, "setSelectionToNote:folder:prefersSystemPaper:", v13, 0, [v13 isSystemPaper]);
    objc_initWeak(location, self);
    v14 = [v11 account];
    id v15 = [v14 identifier];
    v16 = +[ICSharingExtensionAttachmentsManager sharedManager];
    [v16 setAccountId:v15];

    v17 = dispatch_get_global_queue(0, 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100024A4C;
    v18[3] = &unk_1000EE058;
    objc_copyWeak(&v19, location);
    v18[4] = self;
    dispatch_async(v17, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    os_log_t v11 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No sharing extension accounts.", (uint8_t *)location, 2u);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v27.receiver = self;
  v27.super_class = (Class)ICSEMainViewController;
  [(ICSEMainViewController *)&v27 viewDidAppear:a3];
  uint64_t v4 = [(ICSEMainViewController *)self accounts];
  if (!v4
    || (id v5 = (void *)v4,
        [(ICSEMainViewController *)self accounts],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v5,
        !v7))
  {
    int IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
    v9 = +[NSBundle mainBundle];
    v10 = v9;
    if (IsAppleAccountBrandingEnabled) {
      CFStringRef v11 = @"To share to a note, you’ll need to go to Notes and upgrade your Apple Account.";
    }
    else {
      CFStringRef v11 = @"To share to a note, you’ll need to go to Notes and upgrade your iCloud account.";
    }
    v12 = [v9 localizedStringForKey:v11 value:&stru_1000F2510 table:0];

    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Upgrade Your Notes" value:&stru_1000F2510 table:0];
    v6 = +[UIAlertController alertControllerWithTitle:v14 message:v12 preferredStyle:1];

    id v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Cancel" value:&stru_1000F2510 table:0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100024F4C;
    v26[3] = &unk_1000EDFE0;
    v26[4] = self;
    v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:v26];

    id v18 = +[NSBundle mainBundle];
    id v19 = [v18 localizedStringForKey:@"Go to Notes" value:&stru_1000F2510 table:0];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100024F54;
    v25[3] = &unk_1000EDFE0;
    v25[4] = self;
    v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v25];

    [v6 addAction:v20];
    [v6 addAction:v17];
    [(ICSEMainViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  v21 = [(ICSEMainViewController *)self accounts];
  if (v21)
  {
    v6 = [(ICSEMainViewController *)self accounts];
    BOOL v22 = [v6 count] != 0;
  }
  else
  {
    BOOL v22 = 0;
  }
  v23 = [(ICSEMainViewController *)self titleViewContainer];
  [v23 setUserInteractionEnabled:v22];

  if (v21) {
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"extensionHostDidBecomeActive:" name:NSExtensionHostDidBecomeActiveNotification object:0];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICSEMainViewController;
  [(ICSEMainViewController *)&v8 viewDidLayoutSubviews];
  id v3 = [(ICSEMainViewController *)self view];
  uint64_t v4 = [v3 window];

  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.view.window) != nil)", "-[ICSEMainViewController viewDidLayoutSubviews]", 1, 0, @"Expected non-nil value for '%s'", "self.view.window");
  }
  id v5 = [(ICSEMainViewController *)self scrollViewResizer];
  unsigned __int8 v6 = [v5 isAutoResizing];

  if ((v6 & 1) == 0)
  {
    id v7 = [(ICSEMainViewController *)self scrollViewResizer];
    [v7 startAutoResizing];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICSEMainViewController;
  [(ICSEMainViewController *)&v6 viewWillDisappear:a3];
  uint64_t v4 = [(ICSEMainViewController *)self scrollViewResizer];
  [v4 stopAutoResizing];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NSExtensionHostDidBecomeActiveNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  [(ICSEMainViewController *)&v4 viewDidDisappear:a3];
  if (![(ICSEMainViewController *)self isSaving])
  {
    [(ICSEMainViewController *)self cleanupTemporaryNewNoteIfNecesary];
    [(ICSEMainViewController *)self cleanupTemporaryImageFilesIfNecessary];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)cleanupTemporaryImageFilesIfNecessary
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(ICSEMainViewController *)self attachments];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      objc_super v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) deleteTemporaryImageFileIfNecessary];
        objc_super v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)cleanupTemporaryNewNoteIfNecesary
{
  id v3 = [(ICSEMainViewController *)self temporaryNewNote];
  id v4 = [v3 managedObjectContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100025390;
  v6[3] = &unk_1000EE0C0;
  id v7 = v3;
  id v5 = v3;
  [v4 performBlockAndWait:v6];

  [(ICSEMainViewController *)self setTemporaryNewNote:0];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  [(ICSEMainViewController *)&v4 viewSafeAreaInsetsDidChange];
  id v3 = [(ICSEMainViewController *)self scrollViewResizer];
  [v3 reapplyInsets];
}

- (void)updateTitleFooter
{
  id v4 = [(ICSEMainViewController *)self stringForTitleFooter];
  id v3 = [(ICSEMainViewController *)self titleFooterLabel];
  [v3 setText:v4];
}

- (id)stringForTitleFooter
{
  id v3 = [(ICSEMainViewController *)self attachments];
  id v4 = [v3 count];

  if (!v4)
  {
    CFStringRef v11 = &stru_1000F2510;
    goto LABEL_180;
  }
  id v5 = [(ICSEMainViewController *)self attachments];
  id v6 = [v5 count];

  id v7 = [(ICSEMainViewController *)self selectedNote];
  long long v8 = [(ICSEMainViewController *)self selectedFolder];
  long long v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v7 folder];
  }
  v12 = v10;

  if (v7)
  {
    v13 = [v7 title];
    v14 = [v13 ic_truncatedStringWithMaxLength:35 truncated:0];
    uint64_t v85 = [v14 ic_quotedString];

    if ([v7 isSharedRootObject])
    {
      id v15 = [v7 sharedOwnerName];
      v16 = v15;
      if (v15)
      {
        int v17 = 0;
        BOOL v18 = [v15 length] != 0;
LABEL_14:
        unsigned int v19 = v17 & [v7 isSharedRootObject];
        goto LABEL_15;
      }
      BOOL v18 = 0;
    }
    else
    {
      BOOL v18 = 0;
      v16 = 0;
    }
    int v17 = 1;
    goto LABEL_14;
  }
  BOOL v18 = 0;
  v16 = 0;
  uint64_t v85 = 0;
  unsigned int v19 = 0;
LABEL_15:
  v89 = v12;
  v86 = v16;
  unint64_t v87 = (unint64_t)v6;
  if (!v12 || ([v12 isDefaultFolderForAccount] & 1) != 0)
  {
    v20 = 0;
LABEL_18:

    BOOL v21 = 0;
    v88 = 0;
    char v22 = 0;
    uint64_t v84 = 0;
    unsigned int v23 = 0;
    goto LABEL_19;
  }
  v36 = [v12 localizedTitle];
  v20 = v36;
  if (!v36 || ![v36 length]) {
    goto LABEL_18;
  }
  v37 = [v20 ic_truncatedStringWithMaxLength:35 truncated:0];
  uint64_t v84 = [v37 ic_quotedString];

  if ([v12 isSharedViaICloud]
    && ([v12 sharedOwnerName], (v38 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v88 = v38;
    int v39 = 0;
    BOOL v21 = [(__CFString *)v38 length] != 0;
  }
  else
  {
    BOOL v21 = 0;
    v88 = 0;
    int v39 = 1;
  }
  unsigned int v23 = v39 & [v12 isSharedViaICloud];
  char v22 = 1;
LABEL_19:
  v24 = [(ICSEMainViewController *)self accounts];
  id v25 = [v24 count];

  if ((unint64_t)v25 < 2)
  {
    int v30 = 0;
    v31 = &stru_1000F2510;
    if (!v7) {
      goto LABEL_46;
    }
LABEL_23:
    v32 = v7;
    if (v22)
    {
      if ((v21 | v23))
      {
        if (v21)
        {
          v33 = +[NSBundle mainBundle];
          v34 = v33;
          if (v30)
          {
            if (v87 > 1) {
              CFStringRef v35 = @"These attachments will be saved to the note %@ in the folder %@ shared by %@ in your %@ account.";
            }
            else {
              CFStringRef v35 = @"This attachment will be saved to the note %@ in the folder %@ shared by %@ in your %@ account.";
            }
            v74 = [v33 localizedStringForKey:v35 value:&stru_1000F2510 table:0];
            v82 = v31;
          }
          else
          {
            if (v87 > 1) {
              CFStringRef v66 = @"These attachments will be saved to the note %@ in the folder %@ shared by %@.";
            }
            else {
              CFStringRef v66 = @"This attachment will be saved to the note %@ in the folder %@ shared by %@.";
            }
            v74 = [v33 localizedStringForKey:v66 value:&stru_1000F2510 table:0];
          }
          v81 = v88;
          goto LABEL_173;
        }
        if ((v23 & 1) == 0) {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "isOwnedSharedFolder", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, @"Unexpected case in updateTitleFooter");
        }
        v59 = +[NSBundle mainBundle];
        v34 = v59;
        v48 = (void *)v85;
        id v49 = v86;
        id v50 = (void *)v84;
        if (v30)
        {
          if (v87 > 1) {
            CFStringRef v60 = @"These attachments will be saved to the note %@ in your shared folder %@ in your %@ account.";
          }
          else {
            CFStringRef v60 = @"This attachment will be saved to the note %@ in your shared folder %@ in your %@ account.";
          }
          v75 = [v59 localizedStringForKey:v60 value:&stru_1000F2510 table:0];
          v81 = v31;
        }
        else
        {
          if (v87 > 1) {
            CFStringRef v69 = @"These attachments will be saved to the note %@ in your shared folder %@.";
          }
          else {
            CFStringRef v69 = @"This attachment will be saved to the note %@ in your shared folder %@.";
          }
          v75 = [v59 localizedStringForKey:v69 value:&stru_1000F2510 table:0];
        }
        uint64_t v80 = v84;
LABEL_143:
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v75, v48, v80, v81, v82);
        v65 = LABEL_164:;

        goto LABEL_174;
      }
      v53 = +[NSBundle mainBundle];
      v34 = v53;
      if (v30)
      {
        if (v18)
        {
          if (v87 > 1) {
            CFStringRef v54 = @"These attachments will be saved to the note %@ shared by %@ in the folder %@ in your %@ account.";
          }
          else {
            CFStringRef v54 = @"This attachment will be saved to the note %@ shared by %@ in the folder %@ in your %@ account.";
          }
          v75 = [v53 localizedStringForKey:v54 value:&stru_1000F2510 table:0];
          v82 = v31;
LABEL_133:
          id v50 = (void *)v84;
          v48 = (void *)v85;
          id v49 = v86;
          uint64_t v80 = (uint64_t)v86;
          v81 = (void *)v84;
          goto LABEL_143;
        }
        if (v19)
        {
          if (v87 > 1) {
            CFStringRef v68 = @"These attachments will be saved to your shared note %@ in the folder %@ in your %@ account.";
          }
          else {
            CFStringRef v68 = @"This attachment will be saved to your shared note %@ in the folder %@ in your %@ account.";
          }
        }
        else if (v87 > 1)
        {
          CFStringRef v68 = @"These attachments will be saved to the note %@ in the folder %@ in your %@ account.";
        }
        else
        {
          CFStringRef v68 = @"This attachment will be saved to the note %@ in the folder %@ in your %@ account.";
        }
        v74 = [v53 localizedStringForKey:v68 value:&stru_1000F2510 table:0];
        v81 = v31;
      }
      else
      {
        if (v18)
        {
          if (v87 > 1) {
            CFStringRef v62 = @"These attachments will be saved to the note %@ shared by %@ in the folder %@.";
          }
          else {
            CFStringRef v62 = @"This attachment will be saved to the note %@ shared by %@ in the folder %@.";
          }
          v75 = [v53 localizedStringForKey:v62 value:&stru_1000F2510 table:0];
          goto LABEL_133;
        }
        if (v19)
        {
          if (v87 > 1) {
            CFStringRef v70 = @"These attachments will be saved to your shared note %@ in the folder %@.";
          }
          else {
            CFStringRef v70 = @"This attachment will be saved to your shared note %@ in the folder %@.";
          }
        }
        else if (v87 > 1)
        {
          CFStringRef v70 = @"These attachments will be saved to the note %@ in the folder %@.";
        }
        else
        {
          CFStringRef v70 = @"This attachment will be saved to the note %@ in the folder %@.";
        }
        v74 = [v53 localizedStringForKey:v70 value:&stru_1000F2510 table:0];
      }
LABEL_173:
      id v50 = (void *)v84;
      v48 = (void *)v85;
      v65 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v74, v85, v84, v81, v82);

      id v49 = v86;
      goto LABEL_174;
    }
    id v40 = +[NSBundle mainBundle];
    v34 = v40;
    if (v30)
    {
      if (v18)
      {
        if (v87 > 1) {
          CFStringRef v41 = @"These attachments will be saved to the note %@ shared by %@ in your %@ account.";
        }
        else {
          CFStringRef v41 = @"This attachment will be saved to the note %@ shared by %@ in your %@ account.";
        }
        v67 = [v40 localizedStringForKey:v41 value:&stru_1000F2510 table:0];
        v81 = v31;
LABEL_105:
        v48 = (void *)v85;
        id v49 = v86;
        v65 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v67, v85, v86, v81);

LABEL_151:
        id v50 = (void *)v84;
LABEL_174:
        id v7 = v32;
        goto LABEL_175;
      }
      if (v19)
      {
        if (v87 > 1) {
          CFStringRef v61 = @"These attachments will be saved to your shared note %@ in your %@ account.";
        }
        else {
          CFStringRef v61 = @"This attachment will be saved to your shared note %@ in your %@ account.";
        }
      }
      else if (v87 > 1)
      {
        CFStringRef v61 = @"These attachments will be saved to the note %@ in your %@ account.";
      }
      else
      {
        CFStringRef v61 = @"This attachment will be saved to the note %@ in your %@ account.";
      }
      v76 = [v40 localizedStringForKey:v61 value:&stru_1000F2510 table:0];
      v79 = v31;
    }
    else
    {
      if (v18)
      {
        if (v87 > 1) {
          CFStringRef v55 = @"These attachments will be saved to the note %@ shared by %@.";
        }
        else {
          CFStringRef v55 = @"This attachment will be saved to the note %@ shared by %@.";
        }
        v67 = [v40 localizedStringForKey:v55 value:&stru_1000F2510 table:0];
        goto LABEL_105;
      }
      if (v19)
      {
        if (v87 > 1) {
          CFStringRef v63 = @"These attachments will be saved to your shared note %@.";
        }
        else {
          CFStringRef v63 = @"This attachment will be saved to your shared note %@.";
        }
      }
      else if (v87 > 1)
      {
        CFStringRef v63 = @"These attachments will be saved to the note %@.";
      }
      else
      {
        CFStringRef v63 = @"This attachment will be saved to the note %@.";
      }
      v76 = [v40 localizedStringForKey:v63 value:&stru_1000F2510 table:0];
    }
    v48 = (void *)v85;
    v65 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v76, v85, v79);

    id v49 = v86;
    goto LABEL_151;
  }
  BOOL v83 = v21;
  unsigned int v26 = v19;
  BOOL v27 = v18;
  if (v7)
  {
    v28 = v7;
    v29 = v7;
  }
  else
  {
    v28 = 0;
    v29 = v89;
  }
  v42 = [v29 account];
  if (!v42)
  {
    v43 = +[ICNoteContext sharedContext];
    v44 = [v43 managedObjectContext];
    v42 = +[ICAccount defaultAccountInContext:v44];
  }
  v45 = [v42 localizedName];
  v46 = v45;
  if (v45 && [v45 length])
  {
    [v46 ic_truncatedStringWithMaxLength:35 truncated:0];
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v30 = 1;
  }
  else
  {
    v31 = 0;
    int v30 = 0;
  }

  id v7 = v28;
  BOOL v18 = v27;
  unsigned int v19 = v26;
  BOOL v21 = v83;
  if (v7) {
    goto LABEL_23;
  }
LABEL_46:
  if (v22)
  {
    v32 = v7;
    if ((v21 | v23))
    {
      if (v21)
      {
        v47 = +[NSBundle mainBundle];
        v34 = v47;
        v48 = (void *)v85;
        id v49 = v86;
        id v50 = (void *)v84;
        if (v30)
        {
          if (v87 > 1) {
            CFStringRef v51 = @"These attachments will be saved in a new note in the folder %@ shared by %@ in your %@ account.";
          }
          else {
            CFStringRef v51 = @"This attachment will be saved in a new note in the folder %@ shared by %@ in your %@ account.";
          }
          v75 = [v47 localizedStringForKey:v51 value:&stru_1000F2510 table:0];
          v81 = v31;
        }
        else
        {
          if (v87 > 1) {
            CFStringRef v71 = @"These attachments will be saved in a new note in the folder %@ shared by %@.";
          }
          else {
            CFStringRef v71 = @"This attachment will be saved in a new note in the folder %@ shared by %@.";
          }
          v75 = [v47 localizedStringForKey:v71 value:&stru_1000F2510 table:0];
        }
        v79 = v88;
        goto LABEL_163;
      }
      v48 = (void *)v85;
      id v49 = v86;
      id v50 = (void *)v84;
      if ((v23 & 1) == 0) {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "isOwnedSharedFolder", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, @"Unexpected case in updateTitleFooter");
      }
      v34 = +[NSBundle mainBundle];
      if (v30)
      {
        if (v87 > 1) {
          CFStringRef v56 = @"These attachments will be saved in a new note in your shared folder %@ in your %@ account.";
        }
        else {
          CFStringRef v56 = @"This attachment will be saved in a new note in your shared folder %@ in your %@ account.";
        }
LABEL_155:
        v75 = [v34 localizedStringForKey:v56 value:&stru_1000F2510 table:0];
        v79 = v31;
LABEL_163:
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v75, v50, v79, v81, v82);
        goto LABEL_164;
      }
      if (v87 > 1) {
        CFStringRef v64 = @"These attachments will be saved in a new note in your shared folder %@.";
      }
      else {
        CFStringRef v64 = @"This attachment will be saved in a new note in your shared folder %@.";
      }
    }
    else
    {
      v34 = +[NSBundle mainBundle];
      if (v30)
      {
        id v49 = v86;
        id v50 = (void *)v84;
        v48 = (void *)v85;
        if (v87 > 1) {
          CFStringRef v56 = @"These attachments will be saved in a new note in the folder %@ in your %@ account.";
        }
        else {
          CFStringRef v56 = @"This attachment will be saved in a new note in the folder %@ in your %@ account.";
        }
        goto LABEL_155;
      }
      id v49 = v86;
      id v50 = (void *)v84;
      v48 = (void *)v85;
      if (v87 > 1) {
        CFStringRef v64 = @"These attachments will be saved in a new note in the folder %@.";
      }
      else {
        CFStringRef v64 = @"This attachment will be saved in a new note in the folder %@.";
      }
    }
    v75 = [v34 localizedStringForKey:v64 value:&stru_1000F2510 table:0];
    goto LABEL_163;
  }
  if (((v30 | ![(ICSEMainViewController *)self prefersSystemPaper]) & 1) == 0)
  {
    v57 = +[NSBundle mainBundle];
    v34 = v57;
    if (v87 > 1) {
      CFStringRef v58 = @"These attachments will be saved in a new note in the Quick Notes folder.";
    }
    else {
      CFStringRef v58 = @"This attachment will be saved in a new note in the Quick Notes folder.";
    }
    v65 = [v57 localizedStringForKey:v58 value:&stru_1000F2510 table:0];
    v48 = (void *)v85;
    id v49 = v86;
    id v50 = (void *)v84;
    goto LABEL_175;
  }
  if ([(ICSEMainViewController *)self prefersSystemPaper])
  {
    v34 = +[NSBundle mainBundle];
    id v49 = v86;
    id v50 = (void *)v84;
    v48 = (void *)v85;
    if (v87 > 1) {
      CFStringRef v52 = @"These attachments will be saved in a new note in the Quick Notes folder in your %@ account.";
    }
    else {
      CFStringRef v52 = @"This attachment will be saved in a new note in the Quick Notes folder in your %@ account.";
    }
  }
  else
  {
    v48 = (void *)v85;
    id v49 = v86;
    id v50 = (void *)v84;
    if ((v30 & 1) == 0)
    {
      v72 = +[NSBundle mainBundle];
      v34 = v72;
      if (v87 > 1) {
        CFStringRef v73 = @"These attachments will be saved in a new note.";
      }
      else {
        CFStringRef v73 = @"This attachment will be saved in a new note.";
      }
      v65 = [v72 localizedStringForKey:v73 value:&stru_1000F2510 table:0];
      goto LABEL_175;
    }
    v34 = +[NSBundle mainBundle];
    if (v87 > 1) {
      CFStringRef v52 = @"These attachments will be saved in a new note in your %@ account.";
    }
    else {
      CFStringRef v52 = @"This attachment will be saved in a new note in your %@ account.";
    }
  }
  v77 = [v34 localizedStringForKey:v52 value:&stru_1000F2510 table:0];
  v65 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v77, v31);

LABEL_175:
  if (!v65) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((titleFooterString) != nil)", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, @"Expected non-nil value for '%s'", "titleFooterString");
  }
  if (![v65 length]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "titleFooterString.length > 0", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, @"title footer string is empty");
  }
  CFStringRef v11 = v65;

LABEL_180:

  return v11;
}

- (BOOL)canShareToNote:(id)a3
{
  id v3 = a3;
  if (([v3 isPasswordProtected] & 1) != 0
    || ![v3 isEditable]
    || ([v3 isDeletedOrInTrash] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unsigned int v4 = [v3 markedForDeletion] ^ 1;
  }

  return v4;
}

- (BOOL)canShareToFolder:(id)a3
{
  id v3 = a3;
  if (![v3 canMoveAddOrDeleteContents]
    || ([v3 isDeleted] & 1) != 0
    || ([v3 isTrashFolder] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unsigned int v4 = [v3 markedForDeletion] ^ 1;
  }

  return v4;
}

- (BOOL)shouldRetrieveLastSelectedNote
{
  id v3 = [(ICSEMainViewController *)self selectedNote];

  unsigned int v4 = [(ICSEMainViewController *)self selectedFolder];

  id v5 = [(ICSEMainViewController *)self selectedNote];
  unsigned int v6 = [(ICSEMainViewController *)self canShareToNote:v5];

  id v7 = [(ICSEMainViewController *)self selectedFolder];
  unsigned __int8 v8 = [(ICSEMainViewController *)self canShareToFolder:v7];

  if (v3 && !v6) {
    return 1;
  }
  if (v4) {
    return v8 ^ 1;
  }
  return 0;
}

- (void)setSelectionToNote:(id)a3 folder:(id)a4 prefersSystemPaper:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  id v8 = a4;
  if (![(ICSEMainViewController *)self canShareToNote:v18])
  {

    id v18 = 0;
  }
  if ([(ICSEMainViewController *)self canShareToFolder:v8])
  {
    [(ICSEMainViewController *)self setSelectedNote:v18];
    long long v9 = v18;
    if (!v18)
    {
      if (v8) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }
  else
  {

    [(ICSEMainViewController *)self setSelectedNote:v18];
    if (!v18)
    {
LABEL_10:
      id v8 = +[ICNoteContext sharedContext];
      CFStringRef v11 = [v8 managedObjectContext];
      v12 = +[ICAccount defaultAccountInContext:v11];
      uint64_t v10 = [v12 defaultFolder];

      goto LABEL_11;
    }
    id v8 = 0;
    long long v9 = v18;
  }
  uint64_t v10 = [v9 folder];
LABEL_11:

  id v8 = (id)v10;
LABEL_12:
  [(ICSEMainViewController *)self setSelectedFolder:v8];
  [(ICSEMainViewController *)self setPrefersSystemPaper:v5];
  v13 = [(ICSEMainViewController *)self accounts];

  if (!v13) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.accounts) != nil)", "-[ICSEMainViewController setSelectionToNote:folder:prefersSystemPaper:]", 1, 0, @"Expected non-nil value for '%s'", "self.accounts");
  }
  v14 = [(ICSEMainViewController *)self titleView];
  id v15 = [(ICSEMainViewController *)self accounts];
  [v14 setNote:v18 folder:v8 hasMultipleAccounts:(unint64_t)[v15 count] > 1];

  [(ICSEMainViewController *)self updateTitleFooter];
  v16 = [v18 identifier];
  [(ICSEMainViewController *)self setLastSelectedNoteIdentifier:v16];

  int v17 = [v8 identifier];
  [(ICSEMainViewController *)self setLastSelectedFolderIdentifier:v17];
}

- (NSAttributedString)textBefore
{
  if ([(ICSEMainViewController *)self isShowingPlaceholderText])
  {
    id v3 = 0;
  }
  else
  {
    unsigned int v4 = [(ICSEMainViewController *)self topTextView];
    BOOL v5 = [v4 text];
    unsigned int v6 = [v5 ic_trimmedString];

    if ([v6 length])
    {
      id v7 = [(ICSEMainViewController *)self topTextView];
      id v3 = [v7 attributedText];
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSAttributedString *)v3;
}

- (NSAttributedString)textAfter
{
  id v3 = [(ICSEMainViewController *)self bottomTextView];
  unsigned int v4 = [v3 text];
  BOOL v5 = [v4 ic_trimmedString];

  if ([v5 length])
  {
    unsigned int v6 = [(ICSEMainViewController *)self bottomTextView];
    id v7 = [v6 attributedText];
  }
  else
  {
    id v7 = 0;
  }

  return (NSAttributedString *)v7;
}

- (void)tabKeyPressed:(id)a3
{
  unsigned __int8 v4 = [(ICSEMainViewController *)self bottomTextViewCollapsed];
  BOOL v5 = [(ICSEMainViewController *)self topTextView];
  unsigned int v6 = [v5 ic_isFirstResponder];

  if (v4)
  {
    if (v6) {
      return;
    }
    id v7 = [(ICSEMainViewController *)self topTextView];
  }
  else
  {
    id v7 = [(ICSEMainViewController *)self topTextView];
    if (v6)
    {
      id v9 = v7;
      unsigned int v8 = [v7 ic_isFirstResponder];

      if (!v8) {
        return;
      }
      id v7 = [(ICSEMainViewController *)self bottomTextView];
    }
  }
  id v10 = v7;
  [v7 ic_becomeFirstResponder];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("saveToNote:" == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ICSEMainViewController *)self containerViewController];
      if ([v7 isShowingTableContainer])
      {
        LOBYTE(self) = 0;
      }
      else
      {
        unsigned int v8 = [(ICSEMainViewController *)self saveToNoteBarButtonItem];
        LOBYTE(self) = [v8 isEnabled];
      }
      goto LABEL_10;
    }
  }
  if ("tabKeyPressed:" == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(ICSEMainViewController *)self containerViewController];
      LODWORD(self) = [v7 isShowingTableContainer] ^ 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)ICSEMainViewController;
  LOBYTE(self) = [(ICSEMainViewController *)&v10 canPerformAction:a3 withSender:v6];
LABEL_11:

  return (char)self;
}

- (void)saveToNote:(id)a3
{
  uint64_t v4 = [(ICSEMainViewController *)self selectedNote];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    id v6 = [(ICSEMainViewController *)self selectedNote];
    unsigned __int8 v7 = [v6 isEditable];

    if ((v7 & 1) == 0)
    {
      v37 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1000B6680(v37);
      }
      goto LABEL_59;
    }
  }
  uint64_t v8 = [(ICSEMainViewController *)self selectedFolder];
  if (v8)
  {
    id v9 = (void *)v8;
    objc_super v10 = [(ICSEMainViewController *)self selectedFolder];
    unsigned __int8 v11 = [v10 canMoveAddOrDeleteContents];

    if ((v11 & 1) == 0)
    {
      v37 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1000B663C(v37);
      }
      goto LABEL_59;
    }
  }
  [(ICSEMainViewController *)self setIsSaving:1];
  [(ICSEMainViewController *)self showActivityIndicator];
  v12 = [(ICSEMainViewController *)self textBefore];
  v13 = [(ICSEMainViewController *)self textAfter];
  v14 = [(ICSEMainViewController *)self selectedNote];

  if (!v14)
  {
    v38 = [(ICSEMainViewController *)self attachments];
    id v39 = [v38 count];
    id v40 = +[ICCloudConfiguration sharedConfiguration];
    id v41 = [v40 maxAttachmentsPerNote];

    if (v39 <= v41)
    {
      v44 = (char *)[v12 length];
      v45 = v12;
      v46 = &v44[(void)[v13 length]];
      BOOL v47 = v46 >= +[ICNote maxNoteTextLength];
      v12 = v45;
      if (!v47) {
        goto LABEL_8;
      }
LABEL_31:
      int v43 = 0;
      char v28 = 0;
      int v42 = 1;
      goto LABEL_34;
    }
LABEL_28:
    int v42 = 0;
    char v28 = 0;
    int v43 = 1;
    goto LABEL_34;
  }
  id v15 = [(ICSEMainViewController *)self selectedNote];
  v16 = [(ICSEMainViewController *)self attachments];
  unsigned int v17 = [v15 canAddAttachments:[v16 count]];

  if (!v17) {
    goto LABEL_28;
  }
  id v18 = [(ICSEMainViewController *)self selectedNote];
  unsigned int v19 = [(ICSEMainViewController *)self selectedNote];
  v20 = [v19 textStorage];
  BOOL v21 = (char *)[v20 length];
  char v22 = v13;
  id v23 = [v12 length];
  v24 = (char *)[v22 length] + (void)v23;
  v13 = v22;
  LOBYTE(v21) = [v18 allowsNewTextLength:&v21[(void)v24]];

  if ((v21 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_8:
  unint64_t v87 = v13;
  v88 = v12;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v25 = [(ICSEMainViewController *)self attachments];
  id v26 = [v25 countByEnumeratingWithState:&v97 objects:v101 count:16];
  if (!v26)
  {
    char v28 = 0;
    goto LABEL_33;
  }
  id v27 = v26;
  char v28 = 0;
  uint64_t v29 = *(void *)v98;
  do
  {
    for (i = 0; i != v27; i = (char *)i + 1)
    {
      if (*(void *)v98 != v29) {
        objc_enumerationMutation(v25);
      }
      v31 = *(void **)(*((void *)&v97 + 1) + 8 * i);
      v32 = [v31 mediaData];
      id v33 = [v32 length];

      if (v33)
      {
LABEL_14:
        id v34 = [(ICSEMainViewController *)self selectedNote];
        LOBYTE(v33) = [v34 attachmentExceedsMaxSizeAllowed:v33];
LABEL_19:

        goto LABEL_20;
      }
      CFStringRef v35 = [v31 mediaURL];
      id v96 = 0;
      unsigned int v36 = [v35 getResourceValue:&v96 forKey:NSURLFileSizeKey error:0];
      id v34 = v96;

      if (!v36)
      {
        LOBYTE(v33) = 0;
        goto LABEL_19;
      }
      id v33 = [v34 unsignedLongLongValue];

      if (v33) {
        goto LABEL_14;
      }
LABEL_20:
      v28 |= v33;
    }
    id v27 = [v25 countByEnumeratingWithState:&v97 objects:v101 count:16];
  }
  while (v27);
LABEL_33:

  int v43 = 0;
  int v42 = 0;
  v13 = v87;
  v12 = v88;
LABEL_34:
  v48 = [(ICSEMainViewController *)self selectedFolder];
  id v49 = v48;
  if (v48)
  {
    id v50 = v48;
  }
  else
  {
    CFStringRef v51 = [(ICSEMainViewController *)self temporaryNewNote];
    id v50 = [v51 folder];
  }
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_1000271EC;
  v92[3] = &unk_1000EEA90;
  v92[4] = self;
  v37 = v12;
  v93 = v37;
  id v52 = v13;
  id v94 = v52;
  id v53 = v50;
  id v95 = v53;
  CFStringRef v54 = objc_retainBlock(v92);
  if (v43)
  {
    id v89 = v52;
    CFStringRef v55 = +[ICCloudConfiguration sharedConfiguration];
    CFStringRef v56 = [v55 maxAttachmentsPerNote];

    uint64_t v57 = [(ICSEMainViewController *)self selectedNote];
    if (!v57
      || (CFStringRef v58 = (void *)v57,
          [(ICSEMainViewController *)self selectedNote],
          v59 = objc_claimAutoreleasedReturnValue(),
          CFStringRef v60 = [v59 visibleTopLevelAttachmentsCount],
          v59,
          v58,
          v60 < v56))
    {
      CFStringRef v61 = [(ICSEMainViewController *)self selectedNote];

      if (v61)
      {
        CFStringRef v62 = [(ICSEMainViewController *)self selectedNote];
        int64_t v63 = v56 - (unsigned char *)[v62 visibleTopLevelAttachmentsCount];

        CFStringRef v64 = +[NSBundle mainBundle];
        v65 = [v64 localizedStringForKey:@"At most %lu more attachments can be added." value:&stru_1000F2510 table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v65, v63);
      }
      else
      {
        CFStringRef v64 = +[NSBundle mainBundle];
        v65 = [v64 localizedStringForKey:@"At most %lu attachments can be added." value:&stru_1000F2510 table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v65, v56);
      uint64_t v80 = };

      v67 = +[NSBundle mainBundle];
      v76 = [v67 localizedStringForKey:@"Too many attachments." value:&stru_1000F2510 table:0];
      goto LABEL_54;
    }
    CFStringRef v66 = +[NSBundle mainBundle];
    v67 = v66;
    CFStringRef v68 = @"Maximum attachments reached.";
LABEL_48:
    v76 = [v66 localizedStringForKey:v68 value:&stru_1000F2510 table:0];
    uint64_t v80 = 0;
    goto LABEL_54;
  }
  if (v42)
  {
    id v89 = v52;
    CFStringRef v66 = +[NSBundle mainBundle];
    v67 = v66;
    CFStringRef v68 = @"Maximum note length reached.";
    goto LABEL_48;
  }
  if (v28)
  {
    id v89 = v52;
    CFStringRef v69 = +[ICCloudConfiguration sharedConfiguration];
    CFStringRef v70 = [v69 maximumAttachmentSizeMB];
    uint64_t v71 = (void)[v70 unsignedLongLongValue] << 20;

    v67 = +[NSByteCountFormatter stringFromByteCount:v71 countStyle:3];
    v72 = [(ICSEMainViewController *)self attachments];
    id v73 = [v72 count];

    v74 = +[NSBundle mainBundle];
    v75 = v74;
    if (v73 == (id)1)
    {
      v76 = [v74 localizedStringForKey:@"Large Attachment." value:&stru_1000F2510 table:0];

      v77 = +[NSBundle mainBundle];
      v78 = v77;
      CFStringRef v79 = @"To add this attachment to your note, you’ll need to make it smaller than %@.";
    }
    else
    {
      v76 = [v74 localizedStringForKey:@"Large Attachments" value:&stru_1000F2510 table:0];

      v77 = +[NSBundle mainBundle];
      v78 = v77;
      CFStringRef v79 = @"Some of these attachments are too large. Each attachment must be smaller than %@.";
    }
    v81 = [v77 localizedStringForKey:v79 value:&stru_1000F2510 table:0];
    uint64_t v80 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v81, v67);

LABEL_54:
    if (v76)
    {
      v82 = +[UIAlertController alertControllerWithTitle:v76 message:v80 preferredStyle:1];
      BOOL v83 = +[NSBundle mainBundle];
      uint64_t v84 = [v83 localizedStringForKey:@"OK" value:&stru_1000F2510 table:0];
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10002758C;
      v90[3] = &unk_1000EEAB8;
      v91 = v54;
      uint64_t v85 = +[UIAlertAction actionWithTitle:v84 style:0 handler:v90];
      [v82 addAction:v85];

      [(ICSEMainViewController *)self presentViewController:v82 animated:1 completion:0];
      id v52 = v89;
      goto LABEL_58;
    }
    id v52 = v89;
  }
  else
  {
    uint64_t v80 = 0;
  }
  v86 = +[ICBackgroundTaskScheduler sharedScheduler];
  [v86 scheduleTask:objc_opt_class() completion:&stru_1000EEAD8];

  v76 = [(ICSEMainViewController *)self rootViewController];
  [v76 dismissWithCompletion:v54];
LABEL_58:

LABEL_59:
}

- (void)titleViewDidTap:(id)a3
{
  if (![(ICSEMainViewController *)self titleViewTapped])
  {
    uint64_t v4 = [(ICSEMainViewController *)self rootViewController];
    BOOL v5 = [v4 tableViewController];
    id v6 = [(ICSEMainViewController *)self selectedNote];
    [v5 pushFolderViewForNote:v6];

    [(ICSEMainViewController *)self setTitleViewTapped:1];
  }
  unsigned __int8 v7 = [(ICSEMainViewController *)self topTextView];
  [v7 resignFirstResponder];

  uint64_t v8 = [(ICSEMainViewController *)self bottomTextView];
  [v8 resignFirstResponder];

  id v9 = [(ICSEMainViewController *)self rootViewController];
  [v9 setIsShowingSearchResults:1 animated:1];
}

- (void)cancel:(id)a3
{
  [(ICSEMainViewController *)self purgeAttachments];

  [(ICSEMainViewController *)self dismissRootViewController];
}

- (void)purgeAttachments
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(ICSEMainViewController *)self attachments];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 deleteTemporaryImageFileIfNecessary];
        id v9 = [v8 attachment];
        objc_super v10 = v9;
        if (v9)
        {
          [v9 purgeAttachmentPreviewImages];
          +[ICAttachment purgeAttachment:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [(ICSEMainViewController *)self setAttachments:0];
  unsigned __int8 v11 = +[ICNoteContext sharedContext];
  [v11 save];
}

- (void)dismissRootViewController
{
  id v3 = [(ICSEMainViewController *)self rootViewController];
  [v3 setDidCancel:1];

  id v4 = [(ICSEMainViewController *)self rootViewController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100027924;
  v5[3] = &unk_1000EE0C0;
  v5[4] = self;
  [v4 dismissWithCompletion:v5];
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v6 = a3;
  id v4 = [(ICSEMainViewController *)self topTextView];
  if (v4 == v6)
  {
    unsigned int v5 = [(ICSEMainViewController *)self isShowingPlaceholderText];

    if (v5) {
      [(ICSEMainViewController *)self showPlaceholderText:0];
    }
  }
  else
  {
  }
  [(ICSEMainViewController *)self scrollTextToVisibleForTextView:v6];
  [v6 becomeFirstResponder];
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSEMainViewController *)self topTextView];

  if (v5 == v4) {
    dispatchMainAfterDelay();
  }
  [v4 resignFirstResponder];
}

- (void)extensionHostDidBecomeActive:(id)a3
{
  if ([(ICSEMainViewController *)self shouldRetrieveLastSelectedNote])
  {
    id v4 = +[ICSharingExtensionAttachmentsManager sharedManager];
    id v6 = [v4 lastNoteSavedTo];

    id v5 = [(ICSEMainViewController *)self selectedFolder];
    -[ICSEMainViewController setSelectionToNote:folder:prefersSystemPaper:](self, "setSelectionToNote:folder:prefersSystemPaper:", v6, v5, [v6 isSystemPaper]);
  }
}

- (void)tableController:(id)a3 didSelectNote:(id)a4 folder:(id)a5 prefersSystemPaper:(BOOL)a6
{
}

- (void)scrollTextToVisibleForTextView:(id)a3
{
  id v4 = a3;
  id v26 = [v4 selectedTextRange];
  id v5 = [v26 start];
  [v4 caretRectForPosition:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  long long v14 = [(ICSEMainViewController *)self scrollView];
  [v14 convertRect:v4 fromView:v7];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  if (!CGRectIsInfinite(v28))
  {
    id v23 = [(ICSEMainViewController *)self scrollView];
    [v23 bounds];
    v30.origin.x = v16;
    v30.origin.y = v18;
    v30.size.width = v20;
    v30.size.height = v22;
    BOOL v24 = CGRectContainsRect(v29, v30);

    if (!v24)
    {
      id v25 = [(ICSEMainViewController *)self scrollView];
      [v25 scrollRectToVisible:1, v16, v18, v20, v22];
    }
  }
}

- (void)attachmentsAvailable
{
  [(ICSEMainViewController *)self showSaveButton];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [(ICSEMainViewController *)self attachments];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v2 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v3 = [v2 attributedContentText];
        id v10 = [v3 length];

        if (v10)
        {
          [(ICSEMainViewController *)self showPlaceholderText:0];
          double v11 = [v2 attributedContentText];
          v2 = [v11 string];
          id v3 = [(ICSEMainViewController *)self topTextView];
          [v3 setText:v2];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v12 = [(ICSEMainViewController *)self attachments];
  double v13 = [v12 firstObject];

  long long v14 = [v13 attachment];

  if (v14)
  {
    [(ICSEMainViewController *)self setLayoutType:1];
    double v15 = [v13 attachment];
    [(ICSEMainViewController *)self installBrickForAttachmentInfo:v13];
    double v16 = [v15 attachmentModel];
    unsigned int v17 = [v16 needToGeneratePreviews];

    if (v17)
    {
      double v18 = dispatch_get_global_queue(0, 0);
      id v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      id v25 = sub_100028178;
      id v26 = &unk_1000EE0E8;
      id v27 = v15;
      CGRect v28 = self;
      dispatch_async(v18, &v23);
    }
    goto LABEL_27;
  }
  double v19 = [v13 attributedContentText];
  if (![v19 length])
  {

LABEL_18:
    double v20 = [v13 mediaUTI];
    if (v20)
    {
      v2 = [v13 mediaUTI];
      id v3 = +[UTType typeWithIdentifier:v2];
      if ([v3 conformsToType:UTTypeImage]) {
        goto LABEL_22;
      }
    }
    double v21 = [v13 mediaUTI];
    if ((+[ICAttachment typeUTIIsPlayableMovie:v21] & 1) == 0)
    {
      double v22 = [v13 image];

      if (v20)
      {
      }
      if (!v22)
      {
        [(ICSEMainViewController *)self setLayoutType:1];
        [(ICSEMainViewController *)self installBrickForAttachmentInfo:v13];
        goto LABEL_28;
      }
      goto LABEL_26;
    }

    if (v20)
    {
LABEL_22:
    }
LABEL_26:
    [(ICSEMainViewController *)self setLayoutType:2];
    double v15 = [(ICSEMainViewController *)self attachments];
    [(ICSEMainViewController *)self installImagesViewForAttachments:v15];
LABEL_27:

    goto LABEL_28;
  }
  v2 = [(ICSEMainViewController *)self attachments];
  id v3 = [v2 count];

  if (v3 != (id)1) {
    goto LABEL_18;
  }
  [(ICSEMainViewController *)self setLayoutType:4];
LABEL_28:
  [(ICSEMainViewController *)self updateTitleFooter];
}

- (void)installBrickForAttachmentInfo:(id)a3
{
  id v35 = a3;
  id v4 = [v35 mediaURL];
  if (v4)
  {
  }
  else
  {
    id v5 = [v35 attachment];

    if (!v5) {
      goto LABEL_5;
    }
  }
  id v6 = [(ICSEMainViewController *)self brickContainer];
  id v7 = [v6 subviews];
  [v7 makeObjectsPerformSelector:"removeFromSuperview"];

  +[ICAttachmentBrickView defaultBrickSize];
  uint64_t v8 = [(ICSEMainViewController *)self brickContainer];
  [v8 bounds];

  id v9 = [objc_alloc((Class)ICAttachmentBrickView) initWithType:3];
  [(ICSEMainViewController *)self setAttachmentBrickView:v9];

  id v10 = [(ICSEMainViewController *)self attachmentBrickView];
  [v10 setShareExtensionAttachmentInfo:v35];

  double v11 = [(ICSEMainViewController *)self attachmentBrickView];
  double v12 = [(ICSEMainViewController *)self brickContainer];
  [v12 addSubview:v11];

  double v13 = [v11 leadingAnchor];
  long long v14 = [(ICSEMainViewController *)self brickContainer];
  double v15 = [v14 leadingAnchor];
  double v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  unsigned int v17 = [v11 topAnchor];
  double v18 = [(ICSEMainViewController *)self brickContainer];
  double v19 = [v18 topAnchor];
  double v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  double v21 = [v11 bottomAnchor];
  double v22 = [(ICSEMainViewController *)self brickContainer];
  id v23 = [v22 bottomAnchor];
  uint64_t v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  id v25 = [v11 widthAnchor];
  id v26 = [(ICSEMainViewController *)self brickContainer];
  id v27 = [v26 widthAnchor];
  CGRect v28 = [v25 constraintLessThanOrEqualToAnchor:v27 multiplier:1.0];

  LODWORD(v29) = 1148829696;
  [v28 setPriority:v29];
  [v28 setActive:1];
  long long v30 = [v11 trailingAnchor];
  long long v31 = [(ICSEMainViewController *)self brickContainer];
  long long v32 = [v31 trailingAnchor];
  id v33 = [v30 constraintEqualToAnchor:v32];

  LODWORD(v34) = 1148682240;
  [v33 setPriority:v34];
  [v33 setActive:1];
  [(ICSEMainViewController *)self updateBrickContainerHeightConstraint];

LABEL_5:
}

- (void)contentSizeCategoryChanged:(id)a3
{
  [(ICSEMainViewController *)self updateTextViewsForContentSizeChangeIfNecessary];
  [(ICSEMainViewController *)self updateTitleViewHeightConstraint];

  [(ICSEMainViewController *)self updateBrickContainerHeightConstraint];
}

- (void)updateTitleViewHeightConstraint
{
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled()) {
    double v3 = 88.0;
  }
  else {
    double v3 = sub_1000051CC();
  }
  id v4 = [(ICSEMainViewController *)self titleViewMinHeightConstraint];
  [v4 setConstant:v3];
}

- (void)updateBrickContainerHeightConstraint
{
  id v6 = [(ICSEMainViewController *)self attachmentBrickView];
  [v6 computedSize];
  double v4 = v3;
  id v5 = [(ICSEMainViewController *)self brickContainerHeightConstraint];
  [v5 setConstant:v4];
}

- (void)setLayoutType:(unint64_t)a3
{
  if (self->_layoutType != a3)
  {
    self->_layoutType = a3;
    [(ICSEMainViewController *)self setUpForLayoutType:"setUpForLayoutType:"];
  }
}

- (void)setUpForLayoutType:(unint64_t)a3
{
  if (a3 - 3 < 2)
  {
    uint64_t v5 = 1;
    double v6 = 64.0;
    uint64_t v4 = 1;
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v5 = 0;
      uint64_t v4 = 1;
    }
    else
    {
      if (a3 == 2)
      {
        uint64_t v4 = 0;
        uint64_t v5 = 1;
        double v6 = 175.0;
        goto LABEL_9;
      }
      uint64_t v5 = 0;
      uint64_t v4 = 0;
    }
    double v6 = 48.0;
  }
LABEL_9:
  [(ICSEMainViewController *)self setBrickViewCollapsed:v5];
  [(ICSEMainViewController *)self setBottomTextViewCollapsed:v5];
  [(ICSEMainViewController *)self setImageViewCollapsed:v4];
  id v7 = [(ICSEMainViewController *)self topTextViewMinHeightConstraint];
  [v7 setConstant:v6];
}

- (void)setImageViewCollapsed:(BOOL)a3
{
  self->_BOOL imageViewCollapsed = a3;
  if (a3) {
    float v4 = 999.0;
  }
  else {
    float v4 = 1.0;
  }
  uint64_t v5 = [(ICSEMainViewController *)self imageCollapsibleZeroWidthConstraint];
  *(float *)&double v6 = v4;
  [v5 setPriority:v6];

  BOOL imageViewCollapsed = self->_imageViewCollapsed;
  id v8 = [(ICSEMainViewController *)self imagesView];
  [v8 setHidden:imageViewCollapsed];
}

- (void)setBrickViewCollapsed:(BOOL)a3
{
  self->_BOOL brickViewCollapsed = a3;
  if (a3) {
    float v4 = 999.0;
  }
  else {
    float v4 = 1.0;
  }
  uint64_t v5 = [(ICSEMainViewController *)self brickCollapsibleZeroHeightConstraint];
  *(float *)&double v6 = v4;
  [v5 setPriority:v6];

  BOOL brickViewCollapsed = self->_brickViewCollapsed;
  id v8 = [(ICSEMainViewController *)self brickContainer];
  [v8 setHidden:brickViewCollapsed];
}

- (void)setBottomTextViewCollapsed:(BOOL)a3
{
  self->_BOOL bottomTextViewCollapsed = a3;
  if (a3) {
    float v4 = 999.0;
  }
  else {
    float v4 = 1.0;
  }
  uint64_t v5 = [(ICSEMainViewController *)self bottomTextviewCollapsibleZeroHeightConstraint];
  *(float *)&double v6 = v4;
  [v5 setPriority:v6];

  BOOL bottomTextViewCollapsed = self->_bottomTextViewCollapsed;
  id v8 = [(ICSEMainViewController *)self bottomTextView];
  [v8 setHidden:bottomTextViewCollapsed];
}

- (ICSERootViewController)rootViewController
{
  v2 = [(ICSEMainViewController *)self containerViewController];
  double v3 = [v2 rootViewController];

  return (ICSERootViewController *)v3;
}

- (void)showPlaceholderText:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICSEMainViewController *)self isShowingPlaceholderText] != a3)
  {
    [(ICSEMainViewController *)self setShowingPlaceholderText:v3];
    id v10 = +[UIColor labelColor];
    if ([(ICSEMainViewController *)self isShowingPlaceholderText])
    {
      uint64_t v5 = +[NSBundle mainBundle];
      double v6 = [v5 localizedStringForKey:@"Add text to your note…" value:&stru_1000F2510 table:0];
      id v7 = [(ICSEMainViewController *)self topTextView];
      [v7 setText:v6];

      if (+[UIDevice ic_isVision]) {
        +[UIColor secondaryLabelColor];
      }
      else {
        +[UIColor tertiaryLabelColor];
      }
      id v8 = v10;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = [(ICSEMainViewController *)self topTextView];
      [v8 setText:&stru_1000F2510];
    }

    id v9 = [(ICSEMainViewController *)self topTextView];
    [v9 setTextColor:v10];
  }
}

- (void)updateTextViewsForContentSizeChangeIfNecessary
{
  BOOL v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  float v4 = [v3 ic_fontWithSingleLineA];
  uint64_t v5 = [(ICSEMainViewController *)self topTextView];
  [v5 setFont:v4];

  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  double v6 = [v8 ic_fontWithSingleLineA];
  id v7 = [(ICSEMainViewController *)self bottomTextView];
  [v7 setFont:v6];
}

- (void)installImagesViewForAttachments:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028D00;
  v7[3] = &unk_1000EE0E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  BOOL v3 = [(ICSEMainViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  return v5;
}

- (double)topInsetForResizer:(id)a3
{
  BOOL v3 = [(ICSEMainViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  return v5;
}

- (BOOL)keyboardResizerAutoscrollAboveKeyboard
{
  return 1;
}

- (ICSEContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ICSEContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (UITextView)topTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topTextView);

  return (UITextView *)WeakRetained;
}

- (void)setTopTextView:(id)a3
{
}

- (UITextView)bottomTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomTextView);

  return (UITextView *)WeakRetained;
}

- (void)setBottomTextView:(id)a3
{
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (ICNote)selectedNote
{
  return self->_selectedNote;
}

- (void)setSelectedNote:(id)a3
{
}

- (ICFolder)selectedFolder
{
  return self->_selectedFolder;
}

- (void)setSelectedFolder:(id)a3
{
}

- (ICNote)temporaryNewNote
{
  return self->_temporaryNewNote;
}

- (void)setTemporaryNewNote:(id)a3
{
}

- (BOOL)prefersSystemPaper
{
  return self->_prefersSystemPaper;
}

- (void)setPrefersSystemPaper:(BOOL)a3
{
  self->_prefersSystemPaper = a3;
}

- (NSString)lastSelectedNoteIdentifier
{
  return self->_lastSelectedNoteIdentifier;
}

- (void)setLastSelectedNoteIdentifier:(id)a3
{
}

- (NSString)lastSelectedFolderIdentifier
{
  return self->_lastSelectedFolderIdentifier;
}

- (void)setLastSelectedFolderIdentifier:(id)a3
{
}

- (UILabel)saveToHeaderLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_saveToHeaderLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSaveToHeaderLabel:(id)a3
{
}

- (UIView)brickContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brickContainer);

  return (UIView *)WeakRetained;
}

- (void)setBrickContainer:(id)a3
{
}

- (UIView)titleHeaderView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleHeaderView);

  return (UIView *)WeakRetained;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (UIView)titleViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleViewContainer);

  return (UIView *)WeakRetained;
}

- (void)setTitleViewContainer:(id)a3
{
}

- (UIView)titleFooterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleFooterView);

  return (UIView *)WeakRetained;
}

- (void)setTitleFooterView:(id)a3
{
}

- (UIView)contentViewTopSeparator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewTopSeparator);

  return (UIView *)WeakRetained;
}

- (void)setContentViewTopSeparator:(id)a3
{
}

- (UIView)contentViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewContainer);

  return (UIView *)WeakRetained;
}

- (void)setContentViewContainer:(id)a3
{
}

- (UILabel)titleFooterLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleFooterLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleFooterLabel:(id)a3
{
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
}

- (ICSEImagesView)imagesView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imagesView);

  return (ICSEImagesView *)WeakRetained;
}

- (void)setImagesView:(id)a3
{
}

- (ICSENoteTitleView)titleView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleView);

  return (ICSENoteTitleView *)WeakRetained;
}

- (void)setTitleView:(id)a3
{
}

- (BOOL)titleViewTapped
{
  return self->_titleViewTapped;
}

- (void)setTitleViewTapped:(BOOL)a3
{
  self->_titleViewTapped = a3;
}

- (BOOL)isSaving
{
  return self->_isSaving;
}

- (void)setIsSaving:(BOOL)a3
{
  self->_isSaving = a3;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIBarButtonItem)activityIndicatorBarButtonItem
{
  return self->_activityIndicatorBarButtonItem;
}

- (void)setActivityIndicatorBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)saveToNoteBarButtonItem
{
  return self->_saveToNoteBarButtonItem;
}

- (void)setSaveToNoteBarButtonItem:(id)a3
{
}

- (BOOL)isShowingPlaceholderText
{
  return self->_showingPlaceholderText;
}

- (void)setShowingPlaceholderText:(BOOL)a3
{
  self->_showingPlaceholderText = a3;
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAttachments:(id)a3
{
}

- (BOOL)brickViewCollapsed
{
  return self->_brickViewCollapsed;
}

- (BOOL)imageViewCollapsed
{
  return self->_imageViewCollapsed;
}

- (BOOL)bottomTextViewCollapsed
{
  return self->_bottomTextViewCollapsed;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (NSLayoutConstraint)brickCollapsibleZeroHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brickCollapsibleZeroHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBrickCollapsibleZeroHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageCollapsibleZeroWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageCollapsibleZeroWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setImageCollapsibleZeroWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomTextviewCollapsibleZeroHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomTextviewCollapsibleZeroHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomTextviewCollapsibleZeroHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)topTextViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topTextViewTopConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTopTextViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)topTextViewMinHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topTextViewMinHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTopTextViewMinHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomTextViewMinHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomTextViewMinHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomTextViewMinHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomTextViewBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomTextViewBottomConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBottomTextViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)brickContainerHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brickContainerHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBrickContainerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleViewMinHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleViewMinHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTitleViewMinHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleFooterViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleFooterViewHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTitleFooterViewHeightConstraint:(id)a3
{
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (void)setScrollViewResizer:(id)a3
{
}

- (ICRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (void)setRegulatoryLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_scrollViewResizer, 0);
  objc_destroyWeak((id *)&self->_titleFooterViewHeightConstraint);
  objc_destroyWeak((id *)&self->_titleViewMinHeightConstraint);
  objc_destroyWeak((id *)&self->_brickContainerHeightConstraint);
  objc_destroyWeak((id *)&self->_bottomTextViewBottomConstraint);
  objc_destroyWeak((id *)&self->_bottomTextViewMinHeightConstraint);
  objc_destroyWeak((id *)&self->_topTextViewMinHeightConstraint);
  objc_destroyWeak((id *)&self->_topTextViewTopConstraint);
  objc_destroyWeak((id *)&self->_bottomTextviewCollapsibleZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_imageCollapsibleZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_brickCollapsibleZeroHeightConstraint);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_saveToNoteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_titleView);
  objc_destroyWeak((id *)&self->_imagesView);
  objc_storeStrong((id *)&self->_attachmentBrickView, 0);
  objc_destroyWeak((id *)&self->_titleFooterLabel);
  objc_destroyWeak((id *)&self->_contentViewContainer);
  objc_destroyWeak((id *)&self->_contentViewTopSeparator);
  objc_destroyWeak((id *)&self->_titleFooterView);
  objc_destroyWeak((id *)&self->_titleViewContainer);
  objc_destroyWeak((id *)&self->_titleHeaderView);
  objc_destroyWeak((id *)&self->_brickContainer);
  objc_destroyWeak((id *)&self->_saveToHeaderLabel);
  objc_storeStrong((id *)&self->_lastSelectedFolderIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSelectedNoteIdentifier, 0);
  objc_storeStrong((id *)&self->_temporaryNewNote, 0);
  objc_storeStrong((id *)&self->_selectedFolder, 0);
  objc_storeStrong((id *)&self->_selectedNote, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_destroyWeak((id *)&self->_bottomTextView);
  objc_destroyWeak((id *)&self->_topTextView);
  objc_destroyWeak((id *)&self->_scrollView);

  objc_destroyWeak((id *)&self->_containerViewController);
}

@end