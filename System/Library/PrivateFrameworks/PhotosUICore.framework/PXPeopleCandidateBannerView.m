@interface PXPeopleCandidateBannerView
- (BOOL)_isMeSuggestion;
- (BOOL)_wantsNotNowTextInRegularSizeClass;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContact)contactSuggestion;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)notNowToTrailingConstraint;
- (NSString)nameSuggestion;
- (PHPerson)person;
- (PXFeatureSpec)spec;
- (PXPeopleCandidateBannerView)initWithCoder:(id)a3;
- (PXPeopleCandidateBannerView)initWithFrame:(CGRect)a3;
- (PXPeopleCandidateBannerView)initWithStyle:(int64_t)a3;
- (PXPeopleCandidateBannerViewDelegate)delegate;
- (PXPeopleScalableAvatarView)personAvatarView;
- (UIImage)suggestedContactImage;
- (UIImageView)contactAvatarView;
- (UILabel)promptLabel;
- (UIPopoverPresentationControllerSourceItem)popoverSourceForPrimaryAction;
- (id)_attributionTitle;
- (id)_reviewButtonTitle;
- (id)_suggestionString;
- (id)_suggestionTitle;
- (int64_t)attribution;
- (int64_t)avatarStyle;
- (int64_t)style;
- (void)_notNowTapped;
- (void)_reviewTapped;
- (void)_updateContactAvatarImage;
- (void)_updateNotNowButton;
- (void)_updatePromptTitle;
- (void)setAttribution:(int64_t)a3;
- (void)setContactSuggestion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNameSuggestion:(id)a3;
- (void)setPerson:(id)a3;
- (void)setSpec:(id)a3;
- (void)setSuggestedContactImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation PXPeopleCandidateBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notNowToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);
  objc_storeStrong((id *)&self->_personAvatarView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_nameSuggestion, 0);
  objc_storeStrong((id *)&self->_contactSuggestion, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

- (NSLayoutConstraint)notNowToTrailingConstraint
{
  return self->_notNowToTrailingConstraint;
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (UIImageView)contactAvatarView
{
  return self->_contactAvatarView;
}

- (PXPeopleScalableAvatarView)personAvatarView
{
  return self->_personAvatarView;
}

- (void)setDelegate:(id)a3
{
}

- (PXPeopleCandidateBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPeopleCandidateBannerViewDelegate *)WeakRetained;
}

- (PXFeatureSpec)spec
{
  return self->_spec;
}

- (NSString)nameSuggestion
{
  return self->_nameSuggestion;
}

- (CNContact)contactSuggestion
{
  return self->_contactSuggestion;
}

- (int64_t)attribution
{
  return self->_attribution;
}

- (int64_t)style
{
  return self->_style;
}

- (void)_notNowTapped
{
  id v3 = [(PXPeopleCandidateBannerView *)self delegate];
  [v3 bannerViewDidSelectNotNow:self];
}

- (void)_reviewTapped
{
  id v3 = [(PXPeopleCandidateBannerView *)self delegate];
  [v3 bannerViewDidSelectPrimaryAction:self];
}

- (void)_updateContactAvatarImage
{
  self->_int64_t contactImageRequestVersion = (self->_contactImageRequestVersion + 1) % 1000;
  id v3 = [(PXPeopleCandidateBannerView *)self contactSuggestion];
  if (v3)
  {
    v4 = [(PXPeopleCandidateBannerView *)self traitCollection];
    [v4 displayScale];
    double v6 = v5;

    v7 = [(PXPeopleCandidateBannerView *)self traitCollection];
    BOOL v8 = [v7 layoutDirection] == 1;

    int64_t contactImageRequestVersion = self->_contactImageRequestVersion;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__PXPeopleCandidateBannerView__updateContactAvatarImage__block_invoke;
    v10[3] = &unk_1E5DD1630;
    v10[4] = self;
    v10[5] = contactImageRequestVersion;
    +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v3, v8, 0, v10, 37.0, 37.0, v6);
  }
  else
  {
    [(PXPeopleCandidateBannerView *)self setSuggestedContactImage:0];
  }
}

void *__56__PXPeopleCandidateBannerView__updateContactAvatarImage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8) == result[53]) {
    return (void *)[result setSuggestedContactImage:a2];
  }
  return result;
}

