@interface ARUIRingsViewWrapper
- (_TtC10FitnessApp20ARUIRingsViewWrapper)initWithCoder:(id)a3;
- (_TtC10FitnessApp20ARUIRingsViewWrapper)initWithFrame:(CGRect)a3;
@end

@implementation ARUIRingsViewWrapper

- (_TtC10FitnessApp20ARUIRingsViewWrapper)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp20ARUIRingsViewWrapper_completionPercentage) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp20ARUIRingsViewWrapper_storedRingsView) = 0;
  id v4 = a3;

  result = (_TtC10FitnessApp20ARUIRingsViewWrapper *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp20ARUIRingsViewWrapper)initWithFrame:(CGRect)a3
{
  result = (_TtC10FitnessApp20ARUIRingsViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20ARUIRingsViewWrapper_storedRingsView));
}

@end