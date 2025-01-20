@interface PUToolbarViewModelChange
- (BOOL)accessoryViewChanged;
- (BOOL)accessoryViewMaximumHeightChanged;
- (BOOL)accessoryViewTopOutsetChanged;
- (BOOL)hasChanges;
- (BOOL)maximumHeightChanged;
- (BOOL)toolbarItemsChanged;
- (void)_setAccessoryViewChanged:(BOOL)a3;
- (void)_setAccessoryViewMaximumHeightChanged:(BOOL)a3;
- (void)_setAccessoryViewTopOutsetChanged:(BOOL)a3;
- (void)_setMaximumHeightChanged:(BOOL)a3;
- (void)_setToolbarItemsChanged:(BOOL)a3;
@end

@implementation PUToolbarViewModelChange

- (void)_setMaximumHeightChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)maximumHeightChanged
{
  return *(&self->super._hasChanges + 5);
}

- (void)_setAccessoryViewMaximumHeightChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)accessoryViewMaximumHeightChanged
{
  return *(&self->super._hasChanges + 4);
}

- (void)_setAccessoryViewTopOutsetChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)accessoryViewTopOutsetChanged
{
  return *(&self->super._hasChanges + 3);
}

- (void)_setAccessoryViewChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)accessoryViewChanged
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setToolbarItemsChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)toolbarItemsChanged
{
  return *(&self->super._hasChanges + 1);
}

- (BOOL)hasChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUToolbarViewModelChange;
  return [(PUViewModelChange *)&v4 hasChanges]
      || [(PUToolbarViewModelChange *)self toolbarItemsChanged]
      || [(PUToolbarViewModelChange *)self accessoryViewChanged]
      || [(PUToolbarViewModelChange *)self accessoryViewTopOutsetChanged]
      || [(PUToolbarViewModelChange *)self maximumHeightChanged];
}

@end