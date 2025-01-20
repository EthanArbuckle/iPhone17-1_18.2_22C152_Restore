@interface PPKPhotoEditingViewController
- (BOOL)_shouldShowUndoRedoButtonsInNavigationBar;
- (BOOL)canHandleAdjustmentData:(id)a3;
- (BOOL)isWritingOutputDoNotTearDown;
- (BOOL)shouldShowCancelConfirmation;
- (PHContentEditingInput)input;
- (PPKMarkupViewController)markupVC;
- (void)_updateUndoRedoButtons;
- (void)cancelContentEditing;
- (void)finishContentEditingWithCompletionHandler:(id)a3;
- (void)markupViewController:(id)a3 didChangeShowingSignaturesUI:(BOOL)a4;
- (void)setInput:(id)a3;
- (void)setIsWritingOutputDoNotTearDown:(BOOL)a3;
- (void)setMarkupVC:(id)a3;
- (void)startContentEditingWithInput:(id)a3 placeholderImage:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PPKPhotoEditingViewController

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)PPKPhotoEditingViewController;
  [(PPKPhotoEditingViewController *)&v21 viewDidLoad];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v2 = (void *)qword_100008A98;
  uint64_t v26 = qword_100008A98;
  if (!qword_100008A98)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100002418;
    v22[3] = &unk_100004210;
    v22[4] = &v23;
    sub_100002418((uint64_t)v22);
    v2 = (void *)v24[3];
  }
  v3 = v2;
  _Block_object_dispose(&v23, 8);
  id v4 = [[v3 alloc] initWithImageAnalysisEnabled:0];
  [v4 setAnnotationEditingEnabled:0];
  [v4 setPencilAlwaysDraws:1];
  [v4 setDelegate:self];
  [(PPKPhotoEditingViewController *)self setMarkupVC:v4];
  [(PPKPhotoEditingViewController *)self addChildViewController:v4];
  v5 = [v4 view];
  v6 = [(PPKPhotoEditingViewController *)self view];
  [v6 addSubview:v5];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [v5 topAnchor];
  v18 = [v6 topAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v27[0] = v17;
  v16 = [v5 bottomAnchor];
  v15 = [v6 bottomAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v27[1] = v14;
  v7 = [v5 leftAnchor];
  v8 = [v6 leftAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v27[2] = v9;
  v10 = [v5 rightAnchor];
  v11 = [v6 rightAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v27[3] = v12;
  v13 = +[NSArray arrayWithObjects:v27 count:4];
  +[NSLayoutConstraint activateConstraints:v13];

  [v4 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPKPhotoEditingViewController;
  [(PPKPhotoEditingViewController *)&v4 viewWillAppear:a3];
  [(PPKPhotoEditingViewController *)self _updateUndoRedoButtons];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPKPhotoEditingViewController;
  [(PPKPhotoEditingViewController *)&v4 traitCollectionDidChange:a3];
  [(PPKPhotoEditingViewController *)self _updateUndoRedoButtons];
}

- (BOOL)canHandleAdjustmentData:(id)a3
{
  v3 = [a3 formatIdentifier];
  if ([v3 isEqualToString:@"com.apple.Markup"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.PaperKit.Markup"];
  }

  return v4;
}

- (void)startContentEditingWithInput:(id)a3 placeholderImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PPKPhotoEditingViewController *)self setInput:v6];
  v8 = [v6 adjustmentData];
  v9 = [v8 data];

  v10 = [(PPKPhotoEditingViewController *)self markupVC];
  [v10 setAnnotationEditingEnabled:1];

  v11 = [(PPKPhotoEditingViewController *)self markupVC];
  v12 = [v6 fullSizeImageURL];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100001C04;
  v14[3] = &unk_100004198;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [v11 loadWithURL:v12 archivedModelData:v9 placeholderImage:v7 completionHandler:v14];
}

- (void)finishContentEditingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(PPKPhotoEditingViewController *)self setIsWritingOutputDoNotTearDown:1];
  v5 = [(PPKPhotoEditingViewController *)self markupVC];
  [v5 setAnnotationEditingEnabled:0];

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001D9C;
  v8[3] = &unk_1000041E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (BOOL)shouldShowCancelConfirmation
{
  return 0;
}

- (void)cancelContentEditing
{
  v3 = [(PPKPhotoEditingViewController *)self markupVC];
  [v3 setAnnotationEditingEnabled:0];

  if (![(PPKPhotoEditingViewController *)self isWritingOutputDoNotTearDown])
  {
    id v4 = [(PPKPhotoEditingViewController *)self markupVC];
    [v4 documentDidCloseTeardown];
  }
}

- (void)markupViewController:(id)a3 didChangeShowingSignaturesUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(PPKPhotoEditingViewController *)self extensionContext];
  if (objc_opt_respondsToSelector()) {
    [v5 setHideNavigationController:v4];
  }
}

- (BOOL)_shouldShowUndoRedoButtonsInNavigationBar
{
  v3 = [(PPKPhotoEditingViewController *)self traitCollection];
  if ([v3 horizontalSizeClass] == (id)1)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PPKPhotoEditingViewController *)self traitCollection];
    BOOL v4 = [v5 userInterfaceIdiom] == 0;
  }
  return v4;
}

- (void)_updateUndoRedoButtons
{
  id v5 = [(PPKPhotoEditingViewController *)self extensionContext];
  sub_1000015A8();
  if (objc_opt_isKindOfClass())
  {
    if ([(PPKPhotoEditingViewController *)self _shouldShowUndoRedoButtonsInNavigationBar])
    {
      v3 = [(PPKPhotoEditingViewController *)self markupVC];
      BOOL v4 = [v3 undoManager];
      [v5 setUndoManagerForBarButtons:v4];
    }
    else
    {
      [v5 setUndoManagerForBarButtons:0];
    }
  }
}

- (PHContentEditingInput)input
{
  return (PHContentEditingInput *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInput:(id)a3
{
}

- (BOOL)isWritingOutputDoNotTearDown
{
  return self->_isWritingOutputDoNotTearDown;
}

- (void)setIsWritingOutputDoNotTearDown:(BOOL)a3
{
  self->_isWritingOutputDoNotTearDown = a3;
}

- (PPKMarkupViewController)markupVC
{
  return self->_markupVC;
}

- (void)setMarkupVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markupVC, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end