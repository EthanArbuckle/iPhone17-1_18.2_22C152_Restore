@interface HeroCarouselCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HeroCarouselCollectionViewCell

- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30HeroCarouselCollectionViewCell *)sub_100690B94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10069341C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10069135C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1006914C0();
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (uint64_t (**)())a3;
  v5 = self;
  sub_1006916A0(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  sub_100084CF0(0, (unint64_t *)&qword_10098A0B0);
  id v7 = a3;
  v8 = (_TtC8AppStore30HeroCarouselCollectionViewCell *)a4;
  v9 = self;
  if ((static NSObject.== infix(_:_:)() & 1) != 0
    && (v10 = (_TtC8AppStore30HeroCarouselCollectionViewCell *)[(HeroCarouselCollectionViewCell *)v8 view]) != 0)
  {
    v11 = v10;
    type metadata accessor for HeroCarouselItemView();
    BOOL v12 = swift_dynamicCastClass() != 0;

    v8 = v9;
    v9 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)handleTap:(id)a3
{
  id v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_didSelectHandler);
  if (v3)
  {
    v5 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_carouselView)
                  + OBJC_IVAR____TtC8AppStore16HeroCarouselView_pageControl);
    id v6 = a3;
    id v7 = self;
    sub_100060050((uint64_t)v3);
    v3([v5 currentPage]);
    sub_10006012C((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_carouselView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_state, &qword_10098BCC8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_tapGestureRecognizer));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_didSelectHandler));
  swift_weakDestroy();
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_impressionsUpdateBlock));
  swift_unknownObjectWeakDestroy();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_currentTitleEffect, (uint64_t *)&unk_100998640);
  swift_release();
  sub_1000E2D1C((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_playbackId);

  swift_unknownObjectWeakDestroy();
}

@end