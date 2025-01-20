@interface SFTabOverviewDisplayItem
- (void)applyContentBlurRadius;
- (void)updateSearchResultsForSearchController:(id)a3;
@end

@implementation SFTabOverviewDisplayItem

- (void)applyContentBlurRadius
{
  v2 = self;
  sub_18C3E8B00();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C55F394(v4);
}

- (void).cxx_destruct
{
  swift_release();
  sub_18C39DEE0((uint64_t)self + OBJC_IVAR___SFTabOverviewDisplayItem_layout, (uint64_t (*)(void))_s14descr1ED9F30D1C6LayoutVMa);

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SFTabOverviewDisplayItem_blurrableBarBackgroundContainerView));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SFTabOverviewDisplayItem____lazy_storage___tabOverviewSwitcher));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___SFTabOverviewDisplayItem____lazy_storage___capsuleViewOffsetForRubberBanding));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___SFTabOverviewDisplayItem____lazy_storage___hudOffsetForRubberBanding);
}

@end