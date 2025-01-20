@interface TSNewsActivitySender
- (TSNewsActivitySender)init;
- (TSNewsActivitySender)initWithViewController:(id)a3 presentationTransitionFactory:(id)a4 dismissalTransitionFactory:(id)a5;
@end

@implementation TSNewsActivitySender

- (TSNewsActivitySender)initWithViewController:(id)a3 presentationTransitionFactory:(id)a4 dismissalTransitionFactory:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivitySender_viewController) = (Class)a3;
  v14 = (id (**)())((char *)self + OBJC_IVAR___TSNewsActivitySender_presentationTransitionFactory);
  *v14 = sub_1DEBA7BD4;
  v14[1] = (id (*)())v12;
  v15 = (id (**)(char))((char *)self + OBJC_IVAR___TSNewsActivitySender_dismissalTransitionFactory);
  *v15 = sub_1DEBA7C0C;
  v15[1] = (id (*)(char))v13;
  v18.receiver = self;
  v18.super_class = ObjectType;
  id v16 = a3;
  return [(TSNewsActivitySender *)&v18 init];
}

- (TSNewsActivitySender)init
{
  result = (TSNewsActivitySender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end