@interface UIColor
+ (UIColor)colorWithContentColorPair:(id)a3;
+ (id)fr_accessoryColorForTextColor:(id)a3 backgroundColor:(id)a4;
+ (id)fr_articleNavigationBarBackgroundColor;
+ (id)fr_channelIssuesHeaderColor;
+ (id)fr_collectionBackgroundDefaultGradientEndColor;
+ (id)fr_collectionBackgroundGradientStartColor;
+ (id)fr_colorBetweenGradientColors:(id)a3 andColor:(id)a4 atPosition:(double)a5;
+ (id)fr_colorByInterpolatingFromColor:(id)a3 toColor:(id)a4 percent:(double)a5;
+ (id)fr_colorComponentsFromString:(id)a3;
+ (id)fr_colorWithHue:(double)a3 saturation:(double)a4 lightness:(double)a5 alpha:(double)a6;
+ (id)fr_defaultBarColor;
+ (id)fr_defaultBarTextColor;
+ (id)fr_defaultDarkBarColor;
+ (id)fr_defaultLightBarColor;
+ (id)fr_dynamicColor:(id)a3 withDarkStyleVariant:(id)a4;
+ (id)fr_dynamicDefaultLightBarColor;
+ (id)fr_favoritesBackgroundColor;
+ (id)fr_feedBackgroundColor;
+ (id)fr_feedCellSelectedBackgroundColor;
+ (id)fr_feedDefaultCollectionBackgroundGradientEndColor;
+ (id)fr_feedDefaultCollectionBackgroundGradientStartColor;
+ (id)fr_feedHeadlineNormalExcerptColor;
+ (id)fr_feedHeadlineNormalTitleColor;
+ (id)fr_feedImagePlaceholderColor;
+ (id)fr_feedPremiumArticleCellBackgroundColor;
+ (id)fr_feedSpotlightArticleCellBackgroundColor;
+ (id)fr_feedSwipedCellBackgroundColor;
+ (id)fr_followingInstructionTextColor;
+ (id)fr_forYouMastheadHeaderDecorationBackgroundColor;
+ (id)fr_forYouStoriesHeaderColor;
+ (id)fr_keyColor;
+ (id)fr_keyColorHighlighted;
+ (id)fr_keylineColor;
+ (id)fr_likeDislikeGlyphCellColor;
+ (id)fr_likeLikeGlyphCellColor;
+ (id)fr_linkPreviewBackgroundColor;
+ (id)fr_moreForYouHeaderColor;
+ (id)fr_newStoriesGlyphColor;
+ (id)fr_offlineViewBackgroundColor;
+ (id)fr_offlineViewTextColor;
+ (id)fr_plusDEffectWithForegroundColor:(id)a3 backgroundColor:(id)a4;
+ (id)fr_plusLEffectWithForegroundColor:(id)a3 backgroundColor:(id)a4;
+ (id)fr_purchasingSpinnerViewBackgroundColor;
+ (id)fr_referredUserInterstitialAndWelcomeToNewsRedColor;
+ (id)fr_saveGlyphCellColor;
+ (id)fr_savedStoriesHeaderColor;
+ (id)fr_searchBackgroundColor;
+ (id)fr_searchNoResultsTextColor;
+ (id)fr_searchResultsCellDetailTextColor;
+ (id)fr_searchResultsCellSelectedBackgroundColor;
+ (id)fr_searchResultsCellSelectedTintColor;
+ (id)fr_searchResultsCellTextColor;
+ (id)fr_searchResultsSectionHeaderBackgroundColor;
+ (id)fr_searchResultsSectionHeaderTextColor;
+ (id)fr_subscriptionGlyphColorForTextColor:(id)a3 backgroundColor:(id)a4;
+ (id)fr_subscriptionOnlyTextColor;
+ (id)fr_systemViewTintColor;
+ (id)fr_topicCardBorderColorForDarkBackground;
+ (id)fr_topicCardBorderColorForLightBackground;
+ (id)fr_topicCardBorderColorForParentBackgroundColor:(id)a3;
+ (id)fr_topicCardDividerColorForDarkBackground;
+ (id)fr_topicCardDividerColorForLightBackground;
+ (id)fr_topicCardDividerColorForParentBackgroundColor:(id)a3;
+ (id)fr_topicCardTextColorForDarkBackground;
+ (id)fr_topicCardTextColorForLightBackground;
+ (id)fr_topicCardTextColorForParentBackgroundColor:(id)a3;
+ (id)fr_trendingStoriesHeaderColor;
+ (id)gradientColorForImage:(id)a3;
- (BOOL)isAboutEqualToColor:(id)a3;
- (BOOL)isEqualToColor:(id)a3;
- (BOOL)isSimilarToColor:(id)a3;
- (double)alpha;
- (double)blue;
- (double)brightness;
- (double)green;
- (double)hue;
- (double)red;
- (double)saturation;
- (id)fr_darken:(double)a3;
- (id)fr_desaturate:(double)a3;
- (id)fr_description;
- (id)fr_ensureVisibleOnBackgroundColor:(id)a3;
- (id)fr_legibleForegroundColor;
- (id)fr_lighten:(double)a3;
- (id)fr_offsetWithHue:(double)a3 saturation:(double)a4 lightness:(double)a5 alpha:(double)a6;
- (id)fr_saturate:(double)a3;
- (int64_t)fr_colorBin;
- (int64_t)fr_legibleStatusBarStyle;
- (void)_getHSBA:(id)a3;
- (void)_getRGBA:(id)a3;
- (void)getHue:(double *)a3 saturation:(double *)a4 lightness:(double *)a5 alpha:(double *)a6;
- (void)print;
@end

