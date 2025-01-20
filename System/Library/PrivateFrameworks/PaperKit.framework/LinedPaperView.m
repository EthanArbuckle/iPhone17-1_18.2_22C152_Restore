@interface LinedPaperView
- (CGAffineTransform)drawingTransform;
- (_TtC8PaperKit14LinedPaperView)initWithCoder:(id)a3;
- (_TtC8PaperKit14LinedPaperView)initWithFrame:(CGRect)a3;
- (id)linedPaperLayerAttachmentContainerView:(id)a3;
- (id)linedPaperLayerLinedPaper:(id)a3;
- (id)linedPaperLayerTraitCollection:(id)a3;
- (void)setDrawingTransform:(CGAffineTransform *)a3;
@end

@implementation LinedPaperView

- (CGAffineTransform)drawingTransform
{
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform;
  long long v4 = *(_OWORD *)((char *)&self->c + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self->a + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v3 + 2);
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  long long v4 = *(_OWORD *)&a3->c;
  long long v5 = *(_OWORD *)&a3->tx;
  _OWORD *v3 = *(_OWORD *)&a3->a;
  v3[1] = v4;
  v3[2] = v5;
}

- (id)linedPaperLayerLinedPaper:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8PaperKit14LinedPaperView_linedPaper));
}

- (id)linedPaperLayerAttachmentContainerView:(id)a3
{
  id v3 = [(LinedPaperView *)self superview];
  return v3;
}

- (id)linedPaperLayerTraitCollection:(id)a3
{
  id v3 = [(LinedPaperView *)self traitCollection];
  return v3;
}

- (_TtC8PaperKit14LinedPaperView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LinedPaperView_linedPaperLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LinedPaperView_linedPaper) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  void *v8 = 0x3FF0000000000000;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = 0x3FF0000000000000;
  v9 = (objc_class *)type metadata accessor for LinedPaperView();
  v8[4] = 0;
  v8[5] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[LinedPaperView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8PaperKit14LinedPaperView)initWithCoder:(id)a3
{
  return (_TtC8PaperKit14LinedPaperView *)LinedPaperView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LinedPaperView_linedPaper);
}

@end