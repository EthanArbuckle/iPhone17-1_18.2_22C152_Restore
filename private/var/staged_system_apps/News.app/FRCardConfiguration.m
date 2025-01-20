@interface FRCardConfiguration
+ (CGSize)textMargin;
+ (double)bannerHeightForWidth:(double)a3;
+ (id)_gradientCGColors;
+ (id)cardConfiguration;
- (CGRect)bannerFrameForSize:(CGSize)a3;
- (CGRect)topicFrameForSize:(CGSize)a3;
- (CGRect)topicTextRect:(id)a3 cardSize:(CGSize)a4 textPadPath:(id *)a5;
- (CGSize)itemSizeForCollectionViewBounds:(CGRect)a3 isCompact:(BOOL)a4 orientation:(int64_t)a5;
- (CGSize)topicTextSize:(id)a3 cardSize:(CGSize)a4;
- (CGSize)topicTitleTextSize:(id)a3 cardSize:(CGSize)a4;
- (FRCardConfiguration)init;
- (FRCardConfigurationCache)cache;
- (UIEdgeInsets)gridInsetsForWidth:(double)a3;
- (UIEdgeInsets)insetsForCollectionViewBounds:(CGRect)a3;
- (UIEdgeInsets)logoInsetsForBannerSize:(CGSize)a3 logoAspectRatio:(double)a4;
- (double)_fontSizeForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4;
- (double)_fontSizeForTopicTitleWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4;
- (double)_kerningFeedsWhenInCardsOfSize:(CGSize)a3 isChannel:(BOOL)a4 sizeCategory:(id)a5;
- (double)cardCornerRadius;
- (double)gridSpacingForWidth:(double)a3;
- (double)horizontalDividerWidthForCardSize:(CGSize)a3;
- (double)insetForFeed:(id)a3 sizeCategory:(id)a4;
- (double)kerningForChannelFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4;
- (double)kerningForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4;
- (double)lineHeightForSize:(CGSize)a3;
- (double)materialBlurRadius;
- (double)materialColorAlpha;
- (double)spaceBetweenHorizontalDividerAndTopicNameForCardSize:(CGSize)a3;
- (double)spaceBetweenTopicTitleAndHorizontalDividerForCardSize:(CGSize)a3;
- (double)topicTitleTopMarginForCardSize:(CGSize)a3;
- (id)_placeholderOfSize:(CGSize)a3 withChin:(BOOL)a4;
- (id)attributedStringForTag:(id)a3 boundsSize:(CGSize)a4 sizeCategory:(id)a5;
- (id)fontForChannelFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4;
- (id)fontForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4;
- (id)gradientLayerWithChin:(BOOL)a3;
- (id)placeholderChannelImageForCardOfSize:(CGSize)a3;
- (id)placeholderTopicImageForCardOfSize:(CGSize)a3;
- (id)textColorForTag:(id)a3;
- (id)topicTextAttributesForCardSize:(CGSize)a3 textColor:(id)a4 sizeCategory:(id)a5;
- (id)topicTitleAttributesForCardSize:(CGSize)a3 textColor:(id)a4 sizeCategory:(id)a5;
- (unint64_t)numberOfColumnsForCollectionViewBounds:(CGRect)a3 isCompact:(BOOL)a4 orientation:(int64_t)a5;
- (void)prewarmConfigurationForCardSize:(CGSize)a3 sizeCategory:(id)a4;
- (void)setCache:(id)a3;
@end

@implementation FRCardConfiguration

+ (id)cardConfiguration
{
  if (qword_1000EE1C0 != -1) {
    dispatch_once(&qword_1000EE1C0, &stru_1000C99E8);
  }
  v2 = (void *)qword_1000EE1B8;

  return v2;
}

- (FRCardConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)FRCardConfiguration;
  v2 = [(FRCardConfiguration *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(FRCardConfigurationCache);
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    *(_OWORD *)(v2 + 8) = xmmword_1000BD3E0;
    *((void *)v2 + 3) = 0x3FF0000000000000;
  }
  return (FRCardConfiguration *)v2;
}

+ (double)bannerHeightForWidth:(double)a3
{
  return ceil(a3 * 4.0 / 3.0 - a3);
}

