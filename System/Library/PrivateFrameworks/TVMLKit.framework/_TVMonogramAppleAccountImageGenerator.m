@interface _TVMonogramAppleAccountImageGenerator
+ (BOOL)isAppleAccountsURL:(id)a3;
- (id)loadImageForURL:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVMonogramAppleAccountImageGenerator

+ (BOOL)isAppleAccountsURL:(id)a3
{
  v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"x-apple-identity-image"];

  return v4;
}

- (id)loadImageForURL:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = 0;
  if ([(id)objc_opt_class() isAppleAccountsURL:v13])
  {
    v16 = (void *)MEMORY[0x263F086D0];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v25 = &unk_264BA8EE0;
    v28 = &v30;
    double v29 = fmin(width, height);
    id v26 = v13;
    id v27 = v15;
    uint64_t v17 = [v16 blockOperationWithBlock:&v22];
    v18 = (void *)v31[5];
    v31[5] = v17;

    v19 = [(_TVMonogramImageGenerator *)self imageGeneratorQueue];
    [v19 addOperation:v31[5]];
  }
  id v20 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v20;
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