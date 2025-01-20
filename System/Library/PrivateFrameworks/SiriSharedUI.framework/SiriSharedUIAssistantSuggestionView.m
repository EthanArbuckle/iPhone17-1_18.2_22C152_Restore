@interface SiriSharedUIAssistantSuggestionView
- (BOOL)isPresented;
- (CGSize)sizeThatFits:(CGSize)result;
- (SiriSharedUIAssistantSuggestionView)initWithCoder:(id)a3;
- (SiriSharedUIAssistantSuggestionView)initWithFrame:(CGRect)a3;
- (id)pressDownHandler;
- (id)pressUpHandler;
- (void)layoutSubviews;
- (void)performSuggestionInPlaceAnimationDismissing;
- (void)performSuggestionInPlaceAnimationPresenting;
- (void)setPressDownHandler:(id)a3;
- (void)setPressUpHandler:(id)a3;
@end

@implementation SiriSharedUIAssistantSuggestionView

- (id)pressDownHandler
{
  return sub_20CA54BF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressDownHandler, (uint64_t)&block_descriptor_49);
}

- (void)setPressDownHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressDownHandler);
  swift_beginAccess();
  void *v6 = sub_20CA57BE0;
  v6[1] = v5;
  swift_release();
}

- (id)pressUpHandler
{
  return sub_20CA54BF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressUpHandler, (uint64_t)&block_descriptor_8);
}

- (void)setPressUpHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))((char *)self
                                                          + OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressUpHandler);
  swift_beginAccess();
  void *v6 = sub_20CA57874;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v5;
  swift_release();
}

- (SiriSharedUIAssistantSuggestionView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s12SiriSharedUI0aB25UIAssistantSuggestionViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)performSuggestionInPlaceAnimationPresenting
{
}

- (void)performSuggestionInPlaceAnimationDismissing
{
}

- (BOOL)isPresented
{
  v2 = self;
  BOOL v3 = sub_20CA55DE4();

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIAssistantSuggestionView_hostingView);
  if (v3) {
    objc_msgSend(v3, sel__layoutSizeThatFits_fixedAxes_, 0, result.width, result.height);
  }
  else {
    __break(1u);
  }
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20CA56914();
}

- (SiriSharedUIAssistantSuggestionView)initWithFrame:(CGRect)a3
{
  result = (SiriSharedUIAssistantSuggestionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();
}

@end