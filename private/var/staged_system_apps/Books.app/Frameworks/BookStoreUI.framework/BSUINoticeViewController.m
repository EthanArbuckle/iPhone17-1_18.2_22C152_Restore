@interface BSUINoticeViewController
+ (BOOL)allowsAutoDownloadOfSamplesToWantToRead;
+ (BSUIAddToWTRDelegate)addToWTRDelegate;
+ (NSDictionary)noticeViewConfirmLabelFontAttributes;
+ (NSDictionary)noticeViewMessageFontAttributes;
+ (NSDictionary)noticeViewTitleFontAttributes;
+ (UIImage)noticeViewAddedImage;
+ (double)noticeTotalDuration;
+ (id)_noticeMessageForAddingAssets:(id)a3 toCollectionNamed:(id)a4 isAddingToWantToRead:(BOOL)a5 useNonSpecificDeterminerInMessage:(BOOL)a6;
+ (id)_presentedViewControllers;
+ (id)_presentingViewControllerForModalWithOptions:(id)a3;
+ (void)dismissViewController:(id)a3;
+ (void)js_presentNoticeForAddingAssets:(id)a3 toCollectionNamed:(id)a4 options:(id)a5;
+ (void)presentNoticeForAddingAssets:(id)a3 collectionTitle:(id)a4 collectionID:(id)a5 sourceViewController:(id)a6 options:(id)a7;
+ (void)presentNoticeForBookLoved:(BOOL)a3 options:(id)a4;
+ (void)presentNoticeForMigratingBooksCollection:(id)a3 options:(id)a4;
+ (void)presentNoticeForNoSampleAvailable:(BOOL)a3 options:(id)a4;
+ (void)presentNoticeForRemovingBooks:(id)a3 fromCollectionNamed:(id)a4 options:(id)a5 useNonSpecificDeterminerInMessage:(BOOL)a6;
+ (void)presentNoticeWithTitle:(id)a3 message:(id)a4 imageURLString:(id)a5 options:(id)a6;
+ (void)presentNoticeWithTitle:(id)a3 message:(id)a4 symbolImageName:(id)a5 options:(id)a6;
+ (void)presentViewController:(id)a3;
+ (void)setAddToWTRDelegate:(id)a3;
- (BOOL)iconImageAlwaysTemplate;
- (BOOL)shouldDismissAutomatically;
- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 image:(id)a5;
- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 image:(id)a5 confirmString:(id)a6;
- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 imageURLString:(id)a5;
- (BSUINoticeViewLayout)noticeViewLayout;
- (NSString)confirmString;
- (NSString)imageURL;
- (NSString)message;
- (NSString)noticeTitle;
- (UIImage)iconImage;
- (UIImageView)iconImageView;
- (UILabel)confirmLabel;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIVisualEffectView)noticeView;
- (UIWindow)window;
- (id)completion;
- (int64_t)_lineCountForLabel:(id)a3 constrainedToWidth:(double)a4;
- (void)_announceTheNoticeToAVoiceOverUser;
- (void)_hide:(BOOL)a3 withDelay:(double)a4;
- (void)_runWithOptions:(id)a3 completion:(id)a4;
- (void)_show:(BOOL)a3 options:(id)a4;
- (void)_updateTitleMessageAndConfirmLabels;
- (void)downloadIcon;
- (void)handleTapGesture:(id)a3;
- (void)hide:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setConfirmLabel:(id)a3;
- (void)setConfirmString:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageAlwaysTemplate:(BOOL)a3;
- (void)setIconImageView:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setNoticeTitle:(id)a3;
- (void)setNoticeView:(id)a3;
- (void)setNoticeViewLayout:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWindow:(id)a3;
- (void)show:(BOOL)a3;
- (void)show:(BOOL)a3 options:(id)a4;
- (void)updateUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation BSUINoticeViewController

+ (BSUIAddToWTRDelegate)addToWTRDelegate
{
  id WeakRetained = objc_loadWeakRetained(&qword_3D4198);

  return (BSUIAddToWTRDelegate *)WeakRetained;
}

+ (void)setAddToWTRDelegate:(id)a3
{
}

- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 image:(id)a5
{
  return [(BSUINoticeViewController *)self initWithTitle:a3 message:a4 image:a5 confirmString:0];
}

- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 image:(id)a5 confirmString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)BSUINoticeViewController;
  v14 = [(BSUINoticeViewController *)&v27 init];
  v15 = v14;
  if (v14)
  {
    [(BSUINoticeViewController *)v14 setModalPresentationStyle:6];
    v16 = (NSString *)[v10 copy];
    noticeTitle = v15->_noticeTitle;
    v15->_noticeTitle = v16;

    v18 = (NSString *)[v11 copy];
    message = v15->_message;
    v15->_message = v18;

    v20 = (NSString *)[v13 copy];
    confirmString = v15->_confirmString;
    v15->_confirmString = v20;

    objc_storeStrong((id *)&v15->_iconImage, a5);
    v15->_iconImageAlwaysTemplate = 1;
    uint64_t v22 = +[BSUINoticeViewLayout layoutWithAction:](BSUINoticeViewLayout, "layoutWithAction:", [v13 length] != 0);
    noticeViewLayout = v15->_noticeViewLayout;
    v15->_noticeViewLayout = (BSUINoticeViewLayout *)v22;

    v24 = +[UITraitCollection bc_allAPITraits];
    id v25 = [(BSUINoticeViewController *)v15 registerForTraitChanges:v24 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v15;
}

- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 imageURLString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)BSUINoticeViewController;
  id v11 = [(BSUINoticeViewController *)&v24 init];
  id v12 = v11;
  if (v11)
  {
    [(BSUINoticeViewController *)v11 setModalPresentationStyle:6];
    id v13 = (NSString *)[v8 copy];
    noticeTitle = v12->_noticeTitle;
    v12->_noticeTitle = v13;

    v15 = (NSString *)[v9 copy];
    message = v12->_message;
    v12->_message = v15;

    v17 = (NSString *)[v10 copy];
    imageURL = v12->_imageURL;
    v12->_imageURL = v17;

    v12->_iconImageAlwaysTemplate = 1;
    uint64_t v19 = +[BSUINoticeViewLayout layoutWithAction:0];
    noticeViewLayout = v12->_noticeViewLayout;
    v12->_noticeViewLayout = (BSUINoticeViewLayout *)v19;

    v21 = +[UITraitCollection bc_allAPITraits];
    id v22 = [(BSUINoticeViewController *)v12 registerForTraitChanges:v21 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v12;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)BSUINoticeViewController;
  [(BSUINoticeViewController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
}

- (void)viewDidLoad
{
  v52.receiver = self;
  v52.super_class = (Class)BSUINoticeViewController;
  [(BSUINoticeViewController *)&v52 viewDidLoad];
  unsigned int v3 = [(BSUINoticeViewController *)self shouldDismissAutomatically];
  objc_super v4 = [(BSUINoticeViewController *)self view];
  v5 = v4;
  if (v3)
  {
    [v4 setAccessibilityElementsHidden:1];

    v6 = [(BSUINoticeViewController *)self view];
    [v6 setAccessibilityElements:0];

    v7 = [(BSUINoticeViewController *)self presentationController];
    [v7 _setContainerIgnoresDirectTouchEvents:1];

    id v8 = [(BSUINoticeViewController *)self view];
    [v8 setUserInteractionEnabled:0];
  }
  else
  {
    [v4 setAccessibilityViewIsModal:1];

    id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapGesture:"];
    id v9 = [(BSUINoticeViewController *)self noticeView];
    id v10 = [v9 contentView];
    [v10 addGestureRecognizer:v8];
  }
  id v11 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BSUINoticeViewController *)self setIconImageView:v11];

  id v12 = [(BSUINoticeViewController *)self iconImageView];
  [v12 setContentMode:1];

  id v13 = [(BSUINoticeViewController *)self iconImageView];
  [v13 setAlpha:0.64];

  v14 = [(BSUINoticeViewController *)self iconImage];

  if (v14)
  {
    unsigned int v15 = [(BSUINoticeViewController *)self iconImageAlwaysTemplate];
    v16 = [(BSUINoticeViewController *)self iconImage];
    v17 = v16;
    v18 = v16;
    if (v15)
    {
      v18 = [v16 imageWithRenderingMode:2];
    }
    uint64_t v19 = [(BSUINoticeViewController *)self iconImageView];
    [v19 setImage:v18];

    if (v15) {
  }
    }
  else
  {
    [(BSUINoticeViewController *)self downloadIcon];
  }
  id v20 = objc_alloc_init((Class)UILabel);
  [(BSUINoticeViewController *)self setTitleLabel:v20];

  UIAccessibilityTraits v21 = UIAccessibilityTraitHeader | UIAccessibilityTraitStaticText;
  id v22 = [(BSUINoticeViewController *)self titleLabel];
  [v22 setAccessibilityTraits:v21];

  v23 = [(BSUINoticeViewController *)self titleLabel];
  [v23 setTextAlignment:1];

  objc_super v24 = [(BSUINoticeViewController *)self titleLabel];
  [v24 setNumberOfLines:2];

  id v25 = [(BSUINoticeViewController *)self titleLabel];
  [v25 setLineBreakMode:4];

  id v26 = objc_alloc_init((Class)UILabel);
  [(BSUINoticeViewController *)self setMessageLabel:v26];

  objc_super v27 = [(BSUINoticeViewController *)self messageLabel];
  [v27 setTextAlignment:1];

  v28 = [(BSUINoticeViewController *)self messageLabel];
  [v28 setNumberOfLines:0];

  v29 = [(BSUINoticeViewController *)self messageLabel];
  [v29 setLineBreakMode:4];

  v30 = [(BSUINoticeViewController *)self confirmString];

  if (v30)
  {
    id v31 = objc_alloc_init((Class)UILabel);
    [(BSUINoticeViewController *)self setConfirmLabel:v31];

    UIAccessibilityTraits v32 = UIAccessibilityTraitButton;
    v33 = [(BSUINoticeViewController *)self confirmLabel];
    [v33 setAccessibilityTraits:v32];

    v34 = [(BSUINoticeViewController *)self confirmLabel];
    [v34 setTextAlignment:1];

    v35 = [(BSUINoticeViewController *)self confirmLabel];
    [v35 setNumberOfLines:1];

    v36 = [(BSUINoticeViewController *)self confirmLabel];
    [v36 setLineBreakMode:4];
  }
  [(BSUINoticeViewController *)self _updateTitleMessageAndConfirmLabels];
  v37 = [(BSUINoticeViewController *)self noticeView];
  v38 = [v37 contentView];
  v39 = [(BSUINoticeViewController *)self iconImageView];
  [v38 addSubview:v39];

  v40 = [(BSUINoticeViewController *)self noticeView];
  v41 = [v40 contentView];
  v42 = [(BSUINoticeViewController *)self titleLabel];
  [v41 addSubview:v42];

  v43 = [(BSUINoticeViewController *)self noticeView];
  v44 = [v43 contentView];
  v45 = [(BSUINoticeViewController *)self messageLabel];
  [v44 addSubview:v45];

  v46 = [(BSUINoticeViewController *)self confirmLabel];

  if (v46)
  {
    v47 = [(BSUINoticeViewController *)self noticeView];
    v48 = [v47 contentView];
    v49 = [(BSUINoticeViewController *)self confirmLabel];
    [v48 addSubview:v49];
  }
  v50 = [(BSUINoticeViewController *)self view];
  v51 = [(BSUINoticeViewController *)self noticeView];
  [v50 addSubview:v51];
}

