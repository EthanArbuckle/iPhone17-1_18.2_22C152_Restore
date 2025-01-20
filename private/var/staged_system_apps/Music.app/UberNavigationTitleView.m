@interface UberNavigationTitleView
- (_TtC5Music23UberNavigationTitleView)initWithCoder:(id)a3;
- (_TtC5Music23UberNavigationTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
@end

@implementation UberNavigationTitleView

- (_TtC5Music23UberNavigationTitleView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(_OWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView__backButtonStyle] = xmmword_100E26B10;
  v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView_splitViewDisplayMode];
  *(void *)v5 = 0;
  v5[8] = 1;
  *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView_customBackButton] = 0;
  id v6 = a3;

  result = (_TtC5Music23UberNavigationTitleView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004B6B68();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1004B6F14((uint64_t)a3);
}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  id v6 = self;
  sub_1004B7080(a3, a4);
}

- (_TtC5Music23UberNavigationTitleView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Music23UberNavigationTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100313EE8(*(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView__backButtonStyle], *(void *)&self->navigationController[OBJC_IVAR____TtC5Music23UberNavigationTitleView__backButtonStyle]);
  v3 = *(void **)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView_customBackButton];
}

@end