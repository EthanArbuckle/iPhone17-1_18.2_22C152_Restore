@interface CRLiOSInspectorTableViewCell
+ (BOOL)requiresConstraintBasedLayout;
+ (double)minimumHeight;
+ (id)checkableCellWithImage:(id)a3 checkmarkOnLeadingEdge:(BOOL)a4 checked:(BOOL)a5 reuseIdentifier:(id)a6;
+ (id)checkableCellWithTitle:(id)a3 checkmarkOnLeadingEdge:(BOOL)a4 checked:(BOOL)a5 reuseIdentifier:(id)a6;
+ (id)checkableCellWithTitle:(id)a3 detailText:(id)a4 checkmarkOnLeadingEdge:(BOOL)a5 checked:(BOOL)a6 reuseIdentifier:(id)a7;
+ (id)checkableSubtitleCellWithTitle:(id)a3 subtitle:(id)a4 checkmarkOnLeadingEdge:(BOOL)a5 checked:(BOOL)a6 reuseIdentifier:(id)a7;
- (BOOL)automaticallyResizesForContentSizeCategory;
- (BOOL)checkable;
- (BOOL)checked;
- (BOOL)constraintConstantsNeedUpdate;
- (BOOL)currentContentSizeCategoryWrapsToNextLine;
- (BOOL)disablesContentWhenNotUserInteractive;
- (BOOL)expandAccessoryViewToFillCellHorizontally;
- (BOOL)expandTextLabelToFillCell;
- (BOOL)firstRowHasContent;
- (BOOL)fullSizeControlReplacesTextLabel;
- (BOOL)hasTextLabel;
- (BOOL)imageUsesStandardMargins;
- (BOOL)imageUsesTitleLabelColor;
- (BOOL)needsPaddingOnLeadingContentAnchor;
- (BOOL)needsPaddingOnTrailingContentAnchor;
- (BOOL)p_needsConstraintsUpdateForElements:(unint64_t)a3;
- (BOOL)preventTextLabelFromCompression;
- (BOOL)secondRowHasContent;
- (BOOL)showsCheckmarkOnLeadingEdge;
- (BOOL)showsImageButtonTrailingAdjacentToLabel;
- (BOOL)showsImageOnTrailingEdge;
- (BOOL)thirdRowHasContent;
- (BOOL)titleAreaHasContent;
- (BOOL)usesContentViewInsteadOfSafeAreaLayoutGuide;
- (BOOL)usesDetailButtonColor;
- (BOOL)usesDisclosureDetailLabelColor;
- (BOOL)usesSubtitleLabelColor;
- (BOOL)usesTitleLabelColor;
- (CRLiOSInspectorCheckmark)checkmarkView;
- (CRLiOSInspectorLabel)customTextLabel;
- (CRLiOSInspectorTableCellImageButton)customImageButton;
- (CRLiOSInspectorTableCellImageView)customImageView;
- (CRLiOSInspectorTableViewCell)initWithCoder:(id)a3;
- (CRLiOSInspectorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CRLiOSInspectorTableViewCellBackgroundView)customBackgroundView;
- (CRLiOSInspectorTableViewCellSelectedBackgroundView)customSelectedBackgroundView;
- (NSArray)activeConstraints;
- (NSLayoutXAxisAnchor)leadingContentTrailingEdgeAnchor;
- (NSLayoutXAxisAnchor)trailingContentLeadingEdgeAnchor;
- (UIButton)imageButton;
- (UIColor)detailButtonColor;
- (UIColor)detailLabelColor;
- (UIColor)disclosureDetailLabelColor;
- (UIColor)subtitleLabelColor;
- (UIColor)titleLabelColor;
- (UIEdgeInsets)fullSizeControlInsets;
- (UIEdgeInsets)imageInsets;
- (UIImage)customCheckmarkImage;
- (UIImage)customHighlightedCheckmarkImage;
- (UIImageView)disclosureView;
- (UILabel)customDetailTextLabel;
- (UILayoutGuide)accessoryViewLayoutGuide;
- (UILayoutGuide)firstRowCenterFreeSpaceLayoutGuide;
- (UILayoutGuide)firstRowLayoutGuide;
- (UILayoutGuide)insetFirstRowCenterFreeSpaceLayoutGuide;
- (UILayoutGuide)secondRowLayoutGuide;
- (UILayoutGuide)thirdRowLayoutGuide;
- (UILayoutGuide)titleAndDetailLayoutGuide;
- (UILayoutGuide)titleAreaLayoutGuide;
- (UIView)customAccessoryView;
- (UIView)customStandardAccessoryView;
- (UIView)fullSizeControl;
- (double)activeAccessibilitySizeMultiplier;
- (double)legacyFixedRowHeight;
- (double)minimumRowHeight;
- (double)p_currentAccessibilitySizeRatio;
- (double)p_generateConstraintsForLeadingSideElements:(unint64_t)a3 intoArray:(id)a4;
- (double)p_minimumVerticalTitlePadding;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)accessoryView;
- (id)activeLayoutConstraints;
- (id)imageView;
- (id)p_centerYConstraintForView:(id)a3 atAnchor:(id)a4;
- (id)p_currentDetailLabelFont;
- (id)p_currentLabelFont;
- (id)p_mainLayoutAnchorOwner;
- (id)p_safeAreaLayoutGuide;
- (id)p_standardLabelFont;
- (int64_t)accessoryType;
- (int64_t)customAccessoryType;
- (unint64_t)activeConstrainedElements;
- (unint64_t)p_elementsToConstrain;
- (void)dealloc;
- (void)layoutSubviews;
- (void)p_commonInitWithStyle:(int64_t)a3;
- (void)p_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)p_detailButtonTapped:(id)a3;
- (void)p_generateConstraintsForAccessoryAreaOnFirstLine:(unint64_t)a3 intoArray:(id)a4;
- (void)p_generateConstraintsForAccessoryAreaOnSecondLine:(unint64_t)a3 intoArray:(id)a4;
- (void)p_generateConstraintsForFirstRowLayoutGuideIntoArray:(id)a3;
- (void)p_generateConstraintsForFullSizeControl:(unint64_t)a3 intoArray:(id)a4;
- (void)p_generateConstraintsForImage:(id)a3 container:(id)a4 intoArray:(id)a5;
- (void)p_generateConstraintsForLegacyFixedRowHeightIntoArray:(id)a3;
- (void)p_generateConstraintsForSecondRowLayoutGuide:(unint64_t)a3 intoArray:(id)a4;
- (void)p_generateConstraintsForThirdRowLayoutGuide:(unint64_t)a3 intoArray:(id)a4;
- (void)p_generateConstraintsForTitleArea:(unint64_t)a3 margin:(double)a4 intoArray:(id)a5;
- (void)p_generateConstraintsForTitleAreaTrailingAnchor:(unint64_t)a3 intoArray:(id)a4;
- (void)p_generateConstraintsForTrailingSideElements:(unint64_t)a3 intoArray:(id)a4;
- (void)p_generateGeneralConstraintsForImages:(unint64_t)a3 intoArray:(id)a4;
- (void)p_imageDidChange;
- (void)p_prepareToChangeConstraintsForElements:(unint64_t)a3;
- (void)p_setNeedsUpdateConstraints;
- (void)p_updateConstraintsForElements:(unint64_t)a3;
- (void)p_updateImageTintColor;
- (void)setAccessoryType:(int64_t)a3;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewLayoutGuide:(id)a3;
- (void)setActiveAccessibilitySizeMultiplier:(double)a3;
- (void)setActiveConstrainedElements:(unint64_t)a3;
- (void)setActiveConstraints:(id)a3;
- (void)setAutomaticallyResizesForContentSizeCategory:(BOOL)a3;
- (void)setCheckable:(BOOL)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setConstraintConstantsNeedUpdate:(BOOL)a3;
- (void)setCustomAccessoryType:(int64_t)customAccessoryType;
- (void)setCustomAccessoryView:(id)a3;
- (void)setCustomCheckmarkImage:(id)a3;
- (void)setCustomDetailTextLabel:(id)a3;
- (void)setCustomHighlightedCheckmarkImage:(id)a3;
- (void)setCustomImageButton:(id)a3;
- (void)setCustomImageView:(id)a3;
- (void)setCustomStandardAccessoryView:(id)a3;
- (void)setCustomTextLabel:(id)a3;
- (void)setDetailButtonColor:(id)a3;
- (void)setDetailLabelColor:(id)a3;
- (void)setDisablesContentWhenNotUserInteractive:(BOOL)a3;
- (void)setDisclosureDetailLabelColor:(id)a3;
- (void)setDisclosureView:(id)a3;
- (void)setExpandAccessoryViewToFillCellHorizontally:(BOOL)a3;
- (void)setExpandTextLabelToFillCell:(BOOL)a3;
- (void)setFirstRowCenterFreeSpaceLayoutGuide:(id)a3;
- (void)setFirstRowHasContent:(BOOL)a3;
- (void)setFirstRowLayoutGuide:(id)a3;
- (void)setFullSizeControl:(id)a3;
- (void)setFullSizeControlInsets:(UIEdgeInsets)a3;
- (void)setFullSizeControlReplacesTextLabel:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setImageUsesStandardMargins:(BOOL)a3;
- (void)setImageUsesTitleLabelColor:(BOOL)a3;
- (void)setInsetFirstRowCenterFreeSpaceLayoutGuide:(id)a3;
- (void)setLeadingContentTrailingEdgeAnchor:(id)a3;
- (void)setLegacyFixedRowHeight:(double)a3;
- (void)setNeedsPaddingOnLeadingContentAnchor:(BOOL)a3;
- (void)setNeedsPaddingOnTrailingContentAnchor:(BOOL)a3;
- (void)setNeedsUpdateConstraints;
- (void)setPreventTextLabelFromCompression:(BOOL)a3;
- (void)setSecondRowHasContent:(BOOL)a3;
- (void)setSecondRowLayoutGuide:(id)a3;
- (void)setShowsCheckmarkOnLeadingEdge:(BOOL)a3;
- (void)setShowsImageButtonTrailingAdjacentToLabel:(BOOL)a3;
- (void)setShowsImageOnTrailingEdge:(BOOL)a3;
- (void)setSubtitleLabelColor:(id)a3;
- (void)setThirdRowHasContent:(BOOL)a3;
- (void)setThirdRowLayoutGuide:(id)a3;
- (void)setTitleAndDetailLayoutGuide:(id)a3;
- (void)setTitleAreaHasContent:(BOOL)a3;
- (void)setTitleAreaLayoutGuide:(id)a3;
- (void)setTitleLabelColor:(id)a3;
- (void)setTrailingContentLeadingEdgeAnchor:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUsesContentViewInsteadOfSafeAreaLayoutGuide:(BOOL)a3;
- (void)setUsesDetailButtonColor:(BOOL)a3;
- (void)setUsesDisclosureDetailLabelColor:(BOOL)a3;
- (void)setUsesSubtitleLabelColor:(BOOL)a3;
- (void)setUsesTitleLabelColor:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation CRLiOSInspectorTableViewCell

- (CRLiOSInspectorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6E70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ADDF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6E90);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell initWithStyle:reuseIdentifier:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:205 isFatal:0 description:"Table View Cell style Value2 is not supported in CRLiOSInspectorTableViewCell."];

    a3 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)CRLiOSInspectorTableViewCell;
  v10 = [(CRLiOSInspectorTableViewCell *)&v13 initWithStyle:a3 reuseIdentifier:v6];
  v11 = v10;
  if (v10) {
    [(CRLiOSInspectorTableViewCell *)v10 p_commonInitWithStyle:a3];
  }

  return v11;
}

- (CRLiOSInspectorTableViewCell)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSInspectorTableViewCell;
  v5 = [(CRLiOSInspectorTableViewCell *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeIntegerForKey:@"UITableViewCellStyle"];
    if (v6 == (id)2)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6EB0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010ADE80();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6ED0);
      }
      v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell initWithCoder:]");
      v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:219 isFatal:0 description:"Table View Cell style Value2 is not supported in CRLiOSInspectorTableViewCell."];
    }
    [(CRLiOSInspectorTableViewCell *)v5 p_commonInitWithStyle:v6];
  }

  return v5;
}

