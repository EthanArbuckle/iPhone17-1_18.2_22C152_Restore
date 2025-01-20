@interface TLKImage
+ (BOOL)imageIsSymbol:(id)a3;
+ (BOOL)isTemplateImage:(id)a3;
+ (id)applyTintColor:(id)a3 toImage:(id)a4;
+ (id)keyForScale:(double)a3 isDarkStyle:(BOOL)a4;
+ (id)templateImageForImage:(id)a3;
- (BOOL)isTemplate;
- (BOOL)supportsFastPathShadow;
- (CGSize)size;
- (NSCache)imageCache;
- (TLKImage)badgeImage;
- (TLKImage)init;
- (TLKImage)initWithImage:(id)a3;
- (UIImage)uiImage;
- (double)aspectRatio;
- (double)cornerRadius;
- (id)cachedImageForScale:(double)a3 isDarkStyle:(BOOL)a4;
- (unint64_t)cornerRoundingStyle;
- (void)cacheImage:(id)a3 forScale:(double)a4 isDarkStyle:(BOOL)a5;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setAspectRatio:(double)a3;
- (void)setBadgeImage:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornerRoundingStyle:(unint64_t)a3;
- (void)setImageCache:(id)a3;
- (void)setIsTemplate:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setSupportsFastPathShadow:(BOOL)a3;
- (void)setUiImage:(id)a3;
@end

@implementation TLKImage

+ (BOOL)isTemplateImage:(id)a3
{
  return [a3 renderingMode] == 2;
}

- (TLKImage)init
{
  return [(TLKImage *)self initWithImage:0];
}

- (TLKImage)initWithImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TLKImage;
  v5 = [(TLKImage *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(TLKImage *)v5 setUiImage:v4];
    if (([(id)objc_opt_class() imageIsSymbol:v4] & 1) == 0)
    {
      [v4 size];
      -[TLKImage setSize:](v6, "setSize:");
    }
    -[TLKImage setIsTemplate:](v6, "setIsTemplate:", [(id)objc_opt_class() isTemplateImage:v4]);
  }

  return v6;
}

+ (id)templateImageForImage:(id)a3
{
  id v4 = a3;
  if (([a1 isTemplateImage:v4] & 1) == 0)
  {
    uint64_t v5 = [v4 imageWithRenderingMode:2];

    id v4 = (id)v5;
  }
  return v4;
}

+ (id)applyTintColor:(id)a3 toImage:(id)a4
{
  return (id)[a4 imageWithTintColor:a3];
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = [(TLKImage *)self uiImage];
  (*((void (**)(id, id, uint64_t))a5 + 2))(v7, v8, 1);
}

- (id)cachedImageForScale:(double)a3 isDarkStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(TLKImage *)self imageCache];
  id v7 = [(id)objc_opt_class() keyForScale:v4 isDarkStyle:a3];
  id v8 = [v6 objectForKey:v7];

  return v8;
}

- (void)cacheImage:(id)a3 forScale:(double)a4 isDarkStyle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(TLKImage *)self imageCache];

  if (!v9)
  {
    v10 = objc_opt_new();
    [(TLKImage *)self setImageCache:v10];
  }
  id v12 = [(TLKImage *)self imageCache];
  v11 = [(id)objc_opt_class() keyForScale:v5 isDarkStyle:a4];
  [v12 setObject:v8 forKey:v11];
}

+ (id)keyForScale:(double)a3 isDarkStyle:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = NSString;
  v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  id v8 = [v5 stringWithFormat:@"%@-%@", v6, v7];

  return v8;
}

+ (BOOL)imageIsSymbol:(id)a3
{
  return [a3 isSymbolImage];
}

- (double)aspectRatio
{
  [(TLKImage *)self size];
  if (v4 == 0.0) {
    return self->_aspectRatio;
  }
  else {
    return v3 / v4;
  }
}

- (UIImage)uiImage
{
  return self->_uiImage;
}

- (void)setUiImage:(id)a3
{
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

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (BOOL)isTemplate
{
  return self->_isTemplate;
}

- (void)setIsTemplate:(BOOL)a3
{
  self->_isTemplate = a3;
}

- (unint64_t)cornerRoundingStyle
{
  return self->_cornerRoundingStyle;
}

- (void)setCornerRoundingStyle:(unint64_t)a3
{
  self->_cornerRoundingStyle = a3;
}

- (BOOL)supportsFastPathShadow
{
  return self->_supportsFastPathShadow;
}

- (void)setSupportsFastPathShadow:(BOOL)a3
{
  self->_supportsFastPathShadow = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (TLKImage)badgeImage
{
  return self->_badgeImage;
}

- (void)setBadgeImage:(id)a3
{
}

- (NSCache)imageCache
{
  return (NSCache *)objc_getProperty(self, a2, 56, 1);
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_badgeImage, 0);
  objc_storeStrong((id *)&self->_uiImage, 0);
}

@end