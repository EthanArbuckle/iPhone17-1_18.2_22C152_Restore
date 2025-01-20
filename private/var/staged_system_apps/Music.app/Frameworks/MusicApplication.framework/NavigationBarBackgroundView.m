@interface NavigationBarBackgroundView
- (_TtC16MusicApplication27NavigationBarBackgroundView)initWithCoder:(id)a3;
- (_TtC16MusicApplication27NavigationBarBackgroundView)initWithEffect:(id)a3;
- (void)_setFrame:(CGRect)a3 forceUpdateBackgroundImage:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NavigationBarBackgroundView

- (_TtC16MusicApplication27NavigationBarBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) = 1;
  id v4 = a3;

  result = (_TtC16MusicApplication27NavigationBarBackgroundView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v8.receiver;
  [(NavigationBarBackgroundView *)&v8 traitCollectionDidChange:v4];
  if (*((unsigned char *)v5 + OBJC_IVAR____TtC16MusicApplication27NavigationBarBackgroundView_shouldUseTraitCollectionGroupName) == 1)
  {
    id v6 = [v5 traitCollection];
    UITraitCollection.navigationBarBackdropGroupName.getter();
    NSString v7 = sub_AB64D0();
    swift_bridgeObjectRelease();

    [v5 _setGroupName:v7];
    id v4 = v5;
    id v5 = v7;
  }
}

- (void)_setFrame:(CGRect)a3 forceUpdateBackgroundImage:(BOOL)a4
{
}

- (_TtC16MusicApplication27NavigationBarBackgroundView)initWithEffect:(id)a3
{
  id v3 = a3;
  result = (_TtC16MusicApplication27NavigationBarBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end