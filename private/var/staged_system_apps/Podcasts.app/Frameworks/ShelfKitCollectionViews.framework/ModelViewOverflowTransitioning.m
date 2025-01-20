@interface ModelViewOverflowTransitioning
- (_TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation ModelViewOverflowTransitioning

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  swift_unknownObjectWeakAssign();
  self;
  if (swift_dynamicCastObjCClass()) {
    swift_unknownObjectWeakAssign();
  }
  id v7 = [objc_allocWithZone((Class)type metadata accessor for ModelViewOverflowPresentationController()) initWithPresentedViewController:a3 presentingViewController:a4];

  return v7;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = sub_22A88C();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_229E50(v4);

  return v6;
}

- (_TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_animationView) = 0;
  id v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_selectedIndexPath;
  uint64_t v5 = sub_37B160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_transitionFromAccessoryView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(ModelViewOverflowTransitioning *)&v7 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_animationView));
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_selectedIndexPath;

  sub_22A82C((uint64_t)v3);
}

@end