@interface FCHeadlineThumbnailMetadata
- (BOOL)hasThumbnail;
- (CGRect)focalFrame;
- (FCColor)accentColor;
- (FCColor)backgroundColor;
- (FCColor)primaryColor;
- (FCColor)textColor;
- (FCHeadlineThumbnailImageMetadata)defaultQualityImage;
- (FCHeadlineThumbnailImageMetadata)highQualityImage;
- (FCHeadlineThumbnailImageMetadata)lowQualityImage;
- (FCHeadlineThumbnailImageMetadata)mediumQualityImage;
- (FCHeadlineThumbnailImageMetadata)ultraQualityImage;
- (FCHeadlineThumbnailMetadata)initWithTextColor:(id)a3 backgroundColor:(id)a4 accentColor:(id)a5 primaryColor:(id)a6 focalFrame:(unint64_t)a7 lowQualityImage:(id)a8 defaultQualityImage:(id)a9 mediumQualityImage:(id)a10 highQualityImage:(id)a11 ultraQualityImage:(id)a12;
- (unint64_t)focalFrameBuffer;
- (void)setFocalFrame:(CGRect)a3;
- (void)setFocalFrameBuffer:(unint64_t)a3;
@end

@implementation FCHeadlineThumbnailMetadata

- (FCHeadlineThumbnailMetadata)initWithTextColor:(id)a3 backgroundColor:(id)a4 accentColor:(id)a5 primaryColor:(id)a6 focalFrame:(unint64_t)a7 lowQualityImage:(id)a8 defaultQualityImage:(id)a9 mediumQualityImage:(id)a10 highQualityImage:(id)a11 ultraQualityImage:(id)a12
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a8;
  id v28 = a9;
  id v27 = a10;
  id v26 = a11;
  id v18 = a12;
  v34.receiver = self;
  v34.super_class = (Class)FCHeadlineThumbnailMetadata;
  v19 = [(FCHeadlineThumbnailMetadata *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_textColor, a3);
    objc_storeStrong((id *)&v20->_backgroundColor, a4);
    objc_storeStrong((id *)&v20->_accentColor, a5);
    objc_storeStrong((id *)&v20->_primaryColor, a6);
    v20->_focalFrame.origin.x = FCCGRectFromBuffer(a7);
    v20->_focalFrame.origin.y = v21;
    v20->_focalFrame.size.width = v22;
    v20->_focalFrame.size.height = v23;
    v20->_focalFrameBuffer = a7;
    objc_storeStrong((id *)&v20->_lowQualityImage, a8);
    objc_storeStrong((id *)&v20->_defaultQualityImage, a9);
    objc_storeStrong((id *)&v20->_mediumQualityImage, a10);
    objc_storeStrong((id *)&v20->_highQualityImage, a11);
    objc_storeStrong((id *)&v20->_ultraQualityImage, a12);
  }

  return v20;
}

- (BOOL)hasThumbnail
{
  return self->_lowQualityImage
      || self->_defaultQualityImage
      || self->_mediumQualityImage
      || self->_highQualityImage
      || self->_ultraQualityImage != 0;
}

- (FCColor)textColor
{
  return self->_textColor;
}

- (FCColor)backgroundColor
{
  return self->_backgroundColor;
}

- (FCColor)accentColor
{
  return self->_accentColor;
}

- (FCColor)primaryColor
{
  return self->_primaryColor;
}

- (CGRect)focalFrame
{
  double x = self->_focalFrame.origin.x;
  double y = self->_focalFrame.origin.y;
  double width = self->_focalFrame.size.width;
  double height = self->_focalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocalFrame:(CGRect)a3
{
  self->_focalFrame = a3;
}

- (unint64_t)focalFrameBuffer
{
  return self->_focalFrameBuffer;
}

- (void)setFocalFrameBuffer:(unint64_t)a3
{
  self->_focalFrameBuffer = a3;
}

- (FCHeadlineThumbnailImageMetadata)lowQualityImage
{
  return self->_lowQualityImage;
}

- (FCHeadlineThumbnailImageMetadata)defaultQualityImage
{
  return self->_defaultQualityImage;
}

- (FCHeadlineThumbnailImageMetadata)mediumQualityImage
{
  return self->_mediumQualityImage;
}

- (FCHeadlineThumbnailImageMetadata)highQualityImage
{
  return self->_highQualityImage;
}

- (FCHeadlineThumbnailImageMetadata)ultraQualityImage
{
  return self->_ultraQualityImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ultraQualityImage, 0);
  objc_storeStrong((id *)&self->_highQualityImage, 0);
  objc_storeStrong((id *)&self->_mediumQualityImage, 0);
  objc_storeStrong((id *)&self->_defaultQualityImage, 0);
  objc_storeStrong((id *)&self->_lowQualityImage, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end