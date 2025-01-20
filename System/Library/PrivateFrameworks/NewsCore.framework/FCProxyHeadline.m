@interface FCProxyHeadline
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hasThumbnail;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGRect)thumbnailFocalFrame;
- (FCColor)thumbnailImageAccentColor;
- (FCColor)thumbnailImageBackgroundColor;
- (FCColor)thumbnailImagePrimaryColor;
- (FCColor)thumbnailImageTextColor;
- (FCHeadlineMetadata)appliedOverrideMetadata;
- (FCHeadlineProviding)originalHeadline;
- (FCHeadlineThumbnail)thumbnail;
- (FCHeadlineThumbnail)thumbnailHQ;
- (FCHeadlineThumbnail)thumbnailLQ;
- (FCHeadlineThumbnail)thumbnailMedium;
- (FCHeadlineThumbnail)thumbnailUltraHQ;
- (FCProxyHeadline)initWithHeadline:(id)a3 overrideMetadata:(id)a4 configuration:(id)a5;
- (FCTopStoriesStyleConfiguration)storyStyle;
- (NSDate)displayDate;
- (NSDate)publishDate;
- (NSString)description;
- (NSString)shortExcerpt;
- (NSString)title;
- (NSURL)routeURL;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)storyType;
- (void)forwardInvocation:(id)a3;
@end

@implementation FCProxyHeadline

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_headline;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (unint64_t)storyType
{
  return self->_overrideStoryType;
}

- (NSDate)displayDate
{
  v3 = [(FCHeadlineMetadata *)self->_overrideMetadata displayDate];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCHeadlineProviding *)self->_headline displayDate];
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (FCHeadlineThumbnail)thumbnailMedium
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    v3 = [v2 mediumQualityImage];
    v4 = [v3 thumbnail];
  }
  else
  {
    v4 = [(FCHeadlineProviding *)self->_headline thumbnailMedium];
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnailUltraHQ
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    v3 = [v2 ultraQualityImage];
    v4 = [v3 thumbnail];
  }
  else
  {
    v4 = [(FCHeadlineProviding *)self->_headline thumbnailUltraHQ];
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnailHQ
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    v3 = [v2 highQualityImage];
    v4 = [v3 thumbnail];
  }
  else
  {
    v4 = [(FCHeadlineProviding *)self->_headline thumbnailHQ];
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnail
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    v3 = [v2 defaultQualityImage];
    v4 = [v3 thumbnail];
  }
  else
  {
    v4 = [(FCHeadlineProviding *)self->_headline thumbnail];
  }
  return (FCHeadlineThumbnail *)v4;
}

- (FCHeadlineThumbnail)thumbnailLQ
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    v3 = [v2 lowQualityImage];
    v4 = [v3 thumbnail];
  }
  else
  {
    v4 = [(FCHeadlineProviding *)self->_headline thumbnailLQ];
  }
  return (FCHeadlineThumbnail *)v4;
}

- (CGRect)thumbnailFocalFrame
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    [v2 focalFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    [(FCHeadlineProviding *)self->_headline thumbnailFocalFrame];
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (NSString)shortExcerpt
{
  double v3 = [(FCHeadlineMetadata *)self->_overrideMetadata shortExcerpt];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCHeadlineProviding *)self->_headline shortExcerpt];
  }
  double v6 = v5;

  return (NSString *)v6;
}

- (NSString)title
{
  double v3 = [(FCHeadlineMetadata *)self->_overrideMetadata title];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCHeadlineProviding *)self->_headline title];
  }
  double v6 = v5;

  return (NSString *)v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return [(FCHeadlineProviding *)self->_headline conformsToProtocol:a3];
}

- (BOOL)hasThumbnail
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    char v3 = [v2 hasThumbnail];

    return v3;
  }
  else
  {
    headline = self->_headline;
    return [(FCHeadlineProviding *)headline hasThumbnail];
  }
}

- (NSURL)routeURL
{
  char v3 = [(FCHeadlineMetadata *)self->_overrideMetadata routeURL];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCHeadlineProviding *)self->_headline routeURL];
  }
  double v6 = v5;

  return (NSURL *)v6;
}

