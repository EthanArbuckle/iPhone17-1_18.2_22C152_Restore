@interface PersonalizedImageView
- (_TtC10ProductKit21PersonalizedImageView)initWithCoder:(id)a3;
- (_TtC10ProductKit21PersonalizedImageView)initWithFrame:(CGRect)a3;
@end

@implementation PersonalizedImageView

- (_TtC10ProductKit21PersonalizedImageView)initWithFrame:(CGRect)a3
{
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_startedHandler);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_completedHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_featureHandler);
  void *v5 = 0;
  v5[1] = 0;

  result = (_TtC10ProductKit21PersonalizedImageView *)sub_21EFCEA18();
  __break(1u);
  return result;
}

- (_TtC10ProductKit21PersonalizedImageView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_startedHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_completedHandler);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_featureHandler);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = a3;

  result = (_TtC10ProductKit21PersonalizedImageView *)sub_21EFCEA18();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_startedHandler));
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_completedHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10ProductKit21PersonalizedImageView_featureHandler);
  sub_21EF608FC(v3);
}

@end