@interface _UIImageContentRenditionResult
+ (void)resultWithDrawingProvider:(void *)a3 CGImageProvider:(void *)a4 rbSymbolConfigurationProvider:;
- (void)CGImageProvider;
- (void)rbSymbolConfigurationProvider;
- (void)resultWithCGImageProvider:(uint64_t)a1;
@end

@implementation _UIImageContentRenditionResult

+ (void)resultWithDrawingProvider:(void *)a3 CGImageProvider:(void *)a4 rbSymbolConfigurationProvider:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  self;
  v9 = objc_opt_new();
  v10 = _Block_copy(v8);

  v11 = (void *)v9[3];
  v9[3] = v10;

  v12 = _Block_copy(v7);
  v13 = (void *)v9[1];
  v9[1] = v12;

  v14 = _Block_copy(v6);
  v15 = (void *)v9[2];
  v9[2] = v14;

  return v9;
}

- (void)CGImageProvider
{
  if (a1)
  {
    if (a1[1]) {
      v2 = (const void *)a1[1];
    }
    else {
      v2 = &__block_literal_global_648;
    }
    a1 = _Block_copy(v2);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_drawingProvider, 0);
  objc_storeStrong(&self->_configProvider, 0);
  objc_storeStrong(&self->_imageProvider, 0);
}

- (void)resultWithCGImageProvider:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = objc_opt_new();
    v5 = _Block_copy(*(const void **)(a1 + 24));
    id v6 = (void *)v4[3];
    v4[3] = v5;

    id v7 = _Block_copy(v3);
    id v8 = (void *)v4[1];
    v4[1] = v7;

    v9 = _Block_copy(*(const void **)(a1 + 16));
    v10 = (void *)v4[2];
    v4[2] = v9;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)rbSymbolConfigurationProvider
{
  if (a1)
  {
    if (a1[2]) {
      v2 = (const void *)a1[2];
    }
    else {
      v2 = &__block_literal_global_32_5;
    }
    a1 = _Block_copy(v2);
    uint64_t v1 = vars8;
  }
  return a1;
}

@end