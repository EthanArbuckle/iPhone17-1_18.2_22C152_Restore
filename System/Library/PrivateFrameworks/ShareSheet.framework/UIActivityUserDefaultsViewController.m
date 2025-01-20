@interface UIActivityUserDefaultsViewController
@end

@implementation UIActivityUserDefaultsViewController

_UIActivityUserDefaultsActivityCell *__52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v8 = [a2 dequeueReusableCellWithIdentifier:@"userDefaultsCell" forIndexPath:a3];
  if (!v8) {
    v8 = [[_UIActivityUserDefaultsActivityCell alloc] initWithStyle:0 reuseIdentifier:@"userDefaultsCell"];
  }
  v9 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  v10 = [(_UIActivityUserDefaultsActivityCell *)v8 contentView];
  [v10 setBackgroundColor:v9];

  v11 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(_UIActivityUserDefaultsActivityCell *)v8 setBackgroundColor:v11];

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v13 = [WeakRetained currentSnapshot];
  v14 = [v13 sectionIdentifierForSectionContainingItemIdentifier:v7];

  int v15 = [v14 isEqualToString:@"SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"];
  id v16 = a1[4];
  if (v15) {
    [v16 favoritesByUUID];
  }
  else {
  v17 = [v16 suggestionsByUUID];
  }
  v18 = [v17 objectForKeyedSubscript:v7];

  -[_UIActivityUserDefaultsActivityCell setDisabled:](v8, "setDisabled:", [v18 isDisabled]);
  [(_UIActivityUserDefaultsActivityCell *)v8 setActivityProxy:v18];
  v19 = [a1[4] activitiesByUUID];
  v20 = [v18 identifier];
  v21 = [v19 objectForKeyedSubscript:v20];

  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = [v21 _activityImageUTI];

      if (!v22)
      {
        v48 = [a1[4] view];
        v49 = [v48 traitCollection];
        objc_msgSend(v21, "setUserInterfaceStyle:", objc_msgSend(v49, "userInterfaceStyle"));

        v50 = [v21 _activitySettingsImage];
        v51 = [(_UIActivityUserDefaultsActivityCell *)v8 activityImageView];
        [v51 setImage:v50];

        v52 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
        [v52 setAlpha:1.0];

        v53 = [v21 activityTitle];
        v54 = _convertToSingleLine(v53);
        v55 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
        [v55 setText:v54];

        v56 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
        [v56 setNumberOfLines:0];

        v57 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
        LODWORD(v58) = 0.5;
        [v57 _setHyphenationFactor:v58];

        goto LABEL_21;
      }
    }
  }
  v23 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
  [v23 setAlpha:1.0];

  v24 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
  [v24 setNumberOfLines:0];

  v25 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
  LODWORD(v26) = 0.5;
  [v25 _setHyphenationFactor:v26];

  v27 = [v18 applicationBundleIdentifier];
  if (v27)
  {
  }
  else
  {
    v28 = [v21 _activityImageUTI];

    if (!v28)
    {
      v59 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
      [v59 setAlpha:0.0];

      v60 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
      [v60 setText:0];

      v61 = [(_UIActivityUserDefaultsActivityCell *)v8 activityImageView];
      [v61 setImage:0];

      LODWORD(v61) = [v18 iconImageSlotID];
      v62 = [v18 activityTitle];
      int v63 = [v62 slotIdentifier];

      v64 = (void *)*MEMORY[0x1E4FB2608];
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_4;
      v74[3] = &unk_1E5A21820;
      int v77 = (int)v61;
      v65 = v8;
      v75 = v65;
      int v78 = v63;
      id v76 = a1[5];
      [v64 _performBlockAfterCATransactionCommits:v74];
      id v66 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v67 = [v66 CGColor];
      v68 = [(_UIActivityUserDefaultsActivityCell *)v65 activityTitleView];
      v69 = [v68 layer];
      [v69 setContentsMultiplyColor:v67];

      goto LABEL_21;
    }
  }
  v72 = v14;
  v29 = [v21 _activityImageUTI];
  v71 = v21;
  if (v29)
  {
    v30 = [v21 activityTitle];
    _convertToSingleLine(v30);
  }
  else
  {
    v30 = [v18 activityTitle];
    v14 = [v30 text];
    _convertToSingleLine(v14);
  v31 = };
  v73 = a1;
  v32 = [(_UIActivityUserDefaultsActivityCell *)v8 activityTitleLabel];
  [v32 setText:v31];

  if (!v29)
  {

    v31 = v14;
  }
  v33 = v7;

  uint64_t v70 = [v18 applicationBundleIdentifier];
  v34 = [v73[4] view];
  v35 = [v34 traitCollection];
  v36 = [v35 preferredContentSizeCategory];

  v37 = [v73[4] view];
  v38 = [v37 traitCollection];
  uint64_t v39 = [v38 userInterfaceStyle];

  v40 = [v73[4] activityImageProvider];
  if (v29)
  {
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_2;
    v82[3] = &unk_1E5A217F8;
    v41 = (id *)&v83;
    v83 = v8;
    v42 = &v84;
    id v84 = v33;
    [v40 requestImageForUTI:v29 activityCategory:1 contentSizeCategory:v36 userInterfaceStyle:v39 iconFormat:0 synchronous:0 resultHandler:v82];
    v43 = (void *)v70;
  }
  else
  {
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_3;
    v79[3] = &unk_1E5A217F8;
    v41 = (id *)&v80;
    v80 = v8;
    v42 = &v81;
    id v81 = v33;
    v43 = (void *)v70;
    [v40 requestImageForBundleIdentifier:v70 activityCategory:1 contentSizeCategory:v36 userInterfaceStyle:v39 iconFormat:0 synchronous:0 resultHandler:v79];
  }

  id v7 = v33;
  v14 = v72;
  a1 = v73;
  v21 = v71;
