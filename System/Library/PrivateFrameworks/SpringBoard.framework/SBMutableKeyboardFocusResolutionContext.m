@interface SBMutableKeyboardFocusResolutionContext
- (void)setScreenDim:(BOOL)a3;
- (void)setSiriVisible:(BOOL)a3;
- (void)setSpotlightVisible:(BOOL)a3;
@end

@implementation SBMutableKeyboardFocusResolutionContext

- (void)setSpotlightVisible:(BOOL)a3
{
  self->super._spotlightVisible = a3;
}

- (void)setSiriVisible:(BOOL)a3
{
  self->super._siriVisible = a3;
}

- (void)setScreenDim:(BOOL)a3
{
  self->super._screenDim = a3;
}

@end