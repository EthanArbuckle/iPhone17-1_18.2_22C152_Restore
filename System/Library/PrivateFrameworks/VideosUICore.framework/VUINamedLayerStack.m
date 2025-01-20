@interface VUINamedLayerStack
+ (id)decodedNamedLayerStackWithImage:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5;
+ (id)namedLayerStackWithImage:(id)a3;
- (BOOL)flatImageContainsCornerRadius;
- (CGImage)flattenedImage;
- (CGSize)radiosityImageScale;
- (CGSize)size;
- (NSArray)layers;
- (NSArray)replacementLayers;
- (NSString)name;
- (UIImage)cornerRadiusFlatImage;
- (UIImage)originalImage;
- (UINamedLayerStack)layerStack;
- (VUINamedLayerStack)init;
- (double)scale;
- (id)_init;
- (id)radiosityImage;
- (void)setCornerRadiusFlatImage:(id)a3;
- (void)setLayerStack:(id)a3;
- (void)setOriginalImage:(id)a3;
- (void)setReplacementLayers:(id)a3;
@end

@implementation VUINamedLayerStack

- (VUINamedLayerStack)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)VUINamedLayerStack;
  return [(VUINamedLayerStack *)&v3 init];
}

+ (id)namedLayerStackWithImage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0 && [v3 _representsLayeredImage])
  {
    v4 = [v3 imageAsset];
    v5 = [v4 _layerStack];

    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v7 = [v5 layers];
    v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = objc_msgSend(v5, "layers", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = +[VUINamedLayerImage namedLayerImageFromNamedLayerImage:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (v14) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    if (v5 && [v8 count])
    {
      id v15 = [(VUINamedLayerStack *)[VUIDeflatableNamedLayerImage alloc] _init];
      [v15 setLayerStack:v5];
      v16 = (void *)MEMORY[0x1E4F42A80];
      id v17 = v3;
      v18 = objc_msgSend(v16, "imageWithCGImage:", objc_msgSend(v17, "CGImage"));
      [v15 setCornerRadiusFlatImage:v18];

      v19 = (void *)[v8 copy];
      [v15 setReplacementLayers:v19];

      [v15 setOriginalImage:v17];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)decodedNamedLayerStackWithImage:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && [v8 _representsLayeredImage])
  {
    id v9 = v8;
    v34[0] = [v9 CGImage];
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    uint64_t v11 = VUICompositeBitmapImageOfSizeForImages(v10, 0, 0, width, height, a5);

    uint64_t v28 = [MEMORY[0x1E4F42A80] imageWithCGImage:v11];
    CGImageRelease(v11);
    id v27 = v9;
    uint64_t v12 = [v9 imageAsset];
    v13 = [v12 _layerStack];

    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v15 = [v13 layers];
    v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v17 = [v13 layers];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = +[VUINamedLayerImage decodedNamedLayerImageFromNamedLayerImage:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          if (v22) {
            [v16 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    if (v13)
    {
      long long v23 = 0;
      long long v24 = (void *)v28;
      if ([v16 count] && v28)
      {
        long long v23 = (void *)[objc_alloc((Class)objc_opt_class()) _init];
        [v23 setLayerStack:v13];
        [v23 setCornerRadiusFlatImage:v28];
        v25 = (void *)[v16 copy];
        [v23 setReplacementLayers:v25];

        [v23 setOriginalImage:v27];
      }
    }
    else
    {
      long long v23 = 0;
      long long v24 = (void *)v28;
    }
  }
  else
  {
    long long v23 = 0;
  }

  return v23;
}

- (NSString)name
{
  id v3 = [(VUINamedLayerStack *)self layerStack];

  if (v3)
  {
    v4 = [(VUINamedLayerStack *)self layerStack];
    uint64_t v5 = [v4 name];
  }
  else
  {
    v4 = [(VUINamedLayerStack *)self replacementLayers];
    id v6 = [v4 firstObject];
    uint64_t v5 = [v6 name];
  }
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"VUIDefaultLayerStackName";
  }
  return (NSString *)v7;
}

- (NSArray)layers
{
  id v3 = [(VUINamedLayerStack *)self replacementLayers];

  if (v3)
  {
    v4 = [(VUINamedLayerStack *)self replacementLayers];
  }
  else
  {
    uint64_t v5 = [(VUINamedLayerStack *)self layerStack];
    v4 = [v5 layers];
  }
  return (NSArray *)v4;
}

- (CGSize)size
{
  id v3 = [(VUINamedLayerStack *)self layerStack];

  if (v3)
  {
    v4 = [(VUINamedLayerStack *)self layerStack];
    [v4 size];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    id v9 = [(VUINamedLayerStack *)self replacementLayers];
    v4 = [v9 firstObject];

    [v4 frame];
    double v6 = v10;
    double v8 = v11;
  }

  double v12 = v6;
  double v13 = v8;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)scale
{
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  double v5 = v4;

  double v6 = [(VUINamedLayerStack *)self layerStack];

  if (v6)
  {
    double v7 = [(VUINamedLayerStack *)self layerStack];
    [v7 scale];
    double v5 = v8;
  }
  return v5;
}

- (CGImage)flattenedImage
{
  id v2 = [(VUINamedLayerStack *)self cornerRadiusFlatImage];
  id v3 = (CGImage *)[v2 CGImage];

  return v3;
}

- (id)radiosityImage
{
  id v3 = [(VUINamedLayerStack *)self layerStack];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(VUINamedLayerStack *)self layerStack];
    double v6 = [v5 radiosityImage];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (CGSize)radiosityImageScale
{
  id v3 = [(VUINamedLayerStack *)self layerStack];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(VUINamedLayerStack *)self layerStack];
    [v5 radiosityImageScale];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)flatImageContainsCornerRadius
{
  return !+[VUICoreUtilities canHandleDecodingOnRenderThread];
}

- (UINamedLayerStack)layerStack
{
  return self->_layerStack;
}

- (void)setLayerStack:(id)a3
{
}

- (UIImage)cornerRadiusFlatImage
{
  return self->_cornerRadiusFlatImage;
}

- (void)setCornerRadiusFlatImage:(id)a3
{
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
}

- (NSArray)replacementLayers
{
  return self->_replacementLayers;
}

- (void)setReplacementLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementLayers, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_cornerRadiusFlatImage, 0);
  objc_storeStrong((id *)&self->_layerStack, 0);
}

@end