- (void)viewDidLayoutSubviews
{
  v151.receiver = self;
  v151.super_class = (Class)BSUINoticeViewController;
  [(BSUINoticeViewController *)&v151 viewDidLayoutSubviews];
  unsigned int v3 = [(BSUINoticeViewController *)self noticeViewLayout];
  objc_super v4 = [(BSUINoticeViewController *)self titleLabel];
  v5 = [v4 text];
  NSAttributedStringKey v154 = NSFontAttributeName;
  v6 = [(BSUINoticeViewController *)self titleLabel];
  v7 = [v6 font];
  v155 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
  [v5 sizeWithAttributes:v8];
  double v10 = v9;

  id v11 = [(BSUINoticeViewController *)self messageLabel];
  [v3 defaultSize];
  double v13 = v12;
  [v3 horizontalMargin];
  uint64_t v15 = [(BSUINoticeViewController *)self _lineCountForLabel:v11 constrainedToWidth:v13 + v14 * -2.0];

  if (v15 >= 5)
  {
    v16 = [(BSUINoticeViewController *)self messageLabel];
    v17 = [v16 text];
    NSAttributedStringKey v152 = NSFontAttributeName;
    v18 = [(BSUINoticeViewController *)self messageLabel];
    uint64_t v19 = [v18 font];
    v153 = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
    [v17 sizeWithAttributes:v20];
    double v22 = v21;

    if (v10 < v22) {
      double v10 = v22;
    }
  }
  [v3 defaultSize];
  double v24 = v23;
  [v3 horizontalMargin];
  double v26 = v10 + v25 * 2.0;
  if (v24 >= v26) {
    double v27 = v24;
  }
  else {
    double v27 = v26;
  }
  [v3 maxWidth];
  if (v27 >= v28) {
    double v27 = v28;
  }
  [v3 maxHeight];
  double v30 = v29;
  id v31 = [(BSUINoticeViewController *)self noticeView];
  [v31 setFrame:0.0, 0.0, v27, v30];

  [v3 maxHeight];
  double v33 = v32;
  [v3 topContentInset];
  double v35 = v33 - v34;
  [v3 bottomContentInset];
  double v37 = v35 - v36;
  [v3 imageSize];
  double v39 = v38;
  [v3 imageSize];
  double v41 = v40;
  [v3 topContentInset];
  double v43 = v42 + 0.0;
  v44 = [(BSUINoticeViewController *)self iconImageView];
  [v44 setFrame:((v27 - v39) * 0.5), v43, v39, v41];

  double v45 = v41 + v43;
  double v46 = v37 - v41;
  [v3 titleTopMargin];
  double v48 = v45 + v47;
  [v3 titleTopMargin];
  double v150 = v46 - v49;
  v50 = [(BSUINoticeViewController *)self titleLabel];
  [v3 horizontalMargin];
  double v52 = v27 + v51 * -2.0;
  v53 = [(BSUINoticeViewController *)self titleLabel];
  [v53 bounds];
  [v50 sizeThatFits:v52, v54];
  double v56 = v55;

  [v3 horizontalMargin];
  double v58 = v57;
  [v3 horizontalMargin];
  double v60 = v27 + v59 * -2.0;
  v61 = [(BSUINoticeViewController *)self titleLabel];
  [v61 setFrame:v58, v48 - v56 * 0.5, v60, v56 + v56 * 0.5 * 2.0];

  v62 = [(BSUINoticeViewController *)self titleLabel];
  [v62 center];
  double v64 = v63;
  v65 = [(BSUINoticeViewController *)self titleLabel];
  [v65 setCenter:v27 * 0.5, v64];

  v66 = [(BSUINoticeViewController *)self titleLabel];
  [v66 _lastLineBaseline];
  double v68 = v48 + ceil(v67 - v56 * 0.5);

  v69 = [(BSUINoticeViewController *)self titleLabel];
  [v69 _lastLineBaseline];
  double v71 = v150 - ceil(v70 - v56 * 0.5);

  [v3 messageTopMargin];
  double v73 = v68 + v72;
  [v3 messageTopMargin];
  double v75 = v71 - v74;
  v76 = [(BSUINoticeViewController *)self messageLabel];
  [v3 horizontalMargin];
  [v76 sizeThatFits:v27 + v77 * -2.0 v75];
  double v79 = v78;

  [v3 horizontalMargin];
  double v81 = v80;
  [v3 horizontalMargin];
  double v83 = v27 + v82 * -2.0;
  v84 = [(BSUINoticeViewController *)self messageLabel];
  [v84 setFrame:v81, v73, v83, v79];

  v85 = [(BSUINoticeViewController *)self messageLabel];
  [v85 center];
  double v87 = v86;
  v88 = [(BSUINoticeViewController *)self messageLabel];
  [v88 setCenter:v27 * 0.5, v87];

  v89 = [(BSUINoticeViewController *)self messageLabel];
  [v89 _lastLineBaseline];
  double v91 = v73 + ceil(v90);

  v92 = [(BSUINoticeViewController *)self confirmLabel];

  if (v92)
  {
    [v3 confirmLabelTopMargin];
    double v94 = v91 + v93;
    v95 = [(BSUINoticeViewController *)self confirmLabel];
    [v3 horizontalMargin];
    double v97 = v27 + v96 * -2.0;
    v98 = [(BSUINoticeViewController *)self confirmLabel];
    [v98 bounds];
    [v95 sizeThatFits:v97, v99];
    double v101 = v100;

    if (v101 < 32.0) {
      double v101 = 32.0;
    }
    [v3 horizontalMargin];
    double v103 = v102;
    [v3 horizontalMargin];
    double v105 = v27 + v104 * -2.0;
    v106 = [(BSUINoticeViewController *)self confirmLabel];
    [v106 setFrame:v103, v94, v105, v101];

    v107 = [(BSUINoticeViewController *)self confirmLabel];
    [v107 center];
    double v109 = v108;
    v110 = [(BSUINoticeViewController *)self confirmLabel];
    [v110 setCenter:v27 * 0.5, v109];

    v111 = [(BSUINoticeViewController *)self confirmLabel];
    [v111 _lastLineBaseline];
    double v91 = v94 + ceil(v112);
  }
  [v3 bottomContentInset];
  double v114 = v91 + v113;
  [v3 maxHeight];
  if (v114 >= v115) {
    double v114 = v115;
  }
  v116 = [(BSUINoticeViewController *)self noticeView];
  [v116 frame];
  double MinX = CGRectGetMinX(v156);
  v118 = [(BSUINoticeViewController *)self noticeView];
  [v118 frame];
  double MinY = CGRectGetMinY(v157);
  v120 = [(BSUINoticeViewController *)self noticeView];
  [v120 setFrame:MinX, MinY, v27, v114];

  v121 = [(BSUINoticeViewController *)self noticeView];
  [v121 frame];
  double v123 = v122;
  double v125 = v124;
  double v127 = v126;
  double v129 = v128;
  v130 = [(BSUINoticeViewController *)self view];
  [v130 bounds];
  double v132 = v131;
  double v134 = v133;
  double v136 = v135;
  double v138 = v137;
  v139 = [(BSUINoticeViewController *)self traitCollection];
  [v139 displayScale];
  +[BSUIGeometryUtils centeredCGRectFromRect:centerHorizontally:centerVertically:bounds:scale:](BSUIGeometryUtils, "centeredCGRectFromRect:centerHorizontally:centerVertically:bounds:scale:", 1, 1, v123, v125, v127, v129, v132, v134, v136, v138, v140);
  double v142 = v141;
  double v144 = v143;
  double v146 = v145;
  double v148 = v147;
  v149 = [(BSUINoticeViewController *)self noticeView];
  [v149 setFrame:v142, v144, v146, v148];
}

