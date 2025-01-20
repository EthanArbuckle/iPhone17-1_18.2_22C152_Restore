@interface SFBorderView
- (SFBorderView)initWithCoder:(id)a3;
- (SFBorderView)initWithFrame:(CGRect)a3;
- (UIColor)borderColor;
- (void)setBorderColor:(id)a3;
@end

@implementation SFBorderView

- (SFBorderView)initWithFrame:(CGRect)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)SFBorderView;
  v3 = -[SFBorderView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  sub_18C364A40();

  return v3;
}

- (UIColor)borderColor
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setBorderColor:(id)a3
{
  objc_super v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor);
  swift_beginAccess();
  v6 = *v5;
  *objc_super v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_18C5D1F68();
}

- (SFBorderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBorderView_borderColor) = 0;
  v8.receiver = self;
  v8.super_class = (Class)SFBorderView;
  id v3 = a3;
  v4 = [(SFBorderView *)&v8 initWithCoder:v3];
  objc_super v5 = v4;
  if (v4)
  {
    v6 = v4;
    sub_18C364A40();
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end