@interface _UITextViewAnimatedPlaceholderSupport
- (UITextView)textView;
- (_UITextViewAnimatedPlaceholderSupport)init;
- (_UITextViewAnimatedPlaceholderSupport)initWithTextView:(id)a3;
- (id)insertLoadingPlaceholderAtLocation:(id)a3 lines:(double)a4 completion:(id)a5;
- (void)canGenerateTargetedPreviewForChunk:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)canGenerateTargetedPreviewsWithCompletionHandler:(id)a3;
- (void)insertAttributedText:(id)a3 withAnimationStyle:(int64_t)a4 completion:(id)a5;
- (void)layoutManagedSubviews;
- (void)removePlaceholder:(id)a3;
- (void)replacePlaceholder:(id)a3 withText:(id)a4 completion:(id)a5;
- (void)setTextView:(id)a3;
- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4;
- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation _UITextViewAnimatedPlaceholderSupport

- (UITextView)textView
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UITextViewAnimatedPlaceholderSupport_textView, a2);
  return (UITextView *)v2;
}

- (void)setTextView:(id)a3
{
}

- (_UITextViewAnimatedPlaceholderSupport)initWithTextView:(id)a3
{
  return (_UITextViewAnimatedPlaceholderSupport *)sub_185928E34(a3);
}

- (void)insertAttributedText:(id)a3 withAnimationStyle:(int64_t)a4 completion:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v7 = sub_18557A3E4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  sub_18592D57C(v9, (uint64_t)v7, v8);
  sub_1854AFD40((uint64_t)v7);
}

- (id)insertLoadingPlaceholderAtLocation:(id)a3 lines:(double)a4 completion:(id)a5
{
  uint64_t v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_18557A3E4;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1859292B4((uint64_t)v10, (uint64_t)v8, v9, a4);
  sub_1854AFD40((uint64_t)v8);

  return v12;
}

- (void)replacePlaceholder:(id)a3 withText:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_18557A3E8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_185929B00(v10, v11, (uint64_t)v8, v9);
  sub_1854AFD40((uint64_t)v8);
}

- (void)removePlaceholder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185929EEC(v4);
}

- (void)layoutManagedSubviews
{
  id v10 = self;
  v2 = [(_UITextViewAnimatedPlaceholderSupport *)v10 textView];
  if (v2)
  {
    v3 = v2;
    [(UIView *)v2 bounds];
    double v5 = v4;
    double v7 = v6;
    uint64_t v8 = (_UITextViewAnimatedPlaceholderSupport *)sub_185928C3C();
    -[_UITextViewAnimatedPlaceholderSupport setFrame:](v8, sel_setFrame_, 0.0, 0.0, v5, v7);

    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = v10;
  }
}

- (_UITextViewAnimatedPlaceholderSupport)init
{
  result = (_UITextViewAnimatedPlaceholderSupport *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____UITextViewAnimatedPlaceholderSupport____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____UITextViewAnimatedPlaceholderSupport____lazy_storage___textEffectsView));
  swift_bridgeObjectRelease();
  sub_1853B93B8((uint64_t)self + OBJC_IVAR____UITextViewAnimatedPlaceholderSupport_activeReplacementEffect, &qword_1EB256B10);
  swift_bridgeObjectRelease();
}

- (void)canGenerateTargetedPreviewsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB2B28);
  MEMORY[0x1F4188790](v5 - 8);
  double v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_186A1ECBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E8FB2BC0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E8FB2BC8;
  v12[5] = v11;
  v13 = self;
  sub_185AB6FE4((uint64_t)v7, (uint64_t)&unk_1E8FB2BD0, (uint64_t)v12);
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
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB2B98;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB2BA0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB2BA8, (uint64_t)v14);
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
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E8FB2B68;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E8FB2B70;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185AB6FE4((uint64_t)v9, (uint64_t)&unk_1E8FB2B78, (uint64_t)v14);
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
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E8FB2B38;
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