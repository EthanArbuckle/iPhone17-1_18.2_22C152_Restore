@interface SignatureStrokeWidthControl
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (NSString)unit;
- (_TtC8PaperKit27SignatureStrokeWidthControl)initWithCoder:(id)a3;
- (_TtC8PaperKit27SignatureStrokeWidthControl)initWithFrame:(CGRect)a3;
- (int64_t)width;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SignatureStrokeWidthControl

- (int64_t)width
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_width);
}

- (NSString)unit
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_unit);
  uint64_t v3 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_unit);
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x21054D080](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC8PaperKit27SignatureStrokeWidthControl)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SignatureStrokeWidthControl.init(coder:)();
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  SignatureStrokeWidthControl.layoutSubviews()();
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

- (_TtC8PaperKit27SignatureStrokeWidthControl)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit27SignatureStrokeWidthControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl____lazy_storage___strokeWidthPreview));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthControl_contentButton));
  swift_bridgeObjectRelease();
}

@end