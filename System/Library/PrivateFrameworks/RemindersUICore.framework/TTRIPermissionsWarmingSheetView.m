@interface TTRIPermissionsWarmingSheetView
- (_TtC15RemindersUICore31TTRIPermissionsWarmingSheetView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore31TTRIPermissionsWarmingSheetView)initWithFrame:(CGRect)a3;
@end

@implementation TTRIPermissionsWarmingSheetView

- (_TtC15RemindersUICore31TTRIPermissionsWarmingSheetView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore31TTRIPermissionsWarmingSheetView *)sub_1B96229F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore31TTRIPermissionsWarmingSheetView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore31TTRIPermissionsWarmingSheetView *)sub_1B9622B2C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIPermissionsWarmingSheetView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIPermissionsWarmingSheetView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIPermissionsWarmingSheetView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIPermissionsWarmingSheetView____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIPermissionsWarmingSheetView____lazy_storage___secondaryButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRIPermissionsWarmingSheetView____lazy_storage___scrollView);
}

@end