@interface KPFEventAnimationDelegate
- (KPFEvent)weakEvent;
- (KPFEventAnimationDelegate)initWithEvent:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setWeakEvent:(id)a3;
@end

@implementation KPFEventAnimationDelegate

- (KPFEventAnimationDelegate)initWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KPFEventAnimationDelegate;
  result = [(KPFEventAnimationDelegate *)&v5 init];
  if (result) {
    result->_weakEvent = (KPFEvent *)a3;
  }
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(KPFEventAnimationDelegate *)self weakEvent];

  [(KPFEvent *)v6 animationDidStop:a3 finished:v4];
}

- (KPFEvent)weakEvent
{
  return self->_weakEvent;
}

- (void)setWeakEvent:(id)a3
{
  self->_weakEvent = (KPFEvent *)a3;
}

@end