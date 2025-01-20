@interface _UILegibilityImageSet
+ (id)imageFromImage:(id)a3 withShadowImage:(id)a4;
- (UIImage)image;
- (UIImage)shadowImage;
- (_UILegibilityImageSet)imageSetWithOrientation:(int64_t)a3;
- (_UILegibilityImageSet)initWithImage:(id)a3 shadowImage:(id)a4;
- (id)imageSetFlippedForRightToLeft;
- (void)dealloc;
- (void)setImage:(id)a3;
- (void)setShadowImage:(id)a3;
@end

@implementation _UILegibilityImageSet

+ (id)imageFromImage:(id)a3 withShadowImage:(id)a4
{
  v4 = [[_UILegibilityImageSet alloc] initWithImage:a3 shadowImage:a4];
  return v4;
}

- (_UILegibilityImageSet)initWithImage:(id)a3 shadowImage:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UILegibilityImageSet;
  v6 = [(_UILegibilityImageSet *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(_UILegibilityImageSet *)v6 setImage:a3];
    [(_UILegibilityImageSet *)v7 setShadowImage:a4];
  }
  return v7;
}

- (id)imageSetFlippedForRightToLeft
{
  v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:shadowImage:", -[UIImage imageFlippedForRightToLeftLayoutDirection](-[_UILegibilityImageSet image](self, "image"), "imageFlippedForRightToLeftLayoutDirection"), -[UIImage imageFlippedForRightToLeftLayoutDirection](-[_UILegibilityImageSet shadowImage](self, "shadowImage"), "imageFlippedForRightToLeftLayoutDirection"));
  return v2;
}

- (_UILegibilityImageSet)imageSetWithOrientation:(int64_t)a3
{
  v5 = [(_UILegibilityImageSet *)self image];
  v6 = [(_UILegibilityImageSet *)self shadowImage];
  uint64_t v7 = [(UIImage *)v5 CGImage];
  [(UIImage *)v5 scale];
  v8 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v7, a3);
  uint64_t v9 = [(UIImage *)v6 CGImage];
  [(UIImage *)v6 scale];
  v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:shadowImage:", v8, +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v9, a3));
  return (_UILegibilityImageSet *)v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityImageSet;
  [(_UILegibilityImageSet *)&v3 dealloc];
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
}

@end