- (void)p_commonInitWithStyle:(int64_t)a3
{
  self->_cellStyle = a3;
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = (NSArray *)&__NSArray0__struct;

  self->_activeConstrainedElements = 0;
  self->_automaticallyResizesForContentSizeCategordouble y = 1;
  self->_usesTitleLabelColor = 1;
  self->_imageUsesTitleLabelColor = 1;
  self->_expandTextLabelToFillCell = 0;
  v5 = [CRLiOSInspectorTableViewCellBackgroundView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[CRLiOSInspectorTableViewCellBackgroundView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  customBackgroundView = self->_customBackgroundView;
  self->_customBackgroundView = v9;

  [(CRLiOSInspectorTableViewCell *)self setBackgroundView:self->_customBackgroundView];
  objc_super v11 = -[CRLiOSInspectorTableViewCellSelectedBackgroundView initWithFrame:]([CRLiOSInspectorTableViewCellSelectedBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  customSelectedBackgroundView = self->_customSelectedBackgroundView;
  self->_customSelectedBackgroundView = v11;

  [(CRLiOSInspectorTableViewCell *)self setSelectedBackgroundView:self->_customSelectedBackgroundView];
  objc_super v13 = +[UIColor labelColor];
  objc_storeWeak((id *)&self->_titleLabelColor, v13);

  v14 = +[UIColor secondaryLabelColor];
  objc_storeWeak((id *)&self->_detailLabelColor, v14);

  v15 = +[UIColor secondaryLabelColor];
  objc_storeWeak((id *)&self->_disclosureDetailLabelColor, v15);

  self->_usesDisclosureDetailLabelColor = 1;
  self->_usesSubtitleLabelColor = 0;
  [(CRLiOSInspectorTableViewCell *)self setIndentationWidth:16.0];
  self->_disablesContentWhenNotUserInteractive = 1;
  long long v16 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_imageInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_imageInsets.bottom = v16;
  v17 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  firstRowLayoutGuide = self->_firstRowLayoutGuide;
  self->_firstRowLayoutGuide = v17;

  [(UILayoutGuide *)self->_firstRowLayoutGuide setIdentifier:@"firstRowLayoutGuide"];
  v19 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v19 addLayoutGuide:self->_firstRowLayoutGuide];

  v20 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  secondRowLayoutGuide = self->_secondRowLayoutGuide;
  self->_secondRowLayoutGuide = v20;

  [(UILayoutGuide *)self->_secondRowLayoutGuide setIdentifier:@"secondRowLayoutGuide"];
  v22 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v22 addLayoutGuide:self->_secondRowLayoutGuide];

  v23 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  thirdRowLayoutGuide = self->_thirdRowLayoutGuide;
  self->_thirdRowLayoutGuide = v23;

  [(UILayoutGuide *)self->_thirdRowLayoutGuide setIdentifier:@"thirdRowLayoutGuide"];
  v25 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v25 addLayoutGuide:self->_thirdRowLayoutGuide];

  v26 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  titleAreaLayoutGuide = self->_titleAreaLayoutGuide;
  self->_titleAreaLayoutGuide = v26;

  [(UILayoutGuide *)self->_titleAreaLayoutGuide setIdentifier:@"titleAreaLayoutGuide"];
  v28 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v28 addLayoutGuide:self->_titleAreaLayoutGuide];

  v29 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  accessoryViewLayoutGuide = self->_accessoryViewLayoutGuide;
  self->_accessoryViewLayoutGuide = v29;

  [(UILayoutGuide *)self->_accessoryViewLayoutGuide setIdentifier:@"accessoryViewLayoutGuide"];
  v31 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v31 addLayoutGuide:self->_accessoryViewLayoutGuide];

  v32 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  firstRowCenterFreeSpaceLayoutGuide = self->_firstRowCenterFreeSpaceLayoutGuide;
  self->_firstRowCenterFreeSpaceLayoutGuide = v32;

  [(UILayoutGuide *)self->_firstRowCenterFreeSpaceLayoutGuide setIdentifier:@"firstRowCenterFreeSpaceLayoutGuide"];
  v34 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v34 addLayoutGuide:self->_firstRowCenterFreeSpaceLayoutGuide];

  v35 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  insetFirstRowCenterFreeSpaceLayoutGuide = self->_insetFirstRowCenterFreeSpaceLayoutGuide;
  self->_insetFirstRowCenterFreeSpaceLayoutGuide = v35;

  [(UILayoutGuide *)self->_insetFirstRowCenterFreeSpaceLayoutGuide setIdentifier:@"insetFirstRowCenterFreeSpaceLayoutGuide"];
  v37 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v37 addLayoutGuide:self->_insetFirstRowCenterFreeSpaceLayoutGuide];

  v38 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  titleAndDetailLayoutGuide = self->_titleAndDetailLayoutGuide;
  self->_titleAndDetailLayoutGuide = v38;

  [(UILayoutGuide *)self->_titleAndDetailLayoutGuide setIdentifier:@"titleAndDetailLayoutGuide"];
  v40 = [(CRLiOSInspectorTableViewCell *)self contentView];
  [v40 addLayoutGuide:self->_titleAndDetailLayoutGuide];

  v41 = [(CRLiOSInspectorTableViewCell *)self heightAnchor];
  [(id)objc_opt_class() minimumHeight];
  [v41 constraintGreaterThanOrEqualToConstant:];
  id v44 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v42) = 1148829696;
  [v44 setPriority:v42];
  [v44 setActive:1];
  v43 = +[NSNotificationCenter defaultCenter];
  [v43 addObserver:self selector:"p_willChangeStatusBarOrientation:" name:UIApplicationWillChangeStatusBarOrientationNotification object:0];
  [v43 addObserver:self selector:"p_contentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];
  [(CRLiOSInspectorTableViewCell *)self p_setNeedsUpdateConstraints];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSInspectorTableViewCell;
  [(CRLiOSInspectorTableViewCell *)&v4 dealloc];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (BOOL)currentContentSizeCategoryWrapsToNextLine
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (CRLiOSInspectorLabel)customTextLabel
{
  customTextLabel = self->_customTextLabel;
  if (!customTextLabel)
  {
    objc_super v4 = -[CRLiOSInspectorLabel initWithFrame:]([CRLiOSInspectorLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_customTextLabel;
    self->_customTextLabel = v4;

    id v6 = [(CRLiOSInspectorTableViewCell *)self p_currentLabelFont];
    [(CRLiOSInspectorLabel *)self->_customTextLabel setFont:v6];

    v7 = [(CRLiOSInspectorTableViewCell *)self contentView];
    [v7 addSubview:self->_customTextLabel];

    [(CRLiOSInspectorTableViewCell *)self p_setNeedsUpdateConstraints];
    customTextLabel = self->_customTextLabel;
  }

  return customTextLabel;
}

- (BOOL)hasTextLabel
{
  return self->_customTextLabel != 0;
}

- (UILabel)customDetailTextLabel
{
  customDetailTextLabel = self->_customDetailTextLabel;
  if (!customDetailTextLabel)
  {
    if (self->_cellStyle)
    {
      objc_super v4 = -[CRLiOSInspectorLabel initWithFrame:]([CRLiOSInspectorLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v5 = self->_customDetailTextLabel;
      self->_customDetailTextLabel = &v4->super;

      id v6 = [(CRLiOSInspectorTableViewCell *)self p_currentDetailLabelFont];
      [(UILabel *)self->_customDetailTextLabel setFont:v6];

      v7 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v7 addSubview:self->_customDetailTextLabel];

      [(CRLiOSInspectorTableViewCell *)self p_setNeedsUpdateConstraints];
      customDetailTextLabel = self->_customDetailTextLabel;
    }
    else
    {
      customDetailTextLabel = 0;
    }
  }

  return customDetailTextLabel;
}

- (CRLiOSInspectorTableCellImageView)customImageView
{
  customImageView = self->_customImageView;
  if (!customImageView)
  {
    objc_super v4 = -[CRLiOSInspectorTableCellImageView initWithFrame:]([CRLiOSInspectorTableCellImageView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_customImageView;
    self->_customImageView = v4;

    [(CRLiOSInspectorTableCellImageView *)self->_customImageView setContentMode:4];
    [(CRLiOSInspectorTableCellImageView *)self->_customImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CRLiOSInspectorTableCellImageView *)self->_customImageView setParentCell:self];
    id v6 = [(CRLiOSInspectorTableViewCell *)self contentView];
    [v6 addSubview:self->_customImageView];

    [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton removeFromSuperview];
    customImageButton = self->_customImageButton;
    self->_customImageButton = 0;

    [(CRLiOSInspectorTableViewCell *)self p_setNeedsUpdateConstraints];
    customImageView = self->_customImageView;
  }

  return customImageView;
}

- (CRLiOSInspectorTableCellImageButton)customImageButton
{
  customImageButton = self->_customImageButton;
  if (!customImageButton)
  {
    objc_super v4 = -[CRLiOSInspectorTableCellImageButton initWithFrame:]([CRLiOSInspectorTableCellImageButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_customImageButton;
    self->_customImageButton = v4;

    [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton setContentMode:4];
    [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton setParentCell:self];
    id v6 = [(CRLiOSInspectorTableViewCell *)self contentView];
    [v6 addSubview:self->_customImageButton];

    [(CRLiOSInspectorTableCellImageView *)self->_customImageView removeFromSuperview];
    customImageView = self->_customImageView;
    self->_customImageView = 0;

    [(CRLiOSInspectorTableViewCell *)self p_setNeedsUpdateConstraints];
    customImageButton = self->_customImageButton;
  }

  return customImageButton;
}

- (int64_t)customAccessoryType
{
  return self->_customAccessoryType;
}

- (void)setCustomAccessoryType:(int64_t)customAccessoryType
{
  if (customAccessoryType == 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6EF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ADF08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6F10);
    }
    objc_super v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell setCustomAccessoryType:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"];

    [(CRLiOSInspectorTableViewCell *)self setChecked:1];
  }
  else if (self->_customAccessoryType != customAccessoryType)
  {
    self->_customAccessoryType = customAccessoryType;
    customStandardAccessoryView = self->_customStandardAccessoryView;
    if (customStandardAccessoryView)
    {
      [(UIView *)customStandardAccessoryView removeFromSuperview];
      customAccessoryType = self->_customAccessoryType;
    }
    if ((unint64_t)customAccessoryType <= 4)
    {
      if (((1 << customAccessoryType) & 0xB) != 0)
      {
        v8 = self->_customStandardAccessoryView;
        self->_customStandardAccessoryView = 0;
      }
      else
      {
        v9 = +[UIButton buttonWithType:2];
        [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIView *)v9 addTarget:self action:"p_detailButtonTapped:" forControlEvents:64];
        v10 = self->_customStandardAccessoryView;
        self->_customStandardAccessoryView = v9;
        objc_super v11 = v9;

        v8 = [(CRLiOSInspectorTableViewCell *)self contentView];
        [v8 addSubview:self->_customStandardAccessoryView];
      }
    }
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setCustomAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  p_customAccessoryView = &self->_customAccessoryView;
  customAccessoryView = self->_customAccessoryView;
  if (customAccessoryView != v5)
  {
    v9 = v5;
    if (customAccessoryView) {
      [(UIView *)customAccessoryView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_customAccessoryView, a3);
    if (*p_customAccessoryView)
    {
      v8 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v8 addSubview:*p_customAccessoryView];
    }
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
    v5 = v9;
  }
}

+ (double)minimumHeight
{
  return 44.0;
}

- (void)setCheckable:(BOOL)a3
{
  if (self->_checkable != a3)
  {
    self->_checkable = a3;
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
    BOOL v4 = !self->_checked;
    id v5 = [(CRLiOSInspectorTableViewCell *)self checkmarkView];
    [v5 setHidden:v4];
  }
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_checkable)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6F30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010ADF90();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6F50);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell setChecked:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"];
  }
  if (self->_checked != v3)
  {
    self->_checked = v3;
    v8 = [(CRLiOSInspectorTableViewCell *)self checkmarkView];
    [v8 setHidden:!v3];
  }
  if (v3)
  {
    unint64_t v9 = (unint64_t)[(CRLiOSInspectorTableViewCell *)self accessibilityTraits];
    UIAccessibilityTraits v10 = UIAccessibilityTraitSelected | v9;
  }
  else
  {
    UIAccessibilityTraits v11 = UIAccessibilityTraitSelected;
    UIAccessibilityTraits v10 = (unint64_t)[(CRLiOSInspectorTableViewCell *)self accessibilityTraits] & ~v11;
  }
  [(CRLiOSInspectorTableViewCell *)self setAccessibilityTraits:v10];
}

- (void)setCustomCheckmarkImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_customCheckmarkImage != v5)
  {
    objc_storeStrong((id *)&self->_customCheckmarkImage, a3);
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setCustomCheckmarkImage:v5];
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setUsesCustomCheckmarkImage:v5 != 0];
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setCustomHighlightedCheckmarkImage:(id)a3
{
  id v6 = (UIImage *)a3;
  if (self->_customHighlightedCheckmarkImage != v6)
  {
    objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, a3);
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setCustomHighlightedCheckmarkImage:v6];
    id v5 = [(CRLiOSInspectorCheckmark *)self->_checkmarkView customCheckmarkImage];
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setUsesCustomCheckmarkImage:v5 != 0];

    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setFullSizeControl:(id)a3
{
  id v5 = (UIView *)a3;
  fullSizeControl = self->_fullSizeControl;
  if (fullSizeControl != v5)
  {
    v7 = v5;
    if (fullSizeControl) {
      [(UIView *)fullSizeControl removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_fullSizeControl, a3);
    [(UIView *)self->_fullSizeControl removeFromSuperview];
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
    id v5 = v7;
  }
}

- (void)setFullSizeControlInsets:(UIEdgeInsets)a3
{
  if (self->_fullSizeControlInsets.left != a3.left
    || self->_fullSizeControlInsets.top != a3.top
    || self->_fullSizeControlInsets.right != a3.right
    || self->_fullSizeControlInsets.bottom != a3.bottom)
  {
    self->_fullSizeControlInsets = a3;
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_imageInsets.left
    || a3.top != self->_imageInsets.top
    || a3.right != self->_imageInsets.right
    || a3.bottom != self->_imageInsets.bottom)
  {
    self->_imageInsets = a3;
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setImageUsesStandardMargins:(BOOL)a3
{
  if (self->_imageUsesStandardMargins != a3)
  {
    self->_imageUsesStandardMargins = a3;
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (UIButton)imageButton
{
  return (UIButton *)[(CRLiOSInspectorTableViewCell *)self customImageButton];
}

- (void)setTitleLabelColor:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabelColor);
  if (WeakRetained == obj)
  {
  }
  else
  {
    BOOL usesTitleLabelColor = self->_usesTitleLabelColor;

    if (usesTitleLabelColor)
    {
      objc_storeWeak((id *)&self->_titleLabelColor, obj);
      [(CRLiOSInspectorLabel *)self->_customTextLabel setTextColor:obj];
      if (self->_imageUsesTitleLabelColor) {
        [(CRLiOSInspectorTableViewCell *)self p_updateImageTintColor];
      }
    }
  }
}

- (void)setImageUsesTitleLabelColor:(BOOL)a3
{
  if (self->_imageUsesTitleLabelColor != a3)
  {
    self->_imageUsesTitleLabelColor = a3;
    [(CRLiOSInspectorTableViewCell *)self p_updateImageTintColor];
  }
}

- (void)setDetailLabelColor:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabelColor);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_detailLabelColor, obj);
    int64_t cellStyle = self->_cellStyle;
    if (cellStyle == 3 || cellStyle == 1 && !self->_usesDisclosureDetailLabelColor) {
      id v5 = [(UILabel *)self->_customDetailTextLabel setTextColor:obj];
    }
  }

  _objc_release_x2(v5);
}

- (void)setDisclosureDetailLabelColor:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureDetailLabelColor);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_disclosureDetailLabelColor, obj);
    if (self->_cellStyle == 1 && self->_usesDisclosureDetailLabelColor) {
      id v5 = [(UILabel *)self->_customDetailTextLabel setTextColor:obj];
    }
  }

  _objc_release_x2(v5);
}

- (void)setSubtitleLabelColor:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabelColor);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_subtitleLabelColor, obj);
    if (self->_cellStyle == 3 && self->_usesSubtitleLabelColor) {
      id v5 = [(UILabel *)self->_customDetailTextLabel setTextColor:obj];
    }
  }

  _objc_release_x2(v5);
}

- (void)setDetailButtonColor:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailButtonColor);
  if (WeakRetained == obj)
  {
  }
  else
  {
    BOOL usesDetailButtonColor = self->_usesDetailButtonColor;

    if (usesDetailButtonColor)
    {
      objc_storeWeak((id *)&self->_detailButtonColor, obj);
      [(UIView *)self->_customStandardAccessoryView setTintColor:obj];
    }
  }
}

- (void)setUsesDetailButtonColor:(BOOL)a3
{
  if (self->_usesDetailButtonColor != a3)
  {
    self->_BOOL usesDetailButtonColor = a3;
    if ((self->_activeConstrainedElements & 0x400) != 0 && a3)
    {
      id v4 = [(CRLiOSInspectorTableViewCell *)self detailButtonColor];
      [(UIView *)self->_customStandardAccessoryView setTintColor:v4];
    }
  }
}

- (void)setUsesDisclosureDetailLabelColor:(BOOL)a3
{
  if (self->_usesDisclosureDetailLabelColor != a3)
  {
    self->_usesDisclosureDetailLabelColor = a3;
    if (self->_cellStyle == 1 && (self->_activeConstrainedElements & 0x200) != 0 && a3)
    {
      id v4 = [(CRLiOSInspectorTableViewCell *)self disclosureDetailLabelColor];
      [(UILabel *)self->_customDetailTextLabel setTextColor:v4];
    }
  }
}

- (void)setUsesSubtitleLabelColor:(BOOL)a3
{
  if (self->_usesSubtitleLabelColor != a3)
  {
    self->_usesSubtitleLabelColor = a3;
    if ((self->_activeConstrainedElements & 2) != 0 && a3)
    {
      id v4 = [(CRLiOSInspectorTableViewCell *)self subtitleLabelColor];
      [(UILabel *)self->_customDetailTextLabel setTextColor:v4];
    }
  }
}

- (void)setDisablesContentWhenNotUserInteractive:(BOOL)a3
{
  if (self->_disablesContentWhenNotUserInteractive != a3)
  {
    self->_disablesContentWhenNotUserInteractive = a3;
    id v4 = [(CRLiOSInspectorTableViewCell *)self isUserInteractionEnabled];
    [(CRLiOSInspectorTableViewCell *)self setUserInteractionEnabled:v4];
  }
}

