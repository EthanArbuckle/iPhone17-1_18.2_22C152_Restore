@interface PhotosDynamicHeaderView
- (BOOL)canUnloadWhenInvisible;
- (BOOL)isFloating;
- (CGRect)clippingRect;
- (NSCopying)userData;
- (_TtC12PhotosUICore23PhotosDynamicHeaderView)initWithCoder:(id)a3;
- (_TtC12PhotosUICore23PhotosDynamicHeaderView)initWithFrame:(CGRect)a3;
- (void)becomeReusable;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PhotosDynamicHeaderView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(PhotosDynamicHeaderView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_contentView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }
}

- (NSCopying)userData
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (NSCopying *)v2;
}

- (void)setUserData:(id)a3
{
  objc_super v5 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_userData);
  swift_beginAccess();
  *objc_super v5 = a3;
  swift_unknownObjectRetain_n();
  v6 = self;
  swift_unknownObjectRelease();
  sub_1AA128E70();

  swift_unknownObjectRelease();
}

- (CGRect)clippingRect
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_clippingRect);
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
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_clippingRect);
  swift_beginAccess();
  CGFloat *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (void)becomeReusable
{
  double v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_userData);
  swift_beginAccess();
  void *v3 = 0;
  double v4 = self;
  swift_unknownObjectRelease();
  sub_1AA128E70();
}

- (BOOL)isFloating
{
  return 1;
}

- (BOOL)canUnloadWhenInvisible
{
  v2 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_contentView);
  if (v2)
  {
    double v3 = *(uint64_t (**)(void))(**(void **)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_model]
                             + 416);
    double v4 = self;
    double v5 = v2;
    char v6 = v3();

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 1;
  }
  return v7 & 1;
}

- (_TtC12PhotosUICore23PhotosDynamicHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_configuration);
  _OWORD *v9 = 0u;
  v9[1] = 0u;
  v9[2] = 0u;
  v9[3] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_userData) = 0;
  v10 = (_OWORD *)((char *)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_clippingRect);
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_isFloating) = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[PhotosDynamicHeaderView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12PhotosUICore23PhotosDynamicHeaderView)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICore23PhotosDynamicHeaderView *)sub_1AA129830(a3);
}

- (void).cxx_destruct
{
  sub_1A9B6847C((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_configuration, &qword_1E981CC50, (uint64_t)&type metadata for PhotosDynamicHeaderView.Configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore23PhotosDynamicHeaderView_contentView));
  swift_unknownObjectRelease();
}

@end