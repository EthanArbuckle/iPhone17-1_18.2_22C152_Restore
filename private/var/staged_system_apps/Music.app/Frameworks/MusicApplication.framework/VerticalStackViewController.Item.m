@interface VerticalStackViewController.Item
- (NSString)debugDescription;
- (_TtCC16MusicApplication27VerticalStackViewController4Item)init;
@end

@implementation VerticalStackViewController.Item

- (NSString)debugDescription
{
  v2 = self;
  sub_531DA0();

  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtCC16MusicApplication27VerticalStackViewController4Item)init
{
  result = (_TtCC16MusicApplication27VerticalStackViewController4Item *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController4Item_scrollViewOffsetObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController4Item_scrollViewSizeObserver));
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end