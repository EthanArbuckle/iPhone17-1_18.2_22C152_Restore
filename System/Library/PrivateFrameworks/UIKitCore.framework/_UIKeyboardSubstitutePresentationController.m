@interface _UIKeyboardSubstitutePresentationController
- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1943_UIKeyboardSubstitutePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
@end

@implementation _UIKeyboardSubstitutePresentationController

- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1943_UIKeyboardSubstitutePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1943_UIKeyboardSubstitutePresentationController_keyboardSuppressionAssertion) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _UIKeyboardSubstitutePresentationController();
  return [(UIPresentationController *)&v8 initWithPresentedViewController:a3 presentingViewController:a4];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
}

@end