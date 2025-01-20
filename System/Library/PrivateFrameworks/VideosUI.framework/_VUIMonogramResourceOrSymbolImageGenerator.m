@interface _VUIMonogramResourceOrSymbolImageGenerator
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _VUIMonogramResourceOrSymbolImageGenerator

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v14;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;
  v19 = v18;
  if (!v18)
  {
    id v25 = 0;
    goto LABEL_13;
  }
  v20 = [v18 imageURL];
  if (objc_msgSend(v20, "vuicore_isResourceURL"))
  {
    v36 = self;
    v21 = [v15 recordForResource:3 withInitiator:2];
    v22 = [MEMORY[0x1E4F290D0] requestWithURL:v20];
    [v21 willSendRequest:v22 redirectResponse:0];

    v23 = objc_msgSend(v20, "vuicore_resourceName");
    BOOL v24 = a6 == 1;
    id v25 = objc_alloc_init(MEMORY[0x1E4F28B48]);
    objc_initWeak(location, v25);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v43[3] = &unk_1E6DFA9F8;
    v26 = v48;
    objc_copyWeak(v48, location);
    id v27 = v23;
    id v44 = v27;
    v48[1] = (id)v24;
    id v45 = v19;
    id v28 = v21;
    id v46 = v28;
    id v47 = v16;
    [v25 addExecutionBlock:v43];
    v29 = [(_VUIMonogramImageGenerator *)v36 imageGeneratorQueue];
    [v29 addOperation:v25];

    v30 = v44;
  }
  else
  {
    if (!objc_msgSend(v20, "vuicore_isSymbolURL"))
    {
      id v25 = 0;
      goto LABEL_12;
    }
    v31 = [v15 recordForResource:3 withInitiator:2];
    v32 = [MEMORY[0x1E4F290D0] requestWithURL:v20];
    [v31 willSendRequest:v32 redirectResponse:0];

    v33 = objc_msgSend(v20, "vuicore_symbolName");
    id v25 = objc_alloc_init(MEMORY[0x1E4F28B48]);
    objc_initWeak(location, v25);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
    v37[3] = &unk_1E6DFAA20;
    v26 = v42;
    objc_copyWeak(v42, location);
    v42[1] = *(id *)&width;
    v42[2] = *(id *)&height;
    id v38 = v19;
    id v27 = v33;
    id v39 = v27;
    id v28 = v31;
    id v40 = v28;
    id v41 = v16;
    [v25 addExecutionBlock:v37];
    v34 = [(_VUIMonogramImageGenerator *)self imageGeneratorQueue];
    [v34 addOperation:v25];

    v30 = v38;
  }

  objc_destroyWeak(v26);
  objc_destroyWeak(location);

LABEL_12:
LABEL_13:

  return v25;
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