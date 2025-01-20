@interface _TVMonogramImageGenerator
- (NSOperationQueue)imageGeneratorQueue;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (id)loadImageForURL:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVMonogramImageGenerator

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
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  v17 = +[TVURLImageLoader sharedInstance];
  v18 = objc_msgSend(v17, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v16, v10, a6, v15, v14, width, height);

  return v18;
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
  v6 = +[TVURLImageLoader sharedInstance];
  v7 = [v5 imageURL];
  v8 = [v6 imageKeyForObject:v7];

  v9 = [v5 imageURL];
  if (objc_msgSend(v9, "tv_isResourceURL"))
  {
    BOOL v10 = [v5 fillColor];

    if (v10)
    {
      double v20 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
      uint64_t v17 = 0;
      v11 = [v5 fillColor];
      [v11 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];

      unint64_t v12 = 0x263F08000uLL;
      v13 = &off_230C37000;
      LODWORD(v13) = vcvtad_u64_f64(v20 * 255.0);
      LODWORD(v14) = vcvtad_u64_f64(v19 * 255.0);
      LODWORD(v12) = vcvtad_u64_f64(v18 * 255.0);
      uint64_t v15 = [NSString stringWithFormat:@"%@_%02X%02X%02X%.1f", v8, v13, v14, v12, v17];

      v8 = (void *)v15;
    }
  }
  else
  {
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
  double v19 = 0;
  if (v15 && (isKindOfClass & 1) != 0)
  {
    double v20 = [v15 imageURL];
    if (v20)
    {
      double v19 = -[_TVMonogramImageGenerator loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v20, v11, a6, v16, v17, width, height);
    }
    else
    {
      double v19 = 0;
    }
  }
  return v19;
}

- (void)cancelLoad:(id)a3
{
  id v3 = a3;
  id v4 = +[TVURLImageLoader sharedInstance];
  [v4 cancelLoad:v3];
}

- (void).cxx_destruct
{
}

@end