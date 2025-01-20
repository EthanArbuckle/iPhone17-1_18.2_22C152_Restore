@interface KaleidoscopeContentView
- (_TtC18KaleidoscopePoster23KaleidoscopeContentView)initWithCoder:(id)a3;
- (_TtC18KaleidoscopePoster23KaleidoscopeContentView)initWithFrame:(CGRect)a3;
- (id)provideAtlasBacking:(id)a3;
- (id)resourceProviderKey;
- (void)dealloc;
- (void)layoutSubviews;
- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4;
@end

@implementation KaleidoscopeContentView

- (_TtC18KaleidoscopePoster23KaleidoscopeContentView)initWithFrame:(CGRect)a3
{
}

- (_TtC18KaleidoscopePoster23KaleidoscopeContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100021A38();
}

- (void)dealloc
{
  v2 = self;
  sub_10001EC78();
}

- (void).cxx_destruct
{
  sub_100021C7C((uint64_t)self + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterResourceProviderKey));
  sub_100014DB4((uint64_t)self + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lumaBacking));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_chromaBacking);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10001F10C();
}

- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = swift_retain();
  sub_10001F90C(v7);

  swift_release();
}

- (id)provideAtlasBacking:(id)a3
{
  uint64_t v4 = sub_100029080();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = sub_10001FFCC(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)resourceProviderKey
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterResourceProviderKey));
}

@end