@implementation UIColor

+ (UIColor)colorWithContentColorPair:(id)a3
{
  id v3 = a3;
  v4 = [v3 lightColor];
  [v4 red];
  double v6 = v5;
  v7 = [v3 lightColor];
  [v7 green];
  double v9 = v8;
  v10 = [v3 lightColor];
  [v10 blue];
  double v12 = v11;
  v13 = [v3 lightColor];
  [v13 alpha];
  v15 = +[UIColor colorWithRed:v6 green:v9 blue:v12 alpha:v14];

  v16 = [v3 darkColor];
  [v16 red];
  double v18 = v17;
  v19 = [v3 darkColor];
  [v19 green];
  double v21 = v20;
  v22 = [v3 darkColor];
  [v22 blue];
  double v24 = v23;
  v25 = [v3 darkColor];

  [v25 alpha];
  v27 = +[UIColor colorWithRed:v18 green:v21 blue:v24 alpha:v26];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100042BA4;
  v32[3] = &unk_1000C8048;
  id v33 = v27;
  id v34 = v15;
  id v28 = v15;
  id v29 = v27;
  v30 = +[UIColor colorWithDynamicProvider:v32];

  return (UIColor *)v30;
}

- (id)fr_legibleForegroundColor
{
  [(UIColor *)self _luminance];
  BOOL v3 = v2 <= 0.7;
  double v4 = 1.0;
  if (!v3) {
    double v4 = 0.0;
  }

  return +[UIColor colorWithWhite:v4 alpha:1.0];
}

- (int64_t)fr_legibleStatusBarStyle
{
  BOOL v3 = +[UITraitCollection currentTraitCollection];
  double v4 = [(UIColor *)self resolvedColorWithTraitCollection:v3];

  [v4 _luminance];
  if (v5 <= 0.7) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = 3;
  }

  return v6;
}

+ (id)fr_colorWithHue:(double)a3 saturation:(double)a4 lightness:(double)a5 alpha:(double)a6
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  FR_HSL_TO_RGB(&v11, &v10, &v9, a3, a4, a5);
  v7 = +[UIColor colorWithRed:v11 green:v10 blue:v9 alpha:a6];

  return v7;
}

- (id)fr_offsetWithHue:(double)a3 saturation:(double)a4 lightness:(double)a5 alpha:(double)a6
{
  uint64_t v18 = 0;
  double v19 = 0.0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  [(UIColor *)self getHue:&v19 saturation:&v18 lightness:&v17 alpha:&v16];
  float v7 = v19 + a3;
  double v8 = fmodf(v7, 1.0);
  FCClamp();
  double v10 = v9;
  FCClamp();
  double v12 = v11;
  FCClamp();
  double v14 = +[UIColor fr_colorWithHue:v8 saturation:v10 lightness:v12 alpha:v13];

  return v14;
}

