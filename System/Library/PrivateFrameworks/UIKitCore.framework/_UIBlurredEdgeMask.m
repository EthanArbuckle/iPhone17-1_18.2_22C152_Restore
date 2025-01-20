@interface _UIBlurredEdgeMask
- (_TtC5UIKit18_UIBlurredEdgeMask)initWithCoder:(id)a3;
- (_TtC5UIKit18_UIBlurredEdgeMask)initWithFrame:(CGRect)a3;
- (void)_contentViewDidUpdate;
- (void)dealloc;
- (void)displayLayer:(id)a3;
@end

@implementation _UIBlurredEdgeMask

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for _UIBlurredEdgeMask();
  [(UIView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit18_UIBlurredEdgeMask____lazy_storage___blurredPortal));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKit18_UIBlurredEdgeMask____lazy_storage___punchPortal);
}

- (void)_contentViewDidUpdate
{
  v2 = self;
  id v3 = sub_18592FA04();
  objc_msgSend(v3, sel_removeAllObjects);

  v4 = [(UIView *)v2 layer];
  [(CALayer *)v4 setNeedsDisplay];
}

- (void)displayLayer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185930DA0();
}

- (_TtC5UIKit18_UIBlurredEdgeMask)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5UIKit18_UIBlurredEdgeMask____lazy_storage___blurredPortal) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5UIKit18_UIBlurredEdgeMask____lazy_storage___punchPortal) = 0;
  id v4 = a3;

  result = (_TtC5UIKit18_UIBlurredEdgeMask *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (_TtC5UIKit18_UIBlurredEdgeMask)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit18_UIBlurredEdgeMask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end