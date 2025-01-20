@interface NCNotificationStructuredListView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (NCNotificationStructuredListView)initWithCoder:(id)a3;
- (NCNotificationStructuredListView)initWithFrame:(CGRect)a3;
- (NCNotificationStructuredListViewDelegate)delegate;
- (NSNumber)distanceScrolledBeyondBottomOfContent;
- (UIEdgeInsets)footerInsets;
- (UIView)footerView;
- (UIView)listView;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)didExitAlwaysOn;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDistanceScrolledBeyondBottomOfContent:(id)a3;
- (void)setFooterInsets:(UIEdgeInsets)a3;
- (void)setFooterView:(id)a3;
- (void)setListView:(id)a3;
@end

@implementation NCNotificationStructuredListView

- (UIView)listView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___NCNotificationStructuredListView_listView));
}

- (void)setListView:(id)a3
{
}

- (UIView)footerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___NCNotificationStructuredListView_footerView));
}

- (void)setFooterView:(id)a3
{
}

- (UIEdgeInsets)footerInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  double v3 = *(double *)((char *)&self->super.super._responderFlags + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  double v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___NCNotificationStructuredListView_footerInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setFooterInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationStructuredListView_footerInsets) = a3;
  [(NCNotificationStructuredListView *)self setNeedsLayout];
}

- (NSNumber)distanceScrolledBeyondBottomOfContent
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent));
}

- (void)setDistanceScrolledBeyondBottomOfContent:(id)a3
{
  double v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent) = (Class)a3;
  id v6 = a3;
  double v5 = self;

  sub_1D7D78784();
}

- (void)didExitAlwaysOn
{
  double v2 = self;
  sub_1D7D789EC();
}

- (NCNotificationStructuredListViewDelegate)delegate
{
  double v2 = (void *)MEMORY[0x1D9481D00]((char *)self + OBJC_IVAR___NCNotificationStructuredListView_delegate, a2);

  return (NCNotificationStructuredListViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  double v2 = self;
  NCNotificationStructuredListView.layoutSubviews()();
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return sub_1D7D79060(self, (uint64_t)a2, (SEL *)&selRef_adjustForContentSizeCategoryChange);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return sub_1D7D79060(self, (uint64_t)a2, (SEL *)&selRef_adjustsFontForContentSizeCategory);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = self;
  id v5 = sub_1D7D78460();
  objc_msgSend(v5, sel_setAdjustsFontForContentSizeCategory_, v3);
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1D7D78460();
  objc_msgSend(v6, sel_adjustForLegibilitySettingsChange_, v4);
}

- (NCNotificationStructuredListView)initWithFrame:(CGRect)a3
{
  return (NCNotificationStructuredListView *)NCNotificationStructuredListView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NCNotificationStructuredListView)initWithCoder:(id)a3
{
  return (NCNotificationStructuredListView *)NCNotificationStructuredListView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCNotificationStructuredListView_distanceScrolledBeyondBottomOfContent));
  sub_1D7D23880((uint64_t)self + OBJC_IVAR___NCNotificationStructuredListView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCNotificationStructuredListView_internalToolsOverlayView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___NCNotificationStructuredListView____lazy_storage___revealHintView);
}

@end