@interface PDContactlessPresentationEventPreArm
- (id)_init;
@end

@implementation PDContactlessPresentationEventPreArm

- (id)_init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)PDContactlessPresentationEvent;
    self = [(PDContactlessPresentationEvent *)&v2 init];
    if (self) {
      *((void *)self + 1) = 0;
    }
  }
  return self;
}

@end