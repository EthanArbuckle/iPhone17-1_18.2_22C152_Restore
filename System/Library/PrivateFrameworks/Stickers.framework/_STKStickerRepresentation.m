@interface _STKStickerRepresentation
+ (_STKStickerRepresentationRole)roles;
- (CGSize)size;
- (NSData)data;
- (NSString)description;
- (NSString)role;
- (NSUUID)identifier;
- (NSUUID)stickerIdentifier;
- (UTType)uti;
- (_STKStickerEffect)effect;
- (_STKStickerRepresentation)init;
@end

@implementation _STKStickerRepresentation

- (NSUUID)identifier
{
  v2 = (void *)sub_25E4254A0();
  return (NSUUID *)v2;
}

- (NSUUID)stickerIdentifier
{
  v2 = (void *)sub_25E4254A0();
  return (NSUUID *)v2;
}

- (NSData)data
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerRepresentation_data);
  unint64_t v3 = *(void *)&self->_anon_0[OBJC_IVAR____STKStickerRepresentation_data];
  sub_25E3CEAB0(v2, v3);
  v4 = (void *)sub_25E4253B0();
  sub_25E3CEA28(v2, v3);
  return (NSData *)v4;
}

- (UTType)uti
{
  uint64_t v2 = (void *)sub_25E4255A0();
  return (UTType *)v2;
}

- (NSString)role
{
  return (NSString *)sub_25E3D311C();
}

- (CGSize)size
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____STKStickerRepresentation_size);
  double v3 = *(double *)&self->_anon_0[OBJC_IVAR____STKStickerRepresentation_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_STKStickerEffect)effect
{
  return (_STKStickerEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____STKStickerRepresentation_effect));
}

+ (_STKStickerRepresentationRole)roles
{
  if (qword_26A6ED4F0 != -1) {
    swift_once();
  }
  double v2 = (void *)qword_26A6ED860;
  return (_STKStickerRepresentationRole *)v2;
}

- (NSString)description
{
  return (NSString *)sub_25E3D3A80(self, (uint64_t)a2, (void (*)(void))sub_25E3D32B4);
}

- (_STKStickerRepresentation)init
{
  CGSize result = (_STKStickerRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR____STKStickerRepresentation_identifier;
  uint64_t v4 = sub_25E4254F0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____STKStickerRepresentation_stickerIdentifier, v4);
  sub_25E3CEA28(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerRepresentation_data), *(void *)&self->_anon_0[OBJC_IVAR____STKStickerRepresentation_data]);
  v6 = (char *)self + OBJC_IVAR____STKStickerRepresentation_uti;
  uint64_t v7 = sub_25E4255B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____STKStickerRepresentation_effect);
}

@end