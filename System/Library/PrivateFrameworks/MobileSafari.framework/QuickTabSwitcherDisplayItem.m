@interface QuickTabSwitcherDisplayItem
@end

@implementation QuickTabSwitcherDisplayItem

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_transitionContainerView);
}

@end