- (id)fr_saturate:(double)a3
{
  return [(UIColor *)self fr_offsetWithHue:0.0 saturation:a3 lightness:0.0 alpha:0.0];
}

- (id)fr_desaturate:(double)a3
{
  return [(UIColor *)self fr_offsetWithHue:0.0 saturation:-a3 lightness:0.0 alpha:0.0];
}

- (id)fr_lighten:(double)a3
{
  return [(UIColor *)self fr_offsetWithHue:0.0 saturation:0.0 lightness:a3 alpha:0.0];
}

- (id)fr_darken:(double)a3
{
  return [(UIColor *)self fr_offsetWithHue:0.0 saturation:0.0 lightness:-a3 alpha:0.0];
}

- (void)getHue:(double *)a3 saturation:(double *)a4 lightness:(double *)a5 alpha:(double *)a6
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  [(UIColor *)self getRed:&v11 green:&v10 blue:&v9 alpha:a6];
  FR_RGB_TO_HSL(a3, a4, a5, v11, v10, v9);
}

+ (id)fr_systemViewTintColor
{
  if (qword_1000EE1E0 != -1) {
    dispatch_once(&qword_1000EE1E0, &stru_1000C9A28);
  }
  double v2 = (void *)qword_1000EE1D8;

  return v2;
}

+ (id)fr_keyColor
{
  return +[UIColor systemPinkColor];
}

+ (id)fr_keyColorHighlighted
{
  if (qword_1000EE1F0 != -1) {
    dispatch_once(&qword_1000EE1F0, &stru_1000C9A48);
  }
  double v2 = (void *)qword_1000EE1E8;

  return v2;
}

+ (id)fr_subscriptionOnlyTextColor
{
  if (qword_1000EE200 != -1) {
    dispatch_once(&qword_1000EE200, &stru_1000C9A68);
  }
  double v2 = (void *)qword_1000EE1F8;

  return v2;
}

+ (id)fr_savedStoriesHeaderColor
{
  if (qword_1000EE210 != -1) {
    dispatch_once(&qword_1000EE210, &stru_1000C9A88);
  }
  double v2 = (void *)qword_1000EE208;

  return v2;
}

+ (id)fr_forYouStoriesHeaderColor
{
  if (qword_1000EE220 != -1) {
    dispatch_once(&qword_1000EE220, &stru_1000C9AA8);
  }
  double v2 = (void *)qword_1000EE218;

  return v2;
}

+ (id)fr_trendingStoriesHeaderColor
{
  if (qword_1000EE230 != -1) {
    dispatch_once(&qword_1000EE230, &stru_1000C9AC8);
  }
  double v2 = (void *)qword_1000EE228;

  return v2;
}

+ (id)fr_moreForYouHeaderColor
{
  return +[UIColor labelColor];
}

+ (id)fr_channelIssuesHeaderColor
{
  return +[UIColor labelColor];
}

+ (id)fr_defaultBarColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_defaultDarkBarColor
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    id v2 = +[UIColor blackColor];
  }
  else
  {
    if (qword_1000EE240 != -1) {
      dispatch_once(&qword_1000EE240, &stru_1000C9AE8);
    }
    id v2 = (id)qword_1000EE238;
  }

  return v2;
}

+ (id)fr_defaultLightBarColor
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    id v2 = +[UIColor whiteColor];
  }
  else
  {
    if (qword_1000EE250 != -1) {
      dispatch_once(&qword_1000EE250, &stru_1000C9B08);
    }
    id v2 = (id)qword_1000EE248;
  }

  return v2;
}

+ (id)fr_dynamicDefaultLightBarColor
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    if (qword_1000EE260 != -1) {
      dispatch_once(&qword_1000EE260, &stru_1000C9B28);
    }
    id v2 = &qword_1000EE258;
  }
  else
  {
    if (qword_1000EE270 != -1) {
      dispatch_once(&qword_1000EE270, &stru_1000C9B48);
    }
    id v2 = &qword_1000EE268;
  }
  BOOL v3 = (void *)*v2;

  return v3;
}

