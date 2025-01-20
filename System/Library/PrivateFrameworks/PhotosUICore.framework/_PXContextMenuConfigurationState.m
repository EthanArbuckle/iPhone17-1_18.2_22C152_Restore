@interface _PXContextMenuConfigurationState
- (BOOL)actionsAllowedForContextMenuInteraction;
- (BOOL)isContextMenuInteractionActive;
- (BOOL)isPreviewCommitting;
- (int64_t)interactionAppearance;
- (void)setActionsAllowedForContextMenuInteraction:(BOOL)a3;
- (void)setInteractionAppearance:(int64_t)a3;
- (void)setIsContextMenuInteractionActive:(BOOL)a3;
- (void)setIsPreviewCommitting:(BOOL)a3;
@end

@implementation _PXContextMenuConfigurationState

- (void)setInteractionAppearance:(int64_t)a3
{
  self->_interactionAppearance = a3;
}

- (int64_t)interactionAppearance
{
  return self->_interactionAppearance;
}

- (void)setIsPreviewCommitting:(BOOL)a3
{
  self->_isPreviewCommitting = a3;
}

- (BOOL)isPreviewCommitting
{
  return self->_isPreviewCommitting;
}

- (void)setActionsAllowedForContextMenuInteraction:(BOOL)a3
{
  self->_actionsAllowedForContextMenuInteraction = a3;
}

- (BOOL)actionsAllowedForContextMenuInteraction
{
  return self->_actionsAllowedForContextMenuInteraction;
}

- (void)setIsContextMenuInteractionActive:(BOOL)a3
{
  self->_isContextMenuInteractionActive = a3;
}

- (BOOL)isContextMenuInteractionActive
{
  return self->_isContextMenuInteractionActive;
}

@end