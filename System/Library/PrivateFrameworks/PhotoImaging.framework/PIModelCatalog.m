@interface PIModelCatalog
+ (id)shared;
- (NSString)cleanupVersion;
- (NSString)inpaintModelVersion;
- (NSString)refinementModelVersion;
- (NSString)segmentationModelVersion;
- (PIModelCatalog)init;
- (id)cleanupModelBundleURL:(id *)a3;
- (id)inpaintModelURL:(id *)a3;
- (id)refinementModelURL:(id *)a3;
- (id)segmentationModelURL:(id *)a3;
@end

@implementation PIModelCatalog

+ (id)shared
{
  swift_getObjCClassMetadata();
  static PIModelCatalog.shared()();
  return v2;
}

- (id)cleanupModelBundleURL:(id *)a3
{
  return sub_1A96842D0(self, (uint64_t)a2, (uint64_t)a3, PIModelCatalog.cleanupModelBundleURL());
}

- (id)inpaintModelURL:(id *)a3
{
  return sub_1A96842D0(self, (uint64_t)a2, (uint64_t)a3, PIModelCatalog.inpaintModelURL());
}

- (id)refinementModelURL:(id *)a3
{
  return sub_1A96842D0(self, (uint64_t)a2, (uint64_t)a3, PIModelCatalog.refinementModelURL());
}

- (id)segmentationModelURL:(id *)a3
{
  return sub_1A96842D0(self, (uint64_t)a2, (uint64_t)a3, PIModelCatalog.segmentationModelURL());
}

- (NSString)cleanupVersion
{
  return (NSString *)sub_1A9684A28(self, (uint64_t)a2, (void (*)(void))PIModelCatalog.cleanupVersion.getter);
}

- (NSString)inpaintModelVersion
{
  return (NSString *)sub_1A9684A28(self, (uint64_t)a2, (void (*)(void))PIModelCatalog.inpaintModelVersion.getter);
}

- (NSString)refinementModelVersion
{
  return (NSString *)sub_1A9684A28(self, (uint64_t)a2, (void (*)(void))PIModelCatalog.refinementModelVersion.getter);
}

- (NSString)segmentationModelVersion
{
  return (NSString *)sub_1A9684A28(self, (uint64_t)a2, (void (*)(void))PIModelCatalog.segmentationModelVersion.getter);
}

- (PIModelCatalog)init
{
  return (PIModelCatalog *)PIModelCatalog.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end