@interface SFWebExtensionButton
- (BOOL)badged;
- (SFWebExtensionButton)initWithExtension:(id)a3 image:(id)a4 badged:(BOOL)a5;
- (UIImage)image;
- (WBSWebExtensionData)extension;
@end

@implementation SFWebExtensionButton

- (SFWebExtensionButton)initWithExtension:(id)a3 image:(id)a4 badged:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFWebExtensionButton;
  v11 = [(SFWebExtensionButton *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extension, a3);
    objc_storeStrong((id *)&v12->_image, a4);
    v12->_badged = a5;
    v13 = v12;
  }

  return v12;
}

- (WBSWebExtensionData)extension
{
  return self->_extension;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)badged
{
  return self->_badged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end