- (void)setExpandAccessoryViewToFillCellHorizontally:(BOOL)a3
{
  if (self->_expandAccessoryViewToFillCellHorizontally != a3)
  {
    self->_expandAccessoryViewToFillCellHorizontalldouble y = a3;
    if ((self->_activeConstrainedElements & 0x400) != 0) {
      [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setPreventTextLabelFromCompression:(BOOL)a3
{
  if (self->_preventTextLabelFromCompression != a3)
  {
    self->_preventTextLabelFromCompression = a3;
    if (self->_activeConstrainedElements) {
      [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setAutomaticallyResizesForContentSizeCategory:(BOOL)a3
{
  if (self->_automaticallyResizesForContentSizeCategory != a3)
  {
    self->_automaticallyResizesForContentSizeCategordouble y = a3;
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setLegacyFixedRowHeight:(double)a3
{
  if (self->_legacyFixedRowHeight != a3)
  {
    if (a3 < 0.0) {
      a3 = 0.0;
    }
    if (a3 > 0.0) {
      self->_automaticallyResizesForContentSizeCategordouble y = 0;
    }
    self->_legacyFixedRowHeight = a3;
    [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (id)activeLayoutConstraints
{
  return self->_activeConstraints;
}

- (unint64_t)p_elementsToConstrain
{
  customTextLabel = self->_customTextLabel;
  if (customTextLabel)
  {
    id v4 = [(CRLiOSInspectorLabel *)customTextLabel text];
    uint64_t v5 = [v4 length] != 0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  customDetailTextLabel = self->_customDetailTextLabel;
  if (customDetailTextLabel)
  {
    v7 = [(UILabel *)customDetailTextLabel text];
    id v8 = [v7 length];

    if (v8)
    {
      int64_t cellStyle = self->_cellStyle;
      if (cellStyle == 1)
      {
        if ([(CRLiOSInspectorTableViewCell *)self currentContentSizeCategoryWrapsToNextLine])
        {
          v5 |= 2uLL;
        }
        else
        {
          v5 |= 4uLL;
        }
      }
      else if (cellStyle == 3)
      {
        v5 |= 2uLL;
      }
    }
  }
  customImageView = self->_customImageView;
  if (customImageView)
  {
    UIAccessibilityTraits v11 = [(CRLiOSInspectorTableCellImageView *)customImageView image];

    if (v11)
    {
      if ([(CRLiOSInspectorTableViewCell *)self showsImageOnTrailingEdge]) {
        v5 |= 0x40uLL;
      }
      else {
        v5 |= 0x20uLL;
      }
    }
  }
  customImageButton = self->_customImageButton;
  if (customImageButton)
  {
    objc_super v13 = [(CRLiOSInspectorTableCellImageButton *)customImageButton imageForState:0];

    if (v13)
    {
      if ([(CRLiOSInspectorTableViewCell *)self showsImageOnTrailingEdge]) {
        v5 |= 0x100uLL;
      }
      else {
        v5 |= 0x80uLL;
      }
    }
  }
  if (self->_customAccessoryView) {
    uint64_t v14 = v5 | 0x400;
  }
  else {
    uint64_t v14 = v5;
  }
  int64_t customAccessoryType = self->_customAccessoryType;
  uint64_t v16 = v14 | 0x200;
  uint64_t v17 = v14 | 0x800;
  if (customAccessoryType == 2) {
    v14 |= 0xA00uLL;
  }
  if (customAccessoryType == 4) {
    uint64_t v14 = v17;
  }
  if (customAccessoryType == 1) {
    unint64_t v18 = v16;
  }
  else {
    unint64_t v18 = v14;
  }
  if ([(CRLiOSInspectorTableViewCell *)self checkable]
    && ([(CRLiOSInspectorTableViewCell *)self isEditing] & 1) == 0)
  {
    if ([(CRLiOSInspectorTableViewCell *)self showsCheckmarkOnLeadingEdge]) {
      v18 |= 0x10uLL;
    }
    else {
      v18 |= 8uLL;
    }
  }
  v19 = [(CRLiOSInspectorTableViewCell *)self fullSizeControl];

  if (v19) {
    return v18 | 0x1000;
  }
  else {
    return v18;
  }
}

- (void)p_prepareToChangeConstraintsForElements:(unint64_t)a3
{
  __int16 v3 = a3;
  unint64_t activeConstrainedElements = self->_activeConstrainedElements;
  +[NSLayoutConstraint deactivateConstraints:self->_activeConstraints];
  if (v3 & 1) == 0 || (activeConstrainedElements)
  {
    if ((v3 & 1) == 0)
    {
      unint64_t v9 = [(CRLiOSInspectorLabel *)self->_customTextLabel superview];

      if (v9) {
        [(CRLiOSInspectorLabel *)self->_customTextLabel removeFromSuperview];
      }
    }
  }
  else
  {
    id v6 = [(CRLiOSInspectorLabel *)self->_customTextLabel superview];

    if (!v6)
    {
      v7 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v7 addSubview:self->_customTextLabel];
    }
    if (self->_usesTitleLabelColor)
    {
      id v8 = [(CRLiOSInspectorTableViewCell *)self titleLabelColor];
      [(CRLiOSInspectorLabel *)self->_customTextLabel setTextColor:v8];
    }
  }
  if ((activeConstrainedElements & 6) != 0)
  {
    if ((v3 & 6) != 0) {
      goto LABEL_28;
    }
    goto LABEL_17;
  }
  if ((v3 & 6) != 0)
  {
    UIAccessibilityTraits v10 = [(UILabel *)self->_customDetailTextLabel superview];

    if (v10)
    {
      if ((v3 & 0x200) == 0) {
        goto LABEL_23;
      }
    }
    else
    {
      v12 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v12 addSubview:self->_customDetailTextLabel];

      if ((v3 & 0x200) == 0) {
        goto LABEL_23;
      }
    }
    if (self->_cellStyle == 1 && self->_usesDisclosureDetailLabelColor)
    {
      uint64_t v13 = [(CRLiOSInspectorTableViewCell *)self disclosureDetailLabelColor];
LABEL_27:
      uint64_t v14 = (void *)v13;
      [(UILabel *)self->_customDetailTextLabel setTextColor:v13];

      goto LABEL_28;
    }
LABEL_23:
    if ((v3 & 2) != 0 && self->_usesSubtitleLabelColor)
    {
      uint64_t v13 = [(CRLiOSInspectorTableViewCell *)self subtitleLabelColor];
    }
    else
    {
      uint64_t v13 = [(CRLiOSInspectorTableViewCell *)self detailLabelColor];
    }
    goto LABEL_27;
  }
LABEL_17:
  UIAccessibilityTraits v11 = [(UILabel *)self->_customDetailTextLabel superview];

  if (v11) {
    [(UILabel *)self->_customDetailTextLabel removeFromSuperview];
  }
LABEL_28:
  if ((v3 & 0x18) == 0 || (activeConstrainedElements & 0x18) != 0)
  {
    if ((v3 & 0x18) == 0)
    {
      v19 = [(CRLiOSInspectorCheckmark *)self->_checkmarkView superview];

      if (v19) {
        [(CRLiOSInspectorCheckmark *)self->_checkmarkView removeFromSuperview];
      }
    }
  }
  else
  {
    v15 = [(CRLiOSInspectorCheckmark *)self->_checkmarkView superview];

    if (!v15)
    {
      if (!self->_checkmarkView)
      {
        uint64_t v16 = +[CRLiOSInspectorCheckmark checkmark];
        checkmarkView = self->_checkmarkView;
        self->_checkmarkView = v16;

        [(CRLiOSInspectorCheckmark *)self->_checkmarkView setHidden:[(CRLiOSInspectorTableViewCell *)self checked] ^ 1];
        [(CRLiOSInspectorCheckmark *)self->_checkmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(CRLiOSInspectorCheckmark *)self->_checkmarkView setAccessibilityElementsHidden:1];
      }
      unint64_t v18 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v18 addSubview:self->_checkmarkView];

      if (self->_customCheckmarkImage)
      {
        [(CRLiOSInspectorCheckmark *)self->_checkmarkView setUsesCustomCheckmarkImage:1];
        [(CRLiOSInspectorCheckmark *)self->_checkmarkView setCustomCheckmarkImage:self->_customCheckmarkImage];
        [(CRLiOSInspectorCheckmark *)self->_checkmarkView setCustomHighlightedCheckmarkImage:self->_customHighlightedCheckmarkImage];
      }
    }
  }
  if ((v3 & 0x60) == 0 || (activeConstrainedElements & 0x60) != 0)
  {
    if ((v3 & 0x60) == 0)
    {
      v22 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView superview];

      if (v22) {
        [(CRLiOSInspectorTableCellImageView *)self->_customImageView removeFromSuperview];
      }
    }
  }
  else
  {
    v20 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView superview];

    if (!v20)
    {
      v21 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v21 addSubview:self->_customImageView];
    }
  }
  if ((v3 & 0x180) == 0 || (activeConstrainedElements & 0x180) != 0)
  {
    if ((v3 & 0x180) == 0)
    {
      v25 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton superview];

      if (v25) {
        [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton removeFromSuperview];
      }
    }
  }
  else
  {
    v23 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton superview];

    if (!v23)
    {
      v24 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v24 addSubview:self->_customImageButton];
    }
  }
  if ((v3 & 0x200) == 0 || (activeConstrainedElements & 0x200) != 0)
  {
    if ((v3 & 0x200) == 0)
    {
      v32 = [(UIImageView *)self->_disclosureView superview];

      if (v32) {
        [(UIImageView *)self->_disclosureView removeFromSuperview];
      }
    }
  }
  else
  {
    v26 = [(UIImageView *)self->_disclosureView superview];

    if (!v26)
    {
      if (!self->_disclosureView)
      {
        v27 = +[UIImage systemImageNamed:@"chevron.forward"];
        v28 = [[CRLiOSInspectorTableViewCellDisclosureImageView alloc] initWithImage:v27];
        disclosureView = self->_disclosureView;
        self->_disclosureView = &v28->super;

        [(UIImageView *)self->_disclosureView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIImageView *)self->_disclosureView setContentMode:4];
        v30 = +[UIColor tertiaryLabelColor];
        [(UIImageView *)self->_disclosureView setTintColor:v30];
      }
      v31 = [(CRLiOSInspectorTableViewCell *)self contentView];
      [v31 addSubview:self->_disclosureView];
    }
  }
  if ((v3 & 0x400) == 0 || (activeConstrainedElements & 0x400) != 0)
  {
    if ((v3 & 0x400) == 0)
    {
      v35 = [(UIView *)self->_customAccessoryView superview];

      if (v35)
      {
        [(UIView *)self->_customAccessoryView removeFromSuperview];
        customAccessoryView = self->_customAccessoryView;
        self->_customAccessoryView = 0;
        goto LABEL_68;
      }
    }
  }
  else
  {
    v33 = [(UIView *)self->_customAccessoryView superview];

    if (!v33)
    {
      [(UIView *)self->_customAccessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
      customAccessoryView = [(CRLiOSInspectorTableViewCell *)self contentView];
      [customAccessoryView addSubview:self->_customAccessoryView];
LABEL_68:
    }
  }
  if ((v3 & 0x800) == 0 || (activeConstrainedElements & 0x800) != 0)
  {
    if ((v3 & 0x800) == 0)
    {
      v38 = [(UIView *)self->_customStandardAccessoryView superview];

      if (v38)
      {
        [(UIView *)self->_customStandardAccessoryView removeFromSuperview];
        customStandardAccessoryView = self->_customStandardAccessoryView;
        self->_customStandardAccessoryView = 0;
        goto LABEL_76;
      }
    }
  }
  else
  {
    v36 = [(UIView *)self->_customStandardAccessoryView superview];

    if (!v36)
    {
      customStandardAccessoryView = [(CRLiOSInspectorTableViewCell *)self contentView];
      [customStandardAccessoryView addSubview:self->_customStandardAccessoryView];
LABEL_76:
    }
  }
  if ((v3 & 0x1000) != 0 && (activeConstrainedElements & 0x1000) == 0)
  {
    v39 = [(UIView *)self->_fullSizeControl superview];

    if (v39) {
      goto LABEL_85;
    }
    [(UIView *)self->_fullSizeControl setTranslatesAutoresizingMaskIntoConstraints:0];
    fullSizeControl = [(CRLiOSInspectorTableViewCell *)self contentView];
    [fullSizeControl addSubview:self->_fullSizeControl];
    goto LABEL_84;
  }
  if ((v3 & 0x1000) == 0)
  {
    v41 = [(UIView *)self->_fullSizeControl superview];

    if (v41)
    {
      [(UIView *)self->_fullSizeControl removeFromSuperview];
      fullSizeControl = self->_fullSizeControl;
      self->_fullSizeControl = 0;
LABEL_84:
    }
  }
LABEL_85:
  id v42 = [(CRLiOSInspectorTableViewCell *)self isUserInteractionEnabled];

  [(CRLiOSInspectorTableViewCell *)self setUserInteractionEnabled:v42];
}

- (void)p_updateConstraintsForElements:(unint64_t)a3
{
  -[CRLiOSInspectorTableViewCell p_prepareToChangeConstraintsForElements:](self, "p_prepareToChangeConstraintsForElements:");
  uint64_t v5 = +[NSMutableArray arrayWithCapacity:64];
  [(CRLiOSInspectorTableViewCell *)self p_generateGeneralConstraintsForImages:a3 intoArray:v5];
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForLeadingSideElements:a3 intoArray:v5];
  -[CRLiOSInspectorTableViewCell p_generateConstraintsForTitleArea:margin:intoArray:](self, "p_generateConstraintsForTitleArea:margin:intoArray:", a3, v5);
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForTrailingSideElements:a3 intoArray:v5];
  if ([(CRLiOSInspectorTableViewCell *)self currentContentSizeCategoryWrapsToNextLine])
  {
    [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForAccessoryAreaOnSecondLine:a3 intoArray:v5];
  }
  else
  {
    [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForAccessoryAreaOnFirstLine:a3 intoArray:v5];
  }
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForTitleAreaTrailingAnchor:a3 intoArray:v5];
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForFullSizeControl:a3 intoArray:v5];
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForFirstRowLayoutGuideIntoArray:v5];
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForSecondRowLayoutGuide:a3 intoArray:v5];
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForThirdRowLayoutGuide:a3 intoArray:v5];
  [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForLegacyFixedRowHeightIntoArray:v5];
  +[NSLayoutConstraint activateConstraints:v5];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v5;

  self->_unint64_t activeConstrainedElements = a3;
  [(CRLiOSInspectorTableViewCell *)self p_currentAccessibilitySizeRatio];
  self->_activeAccessibilitySizeMultiplier = v7;
  self->_constraintConstantsNeedUpdate = 0;
}

- (void)p_generateConstraintsForImage:(id)a3 container:(id)a4 intoArray:(id)a5
{
  id v21 = a4;
  id v8 = a5;
  [a3 size];
  if (self->_imageUsesStandardMargins)
  {
    LODWORD(v9) = 1148846080;
    [v21 setContentHuggingPriority:0 forAxis:v9];
    goto LABEL_15;
  }
  double v11 = v9;
  double v12 = v10;
  id v13 = [v21 contentMode];
  if (v13 != (id)2)
  {
    if (v13 == (id)1)
    {
      uint64_t v14 = [v21 widthAnchor];
      v15 = [v21 heightAnchor];
      uint64_t v16 = [v14 constraintEqualToAnchor:v15 multiplier:v11 / v12];
      goto LABEL_8;
    }
    if (v13)
    {
      [(id)objc_opt_class() minimumHeight];
      double v19 = v18 + 10.0;
      if (v11 <= v18 + 10.0)
      {
        if ([v21 adjustsImageSizeForAccessibilityContentSizeCategory])
        {
          [(CRLiOSInspectorTableViewCell *)self p_currentAccessibilitySizeRatio];
          double v19 = ceil(v19 * v20);
        }
      }
      else
      {
        double v19 = v11 + 32.0;
      }
      uint64_t v14 = [v21 widthAnchor];
      v15 = [v14 constraintEqualToConstant:v19];
      [v8 addObject:v15];
      goto LABEL_14;
    }
  }
  uint64_t v14 = [v21 widthAnchor];
  v15 = [v21 heightAnchor];
  uint64_t v16 = [v14 constraintEqualToAnchor:v15];
LABEL_8:
  uint64_t v17 = (void *)v16;
  [v8 addObject:v16];

LABEL_14:
LABEL_15:
}

- (void)p_generateGeneralConstraintsForImages:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4 = a3;
  id v8 = a4;
  if ((v4 & 0x60) != 0)
  {
    id v6 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView image];
    [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForImage:v6 container:self->_customImageView intoArray:v8];
  }
  if ((v4 & 0x180) != 0)
  {
    double v7 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton imageForState:0];
    [(CRLiOSInspectorTableViewCell *)self p_generateConstraintsForImage:v7 container:self->_customImageButton intoArray:v8];
  }
}

