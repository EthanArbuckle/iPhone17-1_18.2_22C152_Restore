@interface TUIEmojiSearchView
+ (BOOL)gmsAvailability;
+ (BOOL)isNotificationExtension;
+ (BOOL)shouldShowButtons;
+ (BOOL)shouldShowGenmoji;
+ (BOOL)shouldShowImages;
- (BOOL)isCollapsed;
- (BOOL)predictionViewVisible;
- (BOOL)resultsViewVisible;
- (TUIEmojiSearchTextField)searchTextField;
- (TUIEmojiSearchView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_handBiasedEdgeInsets;
- (UIView)predictionView;
- (UIView)resultsCollectionView;
- (id)_constraintsFromView:(id)a3 toContainerView:(id)a4 insets:(UIEdgeInsets)a5 identifier:(id)a6;
- (id)addButtonForAction:(id)a3 image:(id)a4 accessibilityLabel:(id)a5 addLightEffect:(BOOL)a6;
- (id)createButtonCallback;
- (id)createStickerFromPhotosButtonCallback;
- (id)layoutInvalidationCallback;
- (id)presentAvatarEditorButtonCallback;
- (void)_buttonConfigurationWillChange:(id)a3;
- (void)_createPredictionViewConstraints;
- (void)_createResultsViewConstraints;
- (void)_createSearchTextFieldAndButtonConstraints;
- (void)_placeholderWillChange:(id)a3;
- (void)_updatePlaceholder;
- (void)addButtons;
- (void)createConstraintsIfNeeded;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidateCollectionViewLayoutIfNeeded;
- (void)layoutSubviews;
- (void)setCollapsed:(BOOL)a3;
- (void)setCreateButtonCallback:(id)a3;
- (void)setCreateStickerFromPhotosButtonCallback:(id)a3;
- (void)setLayoutInvalidationCallback:(id)a3;
- (void)setPredictionView:(id)a3;
- (void)setPredictionViewVisible:(BOOL)a3;
- (void)setPredictionViewVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setPresentAvatarEditorButtonCallback:(id)a3;
- (void)setResultsCollectionView:(id)a3;
- (void)setResultsViewVisible:(BOOL)a3;
- (void)setShouldCreateButtonGlow:(BOOL)a3 animated:(BOOL)a4;
- (void)transitionToCompactLayout:(BOOL)a3;
- (void)updateButtons;
- (void)updateGlowEffects;
- (void)updateInsetsIfNeeded:(UIEdgeInsets)a3;
- (void)updatePlaceholder;
@end

@implementation TUIEmojiSearchView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionView, 0);
  objc_storeStrong(&self->_presentAvatarEditorButtonCallback, 0);
  objc_storeStrong(&self->_createStickerFromPhotosButtonCallback, 0);
  objc_storeStrong(&self->_createButtonCallback, 0);
  objc_storeStrong(&self->_layoutInvalidationCallback, 0);
  objc_storeStrong((id *)&self->_resultsCollectionView, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_storeStrong((id *)&self->_overridingPlaceholder, 0);
  objc_storeStrong((id *)&self->_predictionWrapperBottom, 0);
  objc_storeStrong((id *)&self->_predictionWrapperTop, 0);
  objc_storeStrong((id *)&self->_predictionWrapperLeading, 0);
  objc_storeStrong((id *)&self->_predictionViewGuide, 0);
  objc_storeStrong((id *)&self->_topToBottomPadding, 0);
  objc_storeStrong((id *)&self->_searchFieldLeading, 0);
  objc_storeStrong((id *)&self->_searchFieldToTop, 0);
  objc_storeStrong((id *)&self->_predictionWrapperConstraints, 0);
  objc_storeStrong((id *)&self->_resultsCollectionWrapperConstraints, 0);
  objc_storeStrong((id *)&self->_textFieldOnTopConstraints, 0);
  objc_storeStrong((id *)&self->_sideBySideViewConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraintTwoButtons, 0);
  objc_storeStrong((id *)&self->_buttonConstraintOneButton, 0);
  objc_storeStrong((id *)&self->_buttonConstaintNoButton, 0);
  objc_storeStrong((id *)&self->_buttonConstraintFirstButtonEnabled, 0);
  objc_storeStrong((id *)&self->_buttonConstraintFirstButtonDisabled, 0);
  objc_storeStrong((id *)&self->_animojiButton, 0);
  objc_storeStrong((id *)&self->_memojiButton, 0);
  objc_storeStrong((id *)&self->_stickerButton, 0);
  objc_storeStrong((id *)&self->_createButton, 0);
  objc_storeStrong((id *)&self->_createButtonVisualEffectView, 0);
  objc_storeStrong((id *)&self->_resultsCollectionContainerView, 0);
  objc_storeStrong((id *)&self->_predictionViewWrapperView, 0);
  objc_storeStrong((id *)&self->_bottomHalfContainerView, 0);
  objc_storeStrong((id *)&self->_searchTextFieldContainerView, 0);
  objc_storeStrong((id *)&self->_searchTextFieldPortal, 0);
}

- (BOOL)resultsViewVisible
{
  return self->_resultsViewVisible;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)predictionViewVisible
{
  return self->_predictionViewVisible;
}

- (UIView)predictionView
{
  return self->_predictionView;
}

- (void)setPresentAvatarEditorButtonCallback:(id)a3
{
}

- (id)presentAvatarEditorButtonCallback
{
  return self->_presentAvatarEditorButtonCallback;
}

- (void)setCreateStickerFromPhotosButtonCallback:(id)a3
{
}

- (id)createStickerFromPhotosButtonCallback
{
  return self->_createStickerFromPhotosButtonCallback;
}

- (void)setCreateButtonCallback:(id)a3
{
}

- (id)createButtonCallback
{
  return self->_createButtonCallback;
}

- (void)setLayoutInvalidationCallback:(id)a3
{
}

- (id)layoutInvalidationCallback
{
  return self->_layoutInvalidationCallback;
}

- (UIView)resultsCollectionView
{
  return self->_resultsCollectionView;
}

- (TUIEmojiSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (void)_placeholderWillChange:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"Placeholder"];
  v6 = [v5 stringValue];
  overridingPlaceholder = self->_overridingPlaceholder;
  self->_overridingPlaceholder = v6;

  [(TUIEmojiSearchView *)self updatePlaceholder];
}

- (void)_buttonConfigurationWillChange:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"ButtonConfiguration"];
  self->_buttonConfiguration = [v5 integerValue];

  overridingPlaceholder = self->_overridingPlaceholder;
  self->_overridingPlaceholder = 0;

  [(TUIEmojiSearchView *)self updateButtons];
  [(TUIEmojiSearchView *)self updatePlaceholder];
  searchTextFieldContainerView = self->_searchTextFieldContainerView;
  [(UIView *)searchTextFieldContainerView layoutIfNeeded];
}

- (UIEdgeInsets)_handBiasedEdgeInsets
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v7 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  unint64_t v8 = [v7 interfaceOrientation] - 1;

  if (v8 <= 1)
  {
    v9 = [MEMORY[0x1E4FB1920] sharedPreferencesController];
    v10 = [v9 preferencesActions];
    uint64_t v11 = [v10 handBias];

    if (v11)
    {
      [(TUIEmojiSearchView *)self bounds];
      double v12 = *MEMORY[0x1E4FB3380];
      double v13 = CGRectGetWidth(v18) - v12;
      if (v11 == 2)
      {
        double v6 = v13;
      }
      else if (v11 == 1)
      {
        double v4 = v13;
      }
    }
  }
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (id)_constraintsFromView:(id)a3 toContainerView:(id)a4 insets:(UIEdgeInsets)a5 identifier:(id)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v35[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!v14)
  {
    double v15 = NSString;
    uint64_t v16 = objc_opt_class();
    id v14 = [v15 stringWithFormat:@"<%@:%p>-<%@:%p>", v16, v13, objc_opt_class(), v12];
  }
  double v17 = [v12 topAnchor];
  CGRect v18 = [v13 topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:top];

  v20 = [NSString stringWithFormat:@"%@.top", v14];
  [v19 setIdentifier:v20];

  v21 = [v12 leadingAnchor];
  v22 = [v13 leadingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:left];

  v24 = [NSString stringWithFormat:@"%@.leading", v14];
  [v23 setIdentifier:v24];

  v25 = [v13 bottomAnchor];
  v26 = [v12 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:bottom];

  v28 = [NSString stringWithFormat:@"%@.bottom", v14];
  [v27 setIdentifier:v28];

  v29 = [v13 trailingAnchor];
  v30 = [v12 trailingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:right];

  v32 = [NSString stringWithFormat:@"%@.trailing", v14];
  [v31 setIdentifier:v32];

  v35[0] = v19;
  v35[1] = v23;
  v35[2] = v27;
  v35[3] = v31;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];

  return v33;
}

