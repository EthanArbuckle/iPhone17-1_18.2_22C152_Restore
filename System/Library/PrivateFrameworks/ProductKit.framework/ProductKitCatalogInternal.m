@interface ProductKitCatalogInternal
+ (BOOL)isProductKitURL:(id)a3;
- (ProductKitCatalogInternal)init;
- (void)updateCatalogWithCompletionHandler:(id)a3;
- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6;
- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6;
@end

@implementation ProductKitCatalogInternal

- (ProductKitCatalogInternal)init
{
  return (ProductKitCatalogInternal *)ProductKitCatalog.init()();
}

+ (BOOL)isProductKitURL:(id)a3
{
  uint64_t v3 = sub_21EFCDFC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EFCDF88();
  BOOL v7 = _s10ProductKit0aB7CatalogC02isaB3URLySb10Foundation0E0VFZ_0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (void)updateCatalogWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_21EF95100;
  *(void *)(v6 + 24) = v5;
  BOOL v7 = self;
  swift_retain();
  sub_21EFC7D48((uint64_t)sub_21EF951AC, v6);

  swift_release();
  swift_release();
}

- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
}

- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___ProductKitCatalogInternal_assetManager);
  swift_release();
}

@end