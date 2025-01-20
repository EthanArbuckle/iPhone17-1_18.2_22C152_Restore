@interface _UIPencilInteractionSqueeze
- (_UIPencilHoverState)_hoverState;
- (_UIPencilInteractionSqueeze)init;
@end

@implementation _UIPencilInteractionSqueeze

- (_UIPencilInteractionSqueeze)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"UIPencilInteraction.m", 583, @"%s: init is not allowed on %@", "-[_UIPencilInteractionSqueeze init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UIPencilHoverState)_hoverState
{
  return self->_hoverState;
}

- (void).cxx_destruct
{
}

@end