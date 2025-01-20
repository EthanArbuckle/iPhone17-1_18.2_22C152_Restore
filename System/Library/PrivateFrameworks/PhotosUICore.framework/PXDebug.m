@interface PXDebug
- (CGColor)backgroundColor;
- (CGImage)previewImage;
- (NSString)name;
- (id)__dbg_snapshotImage;
- (id)layer;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setName:(id)a3;
- (void)setPreviewImage:(CGImage *)a3;
@end

@implementation PXDebug

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  self->_backgroundColor = a3;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGImage)previewImage
{
  return self->_previewImage;
}

- (id)__dbg_snapshotImage
{
  v3 = [(PXDebug *)self image];
  [(PXDebug *)self alpha];
  v4 = objc_msgSend(v3, "px_imageByApplyingAlpha:");

  return v4;
}

- (id)layer
{
  return 0;
}

- (void)setPreviewImage:(CGImage *)a3
{
  if (self->_previewImage != a3)
  {
    self->_previewImage = a3;
    if (a3)
    {
      id v4 = (id)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:a3];
      [(PXDebug *)self setImage:v4];
    }
    else
    {
      [(PXDebug *)self setImage:0];
    }
  }
}

@end