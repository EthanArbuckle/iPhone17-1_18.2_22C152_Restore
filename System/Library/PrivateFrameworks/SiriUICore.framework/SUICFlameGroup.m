@interface SUICFlameGroup
- (BOOL)isAura;
- (BOOL)isDyingOff;
- (SUICFlameGroup)init;
- (__n128)stateModifiers;
- (float)globalAlpha;
- (float)stateTime;
- (float)transitionPhase;
- (float)transitionPhasePtr;
- (float)zTime;
- (id)description;
- (uint64_t)stateModifiersPtr;
- (void)setGlobalAlpha:(float)a3;
- (void)setIsAura:(BOOL)a3;
- (void)setIsDyingOff:(BOOL)a3;
- (void)setStateModifiers:(SUICFlameGroup *)self;
- (void)setStateModifiersPtr:(SUICFlameGroup *)self;
- (void)setStateTime:(float)a3;
- (void)setTransitionPhase:(float)a3;
- (void)setTransitionPhasePtr:(float *)a3;
- (void)setZTime:(float)a3;
@end

@implementation SUICFlameGroup

- (SUICFlameGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUICFlameGroup;
  v2 = [(SUICFlameGroup *)&v6 init];
  v3 = (SUICFlameGroup *)v2;
  if (v2)
  {
    *((_OWORD *)v2 + 3) = xmmword_1A64FBA20;
    *((void *)v2 + 4) = v2 + 24;
    *((void *)v2 + 5) = v2 + 48;
    *(_OWORD *)(v2 + 12) = xmmword_1A64FBA00;
    *((_WORD *)v2 + 4) = 0;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  double stateTime = self->_stateTime;
  double zTime = self->_zTime;
  double transitionPhase = self->_transitionPhase;
  double v7 = *(float *)self->_stateModifiers;
  double v8 = *(float *)&self->_stateModifiers[4];
  double v9 = *(float *)&self->_stateModifiers[8];
  double v10 = *(float *)&self->_stateModifiers[12];
  double globalAlpha = self->_globalAlpha;
  v12 = [NSNumber numberWithBool:self->_isAura];
  v13 = [NSNumber numberWithBool:self->_isDyingOff];
  v14 = [v3 stringWithFormat:@"stateTime: %f  zTime: %f  transitionPhase: %f  stateModifiers: %f, %f, %f, %f  globalAlpha: %f  isAura: %@  isDyingOff: %@", *(void *)&stateTime, *(void *)&zTime, *(void *)&transitionPhase, *(void *)&v7, *(void *)&v8, *(void *)&v9, *(void *)&v10, *(void *)&globalAlpha, v12, v13];

  return v14;
}

- (float)stateTime
{
  return self->_stateTime;
}

- (void)setStateTime:(float)a3
{
  self->_double stateTime = a3;
}

- (float)zTime
{
  return self->_zTime;
}

- (void)setZTime:(float)a3
{
  self->_double zTime = a3;
}

- (float)globalAlpha
{
  return self->_globalAlpha;
}

- (void)setGlobalAlpha:(float)a3
{
  self->_double globalAlpha = a3;
}

- (float)transitionPhase
{
  return self->_transitionPhase;
}

- (void)setTransitionPhase:(float)a3
{
  self->_double transitionPhase = a3;
}

- (float)transitionPhasePtr
{
  return self->_transitionPhasePtr;
}

- (void)setTransitionPhasePtr:(float *)a3
{
  self->_transitionPhasePtr = a3;
}

- (__n128)stateModifiers
{
  return a1[3];
}

- (void)setStateModifiers:(SUICFlameGroup *)self
{
  *(_OWORD *)self->_stateModifiers = v2;
}

- (uint64_t)stateModifiersPtr
{
  return *(void *)(a1 + 40);
}

- (void)setStateModifiersPtr:(SUICFlameGroup *)self
{
  *(void *)self->_stateModifiersPtr = v2;
}

- (BOOL)isAura
{
  return self->_isAura;
}

- (void)setIsAura:(BOOL)a3
{
  self->_isAura = a3;
}

- (BOOL)isDyingOff
{
  return self->_isDyingOff;
}

- (void)setIsDyingOff:(BOOL)a3
{
  self->_isDyingOff = a3;
}

@end