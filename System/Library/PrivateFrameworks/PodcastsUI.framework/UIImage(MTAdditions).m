@interface UIImage(MTAdditions)
+ (id)backCatalogIconForDarkBackground:()MTAdditions;
+ (id)backCatalogIconForTheme:()MTAdditions;
+ (id)backCatalogIconForTintColor:()MTAdditions;
+ (id)backCatalogPartiallyPlayedIconForDarkBackground:()MTAdditions;
+ (id)backCatalogPartiallyPlayedIconForTheme:()MTAdditions;
+ (id)backCatalogPartiallyPlayedIconForTintColor:()MTAdditions;
+ (id)combineImages:()MTAdditions rowCount:size:border:;
+ (id)defaultPodcastArtwork;
+ (id)defaultPodcastArtworkWithWidth:()MTAdditions;
+ (id)halfPlayedIconForDarkBackground:()MTAdditions;
+ (id)infoIcon;
+ (id)multiCheckIcon;
+ (id)multiUncheckIcon;
+ (id)nowPlayingIcon;
+ (id)nowPlayingIconPaused;
+ (id)unplayedIconForDarkBackground:()MTAdditions;
+ (uint64_t)halfPlayedIcon;
+ (uint64_t)halfPlayedIconForTheme:()MTAdditions;
+ (uint64_t)playedIcon;
+ (uint64_t)unplayedIcon;
+ (uint64_t)unplayedIconForTheme:()MTAdditions;
+ (void)drawBorder:()MTAdditions withContext:;
- (CGContext)scaleToSize:()MTAdditions addBorder:;
@end

@implementation UIImage(MTAdditions)

+ (id)defaultPodcastArtwork
{
  if ([MEMORY[0x1E4F91FC8] isRunningOnTV]) {
    v0 = @"missingartwork";
  }
  else {
    v0 = @"defaultCoverImage";
  }
  v1 = [MEMORY[0x1E4FB1818] imageNamed:v0];

  return v1;
}

+ (id)nowPlayingIcon
{
  if (nowPlayingIcon_onceToken != -1) {
    dispatch_once(&nowPlayingIcon_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)nowPlayingIcon_templateNowPlayingIcon;

  return v0;
}

+ (id)nowPlayingIconPaused
{
  if (nowPlayingIconPaused_onceToken != -1) {
    dispatch_once(&nowPlayingIconPaused_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)nowPlayingIconPaused_templateNowPlayingIcon;

  return v0;
}

+ (uint64_t)unplayedIcon
{
  return [a1 unplayedIconForTheme:0];
}

+ (uint64_t)unplayedIconForTheme:()MTAdditions
{
  uint64_t v4 = [a3 isBackgroundDark];

  return [a1 unplayedIconForDarkBackground:v4];
}

+ (id)unplayedIconForDarkBackground:()MTAdditions
{
  if (unplayedIconForDarkBackground__onceToken != -1) {
    dispatch_once(&unplayedIconForDarkBackground__onceToken, &__block_literal_global_14);
  }
  v0 = (void *)unplayedIconForDarkBackground__strokedUnplayedIcon;

  return v0;
}

+ (uint64_t)halfPlayedIcon
{
  return [a1 halfPlayedIconForTheme:0];
}

+ (uint64_t)halfPlayedIconForTheme:()MTAdditions
{
  uint64_t v4 = [a3 isBackgroundDark];

  return [a1 halfPlayedIconForDarkBackground:v4];
}

+ (id)halfPlayedIconForDarkBackground:()MTAdditions
{
  if (halfPlayedIconForDarkBackground__onceToken != -1) {
    dispatch_once(&halfPlayedIconForDarkBackground__onceToken, &__block_literal_global_19);
  }
  v0 = (void *)halfPlayedIconForDarkBackground__strokedHalfPlayedIcon;

  return v0;
}

+ (id)backCatalogIconForTheme:()MTAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1618], "secondaryTextColorForTheme:");
  v3 = [a1 backCatalogIconForTintColor:v2];

  return v3;
}

