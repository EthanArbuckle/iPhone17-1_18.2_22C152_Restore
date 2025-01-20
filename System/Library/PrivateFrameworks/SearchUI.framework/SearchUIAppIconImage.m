@interface SearchUIAppIconImage
+ (CGSize)sizeForVariant:(unint64_t)a3;
+ (id)appIconForBundleIdentifier:(id)a3 variant:(unint64_t)a4;
+ (id)appIconForBundleIdentifier:(id)a3 variant:(unint64_t)a4 contentType:(id)a5;
+ (id)appIconForResult:(id)a3 variant:(unint64_t)a4;
+ (id)descriptorNameForVariant:(unint64_t)a3;
+ (id)homeScreenService;
+ (id)imageForIcon:(id)a3 descriptor:(id)a4;
+ (unint64_t)bestVariantForSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsTinting;
- (BOOL)shouldInvalidateAppIconForChangedBundleIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (SearchUIAppIconImage)init;
- (SearchUIAppIconImage)initWithBundleIdentifier:(id)a3 variant:(unint64_t)a4 contentType:(id)a5;
- (id)descriptorWithScale:(double)a3;
- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4;
- (int)defaultCornerRoundingStyle;
- (unint64_t)hash;
- (unint64_t)variant;
- (void)setBundleIdentifier:(id)a3;
- (void)setVariant:(unint64_t)a3;
@end

@implementation SearchUIAppIconImage

uint64_t __39__SearchUIAppIconImage_sizeForVariant___block_invoke()
{
  sizeForVariant__sizeCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (CGSize)sizeForVariant:(unint64_t)a3
{
  if (sizeForVariant__onceToken != -1) {
    dispatch_once(&sizeForVariant__onceToken, &__block_literal_global_21);
  }
  v5 = (void *)sizeForVariant__sizeCache;
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    if (a3)
    {
      double v8 = *MEMORY[0x1E4F1DB30];
      double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (a3 == 5)
      {
        v12 = objc_opt_new();
        v13 = [v12 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
        [v13 iconImageInfo];
        double v11 = v14;
        double v10 = v15;
      }
      else
      {
        double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v11 = *MEMORY[0x1E4F1DB30];
        if (a3 == 4)
        {
          if ([MEMORY[0x1E4FAE100] isWideScreen]) {
            double v10 = 60.0;
          }
          else {
            double v10 = 40.0;
          }
          double v11 = v10;
          goto LABEL_19;
        }
      }
      if (v11 == v8 && v10 == v9)
      {
        v17 = (void *)MEMORY[0x1E4F6F258];
        v18 = [a1 descriptorNameForVariant:a3];
        v19 = [v17 imageDescriptorNamed:v18];
        [v19 size];
        double v11 = v20;
        double v10 = v21;
      }
      goto LABEL_19;
    }
    double v10 = 16.0;
    double v11 = 16.0;
LABEL_19:
    v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", v11, v10);
    v22 = (void *)sizeForVariant__sizeCache;
    v23 = [NSNumber numberWithUnsignedInteger:a3];
    [v22 setObject:v7 forKey:v23];
  }
  [v7 sizeValue];
  double v25 = v24;
  double v27 = v26;

  double v28 = v25;
  double v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

+ (unint64_t)bestVariantForSize:(CGSize)a3
{
  double width = a3.width;
  if (a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return 4;
  }
  for (unint64_t i = 0; i != 7; ++i)
  {
    +[SearchUIAppIconImage sizeForVariant:i];
    if (width <= v6) {
      break;
    }
  }
  return i;
}

+ (id)appIconForResult:(id)a3 variant:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 applicationBundleIdentifier];
  double v8 = +[SearchUIUtilities bundleIdentifierForApp:0];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    double v10 = (void *)MEMORY[0x1E4FB1F10];
    double v11 = [v6 identifier];

    v12 = [v10 webClipWithIdentifier:v11];

    v13 = [[SearchUIWebClipIconImage alloc] initWithWebClip:v12 variant:a4];
  }
  else
  {
    v12 = [v6 applicationBundleIdentifier];

    v13 = [a1 appIconForBundleIdentifier:v12 variant:a4];
  }
  double v14 = v13;

  return v14;
}

