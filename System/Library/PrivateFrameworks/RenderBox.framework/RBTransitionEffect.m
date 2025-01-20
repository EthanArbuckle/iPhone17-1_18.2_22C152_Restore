@interface RBTransitionEffect
- (BOOL)isEqual:(id)a3;
- (float)argumentValueAtIndex:(unint64_t)a3;
- (float)beginTime;
- (float)duration;
- (id).cxx_construct;
- (unint64_t)animationIndex;
- (unint64_t)hash;
- (unint64_t)insertAnimationIndex;
- (unint64_t)removeAnimationIndex;
- (unsigned)events;
- (unsigned)flags;
- (unsigned)integerArgumentValueAtIndex:(unint64_t)a3;
- (unsigned)type;
- (void)setAnimationIndex:(unint64_t)a3;
- (void)setArgumentValue:(float)a3 atIndex:(unint64_t)a4;
- (void)setBeginTime:(float)a3;
- (void)setDuration:(float)a3;
- (void)setEvents:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInsertAnimationIndex:(unint64_t)a3;
- (void)setIntegerArgumentValue:(unsigned int)a3 atIndex:(unint64_t)a4;
- (void)setRemoveAnimationIndex:(unint64_t)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation RBTransitionEffect

- (unsigned)type
{
  return *(_WORD *)&self->_effect & 0x7F;
}

- (void)setType:(unsigned int)a3
{
  *(_WORD *)&self->_effect = *(_WORD *)&self->_effect & 0xFF80 | a3 & 0x7F;
}

- (unsigned)flags
{
  return *(_WORD *)&self->_effect >> 14;
}

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_effect = *(_WORD *)&self->_effect & 0x3FFF | ((_WORD)a3 << 14);
}

- (float)beginTime
{
  float result = 0.0;
  if ((*(_WORD *)&self->_effect & 0x80) == 0)
  {
    LOBYTE(result) = self->_effect.begin_or_insert_animation;
    return (float)LODWORD(result) * 0.0039216;
  }
  return result;
}

- (void)setBeginTime:(float)a3
{
}

- (float)duration
{
  float result = 1.0;
  if ((*(_WORD *)&self->_effect & 0x80) == 0)
  {
    LOBYTE(result) = self->_effect.dur_or_remove_animation;
    return (float)LODWORD(result) * 0.0039216;
  }
  return result;
}

- (void)setDuration:(float)a3
{
}

- (unint64_t)animationIndex
{
  if ((*(_WORD *)&self->_effect & 0x80) == 0) {
    return 0;
  }
  if (self->_effect.begin_or_insert_animation == self->_effect.dur_or_remove_animation) {
    return self->_effect.begin_or_insert_animation;
  }
  return 0;
}

- (void)setAnimationIndex:(unint64_t)a3
{
  p_effect = &self->_effect;
  char v4 = a3;
  RB::Transition::Effect::set_insert_animation((uint64_t)&self->_effect, a3);
  RB::Transition::Effect::set_remove_animation((uint64_t)p_effect, v4);
}

- (unint64_t)insertAnimationIndex
{
  if ((*(_WORD *)&self->_effect & 0x80) != 0) {
    return self->_effect.begin_or_insert_animation;
  }
  else {
    return 0;
  }
}

- (void)setInsertAnimationIndex:(unint64_t)a3
{
}

- (unint64_t)removeAnimationIndex
{
  if ((*(_WORD *)&self->_effect & 0x80) != 0) {
    return self->_effect.dur_or_remove_animation;
  }
  else {
    return 0;
  }
}

- (void)setRemoveAnimationIndex:(unint64_t)a3
{
}

- (unsigned)events
{
  return *((unsigned char *)&self->_effect + 1) & 0x3F;
}

- (void)setEvents:(unsigned int)a3
{
  *(_WORD *)&self->_effect = *(_WORD *)&self->_effect & 0xC0FF | ((a3 & 0x3F) << 8);
}

- (float)argumentValueAtIndex:(unint64_t)a3
{
  float result = 0.0;
  if (a3 <= 1) {
    return self->_args[a3].arg;
  }
  return result;
}

- (void)setArgumentValue:(float)a3 atIndex:(unint64_t)a4
{
  if (a4 <= 1) {
    self->_args[a4].arg = a3;
  }
}

- (unsigned)integerArgumentValueAtIndex:(unint64_t)a3
{
  if (a3 > 1) {
    return 0;
  }
  else {
    return self->_args[a3].int_arg;
  }
}

- (void)setIntegerArgumentValue:(unsigned int)a3 atIndex:(unint64_t)a4
{
  if (a4 <= 1) {
    self->_args[a4].int_arg = a3;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (!a3
    || *((unsigned __int16 *)a3 + 4) != self->_effect
    || self->_effect.begin_or_insert_animation != *((unsigned __int8 *)a3 + 10)
    || self->_effect.dur_or_remove_animation != *((unsigned __int8 *)a3 + 11))
  {
    return 0;
  }
  uint64_t v3 = 0;
  args = self->_args;
  do
  {
    v5.effect = (Effect)args[v3];
    int v6 = *(_DWORD *)((char *)a3 + v3 * 4 + 12);
    BOOL result = v5.int_arg == v6;
  }
  while (v5.int_arg == v6 && v3++ != 1);
  return result;
}

- (unint64_t)hash
{
  return (16777619
        * ((16777619 * RB::Transition::Effect::hash((RB::Transition::Effect *)&self->_effect)) ^ self->_args[0].int_arg)) ^ self->_args[1].int_arg;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = -16776447;
  return self;
}

@end