@interface _UIIntelligenceButton
- (BOOL)_allowsSymbolAnimations;
- (BOOL)isHighlighted;
- (_TtC5UIKit21_UIIntelligenceButton)initWithCoder:(id)a3;
- (_TtC5UIKit21_UIIntelligenceButton)initWithFrame:(CGRect)a3;
- (unint64_t)behavioralStyle;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)updateConfiguration;
@end

@implementation _UIIntelligenceButton

- (_TtC5UIKit21_UIIntelligenceButton)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit21_UIIntelligenceButton *)sub_185A84FA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)behavioralStyle
{
  return 1;
}

- (BOOL)_allowsSymbolAnimations
{
  return 0;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIIntelligenceButton();
  return [(UIControl *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIIntelligenceButton();
  id v4 = v5.receiver;
  [(UIButton *)&v5 setHighlighted:v3];
  sub_185A856D4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185A853A0();
}

- (void)updateConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIIntelligenceButton();
  v2 = (char *)v5.receiver;
  [(UIButton *)&v5 updateConfiguration];
  BOOL v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_imagePortal];
  id v4 = objc_msgSend(v2, sel__imageEffectContainerView, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setSourceView_, v4);

  sub_185A85590();
}

- (_TtC5UIKit21_UIIntelligenceButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_isExpanded) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_scaleAnimator) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_opacityAnimator) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_rotationAnimator) = 0;
  id v4 = a3;

  result = (_TtC5UIKit21_UIIntelligenceButton *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_imagePortal));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_highlightTransformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_colorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_scaleAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_opacityAnimator));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5UIKit21_UIIntelligenceButton_rotationAnimator);
}

@end