@interface SFStepper
- (BOOL)isFocusedInPageMenu;
- (BOOL)needsInitialBlink;
- (NSString)hintText;
- (SFBrowsingAssistantMainButton)leadingButton;
- (SFBrowsingAssistantMainButton)trailingButton;
- (SFStepper)initWithCoder:(id)a3;
- (SFStepper)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (id)decrementButtonActionHandler;
- (id)incrementButtonActionHandler;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)blink;
- (void)prepareForFocus;
- (void)pulse;
- (void)setDecrementButtonActionHandler:(id)a3;
- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4;
- (void)setHintText:(id)a3;
- (void)setIncrementButtonActionHandler:(id)a3;
- (void)setIsFocusedInPageMenu:(BOOL)a3;
- (void)setNeedsInitialBlink:(BOOL)a3;
@end

@implementation SFStepper

- (SFStepper)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo9SFStepperC12MobileSafariE5coderABSgSo7NSCoderC_tcfc_0();
}

- (SFStepper)initWithFrame:(CGRect)a3
{
  return (SFStepper *)SFStepper.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)SFStepper;
  [(SFStepper *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStepper;
  v4 = self;
  [(SFStepper *)&v5 _setContinuousCornerRadius:a3];
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR___SFStepper_containerView), sel__setContinuousCornerRadius_, a3, v5.receiver, v5.super_class);
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR___SFStepper_shadowView), sel__setContinuousCornerRadius_, a3);
}

- (SFBrowsingAssistantMainButton)leadingButton
{
  return (SFBrowsingAssistantMainButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR___SFStepper_leadingButton));
}

- (SFBrowsingAssistantMainButton)trailingButton
{
  return (SFBrowsingAssistantMainButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR___SFStepper_trailingButton));
}

- (id)decrementButtonActionHandler
{
  return sub_18C58AC10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFStepper_decrementButtonActionHandler, (uint64_t)&block_descriptor_33);
}

- (void)setDecrementButtonActionHandler:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_18C58C138;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SFStepper_decrementButtonActionHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18C3F33C8(v7);
}

- (id)incrementButtonActionHandler
{
  return sub_18C58AC10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFStepper_incrementButtonActionHandler, (uint64_t)&block_descriptor_26);
}

- (void)setIncrementButtonActionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_18C448038;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SFStepper_incrementButtonActionHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18C3F33C8(v7);
}

- (BOOL)isFocusedInPageMenu
{
  v2 = (BOOL *)self + OBJC_IVAR___SFStepper_isFocusedInPageMenu;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFocusedInPageMenu:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SFStepper_isFocusedInPageMenu;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)hintText
{
  v2 = (char *)self + OBJC_IVAR___SFStepper_hintText;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    sub_18C6F7DE8();
    objc_super v3 = (void *)sub_18C6F9808();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setHintText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18C6F9848();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  SFStepper.hintText.setter(v4, v6);
}

- (BOOL)needsInitialBlink
{
  v2 = (BOOL *)self + OBJC_IVAR___SFStepper_needsInitialBlink;
  swift_beginAccess();
  return *v2;
}

- (void)setNeedsInitialBlink:(BOOL)a3
{
  int v3 = a3;
  uint64_t v5 = (char *)self + OBJC_IVAR___SFStepper_needsInitialBlink;
  swift_beginAccess();
  int v6 = *v5;
  *uint64_t v5 = v3;
  if (v6 != v3)
  {
    uint64_t v7 = self;
    if ([(SFStepper *)v7 needsInitialBlink]) {
      [(SFStepper *)v7 blink];
    }
  }
}

- (void)blink
{
  v2 = self;
  SFStepper.blink()();
}

- (void)pulse
{
  v2 = self;
  sub_18C3710FC();
}

- (void)prepareForFocus
{
  v2 = self;
  SFStepper.prepareForFocus()();
}

- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4
{
  BOOL v4 = a3;
  if (a4 == 1)
  {
    uint64_t v5 = &selRef_leadingButton;
  }
  else
  {
    if (a4) {
      return;
    }
    uint64_t v5 = &selRef_trailingButton;
  }
  int v6 = self;
  id v7 = [v6 *v5];
  objc_msgSend(v7, sel_setEnabled_, v4);
}

- (void).cxx_destruct
{
  sub_18C3F33C8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepper_decrementButtonActionHandler));
  sub_18C3F33C8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFStepper_incrementButtonActionHandler));

  swift_bridgeObjectRelease();
}

@end