@interface _PXUIAssetBadgeImageView
- (UIImage)image;
- (_PXUIAssetBadgeImageView)initWithFrame:(CGRect)a3;
- (void)setImage:(id)a3;
@end

@implementation _PXUIAssetBadgeImageView

- (void).cxx_destruct
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    v5 = [(_PXUIAssetBadgeImageView *)self layer];
    objc_msgSend(v5, "setContents:", -[UIImage CGImage](v6, "CGImage"));
  }
}

- (_PXUIAssetBadgeImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PXUIAssetBadgeImageView;
  v3 = -[_PXUIAssetBadgeImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_PXUIAssetBadgeImageView *)v3 layer];
    [v5 setContentsGravity:@"resize"];
  }
  return v4;
}

@end