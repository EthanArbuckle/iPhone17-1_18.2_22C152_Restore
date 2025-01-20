@interface UIFont(PhotosUICoreCore)
+ (id)px_defaultFontForTextStyle:()PhotosUICoreCore withSymbolicTraits:;
+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore contentSizeCategory:withSymbolicTraits:;
+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore maxContentSizeCategory:withSymbolicTraits:;
+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore withSymbolicTraits:options:;
@end

@implementation UIFont(PhotosUICoreCore)

+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore withSymbolicTraits:options:
{
  v0 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
  v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore maxContentSizeCategory:withSymbolicTraits:
{
  id v7 = a3;
  v8 = a4;
  if ((NSString *)*MEMORY[0x1E4FB27F0] == v8
    || ([MEMORY[0x1E4FB1438] sharedApplication],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 preferredContentSizeCategory],
        v10 = (NSString *)objc_claimAutoreleasedReturnValue(),
        NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory(v10, v8),
        v10,
        v9,
        v11 != NSOrderedDescending))
  {
    v16 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_defaultFontForTextStyle:withSymbolicTraits:", v7, a5);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4FB08E8];
    v13 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v8];
    v14 = [v12 preferredFontDescriptorWithTextStyle:v7 compatibleWithTraitCollection:v13];

    v15 = [v14 fontDescriptorWithSymbolicTraits:a5];

    v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v15 size:0.0];
  }
  return v16;
}

+ (id)px_defaultFontForTextStyle:()PhotosUICoreCore withSymbolicTraits:
{
  v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:a4 options:0];
  v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)px_preferredFontForTextStyle:()PhotosUICoreCore contentSizeCategory:withSymbolicTraits:
{
  id v9 = a3;
  id v10 = a4;
  if ((id)*MEMORY[0x1E4FB27F0] == v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"UIFont+PhotosUICore.m", 25, @"Invalid parameter not satisfying: %@", @"contentSizeCategory != UIContentSizeCategoryUnspecified" object file lineNumber description];
  }
  NSComparisonResult v11 = (void *)MEMORY[0x1E4FB08E8];
  v12 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v10];
  v13 = [v11 preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:v12];

  v14 = [v13 fontDescriptorWithSymbolicTraits:a5];

  v15 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v14 size:0.0];

  return v15;
}

@end