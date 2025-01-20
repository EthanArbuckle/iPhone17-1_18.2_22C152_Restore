@interface ImageBlurView
- (_TtC7Journal13ImageBlurView)initWithCoder:(id)a3;
- (_TtC7Journal13ImageBlurView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ImageBlurView

- (_TtC7Journal13ImageBlurView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal13ImageBlurView *)sub_100286E20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal13ImageBlurView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImageBlurView();
  v2 = (char *)v5.receiver;
  [(ImageBlurView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC7Journal13ImageBlurView_backingImageView];
  swift_getKeyPath();
  swift_getKeyPath();
  static UIView.Invalidating.subscript.getter();
  swift_release();
  swift_release();
  [v3 setImage:v4];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal13ImageBlurView__backgroundImage;
  uint64_t v4 = sub_100010218(&qword_100805D30);
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end