- (void)_createSearchTextFieldAndButtonConstraints
{
  v86[3] = *MEMORY[0x1E4F143B8];
  v80 = (void *)MEMORY[0x1E4F28DC8];
  v84 = [(TUIEmojiSearchTextField *)self->_searchTextField topAnchor];
  v82 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
  double v3 = [v84 constraintEqualToAnchor:v82];
  v86[0] = v3;
  double v4 = [(TUIEmojiSearchTextField *)self->_searchTextField bottomAnchor];
  double v5 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5];
  v86[1] = v6;
  v7 = [(TUIEmojiSearchTextField *)self->_searchTextField leadingAnchor];
  unint64_t v8 = [(UIView *)self->_searchTextFieldContainerView leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v86[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
  [v80 activateConstraints:v10];

  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    uint64_t v11 = [(UIView *)self->_createButton trailingAnchor];
    id v12 = [(TUIEmojiSearchTextField *)self->_searchTextField trailingAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
    buttonConstraintFirstButtonDisabled = self->_buttonConstraintFirstButtonDisabled;
    self->_buttonConstraintFirstButtonDisabled = v13;

    double v15 = [(UIView *)self->_createButton leadingAnchor];
    uint64_t v16 = [(TUIEmojiSearchTextField *)self->_searchTextField trailingAnchor];
    double v17 = [v15 constraintEqualToAnchor:v16 constant:8.0];
    buttonConstraintFirstButtonEnabled = self->_buttonConstraintFirstButtonEnabled;
    self->_buttonConstraintFirstButtonEnabled = v17;

    v19 = [(UIView *)self->_createButton leadingAnchor];
    v20 = [(UIView *)self->_searchTextFieldContainerView trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    buttonConstaintNoButton = self->_buttonConstaintNoButton;
    self->_buttonConstaintNoButton = v21;

    v23 = [(UIView *)self->_createButton trailingAnchor];
    v24 = [(UIView *)self->_searchTextFieldContainerView trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    buttonConstraintOneButton = self->_buttonConstraintOneButton;
    self->_buttonConstraintOneButton = v25;

    v27 = [(UIView *)self->_stickerButton trailingAnchor];
    v28 = [(UIView *)self->_searchTextFieldContainerView trailingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    buttonConstraintTwoButtons = self->_buttonConstraintTwoButtons;
    self->_buttonConstraintTwoButtons = v29;

    v65 = (void *)MEMORY[0x1E4F28DC8];
    v69 = [(UIView *)self->_createButton topAnchor];
    uint64_t v63 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
    uint64_t v66 = [v69 constraintEqualToAnchor:v63];
    v85[0] = v66;
    v83 = [(UIView *)self->_createButton bottomAnchor];
    v81 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
    v79 = [v83 constraintEqualToAnchor:v81];
    v85[1] = v79;
    v78 = [(UIView *)self->_createButton widthAnchor];
    v77 = [(UIView *)self->_createButton heightAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v85[2] = v76;
    v75 = [(UIView *)self->_stickerButton topAnchor];
    v74 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v85[3] = v73;
    v72 = [(UIView *)self->_stickerButton bottomAnchor];
    v71 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v85[4] = v70;
    v68 = [(UIView *)self->_stickerButton leadingAnchor];
    v67 = [(UIView *)self->_createButton trailingAnchor];
    v64 = [v68 constraintEqualToAnchor:v67 constant:8.0];
    v85[5] = v64;
    v62 = [(UIView *)self->_stickerButton widthAnchor];
    v61 = [(UIView *)self->_stickerButton heightAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v85[6] = v60;
    v59 = [(UIView *)self->_memojiButton topAnchor];
    v58 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v85[7] = v57;
    v56 = [(UIView *)self->_memojiButton bottomAnchor];
    v55 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v85[8] = v54;
    v53 = [(UIView *)self->_memojiButton leadingAnchor];
    v52 = [(UIView *)self->_createButton trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:8.0];
    v85[9] = v51;
    v50 = [(UIView *)self->_memojiButton widthAnchor];
    v49 = [(UIView *)self->_memojiButton heightAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v85[10] = v48;
    v47 = [(UIView *)self->_animojiButton topAnchor];
    v46 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v85[11] = v45;
    v31 = [(UIView *)self->_animojiButton bottomAnchor];
    v32 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v85[12] = v33;
    v34 = [(UIView *)self->_animojiButton leadingAnchor];
    v35 = [(UIView *)self->_createButton trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:8.0];
    v85[13] = v36;
    v37 = [(UIView *)self->_animojiButton widthAnchor];
    v38 = [(UIView *)self->_animojiButton heightAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v40 = self->_buttonConstaintNoButton;
    v85[14] = v39;
    v85[15] = v40;
    v85[16] = self->_buttonConstraintFirstButtonDisabled;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:17];
    [v65 activateConstraints:v41];

    v42 = (void *)v63;
    v43 = (void *)v66;

    v44 = v69;
  }
  else
  {
    v44 = [(TUIEmojiSearchTextField *)self->_searchTextField trailingAnchor];
    v42 = [(UIView *)self->_searchTextFieldContainerView trailingAnchor];
    v43 = [v44 constraintEqualToAnchor:v42];
    [v43 setActive:1];
  }
}

- (void)_createPredictionViewConstraints
{
  v42[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIView *)self->_predictionView superview];
  predictionViewWrapperView = self->_predictionViewWrapperView;

  if (v3 == predictionViewWrapperView)
  {
    if (!self->_predictionViewGuide)
    {
      double v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
      predictionViewGuide = self->_predictionViewGuide;
      self->_predictionViewGuide = v5;

      [(UILayoutGuide *)self->_predictionViewGuide setIdentifier:@"predictionViewGuide"];
      [(UIView *)self->_predictionViewWrapperView addLayoutGuide:self->_predictionViewGuide];
    }
    v7 = [(UIView *)self->_predictionViewWrapperView trailingAnchor];
    unint64_t v8 = [(UILayoutGuide *)self->_predictionViewGuide trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:6.0];

    LODWORD(v10) = 1148829696;
    [v9 setPriority:v10];
    v38 = [(UILayoutGuide *)self->_predictionViewGuide leadingAnchor];
    uint64_t v11 = [(UIView *)self->_predictionViewWrapperView leadingAnchor];
    id v12 = [v38 constraintEqualToAnchor:v11];
    v42[0] = v12;
    id v13 = [(UILayoutGuide *)self->_predictionViewGuide topAnchor];
    id v14 = [(UIView *)self->_predictionViewWrapperView topAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    v42[1] = v15;
    v42[2] = v9;
    v40 = v9;
    uint64_t v16 = [(UIView *)self->_predictionViewWrapperView bottomAnchor];
    double v17 = [(UILayoutGuide *)self->_predictionViewGuide bottomAnchor];
    CGRect v18 = [v16 constraintEqualToAnchor:v17];
    v42[3] = v18;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];

    if (!self->_predictionWrapperTop)
    {
      v19 = [(UIView *)self->_predictionViewWrapperView topAnchor];
      v20 = [(UIView *)self->_bottomHalfContainerView topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20 constant:0.0];
      predictionWrapperTop = self->_predictionWrapperTop;
      self->_predictionWrapperTop = v21;

      [(NSLayoutConstraint *)self->_predictionWrapperTop setIdentifier:@"predictionViewWrapper.top"];
    }
    if (!self->_predictionWrapperLeading)
    {
      v23 = [(UIView *)self->_predictionViewWrapperView leadingAnchor];
      v24 = [(UIView *)self->_bottomHalfContainerView leadingAnchor];
      v25 = [v23 constraintEqualToAnchor:v24 constant:0.0];
      predictionWrapperLeading = self->_predictionWrapperLeading;
      self->_predictionWrapperLeading = v25;

      [(NSLayoutConstraint *)self->_predictionWrapperLeading setIdentifier:@"predictionViewWrapper.leading"];
    }
    if (!self->_predictionWrapperBottom)
    {
      v27 = [(UIView *)self->_bottomHalfContainerView bottomAnchor];
      v28 = [(UIView *)self->_predictionViewWrapperView bottomAnchor];
      v29 = [v27 constraintEqualToAnchor:v28 constant:0.0];
      predictionWrapperBottom = self->_predictionWrapperBottom;
      self->_predictionWrapperBottom = v29;

      [(NSLayoutConstraint *)self->_predictionWrapperBottom setIdentifier:@"predictionViewWrapper.bottom"];
    }
    v31 = [(UIView *)self->_bottomHalfContainerView trailingAnchor];
    v32 = [(UIView *)self->_predictionViewWrapperView trailingAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];

    [v33 setIdentifier:@"predictionViewWrapper.trailing"];
    v34 = self->_predictionWrapperLeading;
    v41[0] = self->_predictionWrapperTop;
    v41[1] = v34;
    v41[2] = self->_predictionWrapperBottom;
    v41[3] = v33;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
    v36 = [v39 arrayByAddingObjectsFromArray:v35];
    predictionWrapperConstraints = self->_predictionWrapperConstraints;
    self->_predictionWrapperConstraints = v36;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_predictionWrapperConstraints];
  }
}

- (void)_createResultsViewConstraints
{
  double v3 = [(UIView *)self->_resultsCollectionView superview];
  resultsCollectionContainerView = self->_resultsCollectionContainerView;

  if (v3 == resultsCollectionContainerView)
  {
    resultsCollectionWrapperConstraints = self->_resultsCollectionWrapperConstraints;
    if (resultsCollectionWrapperConstraints)
    {
      double v6 = [(NSArray *)resultsCollectionWrapperConstraints firstObject];
      int v7 = [v6 isActive];

      if (v7) {
        [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_resultsCollectionWrapperConstraints];
      }
    }
    id v11 = [(TUIEmojiSearchView *)self _constraintsFromView:self->_resultsCollectionView, self->_resultsCollectionContainerView, @"resultsCollection", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24) toContainerView insets identifier];
    unint64_t v8 = [(TUIEmojiSearchView *)self _constraintsFromView:self->_resultsCollectionContainerView, self->_bottomHalfContainerView, @"resultsContainer", -1.0, 0.0, -1.0, 0.0 toContainerView insets identifier];
    v9 = [v11 arrayByAddingObjectsFromArray:v8];
    double v10 = self->_resultsCollectionWrapperConstraints;
    self->_resultsCollectionWrapperConstraints = v9;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_resultsCollectionWrapperConstraints];
  }
}

- (void)updateInsetsIfNeeded:(UIEdgeInsets)a3
{
  if (self->_useHorizontalLayout)
  {
    double right = a3.right;
    double left = a3.left;
    if (self->_previousInsets != a3.left + a3.right)
    {
      self->_previousInsets = a3.left + a3.right;
      double v6 = [(TUIEmojiSearchView *)self traitCollection];
      if ([v6 layoutDirection] == 1) {
        double left = right;
      }

      if (left == 0.0) {
        double v7 = 4.0;
      }
      else {
        double v7 = 3.5;
      }
      if (left > 12.5) {
        double left = 12.5;
      }
      double v8 = 1.0;
      if (TUIRemoteEmojiSearchViewControllerEnabled())
      {
        v9 = [(TUIEmojiSearchView *)self traitCollection];
        uint64_t v10 = [v9 userInterfaceIdiom];

        if (v10 == 1) {
          double v8 = -1.0;
        }
        else {
          double v8 = 1.0;
        }
      }
      [(NSLayoutConstraint *)self->_searchFieldLeading setConstant:(left + v7) * v8];
      [(TUIEmojiSearchView *)self layoutIfNeeded];
    }
  }
}

- (void)createConstraintsIfNeeded
{
  v103[8] = *MEMORY[0x1E4F143B8];
  if (!self->_searchFieldToTop)
  {
    double v3 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
    double v4 = [(TUIEmojiSearchView *)self topAnchor];
    double v5 = [v3 constraintEqualToAnchor:v4 constant:0.0];
    searchFieldToTop = self->_searchFieldToTop;
    self->_searchFieldToTop = v5;

    [(NSLayoutConstraint *)self->_searchFieldToTop setIdentifier:@"searchField.top"];
    LODWORD(v7) = 1148829696;
    [(NSLayoutConstraint *)self->_searchFieldToTop setPriority:v7];
  }
  if (!self->_textFieldOnTopConstraints)
  {
    double v8 = [(UIView *)self->_searchTextFieldContainerView heightAnchor];
    +[TUIEmojiSearchTextField preferredHeight];
    v100 = [v8 constraintEqualToConstant:v9 + -12.0];

    [v100 setIdentifier:@"searchField.height"];
    uint64_t v10 = [(UIView *)self->_searchTextFieldContainerView leadingAnchor];
    id v11 = [(TUIEmojiSearchView *)self leadingAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11 constant:8.0];

    LODWORD(v13) = 1148829696;
    [v12 setPriority:v13];
    [v12 setIdentifier:@"searchField.leading"];
    id v14 = [(TUIEmojiSearchView *)self trailingAnchor];
    double v15 = [(UIView *)self->_searchTextFieldContainerView trailingAnchor];
    uint64_t v16 = [v14 constraintEqualToAnchor:v15 constant:8.0];

    LODWORD(v17) = 1148829696;
    [v16 setPriority:v17];
    [v16 setIdentifier:@"searchField.trailing"];
    CGRect v18 = [(UIView *)self->_bottomHalfContainerView topAnchor];
    v19 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
    topToBottomPadding = self->_topToBottomPadding;
    self->_topToBottomPadding = v20;

    [(NSLayoutConstraint *)self->_topToBottomPadding setIdentifier:@"verticalSearchSpacing"];
    v22 = [(UIView *)self->_bottomHalfContainerView leadingAnchor];
    v23 = [(TUIEmojiSearchView *)self leadingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:0.0];

    [v24 setIdentifier:@"bottomContainer.leading"];
    v25 = [(TUIEmojiSearchView *)self bottomAnchor];
    v26 = [(UIView *)self->_bottomHalfContainerView bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:0.0];

    [v27 setIdentifier:@"bottomContainer.bottom"];
    v28 = [(TUIEmojiSearchView *)self trailingAnchor];
    v29 = [(UIView *)self->_bottomHalfContainerView trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:0.0];

    [v30 setIdentifier:@"bottomContainer.trailing"];
    v31 = self->_topToBottomPadding;
    v103[0] = self->_searchFieldToTop;
    v103[1] = v31;
    v103[2] = v27;
    v103[3] = v100;
    v103[4] = v12;
    v103[5] = v16;
    v103[6] = v24;
    v103[7] = v30;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:8];
    textFieldOnTopConstraints = self->_textFieldOnTopConstraints;
    self->_textFieldOnTopConstraints = v32;
  }
  v34 = [(TUIEmojiSearchView *)self traitCollection];
  uint64_t v35 = [v34 userInterfaceIdiom];

  if (self->_sideBySideViewConstraints) {
    BOOL v36 = 0;
  }
  else {
    BOOL v36 = v35 == 1;
  }
  if (v36)
  {
    uint64_t v99 = v35;
    self->_previousInsets = -1.0;
    int v37 = TUIRemoteEmojiSearchViewControllerEnabled();
    searchTextFieldContainerView = self->_searchTextFieldContainerView;
    if (v37)
    {
      v39 = [(UIView *)searchTextFieldContainerView trailingAnchor];
      v40 = [(TUIEmojiSearchView *)self trailingAnchor];
      v41 = [v39 constraintEqualToAnchor:v40 constant:0.0];
      p_searchFieldLeading = &self->_searchFieldLeading;
      searchFieldLeading = self->_searchFieldLeading;
      self->_searchFieldLeading = v41;

      LODWORD(v44) = 1148829696;
      [(NSLayoutConstraint *)self->_searchFieldLeading setPriority:v44];
      [(NSLayoutConstraint *)self->_searchFieldLeading setIdentifier:@"searchField.leading"];
      v45 = [(TUIEmojiSearchView *)self bottomAnchor];
      v46 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
      v47 = [v45 constraintEqualToAnchor:v46 constant:0.0];

      v98 = v47;
      [(NSLayoutConstraint *)v47 setIdentifier:@"searchField.bottom"];
      v48 = [(UIView *)self->_bottomHalfContainerView topAnchor];
      v49 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
      v50 = [v48 constraintEqualToAnchor:v49];

      [(NSLayoutConstraint *)v50 setIdentifier:@"bottomContainer.top"];
      v51 = [(UIView *)self->_bottomHalfContainerView trailingAnchor];
      v52 = [(UIView *)self->_searchTextFieldContainerView leadingAnchor];
      v53 = [v51 constraintEqualToAnchor:v52 constant:-8.0];

      [(NSLayoutConstraint *)v53 setIdentifier:@"bottomContainer.leading"];
      v54 = [(TUIEmojiSearchView *)self bottomAnchor];
      v55 = [(UIView *)self->_bottomHalfContainerView bottomAnchor];
      v56 = [v54 constraintEqualToAnchor:v55 constant:0.0];

      [(NSLayoutConstraint *)v56 setIdentifier:@"bottomContainer.bottom"];
      v57 = [(TUIEmojiSearchView *)self leadingAnchor];
      v58 = [(UIView *)self->_bottomHalfContainerView leadingAnchor];
      v59 = [v57 constraintEqualToAnchor:v58 constant:0.0];

      [(NSLayoutConstraint *)v59 setIdentifier:@"bottomContainer.trailing"];
      v60 = [(UIView *)self->_bottomHalfContainerView widthAnchor];
      v61 = [(UIView *)self->_searchTextFieldContainerView widthAnchor];
      v62 = [v60 constraintEqualToAnchor:v61 multiplier:2.0];

      [(NSLayoutConstraint *)v62 setIdentifier:@"searchToResults.width"];
      v102 = self->_searchFieldToTop;
      uint64_t v63 = &v102;
    }
    else
    {
      v64 = [(UIView *)searchTextFieldContainerView leadingAnchor];
      v65 = [(TUIEmojiSearchView *)self leadingAnchor];
      uint64_t v66 = [v64 constraintEqualToAnchor:v65 constant:0.0];
      p_searchFieldLeading = &self->_searchFieldLeading;
      v67 = self->_searchFieldLeading;
      self->_searchFieldLeading = v66;

      LODWORD(v68) = 1148829696;
      [(NSLayoutConstraint *)self->_searchFieldLeading setPriority:v68];
      [(NSLayoutConstraint *)self->_searchFieldLeading setIdentifier:@"searchField.leading"];
      v69 = [(TUIEmojiSearchView *)self bottomAnchor];
      v70 = [(UIView *)self->_searchTextFieldContainerView bottomAnchor];
      v71 = [v69 constraintEqualToAnchor:v70 constant:0.0];

      v98 = v71;
      [(NSLayoutConstraint *)v71 setIdentifier:@"searchField.bottom"];
      v72 = [(UIView *)self->_bottomHalfContainerView topAnchor];
      v73 = [(UIView *)self->_searchTextFieldContainerView topAnchor];
      v50 = [v72 constraintEqualToAnchor:v73];

      [(NSLayoutConstraint *)v50 setIdentifier:@"bottomContainer.top"];
      v74 = [(UIView *)self->_bottomHalfContainerView leadingAnchor];
      v75 = [(UIView *)self->_searchTextFieldContainerView trailingAnchor];
      v53 = [v74 constraintEqualToAnchor:v75 constant:8.0];

      [(NSLayoutConstraint *)v53 setIdentifier:@"bottomContainer.leading"];
      v76 = [(TUIEmojiSearchView *)self bottomAnchor];
      v77 = [(UIView *)self->_bottomHalfContainerView bottomAnchor];
      v56 = [v76 constraintEqualToAnchor:v77 constant:0.0];

      [(NSLayoutConstraint *)v56 setIdentifier:@"bottomContainer.bottom"];
      v78 = [(TUIEmojiSearchView *)self trailingAnchor];
      v79 = [(UIView *)self->_bottomHalfContainerView trailingAnchor];
      v59 = [v78 constraintEqualToAnchor:v79 constant:0.0];

      [(NSLayoutConstraint *)v59 setIdentifier:@"bottomContainer.trailing"];
      v80 = [(UIView *)self->_bottomHalfContainerView widthAnchor];
      v81 = [(UIView *)self->_searchTextFieldContainerView widthAnchor];
      v62 = [v80 constraintEqualToAnchor:v81 multiplier:2.0];

      [(NSLayoutConstraint *)v62 setIdentifier:@"searchToResults.width"];
      v101 = self->_searchFieldToTop;
      uint64_t v63 = &v101;
    }
    v82 = *p_searchFieldLeading;
    v63[1] = v98;
    v63[2] = v82;
    v63[3] = v50;
    v63[4] = v56;
    v63[5] = v53;
    v63[6] = v59;
    v63[7] = v62;
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
    v83 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sideBySideViewConstraints = self->_sideBySideViewConstraints;
    self->_sideBySideViewConstraints = v83;

    uint64_t v35 = v99;
  }
  if (!self->_resultsCollectionWrapperConstraints) {
    [(TUIEmojiSearchView *)self _createResultsViewConstraints];
  }
  if (!self->_predictionWrapperConstraints) {
    [(TUIEmojiSearchView *)self _createPredictionViewConstraints];
  }
  if (!self->_buttonConstaintNoButton) {
    [(TUIEmojiSearchView *)self _createSearchTextFieldAndButtonConstraints];
  }
  if (self->_useHorizontalLayout)
  {
    v85 = [(NSArray *)self->_sideBySideViewConstraints firstObject];
    char v86 = [v85 isActive];

    if ((v86 & 1) == 0) {
      [MEMORY[0x1E4F28DC8] activateConstraints:self->_sideBySideViewConstraints];
    }
    [(NSLayoutConstraint *)self->_searchFieldToTop setConstant:12.0];
    [MEMORY[0x1E4FB18E0] keyplanePadding];
    -[TUIEmojiSearchView updateInsetsIfNeeded:](self, "updateInsetsIfNeeded:");
  }
  else
  {
    v87 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    v88 = [v87 currentInputMode];

    v89 = [v88 softwareLayout];
    if ([v89 containsString:@"HWR"])
    {
      v90 = [(TUIEmojiSearchView *)self traitCollection];
      uint64_t v91 = [v90 horizontalSizeClass];

      if (v91 == 1) {
        double v92 = 0.0;
      }
      else {
        double v92 = 4.0;
      }
    }
    else
    {

      double v92 = 4.0;
    }
    v93 = [(NSArray *)self->_textFieldOnTopConstraints firstObject];
    char v94 = [v93 isActive];

    if ((v94 & 1) == 0) {
      [MEMORY[0x1E4F28DC8] activateConstraints:self->_textFieldOnTopConstraints];
    }
    double v95 = 2.0;
    if (v35 != 1) {
      double v95 = 10.0;
    }
    [(NSLayoutConstraint *)self->_searchFieldToTop setConstant:v95];
    BOOL v96 = [(TUIEmojiSearchView *)self isCollapsed];
    double v97 = 0.0;
    if (!v96) {
      double v97 = v92;
    }
    [(NSLayoutConstraint *)self->_topToBottomPadding setConstant:v97];
  }
  [(TUIEmojiSearchView *)self layoutIfNeeded];
}

- (void)didMoveToWindow
{
  double v3 = [(TUIEmojiSearchView *)self window];

  if (v3)
  {
    [(TUIEmojiSearchView *)self updateButtons];
  }
  else
  {
    overridingPlaceholder = self->_overridingPlaceholder;
    self->_overridingPlaceholder = 0;
  }
}

- (void)setResultsViewVisible:(BOOL)a3
{
  if (self->_resultsViewVisible != a3)
  {
    self->_resultsViewVisible = a3;
    [(UIView *)self->_bottomHalfContainerView setHidden:!a3];
    if (!a3) {
      [(TUIEmojiSearchView *)self transitionToCompactLayout:1];
    }
    [(TUIEmojiSearchView *)self setNeedsLayout];
    double v5 = [(TUIEmojiSearchView *)self layoutInvalidationCallback];

    if (v5)
    {
      double v6 = [(TUIEmojiSearchView *)self layoutInvalidationCallback];
      v6[2]();
    }
  }
}

- (void)setPredictionViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (self->_predictionViewVisible != a3
    || (BOOL v7 = [(UIView *)self->_predictionViewWrapperView isHidden],
        v7 == [(UIView *)self->_resultsCollectionContainerView isHidden]))
  {
    self->_predictionViewVisible = v5;
    double v8 = &OBJC_IVAR___TUIEmojiSearchView__resultsCollectionContainerView;
    if (v5) {
      double v8 = &OBJC_IVAR___TUIEmojiSearchView__predictionViewWrapperView;
    }
    id v9 = *(id *)((char *)&self->super.super.super.isa + *v8);
    if (v5)
    {
      uint64_t v10 = self->_resultsCollectionContainerView;
    }
    else
    {
      uint64_t v10 = [(UIView *)self->_predictionViewWrapperView snapshotViewAfterScreenUpdates:0];
    }
    id v11 = v10;
    [v9 setHidden:0];
    [(UIView *)self->_bottomHalfContainerView bringSubviewToFront:v9];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke;
    aBlock[3] = &unk_1E5593610;
    BOOL v29 = v5;
    id v12 = v11;
    v27 = v12;
    id v13 = v9;
    id v28 = v13;
    id v14 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_4;
    v22 = &unk_1E5593638;
    double v15 = v12;
    BOOL v25 = v5;
    v23 = v15;
    v24 = self;
    uint64_t v16 = (void (**)(void *, uint64_t))_Block_copy(&v19);
    if (v4)
    {
      if (!v5)
      {
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v19, v20, v21, v22);
        [(UIView *)self->_bottomHalfContainerView addSubview:v15];
        double v17 = (void *)MEMORY[0x1E4F28DC8];
        CGRect v18 = [(TUIEmojiSearchView *)self _constraintsFromView:v15, self->_predictionViewWrapperView, @"snapshot", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24) toContainerView insets identifier];
        [v17 activateConstraints:v18];

        [(UIView *)self->_predictionViewWrapperView setHidden:1];
      }
      objc_msgSend(MEMORY[0x1E4FB1EB0], "animateKeyframesWithDuration:delay:options:animations:completion:", 1, v14, v16, 0.2, 0.0, v19, v20, v21, v22);
    }
    else
    {
      v14[2](v14);
      v16[2](v16, 1);
    }
  }
}

