@interface THWWebInfo
- (BOOL)allowNetworkAccess;
- (BOOL)ignoreInfoPlist;
- (CGSize)idealWebSize;
- (Class)layoutClass;
- (Class)repClass;
- (NSString)bookID;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (NSURL)bookBundleURL;
- (NSURL)sourceURL;
- (PFDContext)drmContext;
- (THWAutoplayConfig)autoplayConfig;
- (THWWebInfo)initWithContext:(id)a3 geometry:(id)a4 stageGeometry:(id)a5 sourceURL:(id)a6 drmContext:(id)a7 exposurePolicy:(int)a8 ignoreInfoPlist:(BOOL)a9 allowNetworkAccess:(BOOL)a10 autoplayConfig:(id)a11;
- (THWWidgetAdornmentInfo)adornmentInfo;
- (TSDInfo)placeholderInfo;
- (TSDInfoGeometry)stageGeometry;
- (TSUImage)defaultImage;
- (TSUImage)placeholderImage;
- (id)p_defaultImage;
- (id)p_loadImageWithFilename:(id)a3;
- (id)p_placeholderImage;
- (int)exposurePolicy;
- (void)dealloc;
- (void)setAdornmentInfo:(id)a3;
- (void)setIgnoreInfoPlist:(BOOL)a3;
- (void)setPlaceholderInfo:(id)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
@end

@implementation THWWebInfo

- (THWWebInfo)initWithContext:(id)a3 geometry:(id)a4 stageGeometry:(id)a5 sourceURL:(id)a6 drmContext:(id)a7 exposurePolicy:(int)a8 ignoreInfoPlist:(BOOL)a9 allowNetworkAccess:(BOOL)a10 autoplayConfig:(id)a11
{
  v17.receiver = self;
  v17.super_class = (Class)THWWebInfo;
  v15 = [(THWWebInfo *)&v17 initWithContext:a3 geometry:a4];
  if (v15)
  {
    v15->_stageGeometry = (TSDInfoGeometry *)a5;
    v15->_sourceURL = (NSURL *)a6;
    v15->_drmContext = (PFDContext *)a7;
    v15->_exposurePolicy = a8;
    v15->_ignoreInfoPlist = a9;
    v15->_allowNetworkAccess = a10;
    v15->_autoplayConfig = (THWAutoplayConfig *)a11;
  }
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWWebInfo;
  [(THWWebInfo *)&v3 dealloc];
}

- (CGSize)idealWebSize
{
  p_idealWebSize = &self->_idealWebSize;
  double width = self->_idealWebSize.width;
  double height = self->_idealWebSize.height;
  double v5 = CGSizeZero.height;
  if (width == CGSizeZero.width && height == v5)
  {
    if (!self->_ignoreInfoPlist)
    {
      v8 = +[NSData dataWithContentsOfURL:[[(NSURL *)[(THWWebInfo *)self sourceURL] URLByDeletingLastPathComponent] URLByAppendingPathComponent:@"Info.plist"] drmContext:[(THWWebInfo *)self drmContext] error:0];
      if (!v8) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebInfo idealWebSize]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebInfo.m") lineNumber:99 description:@"invalid nil value for '%s'", "infoPlistData"];
      }
      v9 = +[NSDictionary dictionaryWithContentsOfPlistData:v8];
      if (!v9) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebInfo idealWebSize]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebInfo.m") lineNumber:101 description:@"Expected a valid Info.plist inside web widget"];
      }
      objc_opt_class();
      [(NSDictionary *)v9 objectForKey:@"Width"];
      [(id)TSUDynamicCast() floatValue];
      float v11 = v10;
      if (v10 == 0.0)
      {
        objc_opt_class();
        [(NSDictionary *)v9 objectForKey:@"Width"];
        float v11 = (float)(int)[(id)TSUDynamicCast() intValue];
      }
      objc_opt_class();
      [(NSDictionary *)v9 objectForKey:@"Height"];
      [(id)TSUDynamicCast() floatValue];
      if (v12 == 0.0)
      {
        objc_opt_class();
        [(NSDictionary *)v9 objectForKey:@"Height"];
        float v12 = (float)(int)[(id)TSUDynamicCast() intValue];
      }
      BOOL v13 = v12 > 0.0;
      double v14 = v12;
      if (v11 > 0.0 && v13)
      {
        double height = v14;
        double width = v11;
      }
    }
    if (width == CGSizeZero.width && height == v5)
    {
      id v16 = [(THWWebInfo *)self p_defaultImage];
      if (v16)
      {
        [v16 size];
        double width = v17;
        double height = v18;
      }
      else
      {
        [(TSDInfoGeometry *)[(THWWebInfo *)self stageGeometry] boundsBeforeRotation];
        double width = v19;
        double height = v20;
      }
    }
    p_idealWebSize->double width = width;
    p_idealWebSize->double height = height;
  }
  double v21 = width;
  double v22 = height;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (TSUImage)defaultImage
{
  CGSize result = [(THWWebInfo *)self p_defaultImage];
  if (!result)
  {
    return (TSUImage *)[(THWWebInfo *)self p_placeholderImage];
  }
  return result;
}

