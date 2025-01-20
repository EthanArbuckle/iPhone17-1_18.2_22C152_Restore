@interface FCPaywallVisualSpecConfiguration
+ (id)defaultAudioFeedPaywallVisualSpecConfigurationLarge;
+ (id)defaultAudioFeedPaywallVisualSpecConfigurationSmall;
+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationLarge;
+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationMedium;
+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationSmall;
+ (id)defaultPaywallVisualSpecConfiguration;
- (BOOL)isEqual:(id)a3;
- (FCColor)backgroundColor;
- (FCColor)darkStyleBackgroundColor;
- (FCColor)largeTextColor;
- (FCColor)mastheadTextColor;
- (FCColor)offersTextColor;
- (FCColor)smallTextColor;
- (FCMultiResolutionImage)darkStyleMultiResolutionBadgeImage;
- (FCMultiResolutionImage)darkStyleMultiResolutionImage;
- (FCMultiResolutionImage)multiResolutionBadgeImage;
- (FCMultiResolutionImage)multiResolutionImage;
- (FCMultiSizeVideo)multiSizeVideo;
- (FCPaywallVisualSpecConfiguration)init;
- (FCPaywallVisualSpecConfiguration)initWithConfigDictionary:(id)a3;
- (FCPaywallVisualSpecConfiguration)initWithMultiResolutionImage:(id)a3 darkStyleMultiResolutionImage:(id)a4 multiResolutionBadgeImage:(id)a5 darkStyleMultiResolutionBadgeImage:(id)a6 multiSizeVideo:(id)a7 videoURL:(id)a8 videoWidth:(int64_t)a9 videoHeight:(int64_t)a10 gradientPercentHeight:(double)a11 textTopPadding:(int64_t)a12 badgeVerticalOffset:(int64_t)a13 backgroundColor:(id)a14 darkStyleBackgroundColor:(id)a15 mastheadTextColor:(id)a16 largeTextColor:(id)a17 smallTextColor:(id)a18 offersTextColor:(id)a19;
- (NSURL)videoURL;
- (double)gradientPercentHeight;
- (int64_t)badgeVerticalOffset;
- (int64_t)textTopPadding;
- (int64_t)videoHeight;
- (int64_t)videoWidth;
- (unint64_t)hash;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeVerticalOffset:(int64_t)a3;
- (void)setDarkStyleBackgroundColor:(id)a3;
- (void)setDarkStyleMultiResolutionBadgeImage:(id)a3;
- (void)setDarkStyleMultiResolutionImage:(id)a3;
- (void)setGradientPercentHeight:(double)a3;
- (void)setLargeTextColor:(id)a3;
- (void)setMastheadTextColor:(id)a3;
- (void)setMultiResolutionBadgeImage:(id)a3;
- (void)setMultiResolutionImage:(id)a3;
- (void)setMultiSizeVideo:(id)a3;
- (void)setOffersTextColor:(id)a3;
- (void)setSmallTextColor:(id)a3;
- (void)setTextTopPadding:(int64_t)a3;
- (void)setVideoHeight:(int64_t)a3;
- (void)setVideoURL:(id)a3;
- (void)setVideoWidth:(int64_t)a3;
@end

@implementation FCPaywallVisualSpecConfiguration

