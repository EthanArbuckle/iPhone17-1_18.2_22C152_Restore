@interface UITextFormattingKeyboardSession
- (UITextFormattingKeyboardSession)init;
- (id)_textFormattingResponder;
- (id)_textFormattingViewController;
- (void)setFormattingDescriptor:(id)a3;
@end

@implementation UITextFormattingKeyboardSession

- (void)setFormattingDescriptor:(id)a3
{
  if (a3)
  {
    static UITextFormattingViewController.FormattingDescriptor._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
    signpost_c2_removePresentationModifier_end(v6, v4);
  }
  else
  {
    sub_185A1A88C(v6);
  }
  sub_1853B8150((uint64_t)v6, (uint64_t)v7, (uint64_t *)&unk_1E8FB5288);
  sub_1853B8150((uint64_t)v7, (uint64_t)v6, (uint64_t *)&unk_1E8FB5288);
  v5 = self;
  sub_185A12ACC((uint64_t)v6);

  sub_185A1A8A8((uint64_t)v7);
}

- (id)_textFormattingResponder
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR___UISubstituteKeyboardSession_responder, a2);
  if (v2)
  {
    v3 = v2;
    v2 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (!v2)
    {

      v2 = 0;
    }
  }
  return v2;
}

- (id)_textFormattingViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR___UITextFormattingKeyboardSession_textFormattingViewController));
}

- (UITextFormattingKeyboardSession)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___UITextFormattingKeyboardSession_textFormattingViewController) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(UISubstituteKeyboardSession *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___UITextFormattingKeyboardSession_textFormattingViewController));
}

@end