- (void)_updatePromptTitle
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB28F0];
  v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:0x8000 options:2];
  double v5 = [(PXPeopleCandidateBannerView *)self _suggestionTitle];
  int64_t v6 = [(PXPeopleCandidateBannerView *)self style];
  if ((unint64_t)(v6 - 1) < 4)
  {
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    uint64_t v22 = *MEMORY[0x1E4FB06F8];
    BOOL v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
    v23 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

    v10 = [(PXPeopleCandidateBannerView *)self _suggestionString];
    if (v10)
    {
      v11 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v3 addingSymbolicTraits:32770 options:2];
      uint64_t v20 = v7;
      v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
      v21 = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];

      if ([v5 length])
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5 attributes:v13];
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
        [v14 appendAttributedString:v15];

        v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v9];
        [v14 appendAttributedString:v16];
        v17 = (void *)[v14 copy];
      }
      else
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v13];
      }
    }
    else
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v9];
    }

    goto LABEL_12;
  }
  if (!v6)
  {
    uint64_t v24 = *MEMORY[0x1E4FB06F8];
    v18 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
    v25[0] = v18;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v9];
LABEL_12:

    goto LABEL_13;
  }
  v17 = 0;
LABEL_13:
  v19 = [(PXPeopleCandidateBannerView *)self promptLabel];
  [v19 setAttributedText:v17];
}

- (void)_updateNotNowButton
{
  uint64_t v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v4 = [(PXPeopleCandidateBannerView *)self traitCollection];
  if ([v4 horizontalSizeClass] == 2)
  {
    BOOL v5 = [(PXPeopleCandidateBannerView *)self _wantsNotNowTextInRegularSizeClass];

    if (v5)
    {
      double v7 = *MEMORY[0x1E4FB2848];
      double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      v10 = [v3 background];
      [v10 setCornerRadius:12.0];

      v11 = [(PXPeopleCandidateBannerView *)self tintColor];
      v12 = [v3 background];
      [v12 setStrokeColor:v11];

      v13 = [v3 background];
      [v13 setStrokeWidth:1.0];

      v14 = PXLocalizedStringFromTable(@"PXPeopleCandidateNotNowTitle", @"PhotosUICore");
      v15 = (void *)MEMORY[0x1E4F1CA20];
      v16 = [MEMORY[0x1E4F28B50] mainBundle];
      v17 = [v16 preferredLocalizations];
      v18 = [v17 firstObject];
      v19 = [v15 localeWithLocaleIdentifier:v18];
      uint64_t v20 = [v14 uppercaseStringWithLocale:v19];
      [v3 setTitle:v20];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v14 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2908] scale:1];
  v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark" withConfiguration:v14];
  [v3 setImage:v21];

  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v3 setBaseForegroundColor:v16];
  double v8 = -10.0;
  double v9 = -17.0;
  double v6 = -17.0;
  double v7 = -10.0;
LABEL_6:

  uint64_t v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB09B8]];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke;
  v32[3] = &unk_1E5DC6F70;
  id v23 = v22;
  id v33 = v23;
  [v3 setTitleTextAttributesTransformer:v32];
  notNowButton = self->_notNowButton;
  if (notNowButton)
  {
    [(UIButton *)notNowButton setConfiguration:v3];
  }
  else
  {
    objc_initWeak(&location, self);
    v25 = (void *)MEMORY[0x1E4FB13F0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke_2;
    v29[3] = &unk_1E5DD2930;
    objc_copyWeak(&v30, &location);
    v26 = [v25 actionWithHandler:v29];
    v27 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v3 primaryAction:v26];
    v28 = self->_notNowButton;
    self->_notNowButton = v27;

    [(UIButton *)self->_notNowButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXPeopleCandidateBannerView *)self addSubview:self->_notNowButton];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  -[UIButton _setTouchInsets:](self->_notNowButton, "_setTouchInsets:", v7, v6, v8, v9);
}

id __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 mutableCopy];
  v4 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  BOOL v5 = [v4 scaledFontForFont:*(void *)(a1 + 32)];

  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  return v3;
}

void __50__PXPeopleCandidateBannerView__updateNotNowButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notNowTapped];
}

- (BOOL)_wantsNotNowTextInRegularSizeClass
{
  unint64_t v4 = [(PXPeopleCandidateBannerView *)self style];
  if (v4 >= 5)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXPeopleCandidateBannerView.m" lineNumber:413 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return (v4 & 0x1F) == 0;
}