- (id)p_centerYConstraintForView:(id)a3 atAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CRLiOSInspectorTableViewCell currentContentSizeCategoryWrapsToNextLine](self, "currentContentSizeCategoryWrapsToNextLine")&& (-[CRLiOSInspectorLabel text](self->_customTextLabel, "text"), v8 = objc_claimAutoreleasedReturnValue(), id v9 = [v8 length], v8, v9))
  {
    double v10 = [(CRLiOSInspectorLabel *)self->_customTextLabel font];
    [v10 lineHeight];
    double v12 = v11 * 0.5;

    id v13 = [v6 centerYAnchor];
    uint64_t v14 = [(CRLiOSInspectorLabel *)self->_customTextLabel topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:v12];
  }
  else
  {
    id v13 = [v6 centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v7];
  }

  return v15;
}

- (double)p_generateConstraintsForLeadingSideElements:(unint64_t)a3 intoArray:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  [(CRLiOSInspectorTableViewCell *)self indentationWidth];
  double v8 = v7;
  double right = v7 * (double)((uint64_t)[(CRLiOSInspectorTableViewCell *)self indentationLevel] + 1);
  v47 = [(CRLiOSInspectorTableViewCell *)self p_safeAreaLayoutGuide];
  double v10 = [v47 leadingAnchor];
  p_leadingContentTrailingEdgeAnchor = &self->_leadingContentTrailingEdgeAnchor;
  objc_storeWeak((id *)&self->_leadingContentTrailingEdgeAnchor, v10);

  self->_needsPaddingOnLeadingContentAnchor = 1;
  v48 = v6;
  if ((v4 & 0x10) != 0)
  {
    LODWORD(v12) = 1148846080;
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setContentHuggingPriority:1 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setContentHuggingPriority:0 forAxis:v13];
    checkmarkView = self->_checkmarkView;
    locationa = [(CRLiOSInspectorTableViewCell *)self contentView];
    v15 = [locationa centerYAnchor];
    uint64_t v16 = [(CRLiOSInspectorTableViewCell *)self p_centerYConstraintForView:checkmarkView atAnchor:v15];
    v51[0] = v16;
    uint64_t v17 = [(CRLiOSInspectorCheckmark *)self->_checkmarkView leadingAnchor];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
    double v19 = [v17 constraintEqualToAnchor:WeakRetained constant:right];
    v51[1] = v19;
    double v20 = +[NSArray arrayWithObjects:v51 count:2];
    [v6 addObjectsFromArray:v20];

    p_leadingContentTrailingEdgeAnchor = &self->_leadingContentTrailingEdgeAnchor;
    id v21 = [(CRLiOSInspectorCheckmark *)self->_checkmarkView trailingAnchor];
    objc_storeWeak((id *)&self->_leadingContentTrailingEdgeAnchor, v21);

    self->_needsPaddingOnLeadingContentAnchor = 1;
    self->_firstRowHasContent = 1;
    double right = v8;
  }
  p_imageInsets = &self->_imageInsets;
  double v23 = 0.0;
  if (!self->_imageUsesStandardMargins) {
    double v23 = v8;
  }
  double v24 = right - v23 + self->_imageInsets.left;
  if ((v4 & 0x20) != 0)
  {
    uint64_t v25 = 32;
    v43 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView topAnchor];
    id v42 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    v41 = [v43 constraintGreaterThanOrEqualToAnchor:v42 constant:p_imageInsets->top];
    v50[0] = v41;
    v40 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView bottomAnchor];
    v26 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
    v27 = [v40 constraintLessThanOrEqualToAnchor:v26 constant:-self->_imageInsets.bottom];
    v50[1] = v27;
    id v44 = &self->_imageInsets;
    customImageView = self->_customImageView;
    v29 = [(UILayoutGuide *)self->_firstRowLayoutGuide centerYAnchor];
    v30 = [(CRLiOSInspectorTableViewCell *)self p_centerYConstraintForView:customImageView atAnchor:v29];
    v50[2] = v30;
    v31 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView leadingAnchor];
    id v32 = objc_loadWeakRetained((id *)p_leadingContentTrailingEdgeAnchor);
    [v31 constraintEqualToAnchor:v32 constant:v24];
    v33 = location = (id *)p_leadingContentTrailingEdgeAnchor;
    v50[3] = v33;
    v34 = v50;
  }
  else
  {
    if ((v4 & 0x80) == 0) {
      goto LABEL_13;
    }
    uint64_t v25 = 40;
    v43 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton topAnchor];
    id v42 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    v41 = [v43 constraintGreaterThanOrEqualToAnchor:v42 constant:p_imageInsets->top];
    v49[0] = v41;
    v40 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton bottomAnchor];
    v26 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
    v27 = [v40 constraintLessThanOrEqualToAnchor:v26 constant:-self->_imageInsets.bottom];
    v49[1] = v27;
    id v44 = &self->_imageInsets;
    customImageButton = self->_customImageButton;
    v29 = [(UILayoutGuide *)self->_firstRowLayoutGuide centerYAnchor];
    v30 = [(CRLiOSInspectorTableViewCell *)self p_centerYConstraintForView:customImageButton atAnchor:v29];
    v49[2] = v30;
    v31 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton leadingAnchor];
    id v32 = objc_loadWeakRetained((id *)p_leadingContentTrailingEdgeAnchor);
    [v31 constraintEqualToAnchor:v32 constant:v24];
    v33 = location = (id *)p_leadingContentTrailingEdgeAnchor;
    v49[3] = v33;
    v34 = v49;
  }
  v36 = +[NSArray arrayWithObjects:v34 count:4];
  [v48 addObjectsFromArray:v36];

  v37 = [*(id *)((char *)&self->super.super.super.super.isa + v25) trailingAnchor];
  objc_storeWeak(location, v37);

  BOOL v38 = 1;
  if (!self->_imageUsesStandardMargins) {
    BOOL v38 = v44->right > 0.0;
  }
  self->_needsPaddingOnLeadingContentAnchor = v38;
  self->_firstRowHasContent = 1;
  double right = v8;
  if (!self->_imageUsesStandardMargins) {
    double right = self->_imageInsets.right;
  }
LABEL_13:

  return right;
}

- (void)p_generateConstraintsForTitleArea:(unint64_t)a3 margin:(double)a4 intoArray:(id)a5
{
  __int16 v67 = a3;
  id v69 = a5;
  double v7 = [(UILayoutGuide *)self->_titleAreaLayoutGuide leadingAnchor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
  double v9 = 0.0;
  if (self->_needsPaddingOnLeadingContentAnchor) {
    double v10 = a4;
  }
  else {
    double v10 = 0.0;
  }
  double v11 = [v7 constraintEqualToAnchor:WeakRetained constant:v10];

  int v12 = 1148829696;
  LODWORD(v13) = 1148829696;
  [v11 setPriority:v13];
  if (![(CRLiOSInspectorTableViewCell *)self expandTextLabelToFillCell])
  {
    [(CRLiOSInspectorTableViewCell *)self p_minimumVerticalTitlePadding];
    double v9 = v14;
  }
  v63 = [(UILayoutGuide *)self->_titleAreaLayoutGuide centerYAnchor];
  v15 = [(UILayoutGuide *)self->_firstRowLayoutGuide centerYAnchor];
  uint64_t v16 = [v63 constraintEqualToAnchor:v15];
  v76[0] = v16;
  uint64_t v17 = [(UILayoutGuide *)self->_titleAreaLayoutGuide topAnchor];
  double v18 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
  double v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18 constant:v9];
  v76[1] = v19;
  double v20 = [(UILayoutGuide *)self->_titleAreaLayoutGuide bottomAnchor];
  id v21 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
  v22 = [v20 constraintLessThanOrEqualToAnchor:v21 constant:-v9];
  v76[2] = v22;
  v76[3] = v11;
  v66 = v11;
  double v23 = +[NSArray arrayWithObjects:v76 count:4];
  [v69 addObjectsFromArray:v23];

  double v24 = [(UILayoutGuide *)self->_titleAreaLayoutGuide topAnchor];
  char v26 = v67;
  if (v67)
  {
    unsigned int v36 = [(CRLiOSInspectorTableViewCell *)self expandTextLabelToFillCell];
    p_customTextLabel = (id *)&self->_customTextLabel;
    customTextLabel = self->_customTextLabel;
    if (v36)
    {
      LODWORD(v37) = 1144733696;
      [(CRLiOSInspectorLabel *)customTextLabel setContentHuggingPriority:1 forAxis:v37];
      v39 = [*p_customTextLabel bottomAnchor];
      v40 = [(UILayoutGuide *)self->_titleAreaLayoutGuide bottomAnchor];
      v41 = [v39 constraintEqualToAnchor:v40];
      v75 = v41;
      id v42 = +[NSArray arrayWithObjects:&v75 count:1];
      [v69 addObjectsFromArray:v42];
    }
    else
    {
      LODWORD(v37) = 1148846080;
      [(CRLiOSInspectorLabel *)customTextLabel setContentHuggingPriority:1 forAxis:v37];
    }
    LODWORD(v43) = 1144733696;
    [*p_customTextLabel setContentHuggingPriority:0 forAxis:v43];
    if (!self->_preventTextLabelFromCompression
      || [(CRLiOSInspectorTableViewCell *)self currentContentSizeCategoryWrapsToNextLine])
    {
      int v12 = 1144733696;
    }
    LODWORD(v44) = v12;
    [*p_customTextLabel setContentCompressionResistancePriority:0 forAxis:v44];
    v62 = [*p_customTextLabel topAnchor];
    [v62 constraintEqualToAnchor:v24];
    v28 = v64 = v24;
    v74[0] = v28;
    v29 = [*p_customTextLabel leadingAnchor];
    v30 = [(UILayoutGuide *)self->_titleAreaLayoutGuide leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v74[1] = v31;
    id v32 = [*p_customTextLabel trailingAnchor];
    v33 = [(UILayoutGuide *)self->_titleAreaLayoutGuide trailingAnchor];
    v34 = [v32 constraintLessThanOrEqualToAnchor:v33];
    v74[2] = v34;
    v35 = v74;
    goto LABEL_17;
  }
  if ((v67 & 0x1000) != 0
    && [(CRLiOSInspectorTableViewCell *)self fullSizeControlReplacesTextLabel])
  {
    p_customTextLabel = (id *)&self->_fullSizeControl;
    v62 = [(UIView *)self->_fullSizeControl topAnchor];
    [v62 constraintEqualToAnchor:v24];
    v28 = v64 = v24;
    v73[0] = v28;
    v29 = [(UIView *)self->_fullSizeControl leadingAnchor];
    v30 = [(UILayoutGuide *)self->_titleAreaLayoutGuide leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v73[1] = v31;
    id v32 = [(UIView *)self->_fullSizeControl trailingAnchor];
    v33 = [(UILayoutGuide *)self->_titleAreaLayoutGuide trailingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v73[2] = v34;
    v35 = v73;
LABEL_17:
    v45 = +[NSArray arrayWithObjects:v35 count:3];
    [v69 addObjectsFromArray:v45];

    double v24 = [*p_customTextLabel bottomAnchor];

    self->_titleAreaHasContent = 1;
    self->_firstRowHasContent = 1;
    char v26 = v67;
  }
  if ((v26 & 2) != 0)
  {
    LODWORD(v25) = 1148846080;
    [(UILabel *)self->_customDetailTextLabel setContentHuggingPriority:1 forAxis:v25];
    LODWORD(v46) = 1144733696;
    [(UILabel *)self->_customDetailTextLabel setContentHuggingPriority:0 forAxis:v46];
    v68 = [(UILabel *)self->_customDetailTextLabel topAnchor];
    v47 = [v68 constraintEqualToAnchor:v24];
    v72[0] = v47;
    v48 = [(UILabel *)self->_customDetailTextLabel leadingAnchor];
    [(UILayoutGuide *)self->_titleAreaLayoutGuide leadingAnchor];
    v49 = v65 = v24;
    v50 = [v48 constraintEqualToAnchor:v49];
    v72[1] = v50;
    v51 = [(UILabel *)self->_customDetailTextLabel trailingAnchor];
    v52 = [(UILayoutGuide *)self->_titleAreaLayoutGuide trailingAnchor];
    v53 = [v51 constraintLessThanOrEqualToAnchor:v52];
    v72[2] = v53;
    v54 = +[NSArray arrayWithObjects:v72 count:3];
    [v69 addObjectsFromArray:v54];

    double v24 = [(UILabel *)self->_customDetailTextLabel bottomAnchor];

    self->_titleAreaHasContent = 1;
    self->_firstRowHasContent = 1;
  }
  v55 = v66;
  if (self->_titleAreaLayoutGuide)
  {
    unsigned int v56 = [(CRLiOSInspectorTableViewCell *)self expandTextLabelToFillCell];
    v57 = [(UILayoutGuide *)self->_titleAreaLayoutGuide bottomAnchor];
    v58 = v57;
    if (v56)
    {
      v59 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
      v60 = [v58 constraintEqualToAnchor:v59];
      v71 = v60;
      v61 = +[NSArray arrayWithObjects:&v71 count:1];
      [v69 addObjectsFromArray:v61];

      v55 = v66;
    }
    else
    {
      v59 = [v57 constraintEqualToAnchor:v24];
      v70 = v59;
      v60 = +[NSArray arrayWithObjects:&v70 count:1];
      [v69 addObjectsFromArray:v60];
    }
  }
}

- (void)p_generateConstraintsForTrailingSideElements:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4 = a3;
  id v6 = a4;
  double v7 = [(CRLiOSInspectorTableViewCell *)self p_safeAreaLayoutGuide];
  [(CRLiOSInspectorTableViewCell *)self indentationWidth];
  double v9 = v8;
  v35 = v7;
  double v10 = [v7 trailingAnchor];
  p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
  objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v10);

  self->_needsPaddingOnTrailingContentAnchor = 1;
  double v13 = -v9;
  if ((v4 & 0x200) != 0)
  {
    LODWORD(v12) = 1148846080;
    [(UIImageView *)self->_disclosureView setContentHuggingPriority:1 forAxis:v12];
    LODWORD(v14) = 1148846080;
    [(UIImageView *)self->_disclosureView setContentHuggingPriority:0 forAxis:v14];
    disclosureView = self->_disclosureView;
    v33 = [(CRLiOSInspectorTableViewCell *)self contentView];
    uint64_t v16 = [v33 centerYAnchor];
    uint64_t v17 = [(CRLiOSInspectorTableViewCell *)self p_centerYConstraintForView:disclosureView atAnchor:v16];
    v37[0] = v17;
    double v18 = [(UIImageView *)self->_disclosureView trailingAnchor];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    double v20 = [v18 constraintEqualToAnchor:WeakRetained constant:v13];
    v37[1] = v20;
    id v21 = +[NSArray arrayWithObjects:v37 count:2];
    [v6 addObjectsFromArray:v21];

    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    v22 = [(UIImageView *)self->_disclosureView leadingAnchor];
    objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v22);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
  }
  if ((v4 & 8) != 0)
  {
    LODWORD(v12) = 1148846080;
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setContentHuggingPriority:1 forAxis:v12];
    LODWORD(v23) = 1148846080;
    [(CRLiOSInspectorCheckmark *)self->_checkmarkView setContentHuggingPriority:0 forAxis:v23];
    checkmarkView = self->_checkmarkView;
    double v25 = [(CRLiOSInspectorTableViewCell *)self contentView];
    char v26 = [v25 centerYAnchor];
    v27 = [(CRLiOSInspectorTableViewCell *)self p_centerYConstraintForView:checkmarkView atAnchor:v26];
    v36[0] = v27;
    v28 = [(CRLiOSInspectorCheckmark *)self->_checkmarkView trailingAnchor];
    location = (id *)p_trailingContentLeadingEdgeAnchor;
    id v29 = objc_loadWeakRetained((id *)p_trailingContentLeadingEdgeAnchor);
    v30 = [v28 constraintEqualToAnchor:v29 constant:v13];
    v36[1] = v30;
    v31 = +[NSArray arrayWithObjects:v36 count:2];
    [v6 addObjectsFromArray:v31];

    id v32 = [(CRLiOSInspectorCheckmark *)self->_checkmarkView leadingAnchor];
    objc_storeWeak(location, v32);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
  }
}