- (double)insetForFeed:(id)a3 sizeCategory:(id)a4
{
  id v5 = a4;
  objc_super v6 = [a3 backingTag];
  v7 = [v6 theme];
  v8 = [v7 bannerImageForMask];
  v9 = [v8 assetHandle];
  BOOL v10 = v9 == 0;

  v11 = +[FRDynamicTypeValueScaler valueSpecifierWithXS:dbl_1000BD3F0[v10] L:dbl_1000BD3F0[v10] XXXL:dbl_1000BD3F0[v10] * 0.5 AXXXL:dbl_1000BD3F0[v10] * 0.25];
  [v11 scaledValueForSizeCategory:v5];
  double v13 = v12;

  return v13;
}

- (double)lineHeightForSize:(CGSize)a3
{
  BOOL v3 = a3.width <= 140.0;
  double result = 11.0;
  if (!v3) {
    return 15.0;
  }
  return result;
}

- (double)_fontSizeForTopicTitleWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double width = a3.width;
  double result = 14.0;
  if (width <= 200.0)
  {
    double result = 12.0;
    if (width <= 140.0)
    {
      if (width <= 120.0)
      {
        double result = 8.5;
        if (width > 110.0) {
          return 10.0;
        }
      }
      else
      {
        return 11.33;
      }
    }
  }
  return result;
}

- (double)_fontSizeForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double width = a3.width;
  double result = 16.0;
  if (width <= 200.0)
  {
    double result = 14.0;
    if (width <= 140.0)
    {
      if (width <= 120.0)
      {
        double result = 10.5;
        if (width > 110.0) {
          return 12.0;
        }
      }
      else
      {
        return 13.33;
      }
    }
  }
  return result;
}

- (id)fontForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  -[FRCardConfiguration _fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "_fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:", a4, a3.width, a3.height);
  double v6 = v5;
  v7 = [(FRCardConfiguration *)self cache];
  v8 = [v7 cacheFontItemForFontSize:v6];

  v9 = [v8 topicFont];

  if (!v9)
  {
    BOOL v10 = +[UIFont systemFontOfSize:v6 weight:UIFontWeightSemibold];
    [v8 setTopicFont:v10];
  }
  v11 = [v8 topicFont];

  return v11;
}

- (id)fontForChannelFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  double width = a3.width;
  id v6 = a4;
  if (width <= 140.0)
  {
    v7 = +[FRDynamicTypeValueScaler valueSpecifierWithXSFactor:0.9 largeSize:8.5 XXXLFactor:1.25 AXXXLFactor:1.5];
  }
  else
  {
    v7 = +[FRDynamicTypeValueScaler valueSpecifierWithXSFactor:0.9 largeSize:11.0 XXXLFactor:1.25 AXXXLFactor:1.5];
    if (width > 200.0)
    {
      uint64_t v8 = +[FRDynamicTypeValueScaler valueSpecifierWithXSFactor:0.9 largeSize:12.0 XXXLFactor:1.25 AXXXLFactor:1.5];

      v7 = (void *)v8;
    }
  }
  [v7 scaledValueForSizeCategory:v6];
  double v10 = v9;

  v11 = [(FRCardConfiguration *)self cache];
  double v12 = [v11 cacheFontItemForFontSize:v10];

  double v13 = [v12 channelFont];

  if (!v13)
  {
    v14 = +[UIFont systemFontOfSize:v10 weight:UIFontWeightBold];
    [v12 setChannelFont:v14];
  }
  v15 = [v12 channelFont];

  return v15;
}

- (double)kerningForChannelFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  -[FRCardConfiguration _kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:](self, "_kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:", 1, a4, a3.width, a3.height);
  return result;
}

- (double)kerningForTopicFeedsWhenInCardsOfSize:(CGSize)a3 sizeCategory:(id)a4
{
  -[FRCardConfiguration _kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:](self, "_kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:", 0, a4, a3.width, a3.height);
  return result;
}

- (double)_kerningFeedsWhenInCardsOfSize:(CGSize)a3 isChannel:(BOOL)a4 sizeCategory:(id)a5
{
  double v5 = 1.2;
  if (a4) {
    double v5 = 0.4;
  }
  double v6 = 0.5;
  if (a4) {
    double v6 = 0.0;
  }
  if (a3.width <= 140.0) {
    return v6;
  }
  else {
    return v5;
  }
}

