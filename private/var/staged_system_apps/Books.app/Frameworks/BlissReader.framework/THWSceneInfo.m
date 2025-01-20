@interface THWSceneInfo
- (Class)layoutClass;
- (Class)repClass;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (NSURL)sourceURL;
- (PFDContext)drmContext;
- (THWPanelContentProvider)panelContentProvider;
- (THWSceneInfo)initWithContext:(id)a3 geometry:(id)a4;
- (THWSceneInfo)initWithContext:(id)a3 geometry:(id)a4 sourceURL:(id)a5 drmContext:(id)a6 stageColor:(id)a7;
- (TSDImageInfo)placeholderImage;
- (TSUColor)stageColor;
- (id)p_validateFileURL:(id)a3;
- (int)idleAnimationBehavior;
- (int)rotationConstraints;
- (void)dealloc;
- (void)setDrmContext:(id)a3;
- (void)setIdleAnimationBehavior:(int)a3;
- (void)setPanelContentProvider:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
- (void)setRotationConstraints:(int)a3;
- (void)setSourceURL:(id)a3;
- (void)setStageColor:(id)a3;
@end

@implementation THWSceneInfo

- (THWSceneInfo)initWithContext:(id)a3 geometry:(id)a4 sourceURL:(id)a5 drmContext:(id)a6 stageColor:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)THWSceneInfo;
  v10 = [(THWSceneInfo *)&v13 initWithContext:a3 geometry:a4];
  v11 = v10;
  if (v10)
  {
    [(THWSceneInfo *)v10 setIdleAnimationBehavior:0];
    [(THWSceneInfo *)v11 setRotationConstraints:0];
    [(THWSceneInfo *)v11 setSourceURL:[(THWSceneInfo *)v11 p_validateFileURL:a5]];
    [(THWSceneInfo *)v11 setDrmContext:a6];
    if (!a7) {
      a7 = +[TSUColor clearColor];
    }
    [(THWSceneInfo *)v11 setStageColor:a7];
  }
  return v11;
}

- (THWSceneInfo)initWithContext:(id)a3 geometry:(id)a4
{
  return [(THWSceneInfo *)self initWithContext:a3 geometry:a4 sourceURL:0 drmContext:0 stageColor:0];
}

- (void)dealloc
{
  [(THWSceneInfo *)self setSourceURL:0];
  [(THWSceneInfo *)self setStageColor:0];
  [(THWSceneInfo *)self setPlaceholderImage:0];
  [(THWSceneInfo *)self setDrmContext:0];

  self->_progressKitID = 0;
  self->_progressKitSectionID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWSceneInfo;
  [(THWSceneInfo *)&v3 dealloc];
}

- (id)p_validateFileURL:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v6 = 0;
    id v7 = 0;
    [a3 getResourceValue:&v7 forKey:NSURLIsDirectoryKey error:&v6];
    if (![v3 isFileURL]
      || v6
      || [v7 BOOLValue]
      || !-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [v3 path]))
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneInfo p_validateFileURL:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneInfo.m") lineNumber:90 description:@"Invalid sourceURL for widget %@: %@", self, v3];
      return 0;
    }
  }
  return v3;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (THWPanelContentProvider)panelContentProvider
{
  return self->_panelContentProvider;
}

- (void)setPanelContentProvider:(id)a3
{
  self->_panelContentProvider = (THWPanelContentProvider *)a3;
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (PFDContext)drmContext
{
  return self->_drmContext;
}

- (void)setDrmContext:(id)a3
{
}

- (TSUColor)stageColor
{
  return self->_stageColor;
}

- (void)setStageColor:(id)a3
{
}

- (TSDImageInfo)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (int)idleAnimationBehavior
{
  return self->_idleAnimationBehavior;
}

- (void)setIdleAnimationBehavior:(int)a3
{
  self->_idleAnimationBehavior = a3;
}

- (int)rotationConstraints
{
  return self->_rotationConstraints;
}

- (void)setRotationConstraints:(int)a3
{
  self->_rotationConstraints = a3;
}

@end