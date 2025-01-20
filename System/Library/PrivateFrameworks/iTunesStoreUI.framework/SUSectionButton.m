@interface SUSectionButton
- (NSString)accessibilityTitle;
- (NSString)displayTitle;
- (NSURL)imageURL;
- (SUSectionButton)initWithSectionButtonDictionary:(id)a3;
- (UIEdgeInsets)imageInsets;
- (UIImage)image;
- (float)imageURLScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)tag;
- (void)applyToBarButtonItem:(id)a3;
- (void)dealloc;
- (void)setAccessibilityTitle:(id)a3;
- (void)setDisplayTitle:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setImageURL:(id)a3;
- (void)setImageURLScale:(float)a3;
- (void)setTag:(int64_t)a3;
@end

@implementation SUSectionButton

- (SUSectionButton)initWithSectionButtonDictionary:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SUSectionButton;
  v4 = [(SUSectionButton *)&v20 init];
  if (v4)
  {
    v5 = (void *)[a3 objectForKey:@"accessibility-title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_accessibilityTitle = (NSString *)v5;
    }
    v6 = (void *)[a3 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_displayTitle = (NSString *)v6;
    }
    v7 = (void *)[a3 objectForKey:@"tag"];
    if (objc_opt_respondsToSelector()) {
      v4->_tag = [v7 integerValue];
    }
    v8 = (void *)[a3 objectForKey:@"inset-bottom"];
    if (objc_opt_respondsToSelector())
    {
      [v8 floatValue];
      v4->_imageInsets.bottom = v9;
    }
    v10 = (void *)[a3 objectForKey:@"inset-left"];
    if (objc_opt_respondsToSelector())
    {
      [v10 floatValue];
      v4->_imageInsets.left = v11;
    }
    v12 = (void *)[a3 objectForKey:@"inset-right"];
    if (objc_opt_respondsToSelector())
    {
      [v12 floatValue];
      v4->_imageInsets.right = v13;
    }
    v14 = (void *)[a3 objectForKey:@"inset-top"];
    if (objc_opt_respondsToSelector())
    {
      [v14 floatValue];
      v4->_imageInsets.top = v15;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    if (v16 == 2.0)
    {
      uint64_t v17 = [a3 objectForKey:@"image-url@2x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v4->_imageURL = (NSURL *)[objc_alloc(NSURL) initWithString:v17];
        v4->_imageURLScale = 2.0;
      }
    }
    if (!v4->_imageURL)
    {
      uint64_t v18 = [a3 objectForKey:@"image-url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v4->_imageURL = (NSURL *)[objc_alloc(NSURL) initWithString:v18];
      }
      v4->_imageURLScale = 1.0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSectionButton;
  [(SUSectionButton *)&v3 dealloc];
}

- (void)applyToBarButtonItem:(id)a3
{
  objc_msgSend(a3, "setAccessibilityLabel:", -[SUSectionButton accessibilityTitle](self, "accessibilityTitle"));
  [(SUSectionButton *)self imageInsets];
  objc_msgSend(a3, "setImageInsets:");
  v5 = [(SUSectionButton *)self image];
  if (v5) {
    [a3 setImage:v5];
  }
  else {
    objc_msgSend(a3, "setTitle:", -[SUSectionButton displayTitle](self, "displayTitle"));
  }
  int64_t v6 = [(SUSectionButton *)self tag];

  [a3 setTag:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(NSString *)self->_accessibilityTitle copyWithZone:a3];
  *(void *)(v5 + 16) = [(NSString *)self->_displayTitle copyWithZone:a3];
  *(void *)(v5 + 24) = self->_image;
  long long v6 = *(_OWORD *)&self->_imageInsets.bottom;
  *(_OWORD *)(v5 + 32) = *(_OWORD *)&self->_imageInsets.top;
  *(_OWORD *)(v5 + 48) = v6;
  *(void *)(v5 + 64) = [(NSURL *)self->_imageURL copyWithZone:a3];
  *(float *)(v5 + 72) = self->_imageURLScale;
  *(void *)(v5 + 80) = self->_tag;
  return (id)v5;
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (void)setAccessibilityTitle:(id)a3
{
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void)setDisplayTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIEdgeInsets)imageInsets
{
  double top = self->_imageInsets.top;
  double left = self->_imageInsets.left;
  double bottom = self->_imageInsets.bottom;
  double right = self->_imageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  self->_imageInsets = a3;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (float)imageURLScale
{
  return self->_imageURLScale;
}

- (void)setImageURLScale:(float)a3
{
  self->_imageURLScale = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

@end