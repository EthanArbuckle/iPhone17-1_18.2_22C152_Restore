@interface DOCCopyableBarButtonItem
- (_TtC5Files24DOCCopyableBarButtonItem)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation DOCCopyableBarButtonItem

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1002BAE2C(v6);

  sub_1000A6B78(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_10009B1B8((uint64_t)v6);
  return v4;
}

- (_TtC5Files24DOCCopyableBarButtonItem)init
{
  v3 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files24DOCCopyableBarButtonItem_creator);
  v4 = (objc_class *)type metadata accessor for DOCCopyableBarButtonItem();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(DOCBarButtonItem *)&v6 init];
}

- (void).cxx_destruct
{
  sub_1000A7258(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Files24DOCCopyableBarButtonItem_creator));
}

@end