@interface SBSApplicationShortcutItem(SBHAdditions)
- (id)_assetManager;
- (id)_monogrammerForKey:()SBHAdditions style:;
- (id)badgeView;
- (uint64_t)_darkMonogrammer;
- (uint64_t)_lightMonogrammer;
- (void)_setupAssetManagerWithApplicationBundleURL:()SBHAdditions;
- (void)sb_buildIconImageWithApplicationBundleURL:()SBHAdditions image:systemImageName:;
- (void)setBadgeView:()SBHAdditions;
@end

@implementation SBSApplicationShortcutItem(SBHAdditions)

- (id)badgeView
{
  return objc_getAssociatedObject(a1, "SBSApplicationShortcutItem.BadgeView");
}

- (void)setBadgeView:()SBHAdditions
{
}

- (void)_setupAssetManagerWithApplicationBundleURL:()SBHAdditions
{
  id v9 = a3;
  v4 = [a1 _assetManager];

  if (!v4)
  {
    v5 = [v9 URLByAppendingPathComponent:@"Assets.car"];
    v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1FD8]) initWithURL:v5 idiom:v7 error:0];
    objc_setAssociatedObject(a1, "SBSApplicationShortcutItem.AssetManager", v8, (void *)1);
  }
}

- (id)_assetManager
{
  return objc_getAssociatedObject(a1, "SBSApplicationShortcutItem.AssetManager");
}

- (id)_monogrammerForKey:()SBHAdditions style:
{
  uint64_t v7 = objc_getAssociatedObject(a1, key);
  if (!v7)
  {
    uint64_t v7 = (void *)[objc_alloc((Class)getCNMonogrammerClass()) initWithStyle:a4 diameter:35.0];
    objc_setAssociatedObject(a1, key, v7, (void *)1);
  }
  return v7;
}

- (uint64_t)_lightMonogrammer
{
  return [a1 _monogrammerForKey:"SBSApplicationShortcutItem.Monogrammer.Light" style:2];
}

- (uint64_t)_darkMonogrammer
{
  return [a1 _monogrammerForKey:"SBSApplicationShortcutItem.Monogrammer.Dark" style:3];
}

- (void)sb_buildIconImageWithApplicationBundleURL:()SBHAdditions image:systemImageName:
{
  id v8 = a3;
  id v9 = [a1 icon];
  unint64_t v10 = 0x1E4FA6000uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v11 = [v9 systemImageName];
  }
  else
  {
    uint64_t v11 = 0;
  }
  [a1 _setupAssetManagerWithApplicationBundleURL:v8];
  v12 = [a1 _assetManager];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    v14 = [v13 systemImageName];

    if (v14)
    {
      [v13 systemImageName];
      uint64_t v15 = 0;
      uint64_t v11 = v16 = (void *)v11;
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    v22 = objc_msgSend(v13, "sbh_image");
    v16 = v22;
LABEL_20:
    uint64_t v15 = [v22 imageWithRenderingMode:2];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v9 templateImageName];
    if (!v13)
    {
      uint64_t v15 = 0;
      goto LABEL_22;
    }
    uint64_t v17 = [v12 imageNamed:v13 withTrait:0];
    v16 = (void *)v17;
    if (v8 && !v17)
    {
      v18 = [NSString stringWithFormat:@"%@.png", v13];
      [v8 URLByAppendingPathComponent:v18];
      v19 = v46 = v12;

      v20 = (void *)MEMORY[0x1E4FB1818];
      v21 = [v19 path];
      v16 = [v20 imageWithContentsOfFile:v21];

      unint64_t v10 = 0x1E4FA6000;
      v12 = v46;
    }
    v22 = v16;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    v16 = [v13 imageData];
    if (!v16)
    {
      uint64_t v15 = 0;
      goto LABEL_21;
    }
    uint64_t v23 = [v13 dataType];
    v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v24 scale];
    double v26 = v25;

    v27 = v12;
    if (v23 == 1)
    {
      v40 = SBLogIcon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[SBSApplicationShortcutItem(SBHAdditions) sb_buildIconImageWithApplicationBundleURL:image:systemImageName:](v40);
      }
    }
    else if (!v23)
    {
      v28 = [MEMORY[0x1E4FB1818] imageWithData:v16 scale:v26];
LABEL_49:
      if ([v13 isTemplate]) {
        uint64_t v41 = 2;
      }
      else {
        uint64_t v41 = 1;
      }
      uint64_t v15 = [v28 imageWithRenderingMode:v41];

      v12 = v27;
      unint64_t v10 = 0x1E4FA6000;
      goto LABEL_21;
    }
    v28 = 0;
    goto LABEL_49;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v9;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__SBSApplicationShortcutItem_SBHAdditions__sb_buildIconImageWithApplicationBundleURL_image_systemImageName___block_invoke;
    aBlock[3] = &unk_1E6AB08A8;
    id v49 = v30;
    v31 = _Block_copy(aBlock);
    v32 = [a1 _lightMonogrammer];
    v43 = v31;
    v45 = (*((void (**)(void *, void *))v31 + 2))(v31, v32);

    v33 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
    v44 = [v33 imageConfiguration];

    v34 = [a1 _darkMonogrammer];
    v42 = (*((void (**)(void *, void *))v31 + 2))(v31, v34);

    v35 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    [v35 imageConfiguration];
    v36 = v47 = v12;

    id v37 = objc_alloc_init(MEMORY[0x1E4FB1820]);
    [v37 registerImage:v45 withConfiguration:v44];
    [v37 registerImage:v42 withConfiguration:v36];
    id v38 = objc_alloc_init(MEMORY[0x1E4FB1E20]);
    v39 = [v38 imageConfiguration];
    uint64_t v15 = [v37 imageWithConfiguration:v39];

    unint64_t v10 = 0x1E4FA6000;
    v12 = v47;
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_23:
  if (v11 && !v15)
  {
    uint64_t v15 = [MEMORY[0x1E4FB1818] systemImageNamed:v11];
  }
  if (!v11 || v15)
  {
    if (!(v11 | v15))
    {
      v29 = objc_msgSend(*(id *)(v10 + 2536), "sbh_defaultImage");
      uint64_t v15 = [v29 imageWithRenderingMode:2];
    }
    if (a4) {
      goto LABEL_34;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [MEMORY[0x1E4FB1818] _systemImageNamed:v11];
      if (!a4) {
        goto LABEL_35;
      }
LABEL_34:
      *a4 = (id) v15;
      goto LABEL_35;
    }
    uint64_t v15 = 0;
    if (a4) {
      goto LABEL_34;
    }
  }
LABEL_35:
  if (a5) {
    *a5 = (id) v11;
  }
}

- (void)sb_buildIconImageWithApplicationBundleURL:()SBHAdditions image:systemImageName:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Use SBSApplicationShortcutCustomImageIconDataTypeUIImageData", v1, 2u);
}

@end