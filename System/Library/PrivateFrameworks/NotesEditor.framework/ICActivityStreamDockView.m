@interface ICActivityStreamDockView
- (BOOL)isDisplayedInCard;
- (ICActivityStreamCoordinating)coordinator;
- (ICActivityStreamDockView)initWithCoder:(id)a3;
- (ICActivityStreamDockView)initWithCoordinator:(id)a3 isDisplayedInCard:(BOOL)a4;
- (ICActivityStreamDockView)initWithFrame:(CGRect)a3;
- (ICActivityStreamSelection)selection;
- (ICCloudSyncingObject)object;
- (NSLayoutConstraint)horizontalStackLeadingConstraint;
- (double)buttonHeight;
- (double)closeButtonHeight;
- (double)closeButtonImageHeight;
- (double)margin;
- (void)setCoordinator:(id)a3;
- (void)setHorizontalStackLeadingConstraint:(id)a3;
- (void)setObject:(id)a3;
- (void)setSelection:(id)a3;
- (void)update;
@end

@implementation ICActivityStreamDockView

- (ICActivityStreamCoordinating)coordinator
{
  v2 = (void *)MEMORY[0x210546B30]((char *)self + OBJC_IVAR___ICActivityStreamDockView_coordinator, a2);

  return (ICActivityStreamCoordinating *)v2;
}

- (void)setCoordinator:(id)a3
{
}

- (BOOL)isDisplayedInCard
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_isDisplayedInCard);
}

- (NSLayoutConstraint)horizontalStackLeadingConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint));
}

- (void)setHorizontalStackLeadingConstraint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint) = (Class)a3;
  id v3 = a3;
}

- (ICActivityStreamDockView)initWithCoordinator:(id)a3 isDisplayedInCard:(BOOL)a4
{
  return (ICActivityStreamDockView *)ActivityStreamDockView.init(coordinator:isDisplayedInCard:)((uint64_t)a3, a4);
}

- (ICActivityStreamDockView)initWithCoder:(id)a3
{
}

- (void)update
{
  v2 = self;
  ActivityStreamDockView.update()();
}

- (ICActivityStreamSelection)selection
{
  return (ICActivityStreamSelection *)sub_20C02DB1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICActivityStreamDockView_selection);
}

- (void)setSelection:(id)a3
{
}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)sub_20C02DB1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICActivityStreamDockView_object);
}

- (void)setObject:(id)a3
{
}

- (double)margin
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_margin);
}

- (double)buttonHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_buttonHeight);
}

- (double)closeButtonHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_closeButtonHeight);
}

- (double)closeButtonImageHeight
{
  v2 = self;
  if (![(ICActivityStreamDockView *)v2 ic_hasCompactHeight])
  {

    return 30.0;
  }
  unsigned __int8 v3 = [(ICActivityStreamDockView *)v2 ic_hasCompactWidth];

  double result = 22.0;
  if ((v3 & 1) == 0) {
    return 30.0;
  }
  return result;
}

- (ICActivityStreamDockView)initWithFrame:(CGRect)a3
{
  double result = (ICActivityStreamDockView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20BFCEB78((uint64_t)self + OBJC_IVAR___ICActivityStreamDockView_coordinator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___topBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___colorBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___showAllActivityButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___horizontalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___verticalStack));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___baselineLayoutGuide);
}

@end