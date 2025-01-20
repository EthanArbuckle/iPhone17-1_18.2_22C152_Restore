@interface FMNoLocationBackgroundView
- (_TtC6FindMy26FMNoLocationBackgroundView)initWithCoder:(id)a3;
- (_TtC6FindMy26FMNoLocationBackgroundView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMNoLocationBackgroundView

- (_TtC6FindMy26FMNoLocationBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC6FindMy26FMNoLocationBackgroundView *)sub_1000139D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6FindMy26FMNoLocationBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10031FEE0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMNoLocationBackgroundView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMNoLocationBackgroundView *)&v6 traitCollectionDidChange:v4];
  sub_100010760();
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 136];
  v8[8] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 120];
  v9[0] = v3;
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle
                                                             + 145];
  long long v4 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 72];
  v8[4] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 56];
  v8[5] = v4;
  long long v5 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 104];
  v8[6] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 88];
  v8[7] = v5;
  long long v6 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle);
  v8[1] = v6;
  long long v7 = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 40];
  v8[2] = *(_OWORD *)&self->appliedStyle[OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_appliedStyle + 24];
  v8[3] = v7;
  sub_1002F2D7C((uint64_t)v8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_centerCircle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_centerPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationBackgroundView_centerImage));
}

@end