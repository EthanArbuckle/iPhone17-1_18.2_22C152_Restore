@interface JournalTransitionCoordinator
- (_TtC7Journal28JournalTransitionCoordinator)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForDismissal:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
@end

@implementation JournalTransitionCoordinator

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return 0;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10058CE68(v8);
  v13 = v12;

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10058CFAC(v4);

  return v6;
}

- (id)interactionControllerForDismissal:(id)a3
{
  type metadata accessor for InteractiveGalleryToTimelineTransition();
  v3 = (void *)swift_dynamicCastClass();
  if (v3) {
    swift_unknownObjectRetain();
  }

  return v3;
}

- (_TtC7Journal28JournalTransitionCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JournalTransitionCoordinator();
  return [(JournalTransitionCoordinator *)&v3 init];
}

@end