- (FCPaywallVisualSpecConfiguration)initWithConfigDictionary:(id)a3
{
  id v3 = a3;
  v32 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"image", 0);
  v33 = [[FCMultiResolutionImage alloc] initWithConfigDictionary:v32];
  v31 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"alternateImage", 0);
  v34 = [[FCMultiResolutionImage alloc] initWithConfigDictionary:v31];
  v30 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"badgeImage", 0);
  v16 = [[FCMultiResolutionImage alloc] initWithConfigDictionary:v30];
  v29 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"alternateBadgeImage", 0);
  v15 = [[FCMultiResolutionImage alloc] initWithConfigDictionary:v29];
  v28 = FCAppConfigurationDictionaryValueWithDefaultValue(v3, @"video", 0);
  v27 = [[FCMultiSizeVideo alloc] initWithConfigDictionary:v28];
  v26 = FCAppConfigurationURLValue(v3, @"videoURL");
  uint64_t v23 = FCAppConfigurationIntegerValue(v3, @"videoWidth", 0);
  uint64_t v22 = FCAppConfigurationIntegerValue(v3, @"videoHeight", 0);
  double v4 = FCAppConfigurationDoubleValue(v3, @"gradientPercentHeight", 0.0);
  uint64_t v19 = FCAppConfigurationIntegerValue(v3, @"textTopPadding", 57);
  uint64_t v17 = FCAppConfigurationIntegerValue(v3, @"badgeVerticalOffset", 0);
  v25 = FCAppConfigurationStringValue(v3, @"backgroundColor", 0);
  v13 = +[FCColor nullableColorWithHexString:v25];
  v21 = FCAppConfigurationStringValue(v3, @"alternateBackgroundColor", 0);
  v12 = +[FCColor nullableColorWithHexString:v21];
  v18 = FCAppConfigurationStringValue(v3, @"mastheadColor", 0);
  v5 = +[FCColor nullableColorWithHexString:v18];
  v14 = FCAppConfigurationStringValue(v3, @"largeTextColor", 0);
  v6 = +[FCColor nullableColorWithHexString:v14];
  v7 = FCAppConfigurationStringValue(v3, @"smallTextColor", 0);
  v8 = +[FCColor nullableColorWithHexString:v7];
  v9 = FCAppConfigurationStringValue(v3, @"offersTextColor", 0);

  v10 = +[FCColor nullableColorWithHexString:v9];
  v24 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](self, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", v33, v34, v16, v15, v27, v26, v4, v23, v22, v19, v17, v13, v12, v5, v6,
          v8,
          v10);

  return v24;
}

- (FCPaywallVisualSpecConfiguration)initWithMultiResolutionImage:(id)a3 darkStyleMultiResolutionImage:(id)a4 multiResolutionBadgeImage:(id)a5 darkStyleMultiResolutionBadgeImage:(id)a6 multiSizeVideo:(id)a7 videoURL:(id)a8 videoWidth:(int64_t)a9 videoHeight:(int64_t)a10 gradientPercentHeight:(double)a11 textTopPadding:(int64_t)a12 badgeVerticalOffset:(int64_t)a13 backgroundColor:(id)a14 darkStyleBackgroundColor:(id)a15 mastheadTextColor:(id)a16 largeTextColor:(id)a17 smallTextColor:(id)a18 offersTextColor:(id)a19
{
  id v42 = a3;
  id v39 = a4;
  id v43 = a5;
  id v35 = a6;
  id v38 = a6;
  id v36 = a7;
  id v25 = a7;
  id v41 = a8;
  id v40 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  v44.receiver = self;
  v44.super_class = (Class)FCPaywallVisualSpecConfiguration;
  v31 = [(FCPaywallVisualSpecConfiguration *)&v44 init];
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_multiResolutionImage, a3);
    objc_storeStrong((id *)&v32->_darkStyleMultiResolutionImage, a4);
    objc_storeStrong((id *)&v32->_multiResolutionBadgeImage, a5);
    objc_storeStrong((id *)&v32->_darkStyleMultiResolutionBadgeImage, v35);
    objc_storeStrong((id *)&v32->_multiSizeVideo, v36);
    objc_storeStrong((id *)&v32->_videoURL, a8);
    v32->_videoWidth = a9;
    v32->_videoHeight = a10;
    v32->_gradientPercentHeight = a11;
    v32->_textTopPadding = a12;
    v32->_badgeVerticalOffset = a13;
    objc_storeStrong((id *)&v32->_backgroundColor, a14);
    objc_storeStrong((id *)&v32->_darkStyleBackgroundColor, a15);
    objc_storeStrong((id *)&v32->_mastheadTextColor, a16);
    objc_storeStrong((id *)&v32->_largeTextColor, a17);
    objc_storeStrong((id *)&v32->_smallTextColor, a18);
    objc_storeStrong((id *)&v32->_offersTextColor, a19);
  }

  return v32;
}

- (FCPaywallVisualSpecConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPaywallVisualSpecConfiguration init]";
    __int16 v9 = 2080;
    v10 = "FCPaywallVisualSpecConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 42;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPaywallVisualSpecConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FBA8A8];
    v8 = [(FCPaywallVisualSpecConfiguration *)self multiResolutionImage];
    __int16 v9 = [v6 multiResolutionImage];
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E4FBA8A8];
      __int16 v11 = [(FCPaywallVisualSpecConfiguration *)self darkStyleMultiResolutionImage];
      int v12 = [v6 darkStyleMultiResolutionImage];
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        __int16 v13 = (void *)MEMORY[0x1E4FBA8A8];
        v14 = [(FCPaywallVisualSpecConfiguration *)self multiResolutionBadgeImage];
        uint64_t v15 = [v6 multiResolutionBadgeImage];
        if (objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15))
        {
          v37 = v14;
          v16 = (void *)MEMORY[0x1E4FBA8A8];
          uint64_t v17 = [(FCPaywallVisualSpecConfiguration *)self darkStyleMultiResolutionBadgeImage];
          uint64_t v36 = [v6 darkStyleMultiResolutionBadgeImage];
          if (objc_msgSend(v16, "nf_object:isEqualToObject:", v17))
          {
            v33 = v17;
            v18 = (void *)MEMORY[0x1E4FBA8A8];
            uint64_t v19 = [(FCPaywallVisualSpecConfiguration *)self backgroundColor];
            v34 = [v6 backgroundColor];
            id v35 = (void *)v19;
            if (objc_msgSend(v18, "nf_object:isEqualToObject:", v19))
            {
              v20 = (void *)MEMORY[0x1E4FBA8A8];
              uint64_t v21 = [(FCPaywallVisualSpecConfiguration *)self darkStyleBackgroundColor];
              v31 = [v6 darkStyleBackgroundColor];
              v32 = (void *)v21;
              if (objc_msgSend(v20, "nf_object:isEqualToObject:", v21, v31)
                && ([(FCPaywallVisualSpecConfiguration *)self gradientPercentHeight],
                    double v23 = v22,
                    [v6 gradientPercentHeight],
                    v23 == v24))
              {
                int64_t v25 = [(FCPaywallVisualSpecConfiguration *)self textTopPadding];
                BOOL v26 = v25 == [v6 textTopPadding];
                uint64_t v17 = v33;
                id v27 = (void *)v36;
                v14 = v37;
                if (v26)
                {
                  int64_t v28 = [(FCPaywallVisualSpecConfiguration *)self badgeVerticalOffset];
                  BOOL v30 = v28 == [v6 badgeVerticalOffset];
                }
                else
                {
                  BOOL v30 = 0;
                }
              }
              else
              {
                BOOL v30 = 0;
                uint64_t v17 = v33;
                id v27 = (void *)v36;
                v14 = v37;
              }
            }
            else
            {
              BOOL v30 = 0;
              uint64_t v17 = v33;
              id v27 = (void *)v36;
              v14 = v37;
            }
          }
          else
          {
            BOOL v30 = 0;
            id v27 = (void *)v36;
            v14 = v37;
          }
        }
        else
        {
          BOOL v30 = 0;
        }
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  double v22 = [(FCPaywallVisualSpecConfiguration *)self multiResolutionImage];
  uint64_t v3 = [v22 hash];
  uint64_t v21 = [(FCPaywallVisualSpecConfiguration *)self darkStyleMultiResolutionImage];
  uint64_t v4 = [v21 hash] ^ v3;
  v20 = [(FCPaywallVisualSpecConfiguration *)self multiResolutionBadgeImage];
  uint64_t v5 = [v20 hash];
  id v6 = [(FCPaywallVisualSpecConfiguration *)self darkStyleMultiResolutionBadgeImage];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  v8 = [(FCPaywallVisualSpecConfiguration *)self backgroundColor];
  uint64_t v9 = [v8 hash];
  v10 = [(FCPaywallVisualSpecConfiguration *)self darkStyleBackgroundColor];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  int v12 = NSNumber;
  [(FCPaywallVisualSpecConfiguration *)self gradientPercentHeight];
  __int16 v13 = objc_msgSend(v12, "numberWithDouble:");
  uint64_t v14 = v11 ^ [v13 hash];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[FCPaywallVisualSpecConfiguration textTopPadding](self, "textTopPadding"));
  uint64_t v16 = [v15 hash];
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[FCPaywallVisualSpecConfiguration badgeVerticalOffset](self, "badgeVerticalOffset"));
  unint64_t v18 = v14 ^ v16 ^ [v17 hash];

  return v18;
}

