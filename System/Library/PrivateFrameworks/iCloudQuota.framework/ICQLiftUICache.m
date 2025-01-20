@interface ICQLiftUICache
+ (ICQLiftUICache)sharedCache;
- (void)cacheResponseFromURL:(id)a3;
- (void)discardCaches;
- (void)fetchResponseForURL:(NSURL *)a3 completion:(id)a4;
@end

@implementation ICQLiftUICache

+ (ICQLiftUICache)sharedCache
{
  if (qword_1EB786D70 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();
  return (ICQLiftUICache *)v2;
}

- (void)cacheResponseFromURL:(id)a3
{
  uint64_t v4 = sub_1D58CC700();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D58CC6C0();
  sub_1D58CC8D0();
  v9 = self;
  v10 = v7;
  swift_retain();
  sub_1D58CC8B0();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fetchResponseForURL:(NSURL *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D58CCBF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA723548;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA723558;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1D58BBA24((uint64_t)v9, (uint64_t)&unk_1EA723568, (uint64_t)v14);
  swift_release();
}

- (void)discardCaches
{
  sub_1D58CC8D0();
  swift_retain();
  sub_1D58CC8B0();
  swift_release();
}

@end