void __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 0.0;
  }
  else {
    double v2 = 0.5;
  }
  double v3 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_2;
  v7[3] = &unk_1E55941A8;
  id v8 = *(id *)(a1 + 32);
  [v3 addKeyframeWithRelativeStartTime:v7 relativeDuration:0.0 animations:1.0];
  BOOL v4 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_3;
  v5[3] = &unk_1E55941A8;
  id v6 = *(id *)(a1 + 40);
  [v4 addKeyframeWithRelativeStartTime:v5 relativeDuration:v2 animations:1.0 - v2];
}

void __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setHidden:1];
    if (!*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) removeFromSuperview];
    }
    double v3 = [*(id *)(a1 + 40) layoutInvalidationCallback];

    if (v3)
    {
      BOOL v4 = [*(id *)(a1 + 40) layoutInvalidationCallback];
      v4[2]();
    }
  }
}

uint64_t __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __56__TUIEmojiSearchView_setPredictionViewVisible_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setPredictionViewVisible:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchView;
  [(TUIEmojiSearchView *)&v3 layoutSubviews];
  [(TUIEmojiSearchView *)self updateGlowEffects];
  if (![(TUIEmojiSearchView *)self isCollapsed])
  {
    [(UILayoutGuide *)self->_predictionViewGuide layoutFrame];
    -[UIView setFrame:](self->_predictionView, "setFrame:");
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_collapsed = a3;
  [(TUIEmojiSearchView *)self createConstraintsIfNeeded];
  [(UIView *)self->_bottomHalfContainerView setHidden:v3];
  [(TUIEmojiSearchView *)self invalidateCollectionViewLayoutIfNeeded];
  if (v3) {
    [(TUIEmojiSearchView *)self setShouldCreateButtonGlow:0 animated:0];
  }
  if (self->_useHorizontalLayout)
  {
    if (TUIRemoteEmojiSearchViewControllerEnabled()) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  [(TUIEmojiSearchView *)self setHidden:v3];
LABEL_9:
  [(TUIEmojiSearchView *)self layoutIfNeeded];
}

- (void)setPredictionView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_predictionView = &self->_predictionView;
  predictionView = self->_predictionView;
  id v8 = v5;
  id v12 = v5;
  if (predictionView != v5)
  {
    [(UIView *)predictionView removeFromSuperview];
    if (self->_predictionWrapperConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      predictionWrapperConstraints = self->_predictionWrapperConstraints;
      self->_predictionWrapperConstraints = 0;
    }
    objc_storeStrong((id *)&self->_predictionView, a3);
    [(UIView *)*p_predictionView setHidden:0];
    [(TUIEmojiSearchView *)self setPredictionViewVisible:0 animated:0];
    id v8 = *p_predictionView;
  }
  uint64_t v10 = [(UIView *)v8 superview];
  predictionViewWrapperView = self->_predictionViewWrapperView;

  if (v10 != predictionViewWrapperView)
  {
    [(UIView *)self->_predictionViewWrapperView addSubview:*p_predictionView];
    [(TUIEmojiSearchView *)self setNeedsLayout];
  }
  if (!self->_predictionWrapperConstraints) {
    [(TUIEmojiSearchView *)self _createPredictionViewConstraints];
  }
}

