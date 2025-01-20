@interface _VUIMonogramImageGenerator
- (NSOperationQueue)imageGeneratorQueue;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (id)loadImageForURL:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _VUIMonogramImageGenerator

- (NSOperationQueue)imageGeneratorQueue
{
  imageGeneratorQueue = self->_imageGeneratorQueue;
  if (!imageGeneratorQueue)
  {
    v4 = (NSOperationQueue *)objc_opt_new();
    v5 = self->_imageGeneratorQueue;
    self->_imageGeneratorQueue = v4;

    imageGeneratorQueue = self->_imageGeneratorQueue;
  }
  return imageGeneratorQueue;
}

- (id)loadImageForURL:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a5;
  double height = a4.height;
  double width = a4.width;
  v14 = (void *)MEMORY[0x1E4FB3D58];
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  v18 = [v14 sharedInstance];
  v19 = objc_msgSend(v18, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v17, v10, a6, v16, v15, width, height);

  return v19;
}

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  v6 = [v5 imageURL];
  if (v6)
  {
    v7 = [MEMORY[0x1E4FB3D58] sharedInstance];
    v8 = [v7 imageKeyForObject:v6];

    v9 = [v5 imageURL];
    if (objc_msgSend(v9, "vuicore_isResourceOrSymbolURL"))
    {
      BOOL v10 = [v5 fillColor];

      if (v10)
      {
        double v24 = 0.0;
        double v22 = 0.0;
        double v23 = 0.0;
        uint64_t v21 = 0;
        v13 = [v5 fillColor];
        if (v13)
        {
          [MEMORY[0x1E4FB3C70] vuiColor:v13 getRed:&v24 green:&v23 blue:&v22 alpha:&v21];
          uint64_t v14 = v21;
          double v15 = v24 * 255.0;
          double v16 = v23 * 255.0;
          double v17 = v22 * 255.0;
        }
        else
        {
          uint64_t v14 = 0;
          double v17 = 0.0;
          double v16 = 0.0;
          double v15 = 0.0;
        }
        unint64_t v18 = 0x1E4F29000uLL;
        LODWORD(v18) = vcvtad_u64_f64(v15);
        LODWORD(v11) = vcvtad_u64_f64(v16);
        LODWORD(v12) = vcvtad_u64_f64(v17);
        uint64_t v19 = [NSString stringWithFormat:@"%@_%02X%02X%02X%.1f", v8, v18, v11, v12, v14];

        v8 = (void *)v19;
      }
    }
    else
    {
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v19 = 0;
  if (v15 && (isKindOfClass & 1) != 0)
  {
    v20 = [v15 imageURL];
    if (v20)
    {
      uint64_t v19 = -[_VUIMonogramImageGenerator loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v20, v11, a6, v16, v17, width, height);
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  return v19;
}

- (void)cancelLoad:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB3D58];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 cancelLoad:v4];
}

- (void).cxx_destruct
{
}

@end