+ (id)fr_feedBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_feedSwipedCellBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)fr_feedDefaultCollectionBackgroundGradientStartColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_feedDefaultCollectionBackgroundGradientEndColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)fr_feedPremiumArticleCellBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_feedSpotlightArticleCellBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_feedCellSelectedBackgroundColor
{
  if (qword_1000EE280 != -1) {
    dispatch_once(&qword_1000EE280, &stru_1000C9B68);
  }
  id v2 = (void *)qword_1000EE278;

  return v2;
}

+ (id)fr_feedHeadlineNormalTitleColor
{
  return +[UIColor labelColor];
}

+ (id)fr_feedHeadlineNormalExcerptColor
{
  return +[UIColor secondaryLabelColor];
}

+ (id)fr_feedImagePlaceholderColor
{
  if (qword_1000EE290 != -1) {
    dispatch_once(&qword_1000EE290, &stru_1000C9B88);
  }
  id v2 = (void *)qword_1000EE288;

  return v2;
}

+ (id)fr_collectionBackgroundGradientStartColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_collectionBackgroundDefaultGradientEndColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)fr_newStoriesGlyphColor
{
  return +[UIColor labelColor];
}

+ (id)fr_forYouMastheadHeaderDecorationBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_articleNavigationBarBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_defaultBarTextColor
{
  return +[UIColor labelColor];
}

+ (id)fr_linkPreviewBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_searchBackgroundColor
{
  if (qword_1000EE2A0 != -1) {
    dispatch_once(&qword_1000EE2A0, &stru_1000C9BA8);
  }
  id v2 = (void *)qword_1000EE298;

  return v2;
}

+ (id)fr_searchResultsCellSelectedBackgroundColor
{
  if (qword_1000EE2B0 != -1) {
    dispatch_once(&qword_1000EE2B0, &stru_1000C9BC8);
  }
  id v2 = (void *)qword_1000EE2A8;

  return v2;
}

+ (id)fr_searchNoResultsTextColor
{
  if (qword_1000EE2C0 != -1) {
    dispatch_once(&qword_1000EE2C0, &stru_1000C9BE8);
  }
  id v2 = (void *)qword_1000EE2B8;

  return v2;
}

+ (id)fr_searchResultsSectionHeaderBackgroundColor
{
  if (qword_1000EE2D0 != -1) {
    dispatch_once(&qword_1000EE2D0, &stru_1000C9C08);
  }
  id v2 = (void *)qword_1000EE2C8;

  return v2;
}

+ (id)fr_searchResultsSectionHeaderTextColor
{
  if (qword_1000EE2E0 != -1) {
    dispatch_once(&qword_1000EE2E0, &stru_1000C9C28);
  }
  id v2 = (void *)qword_1000EE2D8;

  return v2;
}

+ (id)fr_searchResultsCellTextColor
{
  return +[UIColor labelColor];
}

+ (id)fr_searchResultsCellDetailTextColor
{
  if (qword_1000EE2F0 != -1) {
    dispatch_once(&qword_1000EE2F0, &stru_1000C9C48);
  }
  id v2 = (void *)qword_1000EE2E8;

  return v2;
}

+ (id)fr_searchResultsCellSelectedTintColor
{
  if (qword_1000EE300 != -1) {
    dispatch_once(&qword_1000EE300, &stru_1000C9C68);
  }
  id v2 = (void *)qword_1000EE2F8;

  return v2;
}

+ (id)fr_favoritesBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_keylineColor
{
  if (qword_1000EE310 != -1) {
    dispatch_once(&qword_1000EE310, &stru_1000C9C88);
  }
  id v2 = (void *)qword_1000EE308;

  return v2;
}

+ (id)fr_topicCardBorderColorForDarkBackground
{
  if (qword_1000EE320 != -1) {
    dispatch_once(&qword_1000EE320, &stru_1000C9CA8);
  }
  id v2 = (void *)qword_1000EE318;

  return v2;
}

