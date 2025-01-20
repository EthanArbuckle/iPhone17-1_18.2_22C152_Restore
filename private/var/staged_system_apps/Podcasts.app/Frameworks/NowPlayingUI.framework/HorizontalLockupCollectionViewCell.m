@interface HorizontalLockupCollectionViewCell
- (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HorizontalLockupCollectionViewCell

- (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *)sub_AC7B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_AE39C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_ACC34();
}

- (void)clearArtworkCatalogs
{
  v2 = self;
  sub_AD6B0();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(HorizontalLockupCollectionViewCell *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  id v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_FB70((uint64_t)v3);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell();
  [(CompositeCollectionViewAwareTableCell *)&v4 applyLayoutAttributes:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_AD828((uint64_t)a3);
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  v6 = self;
  [(HorizontalLockupCollectionViewCell *)v6 setNeedsLayout];
  id v5 = *(void (**)(_TtC12NowPlayingUI34HorizontalLockupCollectionViewCell *))&v6->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler];
  if (v5)
  {
    swift_retain();
    v5(v6);
    sub_FB70((uint64_t)v5);
  }
}

- (void).cxx_destruct
{
  sub_832C8(*(void **)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkPlaceholder], *(void *)&self->artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkPlaceholder], self->artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkPlaceholder + 8]);

  sub_AE65C(*(id *)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkAccessoryStyle]);
  sub_FB70(*(void *)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_layoutInvalidationHandler]);
  swift_release();
  swift_release();

  swift_release();
  id v3 = *(void **)&self->_anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_customBottomSeparatorView];
}

@end