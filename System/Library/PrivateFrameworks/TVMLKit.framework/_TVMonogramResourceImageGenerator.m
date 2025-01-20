@interface _TVMonogramResourceImageGenerator
+ (BOOL)isResourceURL:(id)a3;
+ (id)tintImage:(id)a3 withColor:(id)a4;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVMonogramResourceImageGenerator

+ (BOOL)isResourceURL:(id)a3
{
  return objc_msgSend(a3, "tv_isResourceURL");
}

+ (id)tintImage:(id)a3 withColor:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    [v6 size];
    CGFloat v8 = v7;
    [v6 size];
    CGFloat height = v21.height;
    v21.width = v8;
    UIGraphicsBeginImageContext(v21);
    CurrentContext = UIGraphicsGetCurrentContext();
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v8;
    v22.size.CGFloat height = height;
    CGFloat v11 = CGRectGetHeight(v22);
    CGContextTranslateCTM(CurrentContext, 0.0, v11);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    id v12 = v6;
    v13 = (CGImage *)[v12 CGImage];
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v8;
    v23.size.CGFloat height = height;
    CGContextClipToMask(CurrentContext, v23, v13);
    [v5 setFill];

    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = v8;
    v24.size.CGFloat height = height;
    UIRectFill(v24);
    v14 = UIGraphicsGetCurrentContext();
    Image = CGBitmapContextCreateImage(v14);
    id v16 = objc_alloc(MEMORY[0x263F1C6B0]);
    uint64_t v17 = [v12 imageOrientation];

    v18 = (void *)[v16 initWithCGImage:Image imageOrientation:v17];
    UIGraphicsEndImageContext();
    CGImageRelease(Image);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v12;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;
  uint64_t v17 = v16;
  if (v16)
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__8;
    v43 = __Block_byref_object_dispose__8;
    id v44 = 0;
    v18 = [v16 imageURL];
    if (objc_msgSend(v18, "tv_isResourceURL"))
    {
      v19 = [v13 recordForResource:3 withInitiator:2];
      v20 = [MEMORY[0x263F08BD8] requestWithURL:v18];
      [v19 willSendRequest:v20];

      CGSize v21 = objc_msgSend(v18, "tv_resourceName");
      BOOL v22 = a6 == 1;
      CGRect v23 = (void *)MEMORY[0x263F086D0];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __125___TVMonogramResourceImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
      v31[3] = &unk_264BA8F08;
      v37 = &v39;
      id v24 = v21;
      id v32 = v24;
      BOOL v38 = v22;
      id v33 = v17;
      v34 = self;
      id v25 = v19;
      id v35 = v25;
      id v36 = v14;
      uint64_t v26 = [v23 blockOperationWithBlock:v31];
      v27 = (void *)v40[5];
      v40[5] = v26;

      v28 = [(_TVMonogramImageGenerator *)self imageGeneratorQueue];
      [v28 addOperation:v40[5]];
    }
    id v29 = (id)v40[5];

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (void)cancelLoad:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 cancel];
  }
}

@end