- (FCColor)thumbnailImageAccentColor
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    char v3 = [v2 accentColor];
  }
  else
  {
    char v3 = [(FCHeadlineProviding *)self->_headline thumbnailImageAccentColor];
  }
  return (FCColor *)v3;
}

- (FCColor)thumbnailImageBackgroundColor
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    char v3 = [v2 backgroundColor];
  }
  else
  {
    char v3 = [(FCHeadlineProviding *)self->_headline thumbnailImageBackgroundColor];
  }
  return (FCColor *)v3;
}

- (FCColor)thumbnailImagePrimaryColor
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    char v3 = [v2 primaryColor];
  }
  else
  {
    char v3 = [(FCHeadlineProviding *)self->_headline thumbnailImagePrimaryColor];
  }
  return (FCColor *)v3;
}

- (FCColor)thumbnailImageTextColor
{
  if (self->_hasOverriddenThumbnail)
  {
    v2 = [(FCHeadlineMetadata *)self->_overrideMetadata formatThumbnail];
    char v3 = [v2 textColor];
  }
  else
  {
    char v3 = [(FCHeadlineProviding *)self->_headline thumbnailImageTextColor];
  }
  return (FCColor *)v3;
}

- (FCHeadlineMetadata)appliedOverrideMetadata
{
  return self->_overrideMetadata;
}

- (FCProxyHeadline)initWithHeadline:(id)a3 overrideMetadata:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_storeStrong((id *)&self->_headline, a3);
    objc_storeStrong((id *)&self->_overrideMetadata, a4);
    self->_overrideStoryType = [v9 storyType];
    double v12 = [v9 storyStyle];
    overrideStoryStyle = self->_overrideStoryStyle;
    self->_overrideStoryStyle = v12;

    if (objc_opt_respondsToSelector())
    {
      double v14 = [v10 formatThumbnail];
      self->_hasOverriddenThumbnail = v14 != 0;
    }
    else
    {
      self->_hasOverriddenThumbnail = 0;
    }
    double v16 = [v10 storyType];
    uint64_t v17 = [v16 length];

    if (v11 && v17)
    {
      double v18 = [v10 displayDate];
      v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        id v20 = [v9 publishDate];
      }
      v21 = v20;

      v22 = [MEMORY[0x1E4F1C9C8] date];
      [v22 timeIntervalSinceDate:v21];
      double v24 = v23;
      v25 = [v11 topStoriesConfig];
      double v26 = (double)[v25 storyTypeTimeout];

      if (v24 >= v26)
      {
        self->_overrideStoryType = 0;
        v30 = self->_overrideStoryStyle;
        self->_overrideStoryStyle = 0;
      }
      else
      {
        v27 = [v10 storyType];
        uint64_t v28 = PBArticleStoryTypeFromString(v27) - 1;
        if (v28 < 5) {
          unint64_t v29 = v28 + 1;
        }
        else {
          unint64_t v29 = 0;
        }
        self->_overrideStoryType = v29;

        v30 = [v11 topStoriesConfig];
        v31 = [v30 styleConfigurations];
        v32 = [NSNumber numberWithUnsignedInteger:self->_overrideStoryType];
        v33 = [v31 objectForKey:v32];
        v34 = self->_overrideStoryStyle;
        self->_overrideStoryStyle = v33;
      }
    }
    double v15 = self;
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  char v3 = NSString;
  double v4 = [(FCHeadlineProviding *)self->_headline identifier];
  id v5 = [(FCHeadlineProviding *)self->_headline title];
  double v6 = [v3 stringWithFormat:@"id: %@, title: %@", v4, v5];

  return (NSString *)v6;
}

- (NSDate)publishDate
{
  char v3 = [(FCHeadlineMetadata *)self->_overrideMetadata displayDate];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FCHeadlineProviding *)self->_headline publishDate];
  }
  double v6 = v5;

  return (NSDate *)v6;
}

- (FCTopStoriesStyleConfiguration)storyStyle
{
  return self->_overrideStoryStyle;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(FCHeadlineProviding *)self->_headline methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

- (FCHeadlineProviding)originalHeadline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideStoryStyle, 0);
  objc_storeStrong((id *)&self->_overrideMetadata, 0);
  objc_storeStrong((id *)&self->_headline, 0);
}

@end