@interface MusicAppTheme
+ (CGSize)cloudDownloadImageSizeForTraitCollection:(id)a3;
+ (UIColor)secondaryLabelColor;
+ (UIColor)systemLightGrayColor;
+ (UIColor)titleColor;
+ (double)defaultLibraryAddKeepLocalControlHeight;
+ (id)cloudDownloadImageForTintColor:(id)a3 outlineColor:(id)a4 traitCollection:(id)a5;
- (MusicAppTheme)init;
@end

@implementation MusicAppTheme

+ (UIColor)titleColor
{
  return (UIColor *)sub_1E3D00908((uint64_t)a1, (uint64_t)a2, &qword_1EAE241E0, (void **)&qword_1EAE27A60);
}

+ (UIColor)secondaryLabelColor
{
  return (UIColor *)sub_1E3D00908((uint64_t)a1, (uint64_t)a2, &qword_1EAE241E8, (void **)&qword_1EAE27A68);
}

+ (UIColor)systemLightGrayColor
{
  return (UIColor *)sub_1E3D00908((uint64_t)a1, (uint64_t)a2, &qword_1EAE24208, (void **)&qword_1EAE27A88);
}

+ (double)defaultLibraryAddKeepLocalControlHeight
{
  return 28.0;
}

+ (CGSize)cloudDownloadImageSizeForTraitCollection:(id)a3
{
  id v3 = a3;
  _s10PodcastsUI5ThemeC22cloudDownloadImageSize3forSo6CGSizeVSo17UITraitCollectionC_tFZ_0((uint64_t)v3);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (id)cloudDownloadImageForTintColor:(id)a3 outlineColor:(id)a4 traitCollection:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)static Theme.cloudDownloadImage(forTintColor:outlineColor:traitCollection:)(v8, v9, v10);

  return v11;
}

- (MusicAppTheme)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MusicAppTheme *)&v3 init];
}

@end