+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationSmall
{
  if (qword_1EB5D15C0 != -1) {
    dispatch_once(&qword_1EB5D15C0, &__block_literal_global_76);
  }
  v2 = (void *)_MergedGlobals_173;
  return v2;
}

void __90__FCPaywallVisualSpecConfiguration_defaultMagazineFeedPaywallVisualSpecConfigurationSmall__block_invoke()
{
  v0 = [FCPaywallVisualSpecConfiguration alloc];
  v8 = +[FCColor colorWithRed:0.956862745 green:0.956862745 blue:0.956862745 alpha:1.0];
  v1 = +[FCColor colorWithRed:0.184313725 green:0.184313725 blue:0.192156863 alpha:1.0];
  v2 = +[FCColor whiteColor];
  uint64_t v3 = +[FCColor whiteColor];
  uint64_t v4 = +[FCColor whiteColor];
  uint64_t v5 = +[FCColor colorWithRed:1.0 green:0.0 blue:0.28627451 alpha:1.0];
  uint64_t v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  uint64_t v7 = (void *)_MergedGlobals_173;
  _MergedGlobals_173 = v6;
}

+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationMedium
{
  if (qword_1EB5D15D0 != -1) {
    dispatch_once(&qword_1EB5D15D0, &__block_literal_global_65);
  }
  v2 = (void *)qword_1EB5D15C8;
  return v2;
}

void __91__FCPaywallVisualSpecConfiguration_defaultMagazineFeedPaywallVisualSpecConfigurationMedium__block_invoke()
{
  v0 = [FCPaywallVisualSpecConfiguration alloc];
  v8 = +[FCColor colorWithRed:0.956862745 green:0.956862745 blue:0.956862745 alpha:1.0];
  v1 = +[FCColor colorWithRed:0.184313725 green:0.184313725 blue:0.192156863 alpha:1.0];
  v2 = +[FCColor whiteColor];
  uint64_t v3 = +[FCColor whiteColor];
  uint64_t v4 = +[FCColor whiteColor];
  uint64_t v5 = +[FCColor colorWithRed:1.0 green:0.0 blue:0.28627451 alpha:1.0];
  uint64_t v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  uint64_t v7 = (void *)qword_1EB5D15C8;
  qword_1EB5D15C8 = v6;
}

+ (id)defaultMagazineFeedPaywallVisualSpecConfigurationLarge
{
  if (qword_1EB5D15E0 != -1) {
    dispatch_once(&qword_1EB5D15E0, &__block_literal_global_67_0);
  }
  v2 = (void *)qword_1EB5D15D8;
  return v2;
}

