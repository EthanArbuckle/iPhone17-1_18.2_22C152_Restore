@interface ICTextElementAnimator
- (ICTextElementAnimator)init;
- (ICTextElementAnimator)initWithTextView:(id)a3 originTrackedParagraphs:(id)a4 destinationTrackedParagraphs:(id)a5;
- (void)animateWithCompletion:(id)a3;
@end

@implementation ICTextElementAnimator

- (ICTextElementAnimator)initWithTextView:(id)a3 originTrackedParagraphs:(id)a4 destinationTrackedParagraphs:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_20BFCEE58(0, &qword_2676BF0F8);
  v8 = (objc_class *)sub_20C162CF0();
  v9 = (objc_class *)sub_20C162CF0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTextElementAnimator_textView) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTextElementAnimator_originTrackedParagraphs) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTextElementAnimator_destinationTrackedParagraphs) = v9;
  id v10 = a3;
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR___ICTextElementAnimator_uuidsToElementAnimationConfigurations) = (Class)sub_20BFD413C(MEMORY[0x263F8EE78]);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = [(ICTextElementAnimator *)&v14 init];
  sub_20C0DE204();

  return v12;
}

- (void)animateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_20C0E0838;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  TextElementAnimator.animate(completion:)((uint64_t)v7, v6);
  sub_20BFCDA14((uint64_t)v7);
}

- (ICTextElementAnimator)init
{
  result = (ICTextElementAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end