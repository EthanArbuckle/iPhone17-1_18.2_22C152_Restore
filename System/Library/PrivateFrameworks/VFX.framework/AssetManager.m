@interface AssetManager
- (_TtC3VFX12AssetManager)init;
- (id)absoluteURLForAssetPath:(id)a3;
@end

@implementation AssetManager

- (_TtC3VFX12AssetManager)init
{
  return (_TtC3VFX12AssetManager *)sub_1B63BC16C();
}

- (id)absoluteURLForAssetPath:(id)a3
{
  sub_1B638C09C(0, (unint64_t *)&qword_1EB9857F0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  v7 = &v16[-v6];
  uint64_t v8 = sub_1B6E31798();
  uint64_t v10 = v9;
  v11 = self;
  v16[12] = 1;
  sub_1B69927D8(v8, v10, 0x100000000, (uint64_t)v7);

  swift_bridgeObjectRelease();
  uint64_t v12 = sub_1B6E30F48();
  uint64_t v13 = *(void *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) != 1)
  {
    v14 = (void *)sub_1B6E30E78();
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v7, v12);
  }

  return v14;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end