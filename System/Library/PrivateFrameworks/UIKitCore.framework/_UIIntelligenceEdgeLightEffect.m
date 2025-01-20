@interface _UIIntelligenceEdgeLightEffect
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (_UIIntelligenceEdgeLightEffect)init;
- (_UIIntelligenceEdgeLightEffect)initWithCoder:(id)a3;
- (_UIIntelligenceEdgeLightEffect)initWithLightSource:(id)a3 radius:(double)a4 region:(unint64_t)a5;
- (int64_t)_expectedUsage;
- (unint64_t)activationTransitionDirection;
- (unint64_t)deactivationTransitionDirection;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)setActivationTransitionDirection:(unint64_t)a3;
- (void)setDeactivationTransitionDirection:(unint64_t)a3;
@end

@implementation _UIIntelligenceEdgeLightEffect

- (unint64_t)activationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceEdgeLightEffect_activationTransitionDirection);
}

- (void)setActivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_activationTransitionDirection) = (Class)a3;
}

- (unint64_t)deactivationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceEdgeLightEffect_deactivationTransitionDirection);
}

- (void)setDeactivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_deactivationTransitionDirection) = (Class)a3;
}

- (_UIIntelligenceEdgeLightEffect)initWithLightSource:(id)a3 radius:(double)a4 region:(unint64_t)a5
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_lightSource) = (Class)a3;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_region) = (Class)a5;
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_radius) = a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_activationTransitionDirection) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceEdgeLightEffect_deactivationTransitionDirection) = 0;
  v7.receiver = self;
  v7.super_class = (Class)_UIIntelligenceEdgeLightEffect;
  id v5 = a3;
  return [(_UIIntelligenceEdgeLightEffect *)&v7 init];
}

- (_UIIntelligenceEdgeLightEffect)initWithCoder:(id)a3
{
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  _UIIntelligenceEdgeLightEffect._update(_:for:usage:)((int)v8, v9, a5);
}

- (int64_t)_expectedUsage
{
  return 2;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  LOBYTE(a5) = _UIIntelligenceEdgeLightEffect._needsUpdateForTransition(from:to:usage:)((uint64_t)a3, a4, a5);

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
    id v5 = self;
  }
  BOOL v6 = _UIIntelligenceEdgeLightEffect.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6;
}

- (void).cxx_destruct
{
}

- (_UIIntelligenceEdgeLightEffect)init
{
  result = (_UIIntelligenceEdgeLightEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end