@interface LineProgressGradientView
- (_TtC11MusicCoreUI24LineProgressGradientView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI24LineProgressGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LineProgressGradientView

- (_TtC11MusicCoreUI24LineProgressGradientView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_gradientView;
  type metadata accessor for LineProgressGradientView.GradientView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_fillView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIView) init];

  result = (_TtC11MusicCoreUI24LineProgressGradientView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LineProgressGradientView();
  id v2 = v3.receiver;
  [(LineProgressGradientView *)&v3 layoutSubviews];
  sub_87D590();
}

- (_TtC11MusicCoreUI24LineProgressGradientView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MusicCoreUI24LineProgressGradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_color));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_gradientView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_fillView);
}

@end