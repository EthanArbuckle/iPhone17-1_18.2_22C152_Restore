@interface HoverScrollCoordinator
- (_TtC23ShelfKitCollectionViews22HoverScrollCoordinator)init;
@end

@implementation HoverScrollCoordinator

- (_TtC23ShelfKitCollectionViews22HoverScrollCoordinator)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews22HoverScrollCoordinator_timeNotScrollingRequiredToDoWork) = (Class)0x3FC999999999999ALL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews22HoverScrollCoordinator_futureWork) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HoverScrollCoordinator();
  return [(HoverScrollCoordinator *)&v3 init];
}

- (void).cxx_destruct
{
}

@end