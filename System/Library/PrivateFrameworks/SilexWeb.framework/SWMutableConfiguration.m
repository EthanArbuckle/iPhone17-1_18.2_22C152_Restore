@interface SWMutableConfiguration
- (BOOL)is24HourTime;
- (BOOL)isTransitioning;
- (BOOL)supportsLiveActivities;
- (CGRect)contentFrame;
- (CGSize)canvasSize;
- (NSDictionary)dataSources;
- (NSLocale)locale;
- (NSString)contentEnvironment;
- (NSString)contentSizeCategory;
- (NSString)storeFront;
- (NSURL)activePictureInPictureURL;
- (NSURL)sourceURL;
- (SWFeedConfiguration)feedConfiguration;
- (SWKeyboardConfiguration)keyboardConfiguration;
- (SWLocation)location;
- (int64_t)networkStatus;
- (void)setActivePictureInPictureURL:(id)a3;
- (void)setCanvasSize:(CGSize)a3;
- (void)setContentEnvironment:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setFeedConfiguration:(id)a3;
- (void)setIs24HourTime:(BOOL)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setKeyboardConfiguration:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNetworkStatus:(int64_t)a3;
- (void)setSourceURL:(id)a3;
- (void)setStoreFront:(id)a3;
- (void)setSupportsLiveActivities:(BOOL)a3;
@end

@implementation SWMutableConfiguration

- (NSString)storeFront
{
  return self->storeFront;
}

- (void)setStoreFront:(id)a3
{
}

- (NSLocale)locale
{
  return self->locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)contentEnvironment
{
  return self->contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
}

- (BOOL)is24HourTime
{
  return self->is24HourTime;
}

- (void)setIs24HourTime:(BOOL)a3
{
  self->is24HourTime = a3;
}

- (BOOL)supportsLiveActivities
{
  return self->supportsLiveActivities;
}

- (void)setSupportsLiveActivities:(BOOL)a3
{
  self->supportsLiveActivities = a3;
}

- (NSString)contentSizeCategory
{
  return self->contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (CGSize)canvasSize
{
  double width = self->canvasSize.width;
  double height = self->canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->canvasSize = a3;
}

- (CGRect)contentFrame
{
  double x = self->contentFrame.origin.x;
  double y = self->contentFrame.origin.y;
  double width = self->contentFrame.size.width;
  double height = self->contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->contentFrame = a3;
}

- (NSDictionary)dataSources
{
  return self->dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (SWLocation)location
{
  return self->location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSURL)activePictureInPictureURL
{
  return self->activePictureInPictureURL;
}

- (void)setActivePictureInPictureURL:(id)a3
{
}

- (SWFeedConfiguration)feedConfiguration
{
  return self->feedConfiguration;
}

- (void)setFeedConfiguration:(id)a3
{
}

- (SWKeyboardConfiguration)keyboardConfiguration
{
  return self->keyboardConfiguration;
}

- (void)setKeyboardConfiguration:(id)a3
{
}

- (int64_t)networkStatus
{
  return self->networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->networkStatus = a3;
}

- (BOOL)isTransitioning
{
  return self->isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->isTransitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keyboardConfiguration, 0);
  objc_storeStrong((id *)&self->feedConfiguration, 0);
  objc_storeStrong((id *)&self->activePictureInPictureURL, 0);
  objc_storeStrong((id *)&self->sourceURL, 0);
  objc_storeStrong((id *)&self->location, 0);
  objc_storeStrong((id *)&self->dataSources, 0);
  objc_storeStrong((id *)&self->contentSizeCategory, 0);
  objc_storeStrong((id *)&self->contentEnvironment, 0);
  objc_storeStrong((id *)&self->locale, 0);
  objc_storeStrong((id *)&self->storeFront, 0);
}

@end