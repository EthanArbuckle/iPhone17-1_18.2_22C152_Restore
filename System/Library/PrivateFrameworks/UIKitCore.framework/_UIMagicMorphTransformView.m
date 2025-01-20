@interface _UIMagicMorphTransformView
- (BOOL)isUserInteractionEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5UIKit26_UIMagicMorphTransformView)initWithCoder:(id)a3;
- (_TtC5UIKit26_UIMagicMorphTransformView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation _UIMagicMorphTransformView

- (BOOL)isUserInteractionEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIMagicMorphTransformView();
  return [(UIView *)&v3 isUserInteractionEnabled];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v4 = self;
  sub_185B11A5C(a3);
}

- (_TtC5UIKit26_UIMagicMorphTransformView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185B12BF4();
}

- (_TtC5UIKit26_UIMagicMorphTransformView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit26_UIMagicMorphTransformView *)sub_185B11B44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185B11C88();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit26_UIMagicMorphTransformView_sourcePreview);
  if (v4)
  {
    objc_msgSend(v4, sel_size, a3.width, a3.height);
  }
  else
  {
    double height = a3.height;
    double width = a3.width;
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for _UIMagicMorphTransformView();
    -[UIView sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIMagicMorphTransformView();
  id v2 = v3.receiver;
  [(UIView *)&v3 didMoveToWindow];
  sub_185B12978();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit26_UIMagicMorphTransformView_sourcePreview));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit26_UIMagicMorphTransformView_portalView);
}

@end