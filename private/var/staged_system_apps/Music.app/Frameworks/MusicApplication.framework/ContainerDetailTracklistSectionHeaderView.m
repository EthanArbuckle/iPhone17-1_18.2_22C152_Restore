@interface ContainerDetailTracklistSectionHeaderView
- (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView)initWithCoder:(id)a3;
- (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ContainerDetailTracklistSectionHeaderView

- (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView *)sub_1450D8();
}

- (_TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1452C0();
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for ContainerDetailTracklistSectionHeaderView();
  v2 = (char *)v16.receiver;
  [(ContainerDetailTracklistSectionHeaderView *)&v16 layoutSubviews];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 music_inheritedLayoutInsets];
  double v12 = v11;
  double v14 = v13;
  [v2 effectiveUserInterfaceLayoutDirection];
  UIEdgeInsetsInsetRect(v4, v6, v8, v10, v12, v14);
  v15 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_textStackView];
  sub_AB76D0();
  [v15 setFrame:];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41ContainerDetailTracklistSectionHeaderView_textStackView));
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end