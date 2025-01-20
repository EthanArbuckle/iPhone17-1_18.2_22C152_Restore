@interface BadgeContainerView
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithArrangedSubviews:(id)a3;
- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithCoder:(id)a3;
- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithFrame:(CGRect)a3;
@end

@implementation BadgeContainerView

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *)sub_1004540B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithCoder:(id)a3
{
  v4 = (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *)((char *)&self->super
                                                                                        + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView);
  v4[1] = 0;
  v4[2] = 0;
  _TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *v4 = 0;
  *(_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *)((char *)&self->super
                                                                                    + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView____lazy_storage___badgeOvalClipMask) = 0;
  id v5 = a3;

  result = (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_badgeView));
  sub_1002F02F0(*(void **)((char *)&self->super+ OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView), *(void **)&self->badgeView[OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView], *(void **)&self->sharingIconView[OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView]);
  v3 = *(void **)((char *)&self->super
                + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView____lazy_storage___badgeOvalClipMask);
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  double v10 = sub_100454C04((uint64_t)v8);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end