- (BOOL)shouldDismissAutomatically
{
  v2 = [(BSUINoticeViewController *)self confirmString];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUINoticeViewController;
  [(BSUINoticeViewController *)&v4 viewDidAppear:a3];
  if ([(BSUINoticeViewController *)self shouldDismissAutomatically]) {
    [(BSUINoticeViewController *)self _announceTheNoticeToAVoiceOverUser];
  }
}

- (void)_announceTheNoticeToAVoiceOverUser
{
  id v13 = (id)objc_opt_new();
  BOOL v3 = [(BSUINoticeViewController *)self noticeTitle];
  id v4 = [v3 length];

  if (v4)
  {
    v5 = [(BSUINoticeViewController *)self noticeTitle];
    [v13 addObject:v5];
  }
  v6 = [(BSUINoticeViewController *)self message];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = [(BSUINoticeViewController *)self message];
    [v13 addObject:v8];
  }
  double v9 = [(BSUINoticeViewController *)self confirmString];
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = [(BSUINoticeViewController *)self confirmString];
    [v13 addObject:v11];
  }
  if ([v13 count])
  {
    double v12 = [v13 componentsJoinedByString:@", "];
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BSUINoticeViewController;
  [(BSUINoticeViewController *)&v3 viewWillLayoutSubviews];
  [(BSUINoticeViewController *)self updateUI];
}

- (void)_updateTitleMessageAndConfirmLabels
{
  id v3 = objc_alloc((Class)NSAttributedString);
  id v4 = [(BSUINoticeViewController *)self noticeTitle];
  v5 = +[BSUINoticeViewController noticeViewTitleFontAttributes];
  id v6 = [v3 initWithString:v4 attributes:v5];
  id v7 = [(BSUINoticeViewController *)self titleLabel];
  [v7 setAttributedText:v6];

  id v8 = objc_alloc((Class)NSAttributedString);
  double v9 = [(BSUINoticeViewController *)self message];
  id v10 = +[BSUINoticeViewController noticeViewMessageFontAttributes];
  id v11 = [v8 initWithString:v9 attributes:v10];
  double v12 = [(BSUINoticeViewController *)self messageLabel];
  [v12 setAttributedText:v11];

  id v13 = [(BSUINoticeViewController *)self confirmString];

  if (v13)
  {
    id v14 = objc_alloc((Class)NSAttributedString);
    id v18 = [(BSUINoticeViewController *)self confirmString];
    uint64_t v15 = +[BSUINoticeViewController noticeViewConfirmLabelFontAttributes];
    id v16 = [v14 initWithString:v18 attributes:v15];
    v17 = [(BSUINoticeViewController *)self confirmLabel];
    [v17 setAttributedText:v16];
  }
}