void __90__FCPaywallVisualSpecConfiguration_defaultMagazineFeedPaywallVisualSpecConfigurationLarge__block_invoke()
{
  v0 = [FCPaywallVisualSpecConfiguration alloc];
  v8 = +[FCColor colorWithRed:0.956862745 green:0.956862745 blue:0.956862745 alpha:1.0];
  v1 = +[FCColor colorWithRed:0.184313725 green:0.184313725 blue:0.192156863 alpha:1.0];
  v2 = +[FCColor whiteColor];
  uint64_t v3 = +[FCColor whiteColor];
  uint64_t v4 = +[FCColor whiteColor];
  uint64_t v5 = +[FCColor colorWithRed:1.0 green:0.0 blue:0.28627451 alpha:1.0];
  uint64_t v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  uint64_t v7 = (void *)qword_1EB5D15D8;
  qword_1EB5D15D8 = v6;
}

+ (id)defaultAudioFeedPaywallVisualSpecConfigurationSmall
{
  if (qword_1EB5D15F0 != -1) {
    dispatch_once(&qword_1EB5D15F0, &__block_literal_global_69_0);
  }
  v2 = (void *)qword_1EB5D15E8;
  return v2;
}

void __87__FCPaywallVisualSpecConfiguration_defaultAudioFeedPaywallVisualSpecConfigurationSmall__block_invoke()
{
  v0 = [FCPaywallVisualSpecConfiguration alloc];
  v8 = +[FCColor colorWithRed:0.956862745 green:0.956862745 blue:0.956862745 alpha:1.0];
  v1 = +[FCColor colorWithRed:0.184313725 green:0.184313725 blue:0.192156863 alpha:1.0];
  v2 = +[FCColor whiteColor];
  uint64_t v3 = +[FCColor whiteColor];
  uint64_t v4 = +[FCColor whiteColor];
  uint64_t v5 = +[FCColor colorWithRed:1.0 green:0.0 blue:0.28627451 alpha:1.0];
  uint64_t v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  uint64_t v7 = (void *)qword_1EB5D15E8;
  qword_1EB5D15E8 = v6;
}

+ (id)defaultAudioFeedPaywallVisualSpecConfigurationLarge
{
  if (qword_1EB5D1600 != -1) {
    dispatch_once(&qword_1EB5D1600, &__block_literal_global_71_0);
  }
  v2 = (void *)qword_1EB5D15F8;
  return v2;
}

void __87__FCPaywallVisualSpecConfiguration_defaultAudioFeedPaywallVisualSpecConfigurationLarge__block_invoke()
{
  v0 = [FCPaywallVisualSpecConfiguration alloc];
  v8 = +[FCColor colorWithRed:0.956862745 green:0.956862745 blue:0.956862745 alpha:1.0];
  v1 = +[FCColor colorWithRed:0.184313725 green:0.184313725 blue:0.192156863 alpha:1.0];
  v2 = +[FCColor whiteColor];
  uint64_t v3 = +[FCColor whiteColor];
  uint64_t v4 = +[FCColor whiteColor];
  uint64_t v5 = +[FCColor colorWithRed:1.0 green:0.0 blue:0.28627451 alpha:1.0];
  uint64_t v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  uint64_t v7 = (void *)qword_1EB5D15F8;
  qword_1EB5D15F8 = v6;
}

+ (id)defaultPaywallVisualSpecConfiguration
{
  if (qword_1EB5D1610 != -1) {
    dispatch_once(&qword_1EB5D1610, &__block_literal_global_73_0);
  }
  v2 = (void *)qword_1EB5D1608;
  return v2;
}

void __73__FCPaywallVisualSpecConfiguration_defaultPaywallVisualSpecConfiguration__block_invoke()
{
  v0 = [FCPaywallVisualSpecConfiguration alloc];
  v8 = +[FCColor colorWithRed:0.956862745 green:0.956862745 blue:0.956862745 alpha:1.0];
  v1 = +[FCColor colorWithRed:0.184313725 green:0.184313725 blue:0.192156863 alpha:1.0];
  v2 = +[FCColor whiteColor];
  uint64_t v3 = +[FCColor whiteColor];
  uint64_t v4 = +[FCColor whiteColor];
  uint64_t v5 = +[FCColor colorWithRed:1.0 green:0.0 blue:0.28627451 alpha:1.0];
  uint64_t v6 = -[FCPaywallVisualSpecConfiguration initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:](v0, "initWithMultiResolutionImage:darkStyleMultiResolutionImage:multiResolutionBadgeImage:darkStyleMultiResolutionBadgeImage:multiSizeVideo:videoURL:videoWidth:videoHeight:gradientPercentHeight:textTopPadding:badgeVerticalOffset:backgroundColor:darkStyleBackgroundColor:mastheadTextColor:largeTextColor:smallTextColor:offersTextColor:", 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 57, 0, v8, v1, v2, v3,
         v4,
         v5);
  uint64_t v7 = (void *)qword_1EB5D1608;
  qword_1EB5D1608 = v6;
}