- (void)setResultsCollectionView:(id)a3
{
  id v9 = a3;
  p_resultsCollectionView = &self->_resultsCollectionView;
  objc_storeStrong((id *)&self->_resultsCollectionView, a3);
  id v6 = [(UIView *)self->_resultsCollectionView superview];
  resultsCollectionContainerView = self->_resultsCollectionContainerView;

  if (v6 != resultsCollectionContainerView)
  {
    [(UIView *)*p_resultsCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_resultsCollectionContainerView addSubview:*p_resultsCollectionView];
    if (!self->_resultsCollectionWrapperConstraints) {
      [(TUIEmojiSearchView *)self _createResultsViewConstraints];
    }
  }
  [(TUIEmojiSearchView *)self setNeedsLayout];
  BOOL v8 = self->_predictionViewVisible && !self->_resultsViewVisible;
  [(UIView *)*p_resultsCollectionView setHidden:v8];
  [(TUIEmojiSearchView *)self invalidateCollectionViewLayoutIfNeeded];
}

- (void)transitionToCompactLayout:(BOOL)a3
{
  BOOL v3 = a3;
  [(TUIEmojiSearchView *)self createConstraintsIfNeeded];
  BOOL v5 = [(TUIEmojiSearchView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 1) {
    goto LABEL_16;
  }
  self->_useHorizontalLayout = !v3;
  if (!v3)
  {
    if ((TUIRemoteEmojiSearchViewControllerEnabled() & 1) == 0) {
      [(TUIEmojiSearchView *)self setHidden:[(TUIEmojiSearchView *)self isCollapsed]];
    }
    p_textFieldOnTopConstraints = &self->_textFieldOnTopConstraints;
    id v11 = [(NSArray *)self->_textFieldOnTopConstraints firstObject];
    int v12 = [v11 isActive];

    if (!v12) {
      goto LABEL_10;
    }
    uint64_t v10 = &OBJC_IVAR___TUIEmojiSearchView__sideBySideViewConstraints;
    goto LABEL_9;
  }
  [(TUIEmojiSearchView *)self setHidden:0];
  p_textFieldOnTopConstraints = &self->_sideBySideViewConstraints;
  BOOL v8 = [(NSArray *)self->_sideBySideViewConstraints firstObject];
  char v9 = [v8 isActive];

  if (v9)
  {
    uint64_t v10 = &OBJC_IVAR___TUIEmojiSearchView__textFieldOnTopConstraints;
LABEL_9:
    [MEMORY[0x1E4F28DC8] deactivateConstraints:*p_textFieldOnTopConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:*(Class *)((char *)&self->super.super.super.isa + *v10)];
  }
LABEL_10:
  id v13 = [MEMORY[0x1E4FB1900] activeInstance];
  int v14 = [v13 showsCandidateBar];

  double v15 = 0.0;
  double v16 = 0.0;
  if (v14)
  {
    if (self->_useHorizontalLayout) {
      double v15 = -9.0;
    }
    else {
      double v15 = 0.0;
    }
    double v16 = 6.0;
  }
  [(NSLayoutConstraint *)self->_predictionWrapperTop setConstant:v15];
  [(NSLayoutConstraint *)self->_predictionWrapperBottom setConstant:v15];
  [(NSLayoutConstraint *)self->_predictionWrapperLeading setConstant:v16];
LABEL_16:
  [(TUIEmojiSearchView *)self invalidateCollectionViewLayoutIfNeeded];
}

- (void)invalidateCollectionViewLayoutIfNeeded
{
  if ((TUIRemoteEmojiSearchViewControllerEnabled() & 1) == 0)
  {
    BOOL v3 = [(TUIEmojiSearchView *)self resultsCollectionView];
    BOOL v4 = [v3 collectionViewLayout];
    [v4 invalidateLayout];
  }
  BOOL v5 = [(TUIEmojiSearchView *)self layoutInvalidationCallback];

  if (v5)
  {
    uint64_t v6 = [(TUIEmojiSearchView *)self layoutInvalidationCallback];
    v6[2]();
  }
}

- (id)addButtonForAction:(id)a3 image:(id)a4 accessibilityLabel:(id)a5 addLightEffect:(BOOL)a6
{
  BOOL v6 = a6;
  v54[4] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  +[TUIEmojiSearchTextField preferredHeight];
  int v12 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v12 setImage:v10];

  v51 = v12;
  if (v6) {
    [MEMORY[0x1E4FB14D0] intelligenceButtonWithConfiguration:v12 primaryAction:v11];
  }
  else {
  id v13 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v12 primaryAction:v11];
  }

  [v13 setAccessibilityLabel:v9];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  int v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v13 setTintColor:v14];

  double v15 = [TUIEmojiSearchTextFieldBackgroundView alloc];
  [v13 bounds];
  double v16 = -[TUIEmojiSearchTextFieldBackgroundView initWithFrame:](v15, "initWithFrame:");
  [(TUIEmojiSearchTextFieldBackgroundView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  CGRect v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v18 setAlpha:0.0];
  uint64_t v19 = [v18 layer];
  [v19 setAllowsGroupBlending:0];

  uint64_t v20 = [v18 layer];
  [v20 setAllowsGroupOpacity:0];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 addSubview:v16];
  v38 = (void *)MEMORY[0x1E4F28DC8];
  v48 = [(TUIEmojiSearchTextFieldBackgroundView *)v16 topAnchor];
  v46 = [v18 topAnchor];
  double v44 = [v48 constraintEqualToAnchor:v46];
  v54[0] = v44;
  v42 = [(TUIEmojiSearchTextFieldBackgroundView *)v16 bottomAnchor];
  v40 = [v18 bottomAnchor];
  v21 = [v42 constraintEqualToAnchor:v40];
  v54[1] = v21;
  v50 = v16;
  v22 = [(TUIEmojiSearchTextFieldBackgroundView *)v16 leadingAnchor];
  v23 = [v18 leadingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v54[2] = v24;
  BOOL v25 = [(TUIEmojiSearchTextFieldBackgroundView *)v16 trailingAnchor];
  v26 = [v18 trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v54[3] = v27;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
  [v38 activateConstraints:v28];

  [v18 addSubview:v13];
  v39 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [v13 topAnchor];
  v47 = [v18 topAnchor];
  v45 = [v49 constraintEqualToAnchor:v47];
  v53[0] = v45;
  v43 = [v13 bottomAnchor];
  v41 = [v18 bottomAnchor];
  BOOL v29 = [v43 constraintEqualToAnchor:v41];
  v53[1] = v29;
  v30 = [v13 leadingAnchor];
  v31 = [v18 leadingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v53[2] = v32;
  v33 = [v13 trailingAnchor];
  v34 = [v18 trailingAnchor];
  uint64_t v35 = [v33 constraintEqualToAnchor:v34];
  v53[3] = v35;
  BOOL v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
  [v39 activateConstraints:v36];

  [(UIView *)self->_searchTextFieldContainerView addSubview:v18];
  return v18;
}

- (void)updateButtons
{
  p_buttonConstraintFirstButtonEnabled = &self->_buttonConstraintFirstButtonEnabled;
  [(NSLayoutConstraint *)self->_buttonConstraintFirstButtonEnabled setActive:0];
  [(NSLayoutConstraint *)self->_buttonConstraintFirstButtonDisabled setActive:0];
  p_buttonConstaintNoButton = &self->_buttonConstaintNoButton;
  [(NSLayoutConstraint *)self->_buttonConstaintNoButton setActive:0];
  [(NSLayoutConstraint *)self->_buttonConstraintOneButton setActive:0];
  [(NSLayoutConstraint *)self->_buttonConstraintTwoButtons setActive:0];
  BOOL v5 = 0;
  if (+[TUIEmojiSearchView shouldShowImages]) {
    BOOL v5 = +[TUIEmojiSearchView shouldShowButtons];
  }
  BOOL v6 = +[TUIEmojiSearchView shouldShowGenmoji];
  int v7 = !v5;
  if (v6 | v7) {
    p_buttonConstraintFirstButtonDisabled = p_buttonConstraintFirstButtonEnabled;
  }
  else {
    p_buttonConstraintFirstButtonDisabled = &self->_buttonConstraintFirstButtonDisabled;
  }
  double v9 = 0.0;
  if (v6 | v7) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  [(NSLayoutConstraint *)*p_buttonConstraintFirstButtonDisabled setActive:1];
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  if ((v7 & 1) == 0)
  {
    int64_t buttonConfiguration = self->_buttonConfiguration;
    if (buttonConfiguration == 2) {
      p_buttonConstraintTwoButtons = &self->_buttonConstraintTwoButtons;
    }
    else {
      p_buttonConstraintTwoButtons = &self->_buttonConstraintOneButton;
    }
    if (buttonConfiguration == 2) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.0;
    }
    if (buttonConfiguration == 3)
    {
      p_buttonConstraintTwoButtons = &self->_buttonConstraintTwoButtons;
      double v16 = 0.0;
      double v17 = 1.0;
    }
    else
    {
      double v17 = 0.0;
    }
    if (buttonConfiguration == 1) {
      p_buttonConstaintNoButton = &self->_buttonConstraintTwoButtons;
    }
    else {
      p_buttonConstaintNoButton = p_buttonConstraintTwoButtons;
    }
    if (buttonConfiguration == 1) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    if (buttonConfiguration == 1) {
      double v12 = 0.0;
    }
    else {
      double v12 = v16;
    }
    if (buttonConfiguration == 1) {
      double v13 = 0.0;
    }
    else {
      double v13 = v17;
    }
    double v9 = v10;
  }
  [(NSLayoutConstraint *)*p_buttonConstaintNoButton setActive:1];
  [(UIView *)self->_createButton setAlpha:v9];
  [(UIView *)self->_stickerButton setAlpha:v11];
  [(UIView *)self->_memojiButton setAlpha:v12];
  [(UIView *)self->_animojiButton setAlpha:v13];
  [(TUIEmojiSearchView *)self updatePlaceholder];
}

- (void)_updatePlaceholder
{
  overridingPlaceholder = self->_overridingPlaceholder;
  if (overridingPlaceholder)
  {
    BOOL v4 = overridingPlaceholder;
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (+[TUIEmojiSearchView shouldShowGenmoji]) {
      BOOL v6 = @"DESCRIBE_AN_EMOJI";
    }
    else {
      BOOL v6 = @"SEARCH_EMOJI";
    }
    int v7 = [v5 localizedStringInDeviceLanguageForKey:v6];

    BOOL v4 = v7;
  }
  BOOL v8 = v4;
  [(TUIEmojiSearchTextField *)self->_searchTextField setPlaceholder:v4];
}

- (void)updatePlaceholder
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__TUIEmojiSearchView_updatePlaceholder__block_invoke;
  v2[3] = &unk_1E55941A8;
  v2[4] = self;
  tui_performBlockOnMainThread(v2);
}

