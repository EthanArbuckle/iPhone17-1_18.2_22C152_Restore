@interface UIFindNavigatorViewLayout
@end

@implementation UIFindNavigatorViewLayout

void __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke_2;
  v4[3] = &unk_1E52D9EA8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v3 setTitleTextAttributesTransformer:v4];
  objc_destroyWeak(&v5);
}

id __58___UIFindNavigatorViewLayout_commonButtonConfigWithTitle___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained traitCollection];

  v6 = [v5 preferredContentSizeCategory];
  id v7 = objc_loadWeakRetained(v2);
  v8 = [v7 preferredMaximumContentSizeCategory];
  NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v6, v8);

  if (v9 == NSOrderedDescending)
  {
    id v10 = objc_loadWeakRetained(v2);
    v11 = [v10 preferredMaximumContentSizeCategory];
    uint64_t v12 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v11];

    id v5 = (void *)v12;
  }
  v13 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v5];
  v14 = (void *)[v3 mutableCopy];

  [v13 pointSize];
  v15 = objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
  [v14 setObject:v15 forKeyedSubscript:*(void *)off_1E52D2040];

  return v14;
}

void __74___UIFindNavigatorViewLayout_commonButtonConfigWithImageName_isAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[UIImage _systemImageNamed:v2 withConfiguration:0];
  [v3 setImage:v4];
}

@end