- (FCMultiResolutionImage)multiResolutionImage
{
  return self->_multiResolutionImage;
}

- (void)setMultiResolutionImage:(id)a3
{
}

- (FCMultiResolutionImage)darkStyleMultiResolutionImage
{
  return self->_darkStyleMultiResolutionImage;
}

- (void)setDarkStyleMultiResolutionImage:(id)a3
{
}

- (FCMultiResolutionImage)multiResolutionBadgeImage
{
  return self->_multiResolutionBadgeImage;
}

- (void)setMultiResolutionBadgeImage:(id)a3
{
}

- (FCMultiResolutionImage)darkStyleMultiResolutionBadgeImage
{
  return self->_darkStyleMultiResolutionBadgeImage;
}

- (void)setDarkStyleMultiResolutionBadgeImage:(id)a3
{
}

- (FCMultiSizeVideo)multiSizeVideo
{
  return self->_multiSizeVideo;
}

- (void)setMultiSizeVideo:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (int64_t)videoWidth
{
  return self->_videoWidth;
}

- (void)setVideoWidth:(int64_t)a3
{
  self->_videoWidth = a3;
}

- (int64_t)videoHeight
{
  return self->_videoHeight;
}

- (void)setVideoHeight:(int64_t)a3
{
  self->_videoHeight = a3;
}

- (double)gradientPercentHeight
{
  return self->_gradientPercentHeight;
}

- (void)setGradientPercentHeight:(double)a3
{
  self->_gradientPercentHeight = a3;
}

- (int64_t)textTopPadding
{
  return self->_textTopPadding;
}

- (void)setTextTopPadding:(int64_t)a3
{
  self->_textTopPadding = a3;
}

- (int64_t)badgeVerticalOffset
{
  return self->_badgeVerticalOffset;
}

- (void)setBadgeVerticalOffset:(int64_t)a3
{
  self->_badgeVerticalOffset = a3;
}

- (FCColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (FCColor)darkStyleBackgroundColor
{
  return self->_darkStyleBackgroundColor;
}

- (void)setDarkStyleBackgroundColor:(id)a3
{
}

- (FCColor)mastheadTextColor
{
  return self->_mastheadTextColor;
}

- (void)setMastheadTextColor:(id)a3
{
}

- (FCColor)largeTextColor
{
  return self->_largeTextColor;
}

- (void)setLargeTextColor:(id)a3
{
}

- (FCColor)smallTextColor
{
  return self->_smallTextColor;
}

- (void)setSmallTextColor:(id)a3
{
}

- (FCColor)offersTextColor
{
  return self->_offersTextColor;
}

- (void)setOffersTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offersTextColor, 0);
  objc_storeStrong((id *)&self->_smallTextColor, 0);
  objc_storeStrong((id *)&self->_largeTextColor, 0);
  objc_storeStrong((id *)&self->_mastheadTextColor, 0);
  objc_storeStrong((id *)&self->_darkStyleBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_multiSizeVideo, 0);
  objc_storeStrong((id *)&self->_darkStyleMultiResolutionBadgeImage, 0);
  objc_storeStrong((id *)&self->_multiResolutionBadgeImage, 0);
  objc_storeStrong((id *)&self->_darkStyleMultiResolutionImage, 0);
  objc_storeStrong((id *)&self->_multiResolutionImage, 0);
}

@end