@interface PUSlideshowViewModelChange
- (BOOL)currentStateDidChange;
- (BOOL)hasChanges;
- (BOOL)wantsChromeVisibleDidChange;
- (void)_setCurrentStateDidChange:(BOOL)a3;
- (void)_setWantsChromeVisibleDidChange:(BOOL)a3;
@end

@implementation PUSlideshowViewModelChange

- (void)_setWantsChromeVisibleDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)wantsChromeVisibleDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setCurrentStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)currentStateDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (BOOL)hasChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowViewModelChange;
  return [(PUViewModelChange *)&v4 hasChanges]
      || [(PUSlideshowViewModelChange *)self currentStateDidChange]
      || [(PUSlideshowViewModelChange *)self wantsChromeVisibleDidChange];
}

@end