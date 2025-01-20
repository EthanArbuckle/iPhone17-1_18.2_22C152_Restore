@interface _UIPICSimpleInteractionProgress
- (BOOL)didEnd;
- (void)endInteraction:(BOOL)a3;
- (void)setDidEnd:(BOOL)a3;
@end

@implementation _UIPICSimpleInteractionProgress

- (void)endInteraction:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPICSimpleInteractionProgress;
  [(UISimpleInteractionProgress *)&v4 endInteraction:a3];
  [(_UIPICSimpleInteractionProgress *)self setDidEnd:1];
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (void)setDidEnd:(BOOL)a3
{
  self->_didEnd = a3;
}

@end