- (void)updateUI
{
  id v3 = +[UIColor bc_booksKeyColor];
  id v4 = [(BSUINoticeViewController *)self iconImageView];
  [v4 setTintColor:v3];

  v5 = [(BSUINoticeViewController *)self traitCollection];
  if (objc_msgSend(v5, "bc_userInterfaceStyleDark")) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = +[UIBlurEffect effectWithStyle:v6];
  id v8 = [(BSUINoticeViewController *)self noticeView];
  [v8 setEffect:v7];

  [(BSUINoticeViewController *)self _updateTitleMessageAndConfirmLabels];
}

- (UIVisualEffectView)noticeView
{
  noticeView = self->_noticeView;
  if (!noticeView)
  {
    id v4 = [objc_alloc((Class)UIVisualEffectView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_noticeView;
    self->_noticeView = v4;

    uint64_t v6 = +[UIBlurEffect effectWithStyle:0];
    [(UIVisualEffectView *)self->_noticeView setEffect:v6];

    [(UIVisualEffectView *)self->_noticeView setClipsToBounds:1];
    [(UIVisualEffectView *)self->_noticeView _setContinuousCornerRadius:12.0];
    noticeView = self->_noticeView;
  }

  return noticeView;
}

- (void)downloadIcon
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(2, 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_389AC;
  v3[3] = &unk_38E9F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

+ (id)_presentedViewControllers
{
  if (qword_3D41A8 != -1) {
    dispatch_once(&qword_3D41A8, &stru_38F5C0);
  }
  v2 = (void *)qword_3D41A0;

  return v2;
}

+ (void)presentViewController:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [a1 _presentedViewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v10 shouldDismissAutomatically]) {
          [v10 hide:1];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  id v11 = [v4 window];
  double v12 = [v4 window];
  sub_38DC4((uint64_t)a1, v4, v12);

  id v13 = [v4 view];
  [v11 addSubview:v13];

  id v14 = [v4 window];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = [v4 view];
  [v23 setFrame:v16, v18, v20, v22];

  double v24 = [a1 _presentedViewControllers];
  [v24 addObject:v4];
}

+ (id)_presentingViewControllerForModalWithOptions:(id)a3
{
  id v3 = sub_38EC4((uint64_t)a1, a3);
  id v4 = +[UIViewController jsa_topMostViewControllerForWindow:v3];

  return v4;
}

+ (void)dismissViewController:(id)a3
{
  id v9 = a3;
  id v4 = [a1 _presentedViewControllers];
  unsigned int v5 = [v4 containsObject:v9];

  if (v5)
  {
    id v6 = [v9 view];
    [v6 removeFromSuperview];

    id v7 = [a1 _presentedViewControllers];
    [v7 removeObject:v9];
  }
  uint64_t v8 = [v9 completion];
  [v9 setCompletion:0];
  if (v8) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

- (void)show:(BOOL)a3
{
}

- (void)_runWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(BSUINoticeViewController *)self setCompletion:a4];
  [(BSUINoticeViewController *)self show:1 options:v6];
}

- (void)show:(BOOL)a3 options:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_391C0;
  v8[3] = &unk_38E338;
  v8[4] = self;
  BOOL v10 = a3;
  id v4 = a4;
  id v9 = v4;
  unsigned int v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v5[2])(v5);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_391D0;
      v6[3] = &unk_38E0B8;
      id v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    }
  }
}

- (void)_show:(BOOL)a3 options:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(BSUINoticeViewController *)self view];
  [v7 setAlpha:0.0];

  CGAffineTransformMakeScale(&v15, 0.88, 0.88);
  uint64_t v8 = [(BSUINoticeViewController *)self view];
  CGAffineTransform v14 = v15;
  [v8 setTransform:&v14];

  id v9 = sub_38EC4((uint64_t)BSUINoticeViewController, v6);

  [(BSUINoticeViewController *)self setWindow:v9];
  +[BSUINoticeViewController presentViewController:self];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_393B8;
  v13[3] = &unk_38E738;
  v13[4] = self;
  BOOL v10 = objc_retainBlock(v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_39438;
  v12[3] = &unk_38F5E8;
  v12[4] = self;
  id v11 = objc_retainBlock(v12);
  if (v4)
  {
    +[UIView animateWithDuration:131074 delay:v10 options:v11 animations:0.2 completion:0.0];
  }
  else
  {
    ((void (*)(void *))v10[2])(v10);
    ((void (*)(void *, uint64_t))v11[2])(v11, 1);
  }
}

- (void)hide:(BOOL)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_395E0;
  v6[3] = &unk_38F610;
  void v6[4] = self;
  BOOL v7 = a3;
  id v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_395F4;
      block[3] = &unk_38E0B8;
      unsigned int v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_hide:(BOOL)a3 withDelay:(double)a4
{
  BOOL v5 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3974C;
  v10[3] = &unk_38E738;
  v10[4] = self;
  BOOL v7 = objc_retainBlock(v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_397D0;
  v9[3] = &unk_38F5E8;
  v9[4] = self;
  uint64_t v8 = objc_retainBlock(v9);
  if (v5)
  {
    +[UIView animateWithDuration:131074 delay:v7 options:v8 animations:0.2 completion:a4];
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
    ((void (*)(void *, uint64_t))v8[2])(v8, 1);
  }
}

- (void)handleTapGesture:(id)a3
{
}

+ (void)presentNoticeWithTitle:(id)a3 message:(id)a4 symbolImageName:(id)a5 options:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_398EC;
  v15[3] = &unk_38F638;
  id v16 = a5;
  id v17 = v9;
  id v18 = v10;
  id v19 = a6;
  id v11 = v19;
  id v12 = v10;
  id v13 = v9;
  id v14 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
}

