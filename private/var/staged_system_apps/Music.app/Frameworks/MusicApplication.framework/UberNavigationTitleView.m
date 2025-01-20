@interface UberNavigationTitleView
- (_TtC16MusicApplication23UberNavigationTitleView)initWithCoder:(id)a3;
- (_TtC16MusicApplication23UberNavigationTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
@end

@implementation UberNavigationTitleView

- (_TtC16MusicApplication23UberNavigationTitleView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(_OWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView__backButtonStyle] = xmmword_AEE120;
  v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView_splitViewDisplayMode];
  *(void *)v5 = 0;
  v5[8] = 1;
  *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView_customBackButton] = 0;
  id v6 = a3;

  result = (_TtC16MusicApplication23UberNavigationTitleView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_DF354();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_DF6E8((uint64_t)a3);
}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  id v6 = self;
  sub_DF854(a3, a4);
}

- (_TtC16MusicApplication23UberNavigationTitleView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MusicApplication23UberNavigationTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_E052C(*(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView__backButtonStyle], *(void *)&self->navigationController[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView__backButtonStyle]);
  v3 = *(void **)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView_customBackButton];
}

@end