@interface FMLabelTableViewLocationCell
- (_TtC6FindMy28FMLabelTableViewLocationCell)initWithCoder:(id)a3;
- (_TtC6FindMy28FMLabelTableViewLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation FMLabelTableViewLocationCell

- (_TtC6FindMy28FMLabelTableViewLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC6FindMy28FMLabelTableViewLocationCell *)sub_10042F944(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy28FMLabelTableViewLocationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004302CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMLabelTableViewLocationCell_locationView));

  swift_bridgeObjectRelease();
}

@end