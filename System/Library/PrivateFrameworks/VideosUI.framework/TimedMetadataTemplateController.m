@interface TimedMetadataTemplateController
- (BOOL)_canShowWhileLocked;
- (_TtC8VideosUI31TimedMetadataTemplateController)initWithCoder:(id)a3;
- (void)dealloc;
- (void)recordImpressionsHandler;
- (void)recordPageHandler;
- (void)vui_viewDidLoad;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation TimedMetadataTemplateController

- (void)dealloc
{
  v2 = self;
  sub_1E37A4C5C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI31TimedMetadataTemplateController_eventData);
}

- (_TtC8VideosUI31TimedMetadataTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E37A4F24();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E37A4FC0();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1E37A550C(a3);
}

- (BOOL)_canShowWhileLocked
{
  v2 = self;
  BOOL v3 = sub_1E37A570C();

  return v3;
}

- (void)recordPageHandler
{
  v2 = self;
  sub_1E37A7138();
}

- (void)recordImpressionsHandler
{
  v2 = self;
  sub_1E37A7184();
}

@end