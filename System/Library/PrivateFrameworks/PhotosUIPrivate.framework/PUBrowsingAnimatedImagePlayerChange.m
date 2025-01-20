@interface PUBrowsingAnimatedImagePlayerChange
- (BOOL)animatedImageDidChange;
- (BOOL)animatedImageLoadingAllowedDidChange;
- (BOOL)hasChanges;
- (void)_setAnimatedImageDidChange:(BOOL)a3;
- (void)_setAnimatedImageLoadingAllowedDidChange:(BOOL)a3;
@end

@implementation PUBrowsingAnimatedImagePlayerChange

- (void)_setAnimatedImageLoadingAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)animatedImageLoadingAllowedDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setAnimatedImageDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)animatedImageDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (BOOL)hasChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingAnimatedImagePlayerChange;
  return [(PUViewModelChange *)&v4 hasChanges]
      || [(PUBrowsingAnimatedImagePlayerChange *)self animatedImageDidChange]
      || [(PUBrowsingAnimatedImagePlayerChange *)self animatedImageLoadingAllowedDidChange];
}

@end