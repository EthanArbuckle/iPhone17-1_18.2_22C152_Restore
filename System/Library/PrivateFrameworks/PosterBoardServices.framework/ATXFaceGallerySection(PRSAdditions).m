@interface ATXFaceGallerySection(PRSAdditions)
- (PRSPosterGallerySection)posterBoardRepresentation;
- (id)initWithPosterBoardRepresentation:()PRSAdditions;
@end

@implementation ATXFaceGallerySection(PRSAdditions)

- (id)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&off_1EFDA30B8;
  id v5 = objc_msgSendSuper2(&v17, sel_init);
  if (v5)
  {
    v6 = [v4 localizedTitle];
    [v5 setLocalizedTitle:v6];

    v7 = [v4 symbolImageName];
    [v5 setSymbolImageName:v7];

    v8 = [v4 symbolColorName];
    [v5 setSymbolColorName:v8];

    v9 = [v4 localizedSubtitle];
    [v5 setLocalizedSubtitle:v9];

    v10 = [v4 localizedDescriptiveText];
    [v5 setLocalizedDescriptiveText:v10];

    v11 = [v4 unityDescription];
    [v5 setUnityDescription:v11];

    uint64_t v12 = [v4 type];
    if ((unint64_t)(v12 - 1) >= 3) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    [v5 setType:v13];
    v14 = [v4 items];
    v15 = objc_msgSend(v14, "bs_map:", &__block_literal_global_12);
    [v5 setItems:v15];
  }
  return v5;
}

- (PRSPosterGallerySection)posterBoardRepresentation
{
  v1 = [[PRSPosterGallerySection alloc] initWithProactiveRepresentation:a1];
  return v1;
}

@end