- (void)p_generateConstraintsForAccessoryAreaOnFirstLine:(unint64_t)a3 intoArray:(id)a4
{
  LOWORD(v4) = a3;
  id v6 = a4;
  [(CRLiOSInspectorTableViewCell *)self indentationWidth];
  double v8 = v7;
  p_imageInsets = &self->_imageInsets;
  double v10 = -0.0;
  if (self->_imageUsesStandardMargins) {
    double v10 = v7;
  }
  CGFloat left = self->_imageInsets.right + v10;
  double v12 = -left;
  double v13 = &OBJC_IVAR___CRLStrokePattern__phase;
  __int16 v130 = v4;
  v132 = v6;
  if ((v4 & 0x40) != 0)
  {
    uint64_t v22 = 32;
    location = [(CRLiOSInspectorTableCellImageView *)self->_customImageView topAnchor];
    v120 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    v115 = [location constraintEqualToAnchor:v120 constant:p_imageInsets->top];
    v139[0] = v115;
    double v23 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView bottomAnchor];
    double v24 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
    [v23 constraintEqualToAnchor:v24 constant:-self->_imageInsets.bottom];
    double v25 = v110 = &self->_imageInsets;
    v139[1] = v25;
    char v26 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView trailingAnchor];
    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    id v29 = [v26 constraintEqualToAnchor:WeakRetained constant:v12];
    v139[2] = v29;
    v30 = v139;
LABEL_10:
    v31 = +[NSArray arrayWithObjects:v30 count:3];
    [v132 addObjectsFromArray:v31];

    id v32 = [*(id *)((char *)&self->super.super.super.super.isa + v22) leadingAnchor];
    objc_storeWeak((id *)p_trailingContentLeadingEdgeAnchor, v32);

    if (self->_imageUsesStandardMargins)
    {
      BOOL v33 = 1;
    }
    else
    {
      CGFloat left = v110->left;
      BOOL v33 = left > 0.0;
    }
    self->_needsPaddingOnTrailingContentAnchor = v33;
    LOWORD(v4) = v130;
    double v13 = &OBJC_IVAR___CRLStrokePattern__phase;
    goto LABEL_14;
  }
  if ((v4 & 0x100) == 0) {
    goto LABEL_15;
  }
  if (![(CRLiOSInspectorTableViewCell *)self showsImageButtonTrailingAdjacentToLabel])
  {
    uint64_t v22 = 40;
    location = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton topAnchor];
    v120 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    v115 = [location constraintEqualToAnchor:v120 constant:p_imageInsets->top];
    v138[0] = v115;
    double v23 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton bottomAnchor];
    double v24 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
    [v23 constraintEqualToAnchor:v24 constant:-self->_imageInsets.bottom];
    double v25 = v110 = &self->_imageInsets;
    v138[1] = v25;
    char v26 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton trailingAnchor];
    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    id v29 = [v26 constraintEqualToAnchor:WeakRetained constant:v12];
    v138[2] = v29;
    v30 = v138;
    goto LABEL_10;
  }
  if (![(CRLiOSInspectorTableViewCell *)self showsImageButtonTrailingAdjacentToLabel])goto LABEL_15; {
  v128 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton topAnchor];
  }
  locationb = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
  v119 = [v128 constraintEqualToAnchor:locationb constant:p_imageInsets->top];
  v137[0] = v119;
  v114 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton bottomAnchor];
  uint64_t v4 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
  double v14 = [v114 constraintEqualToAnchor:v4 constant:-self->_imageInsets.bottom];
  v137[1] = v14;
  v15 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton leadingAnchor];
  uint64_t v16 = [(CRLiOSInspectorLabel *)self->_customTextLabel trailingAnchor];
  uint64_t v17 = [v15 constraintEqualToAnchor:v16 constant:v12];
  v137[2] = v17;
  double v18 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton trailingAnchor];
  id v19 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
  double v20 = [v18 constraintLessThanOrEqualToAnchor:v19 constant:v12];
  v137[3] = v20;
  id v21 = +[NSArray arrayWithObjects:v137 count:4];
  [v132 addObjectsFromArray:v21];

  double v13 = &OBJC_IVAR___CRLStrokePattern__phase;
  LOWORD(v4) = v130;

LABEL_14:
  self->_firstRowHasContent = 1;
LABEL_15:
  if ((v4 & 0x800) != 0)
  {
    LODWORD(left) = 1148846080;
    [(UIView *)self->_customStandardAccessoryView setContentHuggingPriority:1 forAxis:left];
    LODWORD(v34) = 1148846080;
    [(UIView *)self->_customStandardAccessoryView setContentHuggingPriority:0 forAxis:v34];
    v35 = [(UIView *)self->_customStandardAccessoryView trailingAnchor];
    v121 = v35;
    id v36 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v116 = v36;
    double v37 = 0.0;
    if (self->_needsPaddingOnTrailingContentAnchor) {
      double v37 = -v8;
    }
    v111 = [v35 constraintEqualToAnchor:v36 constant:v37];
    v136[0] = v111;
    v107 = [(UIView *)self->_customStandardAccessoryView centerYAnchor];
    uint64_t v38 = v13[471];
    v105 = [*(id *)((char *)&self->super.super.super.super.isa + v38) centerYAnchor];
    v39 = [v107 constraintEqualToAnchor:v105];
    v136[1] = v39;
    v40 = [(UIView *)self->_customStandardAccessoryView topAnchor];
    v41 = [*(id *)((char *)&self->super.super.super.super.isa + v38) topAnchor];
    id v42 = [v40 constraintGreaterThanOrEqualToAnchor:v41];
    v136[2] = v42;
    double v43 = [(UIView *)self->_customStandardAccessoryView bottomAnchor];
    double v44 = [*(id *)((char *)&self->super.super.super.super.isa + v38) bottomAnchor];
    v45 = [v43 constraintLessThanOrEqualToAnchor:v44];
    v136[3] = v45;
    uint64_t v4 = +[NSArray arrayWithObjects:v136 count:4];
    [v132 addObjectsFromArray:v4];

    LOBYTE(v4) = v130;
    double v13 = &OBJC_IVAR___CRLStrokePattern__phase;

    double v46 = [(UIView *)self->_customStandardAccessoryView leadingAnchor];
    objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v46);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
    if ((v130 & 0x400) == 0)
    {
LABEL_17:
      if ((v4 & 4) == 0) {
        goto LABEL_38;
      }
      goto LABEL_33;
    }
  }
  else if ((v4 & 0x400) == 0)
  {
    goto LABEL_17;
  }
  if (self->_expandAccessoryViewToFillCellHorizontally) {
    *(float *)&CGFloat left = 250.0;
  }
  else {
    *(float *)&CGFloat left = 1000.0;
  }
  [(UIView *)self->_customAccessoryView setContentHuggingPriority:0 forAxis:left];
  LODWORD(v47) = 1148846080;
  [(UIView *)self->_customAccessoryView setContentHuggingPriority:1 forAxis:v47];
  v48 = [(UIView *)self->_customAccessoryView centerYAnchor];
  uint64_t v49 = v13[471];
  v50 = [*(id *)((char *)&self->super.super.super.super.isa + v49) centerYAnchor];
  v51 = [v48 constraintEqualToAnchor:v50];

  LODWORD(v52) = 1132068864;
  [v51 setPriority:v52];
  if (self->_expandAccessoryViewToFillCellHorizontally)
  {
    v53 = &OBJC_IVAR___CRLStrokePattern__phase;
    if (v4)
    {
      uint64_t v54 = [(CRLiOSInspectorLabel *)self->_customTextLabel trailingAnchor];
      BOOL v129 = 1;
    }
    else
    {
      uint64_t v54 = (uint64_t)objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
      BOOL v129 = 0;
    }
  }
  else
  {
    uint64_t v54 = [(UILayoutGuide *)self->_titleAreaLayoutGuide trailingAnchor];
    BOOL v129 = 1;
    v53 = &OBJC_IVAR___CRLStrokePattern__phase;
  }
  v94 = (void *)v54;
  locationa = [(UILayoutGuide *)self->_accessoryViewLayoutGuide topAnchor];
  v122 = [*(id *)((char *)&self->super.super.super.super.isa + v49) topAnchor];
  v117 = [locationa constraintEqualToAnchor:v122];
  v135[0] = v117;
  v112 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide bottomAnchor];
  v108 = [*(id *)((char *)&self->super.super.super.super.isa + v49) bottomAnchor];
  v103 = [v112 constraintEqualToAnchor:v108];
  v135[1] = v103;
  v102 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide leadingAnchor];
  v101 = [v102 constraintEqualToAnchor:v54 constant:v8];
  v135[2] = v101;
  v55 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide trailingAnchor];
  v100 = v55;
  v104 = (id *)((char *)&self->super.super.super.super.isa + v53[507]);
  id v56 = objc_loadWeakRetained(v104);
  v98 = v56;
  double v57 = 0.0;
  if (self->_needsPaddingOnTrailingContentAnchor) {
    double v57 = -v8;
  }
  v97 = [v55 constraintEqualToAnchor:v56 constant:v57];
  v135[3] = v97;
  v96 = [(UIView *)self->_customAccessoryView leadingAnchor];
  v95 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide leadingAnchor];
  v93 = [v96 constraintLessThanOrEqualToAnchor:v95];
  v135[4] = v93;
  v92 = [(UIView *)self->_customAccessoryView trailingAnchor];
  v58 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide trailingAnchor];
  v59 = [v92 constraintEqualToAnchor:v58];
  v135[5] = v59;
  v135[6] = v51;
  v60 = [(UIView *)self->_customAccessoryView topAnchor];
  v61 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide topAnchor];
  [v60 constraintGreaterThanOrEqualToAnchor:v61];
  v62 = v99 = v51;
  v135[7] = v62;
  v63 = [(UIView *)self->_customAccessoryView bottomAnchor];
  v64 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide bottomAnchor];
  v65 = [v63 constraintLessThanOrEqualToAnchor:v64];
  v135[8] = v65;
  v66 = +[NSArray arrayWithObjects:v135 count:9];
  [v132 addObjectsFromArray:v66];

  __int16 v67 = [(UIView *)self->_customAccessoryView leadingAnchor];
  objc_storeWeak(v104, v67);

  self->_needsPaddingOnTrailingContentAnchor = v129;
  self->_firstRowHasContent = 1;

  double v13 = &OBJC_IVAR___CRLStrokePattern__phase;
  if ((v130 & 4) != 0)
  {
LABEL_33:
    LODWORD(left) = 1148846080;
    [(UILabel *)self->_customDetailTextLabel setContentHuggingPriority:1 forAxis:left];
    LODWORD(v68) = 1148846080;
    [(UILabel *)self->_customDetailTextLabel setContentHuggingPriority:0 forAxis:v68];
    [(CRLiOSInspectorLabel *)self->_customTextLabel contentCompressionResistancePriorityForAxis:0];
    *(float *)&double v70 = v69 + -1.0;
    [(UILabel *)self->_customDetailTextLabel setContentCompressionResistancePriority:0 forAxis:v70];
    v71 = [(UILabel *)self->_customDetailTextLabel trailingAnchor];
    v123 = v71;
    id v72 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    v118 = v72;
    double v73 = 0.0;
    if (self->_needsPaddingOnTrailingContentAnchor) {
      double v73 = -v8;
    }
    v113 = [v71 constraintEqualToAnchor:v72 constant:v73];
    v134[0] = v113;
    v109 = [(UILabel *)self->_customDetailTextLabel centerYAnchor];
    v106 = [(UILayoutGuide *)self->_titleAreaLayoutGuide centerYAnchor];
    v74 = [v109 constraintEqualToAnchor:v106];
    v134[1] = v74;
    v75 = [(UILabel *)self->_customDetailTextLabel topAnchor];
    uint64_t v76 = v13[471];
    v77 = [*(id *)((char *)&self->super.super.super.super.isa + v76) topAnchor];
    v78 = [v75 constraintGreaterThanOrEqualToAnchor:v77];
    v134[2] = v78;
    v79 = [(UILabel *)self->_customDetailTextLabel bottomAnchor];
    v80 = [*(id *)((char *)&self->super.super.super.super.isa + v76) bottomAnchor];
    v81 = [v79 constraintLessThanOrEqualToAnchor:v80];
    v134[3] = v81;
    v82 = +[NSArray arrayWithObjects:v134 count:4];
    [v132 addObjectsFromArray:v82];

    if (v130)
    {
      v131 = [(UILayoutGuide *)self->_titleAndDetailLayoutGuide leadingAnchor];
      v124 = [(CRLiOSInspectorLabel *)self->_customTextLabel leadingAnchor];
      v83 = [v131 constraintEqualToAnchor:v124];
      v133[0] = v83;
      v84 = [(UILayoutGuide *)self->_titleAndDetailLayoutGuide trailingAnchor];
      v85 = [(UILabel *)self->_customDetailTextLabel trailingAnchor];
      v86 = [v84 constraintEqualToAnchor:v85];
      v133[1] = v86;
      v87 = [(CRLiOSInspectorLabel *)self->_customTextLabel widthAnchor];
      v88 = [(UILayoutGuide *)self->_titleAndDetailLayoutGuide widthAnchor];
      v89 = [v87 constraintLessThanOrEqualToAnchor:v88 multiplier:0.7];
      v133[2] = v89;
      v90 = +[NSArray arrayWithObjects:v133 count:3];
      [v132 addObjectsFromArray:v90];
    }
    v91 = [(UILabel *)self->_customDetailTextLabel leadingAnchor];
    objc_storeWeak((id *)&self->_trailingContentLeadingEdgeAnchor, v91);

    self->_needsPaddingOnTrailingContentAnchor = 1;
    self->_firstRowHasContent = 1;
  }
LABEL_38:
}

- (void)p_generateConstraintsForAccessoryAreaOnSecondLine:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4 = a3;
  id v6 = a4;
  double v7 = [(CRLiOSInspectorTableViewCell *)self p_safeAreaLayoutGuide];
  [(CRLiOSInspectorTableViewCell *)self indentationWidth];
  double v9 = v8;
  double v10 = v8 * (double)((uint64_t)[(CRLiOSInspectorTableViewCell *)self indentationLevel] + 1);
  v105 = v7;
  double v11 = [v7 leadingAnchor];
  p_imageInsets = &self->_imageInsets;
  double right = self->_imageInsets.right;
  double v14 = 0.0;
  if (!self->_imageUsesStandardMargins) {
    double v14 = v9;
  }
  double v15 = v10 - v14 + right;
  uint64_t v16 = &OBJC_IVAR___CRLStrokePattern__phase;
  v110 = v6;
  __int16 v106 = v4;
  if ((v4 & 0x40) != 0)
  {
    uint64_t v18 = 32;
    v99 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView topAnchor];
    v96 = [(UILayoutGuide *)self->_secondRowLayoutGuide topAnchor];
    id v19 = [v99 constraintEqualToAnchor:v96 constant:p_imageInsets->top];
    v118[0] = v19;
    double v20 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView bottomAnchor];
    id v21 = [(UILayoutGuide *)self->_secondRowLayoutGuide bottomAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21 constant:-self->_imageInsets.bottom];
    v118[1] = v22;
    double v23 = [(CRLiOSInspectorTableCellImageView *)self->_customImageView leadingAnchor];
    [v23 constraintEqualToAnchor:v11 constant:v15];
    double v24 = v107 = v11;
    v118[2] = v24;
    double v25 = +[NSArray arrayWithObjects:v118 count:3];
    [v6 addObjectsFromArray:v25];

    goto LABEL_9;
  }
  if ((v4 & 0x100) != 0)
  {
    uint64_t v18 = 40;
    v99 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton topAnchor];
    char v26 = [(UILayoutGuide *)self->_secondRowLayoutGuide topAnchor];
    v27 = [v99 constraintEqualToAnchor:v26 constant:p_imageInsets->top];
    v117[0] = v27;
    v28 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton bottomAnchor];
    id v29 = [(UILayoutGuide *)self->_secondRowLayoutGuide bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-self->_imageInsets.bottom];
    v117[1] = v30;
    v31 = [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton leadingAnchor];
    [v31 constraintEqualToAnchor:v11 constant:v15];
    id v32 = v107 = v11;
    v117[2] = v32;
    BOOL v33 = +[NSArray arrayWithObjects:v117 count:3];
    [v110 addObjectsFromArray:v33];