- (id)_reviewButtonTitle
{
  int64_t v4 = [(PXPeopleCandidateBannerView *)self style];
  if ((unint64_t)(v4 - 1) < 3)
  {
    BOOL v5 = @"PXPeopleCandidateNameContactSuggestionReviewButton";
LABEL_7:
    v2 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
    goto LABEL_8;
  }
  if (v4 == 4)
  {
    BOOL v5 = @"PXPeopleCandidateYouSuggestionAcceptButton";
    goto LABEL_7;
  }
  if (!v4)
  {
    double v6 = [(PXPeopleCandidateBannerView *)self person];
    double v7 = [v6 photoLibrary];
    v2 = PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v7, "px_peoplePetsHomeVisibility"), @"PXPeopleCandidateReviewTitle");
  }
LABEL_8:
  return v2;
}

- (id)_suggestionString
{
  switch([(PXPeopleCandidateBannerView *)self style])
  {
    case 1:
      uint64_t v3 = [(PXPeopleCandidateBannerView *)self contactSuggestion];
      if (!v3) {
        goto LABEL_11;
      }
      int64_t v4 = [MEMORY[0x1E4F391F0] fullNameFromContact:v3];
      BOOL v5 = [(PXPeopleCandidateBannerView *)self person];
      double v6 = PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, @"PXPeopleCandidateNameContactSuggestionMessage");
      double v7 = PXLocalizedStringWithValidatedFormat(v6, @"%@");

      goto LABEL_7;
    case 2:
      uint64_t v3 = [(PXPeopleCandidateBannerView *)self nameSuggestion];
      if (v3)
      {
        int64_t v4 = [(PXPeopleCandidateBannerView *)self person];
        BOOL v5 = PXLocalizedStringForPersonOrPetAndVisibility(v4, 0, @"PXPeopleCandidateNameContactSuggestionMessage");
        double v7 = PXLocalizedStringWithValidatedFormat(v5, @"%@");
LABEL_7:
      }
      else
      {
LABEL_11:
        double v7 = 0;
      }

      break;
    case 3:
      double v8 = @"PXPeopleCandidateYouContactSuggestionMessage";
      goto LABEL_10;
    case 4:
      double v8 = @"PXPeopleMeConfirmMessage";
LABEL_10:
      double v7 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
      break;
    default:
      double v7 = 0;
      break;
  }
  return v7;
}

- (id)_suggestionTitle
{
  v2 = self;
  switch([(PXPeopleCandidateBannerView *)self style])
  {
    case 0:
      uint64_t v5 = PXLocalizedStringFromTable(@"PXPeopleCandidatePhotosForReviewNoNameMessage", @"PhotosUICore");
      goto LABEL_8;
    case 1:
    case 3:
      uint64_t v3 = [(PXPeopleCandidateBannerView *)v2 _attributionTitle];
      if (v3) {
        goto LABEL_6;
      }
      int64_t v4 = @"PXPeopleCandidateContactSuggestionTitle";
      goto LABEL_10;
    case 2:
      uint64_t v3 = [(PXPeopleCandidateBannerView *)v2 _attributionTitle];
      if (v3)
      {
LABEL_6:
        double v6 = v3;
      }
      else
      {
        int64_t v4 = @"PXPeopleCandidateNameSuggestionTitle";
LABEL_10:
        PXLocalizedStringFromTable(v4, @"PhotosUICore");
        double v6 = (PXPeopleCandidateBannerView *)objc_claimAutoreleasedReturnValue();
      }
      v2 = v6;

LABEL_12:
      return v2;
    case 4:
      uint64_t v5 = [(PXPeopleCandidateBannerView *)v2 _attributionTitle];
LABEL_8:
      v2 = (PXPeopleCandidateBannerView *)v5;
      goto LABEL_12;
    default:
      goto LABEL_12;
  }
}