LABEL_21:
  [a1[4] configureSwitchForCell:v8 activityProxy:v18];
  if (![a1[4] activityCategory])
  {
    v44 = [(_UIActivityUserDefaultsActivityCell *)v8 imageViewWidthConstraint];
    [v44 setConstant:0.0];

    v45 = [(_UIActivityUserDefaultsActivityCell *)v8 imageViewLeadingConstraint];
    [v45 setConstant:0.0];

    v46 = [(_UIActivityUserDefaultsActivityCell *)v8 labelLeadingConstraint];
    [v46 setConstant:0.0];
  }
  return v8;
}

void __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) activityProxy];
  v4 = [v3 identifier];
  int v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) activityImageView];
    [v6 setImage:v7];
  }
}

void __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) activityProxy];
  v4 = [v3 identifier];
  int v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) activityImageView];
    [v6 setImage:v7];
  }
}

void __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id v19 = [MEMORY[0x1E4F39B58] objectForSlot:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = *MEMORY[0x1E4F3A3D0];
  v3 = [*(id *)(a1 + 32) activityImageSlotView];
  v4 = [v3 layer];
  [v4 setContentsGravity:v2];

  int v5 = [*(id *)(a1 + 32) activityImageSlotView];
  v6 = [v5 layer];
  [v6 setContents:v19];

  id v7 = [MEMORY[0x1E4F39B58] objectForSlot:*(unsigned int *)(a1 + 52)];
  double v8 = _ShareSheetDeviceScreenScale();
  v9 = [*(id *)(a1 + 32) activityTitleView];
  v10 = [v9 layer];
  [v10 setContentsScale:v8];

  double v11 = _ShareSheetDeviceScreenScale();
  v12 = [*(id *)(a1 + 32) activityTitleView];
  v13 = [v12 layer];
  [v13 setRasterizationScale:v11];

  uint64_t v14 = *(void *)(a1 + 40);
  int v15 = [*(id *)(a1 + 32) activityTitleView];
  id v16 = [v15 layer];
  [v16 setContentsGravity:v14];

  v17 = [*(id *)(a1 + 32) activityTitleView];
  v18 = [v17 layer];
  [v18 setContents:v7];
}

@end