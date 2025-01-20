@interface DetailHeader
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityIsVisiblePlaylistTitle;
- (UIView)accessibilityArtworkEditingOverlayView;
- (_TtC16MusicApplication12DetailHeader)initWithCoder:(id)a3;
- (_TtC16MusicApplication12DetailHeader)initWithFrame:(CGRect)a3;
- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)accessibilityPlaylistVisibilitySwitchContainerView;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DetailHeader

- (_TtC16MusicApplication12DetailHeader)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12DetailHeader *)sub_2CBBEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12DetailHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2D7900();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2CBF84();
}

- (CGRect)bounds
{
  sub_2CC834(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (CGRect)frame
{
  sub_2CC834(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_2CCAB8(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_2CCFC8(a3);
}

- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)accessibilityPlaylistVisibilitySwitchContainerView
{
  return (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView *)*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12DetailHeader_detailsView) + OBJC_IVAR____TtCC16MusicApplication12DetailHeader11DetailsView_visibilitySwitch);
}

- (NSString)accessibilityIsVisiblePlaylistTitle
{
  double v2 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicApplication12DetailHeader_detailsView)
                + OBJC_IVAR____TtCC16MusicApplication12DetailHeader11DetailsView_visibilitySwitch);
  double v3 = self;
  id v4 = v2;
  sub_2D7B1C();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  swift_release();
  NSString v5 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (UIView)accessibilityArtworkEditingOverlayView
{
  double v2 = self;
  id v3 = sub_2CE420();

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication12DetailHeader_editingDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader_visibilitySeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader_descriptionSeparator));
  swift_release();
  swift_release();
  sub_2D8500(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints), *(void **)&self->actionText[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints], *(void **)&self->actionText[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints+ 8], *(void **)&self->showsArtwork[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints], *(void **)&self->hiddenHeaderElements[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints+ 7], *(void **)&self->textColor[OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___detailsConstraints + 7]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader_radiosityShadow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12DetailHeader____lazy_storage___artworkEditingOverlayView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12DetailHeader_detailsView);
}

@end