LABEL_9:
    double v11 = [*(id *)((char *)&self->super.super.super.super.isa + v18) trailingAnchor];

    if (self->_imageUsesStandardMargins)
    {
      BOOL v17 = 1;
      __int16 v4 = v106;
      uint64_t v16 = &OBJC_IVAR___CRLStrokePattern__phase;
    }
    else
    {
      __int16 v4 = v106;
      uint64_t v16 = &OBJC_IVAR___CRLStrokePattern__phase;
      double right = self->_imageInsets.left;
      BOOL v17 = right > 0.0;
    }
    self->_secondRowHasContent = 1;
    double v10 = v9;
    if ((v4 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  BOOL v17 = 1;
  if ((v4 & 0x800) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  LODWORD(right) = 1148846080;
  [(UIView *)self->_customStandardAccessoryView setContentHuggingPriority:1 forAxis:right];
  LODWORD(v34) = 1148846080;
  [(UIView *)self->_customStandardAccessoryView setContentHuggingPriority:0 forAxis:v34];
  v35 = [(UIView *)self->_customStandardAccessoryView leadingAnchor];
  v104 = v35;
  double v36 = 0.0;
  if (v17) {
    double v36 = v10;
  }
  v103 = [v35 constraintEqualToAnchor:v11 constant:v36];
  v116[0] = v103;
  v100 = [(UIView *)self->_customStandardAccessoryView centerYAnchor];
  uint64_t v37 = v16[472];
  v97 = [*(id *)((char *)&self->super.super.super.super.isa + v37) centerYAnchor];
  uint64_t v38 = [v100 constraintEqualToAnchor:v97];
  v116[1] = v38;
  v39 = [(UIView *)self->_customStandardAccessoryView topAnchor];
  v40 = [*(id *)((char *)&self->super.super.super.super.isa + v37) topAnchor];
  [v39 constraintGreaterThanOrEqualToAnchor:v40];
  v41 = v108 = v11;
  v116[2] = v41;
  id v42 = [(UIView *)self->_customStandardAccessoryView bottomAnchor];
  double v43 = [*(id *)((char *)&self->super.super.super.super.isa + v37) bottomAnchor];
  double v44 = [v42 constraintLessThanOrEqualToAnchor:v43];
  v116[3] = v44;
  v45 = +[NSArray arrayWithObjects:v116 count:4];
  [v110 addObjectsFromArray:v45];

  __int16 v4 = v106;
  uint64_t v16 = &OBJC_IVAR___CRLStrokePattern__phase;

  double v11 = [(UIView *)self->_customStandardAccessoryView trailingAnchor];

  self->_secondRowHasContent = 1;
  double v10 = v9;
  BOOL v17 = 1;
LABEL_16:
  double v46 = -v9;
  if ((v4 & 0x400) != 0)
  {
    v109 = v11;
    customAccessoryView = self->_customAccessoryView;
    if (self->_expandAccessoryViewToFillCellHorizontally)
    {
      LODWORD(right) = 1132068864;
      [(UIView *)customAccessoryView setContentHuggingPriority:0 forAxis:right];
      uint64_t v49 = [(UIView *)self->_customAccessoryView trailingAnchor];
      v50 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide trailingAnchor];
      v101 = v49;
      v51 = [v49 constraintEqualToAnchor:v50];
      v115[0] = v51;
      double v52 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide trailingAnchor];
      uint64_t v53 = v16[472];
      uint64_t v54 = [*(id *)((char *)&self->super.super.super.super.isa + v53) trailingAnchor];
      v55 = [v52 constraintEqualToAnchor:v54 constant:-v9];
      v115[1] = v55;
      id v56 = v115;
    }
    else
    {
      LODWORD(right) = 1148846080;
      [(UIView *)customAccessoryView setContentHuggingPriority:0 forAxis:right];
      double v57 = [(UIView *)self->_customAccessoryView trailingAnchor];
      v50 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide trailingAnchor];
      v101 = v57;
      v51 = [v57 constraintEqualToAnchor:v50];
      v114[0] = v51;
      double v52 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide trailingAnchor];
      uint64_t v53 = v16[472];
      uint64_t v54 = [*(id *)((char *)&self->super.super.super.super.isa + v53) trailingAnchor];
      v55 = [v52 constraintLessThanOrEqualToAnchor:v54 constant:-v9];
      v114[1] = v55;
      id v56 = v114;
    }
    v58 = +[NSArray arrayWithObjects:v56 count:2];
    [v110 addObjectsFromArray:v58];

    LODWORD(v59) = 1148846080;
    [(UIView *)self->_customAccessoryView setContentHuggingPriority:1 forAxis:v59];
    v102 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide topAnchor];
    v98 = [*(id *)((char *)&self->super.super.super.super.isa + v53) topAnchor];
    v95 = [v102 constraintEqualToAnchor:v98];
    v113[0] = v95;
    v94 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide bottomAnchor];
    v93 = [*(id *)((char *)&self->super.super.super.super.isa + v53) bottomAnchor];
    v92 = [v94 constraintEqualToAnchor:v93];
    v113[1] = v92;
    v60 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide leadingAnchor];
    v91 = v60;
    double v61 = 0.0;
    if (v17) {
      double v61 = v10;
    }
    v90 = [v60 constraintEqualToAnchor:v11 constant:v61];
    v113[2] = v90;
    v89 = [(UIView *)self->_customAccessoryView leadingAnchor];
    v88 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide leadingAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v113[3] = v87;
    v86 = [(UIView *)self->_customAccessoryView centerYAnchor];
    v62 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide centerYAnchor];
    v63 = [v86 constraintEqualToAnchor:v62];
    v113[4] = v63;
    v64 = [(UIView *)self->_customAccessoryView topAnchor];
    v65 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide topAnchor];
    v66 = [v64 constraintGreaterThanOrEqualToAnchor:v65];
    v113[5] = v66;
    __int16 v67 = [(UIView *)self->_customAccessoryView bottomAnchor];
    double v68 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide bottomAnchor];
    float v69 = [v67 constraintLessThanOrEqualToAnchor:v68];
    v113[6] = v69;
    double v70 = +[NSArray arrayWithObjects:v113 count:7];
    [v110 addObjectsFromArray:v70];

    if (self->_expandAccessoryViewToFillCellHorizontally)
    {
      double v11 = 0;
    }
    else
    {
      double v11 = [(UIView *)self->_customAccessoryView trailingAnchor];
    }
    LOBYTE(v4) = v106;

    self->_secondRowHasContent = 1;
    BOOL v17 = 1;
    double v47 = v110;
    uint64_t v16 = &OBJC_IVAR___CRLStrokePattern__phase;
    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
    double v9 = v10;
    double v47 = v110;
    if (!v11) {
      goto LABEL_34;
    }
  }
  if ((v4 & 4) == 0)
  {
    uint64_t v71 = v16[472];
LABEL_33:
    v83 = [*(id *)((char *)&self->super.super.super.super.isa + v71) trailingAnchor];
    v84 = [v11 constraintLessThanOrEqualToAnchor:v83 constant:v46];
    v111 = v84;
    v85 = +[NSArray arrayWithObjects:&v111 count:1];
    [v47 addObjectsFromArray:v85];

    goto LABEL_34;
  }
  id v72 = v16;
  double v73 = v11;
  LODWORD(right) = 1148846080;
  [(UILabel *)self->_customDetailTextLabel setContentHuggingPriority:1 forAxis:right];
  LODWORD(v74) = 1148846080;
  [(UILabel *)self->_customDetailTextLabel setContentHuggingPriority:0 forAxis:v74];
  v75 = [(UILabel *)self->_customDetailTextLabel leadingAnchor];
  uint64_t v76 = v75;
  double v77 = 0.0;
  if (v17) {
    double v77 = v9;
  }
  v78 = [v75 constraintEqualToAnchor:v11 constant:v77];
  v112[0] = v78;
  v79 = [(UILabel *)self->_customDetailTextLabel centerYAnchor];
  uint64_t v71 = v72[472];
  v80 = [*(id *)((char *)&self->super.super.super.super.isa + v71) centerYAnchor];
  v81 = [v79 constraintEqualToAnchor:v80];
  v112[1] = v81;
  v82 = +[NSArray arrayWithObjects:v112 count:2];
  [v110 addObjectsFromArray:v82];

  double v47 = v110;
  double v11 = [(UILabel *)self->_customDetailTextLabel trailingAnchor];

  self->_secondRowHasContent = 1;
  if (v11) {
    goto LABEL_33;
  }
LABEL_34:
}

- (void)p_generateConstraintsForTitleAreaTrailingAnchor:(unint64_t)a3 intoArray:(id)a4
{
  id v17 = a4;
  [(CRLiOSInspectorTableViewCell *)self indentationWidth];
  double v6 = v5;
  BOOL needsPaddingOnTrailingContentAnchor = self->_needsPaddingOnTrailingContentAnchor;
  BOOL v8 = [(CRLiOSInspectorTableViewCell *)self expandTextLabelToFillCell];
  double v9 = -v6;
  if (!needsPaddingOnTrailingContentAnchor || v8) {
    double v11 = 0.0;
  }
  else {
    double v11 = -v6;
  }
  -[CRLiOSInspectorLabel setContainsTrailingMargin:](self->_customTextLabel, "setContainsTrailingMargin:", v8, v9);
  unsigned int v12 = [(CRLiOSInspectorTableViewCell *)self fullSizeControlReplacesTextLabel];
  double v13 = [(UILayoutGuide *)self->_titleAreaLayoutGuide trailingAnchor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
  if (v12) {
    [v13 constraintEqualToAnchor:WeakRetained constant:v11];
  }
  else {
  double v15 = [v13 constraintLessThanOrEqualToAnchor:WeakRetained constant:v11];
  }

  LODWORD(v16) = 1144766464;
  [v15 setPriority:v16];
  if (v15) {
    [v17 addObject:v15];
  }
}

- (void)p_generateConstraintsForFullSizeControl:(unint64_t)a3 intoArray:(id)a4
{
  __int16 v4 = a3;
  id v6 = a4;
  if ((v4 & 0x1000) != 0
    && ![(CRLiOSInspectorTableViewCell *)self fullSizeControlReplacesTextLabel])
  {
    id v7 = [(CRLiOSInspectorTableViewCell *)self indentationLevel];
    double top = self->_fullSizeControlInsets.top;
    double v9 = self->_fullSizeControlInsets.left + (double)(uint64_t)v7 * 16.0;
    double v10 = 0.0 - self->_fullSizeControlInsets.right;
    double v11 = 0.0 - self->_fullSizeControlInsets.bottom;
    if (self->_firstRowHasContent || self->_secondRowHasContent)
    {
      unsigned int v12 = self->_thirdRowLayoutGuide;
      double v9 = v9 + (double)(uint64_t)[(CRLiOSInspectorTableViewCell *)self indentationLevel] * 16.0;
      self->_thirdRowHasContent = 1;
    }
    else
    {
      unsigned int v12 = self->_firstRowLayoutGuide;
    }
    double v13 = [(UIView *)self->_fullSizeControl centerYAnchor];
    double v14 = [(UILayoutGuide *)v12 centerYAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];

    LODWORD(v16) = 1144750080;
    v30 = v15;
    [v15 setPriority:v16];
    v31[0] = v15;
    id v29 = [(UIView *)self->_fullSizeControl topAnchor];
    v28 = [(UILayoutGuide *)v12 topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:top];
    v31[1] = v27;
    char v26 = [(UIView *)self->_fullSizeControl leadingAnchor];
    double v25 = [(UILayoutGuide *)v12 leadingAnchor];
    id v17 = [v26 constraintEqualToAnchor:v25 constant:v9];
    v31[2] = v17;
    uint64_t v18 = [(UIView *)self->_fullSizeControl trailingAnchor];
    id v19 = [(UILayoutGuide *)v12 trailingAnchor];
    double v20 = [v18 constraintEqualToAnchor:v19 constant:v10];
    v31[3] = v20;
    id v21 = [(UIView *)self->_fullSizeControl bottomAnchor];
    uint64_t v22 = [(UILayoutGuide *)v12 bottomAnchor];
    double v23 = [v21 constraintEqualToAnchor:v22 constant:v11];
    v31[4] = v23;
    double v24 = +[NSArray arrayWithObjects:v31 count:5];
    [v6 addObjectsFromArray:v24];
  }
}

- (void)p_generateConstraintsForFirstRowLayoutGuideIntoArray:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLiOSInspectorTableViewCell *)self p_safeAreaLayoutGuide];
  BOOL needsPaddingOnLeadingContentAnchor = self->_needsPaddingOnLeadingContentAnchor;
  BOOL needsPaddingOnTrailingContentAnchor = self->_needsPaddingOnTrailingContentAnchor;
  BOOL v8 = [(UILayoutGuide *)self->_firstRowLayoutGuide heightAnchor];
  [(CRLiOSInspectorTableViewCell *)self minimumRowHeight];
  double v9 = [v8 constraintGreaterThanOrEqualToConstant:];

  LODWORD(v10) = 1148829696;
  [v9 setPriority:v10];
  if (self->_firstRowLayoutGuide)
  {
    [(CRLiOSInspectorTableViewCell *)self p_minimumVerticalTitlePadding];
    double v12 = v11;
    uint64_t v49 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    v50 = [(CRLiOSInspectorTableViewCell *)self contentView];
    v48 = [v50 topAnchor];
    double v47 = [v49 constraintEqualToAnchor:v48];
    v54[0] = v47;
    double v46 = [(UILayoutGuide *)self->_firstRowLayoutGuide leadingAnchor];
    v45 = [v5 leadingAnchor];
    double v44 = [v46 constraintEqualToAnchor:v45];
    v54[1] = v44;
    double v43 = [(UILayoutGuide *)self->_firstRowLayoutGuide trailingAnchor];
    id v42 = [v5 trailingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v54[2] = v41;
    v54[3] = v9;
    uint64_t v53 = v4;
    v40 = [(UILayoutGuide *)self->_firstRowCenterFreeSpaceLayoutGuide topAnchor];
    v39 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    uint64_t v38 = [v40 constraintEqualToAnchor:v39];
    v54[4] = v38;
    uint64_t v37 = [(UILayoutGuide *)self->_firstRowCenterFreeSpaceLayoutGuide bottomAnchor];
    double v36 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v54[5] = v35;
    double v34 = [(UILayoutGuide *)self->_firstRowCenterFreeSpaceLayoutGuide leadingAnchor];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
    id v32 = [v34 constraintEqualToAnchor:WeakRetained];
    v54[6] = v32;
    v31 = [(UILayoutGuide *)self->_firstRowCenterFreeSpaceLayoutGuide trailingAnchor];
    p_trailingContentLeadingEdgeAnchor = &self->_trailingContentLeadingEdgeAnchor;
    id v30 = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);
    id v29 = [v31 constraintEqualToAnchor:v30];
    v54[7] = v29;
    double v52 = v5;
    v28 = [(UILayoutGuide *)self->_insetFirstRowCenterFreeSpaceLayoutGuide topAnchor];
    v27 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    char v26 = [v28 constraintEqualToAnchor:v27 constant:v12];
    v54[8] = v26;
    [(UILayoutGuide *)self->_insetFirstRowCenterFreeSpaceLayoutGuide bottomAnchor];
    double v14 = v51 = v9;
    double v15 = [(UILayoutGuide *)self->_firstRowLayoutGuide bottomAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:-v12];
    v54[9] = v16;
    id v17 = [(UILayoutGuide *)self->_insetFirstRowCenterFreeSpaceLayoutGuide leadingAnchor];
    id v18 = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);
    double v19 = 16.0;
    if (!needsPaddingOnLeadingContentAnchor) {
      double v19 = 0.0;
    }
    double v20 = [v17 constraintEqualToAnchor:v18 constant:v19];
    v54[10] = v20;
    id v21 = [(UILayoutGuide *)self->_insetFirstRowCenterFreeSpaceLayoutGuide trailingAnchor];
    id v22 = objc_loadWeakRetained((id *)p_trailingContentLeadingEdgeAnchor);
    double v23 = -16.0;
    if (!needsPaddingOnTrailingContentAnchor) {
      double v23 = 0.0;
    }
    double v24 = [v21 constraintEqualToAnchor:v22 constant:v23];
    v54[11] = v24;
    double v25 = +[NSArray arrayWithObjects:v54 count:12];
    [v53 addObjectsFromArray:v25];

    double v5 = v52;
    id v4 = v53;

    double v9 = v51;
  }
}

