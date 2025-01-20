@interface UISubstituteKeyboardSession
+ (UISubstituteKeyboardSession)activeSession;
+ (id)sharedSession;
- (BOOL)isPresented;
- (BOOL)isPresenting;
- (UISubstituteKeyboardSession)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)cancel;
- (void)dimmingViewWasTapped:(id)a3;
- (void)firstResponderDidChange:(id)a3;
- (void)hide;
- (void)hideForResponder:(id)a3;
- (void)keyboardAboutToHide:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)showForResponder:(id)a3 sender:(id)a4;
- (void)updateUserInterfaceStyle;
@end

@implementation UISubstituteKeyboardSession

+ (UISubstituteKeyboardSession)activeSession
{
  return (UISubstituteKeyboardSession *)(id)qword_1E8FB62B8;
}

- (UISubstituteKeyboardSession)init
{
  return (UISubstituteKeyboardSession *)sub_185A7A6C4();
}

+ (id)sharedSession
{
  swift_getObjCClassMetadata();
  id v2 = sub_185A7A76C();
  return v2;
}

- (BOOL)isPresented
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_presentationController);
  if (v2) {
    LOBYTE(v2) = objc_msgSend(v2, sel_state) == (id)2;
  }
  return (char)v2;
}

- (BOOL)isPresenting
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_presentationController);
  if (v2) {
    LOBYTE(v2) = objc_msgSend(v2, sel_state) == (id)1;
  }
  return (char)v2;
}

- (void)showForResponder:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  sub_185A79500();

  sub_1853BFC80((uint64_t)v10);
}

- (void)hide
{
  id v2 = self;
  sub_185A798C4();
}

- (void)hideForResponder:(id)a3
{
  uint64_t v5 = MEMORY[0x18C109380]((char *)self + OBJC_IVAR___UISubstituteKeyboardSession_responder, a2);
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = a3;
    v9 = self;
    unsigned __int8 v8 = objc_msgSend(v6, sel_isEqual_, v7);

    if (v8) {
      sub_185A798C4();
    }
  }
}

- (void)cancel
{
  id v2 = self;
  sub_185A798C4();
}

- (void)updateUserInterfaceStyle
{
  id v2 = self;
  sub_185A79D24();
}

- (void)firstResponderDidChange:(id)a3
{
}

- (void)keyboardAboutToHide:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  uint64_t v8 = qword_1E8FB0B70;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  if (v8 != -1) {
    swift_once();
  }
  if (byte_1E8FB62B0 == 1)
  {
    v13 = *(Class *)((char *)&v12->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_animationController);
    swift_unknownObjectRetain();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  uint64_t v4 = qword_1E8FB0B70;
  id v5 = a3;
  id v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  if (byte_1E8FB62B0 == 1)
  {
    id v7 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___UISubstituteKeyboardSession_animationController);
    swift_unknownObjectRetain();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = (id)sub_185A7E694((uint64_t)v8, (uint64_t)a4);

  return v12;
}

- (void)dimmingViewWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185A798C4();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185A7AFE0(v4);
}

@end