- (id)textColorForTag:(id)a3
{
  id v3 = a3;
  v4 = [v3 asChannel];

  double v5 = [v3 theme];

  double v6 = [v5 foregroundColor];
  v7 = [v6 ne_color];

  if (!v7)
  {
    if (v4) {
      +[UIColor blackColor];
    }
    else {
    v7 = +[UIColor whiteColor];
    }
  }

  return v7;
}

- (id)attributedStringForTag:(id)a3 boundsSize:(CGSize)a4 sizeCategory:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 asChannel];

  -[FRCardConfiguration lineHeightForSize:](self, "lineHeightForSize:", width, height);
  double v13 = v12;
  v14 = -[FRCardConfiguration fontForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForTopicFeedsWhenInCardsOfSize:sizeCategory:", v9, width, height);
  -[FRCardConfiguration _kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:](self, "_kerningFeedsWhenInCardsOfSize:isChannel:sizeCategory:", v11 != 0, v9, width, height);
  double v16 = v15;

  v17 = +[NSNumber numberWithDouble:v16];
  id v18 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v19) = 1036831949;
  [v18 setHyphenationFactor:v19];
  [v18 setAlignment:1];
  [v18 setMinimumLineHeight:v13];
  v20 = [(FRCardConfiguration *)self textColorForTag:v10];
  v21 = [v10 name];

  if (v11)
  {
    if (v21)
    {
LABEL_3:
      id v22 = objc_alloc((Class)NSAttributedString);
      v27[0] = kCTTrackingAttributeName;
      v27[1] = NSParagraphStyleAttributeName;
      v28[0] = v17;
      v28[1] = v18;
      v27[2] = NSForegroundColorAttributeName;
      v27[3] = NSFontAttributeName;
      v28[2] = v20;
      v28[3] = v14;
      v23 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
      id v24 = [v22 initWithString:v21 attributes:v23];

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v25 = [v21 uppercaseString];

    v21 = (void *)v25;
    if (v25) {
      goto LABEL_3;
    }
  }
  id v24 = 0;
LABEL_6:

  return v24;
}

- (CGRect)bannerFrameForSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(id)objc_opt_class() bannerHeightForWidth:a3.width];
  *(float *)&double v5 = v5;
  double v6 = floorf(*(float *)&v5);
  double v7 = height - v6;
  double v8 = 0.0;
  double v9 = width;
  result.size.double height = v6;
  result.size.CGFloat width = v9;
  result.origin.y = v7;
  result.origin.x = v8;
  return result;
}

- (UIEdgeInsets)logoInsetsForBannerSize:(CGSize)a3 logoAspectRatio:(double)a4
{
  if (a4 <= 6.66)
  {
    if (a3.height <= 0.0 || a3.width <= 0.0)
    {
      double v5 = a3.width * 0.5;
      double v7 = a3.width * 0.1111;
    }
    else
    {
      double v8 = dbl_1000BD410[a3.width < 150.0];
      double v9 = fmax(v8 / 6.66 * a4, 0.0);
      if (v8 < v9) {
        double v9 = dbl_1000BD410[a3.width < 150.0];
      }
      CGFloat v10 = a3.width * (dbl_1000BD400[a3.width < 150.0] - v9);
      double v5 = floor((a3.width - v10 * a4) * 0.5);
      double v7 = floor((a3.height - v10) * 0.5);
    }
  }
  else
  {
    double v4 = floor(a3.width * 0.113);
    double v5 = floor(a3.width * 0.1391);
    if (a3.width < 150.0) {
      double v5 = v4;
    }
    double height = a3.width * 0.1;
    if (height >= a3.height) {
      double height = a3.height;
    }
    double v7 = fmax(floor((a3.height - height) * 0.5), 0.0);
  }
  double v11 = v5;
  double v12 = v7;
  result.right = v5;
  result.bottom = v12;
  result.left = v11;
  result.top = v7;
  return result;
}

- (double)gridSpacingForWidth:(double)a3
{
  double v3 = 9.0;
  if (a3 <= 834.0)
  {
    double v3 = 8.0;
    if (a3 <= 750.0)
    {
      double v3 = 7.0;
      double v4 = 5.0;
      if (a3 > 320.0) {
        double v4 = 7.0;
      }
      if (a3 <= 400.0) {
        return v4;
      }
    }
  }
  return v3;
}

