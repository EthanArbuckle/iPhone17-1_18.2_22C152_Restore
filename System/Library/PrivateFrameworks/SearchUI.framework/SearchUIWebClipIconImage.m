@interface SearchUIWebClipIconImage
+ (id)convertImage:(id)a3 ofSize:(CGSize)a4 withShape:(unint64_t)a5 scale:(double)a6;
- (BOOL)isEqual:(id)a3;
- (SearchUIWebClipIconImage)initWithWebClip:(id)a3 variant:(unint64_t)a4;
- (UIWebClip)webClip;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (void)setWebClip:(id)a3;
@end

@implementation SearchUIWebClipIconImage

- (SearchUIWebClipIconImage)initWithWebClip:(id)a3 variant:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 identifier];
  v10.receiver = self;
  v10.super_class = (Class)SearchUIWebClipIconImage;
  v8 = [(SearchUIAppIconImage *)&v10 initWithBundleIdentifier:v7 variant:a4 contentType:0];

  if (v8) {
    [(SearchUIWebClipIconImage *)v8 setWebClip:v6];
  }

  return v8;
}

+ (id)convertImage:(id)a3 ofSize:(CGSize)a4 withShape:(unint64_t)a5 scale:(double)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    objc_super v10 = (objc_class *)MEMORY[0x1E4F6F1E8];
    id v11 = a3;
    id v12 = [v10 alloc];
    id v13 = v11;
    uint64_t v14 = [v13 CGImage];

    v15 = (void *)[v12 initWithCGImage:v14 scale:a6];
    id v16 = objc_alloc(MEMORY[0x1E4F6F248]);
    v22[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v18 = (void *)[v16 initWithImages:v17];

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", width, height, a6);
    [v19 setShape:a5];
    v20 = [(id)objc_opt_class() imageForIcon:v18 descriptor:v19];
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SearchUIWebClipIconImage *)self webClip];
    id v6 = [v5 identifier];
    v7 = [v4 webClip];
    v8 = [v7 identifier];
    char v9 = [v6 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(SearchUIWebClipIconImage *)self webClip];
  v3 = [v2 identifier];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)uniqueIdentifier
{
  v2 = [(SearchUIWebClipIconImage *)self webClip];
  v3 = [v2 identifier];

  return v3;
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (void)setWebClip:(id)a3
{
}

- (void).cxx_destruct
{
}

@end