- (id)_attributionTitle
{
  int64_t v3 = [(PXPeopleCandidateBannerView *)self attribution] - 1;
  int64_t v4 = @"PXPeopleCandidateMessagesAttributionTitle";
  switch(v3)
  {
    case 0:
      goto LABEL_8;
    case 1:
      int64_t v4 = @"PXPeopleCandidateContactsAttributionTitle";
      goto LABEL_8;
    case 2:
      if (![(PXPeopleCandidateBannerView *)self _isMeSuggestion]) {
        PXAssertGetLog();
      }
      int64_t v4 = @"PXPeopleCandidatePhotosAttributionTitle";
      goto LABEL_8;
    case 3:
      int64_t v4 = @"PXPeopleCandidateHomeAttributionTitle";
LABEL_8:
      uint64_t v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)_isMeSuggestion
{
  return (unint64_t)([(PXPeopleCandidateBannerView *)self style] - 3) < 2;
}

- (void)updateConstraints
{
  int64_t v3 = [(PXPeopleCandidateBannerView *)self spec];
  [v3 contentGuideInsetsForScrollAxis:1];
  double v5 = v4;

  double v6 = [(PXPeopleCandidateBannerView *)self leadingConstraint];
  [v6 setConstant:v5];

  double v7 = [(PXPeopleCandidateBannerView *)self notNowToTrailingConstraint];
  [v7 setConstant:-(v5 + 7.0)];

  v8.receiver = self;
  v8.super_class = (Class)PXPeopleCandidateBannerView;
  [(PXPeopleCandidateBannerView *)&v8 updateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPeopleCandidateBannerView *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];
  uint64_t v7 = [v4 horizontalSizeClass];

  if (v6 != v7) {
    [(PXPeopleCandidateBannerView *)self _updateNotNowButton];
  }
  objc_super v8 = [(PXPeopleCandidateBannerView *)self traitCollection];
  double v9 = [v8 preferredContentSizeCategory];
  v10 = [v4 preferredContentSizeCategory];

  if (v9 != v10) {
    [(PXPeopleCandidateBannerView *)self _updatePromptTitle];
  }
  v11 = [(PXPeopleCandidateBannerView *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;
  [v4 displayScale];
  if (v13 == v14)
  {
    v15 = [(PXPeopleCandidateBannerView *)self traitCollection];
    uint64_t v16 = [v15 layoutDirection];
    uint64_t v17 = [v4 layoutDirection];

    if (v16 == v17) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  [(PXPeopleCandidateBannerView *)self _updateContactAvatarImage];
LABEL_10:
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleCandidateBannerView;
  [(PXPeopleCandidateBannerView *)&v18 traitCollectionDidChange:v4];
}

- (int64_t)avatarStyle
{
  int64_t v3 = [(PXPeopleCandidateBannerView *)self personAvatarView];

  if (v3)
  {
    id v4 = [(PXPeopleCandidateBannerView *)self personAvatarView];
    int64_t v5 = [v4 cornerStyle];

    return v5;
  }
  else
  {
    uint64_t v7 = [(PXPeopleCandidateBannerView *)self contactAvatarView];
    BOOL v8 = v7 != 0;

    return 2 * v8;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[PXPeopleCandidateBannerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setSpec:(id)a3
{
  double v5 = (PXFeatureSpec *)a3;
  if (self->_spec != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXPeopleCandidateBannerView *)self setNeedsUpdateConstraints];
    double v5 = v6;
  }
}

- (UIPopoverPresentationControllerSourceItem)popoverSourceForPrimaryAction
{
  return (UIPopoverPresentationControllerSourceItem *)self->_actionButton;
}

- (void)setNameSuggestion:(id)a3
{
  BOOL v8 = (NSString *)a3;
  double v4 = self->_nameSuggestion;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      double v6 = (NSString *)[(NSString *)v8 copy];
      nameSuggestion = self->_nameSuggestion;
      self->_nameSuggestion = v6;

      [(PXPeopleCandidateBannerView *)self _updatePromptTitle];
    }
  }
}

- (UIImage)suggestedContactImage
{
  v2 = [(PXPeopleCandidateBannerView *)self contactAvatarView];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setSuggestedContactImage:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeopleCandidateBannerView *)self contactAvatarView];
  [v5 setImage:v4];
}

- (void)setContactSuggestion:(id)a3
{
  id v5 = (CNContact *)a3;
  if (self->_contactSuggestion != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_contactSuggestion, a3);
    [(PXPeopleCandidateBannerView *)self _updatePromptTitle];
    [(PXPeopleCandidateBannerView *)self _updateContactAvatarImage];
    id v5 = v6;
  }
}

