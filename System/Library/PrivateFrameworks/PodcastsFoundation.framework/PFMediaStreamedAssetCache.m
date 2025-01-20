@interface PFMediaStreamedAssetCache
- (BOOL)clearAndReturnError:(id *)a3;
- (BOOL)completeAndReturnError:(id *)a3;
- (NSString)pathExtension;
- (NSURL)cacheLocation;
- (NSURL)sourceURL;
- (PFMediaStreamedAssetCache)init;
- (PFMediaStreamedAssetCache)initWithSourceURL:(id)a3;
- (PFMediaStreamedAssetCache)initWithSourceURL:(id)a3 cacheLocation:(id)a4 purgeability:(int)a5;
- (id)cachedAssetURL;
- (id)persistentFileURL;
- (id)streamCacheURLAndReturnError:(id *)a3;
- (int)purgeability;
- (void)dealloc;
@end

@implementation PFMediaStreamedAssetCache

- (NSURL)sourceURL
{
  v2 = (void *)sub_1ACE74E18();
  return (NSURL *)v2;
}

- (NSString)pathExtension
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)cacheLocation
{
  v2 = (void *)sub_1ACE74E18();
  return (NSURL *)v2;
}

- (int)purgeability
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_purgeability);
}

- (PFMediaStreamedAssetCache)initWithSourceURL:(id)a3
{
  uint64_t v4 = sub_1ACE74F28();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v17 - v9;
  sub_1ACE74E98();
  v11 = (void *)sub_1ACE74E18();
  id v12 = objc_msgSend(self, sel_streamedMediaAssetURL);
  sub_1ACE74E98();

  v13 = (void *)sub_1ACE74E18();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  v15 = [(PFMediaStreamedAssetCache *)self initWithSourceURL:v11 cacheLocation:v13 purgeability:512];

  v14(v10, v4);
  return v15;
}

- (PFMediaStreamedAssetCache)initWithSourceURL:(id)a3 cacheLocation:(id)a4 purgeability:(int)a5
{
  uint64_t v6 = sub_1ACE74F28();
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  v11 = (char *)&v13 - v10;
  sub_1ACE74E98();
  sub_1ACE74E98();
  return (PFMediaStreamedAssetCache *)MediaStreamedAssetCache.init(sourceURL:cacheLocation:purgeability:)(v11, v9, a5);
}

- (id)cachedAssetURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7731B0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  MediaStreamedAssetCache.cachedAssetURL()((uint64_t)v5);

  uint64_t v7 = sub_1ACE74F28();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    uint64_t v9 = (void *)sub_1ACE74E18();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return v9;
}

- (id)streamCacheURLAndReturnError:(id *)a3
{
  uint64_t v4 = sub_1ACE74F28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_phase);
  v15 = self;
  uint64_t v9 = v8 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v8 + 16);
  uint64_t v10 = (os_unfair_lock_s *)(v8 + ((*(unsigned int *)(*(void *)v8 + 48) + 3) & 0x1FFFFFFFCLL));
  uint64_t v11 = self;
  os_unfair_lock_lock(v10);
  sub_1ACB443EC(v9, v7);
  os_unfair_lock_unlock(v10);

  id v12 = (void *)sub_1ACE74E18();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (BOOL)completeAndReturnError:(id *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_phase);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  uint64_t v6 = self;
  os_unfair_lock_lock(v5);
  sub_1ACB443D4(v4);
  os_unfair_lock_unlock(v5);

  return 1;
}

- (BOOL)clearAndReturnError:(id *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_phase);
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  uint64_t v6 = self;
  os_unfair_lock_lock(v5);
  sub_1ACB42480(v4);
  os_unfair_lock_unlock(v5);

  return 1;
}

- (id)persistentFileURL
{
  uint64_t v3 = sub_1ACE74F28();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = self;
  sub_1ACE74E38();
  sub_1ACE74E48();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);

  id v12 = (void *)sub_1ACE74E18();
  v11(v9, v3);
  return v12;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_phase);
  uint64_t v5 = v4 + *(void *)(*MEMORY[0x1E4FBBAB0] + *(void *)v4 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(v4 + ((*(unsigned int *)(*(void *)v4 + 48) + 3) & 0x1FFFFFFFCLL));
  uint64_t v7 = self;
  swift_retain();
  os_unfair_lock_lock(v6);
  sub_1ACB43054(v5);
  os_unfair_lock_unlock(v6);
  swift_release();
  v8.receiver = v7;
  v8.super_class = ObjectType;
  [(PFMediaStreamedAssetCache *)&v8 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___PFMediaStreamedAssetCache_sourceURL;
  uint64_t v4 = sub_1ACE74F28();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  swift_bridgeObjectRelease();
  v5((char *)self + OBJC_IVAR___PFMediaStreamedAssetCache_cacheLocation, v4);
  swift_bridgeObjectRelease();
  swift_release();
}

- (PFMediaStreamedAssetCache)init
{
  result = (PFMediaStreamedAssetCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end