@interface ShaderGraphService
+ (NSArray)builtInGeometryPropertyNames;
+ (id)archiveMaterial:(id)a3 error:(id *)a4;
+ (id)materialFromGraph:(id)a3 configuration:(id)a4 error:(id *)a5;
+ (id)materialFromGraph:(id)a3 error:(id *)a4;
+ (id)materialWithArchiveData:(id)a3 error:(id *)a4;
+ (id)metalLibraryFromMaterial:(id)a3 forDevice:(id)a4 error:(id *)a5;
+ (id)metalLibraryFromMaterial:(id)a3 forDevice:(id)a4 options:(id)a5 error:(id *)a6;
- (ShaderGraphService)init;
@end

@implementation ShaderGraphService

- (ShaderGraphService)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ShaderGraphService *)&v3 init];
}

+ (NSArray)builtInGeometryPropertyNames
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  specialized _copyCollectionToContiguousArray<A>(_:)(v2);
  swift_bridgeObjectRelease();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  return (NSArray *)v3.super.isa;
}

+ (id)materialFromGraph:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = specialized static ShaderGraphService.createMaterial(from:config:)((uint8_t *)a3, a4);

  return v9;
}

+ (id)materialFromGraph:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = specialized static ShaderGraphService.createMaterial(from:)((uint8_t *)a3);

  return v6;
}

+ (id)archiveMaterial:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = specialized static ShaderGraphService.archiveMaterial(_:)(a3);
  unint64_t v8 = v7;

  v9.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v6, v8);
  return v9.super.isa;
}

+ (id)materialWithArchiveData:(id)a3 error:(id *)a4
{
  uint64_t v4 = (uint64_t)a3;
  if (a3)
  {
    id v5 = a3;
    uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v7 = 0xF000000000000000;
  }
  unint64_t v8 = specialized static ShaderGraphService.createMaterialFromArchive(data:)(v4, v7);
  outlined consume of Data?(v4, v7);
  return v8;
}

+ (id)metalLibraryFromMaterial:(id)a3 forDevice:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = specialized static ShaderGraphService.createLibrary(from:device:options:)((unsigned __int8 *)a3, (char *)a4, (uint64_t)v10);

  swift_unknownObjectRelease();
  return v11;
}

+ (id)metalLibraryFromMaterial:(id)a3 forDevice:(id)a4 error:(id *)a5
{
  unint64_t v7 = (objc_class *)type metadata accessor for SGREMaterialCompilationOptions();
  unint64_t v8 = objc_allocWithZone(v7);
  v8[OBJC_IVAR___SGREMaterialCompilationOptions_enableFailedCompileMaterial] = 1;
  v8[OBJC_IVAR___SGREMaterialCompilationOptions_forceEnableTier1FallbackSupport] = 0;
  *(void *)&v8[OBJC_IVAR___SGREMaterialCompilationOptions_workingColorSpace] = 0;
  v13.receiver = v8;
  v13.super_class = v7;
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = objc_msgSendSuper2(&v13, sel_init);
  v11 = specialized static ShaderGraphService.createLibrary(from:device:options:)((unsigned __int8 *)a3, (char *)a4, (uint64_t)v10);
  swift_unknownObjectRelease();

  return v11;
}

@end