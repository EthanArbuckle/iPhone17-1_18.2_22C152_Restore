@interface PKPassSecurePreviewContext
+ (id)createMessagesPreviewForPassFileURL:(id)a3 withOutputDirectory:(id)a4;
+ (id)createMessagesPreviewForPassesFileURL:(id)a3 withOutputDirectory:(id)a4;
- (CGImage)backgroundImage;
- (CGImage)icon;
- (CGImage)image;
- (NSString)backgroundColor;
- (NSString)primaryColor;
- (NSString)primaryText;
- (NSString)secondaryColor;
- (NSString)secondaryText;
- (NSString)tertiaryColor;
- (NSString)tertiaryText;
- (PKPassSecurePreviewContext)init;
- (id)_initWithBackgroundColor:(id)a3 primaryColor:(id)a4 secondaryColor:(id)a5 tertiaryColor:(id)a6;
- (void)dealloc;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(CGImage *)a3;
- (void)setIcon:(CGImage *)a3;
- (void)setImage:(CGImage *)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setTertiaryColor:(id)a3;
- (void)setTertiaryText:(id)a3;
@end

@implementation PKPassSecurePreviewContext

- (PKPassSecurePreviewContext)init
{
  return 0;
}

- (id)_initWithBackgroundColor:(id)a3 primaryColor:(id)a4 secondaryColor:(id)a5 tertiaryColor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPassSecurePreviewContext;
  v14 = [(PKPassSecurePreviewContext *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    backgroundColor = v14->_backgroundColor;
    v14->_backgroundColor = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    primaryColor = v14->_primaryColor;
    v14->_primaryColor = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    secondaryColor = v14->_secondaryColor;
    v14->_secondaryColor = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    tertiaryColor = v14->_tertiaryColor;
    v14->_tertiaryColor = (NSString *)v21;
  }
  return v14;
}

- (void)dealloc
{
  CGImageRelease(self->_icon);
  CGImageRelease(self->_image);
  CGImageRelease(self->_backgroundImage);
  v3.receiver = self;
  v3.super_class = (Class)PKPassSecurePreviewContext;
  [(PKPassSecurePreviewContext *)&v3 dealloc];
}

- (void)setIcon:(CGImage *)a3
{
  icon = self->_icon;
  if (icon != a3)
  {
    CGImageRelease(icon);
    self->_icon = CGImageRetain(a3);
  }
}

- (void)setImage:(CGImage *)a3
{
  image = self->_image;
  if (image != a3)
  {
    CGImageRelease(image);
    self->_image = CGImageRetain(a3);
  }
}

- (void)setBackgroundImage:(CGImage *)a3
{
  backgroundImage = self->_backgroundImage;
  if (backgroundImage != a3)
  {
    CGImageRelease(backgroundImage);
    self->_backgroundImage = CGImageRetain(a3);
  }
}

- (CGImage)icon
{
  return self->_icon;
}

- (CGImage)image
{
  return self->_image;
}

- (CGImage)backgroundImage
{
  return self->_backgroundImage;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
}

- (NSString)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (NSString)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (void)setTertiaryText:(id)a3
{
}

- (NSString)tertiaryColor
{
  return self->_tertiaryColor;
}

- (void)setTertiaryColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (id)createMessagesPreviewForPassFileURL:(id)a3 withOutputDirectory:(id)a4
{
  return PKPassSecurePreviewContextCreateMessagesPreview((NSURL *)a3, (NSURL *)a4);
}

+ (id)createMessagesPreviewForPassesFileURL:(id)a3 withOutputDirectory:(id)a4
{
  return (id)PKPassesSecurePreviewContextCreateMessagesPreview((NSURL *)a3, (NSURL *)a4);
}

@end