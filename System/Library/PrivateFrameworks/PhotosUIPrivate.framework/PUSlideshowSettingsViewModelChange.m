@interface PUSlideshowSettingsViewModelChange
- (BOOL)hasChanges;
- (BOOL)mediaItemDidChange;
- (BOOL)musicOnDidChange;
- (BOOL)presetDidChange;
- (BOOL)shouldRepeatDidChange;
- (BOOL)stepDurationDidChange;
- (void)_setMediaItemDidChange:(BOOL)a3;
- (void)_setMusicOnDidChange:(BOOL)a3;
- (void)_setPresetDidChange:(BOOL)a3;
- (void)_setRepeatDidChange:(BOOL)a3;
- (void)_setStepDurationDidChange:(BOOL)a3;
@end

@implementation PUSlideshowSettingsViewModelChange

- (void)_setMusicOnDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)musicOnDidChange
{
  return *(&self->super._hasChanges + 5);
}

- (void)_setStepDurationDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)stepDurationDidChange
{
  return *(&self->super._hasChanges + 4);
}

- (void)_setRepeatDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)shouldRepeatDidChange
{
  return *(&self->super._hasChanges + 3);
}

- (void)_setMediaItemDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)mediaItemDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setPresetDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)presetDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (BOOL)hasChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewModelChange;
  return [(PUViewModelChange *)&v4 hasChanges]
      || [(PUSlideshowSettingsViewModelChange *)self presetDidChange]
      || [(PUSlideshowSettingsViewModelChange *)self mediaItemDidChange]
      || [(PUSlideshowSettingsViewModelChange *)self shouldRepeatDidChange]
      || [(PUSlideshowSettingsViewModelChange *)self stepDurationDidChange]
      || [(PUSlideshowSettingsViewModelChange *)self musicOnDidChange];
}

@end