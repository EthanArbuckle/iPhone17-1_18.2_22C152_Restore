@interface PUIContactsPrivacySettingsInsetView
- (PUIContactsPrivacySettingsInsetView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation PUIContactsPrivacySettingsInsetView

- (PUIContactsPrivacySettingsInsetView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)PUIContactsPrivacySettingsInsetView;
  id v27 = a4;
  id v28 = a5;
  v30 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v32, sel_initWithStyle_reuseIdentifier_specifier_, a3, v27);
  if (v30)
  {
    v31 = [(PUIContactsPrivacySettingsInsetView *)v30 contentView];
    [(PUIContactsPrivacySettingsInsetView *)v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setAxis:1];
    objc_msgSend(v7, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    [v7 setLayoutMarginsRelativeArrangement:1];
    [v31 addSubview:v7];
    id v29 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v29 setAxis:1];
    objc_msgSend(v29, "setLayoutMargins:", 15.0, 15.0, 10.0, 15.0);
    [v29 setLayoutMarginsRelativeArrangement:1];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [v7 topAnchor];
    v25 = [v31 topAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v38[0] = v24;
    v23 = [v7 leadingAnchor];
    v8 = [v31 leadingAnchor];
    v9 = [v23 constraintEqualToAnchor:v8];
    v38[1] = v9;
    v10 = [v7 trailingAnchor];
    v11 = [v31 trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v38[2] = v12;
    v13 = [v7 bottomAnchor];
    v14 = [v31 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v38[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    [v22 activateConstraints:v16];

    if (objc_opt_class())
    {
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2050000000;
      v17 = (void *)getCNContactGroupVisualizerClass_softClass;
      uint64_t v37 = getCNContactGroupVisualizerClass_softClass;
      if (!getCNContactGroupVisualizerClass_softClass)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __getCNContactGroupVisualizerClass_block_invoke;
        v33[3] = &unk_1E6E9C7F8;
        v33[4] = &v34;
        __getCNContactGroupVisualizerClass_block_invoke((uint64_t)v33);
        v17 = (void *)v35[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v34, 8);
      v19 = [v18 allContactsSettingsViewController];
      v20 = [v19 view];
      [v7 addArrangedSubview:v20];
    }
  }

  return v30;
}

@end