uint64_t __39__TUIEmojiSearchView_updatePlaceholder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlaceholder];
}

- (void)setShouldCreateButtonGlow:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3 && !self->_collapsed;
  if (self->_shouldCreateButtonGlow != v4)
  {
    self->_shouldCreateButtonGlow = v4;
    if (a4)
    {
      if (v4)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke;
        v8[3] = &unk_1E5593988;
        v8[4] = self;
        v8[5] = 0x3FF3333333333333;
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_2;
        v6[3] = &unk_1E55935E8;
        v6[4] = self;
        long long v7 = xmmword_18D516020;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:v6 completion:0.2];
      }
      else
      {
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_5;
        v5[3] = &unk_1E55941A8;
        void v5[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.5];
      }
    }
    else
    {
      [(TUIEmojiSearchView *)self updateGlowEffects];
    }
  }
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v8, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  double v2 = *(void **)(*(void *)(a1 + 32) + 464);
  CGAffineTransform v7 = v8;
  [v2 setTransform:&v7];
  CGAffineTransformMakeScale(&v6, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 456);
  CGAffineTransform v5 = v6;
  return [v3 setTransform:&v5];
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_2(double *a1)
{
  double v2 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_3;
  v6[3] = &unk_1E55941A8;
  *(double *)&v6[4] = a1[4];
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:v2];
  double v3 = a1[6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_4;
  v5[3] = &unk_1E55941A8;
  *(double *)&void v5[4] = a1[4];
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v3];
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateGlowEffects];
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 464);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  long long v6 = v9[0];
  v9[1] = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v5 = v10;
  [v2 setTransform:v9];
  double v3 = *(void **)(*(void *)(a1 + 32) + 456);
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  return [v3 setTransform:v8];
}

