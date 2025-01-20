@interface ICAttachmentWebModelIcon
- (BOOL)scaleImageToIconSize;
- (CGSize)size;
- (ICAttachmentWebModelIcon)initWithFallbackURL:(id)a3 withSize:(CGSize)a4;
- (ICAttachmentWebModelIcon)initWithImageURL:(id)a3;
- (ICAttachmentWebModelIcon)initWithURL:(id)a3 withSize:(CGSize)a4;
- (NSURL)url;
- (UIImage)image;
- (double)scale;
- (id)description;
- (void)setImage:(id)a3;
- (void)setScale:(double)a3;
- (void)setScaleImageToIconSize:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setUrl:(id)a3;
@end

@implementation ICAttachmentWebModelIcon

- (ICAttachmentWebModelIcon)initWithURL:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentWebModelIcon;
  v8 = [(ICAttachmentWebModelIcon *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ICAttachmentWebModelIcon *)v8 setUrl:v7];
    -[ICAttachmentWebModelIcon setSize:](v9, "setSize:", width, height);
  }

  return v9;
}

- (ICAttachmentWebModelIcon)initWithImageURL:(id)a3
{
  v3 = -[ICAttachmentWebModelIcon initWithURL:withSize:](self, "initWithURL:withSize:", a3, 0.0, 0.0);
  v4 = v3;
  if (v3) {
    [(ICAttachmentWebModelIcon *)v3 setScaleImageToIconSize:1];
  }
  return v4;
}

- (ICAttachmentWebModelIcon)initWithFallbackURL:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)ICAttachmentWebModelIcon;
    v8 = [(ICAttachmentWebModelIcon *)&v16 init];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F29088] componentsWithURL:v7 resolvingAgainstBaseURL:1];
      v10 = v9;
      if (width == 60.0 && height == 60.0)
      {
        [v9 setPath:@"/apple-touch-icon.png"];
      }
      else
      {
        v13 = objc_msgSend(NSString, "stringWithFormat:", @"/apple-touch-icon%.0fx%.0f.png", *(void *)&width, *(void *)&height);
        [v10 setPath:v13];
      }
      v14 = [v10 URL];
      [(ICAttachmentWebModelIcon *)v8 setUrl:v14];

      -[ICAttachmentWebModelIcon setSize:](v8, "setSize:", width, height);
    }
    self = v8;
    v12 = self;
  }
  else
  {
    objc_super v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentWebModelIcon initWithFallbackURL:withSize:](v11);
    }

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)ICAttachmentWebModelIcon;
  v4 = [(ICAttachmentWebModelIcon *)&v12 description];
  [(ICAttachmentWebModelIcon *)self size];
  uint64_t v6 = v5;
  [(ICAttachmentWebModelIcon *)self size];
  uint64_t v8 = v7;
  v9 = [(ICAttachmentWebModelIcon *)self url];
  v10 = [v3 stringWithFormat:@"%@ %.0fx%.0f %@", v4, v6, v8, v9];

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)scaleImageToIconSize
{
  return self->_scaleImageToIconSize;
}

- (void)setScaleImageToIconSize:(BOOL)a3
{
  self->_scaleImageToIconSize = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithFallbackURL:(os_log_t)log withSize:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ICAttachmentWebModelIcon initWithFallbackURL:withSize:]";
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "nil URL passed to %s", (uint8_t *)&v1, 0xCu);
}

@end