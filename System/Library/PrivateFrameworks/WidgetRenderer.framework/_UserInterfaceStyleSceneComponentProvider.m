@interface _UserInterfaceStyleSceneComponentProvider
- (UIScene)_scene;
- (UITraitCollection)_traitOverrides;
- (_TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider)init;
- (_TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider)initWithScene:(id)a3;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)set_traitOverrides:(id)a3;
@end

@implementation _UserInterfaceStyleSceneComponentProvider

- (UIScene)_scene
{
  return (UIScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__scene));
}

- (void)_setScene:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__scene);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__scene) = (Class)a3;
  id v3 = a3;
}

- (UITraitCollection)_traitOverrides
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__traitOverrides));
}

- (void)set_traitOverrides:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__traitOverrides);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__traitOverrides) = (Class)a3;
  id v3 = a3;
}

- (_TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider)initWithScene:(id)a3
{
  return (_TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider *)sub_2618AEA70(a3);
}

- (void)_sceneWillInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2618AF774();
}

- (_TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider)init
{
  result = (_TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__observer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__scene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__traitOverrides));
  sub_26188EC80((uint64_t)self + OBJC_IVAR____TtC14WidgetRenderer41_UserInterfaceStyleSceneComponentProvider__colorScheme, (uint64_t *)&unk_26B414690);

  swift_release();
}

@end