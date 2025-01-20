@interface SearchTemplateController
- (BOOL)deeplinkURLWasHandled:(id)a3;
- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4;
- (_TtC8VideosUI24SearchTemplateController)initWithCoder:(id)a3;
- (_TtC8VideosUI24SearchTemplateController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)accountChanged:(id)a3;
- (void)handleWithKeyboardShowNotification:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vui_didMoveToParentViewController:(id)a3;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation SearchTemplateController

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E2C4CE28();
}

- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4
{
  id v5 = a3;
  v6 = self;
  v7 = (void *)OUTLINED_FUNCTION_11_4();
  sub_1E2CEEFBC(v7);
  OUTLINED_FUNCTION_22_0();

  double v8 = OUTLINED_FUNCTION_44();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (_TtC8VideosUI24SearchTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E31172E8();
}

- (void)accountChanged:(id)a3
{
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_6();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_35_3();
  id v5 = self;
  sub_1E3117474();

  uint64_t v6 = OUTLINED_FUNCTION_22_10();
  v7(v6);
}

- (void)vui_viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3117638();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3117B20(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3117D9C(v4);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E31184B0(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3118570(v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_1E3118678(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1E3118BDC((uint64_t)a3);
}

- (_TtC8VideosUI24SearchTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3118E24();
}

- (void).cxx_destruct
{
  sub_1E3116404(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8VideosUI24SearchTemplateController_savedNaturalLanguageSearchData), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC8VideosUI24SearchTemplateController_savedNaturalLanguageSearchData), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC8VideosUI24SearchTemplateController_savedNaturalLanguageSearchData), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC8VideosUI24SearchTemplateController_savedNaturalLanguageSearchData));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_searchController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1E31172D8(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8VideosUI24SearchTemplateController_currentSearchTextInputSource), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC8VideosUI24SearchTemplateController_currentSearchTextInputSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_resultsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_landingPageViewController));
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_collectionImpressioner, &qword_1EBF8B120);
  uint64_t v3 = OUTLINED_FUNCTION_45_14((uint64_t)self + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_loadingConfiguration);
  sub_1E31171DC(v3, v4, v5);
}

- (BOOL)deeplinkURLWasHandled:(id)a3
{
  OUTLINED_FUNCTION_128();
  sub_1E38760D8();
  OUTLINED_FUNCTION_0_6();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3876088();
  id v7 = v3;
  sub_1E31193BC((uint64_t)v6);

  uint64_t v8 = OUTLINED_FUNCTION_22_10();
  v9(v8);
  return 1;
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E31195F4();
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E3119658(v6);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3119C2C();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E311A5C8(v6);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  sub_1E387C928();
  id v6 = a3;
  id v7 = self;
  sub_1E311ABAC();

  swift_bridgeObjectRelease();
}

- (void)handleWithKeyboardShowNotification:(id)a3
{
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_6();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_35_3();
  uint64_t v5 = self;
  sub_1E311CF28();

  uint64_t v6 = OUTLINED_FUNCTION_22_10();
  v7(v6);
}

@end