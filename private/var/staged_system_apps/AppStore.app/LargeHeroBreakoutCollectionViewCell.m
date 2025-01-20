@interface LargeHeroBreakoutCollectionViewCell
- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didTapActionButton;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LargeHeroBreakoutCollectionViewCell

- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell *)sub_1003EB3A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003ECA9C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003EBDE4();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003E9C10();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(LargeHeroBreakoutCollectionViewCell *)&v6 traitCollectionDidChange:v4];
  sub_1003EAE94();
}

- (void)didTapActionButton
{
  v2 = *(void (**)(uint64_t))(*(char **)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_detailsView)
                                      + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButtonHandler);
  if (v2)
  {
    id v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003EC384((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_mediaViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_detailsView));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore35LargeHeroBreakoutCollectionViewCell_detailPosition;
  uint64_t v4 = type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
}

@end