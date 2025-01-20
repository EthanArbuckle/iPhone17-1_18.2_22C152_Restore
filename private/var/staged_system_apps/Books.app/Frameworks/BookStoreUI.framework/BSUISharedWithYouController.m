@interface BSUISharedWithYouController
+ (_TtC11BookStoreUI27BSUISharedWithYouController)shared;
- (_TtC11BookStoreUI27BSUISharedWithYouController)init;
- (id)createHighlightAttributionViewFor:(id)a3 viewController:(id)a4;
- (void)highlightCenterHighlightsDidChange:(id)a3;
@end

@implementation BSUISharedWithYouController

+ (_TtC11BookStoreUI27BSUISharedWithYouController)shared
{
  if (qword_3C6540 != -1) {
    swift_once();
  }
  v2 = (void *)qword_3C6548;

  return (_TtC11BookStoreUI27BSUISharedWithYouController *)v2;
}

- (_TtC11BookStoreUI27BSUISharedWithYouController)init
{
  return (_TtC11BookStoreUI27BSUISharedWithYouController *)sub_5A578();
}

- (id)createHighlightAttributionViewFor:(id)a3 viewController:(id)a4
{
  uint64_t v6 = sub_2E4420();
  v8 = v7;
  id v9 = a4;
  v10 = self;
  id v11 = sub_5BE7C(v6, v8, a4);

  swift_bridgeObjectRelease();

  return v11;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI27BSUISharedWithYouController_highlightCenter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s11BookStoreUI27BSUISharedWithYouControllerC34highlightCenterHighlightsDidChangeyySo011SWHighlightI0CF_0();
}

@end