- (void)p_generateConstraintsForSecondRowLayoutGuide:(unint64_t)a3 intoArray:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = [(CRLiOSInspectorTableViewCell *)self p_safeAreaLayoutGuide];
  if (self->_secondRowLayoutGuide)
  {
    if ((v4 & 3) == 1 && self->_secondRowHasContent && !self->_expandAccessoryViewToFillCellHorizontally) {
      BOOL v8 = &OBJC_IVAR___CRLiOSInspectorTableViewCell__customTextLabel;
    }
    else {
      BOOL v8 = &OBJC_IVAR___CRLiOSInspectorTableViewCell__firstRowLayoutGuide;
    }
    double v25 = [*(id *)((char *)&self->super.super.super.super.isa + *v8) bottomAnchor];
    double v24 = [(UILayoutGuide *)self->_secondRowLayoutGuide topAnchor];
    double v23 = [v24 constraintEqualToAnchor:v25];
    v27[0] = v23;
    id v22 = [(UILayoutGuide *)self->_secondRowLayoutGuide leadingAnchor];
    double v9 = [v7 leadingAnchor];
    double v10 = [v22 constraintEqualToAnchor:v9];
    v27[1] = v10;
    double v11 = [(UILayoutGuide *)self->_secondRowLayoutGuide trailingAnchor];
    double v12 = [v7 trailingAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v27[2] = v13;
    double v14 = +[NSArray arrayWithObjects:v27 count:3];
    [v6 addObjectsFromArray:v14];
  }
  secondRowLayoutGuide = self->_secondRowLayoutGuide;
  if (self->_secondRowHasContent)
  {
    double v16 = [(UILayoutGuide *)secondRowLayoutGuide heightAnchor];
    id v17 = [(UILayoutGuide *)self->_firstRowLayoutGuide heightAnchor];
    id v18 = [v16 constraintGreaterThanOrEqualToAnchor:v17 multiplier:0.5];

    if (v18)
    {
      LODWORD(v19) = 1148829696;
      [v18 setPriority:v19];
      [v6 addObject:v18];
    }
    goto LABEL_12;
  }
  if (secondRowLayoutGuide)
  {
    id v18 = [(UILayoutGuide *)secondRowLayoutGuide heightAnchor];
    double v20 = [v18 constraintEqualToConstant:0.0];
    char v26 = v20;
    id v21 = +[NSArray arrayWithObjects:&v26 count:1];
    [v6 addObjectsFromArray:v21];

LABEL_12:
  }
}

- (void)p_generateConstraintsForThirdRowLayoutGuide:(unint64_t)a3 intoArray:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = [(CRLiOSInspectorTableViewCell *)self p_safeAreaLayoutGuide];
  double v36 = v6;
  if ((v4 & 1) != 0 && self->_secondRowHasContent)
  {
    BOOL v8 = [(UILayoutGuide *)self->_firstRowLayoutGuide topAnchor];
    double v9 = [(CRLiOSInspectorLabel *)self->_customTextLabel topAnchor];
    double v10 = [v8 anchorWithOffsetToAnchor:v9];

    double v11 = [(UILayoutGuide *)self->_secondRowLayoutGuide bottomAnchor];
    double v12 = [(UILayoutGuide *)self->_thirdRowLayoutGuide topAnchor];
    double v13 = [v11 anchorWithOffsetToAnchor:v12];
  }
  else
  {
    double v10 = [(UILayoutGuide *)self->_thirdRowLayoutGuide topAnchor];
    double v13 = [(UILayoutGuide *)self->_secondRowLayoutGuide bottomAnchor];
  }
  double v14 = [v10 constraintEqualToAnchor:v13];

  thirdRowLayoutGuide = self->_thirdRowLayoutGuide;
  if (thirdRowLayoutGuide)
  {
    v39[0] = v14;
    double v34 = [(UILayoutGuide *)thirdRowLayoutGuide leadingAnchor];
    BOOL v33 = [v7 leadingAnchor];
    id v32 = [v34 constraintEqualToAnchor:v33];
    v39[1] = v32;
    v31 = [(UILayoutGuide *)self->_thirdRowLayoutGuide trailingAnchor];
    [v7 trailingAnchor];
    double v16 = v35 = v7;
    id v17 = [v31 constraintEqualToAnchor:v16];
    v39[2] = v17;
    id v18 = [(UILayoutGuide *)self->_thirdRowLayoutGuide bottomAnchor];
    double v19 = [(CRLiOSInspectorTableViewCell *)self contentView];
    double v20 = [v19 bottomAnchor];
    id v21 = [v18 constraintEqualToAnchor:v20];
    v39[3] = v21;
    id v22 = +[NSArray arrayWithObjects:v39 count:4];
    [v36 addObjectsFromArray:v22];

    id v7 = v35;
  }
  double v23 = self->_thirdRowLayoutGuide;
  if (self->_thirdRowHasContent)
  {
    double v24 = [(UILayoutGuide *)v23 heightAnchor];
    double v25 = [(UILayoutGuide *)self->_firstRowLayoutGuide heightAnchor];
    char v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25];

    if (!v26)
    {
      id v29 = v36;
      goto LABEL_14;
    }
    LODWORD(v27) = 1148829696;
    [v26 setPriority:v27];
    uint64_t v38 = v26;
    v28 = +[NSArray arrayWithObjects:&v38 count:1];
    id v29 = v36;
    [v36 addObjectsFromArray:v28];
LABEL_12:

LABEL_14:
    goto LABEL_15;
  }
  id v29 = v36;
  if (v23)
  {
    char v26 = [(UILayoutGuide *)v23 heightAnchor];
    v28 = [v26 constraintEqualToConstant:0.0];
    uint64_t v37 = v28;
    id v30 = +[NSArray arrayWithObjects:&v37 count:1];
    [v36 addObjectsFromArray:v30];

    goto LABEL_12;
  }
LABEL_15:
}

- (void)p_generateConstraintsForLegacyFixedRowHeightIntoArray:(id)a3
{
  double legacyFixedRowHeight = self->_legacyFixedRowHeight;
  if (legacyFixedRowHeight > 0.0)
  {
    id v5 = a3;
    [(id)objc_opt_class() minimumHeight];
    if (legacyFixedRowHeight < v6) {
      double legacyFixedRowHeight = v6;
    }
    id v7 = [(CRLiOSInspectorTableViewCell *)self contentView];
    BOOL v8 = [v7 heightAnchor];
    double v9 = [v8 constraintEqualToConstant:legacyFixedRowHeight];
    double v11 = v9;
    double v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 addObjectsFromArray:v10];
  }
}

- (id)p_standardLabelFont
{
  v2 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryLarge];
  __int16 v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v2];

  return v3;
}

- (id)p_currentLabelFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (id)p_currentDetailLabelFont
{
  if (self->_cellStyle == 3) {
    v2 = &UIFontTextStyleCaption1;
  }
  else {
    v2 = &UIFontTextStyleBody;
  }
  return +[UIFont preferredFontForTextStyle:*v2];
}

- (double)p_currentAccessibilitySizeRatio
{
  unsigned int v3 = [(CRLiOSInspectorTableViewCell *)self automaticallyResizesForContentSizeCategory];
  double result = 1.0;
  if (v3)
  {
    id v5 = [(CRLiOSInspectorTableViewCell *)self p_standardLabelFont];
    [v5 pointSize];
    double v7 = v6;

    BOOL v8 = [(CRLiOSInspectorTableViewCell *)self p_currentLabelFont];
    [v8 pointSize];
    double v10 = v9;

    return fmax(v10 / v7, 1.0);
  }
  return result;
}

- (double)p_minimumVerticalTitlePadding
{
  unsigned int v3 = [(CRLiOSInspectorTableViewCell *)self currentContentSizeCategoryWrapsToNextLine];
  double result = 6.0;
  if (v3)
  {
    [(CRLiOSInspectorTableViewCell *)self p_currentAccessibilitySizeRatio];
    return v5 * 10.0;
  }
  return result;
}

- (double)minimumRowHeight
{
  [(id)objc_opt_class() minimumHeight];
  double v4 = v3;
  if ([(CRLiOSInspectorTableViewCell *)self currentContentSizeCategoryWrapsToNextLine])
  {
    [(CRLiOSInspectorTableViewCell *)self p_minimumVerticalTitlePadding];
    double v6 = v5;
    double v7 = [(CRLiOSInspectorTableViewCell *)self p_currentLabelFont];
    [v7 lineHeight];
    double v9 = v8 + v6 * 2.0;
  }
  else
  {
    [(CRLiOSInspectorTableViewCell *)self p_currentAccessibilitySizeRatio];
    double v9 = v4 * v10;
  }
  return ceil(v9);
}

- (BOOL)p_needsConstraintsUpdateForElements:(unint64_t)a3
{
  if (self->_activeConstrainedElements != a3 || self->_constraintConstantsNeedUpdate) {
    return 1;
  }
  [(CRLiOSInspectorTableViewCell *)self p_currentAccessibilitySizeRatio];
  return v5 != self->_activeAccessibilitySizeMultiplier;
}

- (void)p_imageDidChange
{
  [(CRLiOSInspectorTableViewCell *)self p_updateImageTintColor];

  [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
}

- (void)p_updateImageTintColor
{
  if (self->_imageUsesTitleLabelColor)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabelColor);
    [(CRLiOSInspectorTableCellImageView *)self->_customImageView setTintColor:WeakRetained];
  }
  else
  {
    customImageView = self->_customImageView;
    [(CRLiOSInspectorTableCellImageView *)customImageView setTintColor:0];
  }
}

- (void)p_contentSizeCategoryDidChangeNotification:(id)a3
{
  double v4 = [(CRLiOSInspectorTableViewCell *)self p_currentLabelFont];
  [(CRLiOSInspectorLabel *)self->_customTextLabel setFont:v4];

  double v5 = [(CRLiOSInspectorTableViewCell *)self p_currentDetailLabelFont];
  [(UILabel *)self->_customDetailTextLabel setFont:v5];

  [(CRLiOSInspectorTableViewCell *)self setNeedsUpdateConstraints];
}

- (void)p_detailButtonTapped:(id)a3
{
  double v4 = [(CRLiOSInspectorTableViewCell *)self superview];
  do
  {
    double v5 = v4;
    uint64_t v6 = objc_opt_class();
    double v7 = sub_1002469D0(v6, v4);
    double v4 = [v4 superview];

    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v4 == 0;
    }
  }
  while (!v8);
  double v9 = [v7 delegate];
  double v16 = sub_100246AC8(v9, 1, v10, v11, v12, v13, v14, v15, (uint64_t)&OBJC_PROTOCOL___UITableViewDelegate);

  id v17 = [v7 indexPathForCell:self];
  if (v17)
  {
    [v16 tableView:v7 accessoryButtonTappedForRowWithIndexPath:v17];
  }
  else
  {
    if (v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6F70);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AE0A0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6F90);
      }
      id v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v18);
      }
      double v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell p_detailButtonTapped:]");
      double v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"];
      +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:1749 isFatal:0 description:"expected nil table view if index path was also nil"];
    }
    if (v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6FB0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AE018();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6FD0);
      }
      id v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v21);
      }
      id v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSInspectorTableViewCell p_detailButtonTapped:]");
      double v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Inspectors/CRLiOSInspectorTableViewCell.m"];
      +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:1750 isFatal:0 description:"expected nil delegate if table view was also nil"];
    }
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CRLiOSInspectorTableViewCell;
  [(CRLiOSInspectorTableViewCell *)&v16 layoutSubviews];
  if ([(CRLiOSInspectorTableViewCell *)self showsReorderControl])
  {
    double v3 = [(CRLiOSInspectorTableViewCell *)self contentView];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    if (sub_1003E8750())
    {
      [(CRLiOSInspectorTableViewCell *)self bounds];
      double MaxX = CGRectGetMaxX(v17);
      v18.origin.x = v5;
      v18.origin.double y = v7;
      v18.size.double width = v9;
      v18.size.double height = v11;
      if (MaxX - CGRectGetMaxX(v18) == 40.0)
      {
        double v9 = v9 + 3.0;
        uint64_t v13 = [(CRLiOSInspectorTableViewCell *)self contentView];
        [v13 setFrame:v5, v7, v9, v11];
      }
    }
    if (sub_1003E86EC())
    {
      v19.origin.x = v5;
      v19.origin.double y = v7;
      v19.size.double width = v9;
      v19.size.double height = v11;
      double MinX = CGRectGetMinX(v19);
      [(CRLiOSInspectorTableViewCell *)self bounds];
      if (MinX - CGRectGetMinX(v20) == 64.0)
      {
        uint64_t v15 = [(CRLiOSInspectorTableViewCell *)self contentView];
        [v15 setFrame:CGRectMake(v5 + -27.0, v7, v9 + 27.0, v11)];
      }
    }
  }
}

- (void)updateConstraints
{
  unint64_t v3 = [(CRLiOSInspectorTableViewCell *)self p_elementsToConstrain];
  if ([(CRLiOSInspectorTableViewCell *)self p_needsConstraintsUpdateForElements:v3])
  {
    [(CRLiOSInspectorTableViewCell *)self p_updateConstraintsForElements:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSInspectorTableViewCell;
  [(CRLiOSInspectorTableViewCell *)&v4 updateConstraints];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CRLiOSInspectorTableViewCell *)self disablesContentWhenNotUserInteractive] ^ 1 | a3;
  [(CRLiOSInspectorLabel *)self->_customTextLabel setEnabled:v5];
  [(CRLiOSInspectorLabel *)self->_customTextLabel setUserInteractionEnabled:v3];
  [(UILabel *)self->_customDetailTextLabel setEnabled:v5];
  [(UILabel *)self->_customDetailTextLabel setUserInteractionEnabled:v3];
  [(CRLiOSInspectorTableCellImageView *)self->_customImageView setUserInteractionEnabled:v3];
  [(UIView *)self->_customStandardAccessoryView setUserInteractionEnabled:v3];
  uint64_t v6 = objc_opt_class();
  double v7 = sub_1002469D0(v6, self->_customStandardAccessoryView);
  [v7 setEnabled:v5];
  [(CRLiOSInspectorCheckmark *)self->_checkmarkView setEnabled:v5];
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSInspectorTableViewCell;
  [(CRLiOSInspectorTableViewCell *)&v8 setUserInteractionEnabled:v3];
}

- (void)setNeedsUpdateConstraints
{
  self->_constraintConstantsNeedUpdate = 1;
  [(CRLiOSInspectorTableViewCell *)self p_setNeedsUpdateConstraints];
}

- (void)p_setNeedsUpdateConstraints
{
  v2.receiver = self;
  v2.super_class = (Class)CRLiOSInspectorTableViewCell;
  [(CRLiOSInspectorTableViewCell *)&v2 setNeedsUpdateConstraints];
}