+ (id)backCatalogIconForDarkBackground:()MTAdditions
{
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:(double)a3 alpha:0.5];
  v5 = [a1 backCatalogIconForTintColor:v4];

  return v5;
}

+ (id)backCatalogIconForTintColor:()MTAdditions
{
  id v3 = a3;
  if (backCatalogIconForTintColor__onceToken != -1) {
    dispatch_once(&backCatalogIconForTintColor__onceToken, &__block_literal_global_25);
  }
  id v4 = (id)backCatalogIconForTintColor__tintedIcons;
  objc_sync_enter(v4);
  v5 = [(id)backCatalogIconForTintColor__tintedIcons objectForKeyedSubscript:v3];
  if (!v5)
  {
    v6 = (void *)backCatalogIconForTintColor__tintedIcons;
    v5 = objc_msgSend((id)backCatalogIconForTintColor__untintedIcon, "im_flatImageWithColor:", v3);
    [v6 setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

+ (id)backCatalogPartiallyPlayedIconForTheme:()MTAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1618], "secondaryTextColorForTheme:");
  id v3 = [a1 backCatalogPartiallyPlayedIconForTintColor:v2];

  return v3;
}

+ (id)backCatalogPartiallyPlayedIconForDarkBackground:()MTAdditions
{
  id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:(double)a3 alpha:0.5];
  v5 = [a1 backCatalogPartiallyPlayedIconForTintColor:v4];

  return v5;
}

