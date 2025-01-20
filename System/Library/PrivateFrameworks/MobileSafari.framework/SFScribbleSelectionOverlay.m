@interface SFScribbleSelectionOverlay
- (BOOL)showsHideButton;
- (SFScribbleSelectionOverlay)initWithCoder:(id)a3;
- (SFScribbleSelectionOverlay)initWithFrame:(CGRect)a3;
- (_TtC12MobileSafari15BlurrableButton)hideButton;
- (id)hideButtonHandler;
- (void)fadeIn;
- (void)fadeOutWithCompletion:(id)a3;
- (void)hideButtonReceivedTap;
- (void)layoutSubviews;
- (void)setHideButtonHandler:(id)a3;
- (void)setShowsHideButton:(BOOL)a3;
@end

@implementation SFScribbleSelectionOverlay

- (id)hideButtonHandler
{
  uint64_t v2 = *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR___SFScribbleSelectionOverlay_hideButtonHandler);
  v5[4] = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_hideButtonHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C3E9778;
  v5[3] = &block_descriptor_34;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (void)setHideButtonHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_hideButtonHandler);
  void *v6 = sub_18C58C138;
  v6[1] = v5;

  swift_release();
}

- (BOOL)showsHideButton
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_showsHideButton);
}

- (void)setShowsHideButton:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_showsHideButton);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_showsHideButton) = a3;
  if (v3 != a3)
  {
    uint64_t v4 = qword_1E91759B0;
    uint64_t v5 = self;
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v6 = qword_1E9190420;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v8 = v5;
    sub_18C3B3898(v6, 0, (uint64_t)sub_18C6CAEE8, v7, (void (*)())CGRectMake, 0);

    swift_release();
  }
}

- (_TtC12MobileSafari15BlurrableButton)hideButton
{
  return (_TtC12MobileSafari15BlurrableButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR___SFScribbleSelectionOverlay_hideButton));
}

- (SFScribbleSelectionOverlay)initWithFrame:(CGRect)a3
{
  return (SFScribbleSelectionOverlay *)sub_18C6C9550(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFScribbleSelectionOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo26SFScribbleSelectionOverlayC12MobileSafariE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  SFScribbleSelectionOverlay.layoutSubviews()();
}

- (void)fadeIn
{
  uint64_t v2 = qword_1E91759B0;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1E9190420;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  uint64_t v6 = v3;
  sub_18C3B3898(v4, 0, (uint64_t)sub_18C6CADF8, v5, (void (*)())CGRectMake, 0);

  swift_release();
}

- (void)fadeOutWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_18C448038;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = qword_1E91759B0;
  uint64_t v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1E9190420;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = (void *)swift_allocObject();
  v10[2] = v4;
  v10[3] = v5;
  v11 = v7;
  sub_18C5622A0((uint64_t)v4);
  sub_18C3B3898(v8, 0, (uint64_t)sub_18C6CAD4C, v9, (void (*)())sub_18C6CADC8, v10);
  swift_release();
  swift_release();
  sub_18C3F33C8((uint64_t)v4);
}

- (void)hideButtonReceivedTap
{
  id v3 = self;
  uint64_t v2 = (void (**)(void))[(SFScribbleSelectionOverlay *)v3 hideButtonHandler];
  v2[2]();
  _Block_release(v2);
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFScribbleSelectionOverlay_hideButton);
}

@end