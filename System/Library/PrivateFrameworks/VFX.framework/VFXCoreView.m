@interface VFXCoreView
+ (Class)layerClass;
- (BOOL)isHidden;
- (CGRect)frame;
- (UIColor)backgroundColor;
- (_TtC3VFX11VFXCoreView)initWithCoder:(id)a3;
- (_TtC3VFX11VFXCoreView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation VFXCoreView

+ (Class)layerClass
{
  sub_1B63989B8(0, (unint64_t *)&unk_1EB97D800);

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXCoreView();
  return [(VFXCoreView *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VFXCoreView();
  id v4 = v7.receiver;
  [(VFXCoreView *)&v7 setHidden:v3];
  id v5 = objc_msgSend(v4, sel_window, v7.receiver, v7.super_class);

  if (v5) {
    unsigned __int8 v6 = objc_msgSend(v4, sel_isHidden);
  }
  else {
    unsigned __int8 v6 = 1;
  }
  *((unsigned char *)v4 + OBJC_IVAR____TtC3VFX11VFXCoreView_paused) = v6;
  sub_1B6A7ECCC();
}

- (_TtC3VFX11VFXCoreView)initWithCoder:(id)a3
{
  return (_TtC3VFX11VFXCoreView *)sub_1B6A7F048(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_1B6A7F560();
}

- (void).cxx_destruct
{
  sub_1B677E124((uint64_t)self + OBJC_IVAR____TtC3VFX11VFXCoreView_delegate);
  swift_release();

  sub_1B62C6A50(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX11VFXCoreView_postRenderCallback));
  swift_weakDestroy();

  swift_weakDestroy();
}

- (void)didMoveToWindow
{
  v2 = self;
  id v3 = [(VFXCoreView *)v2 window];
  id v4 = v3;
  if (v3) {

  }
  sub_1B6A7F858(v4 != 0);
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for VFXCoreView();
  [(VFXCoreView *)&v5 didMoveToWindow];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXCoreView();
  id v2 = v3.receiver;
  [(VFXCoreView *)&v3 layoutSubviews];
  sub_1B6A7FCEC();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VFXCoreView();
  [(VFXCoreView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VFXCoreView();
  id v7 = v8.receiver;
  -[VFXCoreView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  sub_1B6A7FCEC();
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VFXCoreView();
  double v2 = [(VFXCoreView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VFXCoreView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(VFXCoreView *)&v6 setBackgroundColor:v4];
  sub_1B6A7FEB4();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC3VFX11VFXCoreView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC3VFX11VFXCoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end