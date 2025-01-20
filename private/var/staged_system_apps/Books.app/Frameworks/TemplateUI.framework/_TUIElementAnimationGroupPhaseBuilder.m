@interface _TUIElementAnimationGroupPhaseBuilder
- ($0F674443F67B1BBEFA3E91226872A32D)runList;
- (NSString)name;
- (double)delay;
- (double)duration;
- (unint64_t)options;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRunList:(id)a3;
@end

@implementation _TUIElementAnimationGroupPhaseBuilder

- ($0F674443F67B1BBEFA3E91226872A32D)runList
{
  return ($0F674443F67B1BBEFA3E91226872A32D)self->_runList;
}

- (void)setRunList:(id)a3
{
  self->_runList = ($36225AD0C84429F3A125462FE9B8891F)a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end