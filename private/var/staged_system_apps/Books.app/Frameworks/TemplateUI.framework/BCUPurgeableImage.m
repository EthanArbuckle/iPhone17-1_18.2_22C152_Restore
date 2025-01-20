@interface BCUPurgeableImage
- (BCUPurgeableImage)initWithImage:(id)a3;
- (id)initWithData:(id)a3 contentsScale:(double)a4;
- (id)newImage;
@end

@implementation BCUPurgeableImage

- (id)initWithData:(id)a3 contentsScale:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)UIImage) initWithData:v6 scale:a4];

  id v8 = v7;
  id v9 = [v8 CGImage];
  [v8 scale];
  v10 = -[BCUPurgeableImage initWithImage:surface:contentsScale:](self, "initWithImage:surface:contentsScale:", v9, 0);

  return v10;
}

- (BCUPurgeableImage)initWithImage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 CGImage];
  [v4 scale];
  double v7 = v6;

  return [(BCUPurgeableImage *)self initWithImage:v5 surface:0 contentsScale:v7];
}

- (id)newImage
{
  if (![(BCUPurgeableImage *)self CGImage]) {
    return 0;
  }
  id v3 = objc_alloc((Class)UIImage);
  id v4 = [(BCUPurgeableImage *)self CGImage];
  [(BCUPurgeableImage *)self contentsScale];
  id v5 = [v3 tui_initWithCGImage:v4];

  return v5;
}

@end