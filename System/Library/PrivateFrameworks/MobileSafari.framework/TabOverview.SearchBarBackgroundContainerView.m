@interface TabOverview.SearchBarBackgroundContainerView
- (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TabOverview.SearchBarBackgroundContainerView

- (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView;
  uint64_t v8 = qword_1E9175B18;
  v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  v14[4] = xmmword_1E9190678;
  v14[5] = *(_OWORD *)&qword_1E9190688;
  uint64_t v15 = qword_1E9190698;
  v14[0] = xmmword_1E9190638;
  v14[1] = xmmword_1E9190648;
  v14[2] = xmmword_1E9190658;
  v14[3] = xmmword_1E9190668;
  id v10 = objc_allocWithZone((Class)_s17BarBackgroundViewCMa());
  sub_18C3DD47C((uint64_t)v14);
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v7) = (Class)sub_18C3D9484((uint64_t)v14);

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for TabOverview.SearchBarBackgroundContainerView();
  v11 = -[SFFluidTabOverviewReusableView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  objc_msgSend(*(id *)((char *)&v11->super.super.super.super.super.isa+ OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_contentView), sel_addSubview_, *(Class *)((char *)&v11->super.super.super.super.super.isa+ OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView));
  return v11;
}

- (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView;
  uint64_t v5 = qword_1E9175B18;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v9[4] = xmmword_1E9190678;
  v9[5] = *(_OWORD *)&qword_1E9190688;
  uint64_t v10 = qword_1E9190698;
  v9[0] = xmmword_1E9190638;
  v9[1] = xmmword_1E9190648;
  v9[2] = xmmword_1E9190658;
  v9[3] = xmmword_1E9190668;
  id v7 = objc_allocWithZone((Class)_s17BarBackgroundViewCMa());
  sub_18C3DD47C((uint64_t)v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_18C3D9484((uint64_t)v9);

  result = (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TabOverview.SearchBarBackgroundContainerView();
  v2 = (char *)v7.receiver;
  [(TabOverview.SearchBarBackgroundContainerView *)&v7 layoutSubviews];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_contentView], sel_bounds, v7.receiver, v7.super_class);
  sub_18C3902B4(v3, v4, v5, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView));
}

@end