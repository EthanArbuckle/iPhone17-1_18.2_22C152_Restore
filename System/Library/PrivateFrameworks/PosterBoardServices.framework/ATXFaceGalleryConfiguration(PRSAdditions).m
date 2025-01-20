@interface ATXFaceGalleryConfiguration(PRSAdditions)
- (PRSPosterGalleryLayout)posterBoardRepresentation;
- (id)initWithPosterBoardRepresentation:()PRSAdditions;
@end

@implementation ATXFaceGalleryConfiguration(PRSAdditions)

- (id)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&off_1EFDA0DB0;
  id v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    v6 = [v4 sections];
    v7 = objc_msgSend(v6, "bs_map:", &__block_literal_global_3);
    [v5 setSections:v7];

    v8 = [v4 locale];
    [v5 setLocale:v8];

    objc_msgSend(v5, "setSource:", objc_msgSend(v4, "source") != 0);
  }

  return v5;
}

- (PRSPosterGalleryLayout)posterBoardRepresentation
{
  v1 = [[PRSPosterGalleryLayout alloc] initWithProactiveRepresentation:a1];
  return v1;
}

@end