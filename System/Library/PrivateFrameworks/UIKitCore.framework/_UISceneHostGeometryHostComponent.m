@interface _UISceneHostGeometryHostComponent
- (_TtC5UIKit33_UISceneHostGeometryHostComponent)init;
- (_TtC5UIKit33_UISceneHostGeometryHostComponent)initWithScene:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
@end

@implementation _UISceneHostGeometryHostComponent

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver;
  sub_18591C1C4((uint64_t)v3);
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  id v4 = a3;
  v5 = self;
  sub_18591BA54((uint64_t)v7);
  uint64_t v6 = (uint64_t)v5 + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver;
  swift_beginAccess();
  sub_18591C15C((uint64_t)v7, v6);
  swift_endAccess();
}

- (_TtC5UIKit33_UISceneHostGeometryHostComponent)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_currentHandle) = 0;
  id v4 = (char *)self + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(_UISceneHostGeometryHostComponent *)&v6 init];
}

- (_TtC5UIKit33_UISceneHostGeometryHostComponent)initWithScene:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_currentHandle) = 0;
  objc_super v6 = (char *)self + OBJC_IVAR____TtC5UIKit33_UISceneHostGeometryHostComponent_geometryDriver;
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(FBSSceneComponent *)&v8 initWithScene:a3];
}

@end