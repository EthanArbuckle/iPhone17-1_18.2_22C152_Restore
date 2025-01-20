@interface ICOutlineParentCollectionViewCell
- (BOOL)_accessibilityOverridesInstructionsHint;
- (BOOL)displayDisclosure;
- (BOOL)displayGenericTitle;
- (BOOL)isAccessibilityElement;
- (BOOL)isSyncActivityVisible;
- (BOOL)shouldDisplayTagSelectionOperator;
- (BOOL)styleForCalculator;
- (BOOL)usesSidebarHeaderConfiguration;
- (ICFolderListSectionIdentifier)folderListSectionIdentifier;
- (ICNoteSectionIdentifier)noteSectionIdentifier;
- (ICOutlineParentCollectionViewCell)initWithFrame:(CGRect)a3;
- (ICProgressIndicatorTracker)progressIndicatorTracker;
- (ICTagSelection)tagSelection;
- (UIAction)tagAllAction;
- (UIAction)tagAnyAction;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIButton)tagOperatorButton;
- (UIListContentView)listContentView;
- (UIStackView)horizontalStackView;
- (double)horizontalInsetsOverride;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)headerContentConfiguration;
- (id)tagSelectionDidChange;
- (id)upgradeButtonTapHandler;
- (unint64_t)accessibilityTraits;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setActivityIndicatorView:(id)a3;
- (void)setDisplayDisclosure:(BOOL)a3;
- (void)setDisplayGenericTitle:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFolderListSectionIdentifier:(id)a3;
- (void)setHorizontalInsetsOverride:(double)a3;
- (void)setHorizontalStackView:(id)a3;
- (void)setIsSyncActivityVisible:(BOOL)a3;
- (void)setListContentView:(id)a3;
- (void)setNoteSectionIdentifier:(id)a3;
- (void)setProgressIndicatorTracker:(id)a3;
- (void)setShouldDisplayTagSelectionOperator:(BOOL)a3;
- (void)setStyleForCalculator:(BOOL)a3;
- (void)setTagAllAction:(id)a3;
- (void)setTagAnyAction:(id)a3;
- (void)setTagOperatorButton:(id)a3;
- (void)setTagSelection:(id)a3;
- (void)setTagSelectionDidChange:(id)a3;
- (void)setUpgradeButtonTapHandler:(id)a3;
- (void)setUsesSidebarHeaderConfiguration:(BOOL)a3;
- (void)updateAccessories;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateSyncActivityIndicator;
@end

@implementation ICOutlineParentCollectionViewCell

- (ICOutlineParentCollectionViewCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ICOutlineParentCollectionViewCell;
  v3 = -[ICOutlineParentCollectionViewCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_displayGenericTitle = 0;
    v3->_displayDisclosure = 1;
    v3->_shouldDisplayTagSelectionOperator = 0;
    v3->_horizontalInsetsOverride = 2.22507386e-308;
    objc_initWeak(&location, v3);
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"Any Selected" value:&stru_10063F3D8 table:0];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10007DAEC;
    v16[3] = &unk_100627240;
    objc_copyWeak(&v17, &location);
    uint64_t v7 = +[UIAction ic_actionWithTitle:v6 handler:v16];
    tagAnyAction = v4->_tagAnyAction;
    v4->_tagAnyAction = (UIAction *)v7;

    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"All Selected" value:&stru_10063F3D8 table:0];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007DBCC;
    v14[3] = &unk_100627240;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = +[UIAction ic_actionWithTitle:v10 handler:v14];
    tagAllAction = v4->_tagAllAction;
    v4->_tagAllAction = (UIAction *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)ICOutlineParentCollectionViewCell;
  [(ICOutlineParentCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(ICOutlineParentCollectionViewCell *)self progressIndicatorTracker];
  [v3 invalidate];

  [(ICOutlineParentCollectionViewCell *)self setProgressIndicatorTracker:0];
}

- (void)dealloc
{
  v3 = [(ICOutlineParentCollectionViewCell *)self progressIndicatorTracker];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ICOutlineParentCollectionViewCell;
  [(ICOutlineParentCollectionViewCell *)&v4 dealloc];
}

- (void)setEditing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICOutlineParentCollectionViewCell;
  [(ICOutlineParentCollectionViewCell *)&v4 setEditing:a3];
  [(ICOutlineParentCollectionViewCell *)self updateAccessories];
}

