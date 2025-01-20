@interface CompactSignatureStrokeWidthControl
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (NSString)unit;
- (_TtC8PaperKit34CompactSignatureStrokeWidthControl)initWithCoder:(id)a3;
- (_TtC8PaperKit34CompactSignatureStrokeWidthControl)initWithFrame:(CGRect)a3;
- (int64_t)width;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CompactSignatureStrokeWidthControl

- (int64_t)width
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_width);
}

- (NSString)unit
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_unit);
  uint64_t v3 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_unit);
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x21054D080](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC8PaperKit34CompactSignatureStrokeWidthControl)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_strokePreviewWidth) = (Class)0x4036000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl_strokePreviewRotationAngle) = (Class)0xBFE921FB54442D18;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl____lazy_storage___strokeWidthPreview) = 0;
  id v4 = a3;

  result = (_TtC8PaperKit34CompactSignatureStrokeWidthControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(CompactSignatureStrokeWidthControl *)&v6 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v2, sel_bounds);
  double Width = CGRectGetWidth(v7);
  objc_msgSend(v2, sel_bounds);
  double Height = CGRectGetHeight(v8);
  if (Height >= Width) {
    double Height = Width;
  }
  objc_msgSend(v3, sel_setCornerRadius_, Height * 0.5);
}

- (BOOL)isSelected
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return @objc StepperButton.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (_TtC8PaperKit34CompactSignatureStrokeWidthControl)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit34CompactSignatureStrokeWidthControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit34CompactSignatureStrokeWidthControl____lazy_storage___strokeWidthPreview);
}

@end