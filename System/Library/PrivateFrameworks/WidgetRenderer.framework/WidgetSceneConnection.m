@interface WidgetSceneConnection
- (NSString)description;
- (_TtC14WidgetRenderer21WidgetSceneConnection)init;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)dealloc;
@end

@implementation WidgetSceneConnection

- (NSString)description
{
  v2 = self;
  sub_2618B6C58();

  v3 = (void *)sub_2618FB300();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(WidgetSceneConnection *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_sceneSettingsDiffInspector));

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_rootViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_debugOverlayViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_contentViewController));
  sub_2618BB7DC((uint64_t)self + OBJC_IVAR____TtC14WidgetRenderer21WidgetSceneConnection_delegate);

  swift_release();
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = self;
  sub_2618BB434(a4, a5, a6, a7);
}

- (_TtC14WidgetRenderer21WidgetSceneConnection)init
{
  result = (_TtC14WidgetRenderer21WidgetSceneConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end