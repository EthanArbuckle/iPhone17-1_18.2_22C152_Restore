@interface PGMusicCurationInflationContext
+ (id)contextWithMusicCache:(id)a3 actionSource:(id)a4 shouldForceMetadataRefetch:(BOOL)a5;
- (NSString)actionSource;
- (PGMusicCurationInflationContext)init;
@end

@implementation PGMusicCurationInflationContext

- (NSString)actionSource
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (id)contextWithMusicCache:(id)a3 actionSource:(id)a4 shouldForceMetadataRefetch:(BOOL)a5
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v8 = sub_1D1EBDE60();
  uint64_t v10 = v9;
  v11 = objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v11[OBJC_IVAR___PGMusicCurationInflationContext_cache] = a3;
  v11[OBJC_IVAR___PGMusicCurationInflationContext_shouldForceMetadataRefetch] = a5;
  v12 = (uint64_t *)&v11[OBJC_IVAR___PGMusicCurationInflationContext_actionSource];
  uint64_t *v12 = v8;
  v12[1] = v10;
  v16.receiver = v11;
  v16.super_class = ObjCClassMetadata;
  id v13 = a3;
  id v14 = objc_msgSendSuper2(&v16, sel_init);
  return v14;
}

- (PGMusicCurationInflationContext)init
{
  result = (PGMusicCurationInflationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end