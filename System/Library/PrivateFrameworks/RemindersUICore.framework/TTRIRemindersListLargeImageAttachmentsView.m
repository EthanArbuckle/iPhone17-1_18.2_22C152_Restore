@interface TTRIRemindersListLargeImageAttachmentsView
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView)initWithFrame:(CGRect)a3;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5;
- (void)didTapImage:(id)a3;
- (void)layoutSubviews;
@end

@implementation TTRIRemindersListLargeImageAttachmentsView

- (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView *)_s15RemindersUICore42TTRIRemindersListLargeImageAttachmentsViewC5frameACSo6CGRectV_tcfc_0();
}

- (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s15RemindersUICore42TTRIRemindersListLargeImageAttachmentsViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  TTRIRemindersListLargeImageAttachmentsView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_fixedWidth);
  swift_beginAccess();
  double v5 = *v4;
  if (*((unsigned char *)v4 + 8)) {
    double v5 = width;
  }
  double v6 = 157.0;
  result.height = v6;
  result.double width = v5;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (void)didTapImage:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1B94DD644(v4);
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_grid));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_totalCountViews);
  id v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_totalCountViews);

  sub_1B91109DC(v3, v4);
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  v9 = sub_1B94DEB5C((uint64_t)a4, &a5->origin.x);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v9;
}

@end