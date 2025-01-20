@interface _UIImageSymbolLayer
+ (id)_symbolLayerWithImage:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6;
+ (id)_symbolLayerWithName:(id)a3 color:(id)a4;
+ (id)_symbolLayerWithName:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6;
+ (id)_symbolLayerWithSystemName:(id)a3 color:(id)a4;
+ (id)_symbolLayerWithSystemName:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6;
- (BOOL)isSystemImage;
- (CGPoint)offset;
- (NSString)name;
- (UIColor)color;
- (UIImageAsset)asset;
- (_UIImageCUIVectorGlyphContent)content;
- (double)scaleFactor;
- (void)setAsset:(id)a3;
- (void)setColor:(id)a3;
- (void)setContent:(id)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setScaleFactor:(double)a3;
@end

@implementation _UIImageSymbolLayer

+ (id)_symbolLayerWithImage:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  id v10 = a3;
  id v11 = a4;
  v12 = objc_opt_new();
  if ([v10 _isSymbolImage])
  {
    v13 = [v10 imageAsset];
    [v12 setAsset:v13];

    v14 = [v10 content];
    [v12 setContent:v14];

    [v12 setColor:v11];
    objc_msgSend(v12, "setOffset:", x, y);
    [v12 setScaleFactor:a6];
    id v15 = v12;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (NSString)name
{
  v2 = [(_UIImageSymbolLayer *)self asset];
  v3 = [v2 assetName];

  return (NSString *)v3;
}

- (BOOL)isSystemImage
{
  v2 = [(_UIImageSymbolLayer *)self asset];
  v3 = [v2 _assetManager];
  char v4 = [v3 _managingCoreGlyphs];

  return v4;
}

+ (id)_symbolLayerWithSystemName:(id)a3 color:(id)a4
{
  id v6 = a4;
  v7 = +[UIImage systemImageNamed:a3];
  v8 = objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v7, v6, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);

  return v8;
}

+ (id)_symbolLayerWithSystemName:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a4;
  v12 = +[UIImage systemImageNamed:a3];
  v13 = objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v12, v11, x, y, a6);

  return v13;
}

+ (id)_symbolLayerWithName:(id)a3 color:(id)a4
{
  id v6 = a4;
  v7 = +[UIImage imageNamed:a3];
  v8 = objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v7, v6, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);

  return v8;
}

+ (id)_symbolLayerWithName:(id)a3 color:(id)a4 offset:(CGPoint)a5 scaleFactor:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a4;
  v12 = +[UIImage imageNamed:a3];
  v13 = objc_msgSend(a1, "_symbolLayerWithImage:color:offset:scaleFactor:", v12, v11, x, y, a6);

  return v13;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (UIImageAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (_UIImageCUIVectorGlyphContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end