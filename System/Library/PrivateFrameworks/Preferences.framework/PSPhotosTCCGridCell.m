@interface PSPhotosTCCGridCell
- (PSPhotosTCCGridCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation PSPhotosTCCGridCell

- (PSPhotosTCCGridCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v47[4] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)PSPhotosTCCGridCell;
  id v37 = a4;
  id v38 = a5;
  v39 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v41, sel_initWithStyle_reuseIdentifier_specifier_, a3, v37);
  if (v39)
  {
    v40 = [(PSPhotosTCCGridCell *)v39 contentView];
    [(PSPhotosTCCGridCell *)v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = objc_alloc_init(MEMORY[0x1E4F42E20]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setAxis:1];
    [v40 addSubview:v7];
    v32 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [v7 topAnchor];
    v35 = [v40 topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:16.0];
    v47[0] = v34;
    v33 = [v7 leadingAnchor];
    v8 = [v40 leadingAnchor];
    v9 = [v33 constraintEqualToAnchor:v8 constant:16.0];
    v47[1] = v9;
    v10 = [v40 trailingAnchor];
    v11 = [v7 trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:16.0];
    v47[2] = v12;
    v13 = [v40 bottomAnchor];
    v14 = [v7 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:12.0];
    v47[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    [v32 activateConstraints:v16];

    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    v17 = (void *)getPXTCCPhotoGridViewClass_softClass;
    uint64_t v46 = getPXTCCPhotoGridViewClass_softClass;
    if (!getPXTCCPhotoGridViewClass_softClass)
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __getPXTCCPhotoGridViewClass_block_invoke;
      v42[3] = &unk_1E5C5D4D8;
      v42[4] = &v43;
      __getPXTCCPhotoGridViewClass_block_invoke((uint64_t)v42);
      v17 = (void *)v44[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v43, 8);
    if (v18)
    {
      v19 = [v18 photoGridViewForSettings];
      v20 = v19;
      if (v19)
      {
        v21 = [v19 layer];
        [v21 setCornerRadius:6.0];

        [v20 setClipsToBounds:1];
        [v7 addArrangedSubview:v20];
        [v7 setCustomSpacing:v20 afterView:12.0];
      }
    }
    id v22 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    v23 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    [v22 setFont:v23];

    [v22 setNumberOfLines:0];
    if (PhotosUICoreLibraryCore_0() && getPXTCCSettingsGridTitleSymbolLoc())
    {
      PXTCCSettingsGridTitleSymbolLoc = (void (*)(void))getPXTCCSettingsGridTitleSymbolLoc();
      if (!PXTCCSettingsGridTitleSymbolLoc) {
        goto LABEL_18;
      }
      v25 = PXTCCSettingsGridTitleSymbolLoc();
      [v22 setText:v25];
    }
    [v7 addArrangedSubview:v22];
    [v7 setCustomSpacing:v22 afterView:2.0];
    id v26 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    v27 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [v26 setFont:v27];

    v28 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v26 setTextColor:v28];

    [v26 setNumberOfLines:0];
    if (!PhotosUICoreLibraryCore_0() || !getPXTCCSettingsGridSubtitleSymbolLoc()) {
      goto LABEL_16;
    }
    PXTCCSettingsGridSubtitleSymbolLoc = (void (*)(void))getPXTCCSettingsGridSubtitleSymbolLoc();
    if (PXTCCSettingsGridSubtitleSymbolLoc)
    {
      v30 = PXTCCSettingsGridSubtitleSymbolLoc();
      [v26 setText:v30];

LABEL_16:
      [v7 addArrangedSubview:v26];

      goto LABEL_17;
    }
LABEL_18:
    -[PSContactsAuthorizationLevelController dealloc]();
    __break(1u);
  }
LABEL_17:

  return v39;
}

@end