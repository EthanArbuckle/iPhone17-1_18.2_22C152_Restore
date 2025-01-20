@interface SearchUIImageAccessoryViewController
+ (BOOL)resultIsLegacySiriAction:(id)a3;
+ (BOOL)supportsRowModel:(id)a3;
- (BOOL)containsSymbolImage;
- (id)setupView;
- (unint64_t)type;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIImageAccessoryViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 trailingThumbnail];
  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    v6 = objc_opt_class();
    v7 = [v3 identifyingResult];
    char v5 = [v6 resultIsLegacySiriAction:v7];
  }
  return v5;
}

+ (BOOL)resultIsLegacySiriAction:(id)a3
{
  id v3 = a3;
  if (+[SearchUIUtilities resultIsSiriAction:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [v3 action];
    v6 = [v5 interactionContentType];
    if ([v6 hasPrefix:*MEMORY[0x1E4F30100]])
    {
      BOOL v4 = 1;
    }
    else
    {
      v7 = [v3 userActivityRequiredString];
      BOOL v4 = v7 != 0;
    }
  }

  return v4;
}

- (id)setupView
{
  v2 = objc_opt_new();
  id v3 = objc_msgSend(MEMORY[0x1E4FAE090], "cachedFontForTextStyle:isBold:isMacStyle:", *MEMORY[0x1E4FB28C8], 0, objc_msgSend(MEMORY[0x1E4FAE198], "isMacOS"));
  [v2 setSymbolFont:v3];

  [v2 setProminence:1];
  return v2;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SearchUIImageAccessoryViewController;
  [(SearchUIAccessoryViewController *)&v23 updateWithRowModel:v4];
  if ([v4 useCompactVersionOfUI])
  {
    uint64_t v5 = 0;
    if ([MEMORY[0x1E4FAE198] isMacOS]) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 3;
    uint64_t v5 = 2;
  }
  v7 = [(SearchUIAccessoryViewController *)self view];
  [v7 setSymbolScale:v6];

  v8 = [(SearchUIAccessoryViewController *)self view];
  [v8 setAlignment:v5];

  v9 = [v4 trailingThumbnail];
  if (!v9)
  {
    v10 = objc_opt_class();
    v11 = [v4 identifyingResult];
    LODWORD(v10) = [v10 resultIsLegacySiriAction:v11];

    if (v10)
    {
      v12 = [v4 identifyingResult];
      v13 = [v12 contentType];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        v16 = [v4 action];
        id v15 = [v16 interactionContentType];
      }
      if ([v15 isEqualToString:*MEMORY[0x1E4F30110]])
      {
        v17 = @"play";
      }
      else if ([v15 isEqualToString:*MEMORY[0x1E4F30118]])
      {
        v17 = @"message";
      }
      else if ([v15 isEqualToString:*MEMORY[0x1E4F300F8]])
      {
        v17 = @"phone";
      }
      else if ([v15 isEqualToString:*MEMORY[0x1E4F30120]])
      {
        v17 = @"video";
      }
      else if ([v15 isEqualToString:*MEMORY[0x1E4F30108]])
      {
        v17 = @"airplayvideo";
      }
      else
      {
        v17 = @"arrow.up.forward.app";
      }
      v9 = [[SearchUISymbolImage alloc] initWithSymbolName:v17];
      [(SearchUISymbolImage *)v9 setPreferredFill:1];
    }
    else
    {
      v9 = 0;
    }
  }
  v18 = [(SearchUIAccessoryViewController *)self view];
  [v18 updateWithImage:v9];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || ![v4 useCompactVersionOfUI])
  {
    v20 = [(SearchUIAccessoryViewController *)self view];
    objc_msgSend(v20, "setMaximumLayoutSize:", 1.79769313e308, 1.79769313e308);

    double v21 = *MEMORY[0x1E4F1DB30];
    double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v19 = [(SearchUIAccessoryViewController *)self view];
    objc_msgSend(v19, "setMinimumLayoutSize:", v21, v22);
  }
  else
  {
    v19 = [(SearchUIAccessoryViewController *)self view];
    +[SearchUIThumbnailViewController applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:](SearchUIThumbnailViewController, "applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:", v19, [v4 useCompactVersionOfUI], objc_msgSend(v4, "preventThumbnailImageScaling"), 0);
  }
}

- (unint64_t)type
{
  return 5;
}

- (BOOL)containsSymbolImage
{
  id v3 = [(SearchUIAccessoryViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (void *)MEMORY[0x1E4FAE0C0];
    uint64_t v5 = [(SearchUIAccessoryViewController *)self view];
    uint64_t v6 = [v5 imageView];
    v7 = [v6 image];
    char v8 = [v4 imageIsSymbol:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

@end