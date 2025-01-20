@interface _UIInterfaceActionExtendedStorage
- (_TtC8ShelfKit33_UIInterfaceActionExtendedStorage)init;
@end

@implementation _UIInterfaceActionExtendedStorage

- (_TtC8ShelfKit33_UIInterfaceActionExtendedStorage)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC8ShelfKit33_UIInterfaceActionExtendedStorage__didDismissHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit33_UIInterfaceActionExtendedStorage__customHandler);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit33_UIInterfaceActionExtendedStorage__configuration) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(_UIInterfaceActionExtendedStorage *)&v7 init];
}

- (void).cxx_destruct
{
  sub_3D4C4(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC8ShelfKit33_UIInterfaceActionExtendedStorage__didDismissHandler));
  sub_3D4C4(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC8ShelfKit33_UIInterfaceActionExtendedStorage__customHandler));

  swift_release();
}

@end