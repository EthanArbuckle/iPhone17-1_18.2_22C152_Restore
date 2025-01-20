@interface ExtendedTabBarItem
- (BKRootBarItem)rootBarItem;
- (_TtC5Books18ExtendedTabBarItem)init;
- (_TtC5Books18ExtendedTabBarItem)initWithCoder:(id)a3;
- (void)setRootBarItem:(id)a3;
@end

@implementation ExtendedTabBarItem

- (BKRootBarItem)rootBarItem
{
  return (BKRootBarItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem));
}

- (void)setRootBarItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Books18ExtendedTabBarItem)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExtendedTabBarItem();
  return [(ExtendedTabBarItem *)&v3 init];
}

- (_TtC5Books18ExtendedTabBarItem)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books18ExtendedTabBarItem_rootBarItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExtendedTabBarItem();
  return [(ExtendedTabBarItem *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end