- (UIEdgeInsets)gridInsetsForWidth:(double)a3
{
  double v4 = 9.0;
  if (a3 <= 1112.0)
  {
    if (a3 <= 834.0)
    {
      if (a3 <= 768.0)
      {
        BOOL v5 = a3 <= 750.0 && a3 <= 400.0;
        double v4 = 8.0;
        if (v5)
        {
          double v4 = 5.0;
          if (a3 > 320.0) {
            double v4 = 8.0;
          }
        }
      }
    }
    else
    {
      double v4 = 8.0;
    }
  }
  double v6 = v4;
  double v7 = v4;
  double v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v4;
  return result;
}

- (unint64_t)numberOfColumnsForCollectionViewBounds:(CGRect)a3 isCompact:(BOOL)a4 orientation:(int64_t)a5
{
  BOOL v6 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v11 = CGRectGetWidth(a3);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v17);
  unint64_t v13 = 3;
  if (!v6) {
    unint64_t v13 = 4;
  }
  if (v11 > v12 && a5 == 0 || a5 == 2) {
    return 5;
  }
  else {
    return v13;
  }
}

- (CGSize)itemSizeForCollectionViewBounds:(CGRect)a3 isCompact:(BOOL)a4 orientation:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v10 = -[FRCardConfiguration numberOfColumnsForCollectionViewBounds:isCompact:orientation:](self, "numberOfColumnsForCollectionViewBounds:isCompact:orientation:", a4, a5);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double v11 = CGRectGetWidth(v21);
  -[FRCardConfiguration gridSpacingForWidth:](self, "gridSpacingForWidth:");
  double v13 = v12;
  -[FRCardConfiguration insetsForCollectionViewBounds:](self, "insetsForCollectionViewBounds:", x, y, width, height);
  double v16 = floor((v11 - v14 - v15 - v13 * (double)(v10 - 1)) / (double)v10);
  [(id)objc_opt_class() bannerHeightForWidth:v16];
  double v18 = v17 + v16;
  double v19 = v16;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (UIEdgeInsets)insetsForCollectionViewBounds:(CGRect)a3
{
  double Width = CGRectGetWidth(a3);

  [(FRCardConfiguration *)self gridInsetsForWidth:Width];
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)topicTitleTopMarginForCardSize:(CGSize)a3
{
  return dbl_1000BD420[a3.width > 140.0];
}

- (double)horizontalDividerWidthForCardSize:(CGSize)a3
{
  BOOL v3 = a3.width <= 140.0;
  double result = 40.0;
  if (!v3) {
    return 60.0;
  }
  return result;
}

- (double)spaceBetweenTopicTitleAndHorizontalDividerForCardSize:(CGSize)a3
{
  BOOL v3 = a3.width <= 140.0;
  double result = 3.0;
  if (!v3) {
    return 4.0;
  }
  return result;
}

- (double)spaceBetweenHorizontalDividerAndTopicNameForCardSize:(CGSize)a3
{
  BOOL v3 = a3.width <= 140.0;
  double result = 3.0;
  if (!v3) {
    return 6.0;
  }
  return result;
}

- (id)topicTitleAttributesForCardSize:(CGSize)a3 textColor:(id)a4 sizeCategory:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  -[FRCardConfiguration _fontSizeForTopicTitleWhenInCardsOfSize:sizeCategory:](self, "_fontSizeForTopicTitleWhenInCardsOfSize:sizeCategory:", a5, width, height);
  unint64_t v10 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  id v11 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v11 setAlignment:1];
  v18[0] = v10;
  v17[0] = NSFontAttributeName;
  v17[1] = NSParagraphStyleAttributeName;
  id v12 = [v11 copy];
  v18[1] = v12;
  double v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  if (v9)
  {
    id v14 = [v13 mutableCopy];
    [v14 setObject:v9 forKey:NSForegroundColorAttributeName];
    id v15 = [v14 copy];

    double v13 = v15;
  }

  return v13;
}

