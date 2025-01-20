@interface _UIMagicMorphAnimation.ReparentingView
- (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView)initWithCoder:(id)a3;
- (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UIMagicMorphAnimation.ReparentingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_portal);
  id v8 = a4;
  v9 = self;
  -[UIView convertPoint:toCoordinateSpace:](v9, sel_convertPoint_toCoordinateSpace_, v7, x, y);
  id v10 = objc_msgSend(v7, sel_hitTest_withEvent_, v8);

  return v10;
}

- (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_portal;
  id v9 = objc_allocWithZone((Class)_UIPortalView);
  id v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (Class *)((char *)&v10->super.super.super.isa
                + OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_OpacityPairInputAmount);
  void *v11 = 0xD00000000000001FLL;
  v11[1] = 0x8000000186B9EA70;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for _UIMagicMorphAnimation.ReparentingView();
  return -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView)initWithCoder:(id)a3
{
  return (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView *)sub_18597F07C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_portal));
  swift_bridgeObjectRelease();
}

@end