@interface ICThumbnailCache
+ (ICThumbnailCache)shared;
- (ICThumbnailCache)init;
- (id)creationDateFor:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)invalidateForObjectIdentifiers:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation ICThumbnailCache

+ (ICThumbnailCache)shared
{
  if (qword_1EBBB4740 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBBB4448;
  return (ICThumbnailCache *)v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1B0AC4388(v4);

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  ThumbnailCache.subscript.setter(a3, v8);
}

- (id)creationDateFor:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB44D8);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = ((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v8 = a3;
  v9 = self;
  ThumbnailCache.creationDate(for:)(v8, v7);

  uint64_t v10 = sub_1B0B7FDEC();
  uint64_t v11 = *(void *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(NSObject *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    v12 = (void *)sub_1B0B7FD5C();
    (*(void (**)(NSObject *, uint64_t))(v11 + 8))(v7, v10);
  }
  return v12;
}

- (void)invalidateForObjectIdentifiers:(id)a3
{
  uint64_t v4 = sub_1B0B8273C();
  uint64_t v5 = self;
  sub_1B0AC5E08(v4);

  swift_bridgeObjectRelease();
}

- (ICThumbnailCache)init
{
  result = (ICThumbnailCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR___ICThumbnailCache____lazy_storage___cacheKeyQueueQos, &qword_1EBBB48C8);

  swift_bridgeObjectRelease();
}

@end