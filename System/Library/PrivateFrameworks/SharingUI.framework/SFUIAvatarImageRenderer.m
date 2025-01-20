@interface SFUIAvatarImageRenderer
+ (id)avatarImageRender;
- (CNAvatarImageRenderer)imageRenderer;
- (CNKeyDescriptor)descriptorForRequiredKeys;
- (SFUIAvatarImageRenderer)init;
- (id)avatarImageForContacts:(id)a3;
- (id)avatarImageForContacts:(id)a3 pointSize:(CGSize)a4 scale:(double)a5 rightToLeft:(BOOL)a6 style:(unint64_t)a7 backgroundStyle:(unint64_t)a8;
- (id)avatarImageForContacts:(id)a3 scope:(id)a4;
- (id)placeholderImageForSize:(CGSize)a3 scale:(double)a4;
- (void)setImageRenderer:(id)a3;
@end

@implementation SFUIAvatarImageRenderer

- (SFUIAvatarImageRenderer)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFUIAvatarImageRenderer;
  v2 = [(SFUIAvatarImageRenderer *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)getCNAvatarImageRendererClass());
    v4 = [getCNAvatarImageRendererSettingsClass() defaultSettings];
    uint64_t v5 = [v3 initWithSettings:v4];
    imageRenderer = v2->_imageRenderer;
    v2->_imageRenderer = (CNAvatarImageRenderer *)v5;
  }
  return v2;
}

+ (id)avatarImageRender
{
  v2 = objc_alloc_init(SFUIAvatarImageRenderer);
  return v2;
}

- (id)avatarImageForContacts:(id)a3 scope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(SFUIAvatarImageRenderer *)self imageRenderer];
  v9 = [v6 scope];

  v10 = [v8 avatarImageForContacts:v7 scope:v9];

  return v10;
}

- (id)placeholderImageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = [(SFUIAvatarImageRenderer *)self imageRenderer];
  objc_super v8 = [v7 placeholderImageProvider];

  v9 = objc_msgSend(v8, "imageForSize:scale:", width, height, a4);

  return v9;
}

- (id)avatarImageForContacts:(id)a3
{
  return 0;
}

- (CNKeyDescriptor)descriptorForRequiredKeys
{
  id CNAvatarImageRendererClass = getCNAvatarImageRendererClass();
  return (CNKeyDescriptor *)[CNAvatarImageRendererClass descriptorForRequiredKeys];
}

- (id)avatarImageForContacts:(id)a3 pointSize:(CGSize)a4 scale:(double)a5 rightToLeft:(BOOL)a6 style:(unint64_t)a7 backgroundStyle:(unint64_t)a8
{
  return 0;
}

- (CNAvatarImageRenderer)imageRenderer
{
  return self->_imageRenderer;
}

- (void)setImageRenderer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end