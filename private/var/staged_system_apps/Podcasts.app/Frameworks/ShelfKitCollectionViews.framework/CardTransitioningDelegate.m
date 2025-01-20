@interface CardTransitioningDelegate
- (_TtC23ShelfKitCollectionViews25CardTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation CardTransitioningDelegate

- (_TtC23ShelfKitCollectionViews25CardTransitioningDelegate)init
{
  v2 = (objc_class *)type metadata accessor for CardTransitioningDelegate();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = &v3[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration];
  *(void *)v4 = 1;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  *((_WORD *)v4 + 16) = 1;
  *((void *)v4 + 5) = 0;
  *((void *)v4 + 6) = 0;
  *(_OWORD *)(v4 + 56) = xmmword_395E70;
  v4[72] = 0;
  *((void *)v4 + 10) = 15;
  v7.receiver = v3;
  v7.super_class = v2;
  v5 = [(CardTransitioningDelegate *)&v7 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  long long v8 = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                     + 40];
  v15[2] = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                         + 24];
  v15[3] = v8;
  v15[4] = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                         + 56];
  uint64_t v16 = *(void *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                      + 72];
  long long v9 = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                     + 8];
  v15[0] = *(_OWORD *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration);
  v15[1] = v9;
  objc_allocWithZone((Class)type metadata accessor for CardPresentationController());
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = sub_3049F0((uint64_t)v10, (uint64_t)a4, v12, (uint64_t)v15);

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for CardDismissalAnimator());
  id v6 = a3;
  objc_super v7 = self;
  id v8 = [v5 init];

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9 = objc_allocWithZone((Class)type metadata accessor for CardPresentationAnimator());
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = self;
  id v14 = [v9 init];

  return v14;
}

@end