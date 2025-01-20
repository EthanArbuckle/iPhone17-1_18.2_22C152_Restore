@interface _UISceneConnectionOptionDefinitionActionHandler
- (_UISceneConnectionOptionDefinitionActionHandler)init;
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneConnectionOptionDefinitionActionHandler

- (_UISceneConnectionOptionDefinitionActionHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISceneConnectionOptionDefinitionActionHandler;
  return [(_UISceneConnectionOptionDefinitionActionHandler *)&v3 init];
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  sub_1853B985C(0, &qword_1EB256320);
  sub_1859B6BD8();
  uint64_t v10 = sub_186A1ED7C();
  id v11 = a5;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_185ADF124(v10, v11);

  swift_bridgeObjectRelease();
  v15 = (void *)sub_186A1ED6C();
  swift_bridgeObjectRelease();
  return v15;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  sub_1853B985C(0, &qword_1EB256320);
  sub_1859B6BD8();
  uint64_t v10 = sub_186A1ED7C();
  id v11 = objc_allocWithZone((Class)_UISceneConnectionOptionsContext);
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = self;
  id v16 = objc_msgSend(v11, sel_init);
  id v17 = v13;
  id v18 = v16;
  sub_185ADF76C(v10, (uint64_t)v17, (uint64_t)v18);

  v19 = (void *)sub_186A1ED6C();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setUnprocessedActions_, v19);

  swift_bridgeObjectRelease();
  return v18;
}

@end