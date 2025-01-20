@interface TVUNContentItem
+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4;
+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 cropCode:(id)a5 format:(id)a6;
- (BOOL)badgeRequiresTransparency;
- (BOOL)isLiveEvent;
- (BOOL)isNewEpisode;
- (NSDate)rentalExpirationDate;
- (NSNumber)playbackPercentage;
- (NSString)badgeURLTemplate;
- (NSString)context;
- (NSString)cropCode;
- (NSString)identifier;
- (NSString)imageURLTemplate;
- (NSString)subtitle;
- (NSString)subtitleComposed;
- (NSString)subtitleShort;
- (NSString)title;
- (NSURL)actionURL;
- (double)imageAspectRatio;
- (void)setActionURL:(id)a3;
- (void)setBadgeRequiresTransparency:(BOOL)a3;
- (void)setBadgeURLTemplate:(id)a3;
- (void)setContext:(id)a3;
- (void)setCropCode:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageAspectRatio:(double)a3;
- (void)setImageURLTemplate:(id)a3;
- (void)setLiveEvent:(BOOL)a3;
- (void)setNewEpisode:(BOOL)a3;
- (void)setPlaybackPercentage:(id)a3;
- (void)setRentalExpirationDate:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleComposed:(id)a3;
- (void)setSubtitleShort:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVUNContentItem

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 cropCode:(id)a5 format:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  if (a6) {
    CFStringRef v10 = (const __CFString *)a6;
  }
  else {
    CFStringRef v10 = @"jpg";
  }
  id v11 = a6;
  v12 = +[WLKArtworkVariant artworkURLFromTemplate:forSize:cropCode:format:](WLKArtworkVariant, "artworkURLFromTemplate:forSize:cropCode:format:", a3, a5, v10, width, height);

  return v12;
}

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4
{
  return [a1 artworkURLFromTemplate:a3 forSize:0 cropCode:0 format:a4.width, a4.height];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitleShort
{
  return self->_subtitleShort;
}

- (void)setSubtitleShort:(id)a3
{
}

- (NSString)subtitleComposed
{
  return self->_subtitleComposed;
}

- (void)setSubtitleComposed:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSNumber)playbackPercentage
{
  return self->_playbackPercentage;
}

- (void)setPlaybackPercentage:(id)a3
{
}

- (NSDate)rentalExpirationDate
{
  return self->_rentalExpirationDate;
}

- (void)setRentalExpirationDate:(id)a3
{
}

- (BOOL)isLiveEvent
{
  return self->_liveEvent;
}

- (void)setLiveEvent:(BOOL)a3
{
  self->_liveEvent = a3;
}

- (BOOL)isNewEpisode
{
  return self->_newEpisode;
}

- (void)setNewEpisode:(BOOL)a3
{
  self->_newEpisode = a3;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (void)setImageURLTemplate:(id)a3
{
}

- (double)imageAspectRatio
{
  return self->_imageAspectRatio;
}

- (void)setImageAspectRatio:(double)a3
{
  self->_imageAspectRatio = a3;
}

- (NSString)badgeURLTemplate
{
  return self->_badgeURLTemplate;
}

- (void)setBadgeURLTemplate:(id)a3
{
}

- (BOOL)badgeRequiresTransparency
{
  return self->_badgeRequiresTransparency;
}

- (void)setBadgeRequiresTransparency:(BOOL)a3
{
  self->_badgeRequiresTransparency = a3;
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (void)setCropCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_badgeURLTemplate, 0);
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_rentalExpirationDate, 0);
  objc_storeStrong((id *)&self->_playbackPercentage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_subtitleComposed, 0);
  objc_storeStrong((id *)&self->_subtitleShort, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end