uint64_t __57__TUIEmojiSearchView_setShouldCreateButtonGlow_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateGlowEffects];
}

- (void)updateGlowEffects
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_createButton frame];
  [(UIVisualEffectView *)self->_createButtonVisualEffectView _setCornerRadius:v3 * 0.5];
  if (self->_shouldCreateButtonGlow)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB21A0]);
    long long v5 = [MEMORY[0x1E4FB21A8] sharedShimmeringLight];
    [(UIView *)self->_createButton frame];
    long long v7 = (void *)[v4 initWithLightSource:v5 radius:1 region:v6 / 6.0];
    v10[0] = v7;
    CGAffineTransform v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UIVisualEffectView *)self->_createButtonVisualEffectView setBackgroundEffects:v8];
  }
  else
  {
    createButtonVisualEffectView = self->_createButtonVisualEffectView;
    [(UIVisualEffectView *)createButtonVisualEffectView setBackgroundEffects:0];
  }
}

- (void)addButtons
{
  v60[4] = *MEMORY[0x1E4F143B8];
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    objc_initWeak(&location, self);
    double v3 = (void *)MEMORY[0x1E4FB1830];
    [MEMORY[0x1E4FB08E0] smallSystemFontSize];
    uint64_t v4 = objc_msgSend(v3, "configurationWithPointSize:weight:", 4);
    long long v5 = (void *)MEMORY[0x1E4FB13F0];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __32__TUIEmojiSearchView_addButtons__block_invoke;
    v57[3] = &unk_1E55935C0;
    objc_copyWeak(&v58, &location);
    double v6 = [v5 actionWithHandler:v57];
    long long v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"emoji.face.grinning.and.plus" withConfiguration:v4];
    CGAffineTransform v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v9 = [v8 localizedStringInDeviceLanguageForKey:@"New Genmoji"];
    long long v10 = [(TUIEmojiSearchView *)self addButtonForAction:v6 image:v7 accessibilityLabel:v9 addLightEffect:1];
    createButton = self->_createButton;
    self->_createButton = v10;

    double v12 = (void *)MEMORY[0x1E4FB13F0];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_3;
    v55[3] = &unk_1E55935C0;
    objc_copyWeak(&v56, &location);
    double v13 = [v12 actionWithHandler:v55];
    int v14 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"sticker.badge.plus" withConfiguration:v4];
    double v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v16 = [v15 localizedStringInDeviceLanguageForKey:@"New Sticker"];
    double v17 = [(TUIEmojiSearchView *)self addButtonForAction:v13 image:v14 accessibilityLabel:v16 addLightEffect:0];
    stickerButton = self->_stickerButton;
    self->_stickerButton = v17;

    uint64_t v19 = (void *)MEMORY[0x1E4FB13F0];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_4;
    v53[3] = &unk_1E55935C0;
    objc_copyWeak(&v54, &location);
    uint64_t v20 = [v19 actionWithHandler:v53];
    v50 = (void *)v4;
    v21 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"ellipsis" withConfiguration:v4];
    v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringInDeviceLanguageForKey:@"Edit Memoji"];
    v24 = [(TUIEmojiSearchView *)self addButtonForAction:v20 image:v21 accessibilityLabel:v23 addLightEffect:0];
    memojiButton = self->_memojiButton;
    self->_memojiButton = v24;

    v26 = (void *)MEMORY[0x1E4FB13F0];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_5;
    v51[3] = &unk_1E55935C0;
    objc_copyWeak(&v52, &location);
    v27 = [v26 actionWithHandler:v51];
    id v28 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"plus" withConfiguration:v4];
    BOOL v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringInDeviceLanguageForKey:@"New Memoji"];
    v31 = [(TUIEmojiSearchView *)self addButtonForAction:v27 image:v28 accessibilityLabel:v30 addLightEffect:0];
    animojiButton = self->_animojiButton;
    self->_animojiButton = v31;

    v33 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
    createButtonVisualEffectView = self->_createButtonVisualEffectView;
    self->_createButtonVisualEffectView = v33;

    [(UIVisualEffectView *)self->_createButtonVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v35 = [(UIVisualEffectView *)self->_createButtonVisualEffectView layer];
    [v35 setAllowsHitTesting:0];

    [(UIVisualEffectView *)self->_createButtonVisualEffectView setUserInteractionEnabled:0];
    [(TUIEmojiSearchView *)self addSubview:self->_createButtonVisualEffectView];
    v46 = (void *)MEMORY[0x1E4F28DC8];
    v49 = [(UIVisualEffectView *)self->_createButtonVisualEffectView topAnchor];
    v48 = [(UIView *)self->_createButton topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v60[0] = v47;
    BOOL v36 = [(UIVisualEffectView *)self->_createButtonVisualEffectView bottomAnchor];
    int v37 = [(UIView *)self->_createButton bottomAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v60[1] = v38;
    v39 = [(UIVisualEffectView *)self->_createButtonVisualEffectView leadingAnchor];
    v40 = [(UIView *)self->_createButton leadingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v60[2] = v41;
    v42 = [(UIVisualEffectView *)self->_createButtonVisualEffectView trailingAnchor];
    v43 = [(UIView *)self->_createButton trailingAnchor];
    double v44 = [v42 constraintEqualToAnchor:v43];
    v60[3] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
    [v46 activateConstraints:v45];

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);

    objc_destroyWeak(&location);
  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained createButtonCallback];

  if (v3)
  {
    uint64_t v4 = [WeakRetained createButtonCallback];
    v4[2]();

    dispatch_time_t v5 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__TUIEmojiSearchView_addButtons__block_invoke_2;
    block[3] = &unk_1E5593EA0;
    objc_copyWeak(&v7, v1);
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v7);
  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained createStickerFromPhotosButtonCallback];

  if (v1)
  {
    double v2 = [WeakRetained createStickerFromPhotosButtonCallback];
    v2[2]();
  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentAvatarEditorButtonCallback];

  if (v1)
  {
    double v2 = [WeakRetained presentAvatarEditorButtonCallback];
    v2[2]();
  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentAvatarEditorButtonCallback];

  if (v1)
  {
    double v2 = [WeakRetained presentAvatarEditorButtonCallback];
    v2[2]();
  }
}

