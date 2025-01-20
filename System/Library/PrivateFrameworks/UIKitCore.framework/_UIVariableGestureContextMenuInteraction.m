@interface _UIVariableGestureContextMenuInteraction
- (BOOL)_clickPresentationInteractionShouldPlayFeedback:(id)a3;
- (BOOL)_prefersCompactAppearance;
- (BOOL)_presentOnTouchDown;
- (_UIVariableGestureContextMenuInteraction)initWithDelegate:(id)a3;
- (id)_interactionDrivers;
- (int64_t)menuAppearance;
- (void)_setPrefersCompactAppearance:(BOOL)a3;
- (void)_setPresentOnTouchDown:(BOOL)a3;
- (void)_willBeginWithConfiguration:(id)a3;
- (void)didMoveToView:(id)a3;
@end

@implementation _UIVariableGestureContextMenuInteraction

- (BOOL)_presentOnTouchDown
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_setPresentOnTouchDown:(BOOL)a3
{
  char flags = (char)self->_flags;
  if (((((flags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(unsigned char *)&self->_char flags = flags & 0xFE | a3;
    id v5 = [(_UIVariableGestureContextMenuInteraction *)self _interactionDrivers];
    [(UIContextMenuInteraction *)self setDrivers:v5];
  }
}

- (_UIVariableGestureContextMenuInteraction)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  v3 = [(UIContextMenuInteraction *)&v6 initWithDelegate:a3];
  v4 = v3;
  if (v3) {
    [(_UIVariableGestureContextMenuInteraction *)v3 _setPrefersCompactAppearance:1];
  }
  return v4;
}

- (void)_setPrefersCompactAppearance:(BOOL)a3
{
  self->__prefersCompactAppearance = a3;
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIVariableGestureContextMenuInteraction *)self _interactionDrivers];
  [(UIContextMenuInteraction *)self setDrivers:v5];

  v6.receiver = self;
  v6.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  [(UIContextMenuInteraction *)&v6 didMoveToView:v4];
}

- (id)_interactionDrivers
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  if (*(unsigned char *)&self->_flags)
  {
    objc_super v6 = objc_opt_new();
    [v3 addObject:v6];

    id v5 = objc_opt_new();
    v12[0] = 4;
    memset(&v12[1], 0, 24);
    v7 = [MEMORY[0x1E4F29238] valueWithBytes:v12 objCType:"{_UIPressTrigger=qqdB}"];
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v5 setTriggers:v8];
  }
  else
  {
    id v4 = objc_opt_new();
    [v3 addObject:v4];

    id v5 = objc_opt_new();
  }
  [v3 addObject:v5];

  if ([v3 count]) {
    v9 = v3;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (int64_t)menuAppearance
{
  v5.receiver = self;
  v5.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  id v3 = [(UIContextMenuInteraction *)&v5 menuAppearance];
  if ([(_UIVariableGestureContextMenuInteraction *)self _prefersCompactAppearance]
    && v3 != 0)
  {
    return 2;
  }
  else
  {
    return (int64_t)v3;
  }
}

- (void)_willBeginWithConfiguration:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  [(UIContextMenuInteraction *)&v6 _willBeginWithConfiguration:v4];
  objc_super v5 = [(UIContextMenuInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 _contextMenuInteraction:self willBeginWithConfiguration:v4];
  }
}

- (BOOL)_clickPresentationInteractionShouldPlayFeedback:(id)a3
{
  return 0;
}

- (BOOL)_prefersCompactAppearance
{
  return self->__prefersCompactAppearance;
}

@end