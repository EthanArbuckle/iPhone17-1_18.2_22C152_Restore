@interface _STKStickerUIStickerRepresentation
- (CGSize)size;
- (NSData)data;
- (NSString)description;
- (NSString)role;
- (NSString)type;
- (_STKStickerUIStickerRepresentation)init;
- (_STKStickerUIStickerRepresentation)initWithData:(id)a3 type:(id)a4 size:(CGSize)a5 role:(id)a6;
@end

@implementation _STKStickerUIStickerRepresentation

- (NSData)data
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerUIStickerRepresentation_data);
  unint64_t v3 = *(void *)&self->data[OBJC_IVAR____STKStickerUIStickerRepresentation_data];
  sub_25E3CEAB0(v2, v3);
  v4 = (void *)sub_25E4253B0();
  sub_25E3CEA28(v2, v3);
  return (NSData *)v4;
}

- (NSString)type
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_25E4258C0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGSize)size
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____STKStickerUIStickerRepresentation_size);
  double v3 = *(double *)&self->data[OBJC_IVAR____STKStickerUIStickerRepresentation_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)role
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKStickerUIStickerRepresentation_role);
}

- (_STKStickerUIStickerRepresentation)initWithData:(id)a3 type:(id)a4 size:(CGSize)a5 role:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = sub_25E4253D0();
  uint64_t v16 = v15;

  uint64_t v17 = sub_25E4258F0();
  uint64_t v19 = v18;

  if (v13)
  {
    uint64_t v20 = sub_25E4258F0();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  v23 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_data);
  uint64_t *v23 = v14;
  v23[1] = v16;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_type);
  uint64_t *v24 = v17;
  v24[1] = v19;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_role);
  uint64_t *v25 = v20;
  v25[1] = v22;
  v26 = (CGFloat *)((char *)self + OBJC_IVAR____STKStickerUIStickerRepresentation_size);
  CGFloat *v26 = width;
  v26[1] = height;
  v28.receiver = self;
  v28.super_class = (Class)type metadata accessor for _STKStickerUIStickerRepresentation();
  return [(_STKStickerUIStickerRepresentation *)&v28 init];
}

- (NSString)description
{
  return (NSString *)sub_25E3F07F4(self, (uint64_t)a2, (void (*)(void))sub_25E3F02E8);
}

- (_STKStickerUIStickerRepresentation)init
{
  CGSize result = (_STKStickerUIStickerRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25E3CEA28(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKStickerUIStickerRepresentation_data), *(void *)&self->data[OBJC_IVAR____STKStickerUIStickerRepresentation_data]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end