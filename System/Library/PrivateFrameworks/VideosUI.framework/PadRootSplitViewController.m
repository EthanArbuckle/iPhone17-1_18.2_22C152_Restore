@interface PadRootSplitViewController
- (BOOL)controllerExistsForIdentifier:(id)a3;
- (BOOL)hasRemoteBarItems;
- (BOOL)isFloatingTabBarInHierarchy;
- (BOOL)isSidebarEditing;
- (BOOL)isTabbarMode;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (UINavigationController)currentNavigationController;
- (UIViewController)currentViewController;
- (_TtC8VideosUI26PadRootSplitViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI26PadRootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8VideosUI26PadRootSplitViewController)initWithTabs:(id)a3;
- (id)controllerForIdentifier:(id)a3;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5;
- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4;
- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4;
- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5;
- (void)accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)isLibraryOnlyCountryChanged:(id)a3;
- (void)removeAllChildViewControllers;
- (void)setSelectedIndexForIdentifier:(id)a3 withDeeplinkURL:(id)a4;
- (void)updateWithBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willEnterForeground:(id)a3;
@end

@implementation PadRootSplitViewController

- (UINavigationController)currentNavigationController
{
  v2 = self;
  v3 = (void *)sub_1E34D390C();

  return (UINavigationController *)v3;
}

- (UIViewController)currentViewController
{
  v2 = self;
  v3 = (void *)sub_1E34D39B0();

  return (UIViewController *)v3;
}

- (_TtC8VideosUI26PadRootSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E34D6F28();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E34D7124(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E34D7278(v4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1E34D732C();
}

- (void)willEnterForeground:(id)a3
{
}

- (void)didEnterBackground:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  sub_1E34D7824();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_libraryManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_manager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_rootControllerConfig));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_profileView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_accountMessageViewController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI26PadRootSplitViewController)initWithTabs:(id)a3
{
}

- (_TtC8VideosUI26PadRootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E34D79E0();
}

- (void)updateWithBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8E580);
  sub_1E387CC98();
  id v7 = a5;
  v8 = self;
  sub_1E34DA0CC();

  swift_bridgeObjectRelease();
}

- (void)setSelectedIndexForIdentifier:(id)a3 withDeeplinkURL:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  MEMORY[0x1F4188790](v7 - 8);
  OUTLINED_FUNCTION_31();
  uint64_t v10 = v9 - v8;
  if (!a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    sub_1E38760D8();
    goto LABEL_6;
  }
  sub_1E387C928();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1E3876088();
  sub_1E38760D8();
LABEL_6:
  uint64_t v11 = OUTLINED_FUNCTION_249_1();
  __swift_storeEnumTagSinglePayload(v11, v12, v13, v14);
  v15 = self;
  OUTLINED_FUNCTION_199_0();
  OUTLINED_FUNCTION_81_1();
  sub_1E34DAAF0();

  swift_bridgeObjectRelease();
  sub_1E2C3BB24(v10, &qword_1EBF8F0E0);
}

- (BOOL)controllerExistsForIdentifier:(id)a3
{
  sub_1E387C928();
  char v4 = self;
  OUTLINED_FUNCTION_247();
  BOOL v5 = sub_1E34DBC14();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)controllerForIdentifier:(id)a3
{
  sub_1E387C928();
  char v4 = self;
  OUTLINED_FUNCTION_247();
  sub_1E34DBCD4();
}

- (BOOL)isTabbarMode
{
  v2 = self;
  BOOL v3 = sub_1E34DBE28();

  return v3;
}

- (BOOL)isSidebarEditing
{
  v2 = self;
  unsigned __int8 v3 = sub_1E34DBED0();

  return v3 & 1;
}

- (BOOL)isFloatingTabBarInHierarchy
{
  v2 = self;
  char v3 = sub_1E34DBF54();

  return v3 & 1;
}

- (void)removeAllChildViewControllers
{
  v2 = self;
  sub_1E34DC0D8();
}

- (BOOL)hasRemoteBarItems
{
  v2 = self;
  char v3 = sub_1E34DC134();

  return v3 & 1;
}

- (void)accountStoreDidChange:(id)a3
{
}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1E34E58D8();
  char v10 = v9;

  return v10 & 1;
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  OUTLINED_FUNCTION_135_1();
  id v11 = OUTLINED_FUNCTION_10_4(v8, v9, v10);
  id v12 = v6;
  id v13 = v5;
  id v14 = v7;
  OUTLINED_FUNCTION_111_10();
  sub_1E34E5D48();

  OUTLINED_FUNCTION_143();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5
{
  OUTLINED_FUNCTION_135_1();
  id v11 = OUTLINED_FUNCTION_10_4(v8, v9, v10);
  id v12 = v6;
  id v13 = v5;
  id v14 = v7;
  OUTLINED_FUNCTION_111_10();
  sub_1E34E6B80();

  OUTLINED_FUNCTION_143();
}

- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1E34E7044();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
  OUTLINED_FUNCTION_135_1();
  id v11 = OUTLINED_FUNCTION_10_4(v8, v9, v10);
  id v12 = v6;
  id v13 = v5;
  id v14 = v7;
  OUTLINED_FUNCTION_111_10();
  sub_1E34E71D8(v15, v16, v17);

  OUTLINED_FUNCTION_143();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
  OUTLINED_FUNCTION_135_1();
  id v11 = OUTLINED_FUNCTION_10_4(v8, v9, v10);
  id v12 = v6;
  id v13 = v5;
  id v14 = v7;
  OUTLINED_FUNCTION_111_10();
  sub_1E34E71D8(v15, v16, v17);

  OUTLINED_FUNCTION_143();
}

- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5
{
  OUTLINED_FUNCTION_135_1();
  id v6 = v5;
  uint64_t v8 = v7;
  id v10 = v9;
  id v11 = v6;
  v8;
  sub_1E34E73EC();

  OUTLINED_FUNCTION_143();
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1E34E7D28();
}

@end