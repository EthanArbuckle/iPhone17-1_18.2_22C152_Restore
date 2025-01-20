@interface VUINamedLayerImage
+ (id)decodedNamedLayerImageFromNamedLayerImage:(id)a3;
+ (id)namedLayerImageFromNamedLayerImage:(id)a3;
- (BOOL)fixedFrame;
- (CGRect)frame;
- (NSString)name;
- (UIImage)decodedImage;
- (UINamedLayerImage)namedLayerImage;
- (VUINamedLayerImage)init;
- (double)opacity;
- (id)_init;
- (int)blendMode;
- (void)setBlendMode:(int)a3;
- (void)setDecodedImage:(id)a3;
- (void)setNamedLayerImage:(id)a3;
@end

@implementation VUINamedLayerImage

- (VUINamedLayerImage)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)VUINamedLayerImage;
  id result = [(VUINamedLayerImage *)&v3 init];
  if (result) {
    *((_DWORD *)result + 2) = 0;
  }
  return result;
}

+ (id)namedLayerImageFromNamedLayerImage:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = (void *)[objc_alloc((Class)objc_opt_class()) _init];
    [v4 setNamedLayerImage:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)decodedNamedLayerImageFromNamedLayerImage:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)[objc_alloc((Class)objc_opt_class()) _init];
    [v4 setNamedLayerImage:v3];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v3 imageObj], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = (void *)v5;
      v7 = +[VUIGraphicsImageRenderer decodedImage:v5 opaque:0];
    }
    else
    {
      v7 = 0;
    }
    [v4 setDecodedImage:v7];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  id v3 = [(VUINamedLayerImage *)self namedLayerImage];

  if (v3)
  {
    v4 = [(VUINamedLayerImage *)self namedLayerImage];
    uint64_t v5 = [v4 name];
  }
  else
  {
    uint64_t v5 = @"VUIDefaultLayerName";
  }
  return (NSString *)v5;
}

- (CGRect)frame
{
  id v3 = [(VUINamedLayerImage *)self namedLayerImage];

  if (v3)
  {
    v4 = [(VUINamedLayerImage *)self namedLayerImage];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v13 = [(VUINamedLayerImage *)self decodedImage];

    if (!v13)
    {
      double v6 = *MEMORY[0x1E4F1DB28];
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_6;
    }
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v4 = [(VUINamedLayerImage *)self decodedImage];
    [v4 size];
    double v10 = v14;
    double v12 = v15;
  }

LABEL_6:
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (double)opacity
{
  id v3 = [(VUINamedLayerImage *)self namedLayerImage];

  if (!v3) {
    return 1.0;
  }
  v4 = [(VUINamedLayerImage *)self namedLayerImage];
  [v4 opacity];
  double v6 = v5;

  return v6;
}

- (BOOL)fixedFrame
{
  id v3 = [(VUINamedLayerImage *)self namedLayerImage];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(VUINamedLayerImage *)self namedLayerImage];
  char v6 = [v5 fixedFrame];

  return v6;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (UIImage)decodedImage
{
  return self->_decodedImage;
}

- (void)setDecodedImage:(id)a3
{
}

- (UINamedLayerImage)namedLayerImage
{
  return self->_namedLayerImage;
}

- (void)setNamedLayerImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedLayerImage, 0);
  objc_storeStrong((id *)&self->_decodedImage, 0);
}

@end