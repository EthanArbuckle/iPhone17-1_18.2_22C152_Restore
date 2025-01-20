@interface DownloadRemovalObserver
- (void)removeDownloadedEpisodeWithUuid:(id)a3 completion:(id)a4;
@end

@implementation DownloadRemovalObserver

- (void)removeDownloadedEpisodeWithUuid:(id)a3 completion:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2700);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_1E3E7CD30();
  uint64_t v12 = v11;
  if (v9)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v9;
    v9 = sub_1E3C509C0;
  }
  else
  {
    uint64_t v13 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE25170);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1E3E86660;
  *(void *)(v14 + 32) = v10;
  *(void *)(v14 + 40) = v12;
  *(unsigned char *)(v14 + 48) = 2;
  uint64_t v15 = sub_1E3E7D1E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v14;
  v16[5] = self;
  v16[6] = v9;
  v16[7] = v13;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1E3C19A6C((uint64_t)v9);
  sub_1E3C4C288((uint64_t)v8, (uint64_t)&unk_1EAE25708, (uint64_t)v16);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1E3C1A3C4((uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
}

@end