+ (id)backCatalogPartiallyPlayedIconForTintColor:()MTAdditions
{
  id v3 = a3;
  if (backCatalogPartiallyPlayedIconForTintColor__onceToken != -1) {
    dispatch_once(&backCatalogPartiallyPlayedIconForTintColor__onceToken, &__block_literal_global_31);
  }
  id v4 = (id)backCatalogPartiallyPlayedIconForTintColor__tintedIcons;
  objc_sync_enter(v4);
  v5 = [(id)backCatalogPartiallyPlayedIconForTintColor__tintedIcons objectForKeyedSubscript:v3];
  if (!v5)
  {
    v6 = (void *)backCatalogPartiallyPlayedIconForTintColor__tintedIcons;
    v5 = objc_msgSend((id)backCatalogPartiallyPlayedIconForTintColor__untintedIcon, "im_flatImageWithColor:", v3);
    [v6 setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

+ (uint64_t)playedIcon
{
  return 0;
}

+ (id)multiCheckIcon
{
  if (multiCheckIcon_onceToken != -1) {
    dispatch_once(&multiCheckIcon_onceToken, &__block_literal_global_36_0);
  }
  v0 = (void *)multiCheckIcon_templateMultiCheckIcon;

  return v0;
}

+ (id)multiUncheckIcon
{
  if (multiUncheckIcon_onceToken != -1) {
    dispatch_once(&multiUncheckIcon_onceToken, &__block_literal_global_41);
  }
  v0 = (void *)multiUncheckIcon_templateMultiUncheckIcon;

  return v0;
}

+ (id)infoIcon
{
  if (infoIcon_onceToken != -1) {
    dispatch_once(&infoIcon_onceToken, &__block_literal_global_46_0);
  }
  v0 = (void *)infoIcon_templateInfoIcon;

  return v0;
}

+ (id)defaultPodcastArtworkWithWidth:()MTAdditions
{
  if (a2 <= 51.0) {
    [MEMORY[0x1E4FB1818] imageNamed:@"defaultCoverImageSmall"];
  }
  else {
  v2 = [a1 defaultPodcastArtwork];
  }

  return v2;
}

+ (void)drawBorder:()MTAdditions withContext:
{
  v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v12 scale];
  double v14 = 1.0 / v13;

  CGContextSetRGBFillColor(a7, 0.0, 0.0, 0.0, 0.18);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = v14;
  CGContextFillRect(a7, v20);
  v21.origin.x = a1;
  v21.origin.y = a2 + v14;
  v21.size.width = v14;
  v21.size.height = a4 + v14 * -2.0;
  CGContextFillRect(a7, v21);
  v22.origin.x = a1 + a3 - v14;
  v22.origin.y = a2 + v14;
  v22.size.width = v14;
  v22.size.height = a4 + v14 * -2.0;
  CGContextFillRect(a7, v22);
  CGFloat v16 = a1;
  double v17 = a4;
  double v18 = v14;

  CGFloat v15 = a2 + a4 - v14;
  CGContextFillRect(a7, *(CGRect *)&v16);
}

+ (id)combineImages:()MTAdditions rowCount:size:border:
{
  id v10 = a5;
  v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  CGFloat v13 = v12;
  v31.width = a2;
  v31.height = a3;
  UIGraphicsBeginImageContextWithOptions(v31, 0, v13);

  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    CGFloat v15 = CurrentContext;
    CGContextTranslateCTM(CurrentContext, 0.0, a3);
    CGContextScaleCTM(v15, 1.0, -1.0);
    if ([v10 count])
    {
      int64_t v16 = 0;
      double v17 = a3 / (double)a6 + -2.0;
      do
      {
        double v18 = [v10 objectAtIndex:v16];
        int v19 = v16 + -(int)a6 * (v16 / a6);
        double v20 = v17 * (double)(int)(v16 / a6);
        double v21 = v17 * (double)v19;
        double v22 = (double)(4 * v19);
        if (v21 <= 0.0) {
          double v22 = -0.0;
        }
        double v23 = v21 + v22;
        double v24 = (double)(int)(4 * (v16 / a6));
        if (v20 <= 0.0) {
          double v24 = -0.0;
        }
        CGFloat v25 = v20 + v24;
        id v26 = v18;
        v27 = (CGImage *)[v26 CGImage];
        v32.origin.x = v23;
        v32.origin.y = v25;
        v32.size.width = v17;
        v32.size.height = v17;
        CGContextDrawImage(v15, v32, v27);
        objc_msgSend(a1, "drawBorder:withContext:", v15, v23, v25, v17, v17);

        ++v16;
      }
      while ([v10 count] > (unint64_t)v16);
    }
    v28 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (CGContext)scaleToSize:()MTAdditions addBorder:
{
  v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  CGFloat v11 = v10;
  v20.width = a2;
  v20.height = a3;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v11);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGFloat v13 = CurrentContext;
  if (CurrentContext)
  {
    CGContextTranslateCTM(CurrentContext, 0.0, a3);
    CGContextScaleCTM(v13, 1.0, -1.0);
    double v14 = (CGImage *)[a1 CGImage];
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = a2;
    v21.size.height = a3;
    CGContextDrawImage(v13, v21, v14);
    if (a5)
    {
      CGFloat v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v15 scale];
      CGFloat v17 = 1.0 / v16;

      CGContextSetRGBFillColor(v13, 0.0, 0.0, 0.0, 0.18);
      v22.origin.x = 0.0;
      v22.origin.y = 0.0;
      v22.size.width = a2;
      v22.size.height = v17;
      CGContextFillRect(v13, v22);
      v23.origin.x = 0.0;
      v23.origin.y = v17;
      v23.size.width = v17;
      v23.size.height = a3 + v17 * -2.0;
      CGContextFillRect(v13, v23);
      v24.origin.x = a2 - v17;
      v24.origin.y = v17;
      v24.size.width = v17;
      v24.size.height = a3 + v17 * -2.0;
      CGContextFillRect(v13, v24);
      v25.origin.y = a3 - v17;
      v25.origin.x = 0.0;
      v25.size.width = a2;
      v25.size.height = v17;
      CGContextFillRect(v13, v25);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    CGFloat v13 = (CGContext *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v13;
}

@end