+ (id)appIconForBundleIdentifier:(id)a3 variant:(unint64_t)a4
{
  return (id)[a1 appIconForBundleIdentifier:a3 variant:a4 contentType:0];
}

+ (id)appIconForBundleIdentifier:(id)a3 variant:(unint64_t)a4 contentType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int v9 = +[SearchUIUtilities bundleIdentifierForApp:4];
  if (![v7 isEqualToString:v9]
    || (double v10 = [[SearchUICalendarIconImage alloc] initWithCurrentDateAndVariant:a4], [(SearchUIAppIconImage *)v10 setBundleIdentifier:v9], !v10))
  {
    double v10 = [[SearchUIAppIconImage alloc] initWithBundleIdentifier:v7 variant:a4 contentType:v8];
  }

  return v10;
}

- (SearchUIAppIconImage)init
{
  return [(SearchUIAppIconImage *)self initWithBundleIdentifier:0 variant:5 contentType:0];
}

- (SearchUIAppIconImage)initWithBundleIdentifier:(id)a3 variant:(unint64_t)a4 contentType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SearchUIAppIconImage;
  double v10 = [(SearchUIAppIconImage *)&v13 init];
  double v11 = v10;
  if (v10)
  {
    [(SearchUIAppIconImage *)v10 setBundleIdentifier:v8];
    [(SearchUIAppIconImage *)v11 setContentType:v9];
    [(SearchUIAppIconImage *)v11 setVariant:a4];
    [(id)objc_opt_class() sizeForVariant:a4];
    -[SearchUIAppIconImage setSize:](v11, "setSize:");
    [(SearchUIImage *)v11 setSupportsFastPathShadow:1];
  }

  return v11;
}

- (int)defaultCornerRoundingStyle
{
  return 3;
}

- (BOOL)shouldInvalidateAppIconForChangedBundleIdentifier:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  v5 = [(SearchUIAppIconImage *)self bundleIdentifier];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (BOOL)needsTinting
{
  v2 = [(SearchUIAppIconImage *)self bundleIdentifier];
  BOOL v3 = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:v2];

  return v3;
}

+ (id)descriptorNameForVariant:(unint64_t)a3
{
  id v4 = (id)*MEMORY[0x1E4F6F298];
  if (a3 <= 1)
  {
    id v5 = (id)*MEMORY[0x1E4F6F2A8];

    id v4 = v5;
    goto LABEL_5;
  }
  if (a3 != 2)
  {
LABEL_5:
    int v7 = !+[SearchUIUtilities isWideScreen];
    if (a3 == 4) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
    char v6 = (id *)MEMORY[0x1E4F6F2B0];
    if (a3 != 3 && !v8) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  char v6 = (id *)MEMORY[0x1E4F6F2B8];
LABEL_10:
  id v9 = *v6;

  id v4 = v9;
LABEL_11:
  return v4;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  char v6 = [(SearchUIAppIconImage *)self contentType];
  int v7 = [(SearchUIAppIconImage *)self bundleIdentifier];
  if (v6)
  {
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:v6];
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    int v8 = 0;
  }
  if (v7) {
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v7];
  }
LABEL_7:
  if (v8)
  {
    id v9 = [(SearchUIAppIconImage *)self descriptorWithScale:a3];
    double v10 = [(id)objc_opt_class() imageForIcon:v8 descriptor:v9];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)descriptorWithScale:(double)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F6F258]);
  [(SearchUIImage *)self size];
  id v5 = objc_msgSend(v4, "initWithSize:scale:");
  char v6 = [(id)objc_opt_class() homeScreenService];
  int v7 = [v6 homeScreenIconStyleConfiguration];

  uint64_t v8 = [v7 configurationType];
  if (v8 == 3)
  {
    uint64_t v10 = 2;
  }
  else if (v8 == 2)
  {
    uint64_t v10 = 1;
  }
  else if (v8)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FAE060] bestAppearanceForSystem];
    uint64_t v10 = [v9 isDark];
  }
  [v5 setAppearance:v10];
  double v11 = [v7 tintColor];
  uint64_t v12 = [v11 CGColor];

  if (v12)
  {
    objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithCGColor:v12];
    [v5 setTintColor:v13];
  }
  return v5;
}

