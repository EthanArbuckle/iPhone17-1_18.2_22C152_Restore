@interface ArcadeDownloadPackGameLockupPlaceholder
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3;
- (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackGameLockupPlaceholder

- (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder *)sub_100672398(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006730C4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  id v5 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  if (qword_1009807D8 != -1) {
    swift_once();
  }
  sub_100063D84((uint64_t)&xmmword_1009E7A90, (uint64_t)v12);
  if (qword_1009807E0 != -1) {
    swift_once();
  }
  id v6 = [(ArcadeDownloadPackGameLockupPlaceholder *)v4 traitCollection];
  [(ArcadeDownloadPackGameLockupPlaceholder *)v4 layoutMargins];
  double v7 = sub_100054354((uint64_t)v12, (uint64_t)&xmmword_1009E7BF0, v6, width);
  double v9 = v8;

  sub_100082D34((uint64_t)v12);
  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ArcadeDownloadPackGameLockupPlaceholder *)&v5 layoutSubviews];
  sub_1006725D8(v4);
  sub_100081D90(v4, v4[3]);
  LayoutMarginsAware<>.layoutFrame.getter();
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder);
}

@end