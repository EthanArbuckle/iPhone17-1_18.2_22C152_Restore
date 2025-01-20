@interface SWContainerConfiguration
- (BOOL)supportsLiveActivities;
- (CGRect)contentFrame;
- (CGSize)canvasSize;
- (NSDictionary)dataSources;
- (NSLocale)locale;
- (NSString)contentEnvironment;
- (NSString)contentSizeCategory;
- (NSString)identifier;
- (NSString)storeFront;
- (NSURL)activePictureInPictureURL;
- (NSURL)sourceURL;
- (SWContainerConfiguration)initWithStoreFront:(id)a3 locale:(id)a4 contentEnvironment:(id)a5 contentSizeCategory:(id)a6 canvasSize:(CGSize)a7 contentFrame:(CGRect)a8 dataSources:(id)a9 location:(id)a10 sourceURL:(id)a11 activePictureInPictureURL:(id)a12 feedConfiguration:(id)a13 supportsLiveActivities:(BOOL)a14;
- (SWFeedConfiguration)feedConfiguration;
- (SWLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActivePictureInPictureURL:(id)a3;
- (void)setCanvasSize:(CGSize)a3;
- (void)setContentEnvironment:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setFeedConfiguration:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocation:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setStoreFront:(id)a3;
- (void)setSupportsLiveActivities:(BOOL)a3;
@end

@implementation SWContainerConfiguration

- (SWContainerConfiguration)initWithStoreFront:(id)a3 locale:(id)a4 contentEnvironment:(id)a5 contentSizeCategory:(id)a6 canvasSize:(CGSize)a7 contentFrame:(CGRect)a8 dataSources:(id)a9 location:(id)a10 sourceURL:(id)a11 activePictureInPictureURL:(id)a12 feedConfiguration:(id)a13 supportsLiveActivities:(BOOL)a14
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  double v23 = a7.height;
  double v24 = a7.width;
  id v37 = a3;
  id v26 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a9;
  id v30 = a10;
  id v31 = a11;
  id v32 = a12;
  id v33 = a13;
  v38.receiver = self;
  v38.super_class = (Class)SWContainerConfiguration;
  v34 = [(SWContainerConfiguration *)&v38 init];
  v35 = v34;
  if (v34)
  {
    [(SWContainerConfiguration *)v34 setStoreFront:v37];
    [(SWContainerConfiguration *)v35 setLocale:v26];
    [(SWContainerConfiguration *)v35 setContentEnvironment:v27];
    [(SWContainerConfiguration *)v35 setContentSizeCategory:v28];
    -[SWContainerConfiguration setCanvasSize:](v35, "setCanvasSize:", v24, v23);
    -[SWContainerConfiguration setContentFrame:](v35, "setContentFrame:", x, y, width, height);
    [(SWContainerConfiguration *)v35 setDataSources:v29];
    [(SWContainerConfiguration *)v35 setLocation:v30];
    [(SWContainerConfiguration *)v35 setSourceURL:v31];
    [(SWContainerConfiguration *)v35 setActivePictureInPictureURL:v32];
    [(SWContainerConfiguration *)v35 setFeedConfiguration:v33];
    [(SWContainerConfiguration *)v35 setSupportsLiveActivities:a14];
  }

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v28 = [SWContainerConfiguration alloc];
  v4 = [(SWContainerConfiguration *)self storeFront];
  v5 = [(SWContainerConfiguration *)self locale];
  v6 = [(SWContainerConfiguration *)self contentEnvironment];
  v7 = [(SWContainerConfiguration *)self contentSizeCategory];
  [(SWContainerConfiguration *)self canvasSize];
  double v9 = v8;
  double v11 = v10;
  [(SWContainerConfiguration *)self contentFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(SWContainerConfiguration *)self dataSources];
  v21 = [(SWContainerConfiguration *)self location];
  v22 = [(SWContainerConfiguration *)self sourceURL];
  double v23 = [(SWContainerConfiguration *)self activePictureInPictureURL];
  double v24 = [(SWContainerConfiguration *)self feedConfiguration];
  LOBYTE(v27) = [(SWContainerConfiguration *)self supportsLiveActivities];
  v25 = -[SWContainerConfiguration initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:](v28, "initWithStoreFront:locale:contentEnvironment:contentSizeCategory:canvasSize:contentFrame:dataSources:location:sourceURL:activePictureInPictureURL:feedConfiguration:supportsLiveActivities:", v4, v5, v6, v7, v20, v21, v9, v11, v13, v15, v17, v19, v22, v23, v24, v27);

  return v25;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)contentEnvironment
{
  return self->_contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (NSDictionary)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (SWLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSURL)activePictureInPictureURL
{
  return self->_activePictureInPictureURL;
}

- (void)setActivePictureInPictureURL:(id)a3
{
}

- (SWFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (void)setFeedConfiguration:(id)a3
{
}

- (BOOL)supportsLiveActivities
{
  return self->_supportsLiveActivities;
}

- (void)setSupportsLiveActivities:(BOOL)a3
{
  self->_supportsLiveActivities = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_activePictureInPictureURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_contentEnvironment, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
}

@end