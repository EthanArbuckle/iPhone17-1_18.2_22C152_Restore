@interface IntelligenceUI.PromptEntryView
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (_TtCO5UIKit14IntelligenceUI15PromptEntryView)initWithCoder:(id)a3;
- (_TtCO5UIKit14IntelligenceUI15PromptEntryView)initWithFrame:(CGRect)a3;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (void)_textView:(id)a3 insertTextSuggestion:(id)a4;
- (void)buildMenuWithBuilder:(id)a3;
- (void)canGenerateTargetedPreviewForChunk:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)canGenerateTargetedPreviewsWithCompletionHandler:(id)a3;
- (void)dictationAvailabilityDidChange;
- (void)layoutSubviews;
- (void)promptBackgroundViewDidUpdateConfiguration:(id)a3;
- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5;
- (void)updatedTargetedPreviewGeometryFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 previous:(CGRect)a4 completionHandler:(id)a5;
@end

@implementation IntelligenceUI.PromptEntryView

- (void)dictationAvailabilityDidChange
{
  v2 = self;
  sub_185AAB40C();
}

- (_TtCO5UIKit14IntelligenceUI15PromptEntryView)initWithFrame:(CGRect)a3
{
  IntelligenceUI.PromptEntryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCO5UIKit14IntelligenceUI15PromptEntryView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s5UIKit14IntelligenceUIO15PromptEntryViewC5coderAESgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_placeholderConfiguration);
  objc_release(*(id *)((char *)&self->super.super._responderFlags
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_placeholderConfiguration));

  sub_18596AE14((uint64_t)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_accessoryView));
  if (*(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_visibleLineLimit))
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_visibleLineLimit);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_leadingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView____lazy_storage___backgroundView));
  v4 = (char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_styleAttributesForAmbiguity;
  uint64_t v5 = sub_186A1D43C();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6((char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_styleAttributesForResolvedAmbiguity, v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView__privatePressGestureRecognizerDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_placeholderLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_accessorySeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_containerScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_buttonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_placeholderEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView____lazy_storage___ponderingEffectView));
  sub_1853B8150((uint64_t)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_nonPonderingBackgroundStyle, (uint64_t)v7, &qword_1E8FB6EB0);
  sub_185ABD0A0((uint64_t)v7);
  sub_1853B93B8((uint64_t)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_activePonderEffect, &qword_1E8FB2340);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView____lazy_storage___accessoryContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView____lazy_storage___accessoryContainerMaskView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_modifierKeyRecognizer));
}

- (void)buildMenuWithBuilder:(id)a3
{
}

- (void)promptBackgroundViewDidUpdateConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_185AB00D0((uint64_t)v4);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(UIView *)v2 bounds];
  -[IntelligenceUI.PromptEntryView sizeThatFits:](v2, sel_sizeThatFits_, v3, v4);
  double v6 = v5;

  double v7 = -1.0;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  uint64_t v6 = sub_185AAF988();
  sub_185AAD4BC(v6, v8, v7 & 1, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[IntelligenceUI.PromptEntryView sizeThatFits:](self, sel_sizeThatFits_, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  IntelligenceUI.PromptEntryView.layoutSubviews()();
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  double v4 = (UITextView *)a3;
  double v5 = self;
  LOBYTE(self) = IntelligenceUI.PromptEntryView.textViewShouldBeginEditing(_:)(v4);

  return self & 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  double v5 = (char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_delegate;
  swift_beginAccess();
  if (MEMORY[0x18C109380](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    char v7 = *(void (**)(void))(v6 + 32);
    id v8 = a3;
    double v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  double v5 = self;
  _s5UIKit14IntelligenceUIO15PromptEntryViewC04textF13DidEndEditingyySo06UITextF0CF_0();
}

- (void)textViewDidChange:(id)a3
{
  id v4 = (UITextView *)a3;
  double v5 = self;
  IntelligenceUI.PromptEntryView.textViewDidChange(_:)(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  Swift::Int length = a4.length;
  Swift::Int location = a4.location;
  uint64_t v9 = sub_186A1E95C();
  double v11 = v10;
  double v12 = (UITextView *)a3;
  double v13 = self;
  v14.Swift::Int location = location;
  v14.Swift::Int length = length;
  v15._countAndFlagsBits = v9;
  v15._object = v11;
  LOBYTE(length) = IntelligenceUI.PromptEntryView.textView(_:shouldChangeTextIn:replacementText:)(v12, v14, v15);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  double v5 = self;
  _s5UIKit14IntelligenceUIO15PromptEntryViewC04textF18DidChangeSelectionyySo06UITextF0CF_0();
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = self;
  id v12 = _s5UIKit14IntelligenceUIO15PromptEntryViewC04textF0_20menuConfigurationFor11defaultMenuSo010UITextItemlI0CSgSo0mF0C_So0mN0CSo6UIMenuCtF_0(v8, v9);

  return v12;
}

- (void)_textView:(id)a3 insertTextSuggestion:(id)a4
{
  char v7 = (char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI15PromptEntryView_delegate;
  swift_beginAccess();
  if (MEMORY[0x18C109380](v7))
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    id v9 = *(void (**)(void))(v8 + 80);
    id v10 = a3;
    id v11 = a4;
    id v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

- (void)canGenerateTargetedPreviewsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v5 - 8);
  char v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E8FB7138;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E8FB7140;
  v12[5] = v11;
  double v13 = self;
  sub_185AB6FE4((uint64_t)v7, (uint64_t)&unk_1E8FB7148, (uint64_t)v12);
  swift_release();
}

- (void)canGenerateTargetedPreviewForChunk:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  double v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB7118;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB7120;
  v14[5] = v13;
  Swift::String v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB7128, (uint64_t)v14);
  swift_release();
}

- (void)updatedTargetedPreviewGeometryFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 previous:(CGRect)a4 completionHandler:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v15 = _Block_copy(a5);
  v16 = (CGFloat *)swift_allocObject();
  *((void *)v16 + 2) = a3;
  v16[3] = x;
  v16[4] = y;
  v16[5] = width;
  v16[6] = height;
  *((void *)v16 + 7) = v15;
  *((void *)v16 + 8) = self;
  uint64_t v17 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E8FB70F8;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E8FB7100;
  v19[5] = v18;
  v20 = a3;
  v21 = self;
  sub_185AB6FE4((uint64_t)v14, (uint64_t)&unk_1E8FB7108, (uint64_t)v19);
  swift_release();
}

- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB70D8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB70E0;
  v14[5] = v13;
  Swift::String v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB70E8, (uint64_t)v14);
  swift_release();
}

- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v9 - 8);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  Swift::String v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E8FB7098;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E8FB2B40;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_185AB6FE4((uint64_t)v11, (uint64_t)&unk_1E8FB2B48, (uint64_t)v16);
  swift_release();
}

@end