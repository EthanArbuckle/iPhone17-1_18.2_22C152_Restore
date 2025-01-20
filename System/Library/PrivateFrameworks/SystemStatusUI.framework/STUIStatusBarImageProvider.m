@interface STUIStatusBarImageProvider
+ (id)sharedProvider;
- (BOOL)_suppressHairlineThickeningForImageName:(id)a3 styleAttributes:(id)a4;
- (UIEdgeInsets)_alignmentInsetsForImageNamed:(id)a3 styleAttributes:(id)a4;
- (id)imageNamed:(id)a3 styleAttributes:(id)a4;
@end

@implementation STUIStatusBarImageProvider

+ (id)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__STUIStatusBarImageProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_44 != -1) {
    dispatch_once(&_MergedGlobals_44, block);
  }
  v2 = (void *)qword_1EC05EF30;
  return v2;
}

uint64_t __44__STUIStatusBarImageProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = qword_1EC05EF30;
  qword_1EC05EF30 = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)imageNamed:(id)a3 styleAttributes:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v8 = [v6 imageNamePrefixes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
  v10 = v7;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v32;
    v10 = v7;
    while (2)
    {
      uint64_t v13 = 0;
      v14 = v10;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        v10 = [*(id *)(*((void *)&v31 + 1) + 8 * v13) stringByAppendingString:v7];

        v15 = [v6 traitCollection];
        v16 = +[STUIStatusBarImage _kitImageNamed:v10 withTrait:v15];

        if (v16)
        {

          goto LABEL_12;
        }
        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = v7;
  v18 = [v6 traitCollection];
  v16 = +[STUIStatusBarImage _kitImageNamed:v17 withTrait:v18];

  v10 = v17;
  if (v16)
  {
LABEL_12:
    [(STUIStatusBarImageProvider *)self _alignmentInsetsForImageNamed:v10 styleAttributes:v6];
    BOOL v25 = v22 == *(double *)(MEMORY[0x1E4FB2848] + 8)
       && v19 == *MEMORY[0x1E4FB2848]
       && v21 == *(double *)(MEMORY[0x1E4FB2848] + 24)
       && v20 == *(double *)(MEMORY[0x1E4FB2848] + 16);
    if (v25
      || (objc_msgSend(v16, "imageWithAlignmentRectInsets:"),
          uint64_t v26 = objc_claimAutoreleasedReturnValue(),
          v16,
          (v16 = (void *)v26) != 0))
    {
      if (![(STUIStatusBarImageProvider *)self _suppressHairlineThickeningForImageName:v10 styleAttributes:v6])goto LABEL_28; {
      uint64_t v27 = [v16 _imageThatSuppressesAccessibilityHairlineThickening];
      }

      v16 = (void *)v27;
      if (v27) {
        goto LABEL_28;
      }
    }
  }
  v28 = _STUIStatusBar_Log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v7;
    _os_log_impl(&dword_1D7E39000, v28, OS_LOG_TYPE_ERROR, "No image for name %@", buf, 0xCu);
  }

  v16 = 0;
LABEL_28:

  return v16;
}

- (UIEdgeInsets)_alignmentInsetsForImageNamed:(id)a3 styleAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = *MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ([v5 isEqualToString:@"Large_Bolt"])
  {
    UIEdgeInsetsAdd();
    [v6 effectiveLayoutDirection];
  }
  else if (![v5 isEqualToString:@"Split_SOS"])
  {
    goto LABEL_5;
  }
  UIEdgeInsetsAdd();
  double v7 = v11;
  double v8 = v12;
  double v9 = v13;
  double v10 = v14;
LABEL_5:
  v15 = [v6 traitCollection];
  [v15 displayScale];
  double v17 = v16;

  if (v17 != 3.0)
  {
    UIRoundToScale();
    double v7 = v18;
    UIRoundToScale();
    double v8 = v19;
    UIRoundToScale();
    double v9 = v20;
    UIRoundToScale();
    double v10 = v21;
  }

  double v22 = v7;
  double v23 = v8;
  double v24 = v9;
  double v25 = v10;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (BOOL)_suppressHairlineThickeningForImageName:(id)a3 styleAttributes:(id)a4
{
  return 1;
}

@end