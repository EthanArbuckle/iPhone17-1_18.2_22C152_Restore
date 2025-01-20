@interface ICAssetThumbnailCache
+ (ICAssetThumbnailCache)shared;
+ (NSDate)currentVersionDate;
- (ICAssetThumbnailCache)init;
- (id)creationDateFor:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)invalidateForObjectIdentifiers:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation ICAssetThumbnailCache

+ (NSDate)currentVersionDate
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB44D8);
  MEMORY[0x1F4188790](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EBBB4780 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBBB4450);
  sub_1B0A4F8C8(v5, (uint64_t)v4);
  uint64_t v6 = sub_1B0B7FDEC();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
  {
    v8 = (void *)sub_1B0B7FD5C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  return (NSDate *)v8;
}

+ (ICAssetThumbnailCache)shared
{
  if (qword_1EBBB4788 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1EBBB4468;
  return (ICAssetThumbnailCache *)v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = _s7NotesUI19AssetThumbnailCacheCySo22ICThumbnailDescriptionCSgSo0F13ConfigurationCcig_0(v4);

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (id)creationDateFor:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB44D8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = qword_1EBBB4780;
  id v9 = a3;
  uint64_t v10 = self;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v5, (uint64_t)qword_1EBBB4450);
  sub_1B0A4F8C8(v11, (uint64_t)v7);

  uint64_t v12 = sub_1B0B7FDEC();
  uint64_t v13 = *(void *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) != 1)
  {
    v14 = (void *)sub_1B0B7FD5C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v12);
  }
  return v14;
}

- (void)invalidateForObjectIdentifiers:(id)a3
{
}

- (ICAssetThumbnailCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICAssetThumbnailCache *)&v3 init];
}

@end