- (TSUImage)placeholderImage
{
  CGSize result = [(THWWebInfo *)self p_placeholderImage];
  if (!result)
  {
    return (TSUImage *)[(THWWebInfo *)self p_defaultImage];
  }
  return result;
}

- (NSString)bookID
{
  objc_opt_class();
  [(THWWebInfo *)self documentRoot];
  id v3 = [(id)TSUDynamicCast() bookDescription];

  return (NSString *)[v3 annotationID];
}

- (NSURL)bookBundleURL
{
  objc_opt_class();
  [(THWWebInfo *)self documentRoot];
  id v3 = [(id)TSUDynamicCast() bookDescription];

  return (NSURL *)[v3 bookBundleUrl];
}

- (void)setPlaceholderInfo:(id)a3
{
  placeholderInfo = self->_placeholderInfo;
  if (placeholderInfo != a3)
  {

    self->_placeholderInfo = (TSDInfo *)a3;
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)p_loadImageWithFilename:(id)a3
{
  id result = [[(NSURL *)[(THWWebInfo *)self sourceURL] URLByDeletingLastPathComponent] URLByAppendingPathComponent:a3];
  if (result)
  {
    v6 = +[NSData dataWithContentsOfURL:result drmContext:[(THWWebInfo *)self drmContext] error:0];
    if (!v6) {
      v6 = +[NSData dataWithContentsOfURL:drmContext:error:](NSData, "dataWithContentsOfURL:drmContext:error:", -[NSURL URLByAppendingPathComponent:](-[NSURL URLByDeletingLastPathComponent](-[THWWebInfo sourceURL](self, "sourceURL"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", [a3 lowercaseString]), -[THWWebInfo drmContext](self, "drmContext"), 0);
    }
    return +[TSUImage imageWithData:v6];
  }
  return result;
}

- (id)p_defaultImage
{
  TSUScreenScale();
  if (v3 <= 1.0
    || (id result = [(THWWebInfo *)self p_loadImageWithFilename:@"Default@2x.png"]) == 0)
  {
    return [(THWWebInfo *)self p_loadImageWithFilename:@"Default.png"];
  }
  return result;
}

- (id)p_placeholderImage
{
  if (!self->_placeholderInfo) {
    return 0;
  }
  objc_opt_class();
  double v3 = (void *)TSUDynamicCast();
  if (!v3
    || (v4 = v3, [v3 opacity], v5 != 1.0)
    || [v4 maskInfo]
    || [v4 reflection]
    || [v4 stroke] && (objc_msgSend(objc_msgSend(v4, "stroke"), "shouldRender") & 1) != 0
    || [v4 shadow] && (objc_msgSend(objc_msgSend(v4, "shadow"), "isEnabled") & 1) != 0
    || (id result = +[TSUImage imageWithImageData:](TSUImage, "imageWithImageData:", [v4 imageData])) == 0)
  {
    v6 = +[TSDImager CGImageForInfo:self->_placeholderInfo documentRoot:[(THWWebInfo *)self documentRoot]];
    return +[TSUImage imageWithCGImage:v6];
  }
  return result;
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
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

- (TSDInfoGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (PFDContext)drmContext
{
  return self->_drmContext;
}

- (int)exposurePolicy
{
  return self->_exposurePolicy;
}

- (BOOL)allowNetworkAccess
{
  return self->_allowNetworkAccess;
}

- (THWAutoplayConfig)autoplayConfig
{
  return self->_autoplayConfig;
}

- (BOOL)ignoreInfoPlist
{
  return self->_ignoreInfoPlist;
}

- (void)setIgnoreInfoPlist:(BOOL)a3
{
  self->_ignoreInfoPlist = a3;
}

- (TSDInfo)placeholderInfo
{
  return self->_placeholderInfo;
}

@end