@interface RootNavigationControllerDelegate
- (_TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate)init;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
@end

@implementation RootNavigationControllerDelegate

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler;
  swift_beginAccess();
  v10 = *(void (**)(id, BOOL))v9;
  if (*(void *)v9)
  {
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    sub_3C800((uint64_t)v10);
    v10(v11, v5);
    sub_27760((uint64_t)v10);
  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = self;
  id v13 = sub_329E18(v9, (uint64_t)v10);

  return v13;
}

- (_TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler);
  v4 = (objc_class *)type metadata accessor for RootNavigationControllerDelegate();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(RootNavigationControllerDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  sub_27760(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler));
}

@end