- (id)topicTextAttributesForCardSize:(CGSize)a3 textColor:(id)a4 sizeCategory:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[FRCardConfiguration fontForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForTopicFeedsWhenInCardsOfSize:sizeCategory:", v10, width, height);
  double v12 = 16.0;
  if (width <= 200.0)
  {
    double v12 = 14.0;
    if (width <= 140.0)
    {
      double v12 = 13.0;
      if (width <= 120.0)
      {
        if (width <= 110.0) {
          double v12 = 10.0;
        }
        else {
          double v12 = 12.0;
        }
      }
    }
  }
  -[FRCardConfiguration _fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "_fontSizeForTopicFeedsWhenInCardsOfSize:sizeCategory:", v10, width, height);
  double v14 = v13;

  id v15 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v15 setAlignment:1];
  [v15 setLineSpacing:v12 - v14];
  LODWORD(v16) = 1036831949;
  [v15 setHyphenationFactor:v16];
  v23[0] = v11;
  v22[0] = NSFontAttributeName;
  v22[1] = NSParagraphStyleAttributeName;
  id v17 = [v15 copy];
  v23[1] = v17;
  double v18 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  if (v9)
  {
    id v19 = [v18 mutableCopy];
    [v19 setObject:v9 forKey:NSForegroundColorAttributeName];
    id v20 = [v19 copy];

    double v18 = v20;
  }

  return v18;
}

+ (CGSize)textMargin
{
  double v2 = 6.0;
  double v3 = 4.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGRect)topicFrameForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(id)objc_opt_class() textMargin];
  double v7 = 12.0;
  if (width <= 140.0) {
    double v7 = 8.0;
  }
  double v8 = width + (v7 + v5) * -2.0;
  double v9 = height + (v7 + v6) * -2.0;

  double v10 = (width - v8) * 0.5;
  double v11 = (height - v9) * 0.5;
  return CGRectIntegral(*(CGRect *)(&v8 - 2));
}

- (CGRect)topicTextRect:(id)a3 cardSize:(CGSize)a4 textPadPath:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  -[FRCardConfiguration topicFrameForSize:](self, "topicFrameForSize:", width, height);
  double v11 = v10;
  double v13 = v12;
  double v14 = [v9 uppercaseString];

  id v15 = -[FRCardConfiguration topicTextAttributesForCardSize:textColor:sizeCategory:](self, "topicTextAttributesForCardSize:textColor:sizeCategory:", 0, 0, width, height);
  [v14 boundingRectWithSize:1 options:v15 attributes:0 context:v11];
  double v17 = floor((width - v16) * 0.5);
  double v19 = floor((height - v18) * 0.5);
  double v20 = ceil(v16);
  double v21 = ceil(v18);
  if (a5)
  {
    [(id)objc_opt_class() textMargin];
    CGFloat v23 = -v22;
    CGFloat v25 = -v24;
    v30.origin.double x = v17;
    v30.origin.double y = v19;
    v30.size.double width = v20;
    v30.size.double height = v21;
    CGRect v31 = CGRectInset(v30, v23, v25);
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height, 2.5);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  double v26 = v17;
  double v27 = v19;
  double v28 = v20;
  double v29 = v21;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGSize)topicTextSize:(id)a3 cardSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  -[FRCardConfiguration topicFrameForSize:](self, "topicFrameForSize:", width, height);
  double v9 = v8;
  double v11 = v10;
  double v12 = [v7 uppercaseString];

  double v13 = -[FRCardConfiguration topicTextAttributesForCardSize:textColor:sizeCategory:](self, "topicTextAttributesForCardSize:textColor:sizeCategory:", 0, 0, width, height);
  [v12 boundingRectWithSize:1 options:v13 context:v9];
  double v15 = ceil(v14);
  double v17 = ceil(v16);

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)topicTitleTextSize:(id)a3 cardSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  -[FRCardConfiguration topicFrameForSize:](self, "topicFrameForSize:", width, height);
  double v9 = v8;
  double v11 = v10;
  double v12 = [v7 uppercaseString];

  double v13 = -[FRCardConfiguration topicTitleAttributesForCardSize:textColor:sizeCategory:](self, "topicTitleAttributesForCardSize:textColor:sizeCategory:", 0, 0, width, height);
  [v12 boundingRectWithSize:1 options:v13 attributes:0 context:v9];
  double v15 = ceil(v14);
  double v17 = ceil(v16);

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

