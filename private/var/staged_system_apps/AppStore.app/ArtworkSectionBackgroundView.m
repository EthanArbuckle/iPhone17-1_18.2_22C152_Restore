@interface ArtworkSectionBackgroundView
- (_TtC8AppStore28ArtworkSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore28ArtworkSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ArtworkSectionBackgroundView

- (_TtC8AppStore28ArtworkSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28ArtworkSectionBackgroundView *)sub_10024F45C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28ArtworkSectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10024F9FC();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  id v2 = v3.receiver;
  [(ArtworkSectionBackgroundView *)&v3 layoutSubviews];
  [v2 bounds];
  CGRect.subtracting(insets:)();
  ArtworkView.frame.setter();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkSectionBackgroundView();
  id v2 = v3.receiver;
  [(ArtworkSectionBackgroundView *)&v3 prepareForReuse];
  ArtworkView.image.setter();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_gradientView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore28ArtworkSectionBackgroundView_artworkView);
}

@end