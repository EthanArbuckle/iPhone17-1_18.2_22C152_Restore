@interface SILIndicatorDesc
- (NSArray)boundingBoxes;
- (NSArray)dynamicBoundingBoxes;
- (NSString)blobName;
- (NSString)constraintsFile;
- (NSString)name;
- (_TtC10SILManager15SILFlipBookDesc)flipbook;
- (_TtC10SILManager16SILIndicatorDesc)init;
- (const)frames;
- (int64_t)Bpr;
- (int64_t)extent;
- (int64_t)sensorCategory;
- (int64_t)type;
- (unsigned)framesCount;
- (void)dealloc;
- (void)setType:(int64_t)a3;
@end

@implementation SILIndicatorDesc

- (int64_t)type
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_type);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)name
{
  return (NSString *)@objc SILIndicatorDesc.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_name);
}

- (int64_t)sensorCategory
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_sensorCategory);
}

- (int64_t)extent
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_extent);
}

- (int64_t)Bpr
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_Bpr);
}

- (NSString)blobName
{
  return (NSString *)@objc SILIndicatorDesc.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobName);
}

- (_TtC10SILManager15SILFlipBookDesc)flipbook
{
  return (_TtC10SILManager15SILFlipBookDesc *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                      + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_flipbook));
}

- (NSString)constraintsFile
{
  v2 = (void *)MEMORY[0x263F8EED0];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0xF0);
  v4 = self;
  result = (NSString *)v3();
  if (result)
  {
    v6 = result[3];
    uint64_t v7 = swift_release();
    uint64_t v8 = (*(uint64_t (**)(uint64_t))((*v2 & *v6) + 0x78))(v7);
    uint64_t v10 = v9;

    v11 = (void *)MEMORY[0x261165820](v8, v10);
    swift_bridgeObjectRelease();
    return (NSString *)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSArray)boundingBoxes
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0xF0);
  v3 = self;
  result = (NSArray *)v2();
  if (result)
  {
    v5 = result[3].super.isa;
    swift_release();
    swift_retain();

    swift_bridgeObjectRetain();
    swift_release();
    type metadata accessor for CGRect(0);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (NSArray *)v6.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSArray)dynamicBoundingBoxes
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0xF0);
  v3 = self;
  result = (NSArray *)v2();
  if (result)
  {
    v5 = result[3].super.isa;
    swift_release();
    swift_retain();

    swift_bridgeObjectRetain();
    swift_release();
    type metadata accessor for CGRect(0);
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (NSArray *)v6.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (const)frames
{
  return *(const SILFrameDesc **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_frames);
}

- (unsigned)framesCount
{
  return *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_framesCount);
}

- (void)dealloc
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined destroy of SILFileHandle?((uint64_t)self + OBJC_IVAR____TtC10SILManager16SILIndicatorDesc_blobHandle);
  swift_release();
}

- (_TtC10SILManager16SILIndicatorDesc)init
{
  result = (_TtC10SILManager16SILIndicatorDesc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end