void __32__TUIEmojiSearchView_addButtons__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    double v2 = [WeakRetained searchTextField];
    [v2 setText:0];

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchView;
  [(TUIEmojiSearchView *)&v4 dealloc];
}

- (TUIEmojiSearchView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)TUIEmojiSearchView;
  id v3 = -[TUIEmojiSearchView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    bottomHalfContainerView = v3->_bottomHalfContainerView;
    v3->_bottomHalfContainerView = (UIView *)v9;

    [(UIView *)v3->_bottomHalfContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TUIEmojiSearchView *)v3 addSubview:v3->_bottomHalfContainerView];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    resultsCollectionContainerView = v3->_resultsCollectionContainerView;
    v3->_resultsCollectionContainerView = (UIView *)v11;

    [(UIView *)v3->_resultsCollectionContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_bottomHalfContainerView addSubview:v3->_resultsCollectionContainerView];
    v3->_resultsViewVisible = 1;
    double v13 = -[TUIEmojiSearchTextField initWithFrame:pretendsToBecomeFirstResponder:]([TUIEmojiSearchTextField alloc], "initWithFrame:pretendsToBecomeFirstResponder:", 1, v5, v6, v7, v8);
    searchTextField = v3->_searchTextField;
    v3->_searchTextField = v13;

    [(TUIEmojiSearchTextField *)v3->_searchTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TUIEmojiSearchView *)v3 updatePlaceholder];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    searchTextFieldContainerView = v3->_searchTextFieldContainerView;
    v3->_searchTextFieldContainerView = (UIView *)v15;

    [(UIView *)v3->_searchTextFieldContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_searchTextFieldContainerView addSubview:v3->_searchTextField];
    [(TUIEmojiSearchView *)v3 insertSubview:v3->_searchTextFieldContainerView belowSubview:v3->_bottomHalfContainerView];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    predictionViewWrapperView = v3->_predictionViewWrapperView;
    v3->_predictionViewWrapperView = (UIView *)v17;

    [(UIView *)v3->_predictionViewWrapperView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_bottomHalfContainerView addSubview:v3->_predictionViewWrapperView];
    [(UIView *)v3->_predictionViewWrapperView setHidden:!v3->_predictionViewVisible];
    v3->_int64_t buttonConfiguration = 1;
    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      [(TUIEmojiSearchView *)v3 addButtons];
      [(TUIEmojiSearchView *)v3 createConstraintsIfNeeded];
      [(TUIEmojiSearchView *)v3 updateButtons];
      [(TUIEmojiSearchView *)v3 layoutIfNeeded];
    }
    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      uint64_t v19 = [(TUIEmojiSearchView *)v3 traitCollection];
      -[TUIEmojiSearchView setCollapsed:](v3, "setCollapsed:", [v19 userInterfaceIdiom] != 1);
    }
    uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v3 selector:sel__didChangeHandBiasNotification_ name:*MEMORY[0x1E4FB2BE0] object:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v3 selector:sel__buttonConfigurationWillChange_ name:@"TUIEmojiSearchViewButtonConfigurationWillChangeNotification" object:0];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v3 selector:sel__placeholderWillChange_ name:@"TUIChangeEmojiSearchTextFieldPlaceholderNotification" object:0];
  }
  return v3;
}

