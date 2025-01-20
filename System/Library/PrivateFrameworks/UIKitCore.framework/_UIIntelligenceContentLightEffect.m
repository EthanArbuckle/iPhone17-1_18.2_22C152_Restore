@interface _UIIntelligenceContentLightEffect
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (_UIIntelligenceContentLightEffect)init;
- (_UIIntelligenceContentLightEffect)initWithCoder:(id)a3;
- (_UIIntelligenceContentLightEffect)initWithLightSource:(id)a3;
- (_UIIntelligenceContentLightEffect)initWithLightSource:(id)a3 blurStyle:(int64_t)a4;
- (_UIIntelligenceContentLightEffect)initWithLightSource:(id)a3 lightMaterial:(id)a4 darkMaterial:(id)a5 bundle:(id)a6;
- (int64_t)_expectedUsage;
- (unint64_t)activationTransitionDirection;
- (unint64_t)deactivationTransitionDirection;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)setActivationTransitionDirection:(unint64_t)a3;
- (void)setDeactivationTransitionDirection:(unint64_t)a3;
@end

@implementation _UIIntelligenceContentLightEffect

- (unint64_t)activationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceContentLightEffect_activationTransitionDirection);
}

- (void)setActivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_activationTransitionDirection) = (Class)a3;
}

- (unint64_t)deactivationTransitionDirection
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR____UIIntelligenceContentLightEffect_deactivationTransitionDirection);
}

- (void)setDeactivationTransitionDirection:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____UIIntelligenceContentLightEffect_deactivationTransitionDirection) = (Class)a3;
}

- (_UIIntelligenceContentLightEffect)initWithLightSource:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_lightSource) = (Class)a3;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_activationTransitionDirection) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____UIIntelligenceContentLightEffect_deactivationTransitionDirection) = 0;
  v3 = (char *)self + OBJC_IVAR____UIIntelligenceContentLightEffect_material;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v3[40] = 2;
  v6.receiver = self;
  v6.super_class = (Class)_UIIntelligenceContentLightEffect;
  id v4 = a3;
  return [(_UIIntelligenceContentLightEffect *)&v6 init];
}

- (_UIIntelligenceContentLightEffect)initWithLightSource:(id)a3 blurStyle:(int64_t)a4
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_lightSource) = (Class)a3;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_activationTransitionDirection) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____UIIntelligenceContentLightEffect_deactivationTransitionDirection) = 0;
  id v4 = (char *)self + OBJC_IVAR____UIIntelligenceContentLightEffect_material;
  *(void *)id v4 = a4;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  v4[40] = 0;
  v7.receiver = self;
  v7.super_class = (Class)_UIIntelligenceContentLightEffect;
  id v5 = a3;
  return [(_UIIntelligenceContentLightEffect *)&v7 init];
}

- (_UIIntelligenceContentLightEffect)initWithLightSource:(id)a3 lightMaterial:(id)a4 darkMaterial:(id)a5 bundle:(id)a6
{
  uint64_t v9 = sub_186A1E95C();
  uint64_t v11 = v10;
  uint64_t v12 = sub_186A1E95C();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_lightSource) = (Class)a3;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_activationTransitionDirection) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____UIIntelligenceContentLightEffect_deactivationTransitionDirection) = 0;
  v13 = (char *)self + OBJC_IVAR____UIIntelligenceContentLightEffect_material;
  *(void *)v13 = v9;
  *((void *)v13 + 1) = v11;
  *((void *)v13 + 2) = v12;
  *((void *)v13 + 3) = v14;
  *((void *)v13 + 4) = a6;
  v13[40] = 1;
  v18.receiver = self;
  v18.super_class = (Class)_UIIntelligenceContentLightEffect;
  id v15 = a3;
  id v16 = a6;
  return [(_UIIntelligenceContentLightEffect *)&v18 init];
}

- (_UIIntelligenceContentLightEffect)initWithCoder:(id)a3
{
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  _UIIntelligenceContentLightEffect._update(_:for:usage:)((int)v8, v9, a5);
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  LOBYTE(a5) = _UIIntelligenceContentLightEffect._needsUpdateForTransition(from:to:usage:)((uint64_t)a3, a4, a5);

  return a5 & 1;
}

- (int64_t)_expectedUsage
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  BOOL v6 = _UIIntelligenceContentLightEffect.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____UIIntelligenceContentLightEffect_material);
  uint64_t v4 = *(void *)&self->lightSource[OBJC_IVAR____UIIntelligenceContentLightEffect_material];
  uint64_t v5 = *(void *)&self->material[OBJC_IVAR____UIIntelligenceContentLightEffect_material];
  uint64_t v6 = *(void *)&self->material[OBJC_IVAR____UIIntelligenceContentLightEffect_material + 8];
  objc_super v7 = *(void **)&self->material[OBJC_IVAR____UIIntelligenceContentLightEffect_material + 16];
  char v8 = self->material[OBJC_IVAR____UIIntelligenceContentLightEffect_material + 24];
  sub_185A5C3B4(v3, v4, v5, v6, v7, v8);
}

- (_UIIntelligenceContentLightEffect)init
{
  result = (_UIIntelligenceContentLightEffect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end