+ (id)fr_topicCardBorderColorForLightBackground
{
  if (qword_1000EE330 != -1) {
    dispatch_once(&qword_1000EE330, &stru_1000C9CC8);
  }
  id v2 = (void *)qword_1000EE328;

  return v2;
}

+ (id)fr_topicCardBorderColorForParentBackgroundColor:(id)a3
{
  if (objc_msgSend(a3, "fr_colorBin") == (id)2) {
    +[UIColor fr_topicCardBorderColorForDarkBackground];
  }
  else {
  BOOL v3 = +[UIColor fr_topicCardBorderColorForLightBackground];
  }

  return v3;
}

+ (id)fr_topicCardDividerColorForDarkBackground
{
  if (qword_1000EE340 != -1) {
    dispatch_once(&qword_1000EE340, &stru_1000C9CE8);
  }
  id v2 = (void *)qword_1000EE338;

  return v2;
}

+ (id)fr_topicCardDividerColorForLightBackground
{
  if (qword_1000EE350 != -1) {
    dispatch_once(&qword_1000EE350, &stru_1000C9D08);
  }
  id v2 = (void *)qword_1000EE348;

  return v2;
}

+ (id)fr_topicCardDividerColorForParentBackgroundColor:(id)a3
{
  if (objc_msgSend(a3, "fr_colorBin") == (id)2) {
    +[UIColor fr_topicCardDividerColorForDarkBackground];
  }
  else {
  BOOL v3 = +[UIColor fr_topicCardDividerColorForLightBackground];
  }

  return v3;
}

+ (id)fr_topicCardTextColorForDarkBackground
{
  return +[UIColor whiteColor];
}

+ (id)fr_topicCardTextColorForLightBackground
{
  return +[UIColor blackColor];
}

+ (id)fr_topicCardTextColorForParentBackgroundColor:(id)a3
{
  if (objc_msgSend(a3, "fr_colorBin") == (id)2) {
    +[UIColor fr_topicCardTextColorForDarkBackground];
  }
  else {
  BOOL v3 = +[UIColor fr_topicCardTextColorForLightBackground];
  }

  return v3;
}

+ (id)fr_offlineViewTextColor
{
  if (qword_1000EE360 != -1) {
    dispatch_once(&qword_1000EE360, &stru_1000C9D28);
  }
  id v2 = (void *)qword_1000EE358;

  return v2;
}

+ (id)fr_offlineViewBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)fr_purchasingSpinnerViewBackgroundColor
{
  id v2 = +[UIColor colorWithWhite:0.97254902 alpha:1.0];
  BOOL v3 = +[UIColor colorWithWhite:0.0274509804 alpha:1.0];
  double v4 = +[UIColor fr_dynamicColor:v2 withDarkStyleVariant:v3];

  return v4;
}

+ (id)fr_dynamicColor:(id)a3 withDarkStyleVariant:(id)a4
{
  id v5 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000600D4;
  v10[3] = &unk_1000C8048;
  id v11 = a4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v11;
  double v8 = +[UIColor colorWithDynamicProvider:v10];

  return v8;
}

+ (id)fr_colorComponentsFromString:(id)a3
{
  BOOL v3 = [a3 componentsSeparatedByString:@" "];
  if ((unint64_t)[v3 count] < 3)
  {
    double v20 = 0;
  }
  else
  {
    double v4 = [v3 objectAtIndexedSubscript:0];
    [v4 floatValue];
    double v6 = (float)(v5 / 255.0);

    id v7 = [v3 objectAtIndexedSubscript:1];
    [v7 floatValue];
    double v9 = (float)(v8 / 255.0);

    double v10 = [v3 objectAtIndexedSubscript:2];
    [v10 floatValue];
    double v12 = (float)(v11 / 255.0);

    double v13 = 1.0;
    if ((unint64_t)[v3 count] >= 4)
    {
      double v14 = [v3 objectAtIndexedSubscript:3];
      [v14 floatValue];
      double v13 = (float)(v15 / 255.0);
    }
    uint64_t v16 = +[NSNumber numberWithDouble:v6];
    v22[0] = v16;
    uint64_t v17 = +[NSNumber numberWithDouble:v9];
    v22[1] = v17;
    uint64_t v18 = +[NSNumber numberWithDouble:v12];
    v22[2] = v18;
    double v19 = +[NSNumber numberWithDouble:v13];
    v22[3] = v19;
    double v20 = +[NSArray arrayWithObjects:v22 count:4];
  }

  return v20;
}

