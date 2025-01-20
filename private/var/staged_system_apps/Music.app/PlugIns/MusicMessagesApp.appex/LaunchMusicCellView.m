@interface LaunchMusicCellView
- (UILabel)accessibilityLaunchMusicLabel;
- (_TtC16MusicMessagesApp19LaunchMusicCellView)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp19LaunchMusicCellView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LaunchMusicCellView

- (_TtC16MusicMessagesApp19LaunchMusicCellView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp19LaunchMusicCellView *)sub_100020580(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp19LaunchMusicCellView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC16MusicMessagesApp19LaunchMusicCellView *)sub_1000213DC();
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for LaunchMusicCellView();
  [(LaunchMusicCellView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_launchMusicLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_indicatorView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_layoutInvalidationHandler);

  sub_1000109BC(v3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100020920();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_100020E6C(a3);
}

- (UILabel)accessibilityLaunchMusicLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_launchMusicLabel));
}

@end