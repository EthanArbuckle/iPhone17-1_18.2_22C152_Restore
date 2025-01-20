@interface TwoLabelButton
- (_TtC5TeaUI14TwoLabelButton)initWithCoder:(id)a3;
- (_TtC5TeaUI14TwoLabelButton)initWithFrame:(CGRect)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TwoLabelButton

- (_TtC5TeaUI14TwoLabelButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI14TwoLabelButton *)TwoLabelButton.init(frame:)();
}

- (_TtC5TeaUI14TwoLabelButton)initWithCoder:(id)a3
{
  id v3 = a3;
  TwoLabelButton.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  TwoLabelButton.layoutSubviews()();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_titleLabelNormal));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_titleLabelHighlighted));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_labelHighlighted));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_backgroundColorNormal));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_backgroundColorHighlighted));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_currentBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_currentBackgroundColorNormal));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI14TwoLabelButton_currentBackgroundColorHighlighted);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  v9.super.Class isa = (Class)self;
  Class isa = v9.super.isa;
  v9._attr = 0;
  TwoLabelButton.animationDidStop(_:finished:)(v9, v6);
}

@end