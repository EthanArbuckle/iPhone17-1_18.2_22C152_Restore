@interface _UIIntelligenceRimHighlightEffect
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (_UIIntelligenceRimHighlightEffect)init;
- (_UIIntelligenceRimHighlightEffect)initWithCoder:(id)a3;
- (_UIIntelligenceRimHighlightEffect)initWithThickness:(double)a3 activationDirection:(unint64_t)a4;
- (_UIIntelligenceRimHighlightEffect)initWithThickness:(double)a3 color:(id)a4 softRadius:(double)a5 region:(unint64_t)a6 activationDirection:(unint64_t)a7;
- (unint64_t)activationTransitionDirection;
- (unint64_t)deactivationTransitionDirection;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)setActivationTransitionDirection:(unint64_t)a3;
- (void)setDeactivationTransitionDirection:(unint64_t)a3;
@end

@implementation _UIIntelligenceRimHighlightEffect

- (unint64_t)activationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceRimHighlightEffect_activationTransitionDirection);
}

- (void)setActivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceRimHighlightEffect_activationTransitionDirection) = (Class)a3;
}

- (unint64_t)deactivationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceRimHighlightEffect_deactivationTransitionDirection);
}

- (void)setDeactivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____UIIntelligenceRimHighlightEffect_deactivationTransitionDirection) = (Class)a3;
}

- (_UIIntelligenceRimHighlightEffect)initWithThickness:(double)a3 color:(id)a4 softRadius:(double)a5 region:(unint64_t)a6 activationDirection:(unint64_t)a7
{
  return (_UIIntelligenceRimHighlightEffect *)sub_1859D73C0(a4, a6, a7, a3, a5);
}

- (_UIIntelligenceRimHighlightEffect)initWithThickness:(double)a3 activationDirection:(unint64_t)a4
{
  id v7 = objc_msgSend(self, sel_whiteColor);
  v8 = [(_UIIntelligenceRimHighlightEffect *)self initWithThickness:v7 color:0 softRadius:a4 region:a3 activationDirection:0.0];

  return v8;
}

- (_UIIntelligenceRimHighlightEffect)initWithCoder:(id)a3
{
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  _UIIntelligenceRimHighlightEffect._update(_:for:usage:)(a3, a4, a5);
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  LOBYTE(a5) = _UIIntelligenceRimHighlightEffect._needsUpdateForTransition(from:to:usage:)((uint64_t)a3, a4, a5);

  return a5 & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = _UIIntelligenceRimHighlightEffect.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6;
}

- (void).cxx_destruct
{
  id v2 = *(id *)&self->config[OBJC_IVAR____UIIntelligenceRimHighlightEffect_config];
}

- (_UIIntelligenceRimHighlightEffect)init
{
  result = (_UIIntelligenceRimHighlightEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end