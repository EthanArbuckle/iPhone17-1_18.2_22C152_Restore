@interface MusicAppTheme
+ (UIColor)systemLightGrayColor;
+ (double)defaultLibraryAddKeepLocalControlHeight;
+ (id)addButtonImageWithPointSize:(double)a3 traitCollection:(id)a4;
+ (id)cloudDownloadImageForTintColor:(id)a3 pointSize:(double)a4 traitCollection:(id)a5;
+ (id)pauseButtonImageWithTraitCollection:(id)a3;
+ (id)resumeButtonImageWithTraitCollection:(id)a3;
+ (id)stopButtonImageWithTraitCollection:(id)a3;
@end

@implementation MusicAppTheme

+ (double)defaultLibraryAddKeepLocalControlHeight
{
  return 28.0;
}

+ (UIColor)systemLightGrayColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)stopButtonImageWithTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = +[UIImageSymbolConfiguration configurationWithPointSize:8.0];
  v5 = +[UIImage systemImageNamed:@"square.fill" compatibleWithTraitCollection:v3];

  v6 = [v5 imageWithSymbolConfiguration:v4];
  v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

+ (id)pauseButtonImageWithTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = +[UIImageSymbolConfiguration configurationWithPointSize:8.0];
  v5 = +[UIImage systemImageNamed:@"pause.fill" compatibleWithTraitCollection:v3];

  v6 = [v5 imageWithSymbolConfiguration:v4];
  v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

+ (id)resumeButtonImageWithTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = +[UIImageSymbolConfiguration configurationWithPointSize:12.0];
  v5 = +[UIImage systemImageNamed:@"arrow.down" compatibleWithTraitCollection:v3];

  v6 = [v5 imageWithSymbolConfiguration:v4];
  v7 = [v6 imageWithRenderingMode:2];

  return v7;
}

+ (id)addButtonImageWithPointSize:(double)a3 traitCollection:(id)a4
{
  id v5 = a4;
  v6 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:a3];
  v7 = +[UIImage systemImageNamed:@"plus" compatibleWithTraitCollection:v5];

  v8 = [v7 imageWithSymbolConfiguration:v6];
  v9 = [v8 imageWithRenderingMode:2];

  return v9;
}

+ (id)cloudDownloadImageForTintColor:(id)a3 pointSize:(double)a4 traitCollection:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = +[UIImageSymbolConfiguration configurationWithPointSize:a4];
  v10 = +[UIImage systemImageNamed:@"icloud.and.arrow.down" compatibleWithTraitCollection:v7];

  v11 = [v10 imageWithSymbolConfiguration:v9];
  v12 = [v11 flattenedImageWithColor:v8];

  return v12;
}

@end