- (PHPerson)person
{
  v2 = [(PXPeopleCandidateBannerView *)self personAvatarView];
  double v3 = [v2 person];

  return (PHPerson *)v3;
}

- (void)setPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeopleCandidateBannerView *)self personAvatarView];
  [v5 setPerson:v4];
}

- (void)setAttribution:(int64_t)a3
{
  if (self->_attribution != a3)
  {
    self->_attribution = a3;
    [(PXPeopleCandidateBannerView *)self _updatePromptTitle];
  }
}

- (PXPeopleCandidateBannerView)initWithStyle:(int64_t)a3
{
  v100[19] = *MEMORY[0x1E4F143B8];
  v98.receiver = self;
  v98.super_class = (Class)PXPeopleCandidateBannerView;
  id v4 = -[PXPeopleCandidateBannerView initWithFrame:](&v98, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    double v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PXPeopleCandidateBannerView *)v5 setBackgroundColor:v6];

    switch(a3)
    {
      case 0:
      case 4:
        uint64_t v7 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 37.0, 37.0);
        p_personAvatarView = (id *)&v5->_personAvatarView;
        personAvatarView = v5->_personAvatarView;
        v5->_personAvatarView = v7;

        [(PXPeopleScalableAvatarView *)v5->_personAvatarView setCornerStyle:1];
        goto LABEL_5;
      case 1:
      case 3:
        uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, 37.0, 37.0);
        p_personAvatarView = (id *)&v5->_contactAvatarView;
        contactAvatarView = v5->_contactAvatarView;
        v5->_contactAvatarView = (UIImageView *)v10;

LABEL_5:
        id v89 = *p_personAvatarView;
        [v89 setTranslatesAutoresizingMaskIntoConstraints:0];
        if (!v89) {
          goto LABEL_8;
        }
        -[PXPeopleCandidateBannerView addSubview:](v5, "addSubview:");
        char v12 = 0;
        break;
      default:
        [0 setTranslatesAutoresizingMaskIntoConstraints:0];
