@interface SUIAShockwaveIntelligenceSystemLightView
- (SUIAShockwaveIntelligenceSystemLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4;
- (UIView)circleMaskView;
- (UIView)sideLightMaskView;
- (void)didAddSubview:(id)a3;
- (void)setCircleMaskView:(id)a3;
- (void)setSideLightMaskView:(id)a3;
@end

@implementation SUIAShockwaveIntelligenceSystemLightView

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25E718998((uint64_t)v4);
}

- (UIView)circleMaskView
{
  return (UIView *)sub_25E718D7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView);
}

- (void)setCircleMaskView:(id)a3
{
}

- (UIView)sideLightMaskView
{
  return (UIView *)sub_25E718D7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView);
}

- (void)setSideLightMaskView:(id)a3
{
}

- (SUIAShockwaveIntelligenceSystemLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ShockwaveIntelligenceSystemLightView();
  return -[_UIIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:](&v10, sel_initWithFrame_preferringAudioReactivity_, v4, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_circleMaskView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___SUIAShockwaveIntelligenceSystemLightView_sideLightMaskView);
}

@end