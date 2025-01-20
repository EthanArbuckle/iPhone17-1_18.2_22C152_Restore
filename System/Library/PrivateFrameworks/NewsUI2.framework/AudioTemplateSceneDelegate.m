@interface AudioTemplateSceneDelegate
- (_TtC7NewsUI226AudioTemplateSceneDelegate)init;
- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4;
- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4;
@end

@implementation AudioTemplateSceneDelegate

- (_TtC7NewsUI226AudioTemplateSceneDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___resolver;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___container) = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___commandCenter);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate_interfaceController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate_audioTemplateController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(AudioTemplateSceneDelegate *)&v7 init];
}

- (void).cxx_destruct
{
  sub_1DF32AB1C((uint64_t)self + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate____lazy_storage___resolver);
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI226AudioTemplateSceneDelegate_interfaceController));
  swift_release();
}

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1DF32A400(v7);
}

- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1DF32A964();
}

@end