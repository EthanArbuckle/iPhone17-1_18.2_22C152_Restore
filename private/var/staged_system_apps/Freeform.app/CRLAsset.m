@interface CRLAsset
+ (_TtC8Freeform8CRLAsset)null;
- (BOOL)hasOwners;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsDownload;
- (CGDataProvider)newCGDataProvider;
- (CGImage)newCGImage;
- (CGImageSource)newCGImageSource;
- (CRLColor)fallbackColor;
- (NSString)filename;
- (NSUUID)assetUUID;
- (UTType)type;
- (_TtC8Freeform8CRLAsset)init;
- (id)AVAssetAndReturnError:(id *)a3;
- (id)AVAssetWithOptions:(id)a3 error:(id *)a4;
- (id)newData;
- (int64_t)crl_hash;
- (int64_t)hash;
- (unint64_t)length;
- (void)addDownloadObserverWithIdentifier:(id)a3 options:(unint64_t)a4 handler:(id)a5;
- (void)cancelDownload;
- (void)downloadIfNeeded;
- (void)performInputStreamReadWithAccessor:(id)a3;
- (void)removeDownloadObserverWithIdentifier:(id)a3;
@end

@implementation CRLAsset

+ (_TtC8Freeform8CRLAsset)null
{
  if (qword_10166F8C8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10171B848;

  return (_TtC8Freeform8CRLAsset *)v2;
}

- (BOOL)hasOwners
{
  v2 = self;
  char v3 = sub_100AE2510();

  return v3 & 1;
}

- (UTType)type
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101676160);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v8 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v7);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 16);
  v10 = self;
  v9(v7, v8);
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v12 = [v11 crl_pathUTI];

  if (v12)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    UTType.init(_:)();
  }
  else
  {
    uint64_t v13 = type metadata accessor for UTType();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }

  uint64_t v14 = type metadata accessor for UTType();
  uint64_t v15 = *(void *)(v14 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v6, 1, v14) != 1)
  {
    Class isa = UTType._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v14);
  }

  return (UTType *)isa;
}

- (unint64_t)length
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v7 = self;
  unint64_t v8 = v6(v4, v5);

  return v8;
}

- (NSUUID)assetUUID
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v9 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 24);
  NSString v11 = self;
  v10(v8, v9);

  v12.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (NSUUID *)v12.super.isa;
}

- (NSString)filename
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  uint64_t v7 = self;
  v6(v4, v5);

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_100AE2BB0((uint64_t)v8);

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Hasher.init()();
  uint64_t v8 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v9 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 24);
  NSString v11 = self;
  v10(v8, v9);
  sub_100AE76E8((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  dispatch thunk of Hashable.hash(into:)();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  long long v21 = v16;
  long long v22 = v17;
  uint64_t v23 = v18;
  long long v19 = *(_OWORD *)&v14[8];
  long long v20 = v15;
  Swift::Int v12 = Hasher.finalize()();

  return v12;
}

- (int64_t)crl_hash
{
  return [(CRLAsset *)self hash];
}

- (CRLColor)fallbackColor
{
  return (CRLColor *)0;
}

- (id)newData
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32);
  uint64_t v7 = self;
  uint64_t v8 = v6(v4, v5);
  unint64_t v10 = v9;

  if (v10 >> 60 == 15) {
    return 0;
  }
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100514260(v8, v10);
  return isa;
}

- (CGDataProvider)newCGDataProvider
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  uint64_t v7 = self;
  uint64_t v8 = (CGDataProvider *)v6(v4, v5);

  return v8;
}

- (CGImageSource)newCGImageSource
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  uint64_t v7 = self;
  uint64_t v8 = (CGDataProvider *)v6(v4, v5);
  if (v8)
  {
    unint64_t v9 = v8;
    unint64_t v10 = CGImageSourceCreateWithDataProvider(v8, 0);

    uint64_t v7 = (_TtC8Freeform8CRLAsset *)v9;
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (CGImage)newCGImage
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  uint64_t v7 = self;
  uint64_t v8 = (CGDataProvider *)v6(v4, v5);
  CGImageRef ImageAtIndex = v8;
  if (v8)
  {
    unint64_t v10 = CGImageSourceCreateWithDataProvider(v8, 0);

    if (v10)
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);

      uint64_t v7 = (_TtC8Freeform8CRLAsset *)v10;
    }
    else
    {
      CGImageRef ImageAtIndex = 0;
    }
  }

  return ImageAtIndex;
}

- (void)performInputStreamReadWithAccessor:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  v9[2] = v4;
  uint64_t v5 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v6 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v5);
  uint64_t v7 = *(void (**)(uint64_t (*)(), void *, uint64_t, uint64_t))(v6 + 48);
  uint64_t v8 = self;
  v7(sub_100895C4C, v9, v5, v6);
  _Block_release(v4);
}

- (id)AVAssetAndReturnError:(id *)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v5 = v4[3];
  uint64_t v6 = v4[4];
  sub_10050F848(v4, v5);
  uint64_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 56);
  uint64_t v8 = self;
  unint64_t v9 = (void *)v7(_swiftEmptyDictionarySingleton, v5, v6);

  return v9;
}

- (id)AVAssetWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v7 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v6);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
  unint64_t v9 = self;
  unint64_t v10 = (void *)v8(v5, v6, v7);
  swift_bridgeObjectRelease();

  return v10;
}

- (BOOL)needsDownload
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 64);
  uint64_t v7 = self;
  char v8 = v6(v4, v5);

  return v8 & 1;
}

- (void)addDownloadObserverWithIdentifier:(id)a3 options:(unint64_t)a4 handler:(id)a5
{
  uint64_t v19 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v9);
  NSString v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::Int v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v15 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v14);
  long long v16 = *(void (**)(char *, unint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v15 + 72);
  long long v17 = self;
  v16(v11, a4, sub_100AE7730, v13, v14, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v19);
}

- (void)removeDownloadObserverWithIdentifier:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v10 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v9);
  NSString v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 80);
  Swift::Int v12 = self;
  v11(v8, v9, v10);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)downloadIfNeeded
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 16];
  uint64_t v5 = *(void *)&self->storage[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  sub_10050F848((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 64);
  uint64_t v9 = self;
  if (v6(v4, v5))
  {
    uint64_t v7 = v3[3];
    uint64_t v8 = v3[4];
    sub_10050F848(v3, v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 88))(v7, v8);
  }
}

- (void)cancelDownload
{
  uint64_t v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  sub_10050F848(v3, v4);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
  uint64_t v7 = self;
  v6(v4, v5);
}

- (_TtC8Freeform8CRLAsset)init
{
  result = (_TtC8Freeform8CRLAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end