- (BOOL)isSimilarToColor:(id)a3
{
  return [(UIColor *)self _isSimilarToColor:a3 withinPercentage:0.2];
}

- (BOOL)isAboutEqualToColor:(id)a3
{
  id v4 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000604B4;
  v19[3] = &unk_1000C9D48;
  v19[4] = DeviceRGB;
  double v6 = objc_retainBlock(v19);
  id v7 = ((void (*)(void *, UIColor *))v6[2])(v6, self);
  float v8 = ((void (*)(void *, id))v6[2])(v6, v4);

  CGColorSpaceRelease(DeviceRGB);
  double v17 = 0.0;
  double v18 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  [v7 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  [v8 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
  BOOL v9 = vabdd_f64(v18, v14) < 0.00999999978
    && vabdd_f64(v17, v13) < 0.00999999978
    && vabdd_f64(v16, v12) < 0.00999999978
    && vabdd_f64(v15, v11) < 0.3;

  return v9;
}

- (BOOL)isEqualToColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (self == v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    float v5 = v4;
    if (v4)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100060774;
      v18[3] = &unk_1000C9D48;
      v18[4] = DeviceRGB;
      id v7 = objc_retainBlock(v18);
      float v8 = ((void (*)(void *, UIColor *))v7[2])(v7, self);
      ((void (*)(void *, UIColor *))v7[2])(v7, v5);
      self = (UIColor *)objc_claimAutoreleasedReturnValue();

      CGColorSpaceRelease(DeviceRGB);
      double v16 = 0.0;
      double v17 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      [v8 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
      double v12 = 0.0;
      double v13 = 0.0;
      double v10 = 0.0;
      double v11 = 0.0;
      [(UIColor *)self getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
      LOBYTE(v5) = vcvtad_u64_f64(v17 * 255.0) == vcvtad_u64_f64(v13 * 255.0)
                && vcvtad_u64_f64(v16 * 255.0) == vcvtad_u64_f64(v12 * 255.0)
                && vcvtad_u64_f64(v15 * 255.0) == vcvtad_u64_f64(v11 * 255.0)
                && vabdd_f64(v14, v10) < 0.00999999978;
    }
    else
    {
      self = 0;
    }
  }

  return (char)v5;
}

+ (id)fr_colorByInterpolatingFromColor:(id)a3 toColor:(id)a4 percent:(double)a5
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  id v6 = a4;
  [a3 getRed:&v23 green:&v22 blue:&v21 alpha:&v20];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  [v6 getRed:&v19 green:&v18 blue:&v17 alpha:&v16];

  FCMix();
  double v8 = v7;
  FCMix();
  double v10 = v9;
  FCMix();
  double v12 = v11;
  FCMix();
  double v14 = +[UIColor colorWithRed:v8 green:v10 blue:v12 alpha:v13];

  return v14;
}

- (void)_getRGBA:(id)a3
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  id v4 = (void (**)(void, double, double, double, double))a3;
  [(UIColor *)self getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  v4[2](v4, v8, v7, v6, v5);
}

- (void)_getHSBA:(id)a3
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  id v4 = (void (**)(void, double, double, double, double))a3;
  [(UIColor *)self getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];
  v4[2](v4, v8, v7, v6, v5);
}

- (id)fr_description
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100060B74;
  v12[3] = &unk_1000C9D70;
  id v3 = (id)objc_opt_new();
  id v13 = v3;
  [(UIColor *)self _getRGBA:v12];
  [v3 appendString:@"\n"];
  double v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  double v9 = sub_100060C4C;
  double v10 = &unk_1000C9D70;
  id v11 = v3;
  id v4 = v3;
  [(UIColor *)self _getHSBA:&v7];
  [v4 copy:v7, v8, v9, v10];

  return v5;
}

- (void)print
{
  [(UIColor *)self _getRGBA:&stru_1000C9DB0];

  [(UIColor *)self _getHSBA:&stru_1000C9DD0];
}

