@interface SceneTabBarController
- (BOOL)isTabBarHidden;
- (NSArray)tabBarItems;
- (_TtC8VideosUI21SceneTabBarController)init;
- (unint64_t)selectedIndex;
- (void)didEnterBackground:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3;
- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3 clearStack:(BOOL)a4;
- (void)setTabBarHidden:(BOOL)a3;
- (void)updateWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5;
- (void)willTerminate:(id)a3;
@end

@implementation SceneTabBarController

- (NSArray)tabBarItems
{
  v2 = self;
  sub_1E3033C18();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8E580);
  v3 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (unint64_t)selectedIndex
{
  v2 = self;
  unint64_t v3 = sub_1E3033EC4();

  return v3;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  v4 = self;
  sub_1E3033F78(a3);
}

- (BOOL)isTabBarHidden
{
  v2 = self;
  char v3 = sub_1E3034054();

  return v3 & 1;
}

- (void)setTabBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1E3034108(v3);
}

- (_TtC8VideosUI21SceneTabBarController)init
{
  sub_1E30341B0();
  return result;
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3 clearStack:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = sub_1E387C928();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = self;
  sub_1E3034478(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)setSelectedIndexForTabBarItemIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1E387C928();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  sub_1E3034800(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)updateWithTabBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8E580);
  uint64_t v8 = sub_1E387CC98();
  id v9 = a5;
  v10 = self;
  sub_1E303487C(v8, a4, a5);

  swift_bridgeObjectRelease();
}

- (void)didEnterBackground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E3035CB4(0);
}

- (void)willTerminate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E3035CB4(1);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI21SceneTabBarController__tabBarInfo;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EADE8910);
  OUTLINED_FUNCTION_15_3();
  (*(void (**)(char *))(v3 + 8))(v2);
  swift_release();
}

@end