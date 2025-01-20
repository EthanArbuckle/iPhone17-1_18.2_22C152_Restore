@interface PGFlexMusicCacher
+ (void)cacheSongAudioAndArtworkForUIDs:(id)a3;
- (PGFlexMusicCacher)init;
@end

@implementation PGFlexMusicCacher

+ (void)cacheSongAudioAndArtworkForUIDs:(id)a3
{
  uint64_t v3 = sub_1D1EBE1B0();
  unint64_t v4 = sub_1D1AB54B8(v3);
  unint64_t v5 = v4;
  if (v4 >> 62)
  {
    uint64_t v6 = sub_1D1EBEDA0();
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v6) {
      goto LABEL_10;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v8 = (id)MEMORY[0x1D25FDAE0](i, v5);
    }
    else {
      id v8 = *(id *)(v5 + 8 * i + 32);
    }
    v9 = v8;
    objc_msgSend(v8, sel_pg_requestDownloadIfNeeded);
  }
LABEL_10:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (PGFlexMusicCacher)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGFlexMusicCacher *)&v3 init];
}

@end