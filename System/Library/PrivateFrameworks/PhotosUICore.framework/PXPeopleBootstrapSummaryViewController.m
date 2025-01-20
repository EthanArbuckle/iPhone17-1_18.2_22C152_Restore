@interface PXPeopleBootstrapSummaryViewController
- (BOOL)useLowMemoryMode;
- (BOOL)wantsCancelButton;
- (CGSize)preferredSize;
- (PXPeopleBootstrapContext)bootstrapContext;
- (PXPeopleBootstrapSummaryViewController)initWithContext:(id)a3;
- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate;
- (UILabel)descriptionLabel;
- (UILabel)promptLabel;
- (id)_localizedDescriptionString;
- (id)_localizedPromptString;
- (id)_localizedTitleString;
- (void)_updateNavigationBarForCurrentTraitCollection;
- (void)setConfigControllerDelegate:(id)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUI;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PXPeopleBootstrapSummaryViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionLabel);
  objc_destroyWeak((id *)&self->_promptLabel);
  objc_destroyWeak((id *)&self->_configControllerDelegate);
  objc_storeStrong((id *)&self->_bootstrapContext, 0);
}

- (UILabel)descriptionLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionLabel);
  return (UILabel *)WeakRetained;
}

- (UILabel)promptLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_promptLabel);
  return (UILabel *)WeakRetained;
}

- (void)setConfigControllerDelegate:(id)a3
{
}

- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configControllerDelegate);
  return (PXPeoplePickerConfigurationControllerDelegate *)WeakRetained;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (PXPeopleBootstrapContext)bootstrapContext
{
  return self->_bootstrapContext;
}

- (BOOL)wantsCancelButton
{
  return 0;
}

- (CGSize)preferredSize
{
  +[PXPeopleBootstrap preferredBootstrapSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_localizedTitleString
{
  v4 = [(PXPeopleBootstrapSummaryViewController *)self bootstrapContext];
  v5 = [v4 localizedName];
  if ([v5 length])
  {
    v6 = v5;
    goto LABEL_13;
  }
  uint64_t v7 = [v4 bootstrapType];
  v8 = [v4 sourcePerson];
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXPeopleBootstrapSummaryViewController.m", 258, @"%@ should be an instance inheriting from %@, but it is nil", @"context.sourcePerson", v14 object file lineNumber description];
LABEL_18:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXPeopleBootstrapSummaryViewController.m", 258, @"%@ should be an instance inheriting from %@, but it is %@", @"context.sourcePerson", v14, v16 object file lineNumber description];

    goto LABEL_18;
  }
LABEL_5:
  switch(v7)
  {
    case 0:
      v9 = @"PXPeopleBootstrapTypeFavoriteNamingTitle";
      goto LABEL_10;
    case 1:
      v9 = @"PXPeopleBootstrapTypeNameNamingTitle";
      goto LABEL_10;
    case 2:
      v9 = @"PXPeopleBootstrapTypeAddNamingTitle";
LABEL_10:
      PXLocalizedStringFromTable(v9, @"PhotosUICore");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v10 = [v8 photoLibrary];
      PXLocalizedStringForPeoplePetsHomeTitle(objc_msgSend(v10, "px_peoplePetsHomeVisibility"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = &stru_1F00B0030;
      break;
  }

LABEL_13:
  return v6;
}

- (id)_localizedDescriptionString
{
  v4 = [(PXPeopleBootstrapSummaryViewController *)self bootstrapContext];
  v5 = [v4 sourcePerson];
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PXPeopleBootstrapSummaryViewController.m", 221, @"%@ should be an instance inheriting from %@, but it is nil", @"bootstrapContext.sourcePerson", v15 object file lineNumber description];
LABEL_22:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PXPeopleBootstrapSummaryViewController.m", 221, @"%@ should be an instance inheriting from %@, but it is %@", @"bootstrapContext.sourcePerson", v15, v17 object file lineNumber description];

    goto LABEL_22;
  }
LABEL_3:
  switch([v4 bootstrapType])
  {
    case 0:
      v6 = @"PXPeopleBootstrapFavoriteFinalPrompt";
      goto LABEL_9;
    case 1:
      v8 = [v4 localizedName];
      if ([v8 length])
      {
        v9 = @"PXPeopleBootstrapNameWithNameFinalPrompt";
        goto LABEL_12;
      }
      v11 = @"PXPeopleBootstrapNoNameFinalPrompt";
      goto LABEL_15;
    case 2:
      v6 = @"PXPeopleBootstrapAddFinalPrompt";
LABEL_9:
      PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 3:
      v8 = [v4 localizedName];
      if ([v8 length])
      {
        v9 = @"PXPeopleBootstrapOtherWithNameFinalPrompt";
LABEL_12:
        v10 = PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, v9);
        PXLocalizedStringWithValidatedFormat(v10, @"%@");
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = @"PXPeopleBootstrapOtherWithoutNameFinalPrompt";
LABEL_15:
        PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, v11);
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

LABEL_17:
      return v7;
    default:
      uint64_t v7 = &stru_1F00B0030;
      goto LABEL_17;
  }
}

- (id)_localizedPromptString
{
  return 0;
}

- (void)_updateNavigationBarForCurrentTraitCollection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __87__PXPeopleBootstrapSummaryViewController__updateNavigationBarForCurrentTraitCollection__block_invoke;
  v2[3] = &unk_1E5DD36F8;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __87__PXPeopleBootstrapSummaryViewController__updateNavigationBarForCurrentTraitCollection__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _localizedTitleString];
  [*(id *)(a1 + 32) setTitle:v2];
}