+ (void)presentNoticeWithTitle:(id)a3 message:(id)a4 imageURLString:(id)a5 options:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_39AA8;
  v13[3] = &unk_38F638;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v9 = v17;
  id v10 = v16;
  id v11 = v15;
  id v12 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

+ (void)js_presentNoticeForAddingAssets:(id)a3 toCollectionNamed:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = BSUIBundle();
  id v13 = [v11 localizedStringForKey:@"Want to Read" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  if ([v9 isEqualToString:v13]) {
    uint64_t v12 = kBKCollectionDefaultIDWantToRead;
  }
  else {
    uint64_t v12 = 0;
  }
  [a1 presentNoticeForAddingAssets:v10 collectionTitle:v9 collectionID:v12 sourceViewController:0 options:v8];
}

+ (id)_noticeMessageForAddingAssets:(id)a3 toCollectionNamed:(id)a4 isAddingToWantToRead:(BOOL)a5 useNonSpecificDeterminerInMessage:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = BSUIBundle();
  id v13 = [v12 localizedStringForKey:@"\\U2026" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];
  id v14 = [v11 stringByTruncatingToLength:50 options:3 truncationString:v13];

  id v15 = (char *)[v10 count];
  if (!v7)
  {
    if (v15 == (unsigned char *)&dword_0 + 1)
    {
      double v20 = [v10 allValues];
      double v24 = [v20 lastObject];

      double v21 = (char *)[v24 integerValue];
      if (v21 == (unsigned char *)&dword_4 + 2)
      {
        id v18 = BSUIBundle();
        if (v6) {
          CFStringRef v22 = @"The audiobook was added to %@.";
        }
        else {
          CFStringRef v22 = @"This audiobook was added to %@.";
        }
      }
      else if (v21 == (unsigned char *)&dword_0 + 3)
      {
        id v18 = BSUIBundle();
        if (v6) {
          CFStringRef v22 = @"The PDF was added to %@.";
        }
        else {
          CFStringRef v22 = @"This PDF was added to %@.";
        }
      }
      else
      {
        id v18 = BSUIBundle();
        if (v6) {
          CFStringRef v22 = @"The book was added to %@.";
        }
        else {
          CFStringRef v22 = @"This book was added to %@.";
        }
      }
    }
    else
    {
      long long v27 = [v10 allValues];
      double v24 = +[NSSet setWithArray:v27];

      if ([v24 count] == (char *)&dword_0 + 1)
      {
        long long v28 = [v24 anyObject];
        double v29 = (char *)[v28 integerValue];

        if (v29 == (unsigned char *)&dword_4 + 2)
        {
          id v18 = BSUIBundle();
          if (v6) {
            CFStringRef v22 = @"The audiobooks were added to %@.";
          }
          else {
            CFStringRef v22 = @"These audiobooks were added to %@.";
          }
        }
        else if (v29 == (unsigned char *)&dword_0 + 3)
        {
          id v18 = BSUIBundle();
          if (v6) {
            CFStringRef v22 = @"The PDFs were added to %@.";
          }
          else {
            CFStringRef v22 = @"These PDFs were added to %@.";
          }
        }
        else
        {
          id v18 = BSUIBundle();
          if (v6) {
            CFStringRef v22 = @"The books were added to %@.";
          }
          else {
            CFStringRef v22 = @"These books were added to %@.";
          }
        }
      }
      else
      {
        id v18 = BSUIBundle();
        if (v6) {
          CFStringRef v22 = @"The items were added to %@.";
        }
        else {
          CFStringRef v22 = @"These items were added to %@.";
        }
      }
    }
    v50 = [v18 localizedStringForKey:v22 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];
    double v52 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v50, v14);

    goto LABEL_72;
  }
  if (v15 == (unsigned char *)&dword_0 + 1)
  {
    id v16 = [v10 allValues];
    double v24 = [v16 lastObject];

    id v17 = (char *)[v24 integerValue];
    if (v17 == (unsigned char *)&dword_4 + 2)
    {
      id v18 = BSUIBundle();
      if (v6) {
        CFStringRef v19 = @"The audiobook was added to your Want to Read list in Home.";
      }
      else {
        CFStringRef v19 = @"This audiobook was added to your Want to Read list in Home.";
      }
      goto LABEL_68;
    }
    if (v17 == (unsigned char *)&dword_0 + 3)
    {
      id v18 = BSUIBundle();
      if (v6) {
        CFStringRef v19 = @"The PDF was added to your Want to Read collection and can be viewed in Home.";
      }
      else {
        CFStringRef v19 = @"This PDF was added to your Want to Read collection and can be viewed in Home.";
      }
      goto LABEL_68;
    }
    objc_opt_class();
    double v30 = +[BSUITemplate manager];
    id v31 = [v30 dynamicRegistry];
    double v32 = [v31 stateProviderForKind:@"libraryItem"];
    id v18 = BUDynamicCast();

    double v33 = [v18 provider];
    double v34 = [v10 allKeys];
    double v35 = [v34 lastObject];

    double v36 = [v33 itemStateWithIdentifier:v35];
    if ([v36 library] == &dword_4 || objc_msgSend(v36, "library") == (char *)&dword_0 + 2)
    {
      [v36 isSample];
    }
    else
    {
      double v48 = (char *)[v36 library];
      unsigned __int8 v49 = [v36 isSample];
      if (v48 != (unsigned char *)&dword_4 + 1
        && (v49 & 1) == 0
        && [a1 allowsAutoDownloadOfSamplesToWantToRead])
      {
        double v37 = BSUIBundle();
        if (v6) {
          CFStringRef v38 = @"The book was added to your Want to Read list in Home, and a sample was downloaded.";
        }
        else {
          CFStringRef v38 = @"This book was added to your Want to Read list in Home, and a sample was downloaded.";
        }
        goto LABEL_59;
      }
    }
    double v37 = BSUIBundle();
    if (v6) {
      CFStringRef v38 = @"The book was added to your Want to Read list in Home.";
    }
    else {
      CFStringRef v38 = @"This book was added to your Want to Read list in Home.";
    }
LABEL_59:
    double v52 = [v37 localizedStringForKey:v38 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

LABEL_72:
    goto LABEL_73;
  }
  double v23 = [v10 allValues];
  double v24 = +[NSSet setWithArray:v23];

  if ([v24 count] != (char *)&dword_0 + 1)
  {
    id v18 = BSUIBundle();
    if (v6) {
      CFStringRef v19 = @"The items were added to your Want to Read collection and can be viewed in Home.";
    }
    else {
      CFStringRef v19 = @"These items were added to your Want to Read collection and can be viewed in Home.";
    }
    goto LABEL_68;
  }
  long long v25 = [v24 anyObject];
  long long v26 = (char *)[v25 integerValue];

  if (v26 == (unsigned char *)&dword_4 + 2)
  {
    id v18 = BSUIBundle();
    if (v6) {
      CFStringRef v19 = @"The audiobooks were added to your Want to Read list in Home.";
    }
    else {
      CFStringRef v19 = @"These audiobooks were added to your Want to Read list in Home.";
    }
    goto LABEL_68;
  }
  if (v26 == (unsigned char *)&dword_0 + 3)
  {
    id v18 = BSUIBundle();
    if (v6) {
      CFStringRef v19 = @"The PDFs were added to your Want to Read collection and can be viewed in Home.";
    }
    else {
      CFStringRef v19 = @"These PDFs were added to your Want to Read collection and can be viewed in Home.";
    }
LABEL_68:
    double v52 = [v18 localizedStringForKey:v19 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];
    goto LABEL_72;
  }
  uint64_t v56 = 0;
  double v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  if ([a1 allowsAutoDownloadOfSamplesToWantToRead])
  {
    objc_opt_class();
    double v39 = +[BSUITemplate manager];
    double v40 = [v39 dynamicRegistry];
    double v41 = [v40 stateProviderForKind:@"libraryItem"];
    double v42 = BUDynamicCast();

    double v43 = [v42 provider];
    v44 = [v10 allKeys];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_3A42C;
    v53[3] = &unk_38F660;
    id v45 = v43;
    id v54 = v45;
    double v55 = &v56;
    [v44 enumerateObjectsUsingBlock:v53];
  }
  if (*((unsigned char *)v57 + 24))
  {
    double v46 = BSUIBundle();
    if (v6) {
      [v46 localizedStringForKey:@"The books were added to your Want to Read list in Home, and samples were downloaded.", &stru_39B8B0, @"BookStoreUILocalizable" value table];
    }
    else {
      [v46 localizedStringForKey:@"These books were added to your Want to Read list in Home, and samples were downloaded.", &stru_39B8B0, @"BookStoreUILocalizable" value table];
    }
  }
  else
  {
    double v46 = BSUIBundle();
    if (v6) {
      [v46 localizedStringForKey:@"The books were added to your Want to Read list in Home." value:&stru_39B8B0 table:@"BookStoreUILocalizable"];
    }
    else {
      [v46 localizedStringForKey:@"These books were added to your Want to Read list in Home." value:&stru_39B8B0 table:@"BookStoreUILocalizable"];
    }
  uint64_t v47 = };
  double v52 = (void *)v47;

  _Block_object_dispose(&v56, 8);
LABEL_73:

  return v52;
}

