@interface DetailCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)copyright;
- (NSString)trackCountAndDuration;
- (_TtC16MusicApplication10DetailCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication10DetailCell)initWithFrame:(CGRect)a3;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setCopyright:(id)a3;
- (void)setTrackCountAndDuration:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DetailCell

- (_TtC16MusicApplication10DetailCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10DetailCell *)sub_B7068(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10DetailCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_BBC84();
}

- (NSString)trackCountAndDuration
{
  return (NSString *)sub_42EA8();
}

- (void)setTrackCountAndDuration:(id)a3
{
}

- (NSString)copyright
{
  return (NSString *)sub_42EA8();
}

- (void)setCopyright:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  id v5 = [(DetailCell *)v4 contentView];
  [v5 sizeThatFits:width, 1.79769313e308];
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DE2790);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15.receiver = self;
  v15.super_class = ObjectType;
  id v10 = a3;
  v11 = self;
  [(DetailCell *)&v15 traitCollectionDidChange:v10];
  v13 = v11;
  type metadata accessor for DetailCellTextStack(0);
  sub_BBC3C((unint64_t *)&unk_DD0CD0, (void (*)(uint64_t))type metadata accessor for DetailCellTextStack);
  sub_AB3D70();
  sub_AB3FF0();
  v14[3] = v6;
  v14[4] = sub_3C6D8(&qword_DE27A0, (uint64_t *)&unk_DE2790);
  __swift_allocate_boxed_opaque_existential_1(v14);
  sub_AB3D60();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  sub_AB7500();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DE2790);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12.receiver = self;
  v12.super_class = ObjectType;
  uint64_t v8 = self;
  [(DetailCell *)&v12 music_inheritedLayoutInsetsDidChange];
  id v10 = v8;
  type metadata accessor for DetailCellTextStack(0);
  sub_BBC3C((unint64_t *)&unk_DD0CD0, (void (*)(uint64_t))type metadata accessor for DetailCellTextStack);
  sub_AB3D70();
  sub_AB3FF0();
  v11[3] = v4;
  v11[4] = sub_3C6D8(&qword_DE27A0, (uint64_t *)&unk_DE2790);
  __swift_allocate_boxed_opaque_existential_1(v11);
  sub_AB3D60();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  sub_AB7500();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication10DetailCell_releaseDate, (uint64_t *)&unk_DD8B70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication10DetailCell_recordLabelSelectionHandler));

  swift_bridgeObjectRelease();
}

@end