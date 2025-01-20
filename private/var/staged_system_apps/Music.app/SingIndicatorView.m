@interface SingIndicatorView
- (_TtC5Music17SingIndicatorView)init;
- (_TtC5Music17SingIndicatorView)initWithCoder:(id)a3;
- (_TtC5Music17SingIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)showSingIndicator;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SingIndicatorView

- (void)showSingIndicator
{
  uint64_t v3 = sub_100063814(&qword_10109BA40);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_100066A3C((uint64_t)v5, (uint64_t)&unk_10109BA48, (uint64_t)v9);
  swift_release();
}

- (_TtC5Music17SingIndicatorView)init
{
  return (_TtC5Music17SingIndicatorView *)sub_1002FCD70();
}

- (_TtC5Music17SingIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002FD7F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002FD108();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1002FD57C(a3);
}

- (_TtC5Music17SingIndicatorView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Music17SingIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music17SingIndicatorView____lazy_storage___gradientView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music17SingIndicatorView_singIndicatorLabel);
}

@end