@interface DocumentRequestViewController
- (BOOL)handleDeeplink:(id)a3;
- (_TtC8VideosUI29DocumentRequestViewController)initWithCoder:(id)a3;
- (void)dealloc;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation DocumentRequestViewController

- (void)vui_viewDidAppear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentRequestViewController.vuiViewDidAppear(_:)(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentRequestViewController.vuiViewDidDisappear(_:)(v4);
}

- (_TtC8VideosUI29DocumentRequestViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  DocumentRequestViewController.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  DocumentRequestViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentRequestViewController.vuiViewWillAppear(_:)(v4);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  DocumentRequestViewController.vuiViewWillDisappear(_:)(v4);
}

- (BOOL)handleDeeplink:(id)a3
{
  uint64_t v4 = sub_1E38760D8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_31();
  uint64_t v10 = v9 - v8;
  sub_1E3876088();
  v11 = self;
  DocumentRequestViewController.handleDeeplink(_:)(v10);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  return 1;
}

@end