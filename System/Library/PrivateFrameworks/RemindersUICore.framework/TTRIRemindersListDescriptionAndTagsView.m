@interface TTRIRemindersListDescriptionAndTagsView
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)init;
- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithArrangedSubviews:(id)a3;
- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithFrame:(CGRect)a3;
- (void)invalidateInternalStateForInvalidation:(int64_t)a3;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
@end

@implementation TTRIRemindersListDescriptionAndTagsView

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)init
{
  return (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *)TTRIRemindersListDescriptionAndTagsView.init()();
}

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s15RemindersUICore39TTRIRemindersListDescriptionAndTagsViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(TTRIRemindersListDescriptionAndTagsView *)&v8 invalidateInternalStateForInvalidation:a3];
  if (a3 > 1)
  {
    sub_1B90BFD48((uint64_t)v6);
    uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_cachedLayoutInfo;
    sub_1B90BFE54((uint64_t)v4 + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_cachedLayoutInfo, (uint64_t)v7, &qword_1EB9ACA50);
    sub_1B90BFE54((uint64_t)v6, v5, &qword_1EB9ACA50);
    sub_1B94ECD98((uint64_t)v7);
  }
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  sub_1B94E962C((uint64_t)v7, width);
  sub_1B94ECD98((uint64_t)v7);

  double v5 = v8;
  double v6 = v9;
  result.height = v6;
  result.double width = v5;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  TTRIRemindersListDescriptionAndTagsView.layoutArrangedSubviews(inBounds:)(v9);
}

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView)initWithArrangedSubviews:(id)a3
{
  CGSize result = (_TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_hashtagsTextViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_hashtagsTextView));
  sub_1B94783DC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration), *(void **)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButtonConfiguration));
  sub_1B90BFE54((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_cachedLayoutInfo, (uint64_t)v3, &qword_1EB9ACA50);
  sub_1B94ECD98((uint64_t)v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_subtaskButton));
  swift_bridgeObjectRelease();
  sub_1B94D84DC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView____lazy_storage___measurementWrapper), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView____lazy_storage___measurementWrapper), *(void **)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView____lazy_storage___measurementWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIRemindersListDescriptionAndTagsView_unsupportedTextDropHandler));
}

@end