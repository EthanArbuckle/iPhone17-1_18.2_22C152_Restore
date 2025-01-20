@interface STKStickerRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferred;
- (CGSize)size;
- (NSData)data;
- (NSString)description;
- (NSString)role;
- (NSUUID)identifier;
- (STKStickerRepresentation)init;
- (STKStickerRepresentation)initWithCoder:(id)a3;
- (UTType)uti;
- (int64_t)byteCount;
- (int64_t)hash;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setByteCount:(int64_t)a3;
- (void)setData:(id)a3;
- (void)setIsPreferred:(BOOL)a3;
- (void)setRole:(id)a3;
@end

@implementation STKStickerRepresentation

- (NSUUID)identifier
{
  v2 = (void *)sub_25E4254A0();
  return (NSUUID *)v2;
}

- (NSData)data
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_data);
  swift_beginAccess();
  uint64_t v4 = *v2;
  unint64_t v3 = v2[1];
  sub_25E3CEAB0(v4, v3);
  v5 = (void *)sub_25E4253B0();
  sub_25E3CEA28(v4, v3);
  return (NSData *)v5;
}

- (void)setData:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_25E4253D0();
  uint64_t v7 = v6;

  sub_25E4135FC(v5, v7);
}

- (UTType)uti
{
  v2 = (void *)sub_25E4255A0();
  return (UTType *)v2;
}

- (int64_t)byteCount
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_byteCount);
  swift_beginAccess();
  return *v2;
}

- (void)setByteCount:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_byteCount);
  swift_beginAccess();
  *id v4 = a3;
}

- (CGSize)size
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___STKStickerRepresentation_size);
  double v3 = *(double *)&self->_anon_0[OBJC_IVAR___STKStickerRepresentation_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)role
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  double v2 = (void *)sub_25E4258C0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setRole:(id)a3
{
  uint64_t v4 = sub_25E4258F0();
  uint64_t v6 = v5;
  uint64_t v7 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerRepresentation_role);
  swift_beginAccess();
  *uint64_t v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)isPreferred
{
  double v2 = (BOOL *)self + OBJC_IVAR___STKStickerRepresentation_isPreferred;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPreferred:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___STKStickerRepresentation_isPreferred;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___STKStickerRepresentation_version);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_25E425DD0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = sub_25E413F5C((uint64_t)v8);

  sub_25E3CE8D4((uint64_t)v8, &qword_26B389560);
  return v6;
}

- (int64_t)hash
{
  double v2 = self;
  int64_t v3 = sub_25E4254D0();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STKStickerRepresentation)initWithCoder:(id)a3
{
  return (STKStickerRepresentation *)Sticker.Representation.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_25E414BB4(v4);
}

- (NSString)description
{
  double v2 = self;
  sub_25E414FA8();

  int64_t v3 = (void *)sub_25E4258C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (STKStickerRepresentation)init
{
  CGSize result = (STKStickerRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR___STKStickerRepresentation_identifier;
  uint64_t v4 = sub_25E4254F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_25E3CEA28(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKStickerRepresentation_data), *(void *)&self->_anon_0[OBJC_IVAR___STKStickerRepresentation_data]);
  uint64_t v5 = (char *)self + OBJC_IVAR___STKStickerRepresentation_uti;
  uint64_t v6 = sub_25E4255B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
}

@end