@interface PhotosPageContainerView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (_TtC12PhotosUICore23PhotosPageContainerView)initWithCoder:(id)a3;
- (_TtC12PhotosUICore23PhotosPageContainerView)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PhotosPageContainerView

- (NSCopying)userData
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (NSCopying *)v2;
}

- (void)setUserData:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AA237560((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (CGRect)clippingRect
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_clippingRect);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_clippingRect);
  swift_beginAccess();
  CGFloat *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (void)prepareForReuse
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration) = 0;
  v2 = self;
  sub_1AA2363A4(v3);
}

- (_TtC12PhotosUICore23PhotosPageContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_userData) = 0;
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_clippingRect);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  _OWORD *v7 = *MEMORY[0x1E4F1DB20];
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosPageContainerView();
  return -[PhotosPageContainerView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12PhotosUICore23PhotosPageContainerView)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICore23PhotosPageContainerView *)sub_1AA2373FC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore23PhotosPageContainerView_contentView));
  swift_unknownObjectRelease();
}

@end