@interface MediaShowcasingTemplateController
- (_TtC8VideosUI33MediaShowcasingTemplateController)initWithCoder:(id)a3;
- (void)vuiScrollViewDidScroll:(id)a3;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewWillAppear:(BOOL)a3;
@end

@implementation MediaShowcasingTemplateController

- (_TtC8VideosUI33MediaShowcasingTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32B6208();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E32B62DC();
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E32B7BEC(v4);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E32B7CA4(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E32B7D38(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E32B7EB4(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33MediaShowcasingTemplateController_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33MediaShowcasingTemplateController____lazy_storage___inlinePrototypeTitleView));
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end