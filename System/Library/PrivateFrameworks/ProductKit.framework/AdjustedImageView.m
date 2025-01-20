@interface AdjustedImageView
- (_TtC10ProductKit17AdjustedImageView)initWithCoder:(id)a3;
- (_TtC10ProductKit17AdjustedImageView)initWithFrame:(CGRect)a3;
- (_TtC10ProductKit17AdjustedImageView)initWithImage:(id)a3;
- (_TtC10ProductKit17AdjustedImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AdjustedImageView

- (_TtC10ProductKit17AdjustedImageView)initWithFrame:(CGRect)a3
{
  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_startedHandler);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_completedHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_featureHandler);
  void *v5 = 0;
  v5[1] = 0;

  result = (_TtC10ProductKit17AdjustedImageView *)sub_21EFCEA18();
  __break(1u);
  return result;
}

- (_TtC10ProductKit17AdjustedImageView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_startedHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_completedHandler);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_featureHandler);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = a3;

  result = (_TtC10ProductKit17AdjustedImageView *)sub_21EFCEA18();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_21EFC001C(a3);
}

- (_TtC10ProductKit17AdjustedImageView)initWithImage:(id)a3
{
  id v3 = a3;
  result = (_TtC10ProductKit17AdjustedImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10ProductKit17AdjustedImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC10ProductKit17AdjustedImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_startedHandler));
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_completedHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10ProductKit17AdjustedImageView_featureHandler);
  sub_21EF608FC(v3);
}

@end