+ (UIImage)noticeViewAddedImage
{
  v2 = +[UIImage systemImageNamed:@"text.badge.checkmark"];
  id v3 = +[UIImageSymbolConfiguration configurationWithPointSize:192.0];
  BOOL v4 = [v2 imageWithConfiguration:v3];

  return (UIImage *)v4;
}

+ (void)presentNoticeForRemovingBooks:(id)a3 fromCollectionNamed:(id)a4 options:(id)a5 useNonSpecificDeterminerInMessage:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = BSUIBundle();
  id v13 = [v12 localizedStringForKey:@"\\U2026" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];
  id v14 = [v11 stringByTruncatingToLength:50 options:3 truncationString:v13];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_3A6C8;
  v18[3] = &unk_38F688;
  BOOL v22 = a6;
  id v19 = v9;
  id v20 = v14;
  id v21 = v10;
  id v15 = v10;
  id v16 = v14;
  id v17 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
}

+ (void)presentNoticeForBookLoved:(BOOL)a3 options:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  BOOL v6 = BSUIBundle();
  BOOL v7 = v6;
  if (v4)
  {
    id v8 = [v6 localizedStringForKey:@"Suggest More" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

    id v9 = BSUIBundle();
    id v10 = v9;
    CFStringRef v11 = @"Books will suggest more like this.";
  }
  else
  {
    id v8 = [v6 localizedStringForKey:@"Suggest Less" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

    id v9 = BSUIBundle();
    id v10 = v9;
    CFStringRef v11 = @"Books will suggest less like this.";
  }
  uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3AC00;
  v16[3] = &unk_38F688;
  BOOL v20 = v4;
  id v17 = v8;
  id v18 = v12;
  id v19 = v5;
  id v13 = v5;
  id v14 = v12;
  id v15 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
}

+ (void)presentNoticeForMigratingBooksCollection:(id)a3 options:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3AD88;
  v7[3] = &unk_38E1F8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

+ (void)presentNoticeForNoSampleAvailable:(BOOL)a3 options:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = BSUIBundle();
  BOOL v7 = [v6 localizedStringForKey:@"No Sample" value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  id v8 = BSUIBundle();
  id v9 = v8;
  if (v4) {
    CFStringRef v10 = @"There’s no sample available for this audiobook.";
  }
  else {
    CFStringRef v10 = @"There’s no sample available for this book.";
  }
  CFStringRef v11 = [v8 localizedStringForKey:v10 value:&stru_39B8B0 table:@"BookStoreUILocalizable"];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3B08C;
  block[3] = &unk_38E360;
  id v16 = v7;
  id v17 = v11;
  id v18 = v5;
  id v12 = v5;
  id v13 = v11;
  id v14 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (double)noticeTotalDuration
{
  return 1.7;
}

- (int64_t)_lineCountForLabel:(id)a3 constrainedToWidth:(double)a4
{
  id v5 = a3;
  id v6 = [v5 text];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSStringDrawingContext);
    [v7 setWantsNumberOfLineFragments:1];
    id v8 = [v5 text];
    NSAttributedStringKey v13 = NSFontAttributeName;
    id v9 = [v5 font];
    id v14 = v9;
    CFStringRef v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v8 boundingRectWithSize:33 options:v10 attributes:v7 context:a4];

    id v11 = [v7 numberOfLineFragments];
  }
  else
  {
    id v11 = 0;
  }

  return (int64_t)v11;
}

