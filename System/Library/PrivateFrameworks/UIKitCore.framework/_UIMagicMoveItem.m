@interface _UIMagicMoveItem
- (NSArray)portals;
- (_UIMagicMorphView)morphView;
- (_UIMagicMoveItem)init;
- (void)setPortals:(id)a3;
@end

@implementation _UIMagicMoveItem

- (_UIMagicMorphView)morphView
{
  return (_UIMagicMorphView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____UIMagicMoveItem_morphView));
}

- (NSArray)portals
{
  swift_beginAccess();
  sub_1853B985C(0, &qword_1E8FB5EE8);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setPortals:(id)a3
{
  sub_1853B985C(0, &qword_1E8FB5EE8);
  uint64_t v4 = sub_186A1EB3C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____UIMagicMoveItem_portals);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_UIMagicMoveItem)init
{
  return (_UIMagicMoveItem *)sub_185A5DE94();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end