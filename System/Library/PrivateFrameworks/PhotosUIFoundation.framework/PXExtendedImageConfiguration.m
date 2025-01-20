@interface PXExtendedImageConfiguration
- (BOOL)isSystemImage;
- (NSBundle)bundle;
- (NSString)accessibilityLabel;
- (NSString)imageName;
- (PXExtendedImageConfiguration)init;
- (PXExtendedImageConfiguration)initWithImageName:(id)a3;
- (PXExtendedImageConfiguration)initWithImageName:(id)a3 isSystemImage:(BOOL)a4;
- (PXExtendedImageConfiguration)initWithImageName:(id)a3 isSystemImage:(BOOL)a4 accessibilityLabel:(id)a5 tintColor:(id)a6 imageConfiguration:(id)a7 inBundle:(id)a8;
- (UIColor)tintColor;
- (UIImageConfiguration)imageConfiguration;
@end

@implementation PXExtendedImageConfiguration

- (PXExtendedImageConfiguration)initWithImageName:(id)a3
{
  return [(PXExtendedImageConfiguration *)self initWithImageName:a3 isSystemImage:0 accessibilityLabel:0 tintColor:0 imageConfiguration:0 inBundle:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_imageConfiguration, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

- (PXExtendedImageConfiguration)initWithImageName:(id)a3 isSystemImage:(BOOL)a4 accessibilityLabel:(id)a5 tintColor:(id)a6 imageConfiguration:(id)a7 inBundle:(id)a8
{
  id v22 = a3;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PXExtendedImageConfiguration;
  v18 = [(PXExtendedImageConfiguration *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageName, a3);
    v19->_isSystemImage = a4;
    objc_storeStrong((id *)&v19->_accessibilityLabel, a5);
    objc_storeStrong((id *)&v19->_tintColor, a6);
    objc_storeStrong((id *)&v19->_imageConfiguration, a7);
    objc_storeStrong((id *)&v19->_bundle, a8);
  }

  return v19;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isSystemImage
{
  return self->_isSystemImage;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (UIImageConfiguration)imageConfiguration
{
  return self->_imageConfiguration;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (PXExtendedImageConfiguration)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXExtendedImageConfiguration.m", 37, @"%s is not available as initializer", "-[PXExtendedImageConfiguration init]");

  abort();
}

- (PXExtendedImageConfiguration)initWithImageName:(id)a3 isSystemImage:(BOOL)a4
{
  return [(PXExtendedImageConfiguration *)self initWithImageName:a3 isSystemImage:a4 accessibilityLabel:0 tintColor:0 imageConfiguration:0 inBundle:0];
}

@end