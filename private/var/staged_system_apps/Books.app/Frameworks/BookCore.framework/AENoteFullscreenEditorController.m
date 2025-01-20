@interface AENoteFullscreenEditorController
- (AEAnnotation)annotation;
- (AEAnnotationEditorDelegate)delegate;
- (AEAnnotationTheme)annotationTheme;
- (AEHighlightedTextLabel)highlightedTextLabel;
- (AENoteFullscreenEditorController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)editsOnLaunch;
- (BOOL)keyboardVisible;
- (BOOL)shouldDim;
- (CGRect)highlightColorBarFrame;
- (CGRect)highlightedTextLabelFrame;
- (CGSize)scrollViewContentSize;
- (IMPassthroughView)dimmingOverlayView;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)scrollViewScrollerInsets;
- (UIFont)highlightedTextFont;
- (UILabel)dateLabel;
- (UIScrollView)scrollView;
- (UITextView)textView;
- (UIToolbar)toolbar;
- (UIView)highlightColorBar;
- (double)layoutManager:(id)a3 lineSpacingAfterGlyphAtIndex:(unint64_t)a4 withProposedLineFragmentRect:(CGRect)a5;
- (id)keyCommands;
- (int64_t)positionForBar:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setupToolbarForMacCatalyst:(BOOL)a3;
- (void)_updateColors;
- (void)dealloc;
- (void)doneButtonPressed:(id)a3;
- (void)hide;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)p_ensureTextViewLayout;
- (void)p_revealTextViewCursorAnimated:(BOOL)a3;
- (void)releaseViews;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAnnotation:(id)a3;
- (void)setAnnotationTheme:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingOverlayView:(id)a3;
- (void)setEditsOnLaunch:(BOOL)a3;
- (void)setHighlightColorBar:(id)a3;
- (void)setHighlightedTextFont:(id)a3;
- (void)setHighlightedTextLabel:(id)a3;
- (void)setKeyboardVisible:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setShouldDim:(BOOL)a3;
- (void)setTextView:(id)a3;
- (void)setTheme:(id)a3;
- (void)setToolbar:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)updateScrollViewContent;
- (void)updateTextViewFrame;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AENoteFullscreenEditorController

- (void)dealloc
{
  [(AENoteFullscreenEditorController *)self releaseViews];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIKeyboardWillHideNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)AENoteFullscreenEditorController;
  [(IMViewController *)&v5 dealloc];
}

- (void)releaseViews
{
  toolbar = self->_toolbar;
  self->_toolbar = 0;

  highlightedTextLabel = self->_highlightedTextLabel;
  self->_highlightedTextLabel = 0;

  objc_super v5 = [(UIScrollView *)self->_scrollView delegate];

  if (v5 == self) {
    [(UIScrollView *)self->_scrollView setDelegate:0];
  }
  scrollView = self->_scrollView;
  self->_scrollView = 0;

  v7 = [(UITextView *)self->_textView delegate];

  if (v7 == self) {
    [(UITextView *)self->_textView setDelegate:0];
  }
  textView = self->_textView;
  self->_textView = 0;

  dimmingOverlayView = self->_dimmingOverlayView;
  self->_dimmingOverlayView = 0;

  v10.receiver = self;
  v10.super_class = (Class)AENoteFullscreenEditorController;
  [(IMViewController *)&v10 releaseViews];
}