LABEL_8:
        id v89 = 0;
        char v12 = 1;
        break;
    }
    double v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    promptLabel = v5->_promptLabel;
    v5->_promptLabel = v13;

    [(UILabel *)v5->_promptLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1132068864;
    [(UILabel *)v5->_promptLabel setContentCompressionResistancePriority:0 forAxis:v15];
    LODWORD(v16) = 1112014848;
    [(UILabel *)v5->_promptLabel setContentHuggingPriority:0 forAxis:v16];
    [(UILabel *)v5->_promptLabel setLineBreakMode:0];
    [(UILabel *)v5->_promptLabel setNumberOfLines:0];
    [(PXPeopleCandidateBannerView *)v5 _updatePromptTitle];
    [(UILabel *)v5->_promptLabel setAdjustsFontForContentSizeCategory:1];
    [(PXPeopleCandidateBannerView *)v5 addSubview:v5->_promptLabel];
    v90 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
    uint64_t v17 = [(PXPeopleCandidateBannerView *)v5 tintColor];
    [v90 setBaseBackgroundColor:v17];

    objc_super v18 = [v90 background];
    [v18 setCornerRadius:12.0];

    objc_msgSend(v90, "setContentInsets:", 0.0, 10.0, 0.0, 10.0);
    v19 = [(PXPeopleCandidateBannerView *)v5 _reviewButtonTitle];
    [v90 setTitle:v19];

    uint64_t v20 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:0x8000 weight:*MEMORY[0x1E4FB09B8]];
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke;
    v96[3] = &unk_1E5DC6F70;
    id v50 = v20;
    id v97 = v50;
    [v90 setTitleTextAttributesTransformer:v96];
    objc_initWeak(&location, v5);
    v21 = (void *)MEMORY[0x1E4FB13F0];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke_2;
    v93[3] = &unk_1E5DD2930;
    objc_copyWeak(&v94, &location);
    v49 = [v21 actionWithHandler:v93];
    objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v90);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    [obj setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v5->_actionButton, obj);
    [(PXPeopleCandidateBannerView *)v5 addSubview:obj];
    [(PXPeopleCandidateBannerView *)v5 _updateNotNowButton];
    id v91 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    uint64_t v22 = [MEMORY[0x1E4FB1618] separatorColor];
    [v91 setBackgroundColor:v22];

    [v91 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXPeopleCandidateBannerView *)v5 addSubview:v91];
    id v23 = [(PXPeopleCandidateBannerView *)v5 spec];
    [v23 layoutMargins];
    double v25 = v24;

    v26 = [(UIButton *)v5->_notNowButton trailingAnchor];
    v27 = [(PXPeopleCandidateBannerView *)v5 trailingAnchor];
    id v87 = [v26 constraintEqualToAnchor:v27 constant:-(v25 + 7.0)];

    objc_storeStrong((id *)&v5->_notNowToTrailingConstraint, v87);
    if (v12)
    {
      v28 = [(UILabel *)v5->_promptLabel leadingAnchor];
      v29 = [(PXPeopleCandidateBannerView *)v5 leadingAnchor];
      id v88 = [v28 constraintEqualToAnchor:v29 constant:v25];

      objc_storeStrong((id *)&v5->_leadingConstraint, v88);
      id v30 = (void *)MEMORY[0x1E4F28DC8];
      v99[0] = v88;
      v86 = [(UILabel *)v5->_promptLabel centerYAnchor];
      v85 = [(PXPeopleCandidateBannerView *)v5 centerYAnchor];
      v84 = [v86 constraintEqualToAnchor:v85];
      v99[1] = v84;
      v83 = [obj leadingAnchor];
      v82 = [(UILabel *)v5->_promptLabel trailingAnchor];
      v81 = [v83 constraintEqualToAnchor:v82 constant:15.0];
      v99[2] = v81;
      v80 = [obj centerYAnchor];
      v79 = [(PXPeopleCandidateBannerView *)v5 centerYAnchor];
      v78 = [v80 constraintEqualToAnchor:v79];
      v99[3] = v78;
      v77 = [obj heightAnchor];
      v76 = [v77 constraintEqualToConstant:24.0];
      v99[4] = v76;
      v75 = [(UIButton *)v5->_notNowButton leadingAnchor];
      v74 = [obj trailingAnchor];
      v73 = [v75 constraintEqualToAnchor:v74 constant:15.0];
      v99[5] = v73;
      v72 = [(UIButton *)v5->_notNowButton centerYAnchor];
      v71 = [(PXPeopleCandidateBannerView *)v5 centerYAnchor];
      v70 = [v72 constraintEqualToAnchor:v71];
      v99[6] = v70;
      v69 = [(UIButton *)v5->_notNowButton heightAnchor];
      v68 = [v69 constraintEqualToConstant:24.0];
      v99[7] = v68;
      v99[8] = v87;
      v67 = [v91 leadingAnchor];
      v66 = [(PXPeopleCandidateBannerView *)v5 leadingAnchor];
      v65 = [v67 constraintEqualToAnchor:v66];
      v99[9] = v65;
      v64 = [v91 trailingAnchor];
      v63 = [(PXPeopleCandidateBannerView *)v5 trailingAnchor];
      v62 = [v64 constraintEqualToAnchor:v63];
      v99[10] = v62;
      v61 = [v91 bottomAnchor];
      v60 = [(PXPeopleCandidateBannerView *)v5 bottomAnchor];
      v59 = [v61 constraintEqualToAnchor:v60];
      v99[11] = v59;
      v58 = [v91 heightAnchor];
      v57 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v57 scale];
      v56 = [v58 constraintEqualToConstant:1.0 / v31];
      v99[12] = v56;
      v55 = [(PXPeopleCandidateBannerView *)v5 heightAnchor];
      v54 = [v55 constraintGreaterThanOrEqualToConstant:60.0];
      v99[13] = v54;
      v53 = [(PXPeopleCandidateBannerView *)v5 heightAnchor];
      v52 = [(UILabel *)v5->_promptLabel heightAnchor];
      v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52 constant:28.0];
      v99[14] = v51;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:15];
      [v30 activateConstraints:v32];
    }
    else
    {
      id v33 = [v89 leadingAnchor];
      v34 = [(PXPeopleCandidateBannerView *)v5 leadingAnchor];
      id v88 = [v33 constraintEqualToAnchor:v34 constant:v25];

      objc_storeStrong((id *)&v5->_leadingConstraint, v88);
      v46 = (void *)MEMORY[0x1E4F28DC8];
      v86 = [v89 widthAnchor];
      v85 = [v86 constraintEqualToConstant:37.0];
      v100[0] = v85;
      v84 = [v89 heightAnchor];
      v83 = [v84 constraintEqualToConstant:37.0];
      v100[1] = v83;
      v82 = [v89 centerYAnchor];
      v81 = [(PXPeopleCandidateBannerView *)v5 centerYAnchor];
      v80 = [v82 constraintEqualToAnchor:v81];
      v100[2] = v80;
      v100[3] = v88;
      v79 = [(UILabel *)v5->_promptLabel leadingAnchor];
      v78 = [v89 trailingAnchor];
      v77 = [v79 constraintEqualToAnchor:v78 constant:8.0];
      v100[4] = v77;
      v76 = [(UILabel *)v5->_promptLabel centerYAnchor];
      v75 = [(PXPeopleCandidateBannerView *)v5 centerYAnchor];
      v74 = [v76 constraintEqualToAnchor:v75];
      v100[5] = v74;
      v73 = [obj leadingAnchor];
      v72 = [(UILabel *)v5->_promptLabel trailingAnchor];
      v71 = [v73 constraintEqualToAnchor:v72 constant:15.0];
      v100[6] = v71;
      v70 = [obj centerYAnchor];
      v69 = [(PXPeopleCandidateBannerView *)v5 centerYAnchor];
      v68 = [v70 constraintEqualToAnchor:v69];
      v100[7] = v68;
      v67 = [obj heightAnchor];
      v66 = [v67 constraintEqualToConstant:24.0];
      v100[8] = v66;
      v65 = [(UIButton *)v5->_notNowButton leadingAnchor];
      v64 = [obj trailingAnchor];
      v63 = [v65 constraintEqualToAnchor:v64 constant:15.0];
      v100[9] = v63;
      v62 = [(UIButton *)v5->_notNowButton centerYAnchor];
      v61 = [(PXPeopleCandidateBannerView *)v5 centerYAnchor];
      v60 = [v62 constraintEqualToAnchor:v61];
      v100[10] = v60;
      v59 = [(UIButton *)v5->_notNowButton heightAnchor];
      v58 = [v59 constraintEqualToConstant:24.0];
      v100[11] = v58;
      v100[12] = v87;
      v57 = [v91 leadingAnchor];
      v56 = [(PXPeopleCandidateBannerView *)v5 leadingAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v100[13] = v55;
      v54 = [v91 trailingAnchor];
      v53 = [(PXPeopleCandidateBannerView *)v5 trailingAnchor];
      v52 = [v54 constraintEqualToAnchor:v53];
      v100[14] = v52;
      v51 = [v91 bottomAnchor];
      v32 = [(PXPeopleCandidateBannerView *)v5 bottomAnchor];
      v48 = [v51 constraintEqualToAnchor:v32];
      v100[15] = v48;
      v47 = [v91 heightAnchor];
      v35 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v35 scale];
      v37 = [v47 constraintEqualToConstant:1.0 / v36];
      v100[16] = v37;
      v38 = [(PXPeopleCandidateBannerView *)v5 heightAnchor];
      v39 = [v38 constraintGreaterThanOrEqualToConstant:60.0];
      v100[17] = v39;
      v40 = [(PXPeopleCandidateBannerView *)v5 heightAnchor];
      v41 = [(UILabel *)v5->_promptLabel heightAnchor];
      v42 = [v40 constraintGreaterThanOrEqualToAnchor:v41 constant:28.0];
      v100[18] = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:19];
      [v46 activateConstraints:v43];
    }
    v44 = v5;

    objc_destroyWeak(&v94);
    objc_destroyWeak(&location);
  }
  return v5;
}

id __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)[a2 mutableCopy];
  id v4 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  id v5 = [v4 scaledFontForFont:*(void *)(a1 + 32)];

  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  return v3;
}

void __45__PXPeopleCandidateBannerView_initWithStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reviewTapped];
}

- (PXPeopleCandidateBannerView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleCandidateBannerView.m", 56, @"%s is not available as initializer", "-[PXPeopleCandidateBannerView initWithFrame:]");

  abort();
}

- (PXPeopleCandidateBannerView)initWithCoder:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleCandidateBannerView.m", 52, @"%s is not available as initializer", "-[PXPeopleCandidateBannerView initWithCoder:]");

  abort();
}

@end