- (double)red
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000610B8;
  v4[3] = &unk_1000C9DF8;
  v4[4] = &v5;
  [(UIColor *)self _getRGBA:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)green
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006118C;
  v4[3] = &unk_1000C9DF8;
  v4[4] = &v5;
  [(UIColor *)self _getRGBA:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)blue
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100061260;
  v4[3] = &unk_1000C9DF8;
  v4[4] = &v5;
  [(UIColor *)self _getRGBA:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)alpha
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100061334;
  v4[3] = &unk_1000C9DF8;
  v4[4] = &v5;
  [(UIColor *)self _getRGBA:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)hue
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100061408;
  v4[3] = &unk_1000C9DF8;
  v4[4] = &v5;
  [(UIColor *)self _getHSBA:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)saturation
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000614DC;
  v4[3] = &unk_1000C9DF8;
  v4[4] = &v5;
  [(UIColor *)self _getHSBA:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)brightness
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000615B0;
  v4[3] = &unk_1000C9DF8;
  v4[4] = &v5;
  [(UIColor *)self _getHSBA:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)fr_colorBin
{
  id v3 = +[UIColor whiteColor];
  unsigned __int8 v4 = [(UIColor *)self _isSimilarToColor:v3 withinPercentage:0.2];

  if (v4) {
    return 0;
  }
  [(UIColor *)self _luminance];
  if (v6 > 0.3) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (id)fr_plusLEffectWithForegroundColor:(id)a3 backgroundColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v22 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  double v19 = 0.0;
  if (v5)
  {
    [v5 getRed:&v22 green:&v21 blue:&v20 alpha:&v19];
  }
  else
  {
    uint64_t v7 = +[UIColor blackColor];
    [v7 getRed:&v22 green:&v21 blue:&v20 alpha:&v19];
  }
  double v17 = 0.0;
  double v18 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  if (v6)
  {
    [v6 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
  }
  else
  {
    uint64_t v8 = +[UIColor whiteColor];
    [v8 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
  }
  double v9 = v18 * v15 + v22 * v19;
  if (v9 > 1.0) {
    double v9 = 1.0;
  }
  double v10 = v15 * v17 + v21 * v19;
  if (v10 > 1.0) {
    double v10 = 1.0;
  }
  double v11 = v15 * v16 + v20 * v19;
  if (v11 > 1.0) {
    double v11 = 1.0;
  }
  double v12 = v19 + v15;
  if (v19 + v15 > 1.0) {
    double v12 = 1.0;
  }
  id v13 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v9, v10, v11, v12, *(void *)&v15);

  return v13;
}

+ (id)fr_plusDEffectWithForegroundColor:(id)a3 backgroundColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v26 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  double v23 = 0.0;
  if (v5)
  {
    [v5 getRed:&v26 green:&v25 blue:&v24 alpha:&v23];
  }
  else
  {
    uint64_t v7 = +[UIColor blackColor];
    [v7 getRed:&v26 green:&v25 blue:&v24 alpha:&v23];
  }
  double v21 = 0.0;
  double v22 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  if (v6)
  {
    [v6 getRed:&v22 green:&v21 blue:&v20 alpha:&v19];
  }
  else
  {
    uint64_t v8 = +[UIColor whiteColor];
    [v8 getRed:&v22 green:&v21 blue:&v20 alpha:&v19];
  }
  double v9 = 1.0 - v26 * v23 + 1.0 - v22 * v19;
  if (v9 <= 1.0) {
    double v10 = 1.0 - v9;
  }
  else {
    double v10 = 0.0;
  }
  double v11 = 1.0 - v25 * v23 + 1.0 - v21 * v19;
  if (v11 <= 1.0) {
    double v12 = 1.0 - v11;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = 1.0 - v24 * v23 + 1.0 - v20 * v19;
  if (v13 <= 1.0) {
    double v14 = 1.0 - v13;
  }
  else {
    double v14 = 0.0;
  }
  double v15 = 1.0 - v23 + 1.0 - v19;
  if (v15 <= 1.0) {
    double v16 = 1.0 - v15;
  }
  else {
    double v16 = 0.0;
  }
  double v17 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v10, v12, v14, v16, *(void *)&v19);

  return v17;
}

