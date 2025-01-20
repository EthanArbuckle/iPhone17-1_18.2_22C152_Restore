@interface _UILightEffectContainerFillSurface.SurfaceView
- (_TtCV5UIKit34_UILightEffectContainerFillSurface11SurfaceView)initWithCoder:(id)a3;
- (_TtCV5UIKit34_UILightEffectContainerFillSurface11SurfaceView)initWithFrame:(CGRect)a3;
@end

@implementation _UILightEffectContainerFillSurface.SurfaceView

- (_TtCV5UIKit34_UILightEffectContainerFillSurface11SurfaceView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for _UILightEffectContainerFillSurface.SurfaceView();
  v7 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_whiteColor);
  [(UIView *)v9 setBackgroundColor:v10];

  sub_1859D3D70(v9);
  swift_unknownObjectRelease();

  return v9;
}

- (_TtCV5UIKit34_UILightEffectContainerFillSurface11SurfaceView)initWithCoder:(id)a3
{
  result = (_TtCV5UIKit34_UILightEffectContainerFillSurface11SurfaceView *)sub_186A1F60C();
  __break(1u);
  return result;
}

@end