- (void)hide
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)AENoteFullscreenEditorController;
  [(IMViewController *)&v17 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  [(AENoteFullscreenEditorController *)self updateScrollViewContent];
  if ([(AENoteFullscreenEditorController *)self shouldDim])
  {
    v6 = [IMPassthroughView alloc];
    v7 = [(AENoteFullscreenEditorController *)self view];
    [v7 bounds];
    v8 = -[IMPassthroughView initWithFrame:](v6, "initWithFrame:");
    dimmingOverlayView = self->_dimmingOverlayView;
    self->_dimmingOverlayView = v8;

    objc_super v10 = [(AENoteFullscreenEditorController *)self dimmingOverlayView];
    [v10 setAutoresizingMask:18];

    v11 = +[UIColor colorWithWhite:0.0 alpha:0.2];
    v12 = [(AENoteFullscreenEditorController *)self dimmingOverlayView];
    [v12 setBackgroundColor:v11];

    v13 = [(AENoteFullscreenEditorController *)self dimmingOverlayView];
    [v13 setAcceptsHits:0];

    v14 = [(AENoteFullscreenEditorController *)self view];
    v15 = [(AENoteFullscreenEditorController *)self dimmingOverlayView];
    [v14 addSubview:v15];
  }
  v16 = [(AENoteFullscreenEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v16 willShowAnnotationEditor:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(AENoteFullscreenEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didShowAnnotationEditor:self];
  }
  v7.receiver = self;
  v7.super_class = (Class)AENoteFullscreenEditorController;
  [(AENoteFullscreenEditorController *)&v7 viewDidAppear:v3];
  if ([(AENoteFullscreenEditorController *)self editsOnLaunch])
  {
    v6 = [(AENoteFullscreenEditorController *)self textView];
    [v6 becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AENoteFullscreenEditorController;
  [(AENoteFullscreenEditorController *)&v5 viewWillDisappear:a3];
  [(UITextView *)self->_textView resignFirstResponder];
  v4 = [(AENoteFullscreenEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 willHideAnnotationEditor:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(AENoteFullscreenEditorController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didHideAnnotationEditor:self];
  }
  v8.receiver = self;
  v8.super_class = (Class)AENoteFullscreenEditorController;
  [(IMViewController *)&v8 viewDidDisappear:v3];
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:UIKeyboardWillHideNotification object:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AENoteFullscreenEditorController;
  id v7 = a4;
  -[IMViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_13F11C;
  v8[3] = &unk_2C3BE0;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)_setupToolbarForMacCatalyst:(BOOL)a3
{
  id v4 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
  objc_super v9 = IMCommonCoreBundle();
  objc_super v10 = [v9 localizedStringForKey:@"Note_Editor_Title" value:@"Note" table:@"BCCommonCoreLocalizable"];
  [v8 setText:v10];

  v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v8 setFont:v11];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 sizeToFit];
  v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  v13 = [(AENoteFullscreenEditorController *)self annotation];
  v14 = [v13 annotationModificationDate];
  v59 = self;
  v15 = [(AENoteFullscreenEditorController *)self annotation];
  v16 = v15;
  if (v14) {
    [v15 annotationModificationDate];
  }
  else {
  uint64_t v17 = [v15 annotationCreationDate];
  }

  v18 = +[NSDate mailLikeDescriptionFromDate:v17];
  [(UILabel *)v12 setText:v18];

  v56 = (void *)v17;
  v19 = +[NSDate accessibleMailLikeDescriptionFromDate:v17];
  [(UILabel *)v12 setAccessibilityLabel:v19];

  v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [(UILabel *)v12 setFont:v20];

  [(UILabel *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v12 sizeToFit];
  id v21 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 addSubview:v8];
  [v21 addSubview:v12];
  v54 = [v8 leadingAnchor];
  v55 = [v21 layoutMarginsGuide];
  v53 = [v55 leadingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v61[0] = v52;
  v50 = [v8 topAnchor];
  v51 = [v21 safeAreaLayoutGuide];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v61[1] = v48;
  v46 = [v8 bottomAnchor];
  v47 = [v21 safeAreaLayoutGuide];
  v45 = [v47 bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v61[2] = v44;
  v43 = [(UILabel *)v12 leadingAnchor];
  v60 = v8;
  v42 = [v8 trailingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:5.0];
  v61[3] = v41;
  v39 = [(UILabel *)v12 trailingAnchor];
  v40 = [v21 layoutMarginsGuide];
  v38 = [v40 trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v61[4] = v37;
  v22 = [(UILabel *)v12 topAnchor];
  v23 = [v21 safeAreaLayoutGuide];
  v24 = [v23 topAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v61[5] = v25;
  v57 = v12;
  v26 = [(UILabel *)v12 bottomAnchor];
  v27 = [v21 safeAreaLayoutGuide];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v61[6] = v29;
  v30 = +[NSArray arrayWithObjects:v61 count:7];
  [v21 addConstraints:v30];

  id v31 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v21];
  id v32 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v33 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v31, v32, 0);
  if (!a3)
  {
    id v34 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v59 action:"doneButtonPressed:"];
    [v33 addObject:v34];
  }
  v35 = [(AENoteFullscreenEditorController *)v59 toolbar];
  [v35 setItems:v33];

  dateLabel = v59->_dateLabel;
  v59->_dateLabel = v57;
}

- (AENoteFullscreenEditorController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AENoteFullscreenEditorController;
  id v4 = [(IMViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    objc_super v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(AENoteFullscreenEditorController *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)viewDidLoad
{
  v117.receiver = self;
  v117.super_class = (Class)AENoteFullscreenEditorController;
  [(AENoteFullscreenEditorController *)&v117 viewDidLoad];
  uint64_t v3 = [(AENoteFullscreenEditorController *)self highlightedTextFont];
  if (!v3)
  {
    uint64_t v3 = +[UIFont systemFontOfSize:17.0];
  }
  v116 = (void *)v3;
  id v4 = objc_alloc((Class)UIScrollView);
  objc_super v5 = [(AENoteFullscreenEditorController *)self view];
  [v5 bounds];
  id v6 = (UIScrollView *)[v4 initWithFrame:];
  scrollView = self->_scrollView;
  self->_scrollView = v6;

  objc_super v8 = [(AENoteFullscreenEditorController *)self scrollView];
  [v8 setDelegate:self];

  objc_super v9 = [(AENoteFullscreenEditorController *)self scrollView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v10 = [(AENoteFullscreenEditorController *)self scrollView];
  [v10 setOpaque:1];

  [(AENoteFullscreenEditorController *)self scrollViewScrollerInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(AENoteFullscreenEditorController *)self scrollView];
  [v19 setScrollIndicatorInsets:v12, v14, v16, v18];

  [(AENoteFullscreenEditorController *)self scrollViewScrollerInsets];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(AENoteFullscreenEditorController *)self scrollView];
  [v28 setContentInset:v21, v23, v25, v27];

  v29 = [AEHighlightedTextLabel alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v33 = -[AEHighlightedTextLabel initWithFrame:generateHighlight:generateHighlightAsynchronously:](v29, "initWithFrame:generateHighlight:generateHighlightAsynchronously:", 0, 0, CGRectZero.origin.x, y, width, height);
  highlightedTextLabel = self->_highlightedTextLabel;
  self->_highlightedTextLabel = v33;

  [(AEHighlightedTextLabel *)self->_highlightedTextLabel setUseSelectedText:1];
  v35 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v35 setAutoresizingMask:34];

  v36 = [(AENoteFullscreenEditorController *)self annotation];
  v37 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v37 setAnnotation:v36];

  v38 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v38 setFont:v3];

  v39 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v39 setOpaque:1];

  v40 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v40 setNumberOfLines:3];

  v41 = (UIView *)objc_alloc_init((Class)UIView);
  highlightColorBar = self->_highlightColorBar;
  self->_highlightColorBar = v41;

  v43 = (UITextView *)objc_alloc_init((Class)UITextView);
  textView = self->_textView;
  self->_textView = v43;

  v45 = [(AENoteFullscreenEditorController *)self textView];
  [v45 setAutoresizingMask:18];

  v46 = [(AENoteFullscreenEditorController *)self textView];
  [v46 setScrollEnabled:0];

  v47 = [(AENoteFullscreenEditorController *)self textView];
  [v47 setDelegate:self];

  v48 = +[UIFont boldSystemFontOfSize:15.0];
  v49 = [(AENoteFullscreenEditorController *)self textView];
  [v49 setFont:v48];

  v50 = [(AENoteFullscreenEditorController *)self textView];
  v51 = [v50 layoutManager];
  [v51 setDelegate:self];

  v52 = [(AENoteFullscreenEditorController *)self annotation];
  v53 = [v52 annotationNote];
  v54 = [(AENoteFullscreenEditorController *)self textView];
  [v54 setText:v53];

  v55 = IMCommonCoreBundle();
  v115 = [v55 localizedStringForKey:@"Note_Editor_Placeholder" value:@"Add a note…" table:@"BCCommonCoreLocalizable"];

  id v56 = [objc_alloc((Class)NSAttributedString) initWithString:v115];
  v57 = [(AENoteFullscreenEditorController *)self textView];
  [v57 setAttributedPlaceholder:v56];

  v58 = [(AENoteFullscreenEditorController *)self scrollView];
  v59 = [(AENoteFullscreenEditorController *)self textView];
  [v58 addSubview:v59];

  v60 = [(AENoteFullscreenEditorController *)self scrollView];
  v61 = [(AENoteFullscreenEditorController *)self highlightColorBar];
  [v60 addSubview:v61];

  v62 = [(AENoteFullscreenEditorController *)self scrollView];
  v63 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v62 addSubview:v63];

  v64 = [(AENoteFullscreenEditorController *)self view];
  v65 = [(AENoteFullscreenEditorController *)self scrollView];
  [v64 addSubview:v65];

  v66 = [objc_alloc((Class)UIToolbar) initWithFrame:CGRectZero.origin.x, y, width, height];
  toolbar = self->_toolbar;
  self->_toolbar = v66;

  v68 = [(AENoteFullscreenEditorController *)self toolbar];
  [v68 sizeToFit];

  [(UIToolbar *)self->_toolbar setTranslatesAutoresizingMaskIntoConstraints:0];
  v69 = [(AENoteFullscreenEditorController *)self toolbar];
  [v69 setTranslucent:0];

  v70 = [(AENoteFullscreenEditorController *)self toolbar];
  [v70 setDelegate:self];

  [(AENoteFullscreenEditorController *)self _setupToolbarForMacCatalyst:0];
  v71 = [(AENoteFullscreenEditorController *)self view];
  v72 = [(AENoteFullscreenEditorController *)self toolbar];
  [v71 addSubview:v72];

  id v73 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v73 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v71 addSubview:v73];
  [v73 setHidden:1];
  v74 = v73;
  v75 = [v73 heightAnchor];
  v76 = [v75 constraintEqualToConstant:0.0];
  v119 = v76;
  v77 = +[NSArray arrayWithObjects:&v119 count:1];
  +[NSLayoutConstraint activateConstraints:v77];

  v114 = [(UIToolbar *)self->_toolbar leftAnchor];
  v113 = [v71 leftAnchor];
  v112 = [v114 constraintEqualToAnchor:v113];
  v118[0] = v112;
  v111 = [(UIToolbar *)self->_toolbar rightAnchor];
  v110 = [v71 rightAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v118[1] = v109;
  v107 = [(UIToolbar *)self->_toolbar topAnchor];
  v108 = [v71 safeAreaLayoutGuide];
  v106 = [v108 topAnchor];
  v105 = [v107 constraintEqualToAnchor:v106];
  v118[2] = v105;
  v103 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v104 = [v71 safeAreaLayoutGuide];
  v102 = [v104 leadingAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v118[3] = v101;
  v99 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v100 = [v71 safeAreaLayoutGuide];
  v98 = [v100 trailingAnchor];
  v95 = [v99 constraintEqualToAnchor:v98];
  v118[4] = v95;
  v94 = [(UIScrollView *)self->_scrollView topAnchor];
  v93 = [(UIToolbar *)self->_toolbar bottomAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v118[5] = v92;
  v91 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v78 = v74;
  v90 = [v74 topAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v118[6] = v89;
  v88 = [v74 leadingAnchor];
  v79 = [v71 leadingAnchor];
  v80 = [v88 constraintEqualToAnchor:v79];
  v118[7] = v80;
  v97 = v78;
  v81 = [v78 trailingAnchor];
  v96 = v71;
  v82 = [v71 trailingAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  v118[8] = v83;
  v84 = [v78 bottomAnchor];
  v85 = [v71 bottomAnchor];
  v86 = [v84 constraintEqualToAnchor:v85];
  v118[9] = v86;
  v87 = +[NSArray arrayWithObjects:v118 count:10];
  +[NSLayoutConstraint activateConstraints:v87];

  [(AENoteFullscreenEditorController *)self updateScrollViewContent];
  [(AENoteFullscreenEditorController *)self _updateColors];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AENoteFullscreenEditorController;
  [(AENoteFullscreenEditorController *)&v13 viewDidLayoutSubviews];
  uint64_t v3 = [(AENoteFullscreenEditorController *)self toolbar];
  [v3 sizeToFit];

  [(AENoteFullscreenEditorController *)self updateScrollViewContent];
  [(AENoteFullscreenEditorController *)self scrollViewScrollerInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(AENoteFullscreenEditorController *)self scrollView];
  [v12 setContentInset:v5, v7, v9, v11];
}

- (id)keyCommands
{
  v9.receiver = self;
  v9.super_class = (Class)AENoteFullscreenEditorController;
  v2 = [(AENoteFullscreenEditorController *)&v9 keyCommands];
  id v3 = [v2 mutableCopy];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSMutableArray array];
  }
  double v6 = v5;

  double v7 = +[UIKeyCommand commandWithTitle:&stru_2CE418 image:0 action:"doneButtonPressed:" input:@"\r" modifierFlags:0x100000 propertyList:0];
  [v6 addObject:v7];

  return v6;
}

- (void)setTheme:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AENoteFullscreenEditorController;
  [(IMViewController *)&v4 setTheme:a3];
  [(AENoteFullscreenEditorController *)self _updateColors];
}

- (void)_updateColors
{
  id v26 = [(IMViewController *)self themePage];
  id v3 = [(AENoteFullscreenEditorController *)self annotation];
  id v4 = [v3 annotationStyle];
  id v5 = [v26 annotationPageTheme];
  double v6 = [(AENoteFullscreenEditorController *)self annotation];
  double v7 = +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v4, v5, [v6 annotationIsUnderline]);

  double v8 = [v26 backgroundColorForTraitEnvironment:self];
  objc_super v9 = [(AENoteFullscreenEditorController *)self viewIfLoaded];
  double v10 = [v26 keyColor];
  [v9 setTintColor:v10];

  [v9 setBackgroundColor:v8];
  double v11 = [(AENoteFullscreenEditorController *)self scrollView];
  [v11 setBackgroundColor:v8];

  double v12 = [v26 primaryTextColor];
  objc_super v13 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v13 setTextColor:v12];
  [v13 setShouldInvertContent:[v26 shouldInvertContent]];
  [v13 setAnnotationBlendMode:[v26 annotationBlendMode]];
  [v13 setHighlightedAnnotationBlendMode:[v26 highlightedAnnotationBlendMode]];
  [v13 setPageTheme:[v26 annotationPageTheme]];
  [v13 setBackgroundColor:v8];
  double v14 = [(AENoteFullscreenEditorController *)self textView];
  [v14 setBackgroundColor:v8];

  double v15 = [(AENoteFullscreenEditorController *)self textView];
  [v15 setTextColor:v12];

  double v16 = [v7 notesSidebarBarColor];
  double v17 = [(IMViewController *)self theme];
  double v18 = [v16 bkaxAdjustedForIncreaseContrastAdjustingDarker:[v17 shouldInvertContent] ^ 1];
  v19 = [(AENoteFullscreenEditorController *)self highlightColorBar];
  [v19 setBackgroundColor:v18];

  double v20 = [(AENoteFullscreenEditorController *)self toolbar];
  [v20 setBarTintColor:v8];

  double v21 = +[UITraitCollection currentTraitCollection];
  double v22 = (char *)[v21 accessibilityContrast];

  if (v22 == (unsigned char *)&def_7D91C + 1) {
    [v26 primaryTextColor];
  }
  else {
  double v23 = [v26 secondaryTextColor];
  }
  double v24 = [(AENoteFullscreenEditorController *)self dateLabel];
  [v24 setTextColor:v23];

  double v25 = [(AENoteFullscreenEditorController *)self textView];
  [v26 stylizeKeyboard:v25];
}

- (int64_t)positionForBar:(id)a3
{
  id v4 = a3;
  id v5 = [(AENoteFullscreenEditorController *)self toolbar];

  if (v5 == v4) {
    return 3;
  }
  else {
    return 0;
  }
}

- (double)layoutManager:(id)a3 lineSpacingAfterGlyphAtIndex:(unint64_t)a4 withProposedLineFragmentRect:(CGRect)a5
{
  return 5.0;
}

- (void)doneButtonPressed:(id)a3
{
}

- (void)textViewDidChangeSelection:(id)a3
{
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v7 = [(AENoteFullscreenEditorController *)self delegate];
  id v5 = [(AENoteFullscreenEditorController *)self annotation];
  double v6 = [v4 text];

  [v7 editorController:self editedAnnotation:v5 toText:v6];
}

- (void)textViewDidChange:(id)a3
{
  id v4 = [(AENoteFullscreenEditorController *)self textView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_super v13 = [(AENoteFullscreenEditorController *)self textView];
  [v13 sizeToFit];

  double v14 = [(AENoteFullscreenEditorController *)self textView];
  [v14 frame];
  double v16 = v15;

  double v17 = [(AENoteFullscreenEditorController *)self textView];
  [v17 setFrame:v6, v8, v10, v12];

  float v18 = v12;
  float v19 = v16;
  if (vabds_f32(v18, v19) >= 0.01)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(AENoteFullscreenEditorController *)self updateScrollViewContent];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_140A10;
    v20[3] = &unk_2C3C50;
    v20[4] = self;
    +[CATransaction setCompletionBlock:v20];
    +[CATransaction commit];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(AENoteFullscreenEditorController *)self textView];
  [v3 resignFirstResponder];
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  if (![(AENoteFullscreenEditorController *)self keyboardVisible])
  {
    [(AENoteFullscreenEditorController *)self setKeyboardVisible:1];
    double v5 = [v4 userInfo];
    double v6 = [v5 valueForKey:UIKeyboardFrameEndUserInfoKey];
    [v6 CGRectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    double v15 = [(AENoteFullscreenEditorController *)self view];
    [v15 convertRect:0 fromView:v8 toView:v10];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    double v24 = [v4 userInfo];
    double v25 = [v24 valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    id v26 = [v25 integerValue];

    double v27 = [v4 userInfo];
    v28 = [v27 valueForKey:UIKeyboardAnimationDurationUserInfoKey];
    [v28 doubleValue];
    double v51 = v29;

    v30 = [(AENoteFullscreenEditorController *)self scrollView];
    [v30 frame];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v54.origin.CGFloat x = v32;
    v54.origin.CGFloat y = v34;
    v54.size.CGFloat width = v36;
    v54.size.CGFloat height = v38;
    v57.origin.CGFloat x = v17;
    v57.origin.CGFloat y = v19;
    v57.size.CGFloat width = v21;
    v57.size.CGFloat height = v23;
    CGRect v55 = CGRectIntersection(v54, v57);
    CGFloat x = v55.origin.x;
    CGFloat y = v55.origin.y;
    CGFloat width = v55.size.width;
    CGFloat height = v55.size.height;
    [(AENoteFullscreenEditorController *)self scrollViewScrollerInsets];
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    double v48 = v47;
    uint64_t v50 = v49;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_140D04;
    v53[3] = &unk_2C9D00;
    v53[4] = self;
    v53[5] = v44;
    v53[6] = v46;
    *(double *)&v53[7] = v48 + CGRectGetHeight(v56);
    v53[8] = v50;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_140DAC;
    v52[3] = &unk_2C5968;
    v52[4] = self;
    +[UIView animateWithDuration:(void)v26 << 16 delay:v53 options:v52 animations:v51 completion:0.0];
  }
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = a3;
  if ([(AENoteFullscreenEditorController *)self keyboardVisible])
  {
    [(AENoteFullscreenEditorController *)self setKeyboardVisible:0];
    double v5 = [v4 userInfo];
    double v6 = [v5 valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    id v7 = [v6 integerValue];

    double v8 = [v4 userInfo];
    double v9 = [v8 valueForKey:UIKeyboardAnimationDurationUserInfoKey];
    [v9 doubleValue];
    double v11 = v10;

    [(AENoteFullscreenEditorController *)self scrollViewScrollerInsets];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_140F44;
    v17[3] = &unk_2C9D00;
    v17[4] = self;
    v17[5] = v12;
    v17[6] = v13;
    v17[7] = v14;
    v17[8] = v15;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_140FEC;
    v16[3] = &unk_2C5968;
    v16[4] = self;
    +[UIView animateWithDuration:(void)v7 << 16 delay:v17 options:v16 animations:v11 completion:0.0];
  }
}

- (void)updateScrollViewContent
{
  [(AENoteFullscreenEditorController *)self highlightedTextLabelFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v11 setFrame:v4, v6, v8, v10];

  [(AENoteFullscreenEditorController *)self highlightColorBarFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(AENoteFullscreenEditorController *)self highlightColorBar];
  [v20 setFrame:v13, v15, v17, v19];

  [(AENoteFullscreenEditorController *)self updateTextViewFrame];
  [(AENoteFullscreenEditorController *)self scrollViewContentSize];
  double v22 = v21;
  double v24 = v23;
  id v25 = [(AENoteFullscreenEditorController *)self scrollView];
  [v25 setContentSize:v22, v24];
}

- (UIEdgeInsets)scrollViewScrollerInsets
{
  [(AENoteFullscreenEditorController *)self contentInsets];
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)highlightedTextLabelFrame
{
  CGFloat height = CGRectZero.size.height;
  double v4 = [(AENoteFullscreenEditorController *)self scrollView];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  [(AENoteFullscreenEditorController *)self contentInsets];
  double v14 = v13;
  double v16 = v15 + 4.0 + 10.0;
  v34.origin.CGFloat x = v6;
  v34.origin.CGFloat y = v8;
  v34.size.CGFloat width = v10;
  v34.size.CGFloat height = v12;
  double v17 = CGRectGetWidth(v34) - v16 - v14;
  double v18 = [(AENoteFullscreenEditorController *)self bc_windowForViewController];
  double v19 = [v18 windowScene];
  if ((char *)[v19 interfaceOrientation] - 1 >= (unsigned char *)&def_7D91C + 2) {
    double v20 = 13.0;
  }
  else {
    double v20 = 20.0;
  }

  double v21 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  double v22 = objc_opt_class();
  double v23 = [(AENoteFullscreenEditorController *)self annotation];
  double v24 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  id v25 = [v24 font];
  v35.origin.CGFloat x = v16;
  v35.origin.CGFloat y = v20;
  v35.size.CGFloat width = v17;
  v35.size.CGFloat height = height;
  double Width = CGRectGetWidth(v35);
  double v27 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  objc_msgSend(v22, "sizeForAnnotation:font:width:numberOfLines:useSelectedText:", v23, v25, objc_msgSend(v27, "numberOfLines"), 1, Width);
  double v29 = v28;

  double v30 = v16;
  double v31 = v20;
  double v32 = v17;
  double v33 = v29;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (CGRect)highlightColorBarFrame
{
  double v3 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  [(AENoteFullscreenEditorController *)self contentInsets];
  double v9 = v8;
  double v10 = 4.0;
  double v11 = v5;
  double v12 = v7;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v9;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double v2 = 0.0;
  double v3 = 16.0;
  double v4 = 15.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)updateTextViewFrame
{
  [(AENoteFullscreenEditorController *)self contentInsets];
  double v35 = v3;
  id v36 = v4;
  double v5 = [(AENoteFullscreenEditorController *)self highlightedTextLabel];
  [v5 frame];
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  double v14 = [(AENoteFullscreenEditorController *)self scrollView];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  double v34 = v7 + -5.0;
  v39.origin.CGFloat x = v7;
  v39.origin.CGFloat y = v9;
  v39.size.CGFloat width = v11;
  v39.size.CGFloat height = v13;
  double v23 = CGRectGetMaxY(v39) + 6.0;
  v40.origin.CGFloat x = v16;
  v40.origin.CGFloat y = v18;
  v40.size.CGFloat width = v20;
  v40.size.CGFloat height = v22;
  CGFloat v24 = CGRectGetHeight(v40) - v23;
  [(AENoteFullscreenEditorController *)self scrollViewScrollerInsets];
  CGFloat v26 = v24 - v25;
  [(AENoteFullscreenEditorController *)self scrollViewScrollerInsets];
  double v28 = v26 - v27 - v35;
  v41.origin.CGFloat x = v16;
  v41.origin.CGFloat y = v18;
  v41.size.CGFloat width = v20;
  v41.size.CGFloat height = v22;
  double v29 = CGRectGetWidth(v41) - v34 - *(double *)&v36;
  double v30 = [(AENoteFullscreenEditorController *)self textView];
  [v30 setFrame:v34, v23, v29, v28];

  double v31 = [(AENoteFullscreenEditorController *)self textView];
  [v31 sizeToFit];

  double v32 = [(AENoteFullscreenEditorController *)self textView];
  [v32 frame];
  double Height = CGRectGetHeight(v42);

  if (v28 >= Height) {
    double Height = v28;
  }
  id v37 = [(AENoteFullscreenEditorController *)self textView];
  [v37 setFrame:v34, v23, v29, Height];
}

- (CGSize)scrollViewContentSize
{
  double v3 = [(AENoteFullscreenEditorController *)self textView];
  [v3 frame];
  CGFloat MaxY = CGRectGetMaxY(v16);

  double v5 = [(AENoteFullscreenEditorController *)self view];
  [v5 bounds];
  double Width = CGRectGetWidth(v17);
  double v7 = [(AENoteFullscreenEditorController *)self view];
  [v7 safeAreaInsets];
  double v9 = Width - v8;
  double v10 = [(AENoteFullscreenEditorController *)self view];
  [v10 safeAreaInsets];
  double v12 = v9 - v11;

  double v13 = v12;
  double v14 = MaxY;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (void)p_ensureTextViewLayout
{
  double v3 = [(AENoteFullscreenEditorController *)self textView];
  double v4 = [v3 layoutManager];
  double v5 = [(AENoteFullscreenEditorController *)self textView];
  double v6 = [v5 textContainer];
  [v4 ensureLayoutForTextContainer:v6];

  id v7 = [(AENoteFullscreenEditorController *)self textView];
  [v7 layoutIfNeeded];
}

- (void)p_revealTextViewCursorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v29 = [(AENoteFullscreenEditorController *)self textView];
  if ([v29 isFirstResponder])
  {
    [v29 selectedRange];
    if (!v5)
    {
      [(AENoteFullscreenEditorController *)self p_ensureTextViewLayout];
      double v6 = [v29 selectedTextRange];
      id v7 = [v6 start];
      [v29 caretRectForPosition:v7];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;

      CGRect v16 = [v29 font];
      [v16 lineHeight];
      double v18 = v15 + v17;

      double v19 = [(AENoteFullscreenEditorController *)self scrollView];
      [v19 convertRect:v29 fromView:v9, v11, v13, v18];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;

      double v28 = [(AENoteFullscreenEditorController *)self scrollView];
      [v28 scrollRectToVisible:v3 animated:v21, v23, v25, v27];
    }
  }
}

- (AEAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (AEAnnotationTheme)annotationTheme
{
  return self->_annotationTheme;
}

- (void)setAnnotationTheme:(id)a3
{
}

- (AEAnnotationEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AEAnnotationEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIFont)highlightedTextFont
{
  return self->_highlightedTextFont;
}

- (void)setHighlightedTextFont:(id)a3
{
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (BOOL)shouldDim
{
  return self->_shouldDim;
}

- (void)setShouldDim:(BOOL)a3
{
  self->_shouldDim = a3;
}

- (IMPassthroughView)dimmingOverlayView
{
  return self->_dimmingOverlayView;
}

- (void)setDimmingOverlayView:(id)a3
{
}

- (AEHighlightedTextLabel)highlightedTextLabel
{
  return self->_highlightedTextLabel;
}

- (void)setHighlightedTextLabel:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (UIView)highlightColorBar
{
  return self->_highlightColorBar;
}

- (void)setHighlightColorBar:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)keyboardVisible
{
  return self->_keyboardVisible;
}

- (void)setKeyboardVisible:(BOOL)a3
{
  self->_keyboardVisible = a3;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_highlightColorBar, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_highlightedTextLabel, 0);
  objc_storeStrong((id *)&self->_dimmingOverlayView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationTheme, 0);
  objc_storeStrong((id *)&self->_highlightedTextFont, 0);

  objc_storeStrong((id *)&self->_annotation, 0);
}

@end