@interface SBHIconResizeHandle
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)darkStyle;
- (BOOL)highlighted;
- (BOOL)isResizing;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBHIconResizeHandle)initWithCoder:(id)a3;
- (SBHIconResizeHandle)initWithFrame:(CGRect)a3;
- (SBHIconResizeHandle)initWithMetrics:(SBIconResizeHandleMetrics *)a3 iconImageInfo:(SBIconImageInfo *)a4 backgroundView:(id)a5;
- (SBIconImageInfo)iconImageInfo;
- (SBIconResizeHandleMetrics)metrics;
- (UIGestureRecognizer)resizingGestureRecognizer;
- (UIView)backgroundView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)setDarkStyle:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setResizing:(BOOL)a3;
- (void)setResizingGestureRecognizer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SBHIconResizeHandle

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  v6 = [(SBHIconResizeHandle *)self layer];
  v7 = [v6 mask];
  uint64_t v8 = [v7 path];

  v9 = [MEMORY[0x1E4FB14C0] bezierPathWithCGPath:v8];
  [v5 setShadowPath:v9];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v5];
  v11 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v10];
  v12 = [MEMORY[0x1E4FB1AE0] shapeWithPath:v9];
  v13 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v11 shape:v12];

  return v13;
}

- (SBIconResizeHandleMetrics)metrics
{
  v3 = (char *)self + OBJC_IVAR___SBHIconResizeHandle_metrics;
  double v4 = *(double *)((char *)&self->var4 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  int64_t v5 = *(int64_t *)((char *)&self->var5 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  long long v6 = *(_OWORD *)((char *)&self->var2 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var0 + OBJC_IVAR___SBHIconResizeHandle_metrics);
  *(_OWORD *)&retstr->var2 = v6;
  retstr->var4 = v4;
  retstr->var5 = v5;
  long long v7 = *((_OWORD *)v3 + 4);
  *(_OWORD *)&retstr->var6.top = *((_OWORD *)v3 + 3);
  *(_OWORD *)&retstr->var6.bottom = v7;
  return self;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (UIView)backgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___SBHIconResizeHandle_backgroundView));
}

- (UIGestureRecognizer)resizingGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                        + OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer));
}

- (void)setResizingGestureRecognizer:(id)a3
{
  id v6 = a3;
  int64_t v5 = self;
  sub_1D81A9B30(a3);
}

- (SBHIconResizeHandle)initWithMetrics:(SBIconResizeHandleMetrics *)a3 iconImageInfo:(SBIconImageInfo *)a4 backgroundView:(id)a5
{
  double v9 = v7;
  double v10 = v6;
  double v11 = v5;
  double var4 = a3->var4;
  int64_t var5 = a3->var5;
  long long v14 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v14;
  double v18 = var4;
  int64_t v19 = var5;
  long long v15 = *(_OWORD *)&a3->var6.bottom;
  long long v20 = *(_OWORD *)&a3->var6.top;
  long long v21 = v15;
  return (SBHIconResizeHandle *)sub_1D81A814C(v17, a4, v11, v10, v9, v8);
}

- (SBHIconResizeHandle)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo19SBHIconResizeHandleC15SpringBoardHomeE5coderABSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  double v11 = self;
  [(SBHIconResizeHandle *)v11 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [(SBHIconResizeHandle *)v11 backgroundView];
  -[UIView setFrame:](v10, sel_setFrame_, v3, v5, v7, v9);

  objc_msgSend(*(id *)((char *)&v11->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_whiteTintView), sel_setFrame_, v3, v5, v7, v9);
  objc_msgSend(*(id *)((char *)&v11->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_highlightView), sel_setFrame_, v3, v5, v7, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SBHIconResizeHandle *)self iconImageInfo];
  double v4 = v3;
  double v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)highlighted
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isHighlighted);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isHighlighted) = a3;
  double v4 = self;
  sub_1D81A9064(v3);
}

- (BOOL)isResizing
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle__isResizing);
}

- (void)setResizing:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle__isResizing) = a3;
}

- (BOOL)darkStyle
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isDarkStyle);
}

- (void)setDarkStyle:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_isDarkStyle) = a3;
  char v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_whiteTintView);
  double v4 = 0.42;
  if (a3) {
    double v4 = 0.0;
  }
  objc_msgSend(v3, sel_setAlpha_, v4);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D81B1F68();
    double v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    double v6 = 0;
  }
  double v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  Swift::Bool v9 = SBHIconResizeHandle._shouldAnimateProperty(withKey:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  long double y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  Swift::String_optional v8 = self;
  LOBYTE(self) = _sSo19SBHIconResizeHandleC15SpringBoardHomeE5point6inside4withSbSo7CGPointV_So7UIEventCSgtF_0(x, y);

  return self & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1D81A7E58(0, &qword_1EA8897F0);
  sub_1D81A9FE4();
  sub_1D81B1FB8();
  id v6 = a4;
  id v7 = self;
  Swift::String_optional v8 = (void *)sub_1D81B1FA8();
  v9.receiver = v7;
  v9.super_class = (Class)SBHIconResizeHandle;
  [(SBHIconResizeHandle *)&v9 touchesCancelled:v8 withEvent:v6];

  if (![(SBHIconResizeHandle *)v7 isResizing]) {
    [(SBHIconResizeHandle *)v7 setHighlighted:0];
  }

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (SBHIconResizeHandle)initWithFrame:(CGRect)a3
{
  CGSize result = (SBHIconResizeHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SBHIconResizeHandle_shapeLayer);
}

@end