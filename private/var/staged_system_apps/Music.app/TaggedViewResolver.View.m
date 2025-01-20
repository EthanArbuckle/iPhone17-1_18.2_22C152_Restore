@interface TaggedViewResolver.View
- (_TtCV5Music18TaggedViewResolver4View)initWithCoder:(id)a3;
- (_TtCV5Music18TaggedViewResolver4View)initWithFrame:(CGRect)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TaggedViewResolver.View

- (_TtCV5Music18TaggedViewResolver4View)initWithCoder:(id)a3
{
  result = (_TtCV5Music18TaggedViewResolver4View *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v4 = *(void (**)(void))((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtCV5Music18TaggedViewResolver4View_windowObserver);
  id v5 = a3;
  v6 = self;
  v4();
}

- (_TtCV5Music18TaggedViewResolver4View)initWithFrame:(CGRect)a3
{
  result = (_TtCV5Music18TaggedViewResolver4View *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtCV5Music18TaggedViewResolver4View_song;
  uint64_t v3 = type metadata accessor for Song();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end