+ (id)fr_accessoryColorForTextColor:(id)a3 backgroundColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = +[UIColor blackColor];
  if (!v7)
  {
LABEL_3:
    uint64_t v7 = +[UIColor whiteColor];
  }
LABEL_4:
  id v8 = [v5 fr_colorBin];
  if ((unint64_t)v8 >= 2)
  {
    if (v8 != (id)2)
    {
      double v9 = 0;
      double v11 = 0;
      goto LABEL_12;
    }
    double v9 = [v5 colorWithAlphaComponent:0.4];
    uint64_t v10 = +[UIColor fr_plusDEffectWithForegroundColor:v9 backgroundColor:v7];
  }
  else
  {
    double v9 = [v5 colorWithAlphaComponent:0.4];
    uint64_t v10 = +[UIColor fr_plusLEffectWithForegroundColor:v9 backgroundColor:v7];
  }
  double v11 = (void *)v10;
LABEL_12:

  return v11;
}

+ (id)fr_subscriptionGlyphColorForTextColor:(id)a3 backgroundColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 fr_colorBin];
  if ((unint64_t)(v8 - 1) < 2)
  {
    uint64_t v9 = [a1 fr_accessoryColorForTextColor:v6 backgroundColor:v7];
LABEL_5:
    uint64_t v10 = (void *)v9;
    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v9 = +[UIColor colorWithRed:0.960784314 green:0.635294118 blue:0.105882353 alpha:1.0];
    goto LABEL_5;
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

+ (id)fr_likeLikeGlyphCellColor
{
  if (qword_1000EE370 != -1) {
    dispatch_once(&qword_1000EE370, &stru_1000C9E18);
  }
  double v2 = (void *)qword_1000EE368;

  return v2;
}

+ (id)fr_likeDislikeGlyphCellColor
{
  return +[UIColor systemRedColor];
}

+ (id)fr_saveGlyphCellColor
{
  if (qword_1000EE380 != -1) {
    dispatch_once(&qword_1000EE380, &stru_1000C9E38);
  }
  double v2 = (void *)qword_1000EE378;

  return v2;
}

+ (id)fr_colorBetweenGradientColors:(id)a3 andColor:(id)a4 atPosition:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  [v8 red];
  double v10 = v9;
  [v7 red];
  double v12 = v11;
  [v8 red];
  double v14 = v10 + a5 * (v12 - v13);
  [v8 green];
  double v16 = v15;
  [v7 green];
  double v18 = v17;
  [v8 green];
  double v20 = v16 + a5 * (v18 - v19);
  [v8 blue];
  double v22 = v21;
  [v7 blue];
  double v24 = v23;

  [v8 blue];
  double v26 = v25;

  return +[UIColor colorWithRed:v14 green:v20 blue:v22 + a5 * (v24 - v26) alpha:1.0];
}

+ (id)fr_referredUserInterstitialAndWelcomeToNewsRedColor
{
  if (qword_1000EE390 != -1) {
    dispatch_once(&qword_1000EE390, &stru_1000C9E58);
  }
  double v2 = (void *)qword_1000EE388;

  return v2;
}

+ (id)fr_followingInstructionTextColor
{
  if (qword_1000EE3A0 != -1) {
    dispatch_once(&qword_1000EE3A0, &stru_1000C9E78);
  }
  double v2 = (void *)qword_1000EE398;

  return v2;
}

+ (id)gradientColorForImage:(id)a3
{
  return +[UIColor colorWithPatternImage:a3];
}

- (id)fr_ensureVisibleOnBackgroundColor:(id)a3
{
  id v4 = a3;
  [(UIColor *)self _luminance];
  if (v5 >= 0.85 && ([v4 _luminance], v6 >= 0.85))
  {
    double v9 = +[UIColor blackColor];
  }
  else
  {
    [(UIColor *)self _luminance];
    if (v7 <= 0.15 && ([v4 _luminance], v8 <= 0.15))
    {
      double v9 = +[UIColor whiteColor];
    }
    else
    {
      double v9 = self;
    }
  }
  double v10 = v9;

  return v10;
}

@end