- (void)updateUI
{
  double v3 = [(PXPeopleBootstrapSummaryViewController *)self _localizedPromptString];
  v4 = [(PXPeopleBootstrapSummaryViewController *)self promptLabel];
  [v4 setText:v3];

  v5 = [(PXPeopleBootstrapSummaryViewController *)self _localizedDescriptionString];
  v6 = [(PXPeopleBootstrapSummaryViewController *)self descriptionLabel];
  [v6 setText:v5];

  [(PXPeopleBootstrapSummaryViewController *)self _updateNavigationBarForCurrentTraitCollection];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  [(PXPeopleBootstrapSummaryViewController *)&v5 viewWillDisappear:a3];
  if (([(PXPeopleBootstrapSummaryViewController *)self isBeingDismissed] & 1) != 0
    || [(PXPeopleBootstrapSummaryViewController *)self isMovingFromParentViewController])
  {
    v4 = [(PXPeopleBootstrapSummaryViewController *)self configControllerDelegate];
    [v4 viewControllerWillBePopped:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  [(PXPeopleBootstrapSummaryViewController *)&v4 viewWillAppear:a3];
  [(PXPeopleBootstrapSummaryViewController *)self updateUI];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  [(PXPeopleBootstrapSummaryViewController *)&v4 traitCollectionDidChange:a3];
  [(PXPeopleBootstrapSummaryViewController *)self _updateNavigationBarForCurrentTraitCollection];
}

- (void)viewDidLoad
{
  v50[9] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  [(PXPeopleBootstrapSummaryViewController *)&v49 viewDidLoad];
  double v3 = [(PXPeopleBootstrapSummaryViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  objc_super v5 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  [(PXPeopleScalableAvatarView *)v5 setUseLowMemoryMode:[(PXPeopleBootstrapSummaryViewController *)self useLowMemoryMode]];
  v6 = [(PXPeopleBootstrapSummaryViewController *)self bootstrapContext];
  uint64_t v7 = [v6 face];
  v47 = v6;
  v48 = (void *)v7;
  if (v7)
  {
    [(PXPeopleScalableAvatarView *)v5 setFace:v7];
  }
  else
  {
    v8 = [v6 sourcePerson];
    [(PXPeopleScalableAvatarView *)v5 setPerson:v8];
  }
  [(PXPeopleScalableAvatarView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v9 setTextAlignment:1];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setNumberOfLines:0];
  [v9 setAdjustsFontForContentSizeCategory:1];
  v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v9 setFont:v10];

  objc_storeWeak((id *)&self->_descriptionLabel, v9);
  [v3 addSubview:v9];
  v11 = [v3 safeAreaLayoutGuide];
  v12 = [(PXPeopleScalableAvatarView *)v5 centerYAnchor];
  v13 = [v3 centerYAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];

  LODWORD(v15) = 1132068864;
  v42 = v14;
  [v14 setPriority:v15];
  v35 = (void *)MEMORY[0x1E4F28DC8];
  v46 = [(PXPeopleScalableAvatarView *)v5 topAnchor];
  v45 = [v11 topAnchor];
  v44 = [v46 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v45 multiplier:1.0];
  v50[0] = v44;
  v41 = [(PXPeopleScalableAvatarView *)v5 centerXAnchor];
  v43 = v3;
  v40 = [v3 centerXAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v50[1] = v39;
  v50[2] = v14;
  v38 = [(PXPeopleScalableAvatarView *)v5 heightAnchor];
  v37 = [(PXPeopleScalableAvatarView *)v5 widthAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v50[3] = v36;
  v34 = [(PXPeopleScalableAvatarView *)v5 heightAnchor];
  v33 = [v3 heightAnchor];
  v31 = [v34 constraintEqualToAnchor:v33 multiplier:0.35];
  v50[4] = v31;
  v29 = [v9 firstBaselineAnchor];
  v28 = [(PXPeopleScalableAvatarView *)v5 bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:95.0];
  v50[5] = v27;
  v26 = [v9 leadingAnchor];
  v16 = v11;
  v25 = [v11 leadingAnchor];
  v17 = [v26 constraintEqualToSystemSpacingAfterAnchor:v25 multiplier:1.0];
  v50[6] = v17;
  v30 = v11;
  [v11 trailingAnchor];
  v18 = v32 = self;
  v19 = [v9 trailingAnchor];
  v20 = [v18 constraintEqualToSystemSpacingAfterAnchor:v19 multiplier:1.0];
  v50[7] = v20;
  v21 = [v16 bottomAnchor];
  v22 = [v9 bottomAnchor];
  v23 = [v21 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v22 multiplier:1.0];
  v50[8] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:9];
  [v35 activateConstraints:v24];

  [(PXPeopleBootstrapSummaryViewController *)v32 updateUI];
}

- (PXPeopleBootstrapSummaryViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  v6 = [(PXPeopleBootstrapSummaryViewController *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bootstrapContext, a3);
    [(PXPeopleBootstrapSummaryViewController *)v7 setTitle:&stru_1F00B0030];
  }

  return v7;
}

@end