+ (id)_gradientCGColors
{
  if (qword_1000EE1D0 != -1) {
    dispatch_once(&qword_1000EE1D0, &stru_1000C9A08);
  }
  double v2 = (void *)qword_1000EE1C8;

  return v2;
}

- (id)gradientLayerWithChin:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = +[CAGradientLayer layer];
  double v5 = [(id)objc_opt_class() _gradientCGColors];
  [v4 setColors:v5];

  [v4 setStartPoint:0.5, 0.0];
  [v4 setEndPoint:0.5, 1.0];
  if (v3) {
    double v6 = &off_1000CFAF8;
  }
  else {
    double v6 = &off_1000CFB10;
  }
  [v4 setLocations:v6];
  id v7 = +[FRCardConfiguration cardConfiguration];
  [v7 cardCornerRadius];
  [v4 setCornerRadius:];

  double v8 = +[UIScreen mainScreen];
  [v8 scale];
  [v4 setBorderWidth:1.0 / v9];

  id v10 = +[UIColor colorWithWhite:0.0 alpha:0.15];
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v10, "CGColor"));

  return v4;
}

- (id)_placeholderOfSize:(CGSize)a3 withChin:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(FRCardConfiguration *)self gradientLayerWithChin:a4];
  id v7 = v6;
  if (width >= 0.0) {
    double v8 = width;
  }
  else {
    double v8 = -width;
  }
  if (height >= 0.0) {
    double v9 = height;
  }
  else {
    double v9 = -height;
  }
  [v6 setBounds:0.0, 0.0, v8, v9];
  v13.double width = width;
  v13.double height = height;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  [v7 renderInContext:UIGraphicsGetCurrentContext()];
  id v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

- (id)placeholderTopicImageForCardOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  +[NSThread isMainThread];
  double v6 = [(FRCardConfiguration *)self cache];
  id v7 = [v6 cacheImageItemForCardSize:width, height];

  double v8 = [v7 topicPlaceholderImage];

  if (v8) {
    goto LABEL_5;
  }
  if (width > 0.0 && height > 0.0)
  {
    double v9 = -[FRCardConfiguration _placeholderOfSize:withChin:](self, "_placeholderOfSize:withChin:", 0, width, height);
    [v7 setTopicPlaceholderImage:v9];

LABEL_5:
    double v8 = [v7 topicPlaceholderImage];
  }

  return v8;
}

- (id)placeholderChannelImageForCardOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  +[NSThread isMainThread];
  double v6 = [(FRCardConfiguration *)self cache];
  id v7 = [v6 cacheImageItemForCardSize:width, height];

  double v8 = [v7 channelPlaceholderImage];

  if (v8) {
    goto LABEL_5;
  }
  if (width > 0.0 && height > 0.0)
  {
    double v9 = -[FRCardConfiguration _placeholderOfSize:withChin:](self, "_placeholderOfSize:withChin:", 1, width, height);
    [v7 setChannelPlaceholderImage:v9];

LABEL_5:
    double v8 = [v7 channelPlaceholderImage];
  }

  return v8;
}

- (void)prewarmConfigurationForCardSize:(CGSize)a3 sizeCategory:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a4;
  +[NSThread isMainThread];
  if (width > 0.0 && height > 0.0)
  {
    id v7 = -[FRCardConfiguration fontForTopicFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForTopicFeedsWhenInCardsOfSize:sizeCategory:", v11, width, height);
    id v8 = -[FRCardConfiguration fontForChannelFeedsWhenInCardsOfSize:sizeCategory:](self, "fontForChannelFeedsWhenInCardsOfSize:sizeCategory:", v11, width, height);
    id v9 = -[FRCardConfiguration placeholderTopicImageForCardOfSize:](self, "placeholderTopicImageForCardOfSize:", width, height);
    id v10 = -[FRCardConfiguration placeholderChannelImageForCardOfSize:](self, "placeholderChannelImageForCardOfSize:", width, height);
  }
}

- (double)cardCornerRadius
{
  return self->_cardCornerRadius;
}

- (double)materialBlurRadius
{
  return self->_materialBlurRadius;
}

- (double)materialColorAlpha
{
  return self->_materialColorAlpha;
}

- (FRCardConfigurationCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end