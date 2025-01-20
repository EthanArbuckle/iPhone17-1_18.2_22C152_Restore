@interface SFTabOverviewLargeTitleView
- (BOOL)_textFieldShouldScrollToVisibleWhenBecomingFirstResponder:(id)a3;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (SFTabOverviewLargeTitleView)init;
- (SFTabOverviewLargeTitleView)initWithCoder:(id)a3;
- (SFTabOverviewLargeTitleView)initWithFrame:(CGRect)a3;
- (void)cancelEditingButtonReceivedTap;
- (void)shareButtonReceivedTap;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SFTabOverviewLargeTitleView

- (SFTabOverviewLargeTitleView)init
{
  return -[SFTabOverviewLargeTitleView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 320.0, 44.0);
}

- (SFTabOverviewLargeTitleView)initWithFrame:(CGRect)a3
{
  return (SFTabOverviewLargeTitleView *)sub_18C5297DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFTabOverviewLargeTitleView)initWithCoder:(id)a3
{
  return (SFTabOverviewLargeTitleView *)sub_18C5299E4(a3);
}

- (void)shareButtonReceivedTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super._window
                                      + OBJC_IVAR___SFTabOverviewLargeTitleView_configuration);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___SFTabOverviewLargeTitleView_shareButton);
  v4 = self;
  sub_18C6F7B98();
  v2(v3);

  swift_release();
}

- (void)cancelEditingButtonReceivedTap
{
  v2 = self;
  sub_18C52A978();
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C52DE6C();
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C52CB64(v4);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___SFTabOverviewLargeTitleView_configuration);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)_textFieldShouldScrollToVisibleWhenBecomingFirstResponder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)((char *)&self->super.super.super._responderFlags
                + OBJC_IVAR___SFTabOverviewLargeTitleView_configuration);
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewLargeTitleView_collaborationButtonWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewLargeTitleView_placeholderButton));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewLargeTitleView_titleTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewLargeTitleView_titleTextFieldToTrailingButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverviewLargeTitleView_cancelEditingButton));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end