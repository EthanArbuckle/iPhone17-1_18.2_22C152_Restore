@interface PFCStoredLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)userEdited;
- (CGRect)originalCrop;
- (CGRect)timeRect;
- (NSData)colorInfo;
- (NSString)baseImageName;
- (NSString)maskImageName;
- (PFCStoredLayout)initWithCoder:(id)a3;
- (double)backgroundZorder;
- (double)foregroundZorder;
- (double)imageAOTBrightness;
- (double)timeElementZorder;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)timePosition;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundZorder:(double)a3;
- (void)setBaseImageName:(id)a3;
- (void)setColorInfo:(id)a3;
- (void)setForegroundZorder:(double)a3;
- (void)setImageAOTBrightness:(double)a3;
- (void)setMaskImageName:(id)a3;
- (void)setOriginalCrop:(CGRect)a3;
- (void)setTimeElementZorder:(double)a3;
- (void)setTimePosition:(unint64_t)a3;
- (void)setTimeRect:(CGRect)a3;
- (void)setUserEdited:(BOOL)a3;
@end

@implementation PFCStoredLayout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_originalCrop.origin.x;
  double y = self->_originalCrop.origin.y;
  double width = self->_originalCrop.size.width;
  double height = self->_originalCrop.size.height;
  id v12 = a3;
  objc_msgSend(v12, "encodeCGRect:forKey:", @"originalCrop", x, y, width, height);
  [v12 encodeObject:self->_baseImageName forKey:@"baseImageName"];
  [v12 encodeObject:self->_maskImageName forKey:@"maskImageName"];
  [v12 encodeInteger:self->_timePosition forKey:@"timePosition"];
  objc_msgSend(v12, "encodeCGRect:forKey:", @"timeRect", self->_timeRect.origin.x, self->_timeRect.origin.y, self->_timeRect.size.width, self->_timeRect.size.height);
  double backgroundZorder = self->_backgroundZorder;
  *(float *)&double backgroundZorder = backgroundZorder;
  [v12 encodeFloat:@"backgroundZorder" forKey:backgroundZorder];
  double foregroundZorder = self->_foregroundZorder;
  *(float *)&double foregroundZorder = foregroundZorder;
  [v12 encodeFloat:@"foregroundZorder" forKey:foregroundZorder];
  double timeElementZorder = self->_timeElementZorder;
  *(float *)&double timeElementZorder = timeElementZorder;
  [v12 encodeFloat:@"timeElementZorder" forKey:timeElementZorder];
  double imageAOTBrightness = self->_imageAOTBrightness;
  *(float *)&double imageAOTBrightness = imageAOTBrightness;
  [v12 encodeFloat:@"imageAOTBrightness" forKey:imageAOTBrightness];
  [v12 encodeBool:self->_userEdited forKey:@"userEdited"];
}

- (PFCStoredLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFCStoredLayout;
  v5 = [(PFCStoredLayout *)&v24 init];
  if (v5)
  {
    [v4 decodeCGRectForKey:@"originalCrop"];
    v5->_originalCrop.origin.double x = v6;
    v5->_originalCrop.origin.double y = v7;
    v5->_originalCrop.size.double width = v8;
    v5->_originalCrop.size.double height = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseImageName"];
    baseImageName = v5->_baseImageName;
    v5->_baseImageName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maskImageName"];
    maskImageName = v5->_maskImageName;
    v5->_maskImageName = (NSString *)v12;

    v5->_timePosition = [v4 decodeIntegerForKey:@"timePosition"];
    [v4 decodeCGRectForKey:@"timeRect"];
    v5->_timeRect.origin.double x = v14;
    v5->_timeRect.origin.double y = v15;
    v5->_timeRect.size.double width = v16;
    v5->_timeRect.size.double height = v17;
    [v4 decodeFloatForKey:@"backgroundZorder"];
    v5->_double backgroundZorder = v18;
    [v4 decodeFloatForKey:@"foregroundZorder"];
    v5->_double foregroundZorder = v19;
    [v4 decodeFloatForKey:@"timeElementZorder"];
    v5->_double timeElementZorder = v20;
    [v4 decodeFloatForKey:@"imageAOTBrightness"];
    v5->_double imageAOTBrightness = v21;
    v5->_userEdited = [v4 decodeBoolForKey:@"userEdited"];
    colorInfo = v5->_colorInfo;
    v5->_colorInfo = 0;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setOriginalCrop:", self->_originalCrop.origin.x, self->_originalCrop.origin.y, self->_originalCrop.size.width, self->_originalCrop.size.height);
  CGFloat v6 = (void *)[(NSString *)self->_baseImageName copyWithZone:a3];
  [v5 setBaseImageName:v6];

  CGFloat v7 = (void *)[(NSString *)self->_maskImageName copyWithZone:a3];
  [v5 setMaskImageName:v7];

  [v5 setTimePosition:self->_timePosition];
  objc_msgSend(v5, "setTimeRect:", self->_timeRect.origin.x, self->_timeRect.origin.y, self->_timeRect.size.width, self->_timeRect.size.height);
  [v5 setBackgroundZorder:self->_backgroundZorder];
  [v5 setForegroundZorder:self->_foregroundZorder];
  [v5 setTimeElementZorder:self->_timeElementZorder];
  [v5 setImageAOTBrightness:self->_imageAOTBrightness];
  [v5 setUserEdited:self->_userEdited];
  [v5 setColorInfo:0];
  return v5;
}

- (CGRect)originalCrop
{
  double x = self->_originalCrop.origin.x;
  double y = self->_originalCrop.origin.y;
  double width = self->_originalCrop.size.width;
  double height = self->_originalCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalCrop:(CGRect)a3
{
  self->_originalCrop = a3;
}

- (NSString)baseImageName
{
  return self->_baseImageName;
}

- (void)setBaseImageName:(id)a3
{
}

- (NSString)maskImageName
{
  return self->_maskImageName;
}

- (void)setMaskImageName:(id)a3
{
}

- (unint64_t)timePosition
{
  return self->_timePosition;
}

- (void)setTimePosition:(unint64_t)a3
{
  self->_timePosition = a3;
}

- (CGRect)timeRect
{
  double x = self->_timeRect.origin.x;
  double y = self->_timeRect.origin.y;
  double width = self->_timeRect.size.width;
  double height = self->_timeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTimeRect:(CGRect)a3
{
  self->_timeRect = a3;
}

- (double)backgroundZorder
{
  return self->_backgroundZorder;
}

- (void)setBackgroundZorder:(double)a3
{
  self->_double backgroundZorder = a3;
}

- (double)foregroundZorder
{
  return self->_foregroundZorder;
}

- (void)setForegroundZorder:(double)a3
{
  self->_double foregroundZorder = a3;
}

- (double)timeElementZorder
{
  return self->_timeElementZorder;
}

- (void)setTimeElementZorder:(double)a3
{
  self->_double timeElementZorder = a3;
}

- (double)imageAOTBrightness
{
  return self->_imageAOTBrightness;
}

- (void)setImageAOTBrightness:(double)a3
{
  self->_double imageAOTBrightness = a3;
}

- (BOOL)userEdited
{
  return self->_userEdited;
}

- (void)setUserEdited:(BOOL)a3
{
  self->_userEdited = a3;
}

- (NSData)colorInfo
{
  return self->_colorInfo;
}

- (void)setColorInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorInfo, 0);
  objc_storeStrong((id *)&self->_maskImageName, 0);
  objc_storeStrong((id *)&self->_baseImageName, 0);
}

@end