+ (BOOL)allowsAutoDownloadOfSamplesToWantToRead
{
  objc_opt_class();
  v2 = +[BCRCDataContainer defaultContainer];
  id v3 = [v2 configs];
  BOOL v4 = [v3 valueForKeyPath:BRCBooksDefaultsKeyReadingNowWtrSimpleModeEnabled];
  id v5 = BUDynamicCast();

  LOBYTE(v2) = [v5 BOOLValue] ^ 1;
  return (char)v2;
}

- (NSString)noticeTitle
{
  return self->_noticeTitle;
}

- (void)setNoticeTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)confirmString
{
  return self->_confirmString;
}

- (void)setConfirmString:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (BOOL)iconImageAlwaysTemplate
{
  return self->_iconImageAlwaysTemplate;
}

- (void)setIconImageAlwaysTemplate:(BOOL)a3
{
  self->_iconImageAlwaysTemplate = a3;
}

- (UILabel)confirmLabel
{
  return self->_confirmLabel;
}

- (void)setConfirmLabel:(id)a3
{
}

- (void)setNoticeView:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BSUINoticeViewLayout)noticeViewLayout
{
  return self->_noticeViewLayout;
}

- (void)setNoticeViewLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noticeViewLayout, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_noticeView, 0);
  objc_storeStrong((id *)&self->_confirmLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_confirmString, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_noticeTitle, 0);
}

+ (NSDictionary)noticeViewTitleFontAttributes
{
  sub_1D99A0();
  id v4 = [self bc_booksKeyColor];
  TextAttributesBuilder.build()();
  swift_bridgeObjectRelease();

  type metadata accessor for Key(0);
  sub_FE4B8();
  v2.super.isa = sub_2E4330().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

+ (NSDictionary)noticeViewMessageFontAttributes
{
  return (NSDictionary *)sub_FE2F8((uint64_t)a1, (uint64_t)a2, (uint64_t *)&UIFontWeightMedium);
}

+ (NSDictionary)noticeViewConfirmLabelFontAttributes
{
  return (NSDictionary *)sub_FE2F8((uint64_t)a1, (uint64_t)a2, (uint64_t *)&UIFontWeightSemibold);
}

+ (void)presentNoticeForAddingAssets:(id)a3 collectionTitle:(id)a4 collectionID:(id)a5 sourceViewController:(id)a6 options:(id)a7
{
  uint64_t v10 = sub_63BAC((uint64_t *)&unk_3CE280);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_63BF0(0, &qword_3C7460);
  uint64_t v13 = sub_2E4350();
  uint64_t v24 = sub_2E4420();
  uint64_t v15 = v14;
  if (!a5)
  {
    uint64_t v16 = 0;
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v16 = sub_2E4420();
  a5 = v17;
  if (a7) {
LABEL_3:
  }
    a7 = (id)sub_2E4350();
LABEL_4:
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v19 = sub_2E4780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v12, 1, 1, v19);
  sub_2E4740();
  swift_bridgeObjectRetain();
  id v20 = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2E4730();
  BOOL v22 = (void *)swift_allocObject();
  v22[2] = v21;
  v22[3] = &protocol witness table for MainActor;
  v22[4] = ObjCClassMetadata;
  v22[5] = v13;
  v22[6] = v24;
  v22[7] = v15;
  v22[8] = v16;
  v22[9] = a5;
  v22[10] = a7;
  v22[11] = a6;
  sub_25CA94((uint64_t)v12, (uint64_t)&unk_3D3988, (uint64_t)v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end