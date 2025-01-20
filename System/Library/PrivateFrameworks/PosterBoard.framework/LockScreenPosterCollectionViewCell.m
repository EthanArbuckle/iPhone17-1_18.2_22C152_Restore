@interface LockScreenPosterCollectionViewCell
- (UIScrollView)scrollView;
- (_TtC11PosterBoard34LockScreenPosterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11PosterBoard34LockScreenPosterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)presentFocusSelector;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setScrollView:(id)a3;
@end

@implementation LockScreenPosterCollectionViewCell

- (_TtC11PosterBoard34LockScreenPosterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard34LockScreenPosterCollectionViewCell *)sub_1D331314C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard34LockScreenPosterCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D331BD60();
}

- (void)dealloc
{
  v2 = self;
  sub_1D33135D4();
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_liveContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_liveFloatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_lockVibrancyConfiguration));
  swift_unknownObjectWeakDestroy();
  sub_1D32E1170((uint64_t)self + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_displayDate, (uint64_t *)&unk_1EBD6F900);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollableContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_descriptorProvider));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_floatingLayerSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_prominentController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_widgetSidebarProminentController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_floatingProminentController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_titleStyleConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_complicationLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_floatingLayerSnapshotImage));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_focusButton);
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D331BF7C((uint64_t)&unk_1F2A70138, (uint64_t)sub_1D331C394, (uint64_t)&block_descriptor_215);
}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D331A4DC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D33164CC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1D3316830();
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                 + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView));
}

- (void)setScrollView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_scrollView) = (Class)a3;
  id v3 = a3;
}

- (void)presentFocusSelector
{
  if (MEMORY[0x1D9434A30]((char *)self + OBJC_IVAR____TtC11PosterBoard34LockScreenPosterCollectionViewCell_delegate, a2))
  {
    id v3 = self;
    sub_1D3342818((uint64_t)v3);

    swift_unknownObjectRelease();
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D331AE98(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v8 = a3;
  v10 = self;
  sub_1D331B43C(v8, (uint64_t)a5, v9, y);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1D331BF7C((uint64_t)&unk_1F2A6FD00, (uint64_t)sub_1D331C42C, (uint64_t)&block_descriptor_9);
  swift_unknownObjectRelease();
}

@end