@interface _UIStatusBarImageProvider
+ (id)sharedProvider;
- (BOOL)_suppressHairlineThickeningForImageName:(id)a3 styleAttributes:(id)a4;
- (UIEdgeInsets)_alignmentInsetsForImageNamed:(id)a3 styleAttributes:(id)a4;
- (id)imageNamed:(id)a3 styleAttributes:(id)a4;
@end

@implementation _UIStatusBarImageProvider

+ (id)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___UIStatusBarImageProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1228 != -1) {
    dispatch_once(&_MergedGlobals_1228, block);
  }
  v2 = (void *)qword_1EB262FC8;
  return v2;
}

- (id)imageNamed:(id)a3 styleAttributes:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = [v6 imageNamePrefixes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
  v10 = v7;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v29;
    v10 = v7;
    while (2)
    {
      uint64_t v13 = 0;
      v14 = v10;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v8);
        }
        v10 = [*(id *)(*((void *)&v28 + 1) + 8 * v13) stringByAppendingString:v7];

        v15 = [v6 traitCollection];
        v16 = +[_UIStatusBarImage _kitImageNamed:v10 withTrait:v15];

        if (v16)
        {

          goto LABEL_12;
        }
        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = v7;
  v18 = [v6 traitCollection];
  v16 = +[_UIStatusBarImage _kitImageNamed:v17 withTrait:v18];

  v10 = v17;
  if (v16)
  {
LABEL_12:
    [(_UIStatusBarImageProvider *)self _alignmentInsetsForImageNamed:v10 styleAttributes:v6];
    if (v22 == 0.0 && v19 == 0.0 && v21 == 0.0 && v20 == 0.0
      || (objc_msgSend(v16, "imageWithAlignmentRectInsets:"),
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          v16,
          (v16 = (void *)v23) != 0))
    {
      if (![(_UIStatusBarImageProvider *)self _suppressHairlineThickeningForImageName:v10 styleAttributes:v6])goto LABEL_22; {
      uint64_t v24 = [v16 _imageThatSuppressesAccessibilityHairlineThickening];
      }

      v16 = (void *)v24;
      if (v24) {
        goto LABEL_22;
      }
    }
  }
  v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("StatusBar", &imageNamed_styleAttributes____s_category) + 8);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v7;
    _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "No image for name %@", buf, 0xCu);
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (UIEdgeInsets)_alignmentInsetsForImageNamed:(id)a3 styleAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"Large_Bolt"])
  {
    uint64_t v7 = [v6 effectiveLayoutDirection];
    double v8 = -1.33333333;
    double v9 = 0.0;
    if (v7 == 1) {
      double v10 = -1.33333333;
    }
    else {
      double v10 = 0.0;
    }
    if (v7 == 1) {
      double v8 = 0.0;
    }
    double v11 = v8 + 0.0;
    double v12 = 1.66666667;
    double v13 = v10 + 0.0;
  }
  else
  {
    double v13 = 0.0;
    if ([v5 isEqualToString:@"Split_SOS"]) {
      double v12 = -0.666666667;
    }
    else {
      double v12 = 0.0;
    }
    double v11 = 0.0;
    double v9 = 0.0;
  }
  v14 = [v6 traitCollection];
  [v14 displayScale];
  double v16 = v15;

  if (v16 != 3.0)
  {
    UIRoundToScale(0.0, v16);
    double v9 = v17;
    UIRoundToScale(v11, v16);
    double v11 = v18;
    UIRoundToScale(v12, v16);
    double v12 = v19;
    UIRoundToScale(v13, v16);
    double v13 = v20;
  }

  double v21 = v9;
  double v22 = v11;
  double v23 = v12;
  double v24 = v13;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (BOOL)_suppressHairlineThickeningForImageName:(id)a3 styleAttributes:(id)a4
{
  return 1;
}

@end