- (id)p_safeAreaLayoutGuide
{
  return [(CRLiOSInspectorTableViewCell *)self p_mainLayoutAnchorOwner];
}

- (id)p_mainLayoutAnchorOwner
{
  BOOL usesContentViewInsteadOfSafeAreaLayoutGuide = self->_usesContentViewInsteadOfSafeAreaLayoutGuide;
  BOOL v3 = [(CRLiOSInspectorTableViewCell *)self contentView];
  objc_super v4 = v3;
  if (!usesContentViewInsteadOfSafeAreaLayoutGuide)
  {
    uint64_t v5 = [v3 safeAreaLayoutGuide];

    objc_super v4 = (void *)v5;
  }

  return v4;
}

- (id)imageView
{
  return [(CRLiOSInspectorTableViewCell *)self customImageView];
}

- (id)accessoryView
{
  return [(CRLiOSInspectorTableViewCell *)self customAccessoryView];
}

- (void)setAccessoryView:(id)a3
{
}

- (int64_t)accessoryType
{
  return [(CRLiOSInspectorTableViewCell *)self customAccessoryType];
}

- (void)setAccessoryType:(int64_t)a3
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInspectorTableViewCell;
  [(CRLiOSInspectorTableViewCell *)&v6 setHighlighted:a3 animated:a4];
  [(CRLiOSInspectorTableCellImageButton *)self->_customImageButton setHighlighted:v4];
}

- (id)accessibilityLabel
{
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSInspectorTableViewCell;
  BOOL v3 = [(CRLiOSInspectorTableViewCell *)&v10 accessibilityLabel];
  if (![v3 length])
  {
    BOOL v4 = [(CRLiOSInspectorTableViewCell *)self customTextLabel];
    uint64_t v5 = [v4 text];
    id v6 = [v5 length];

    if (v6)
    {
      double v7 = [(CRLiOSInspectorTableViewCell *)self customTextLabel];
      uint64_t v8 = [v7 text];

      BOOL v3 = (void *)v8;
    }
  }

  return v3;
}

- (id)accessibilityValue
{
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSInspectorTableViewCell;
  BOOL v3 = [(CRLiOSInspectorTableViewCell *)&v10 accessibilityValue];
  if (![v3 length])
  {
    BOOL v4 = [(CRLiOSInspectorTableViewCell *)self customDetailTextLabel];
    uint64_t v5 = [v4 text];
    id v6 = [v5 length];

    if (v6)
    {
      double v7 = [(CRLiOSInspectorTableViewCell *)self customDetailTextLabel];
      uint64_t v8 = [v7 text];

      BOOL v3 = (void *)v8;
    }
  }

  return v3;
}

+ (id)checkableCellWithTitle:(id)a3 checkmarkOnLeadingEdge:(BOOL)a4 checked:(BOOL)a5 reuseIdentifier:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithStyle:0 reuseIdentifier:v10];

  [v11 setCheckable:1];
  [v11 setChecked:v7];
  [v11 setShowsCheckmarkOnLeadingEdge:v8];
  if (v9)
  {
    uint64_t v12 = [v11 textLabel];
    [v12 setText:v9];
  }

  return v11;
}

+ (id)checkableCellWithImage:(id)a3 checkmarkOnLeadingEdge:(BOOL)a4 checked:(BOOL)a5 reuseIdentifier:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithStyle:0 reuseIdentifier:v10];

  [v11 setCheckable:1];
  [v11 setChecked:v7];
  [v11 setShowsCheckmarkOnLeadingEdge:v8];
  [v11 setShowsImageOnTrailingEdge:v8];
  if (v9)
  {
    uint64_t v12 = [v11 imageView];
    [v12 setImage:v9];
  }

  return v11;
}

+ (id)checkableSubtitleCellWithTitle:(id)a3 subtitle:(id)a4 checkmarkOnLeadingEdge:(BOOL)a5 checked:(BOOL)a6 reuseIdentifier:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = [objc_alloc((Class)objc_opt_class()) initWithStyle:3 reuseIdentifier:v13];

  [v14 setCheckable:1];
  [v14 setChecked:v8];
  [v14 setShowsCheckmarkOnLeadingEdge:v9];
  if (v11)
  {
    uint64_t v15 = [v14 textLabel];
    [v15 setText:v11];
  }
  if (v12)
  {
    objc_super v16 = [v14 detailTextLabel];
    [v16 setText:v12];
  }

  return v14;
}

+ (id)checkableCellWithTitle:(id)a3 detailText:(id)a4 checkmarkOnLeadingEdge:(BOOL)a5 checked:(BOOL)a6 reuseIdentifier:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = [objc_alloc((Class)objc_opt_class()) initWithStyle:1 reuseIdentifier:v13];

  [v14 setCheckable:1];
  [v14 setChecked:v8];
  [v14 setShowsCheckmarkOnLeadingEdge:v9];
  if (v11)
  {
    uint64_t v15 = [v14 textLabel];
    [v15 setText:v11];
  }
  if (v12)
  {
    objc_super v16 = [v14 detailTextLabel];
    [v16 setText:v12];
  }

  return v14;
}

- (UIView)fullSizeControl
{
  return self->_fullSizeControl;
}

- (UIEdgeInsets)fullSizeControlInsets
{
  double top = self->_fullSizeControlInsets.top;
  double left = self->_fullSizeControlInsets.left;
  double bottom = self->_fullSizeControlInsets.bottom;
  double right = self->_fullSizeControlInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)fullSizeControlReplacesTextLabel
{
  return self->_fullSizeControlReplacesTextLabel;
}

- (void)setFullSizeControlReplacesTextLabel:(BOOL)a3
{
  self->_fullSizeControlReplacesTextLabel = a3;
}

- (BOOL)checkable
{
  return self->_checkable;
}

- (BOOL)checked
{
  return self->_checked;
}

- (UIImage)customCheckmarkImage
{
  return self->_customCheckmarkImage;
}

- (UIImage)customHighlightedCheckmarkImage
{
  return self->_customHighlightedCheckmarkImage;
}

- (BOOL)showsCheckmarkOnLeadingEdge
{
  return self->_showsCheckmarkOnLeadingEdge;
}

- (void)setShowsCheckmarkOnLeadingEdge:(BOOL)a3
{
  self->_showsCheckmarkOnLeadingEdge = a3;
}

- (BOOL)showsImageOnTrailingEdge
{
  return self->_showsImageOnTrailingEdge;
}

- (void)setShowsImageOnTrailingEdge:(BOOL)a3
{
  self->_showsImageOnTrailingEdge = a3;
}

- (BOOL)showsImageButtonTrailingAdjacentToLabel
{
  return self->_showsImageButtonTrailingAdjacentToLabel;
}

- (void)setShowsImageButtonTrailingAdjacentToLabel:(BOOL)a3
{
  self->_showsImageButtonTrailingAdjacentToLabel = a3;
}

- (UIEdgeInsets)imageInsets
{
  double top = self->_imageInsets.top;
  double left = self->_imageInsets.left;
  double bottom = self->_imageInsets.bottom;
  double right = self->_imageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)imageUsesStandardMargins
{
  return self->_imageUsesStandardMargins;
}

- (CRLiOSInspectorTableViewCellBackgroundView)customBackgroundView
{
  return self->_customBackgroundView;
}

- (CRLiOSInspectorTableViewCellSelectedBackgroundView)customSelectedBackgroundView
{
  return self->_customSelectedBackgroundView;
}

- (UIColor)titleLabelColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabelColor);

  return (UIColor *)WeakRetained;
}

- (UIColor)detailLabelColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabelColor);

  return (UIColor *)WeakRetained;
}

- (UIColor)disclosureDetailLabelColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureDetailLabelColor);

  return (UIColor *)WeakRetained;
}

- (UIColor)subtitleLabelColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabelColor);

  return (UIColor *)WeakRetained;
}

- (UIColor)detailButtonColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailButtonColor);

  return (UIColor *)WeakRetained;
}

- (BOOL)usesTitleLabelColor
{
  return self->_usesTitleLabelColor;
}

- (void)setUsesTitleLabelColor:(BOOL)a3
{
  self->_BOOL usesTitleLabelColor = a3;
}

- (BOOL)imageUsesTitleLabelColor
{
  return self->_imageUsesTitleLabelColor;
}

- (BOOL)expandTextLabelToFillCell
{
  return self->_expandTextLabelToFillCell;
}

- (void)setExpandTextLabelToFillCell:(BOOL)a3
{
  self->_expandTextLabelToFillCell = a3;
}

- (BOOL)preventTextLabelFromCompression
{
  return self->_preventTextLabelFromCompression;
}

- (BOOL)usesDisclosureDetailLabelColor
{
  return self->_usesDisclosureDetailLabelColor;
}

- (BOOL)usesSubtitleLabelColor
{
  return self->_usesSubtitleLabelColor;
}

- (BOOL)usesDetailButtonColor
{
  return self->_usesDetailButtonColor;
}

- (BOOL)disablesContentWhenNotUserInteractive
{
  return self->_disablesContentWhenNotUserInteractive;
}

- (BOOL)expandAccessoryViewToFillCellHorizontally
{
  return self->_expandAccessoryViewToFillCellHorizontally;
}

- (BOOL)automaticallyResizesForContentSizeCategory
{
  return self->_automaticallyResizesForContentSizeCategory;
}

- (double)legacyFixedRowHeight
{
  return self->_legacyFixedRowHeight;
}

- (UILayoutGuide)firstRowCenterFreeSpaceLayoutGuide
{
  return self->_firstRowCenterFreeSpaceLayoutGuide;
}

- (void)setFirstRowCenterFreeSpaceLayoutGuide:(id)a3
{
}

- (UILayoutGuide)insetFirstRowCenterFreeSpaceLayoutGuide
{
  return self->_insetFirstRowCenterFreeSpaceLayoutGuide;
}

- (void)setInsetFirstRowCenterFreeSpaceLayoutGuide:(id)a3
{
}

- (void)setCustomTextLabel:(id)a3
{
}

- (void)setCustomDetailTextLabel:(id)a3
{
}

- (void)setCustomImageView:(id)a3
{
}

- (void)setCustomImageButton:(id)a3
{
}

- (UIView)customAccessoryView
{
  return self->_customAccessoryView;
}

- (UIView)customStandardAccessoryView
{
  return self->_customStandardAccessoryView;
}

- (void)setCustomStandardAccessoryView:(id)a3
{
}

- (CRLiOSInspectorCheckmark)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (UIImageView)disclosureView
{
  return self->_disclosureView;
}

- (void)setDisclosureView:(id)a3
{
}

- (UILayoutGuide)titleAreaLayoutGuide
{
  return self->_titleAreaLayoutGuide;
}

- (void)setTitleAreaLayoutGuide:(id)a3
{
}

- (UILayoutGuide)firstRowLayoutGuide
{
  return self->_firstRowLayoutGuide;
}

- (void)setFirstRowLayoutGuide:(id)a3
{
}

- (UILayoutGuide)secondRowLayoutGuide
{
  return self->_secondRowLayoutGuide;
}

- (void)setSecondRowLayoutGuide:(id)a3
{
}

- (UILayoutGuide)thirdRowLayoutGuide
{
  return self->_thirdRowLayoutGuide;
}

- (void)setThirdRowLayoutGuide:(id)a3
{
}

- (UILayoutGuide)accessoryViewLayoutGuide
{
  return self->_accessoryViewLayoutGuide;
}

- (void)setAccessoryViewLayoutGuide:(id)a3
{
}

- (UILayoutGuide)titleAndDetailLayoutGuide
{
  return self->_titleAndDetailLayoutGuide;
}

- (void)setTitleAndDetailLayoutGuide:(id)a3
{
}

- (unint64_t)activeConstrainedElements
{
  return self->_activeConstrainedElements;
}

- (void)setActiveConstrainedElements:(unint64_t)a3
{
  self->_unint64_t activeConstrainedElements = a3;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (double)activeAccessibilitySizeMultiplier
{
  return self->_activeAccessibilitySizeMultiplier;
}

- (void)setActiveAccessibilitySizeMultiplier:(double)a3
{
  self->_activeAccessibilitySizeMultiplier = a3;
}

- (BOOL)constraintConstantsNeedUpdate
{
  return self->_constraintConstantsNeedUpdate;
}

- (void)setConstraintConstantsNeedUpdate:(BOOL)a3
{
  self->_constraintConstantsNeedUpdate = a3;
}

- (NSLayoutXAxisAnchor)leadingContentTrailingEdgeAnchor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingContentTrailingEdgeAnchor);

  return (NSLayoutXAxisAnchor *)WeakRetained;
}

- (void)setLeadingContentTrailingEdgeAnchor:(id)a3
{
}

- (NSLayoutXAxisAnchor)trailingContentLeadingEdgeAnchor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingContentLeadingEdgeAnchor);

  return (NSLayoutXAxisAnchor *)WeakRetained;
}

- (void)setTrailingContentLeadingEdgeAnchor:(id)a3
{
}

- (BOOL)needsPaddingOnLeadingContentAnchor
{
  return self->_needsPaddingOnLeadingContentAnchor;
}

- (void)setNeedsPaddingOnLeadingContentAnchor:(BOOL)a3
{
  self->_BOOL needsPaddingOnLeadingContentAnchor = a3;
}

- (BOOL)needsPaddingOnTrailingContentAnchor
{
  return self->_needsPaddingOnTrailingContentAnchor;
}

- (void)setNeedsPaddingOnTrailingContentAnchor:(BOOL)a3
{
  self->_BOOL needsPaddingOnTrailingContentAnchor = a3;
}

- (BOOL)titleAreaHasContent
{
  return self->_titleAreaHasContent;
}

- (void)setTitleAreaHasContent:(BOOL)a3
{
  self->_titleAreaHasContent = a3;
}

- (BOOL)firstRowHasContent
{
  return self->_firstRowHasContent;
}

- (void)setFirstRowHasContent:(BOOL)a3
{
  self->_firstRowHasContent = a3;
}

- (BOOL)secondRowHasContent
{
  return self->_secondRowHasContent;
}

- (void)setSecondRowHasContent:(BOOL)a3
{
  self->_secondRowHasContent = a3;
}

- (BOOL)thirdRowHasContent
{
  return self->_thirdRowHasContent;
}

- (void)setThirdRowHasContent:(BOOL)a3
{
  self->_thirdRowHasContent = a3;
}

- (BOOL)usesContentViewInsteadOfSafeAreaLayoutGuide
{
  return self->_usesContentViewInsteadOfSafeAreaLayoutGuide;
}

- (void)setUsesContentViewInsteadOfSafeAreaLayoutGuide:(BOOL)a3
{
  self->_BOOL usesContentViewInsteadOfSafeAreaLayoutGuide = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trailingContentLeadingEdgeAnchor);
  objc_destroyWeak((id *)&self->_leadingContentTrailingEdgeAnchor);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_titleAndDetailLayoutGuide, 0);
  objc_storeStrong((id *)&self->_accessoryViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_thirdRowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_secondRowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstRowLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_customStandardAccessoryView, 0);
  objc_storeStrong((id *)&self->_insetFirstRowCenterFreeSpaceLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstRowCenterFreeSpaceLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_detailButtonColor);
  objc_destroyWeak((id *)&self->_subtitleLabelColor);
  objc_destroyWeak((id *)&self->_disclosureDetailLabelColor);
  objc_destroyWeak((id *)&self->_detailLabelColor);
  objc_destroyWeak((id *)&self->_titleLabelColor);
  objc_storeStrong((id *)&self->_customSelectedBackgroundView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_customCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_fullSizeControl, 0);
  objc_storeStrong((id *)&self->_customAccessoryView, 0);
  objc_storeStrong((id *)&self->_customImageButton, 0);
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_customDetailTextLabel, 0);

  objc_storeStrong((id *)&self->_customTextLabel, 0);
}

@end