@interface PFFairPlayAsset
- (BOOL)isOfflineAsset;
- (NSString)description;
- (PFFairPlayAsset)init;
- (PFFairPlayAsset)initWithAdamID:(int64_t)a3 avAsset:(id)a4;
@end

@implementation PFFairPlayAsset

- (NSString)description
{
  v2 = self;
  FairPlayAsset.description.getter();

  v3 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PFFairPlayAsset)initWithAdamID:(int64_t)a3 avAsset:(id)a4
{
  id v5 = a4;
  v6 = (PFFairPlayAsset *)sub_1ACC4895C(a3, v5);

  return v6;
}

- (BOOL)isOfflineAsset
{
  uint64_t v3 = sub_1ACE74F28();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFFairPlayAsset_avAsset);
  v8 = self;
  id v9 = objc_msgSend(v7, sel_URL);
  sub_1ACE74E98();

  LOBYTE(v9) = sub_1ACE74D98();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v9 & 1;
}

- (PFFairPlayAsset)init
{
  result = (PFFairPlayAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end