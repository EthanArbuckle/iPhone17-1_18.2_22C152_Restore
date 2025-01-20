@interface _TVMonogramInitialsSilhouetteImageGenerator
+ (BOOL)_isRomanName:(id)a3;
+ (id)_initialsForFirstName:(id)a3 lastName:(id)a4;
+ (id)monogramImageWithDescription:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVMonogramInitialsSilhouetteImageGenerator

+ (BOOL)_isRomanName:(id)a3
{
  if (a3) {
    return CNStringContainsNonLatinCharacters() ^ 1;
  }
  else {
    return 1;
  }
}

+ (id)_initialsForFirstName:(id)a3 lastName:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (!(v5 | v6)
    || ![(id)objc_opt_class() _isRomanName:v5]
    || ![(id)objc_opt_class() _isRomanName:v6])
  {
    goto LABEL_16;
  }
  v7 = NSString;
  uint64_t v8 = [(id)v5 length];
  if (v8)
  {
    objc_msgSend((id)v5, "substringWithRange:", 0, 1);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_26E5657A8;
  }
  uint64_t v10 = [(id)v6 length];
  if (v10)
  {
    objc_msgSend((id)v6, "substringWithRange:", 0, 1);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_26E5657A8;
  }
  v12 = [v7 stringWithFormat:@"%@%@", v9, v11];
  if (v10) {

  }
  if (v8) {
  if (![v12 length])
  }
  {

LABEL_16:
    v12 = 0;
  }
  v13 = [v12 uppercaseString];

  return v13;
}

+ (id)monogramImageWithDescription:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  [v4 cornerRadius];
  uint64_t v10 = v9;
  v11 = [v4 fillColor];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x263F1C550] blackColor];
  }
  v14 = v13;

  v15 = +[TVGraphicsImageRenderer preferredFormat];
  [v15 setPreferredRange:2];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76___TVMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke;
  v20[3] = &unk_264BA8F30;
  uint64_t v23 = v10;
  double v24 = v6;
  double v25 = v8;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  double v28 = v6;
  double v29 = v8;
  id v21 = v14;
  id v22 = v4;
  id v30 = a1;
  id v16 = v4;
  id v17 = v14;
  v18 = +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v15, v20, v6, v8);

  return v18;
}

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if ([v5 preferedMonogramType] == 2)
  {
    uint64_t v6 = [v5 firstName];
    double v7 = [v5 lastName];
    double v8 = [v5 text];
    uint64_t v9 = [v5 font];
    uint64_t v10 = [v9 fontName];
    v11 = [v5 fillColor];
    v12 = v11;
    v36 = (void *)v10;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x263F1C550] blackColor];
    }
    v18 = v13;

    double v40 = 0.0;
    double v38 = 0.0;
    double v39 = 0.0;
    uint64_t v37 = 0;
    [v18 getRed:&v40 green:&v39 blue:&v38 alpha:&v37];
    v19 = NSString;
    if ([v8 length]) {
      v20 = v8;
    }
    else {
      v20 = (void *)v6;
    }
    id v21 = (void *)v6;
    id v22 = v7;
    if ([v8 length]) {
      double v7 = &stru_26E5657A8;
    }
    [v9 pointSize];
    uint64_t v24 = v23;
    [v5 cornerRadius];
    double v25 = &off_230C37000;
    LODWORD(v25) = vcvtad_u64_f64(v40 * 255.0);
    LODWORD(v26) = vcvtad_u64_f64(v39 * 255.0);
    LODWORD(v27) = vcvtad_u64_f64(v38 * 255.0);
    v14 = [v19 stringWithFormat:@"%@_%@_%@_%.0f_%.0f_%02X%02X%02X%.1f", v20, v7, v36, v24, v28, v25, v26, v27, v37];
  }
  else
  {
    if ([v5 preferedMonogramType] != 1 && objc_msgSend(v5, "preferedMonogramType"))
    {
      v14 = 0;
      goto LABEL_25;
    }
    v15 = [v5 fillColor];
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x263F1C550] blackColor];
    }
    id v21 = v17;

    double v40 = 0.0;
    double v38 = 0.0;
    double v39 = 0.0;
    uint64_t v37 = 0;
    [v21 getRed:&v40 green:&v39 blue:&v38 alpha:&v37];
    double v29 = NSString;
    if ([v5 shouldFallBackToSilhouette]) {
      id v30 = @"yes-man";
    }
    else {
      id v30 = @"no-man";
    }
    [v5 cornerRadius];
    v31 = &off_230C37000;
    LODWORD(v31) = vcvtad_u64_f64(v40 * 255.0);
    LODWORD(v32) = vcvtad_u64_f64(v39 * 255.0);
    LODWORD(v33) = vcvtad_u64_f64(v38 * 255.0);
    v14 = [v29 stringWithFormat:@"Silhouette_%@_%.0f_%02X%02X%02X%.1f", v30, v34, v31, v32, v33, v37];
  }

LABEL_25:
  return v14;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a8;
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  uint64_t v32 = __Block_byref_object_dispose__8;
  id v33 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v11;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;
  id v16 = v15;
  if (v15)
  {
    id v17 = (void *)MEMORY[0x263F086D0];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v24[3] = &unk_264BA8F80;
    uint64_t v27 = &v28;
    id v25 = v15;
    id v26 = v13;
    uint64_t v18 = [v17 blockOperationWithBlock:v24];
    v19 = (void *)v29[5];
    v29[5] = v18;

    v20 = [(_TVMonogramImageGenerator *)self imageGeneratorQueue];
    [v20 addOperation:v29[5]];

    id v21 = v25;
  }
  else
  {
    id v21 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:11 userInfo:0];
    (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v21);
  }

  id v22 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v22;
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