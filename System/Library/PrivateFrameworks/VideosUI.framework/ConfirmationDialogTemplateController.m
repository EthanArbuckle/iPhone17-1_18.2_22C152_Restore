@interface ConfirmationDialogTemplateController
- (_TtC8VideosUI36ConfirmationDialogTemplateController)initWithCoder:(id)a3;
- (_TtC8VideosUI36ConfirmationDialogTemplateController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)dismissConfirmation;
- (void)onApplicationDidEnterBackground:(id)a3;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation ConfirmationDialogTemplateController

- (void)vui_viewWillAppear:(BOOL)a3
{
  v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E32C546C();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E32C5540();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E32C5618();
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E32C56B4();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E32C5788();
}

- (void)dealloc
{
  v2 = self;
  sub_1E32C5C84();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController_dismissTimer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController_badgeView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI36ConfirmationDialogTemplateController____lazy_storage___backdropView);
}

- (_TtC8VideosUI36ConfirmationDialogTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI36ConfirmationDialogTemplateController *)sub_1E32C5DAC(v5, v7, a4);
}

- (_TtC8VideosUI36ConfirmationDialogTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI36ConfirmationDialogTemplateController *)sub_1E32C5E98(a3);
}

- (void)onApplicationDidEnterBackground:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3875BE8();
  id v8 = self;
  sub_1E32C5F1C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)dismissConfirmation
{
  v2 = self;
  sub_1E32C605C();
}

@end