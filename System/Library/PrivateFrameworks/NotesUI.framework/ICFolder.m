@interface ICFolder
@end

@implementation ICFolder

uint64_t __47__ICFolder_UI__foldersWithHashtagAsOnlyFilter___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 smartFolderQuery];
  v5 = [v3 managedObjectContext];

  v6 = [v4 tagSelectionWithManagedObjectContext:v5];

  v7 = [v6 tagIdentifiers];
  v8 = [*(id *)(a1 + 32) standardizedContent];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v10 = [v7 isEqual:v9];

  return v10;
}

void __42__ICFolder_UI__navigationBarIconWithSize___block_invoke(uint64_t a1)
{
  id v15 = [(id)objc_opt_class() defaultNavigationBarIcon];
  objc_msgSend(v15, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48), 1.0);
  v2 = [*(id *)(a1 + 32) navigationBarIconOverlaySystemImage];
  id v3 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  v4 = [v2 imageWithTintColor:v3];

  double v5 = *(double *)(a1 + 40);
  [v4 size];
  *(float *)&double v6 = (v5 - v6) * 0.5;
  double v7 = roundf(*(float *)&v6);
  double v8 = *(double *)(a1 + 48);
  [v4 size];
  float v10 = v8 - v9 + *(double *)(a1 + 48) / -5.0;
  double v11 = roundf(v10);
  [v4 size];
  double v13 = v12;
  [v4 size];
  objc_msgSend(v4, "drawInRect:blendMode:alpha:", 26, v7, v11, v13, v14, 1.0);
}

@end