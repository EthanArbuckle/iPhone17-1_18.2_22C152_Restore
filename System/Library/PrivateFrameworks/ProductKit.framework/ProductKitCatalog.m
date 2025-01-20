@interface ProductKitCatalog
+ (BOOL)isProductKitURL:(id)a3;
- (ProductKitCatalog)init;
- (ProductKitCatalogInternal)underlyingObject;
- (void)updateCatalogWithCompletionHandler:(id)a3;
- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 completionHandler:(id)a5;
- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6;
- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 completionHandler:(id)a5;
- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6;
@end

@implementation ProductKitCatalog

- (ProductKitCatalog)init
{
  v6.receiver = self;
  v6.super_class = (Class)ProductKitCatalog;
  v2 = [(ProductKitCatalog *)&v6 init];
  v3 = objc_alloc_init(ProductKitCatalogInternal);
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = v3;

  return v2;
}

+ (BOOL)isProductKitURL:(id)a3
{
  return +[ProductKitCatalogInternal isProductKitURL:a3];
}

- (void)updateCatalogWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ProductKitCatalog *)self underlyingObject];
  [v5 updateCatalogWithCompletionHandler:v4];
}

- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ProductKitCatalog *)self underlyingObject];
  [v11 watchBandFilesForFeatureWithURL:v10 featureString:v9 variant:0 completionHandler:v8];
}

- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ProductKitCatalog *)self underlyingObject];
  [v11 watchBandImageForFeatureWithURL:v10 featureString:v9 variant:0 completionHandler:v8];
}

- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(ProductKitCatalog *)self underlyingObject];
  [v14 watchBandFilesForFeatureWithURL:v13 featureString:v12 variant:v11 completionHandler:v10];
}

- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(ProductKitCatalog *)self underlyingObject];
  [v14 watchBandImageForFeatureWithURL:v13 featureString:v12 variant:v11 completionHandler:v10];
}

- (ProductKitCatalogInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
}

@end