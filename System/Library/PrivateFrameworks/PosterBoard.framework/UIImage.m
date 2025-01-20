@interface UIImage
@end

@implementation UIImage

void __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 32) / 5.0);
  v2 = (void *)pbf_galleryPosterWithColor_scale__path;
  pbf_galleryPosterWithColor_scale__path = v1;
}

uint64_t __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setFill];
  uint64_t v1 = (void *)pbf_galleryPosterWithColor_scale__path;
  return [v1 fill];
}

void __97__UIImage_PBFUtilities__pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4F8C0]) initWithUniqueIdentifier:@"Gallery Hero image cache"];
  uint64_t v1 = (void *)pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__heroCache;
  pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__heroCache = v0;
}

id __97__UIImage_PBFUtilities__pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext___block_invoke_2(void *a1)
{
  v2 = [NSString stringWithFormat:@"%@_%@", a1[4], a1[5]];
  v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "pbf_traitCollectionCompatibleWithContext:", a1[6]);
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v4 imageNamed:v2 inBundle:v5 compatibleWithTraitCollection:v3];

  return v6;
}

@end