@interface RUICustomContentRow
- (_TtC8RemoteUI19RUICustomContentRow)init;
- (_TtC8RemoteUI19RUICustomContentRow)initWithAttributes:(id)a3 parent:(id)a4;
- (id)subElementWithID:(id)a3;
- (id)tableCell;
- (void)prepareToPreload;
@end

@implementation RUICustomContentRow

- (id)subElementWithID:(id)a3
{
  if (a3)
  {
    v3 = (char *)self;
    uint64_t v4 = sub_214602EA8();
    uint64_t v6 = v5;
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)&v3[OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow_childElementDirectory]
                                                    + 120);
    v8 = v3;
    v9 = (void *)v7(v4, v6);

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)tableCell
{
  v2 = self;
  v3 = (void *)sub_2145D38D4();

  return v3;
}

- (void)prepareToPreload
{
  v2 = self;
  sub_2145D3D28();
}

- (_TtC8RemoteUI19RUICustomContentRow)init
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow_cell) = 0;
  uint64_t v3 = OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow_childElementDirectory;
  type metadata accessor for ElementDirectory();
  uint64_t v4 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_2145D7C6C();
  *(Class *)((char *)&v4->super.super.super.super.isa
           + OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow____lazy_storage___contentLoader) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for RUICustomContentRow();
  return [(RUISwiftUITableViewRow *)&v6 init];
}

- (_TtC8RemoteUI19RUICustomContentRow)initWithAttributes:(id)a3 parent:(id)a4
{
  if (a3) {
    uint64_t v5 = sub_214602E08();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a4;
  return (_TtC8RemoteUI19RUICustomContentRow *)RUICustomContentRow.init(attributes:parent:)(v5, a4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end