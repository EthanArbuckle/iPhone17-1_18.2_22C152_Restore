@interface WBSTemplateIconResponse
+ (id)responseWithURL:(id)a3 image:(id)a4 highlightedImage:(id)a5 themeColor:(id)a6 isMonogram:(BOOL)a7;
- (BOOL)isMonogram;
- (UIColor)themeColor;
- (UIImage)highlightedImage;
- (UIImage)image;
- (WBSTemplateIconResponse)initWithURL:(id)a3;
- (WBSTemplateIconResponse)initWithURL:(id)a3 image:(id)a4 highlightedImage:(id)a5 themeColor:(id)a6 isMonogram:(BOOL)a7;
@end

@implementation WBSTemplateIconResponse

+ (id)responseWithURL:(id)a3 image:(id)a4 highlightedImage:(id)a5 themeColor:(id)a6 isMonogram:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithURL:v15 image:v14 highlightedImage:v13 themeColor:v12 isMonogram:v7];

  return v16;
}

- (WBSTemplateIconResponse)initWithURL:(id)a3
{
  return 0;
}

- (WBSTemplateIconResponse)initWithURL:(id)a3 image:(id)a4 highlightedImage:(id)a5 themeColor:(id)a6 isMonogram:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBSTemplateIconResponse;
  v16 = [(WBSSiteMetadataResponse *)&v20 initWithURL:a3];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a4);
    objc_storeStrong((id *)&v17->_highlightedImage, a5);
    objc_storeStrong((id *)&v17->_themeColor, a6);
    v17->_monogram = a7;
    v18 = v17;
  }

  return v17;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)highlightedImage
{
  return self->_highlightedImage;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (BOOL)isMonogram
{
  return self->_monogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end