+ (BOOL)isNotificationExtension
{
  if (isNotificationExtension_onceToken != -1) {
    dispatch_once(&isNotificationExtension_onceToken, &__block_literal_global_1548);
  }
  return isNotificationExtension_isNotificationExtension;
}

uint64_t __45__TUIEmojiSearchView_isNotificationExtension__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 infoDictionary];
  double v7 = [v1 objectForKey:@"NSExtension"];

  id v3 = v7;
  if (v7)
  {
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    id v3 = v7;
    if (isKindOfClass)
    {
      id v4 = [v7 objectForKey:@"NSExtensionPointIdentifier"];
      int v5 = [v4 isEqualToString:@"com.apple.usernotifications.content-extension"];

      id v3 = v7;
      if (v5) {
        isNotificationExtension_isNotificationExtension = 1;
      }
    }
  }
  return MEMORY[0x1F41817F8](isKindOfClass, v3);
}

+ (BOOL)shouldShowButtons
{
  return [a1 isNotificationExtension] ^ 1;
}

+ (BOOL)shouldShowImages
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  double v2 = (uint64_t (*)(void))getMKBGetDeviceLockStateSymbolLoc_ptr;
  uint64_t v19 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v15[3] = &unk_1E5593F18;
    v15[4] = &v16;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v15);
    double v2 = (uint64_t (*)(void))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v2)
  {
    int v3 = v2(0);
    BOOL v5 = v3 == 3 || v3 == 0;
    double v6 = [MEMORY[0x1E4FB1900] activeInstance];
    if (objc_opt_respondsToSelector())
    {
      double v7 = [MEMORY[0x1E4FB1900] activeInstance];
      int v8 = [v7 canInsertAdaptiveImageGlyph];
    }
    else
    {
      int v8 = 0;
    }

    uint64_t v9 = [MEMORY[0x1E4FB18F8] sharedInstance];
    int v10 = [v9 memojiSettingEnabled];

    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      uint64_t v11 = [MEMORY[0x1E4FB1900] activeInstance];
      BOOL v12 = ([v11 canPasteImage] & v10 | v8) & v5;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
    return v12;
  }
  else
  {
    dlerror();
    uint64_t v14 = abort_report_np();
    return __getMKBGetDeviceLockStateSymbolLoc_block_invoke(v14);
  }
}

+ (BOOL)shouldShowGenmoji
{
  int v3 = [a1 gmsAvailability];
  int v4 = [a1 shouldShowImages];
  BOOL v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v5 userInterfaceIdiom];

  int v6 = _os_feature_enabled_impl();
  if ((v3 & v4) != 1 || !v6) {
    return 0;
  }
  return [a1 shouldShowButtons];
}

+ (BOOL)gmsAvailability
{
  return +[TUIGenerativeModelsAvailability isAvailable];
}

@end