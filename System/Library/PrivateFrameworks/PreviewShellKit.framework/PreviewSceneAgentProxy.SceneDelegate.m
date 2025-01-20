@interface PreviewSceneAgentProxy.SceneDelegate
- (_TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate)init;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
@end

@implementation PreviewSceneAgentProxy.SceneDelegate

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  sub_25A174344();
  sub_25A1730AC(&qword_26A409B60, (void (*)(uint64_t))sub_25A174344);
  uint64_t v6 = sub_25A2383A8();
  id v7 = a3;
  v8 = self;
  sub_25A173DD8(v6);

  swift_bridgeObjectRelease();
}

- (void)sceneDidInvalidate:(id)a3
{
  swift_getObjectType();
  uint64_t v5 = sub_25A237188();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A238248();
  id v9 = a3;
  v10 = self;
  sub_25A238238();
  sub_25A238218();
  swift_release();
  v11[1] = v10;
  sub_25A237178();
  sub_25A1730AC(&qword_26A409B40, (void (*)(uint64_t))type metadata accessor for PreviewSceneAgentProxy.SceneDelegate);
  sub_25A2370F8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_25A1740F4(v10, a6);
}

- (_TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate)init
{
  result = (_TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCC15PreviewShellKit22PreviewSceneAgentProxyP33_3E64D4B6ABF6A6AD0F98F116D965CFCA13SceneDelegate_clientSettingsUpdates;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4099B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end