+ (id)homeScreenService
{
  if (homeScreenService_onceToken != -1) {
    dispatch_once(&homeScreenService_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)homeScreenService_homeScreenService;
  return v2;
}

uint64_t __41__SearchUIAppIconImage_homeScreenService__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = homeScreenService_homeScreenService;
  homeScreenService_homeScreenService = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)imageForIcon:(id)a3 descriptor:(id)a4
{
  id v4 = [a3 prepareImageForDescriptor:a4];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 CGImage];
    int v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    id v9 = [v8 bundleIdentifier];
    if (v9)
    {
      BOOL v3 = [v8 bundleIdentifier];
      id v4 = [(SearchUIAppIconImage *)self bundleIdentifier];
      if (([v3 isEqualToString:v4] & 1) == 0)
      {
        char v10 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v11 = [(SearchUIAppIconImage *)self bundleIdentifier];
      if (v11)
      {
        BOOL v3 = (void *)v11;
        char v10 = 0;
        goto LABEL_28;
      }
    }
    uint64_t v12 = [v8 contentType];
    if (v12)
    {
      id v5 = [v8 contentType];
      uint64_t v6 = [(SearchUIAppIconImage *)self contentType];
      if (([v5 isEqualToString:v6] & 1) == 0)
      {
        char v10 = 0;
        goto LABEL_22;
      }
LABEL_14:
      uint64_t v14 = [v8 variant];
      if (v14 != [(SearchUIAppIconImage *)self variant]) {
        goto LABEL_21;
      }
      [v8 size];
      double v16 = v15;
      double v18 = v17;
      [(SearchUIImage *)self size];
      if (v16 != v20) {
        goto LABEL_21;
      }
      if (v18 == v19
        && (-[SearchUIImage scale](self, "scale"), double v22 = v21, [v8 scale], v22 == v23)
        && (int v24 = [(SearchUIImage *)self cornerRoundingStyle],
            v24 == [v8 cornerRoundingStyle]))
      {
        double v25 = [v8 badgingImage];
        if (v25)
        {
          double v26 = [v8 badgingImage];
          [(SearchUIImage *)self badgingImage];
          double v27 = v30 = v25;
          char v10 = [v26 isEqual:v27];

          double v25 = v30;
        }
        else
        {
          double v26 = [(SearchUIImage *)self badgingImage];
          char v10 = v26 == 0;
        }

        char v28 = v10;
        if (!v12)
        {
LABEL_26:
          char v10 = v28;
          if (!v9)
          {
LABEL_29:

            goto LABEL_30;
          }
          goto LABEL_27;
        }
      }
      else
      {
LABEL_21:
        char v10 = 0;
        char v28 = 0;
        if (!v12) {
          goto LABEL_26;
        }
      }
LABEL_22:

      if (!v9) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }
    objc_super v13 = [(SearchUIAppIconImage *)self contentType];
    if (!v13) {
      goto LABEL_14;
    }

    char v10 = 0;
    if (v9) {
      goto LABEL_27;
    }
    BOOL v3 = 0;
LABEL_28:

    goto LABEL_29;
  }
  char v10 = 0;
LABEL_30:

  return v10;
}

- (unint64_t)hash
{
  BOOL v3 = [(SearchUIAppIconImage *)self contentType];
  uint64_t v4 = [v3 hash];
  id v5 = [(SearchUIAppIconImage *)self bundleIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ (13 * [(SearchUIAppIconImage *)self variant]);

  return v7;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (void).cxx_destruct
{
}

@end