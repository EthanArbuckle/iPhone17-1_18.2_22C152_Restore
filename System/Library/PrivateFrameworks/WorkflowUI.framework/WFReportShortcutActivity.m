@interface WFReportShortcutActivity
+ (NSString)activityType;
- (BOOL)_isDisabled;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIActivityViewController)activityControler;
- (UIViewController)activityViewController;
- (WFReportShortcutActivity)init;
- (WFReportShortcutActivity)initWithWorkflow:(id)a3 completion:(id)a4;
- (id)_systemImageName;
- (void)setActivityControler:(id)a3;
@end

@implementation WFReportShortcutActivity

+ (NSString)activityType
{
  id v2 = sub_22DAFBF60();
  return (NSString *)v2;
}

- (UIActivityViewController)activityControler
{
}

- (void)setActivityControler:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22DAFC084(a3);
}

- (WFReportShortcutActivity)initWithWorkflow:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (WFReportShortcutActivity *)ReportShortcutActivity.init(workflow:completion:)((uint64_t)a3, (uint64_t)sub_22DAFE0C4, v6);
}

- (NSString)activityType
{
  id v2 = self;
  v3 = (void *)sub_22DAFC330();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  id v2 = self;
  sub_22DAFC404();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_22DC92948();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)_isDisabled
{
  return sub_22DAFC51C() & 1;
}

- (id)_systemImageName
{
  sub_22DAFC52C();
  id v2 = (void *)sub_22DC92948();
  swift_bridgeObjectRelease();
  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = sub_22DC92B48();
  id v5 = self;
  BOOL v6 = sub_22DAFC598(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (UIViewController)activityViewController
{
  id v2 = self;
  id v3 = sub_22DAFCBC8();

  return (UIViewController *)v3;
}

- (WFReportShortcutActivity)init
{
}

- (void).cxx_destruct
{
  sub_22DAFD344(*(void **)((char *)&self->super.super.isa + OBJC_IVAR___WFReportShortcutActivity_item), *(int64_t *)((char *)&self->super._defaultPriority + OBJC_IVAR___WFReportShortcutActivity_item), *(uint64_t *)((char *)&self->super._activityImageLoader + OBJC_IVAR___WFReportShortcutActivity_item), *((unsigned char *)&self->super._activitySettingsImageLoader + OBJC_IVAR___WFReportShortcutActivity_item));
  swift_release();
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___WFReportShortcutActivity____lazy_storage___reportShortcutHostingViewController);
}

@end