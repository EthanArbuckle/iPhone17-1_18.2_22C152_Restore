@interface PGSearchEntityPersister
- (BOOL)persistSearchEntitiesFromSearchEntityProvider:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (PGSearchEntityPersister)init;
- (PGSearchEntityPersister)initWithPhotoLibrary:(id)a3;
@end

@implementation PGSearchEntityPersister

- (PGSearchEntityPersister)initWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = (PGSearchEntityPersister *)sub_1D1A93818(v3);

  return v4;
}

- (BOOL)persistSearchEntitiesFromSearchEntityProvider:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  SearchEntityPersister.persistSearchEntities(from:progressReporter:)(a3);

  swift_unknownObjectRelease();
  return 1;
}

- (PGSearchEntityPersister)init
{
  result = (PGSearchEntityPersister *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___PGSearchEntityPersister_logger;
  uint64_t v4 = sub_1D1EBDBD0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end