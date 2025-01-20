@interface WindowSceneResolver.View
- (_TtCV5Music19WindowSceneResolver4View)initWithCoder:(id)a3;
- (_TtCV5Music19WindowSceneResolver4View)initWithFrame:(CGRect)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation WindowSceneResolver.View

- (_TtCV5Music19WindowSceneResolver4View)initWithCoder:(id)a3
{
  result = (_TtCV5Music19WindowSceneResolver4View *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WindowSceneResolver.View();
  id v4 = a3;
  id v5 = v7.receiver;
  [(WindowSceneResolver.View *)&v7 willMoveToWindow:v4];
  id v6 = [v4 windowScene];
  sub_100063814(&qword_1010B4A20);
  Binding.wrappedValue.setter();
}

- (_TtCV5Music19WindowSceneResolver4View)initWithFrame:(CGRect)a3
{
  result = (_TtCV5Music19WindowSceneResolver4View *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2 = *(id *)&self->_boundWindowScene[OBJC_IVAR____TtCV5Music19WindowSceneResolver4View__boundWindowScene + 8];
  swift_release();
  swift_release();
}

@end