@interface SSMetricsBaseEvent
- (BOOL)isBlacklistedByConfiguration:(id)a3;
- (NSNumber)pixelRatio;
- (NSNumber)screenHeight;
- (NSNumber)screenWidth;
- (NSNumber)windowHeight;
- (NSNumber)windowWidth;
- (NSString)pageContext;
- (NSString)pageDescription;
- (NSString)pageType;
- (NSString)pageURL;
- (NSString)windowOrientation;
- (SSMetricsBaseEvent)init;
- (id)description;
- (unint64_t)pageID;
- (void)setPageContext:(id)a3;
- (void)setPageDescription:(id)a3;
- (void)setPageID:(unint64_t)a3;
- (void)setPageType:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setPixelRatio:(id)a3;
- (void)setScreenHeight:(id)a3;
- (void)setScreenWidth:(id)a3;
- (void)setWindowHeight:(id)a3;
- (void)setWindowOrientation:(id)a3;
- (void)setWindowWidth:(id)a3;
@end

@implementation SSMetricsBaseEvent

- (SSMetricsBaseEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)SSMetricsBaseEvent;
  v2 = [(SSMetricsMutableEvent *)&v9 init];
  if (v2)
  {
    if (init_sToken != -1) {
      dispatch_once(&init_sToken, &__block_literal_global_43);
    }
    v3 = [(id)__mainScreenAnswers objectForKey:@"main-screen-width"];
    [(SSMetricsMutableEvent *)v2 setProperty:v3 forBodyKey:@"screenWidth"];

    v4 = [(id)__mainScreenAnswers objectForKey:@"main-screen-height"];
    [(SSMetricsMutableEvent *)v2 setProperty:v4 forBodyKey:@"screenHeight"];

    v5 = [(id)__mainScreenAnswers objectForKey:@"main-screen-scale"];
    [(SSMetricsMutableEvent *)v2 setProperty:v5 forBodyKey:@"pixelRatio"];

    v6 = [(id)__mainScreenAnswers objectForKey:@"main-screen-width"];
    [(SSMetricsMutableEvent *)v2 setProperty:v6 forBodyKey:@"windowInnerWidth"];

    v7 = [(id)__mainScreenAnswers objectForKey:@"main-screen-height"];
    [(SSMetricsMutableEvent *)v2 setProperty:v7 forBodyKey:@"windowInnerHeight"];
  }
  return v2;
}

void __26__SSMetricsBaseEvent_init__block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"main-screen-width";
  v2[1] = @"main-screen-height";
  v2[2] = @"main-screen-scale";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  uint64_t v0 = MGCopyMultipleAnswers();
  v1 = (void *)__mainScreenAnswers;
  __mainScreenAnswers = v0;
}

- (BOOL)isBlacklistedByConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSMetricsBaseEvent;
  return [(SSMetricsEvent *)&v4 isBlacklistedByConfiguration:a3];
}

- (NSString)pageContext
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageContext"];
}

- (NSString)pageDescription
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"page"];
}

- (unint64_t)pageID
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageId"];
  unint64_t v3 = [v2 longLongValue];

  return v3;
}

- (NSString)pageType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageType"];
}

- (NSString)pageURL
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageUrl"];
}

- (NSNumber)pixelRatio
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"pixelRatio"];
}

- (NSNumber)screenHeight
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"screenHeight"];
}

- (NSNumber)screenWidth
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"screenWidth"];
}

- (void)setPageContext:(id)a3
{
}

- (void)setPageDescription:(id)a3
{
}

- (void)setPageID:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"pageId"];
  }
  else
  {
    -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:");
  }
}

- (void)setPageType:(id)a3
{
}

- (void)setPageURL:(id)a3
{
}

- (void)setPixelRatio:(id)a3
{
}

- (void)setScreenHeight:(id)a3
{
}

- (void)setScreenWidth:(id)a3
{
}

- (void)setWindowHeight:(id)a3
{
}

- (void)setWindowOrientation:(id)a3
{
}

- (void)setWindowWidth:(id)a3
{
}

- (NSNumber)windowHeight
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"windowInnerHeight"];
}

- (NSString)windowOrientation
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"windowOrientation"];
}

- (NSNumber)windowWidth
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"windowInnerWidth"];
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SSMetricsBaseEvent;
  id v4 = [(SSMetricsBaseEvent *)&v9 description];
  v5 = [(SSMetricsMutableEvent *)self eventType];
  v6 = [(SSMetricsMutableEvent *)self eventVersion];
  v7 = [v3 stringWithFormat:@"%@ -- [Type: %@] [eVersion: %@]", v4, v5, v6];

  return v7;
}

@end