- (void)setTagSelection:(id)a3
{
  objc_storeStrong((id *)&self->_tagSelection, a3);

  [(ICOutlineParentCollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (void)updateAccessories
{
  v3 = +[NSMutableArray array];
  objc_super v4 = [(ICOutlineParentCollectionViewCell *)self folderListSectionIdentifier];

  if (v4)
  {
    v5 = [(ICOutlineParentCollectionViewCell *)self activityIndicatorView];
    unsigned int v6 = [v5 isAnimating];

    if (v6)
    {
      id v7 = objc_alloc((Class)UICellAccessoryCustomView);
      v8 = [(ICOutlineParentCollectionViewCell *)self activityIndicatorView];
      id v9 = [v7 initWithCustomView:v8 placement:1];

      [v9 setDisplayedState:2];
      [v3 addObject:v9];
    }
    v10 = [(ICOutlineParentCollectionViewCell *)self upgradeButtonTapHandler];

    if (v10)
    {
      uint64_t v11 = +[UIButtonConfiguration borderlessButtonConfiguration];
      [v11 setButtonSize:2];
      v12 = +[NSBundle mainBundle];
      v13 = [v12 localizedStringForKey:@"Upgrade" value:&stru_10063F3D8 table:0];
      v14 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleBody];
      id v15 = +[NSAttributedString ic_attributedStringWithString:v13 font:v14];
      [v11 setAttributedTitle:v15];

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10007E12C;
      v23[3] = &unk_100627268;
      v23[4] = self;
      v16 = +[UIAction actionWithHandler:v23];
      id v17 = +[UIButton buttonWithConfiguration:v11 primaryAction:v16];

      [v11 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
      id v18 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v17 placement:1];
      [v18 setDisplayedState:2];
      [v3 addObject:v18];
    }
  }
  if ([(ICOutlineParentCollectionViewCell *)self displayDisclosure])
  {
    id v19 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
    [v19 setDisplayedState:0];
    [v19 setStyle:1];
    [v3 addObject:v19];
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007E1D8;
  v21[3] = &unk_100625860;
  v21[4] = self;
  id v22 = v3;
  id v20 = v3;
  +[UIView performWithoutAnimation:v21];
}

- (void)setFolderListSectionIdentifier:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_folderListSectionIdentifier, a3);
  if (v10)
  {
    noteSectionIdentifier = self->_noteSectionIdentifier;
    self->_noteSectionIdentifier = 0;
  }
  unsigned int v6 = [(ICOutlineParentCollectionViewCell *)self activityIndicatorView];

  if (!v6)
  {
    id v7 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [(ICOutlineParentCollectionViewCell *)self setActivityIndicatorView:v7];
  }
  if ([v10 sectionType] == (id)2 || objc_msgSend(v10, "sectionType") == (id)3) {
    uint64_t v8 = [(ICOutlineParentCollectionViewCell *)self displayGenericTitle] ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }
  [(ICOutlineParentCollectionViewCell *)self setIsSyncActivityVisible:v8];
  if ([(ICOutlineParentCollectionViewCell *)self isSyncActivityVisible])
  {
    id v9 = [[ICICloudProgressIndicatorTracker alloc] initWithDelegate:self];
    [(ICOutlineParentCollectionViewCell *)self setProgressIndicatorTracker:v9];
  }
  [(ICOutlineParentCollectionViewCell *)self updateAccessories];
  [(ICOutlineParentCollectionViewCell *)self updateSyncActivityIndicator];
  [(ICOutlineParentCollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (void)setNoteSectionIdentifier:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_noteSectionIdentifier, a3);
  if (v6)
  {
    folderListSectionIdentifier = self->_folderListSectionIdentifier;
    self->_folderListSectionIdentifier = 0;
  }
  [(ICOutlineParentCollectionViewCell *)self updateAccessories];
  [(ICOutlineParentCollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (id)headerContentConfiguration
{
  if ([(ICOutlineParentCollectionViewCell *)self usesSidebarHeaderConfiguration]) {
    +[UIListContentConfiguration headerConfiguration];
  }
  else {
  v2 = +[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration];
  }

  return v2;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v5 = +[UIBackgroundConfiguration clearConfiguration];
  [(ICOutlineParentCollectionViewCell *)self setBackgroundConfiguration:v5];

  id v6 = [(ICOutlineParentCollectionViewCell *)self headerContentConfiguration];
  id v7 = [v6 updatedConfigurationForState:v4];

  uint64_t v8 = ICAccessibilityAccessibilityLargerTextSizesEnabled() ^ 1;
  id v9 = [v7 textProperties];
  [v9 setNumberOfLines:v8];

  id v10 = [(ICOutlineParentCollectionViewCell *)self folderListSectionIdentifier];

  if (v10)
  {
    if ([(ICOutlineParentCollectionViewCell *)self displayGenericTitle])
    {
      uint64_t v11 = +[NSBundle mainBundle];
      [v11 localizedStringForKey:@"Folders" value:&stru_10063F3D8 table:0];
    }
    else
    {
      uint64_t v11 = [(ICOutlineParentCollectionViewCell *)self folderListSectionIdentifier];
      [v11 title];
    v12 = };

    v13 = [v7 textProperties];
    v14 = [v13 font];
    id v15 = [v14 ic_fontWithSingleLineA];
    v16 = [v7 textProperties];
    [v16 setFont:v15];

    goto LABEL_8;
  }
  v12 = [(ICOutlineParentCollectionViewCell *)self noteSectionIdentifier];

  if (v12)
  {
    v13 = [(ICOutlineParentCollectionViewCell *)self noteSectionIdentifier];
    v12 = [v13 title];
LABEL_8:
  }
  [v7 setText:v12];
  [(ICOutlineParentCollectionViewCell *)self setAccessibilityLabel:v12];
  if ([(ICOutlineParentCollectionViewCell *)self shouldDisplayTagSelectionOperator])
  {
    uint64_t v17 = [(ICOutlineParentCollectionViewCell *)self tagSelection];
    if (v17)
    {
      id v18 = (void *)v17;
      id v19 = [(ICOutlineParentCollectionViewCell *)self tagSelection];
      if ((unint64_t)[v19 selectedTagCount] <= 1)
      {
      }
      else
      {
        unsigned __int8 v20 = [v4 isEditing];

        if ((v20 & 1) == 0)
        {
          v21 = [(ICOutlineParentCollectionViewCell *)self tagSelection];
          BOOL v22 = [v21 tagOperator] == (id)2;
          v23 = [(ICOutlineParentCollectionViewCell *)self tagAnyAction];
          [v23 setState:v22];

          v24 = [(ICOutlineParentCollectionViewCell *)self tagSelection];
          BOOL v25 = [v24 tagOperator] == (id)1;
          v26 = [(ICOutlineParentCollectionViewCell *)self tagAllAction];
          [v26 setState:v25];

          v27 = [(ICOutlineParentCollectionViewCell *)self listContentView];

          if (!v27)
          {
            id v28 = objc_alloc((Class)UIListContentView);
            v29 = [(ICOutlineParentCollectionViewCell *)self defaultContentConfiguration];
            id v30 = [v28 initWithConfiguration:v29];
            [(ICOutlineParentCollectionViewCell *)self setListContentView:v30];

            v31 = [(ICOutlineParentCollectionViewCell *)self listContentView];
            [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

            v32 = [(ICOutlineParentCollectionViewCell *)self listContentView];
            LODWORD(v33) = 1148846080;
            [v32 setContentHuggingPriority:0 forAxis:v33];

            v34 = [(ICOutlineParentCollectionViewCell *)self listContentView];
            LODWORD(v35) = 1148846080;
            [v34 setContentCompressionResistancePriority:0 forAxis:v35];
          }
          v36 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];

          if (!v36)
          {
            v37 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
            v38 = +[UIButtonConfiguration plainButtonConfiguration];
            v39 = +[UIColor ICTintColor];
            [v38 setBaseForegroundColor:v39];

            [v38 contentInsets];
            [v38 setContentInsets:];
            v102[0] = _NSConcreteStackBlock;
            v102[1] = 3221225472;
            v102[2] = sub_10007EE28;
            v102[3] = &unk_100627290;
            id v103 = v37;
            id v40 = v37;
            [v38 setTitleTextAttributesTransformer:v102];
            v41 = +[UIButton buttonWithConfiguration:v38 primaryAction:0];
            [(ICOutlineParentCollectionViewCell *)self setTagOperatorButton:v41];

            v42 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

            v43 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            [v43 setShowsMenuAsPrimaryAction:1];

            v44 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            [v44 setChangesSelectionAsPrimaryAction:1];

            v45 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            [v45 setContentHorizontalAlignment:5];

            v46 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            LODWORD(v47) = 1148846080;
            [v46 setContentHuggingPriority:0 forAxis:v47];

            v48 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            LODWORD(v49) = 1148846080;
            [v48 setContentCompressionResistancePriority:0 forAxis:v49];
          }
          v50 = [(ICOutlineParentCollectionViewCell *)self horizontalStackView];

          if (!v50)
          {
            id v51 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
            LODWORD(v52) = 1132068864;
            [v51 setContentHuggingPriority:0 forAxis:v52];
            LODWORD(v53) = 1132068864;
            [v51 setContentCompressionResistancePriority:0 forAxis:v53];
            id v54 = objc_alloc((Class)UIStackView);
            v55 = [(ICOutlineParentCollectionViewCell *)self listContentView];
            v105[0] = v55;
            v56 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            v105[1] = v56;
            v105[2] = v51;
            v57 = +[NSArray arrayWithObjects:v105 count:3];
            id v58 = [v54 initWithArrangedSubviews:v57];
            [(ICOutlineParentCollectionViewCell *)self setHorizontalStackView:v58];

            v59 = [(ICOutlineParentCollectionViewCell *)self horizontalStackView];
            [v59 setAxis:0];

            v60 = [(ICOutlineParentCollectionViewCell *)self horizontalStackView];
            [v60 setSpacing:0.0];

            v61 = [(ICOutlineParentCollectionViewCell *)self horizontalStackView];
            [v61 setAlignment:3];

            v62 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
            v63 = [v62 heightAnchor];
            v64 = [v63 constraintEqualToConstant:26.0];
            [v64 setActive:1];

            v65 = [(ICOutlineParentCollectionViewCell *)self contentView];
            v66 = [(ICOutlineParentCollectionViewCell *)self horizontalStackView];
            [v65 addSubview:v66];

            v67 = [(ICOutlineParentCollectionViewCell *)self horizontalStackView];
            [v67 ic_addAnchorsToFillSuperview];
          }
          [v7 directionalLayoutMargins];
          double v69 = v68;
          double v71 = v70;
          double v73 = v72;
          [(ICOutlineParentCollectionViewCell *)self horizontalInsetsOverride];
          if (v74 != 2.22507386e-308)
          {
            [(ICOutlineParentCollectionViewCell *)self horizontalInsetsOverride];
            double v71 = v75;
          }
          [(ICOutlineParentCollectionViewCell *)self directionalLayoutMargins];
          double v77 = v76 + -8.0;
          v78 = +[UIColor clearColor];
          v79 = [v7 textProperties];
          [v79 setColor:v78];

          [v7 setDirectionalLayoutMargins:v69, v71, v73, v77];
          v80 = [(ICOutlineParentCollectionViewCell *)self listContentView];
          [v80 setConfiguration:v7];

          v81 = [(ICOutlineParentCollectionViewCell *)self tagAllAction];
          v104[0] = v81;
          v82 = [(ICOutlineParentCollectionViewCell *)self tagAnyAction];
          v104[1] = v82;
          v83 = +[NSArray arrayWithObjects:v104 count:2];
          v84 = +[UIMenu menuWithChildren:v83];
          v85 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
          [v85 setMenu:v84];

          goto LABEL_28;
        }
      }
    }
  }
  v86 = [(ICOutlineParentCollectionViewCell *)self horizontalStackView];
  [v86 removeFromSuperview];

  [(ICOutlineParentCollectionViewCell *)self setHorizontalStackView:0];
  v87 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
  [v87 removeFromSuperview];

  [(ICOutlineParentCollectionViewCell *)self setTagOperatorButton:0];
  v88 = [(ICOutlineParentCollectionViewCell *)self listContentView];
  [v88 removeFromSuperview];

  [(ICOutlineParentCollectionViewCell *)self setListContentView:0];
  if ([(ICOutlineParentCollectionViewCell *)self styleForCalculator])
  {
    v89 = +[UIColor secondaryLabelColor];
    v90 = [v7 textProperties];
    [v90 setColor:v89];

    v91 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    v92 = [v7 textProperties];
    [v92 setFont:v91];

    [(ICOutlineParentCollectionViewCell *)self setHorizontalInsetsOverride:28.0];
  }
  [(ICOutlineParentCollectionViewCell *)self horizontalInsetsOverride];
  if (v93 != 2.22507386e-308)
  {
    [v7 directionalLayoutMargins];
    double v95 = v94;
    double v97 = v96;
    [(ICOutlineParentCollectionViewCell *)self horizontalInsetsOverride];
    double v99 = v98;
    [(ICOutlineParentCollectionViewCell *)self horizontalInsetsOverride];
    double v101 = v100;
    [v7 setAxesPreservingSuperviewLayoutMargins:2];
    [v7 setDirectionalLayoutMargins:v95, v99, v97, v101];
  }
  [(ICOutlineParentCollectionViewCell *)self setContentConfiguration:v7];
LABEL_28:
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ICOutlineParentCollectionViewCell;
  return UIAccessibilityTraitHeader | [(ICOutlineParentCollectionViewCell *)&v3 accessibilityTraits];
}

- (id)accessibilityDragSourceDescriptors
{
  return 0;
}

- (id)accessibilityDropPointDescriptors
{
  return 0;
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  v2 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityHint
{
  BOOL v3 = [(ICOutlineParentCollectionViewCell *)self tagOperatorButton];

  if (v3)
  {
    id v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"Double tap to modify selection" value:&stru_10063F3D8 table:0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICOutlineParentCollectionViewCell;
    v5 = [(ICOutlineParentCollectionViewCell *)&v7 accessibilityHint];
  }

  return v5;
}

- (void)updateSyncActivityIndicator
{
  if ([(ICOutlineParentCollectionViewCell *)self isSyncActivityVisible]
    && ([(ICOutlineParentCollectionViewCell *)self progressIndicatorTracker],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 progressIndicatorShouldAnimate],
        v3,
        v4))
  {
    v5 = [(ICOutlineParentCollectionViewCell *)self activityIndicatorView];
    [v5 startAnimating];
  }
  else
  {
    v5 = [(ICOutlineParentCollectionViewCell *)self activityIndicatorView];
    [v5 stopAnimating];
  }

  [(ICOutlineParentCollectionViewCell *)self updateAccessories];
}

- (ICFolderListSectionIdentifier)folderListSectionIdentifier
{
  return self->_folderListSectionIdentifier;
}

- (ICNoteSectionIdentifier)noteSectionIdentifier
{
  return self->_noteSectionIdentifier;
}

- (BOOL)displayGenericTitle
{
  return self->_displayGenericTitle;
}

- (void)setDisplayGenericTitle:(BOOL)a3
{
  self->_displayGenericTitle = a3;
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (BOOL)shouldDisplayTagSelectionOperator
{
  return self->_shouldDisplayTagSelectionOperator;
}

- (void)setShouldDisplayTagSelectionOperator:(BOOL)a3
{
  self->_shouldDisplayTagSelectionOperator = a3;
}

- (id)tagSelectionDidChange
{
  return self->_tagSelectionDidChange;
}

- (void)setTagSelectionDidChange:(id)a3
{
}

- (BOOL)displayDisclosure
{
  return self->_displayDisclosure;
}

- (void)setDisplayDisclosure:(BOOL)a3
{
  self->_displayDisclosure = a3;
}

- (BOOL)usesSidebarHeaderConfiguration
{
  return self->_usesSidebarHeaderConfiguration;
}

- (void)setUsesSidebarHeaderConfiguration:(BOOL)a3
{
  self->_usesSidebarHeaderConfiguration = a3;
}

- (BOOL)styleForCalculator
{
  return self->_styleForCalculator;
}

- (void)setStyleForCalculator:(BOOL)a3
{
  self->_styleForCalculator = a3;
}

- (double)horizontalInsetsOverride
{
  return self->_horizontalInsetsOverride;
}

- (void)setHorizontalInsetsOverride:(double)a3
{
  self->_horizontalInsetsOverride = a3;
}

- (id)upgradeButtonTapHandler
{
  return self->_upgradeButtonTapHandler;
}

- (void)setUpgradeButtonTapHandler:(id)a3
{
}

- (ICProgressIndicatorTracker)progressIndicatorTracker
{
  return self->_progressIndicatorTracker;
}

- (void)setProgressIndicatorTracker:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (BOOL)isSyncActivityVisible
{
  return self->_isSyncActivityVisible;
}

- (void)setIsSyncActivityVisible:(BOOL)a3
{
  self->_isSyncActivityVisible = a3;
}

- (UIStackView)horizontalStackView
{
  return self->_horizontalStackView;
}

- (void)setHorizontalStackView:(id)a3
{
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
}

- (UIButton)tagOperatorButton
{
  return self->_tagOperatorButton;
}

- (void)setTagOperatorButton:(id)a3
{
}

- (UIAction)tagAnyAction
{
  return self->_tagAnyAction;
}

- (void)setTagAnyAction:(id)a3
{
}

- (UIAction)tagAllAction
{
  return self->_tagAllAction;
}

- (void)setTagAllAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagAllAction, 0);
  objc_storeStrong((id *)&self->_tagAnyAction, 0);
  objc_storeStrong((id *)&self->_tagOperatorButton, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_horizontalStackView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorTracker, 0);
  objc_storeStrong(&self->_upgradeButtonTapHandler, 0);
  objc_storeStrong(&self->_tagSelectionDidChange, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
  objc_storeStrong((id *)&self->_noteSectionIdentifier, 0);

  objc_storeStrong((id *)&self->_folderListSectionIdentifier, 0);
}

@end