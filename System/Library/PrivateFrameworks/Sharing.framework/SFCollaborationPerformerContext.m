@interface SFCollaborationPerformerContext
- (BOOL)requiresParticipants;
- (double)deviceScreenScale;
- (void)setDeviceScreenScale:(double)a3;
- (void)setRequiresParticipants:(BOOL)a3;
@end

@implementation SFCollaborationPerformerContext

- (BOOL)requiresParticipants
{
  return self->_requiresParticipants;
}

- (void)setRequiresParticipants:(BOOL)a3
{
  self->_requiresParticipants = a3;
}

- (double)deviceScreenScale
{
  return self->_deviceScreenScale;
}

- (void)setDeviceScreenScale:(double)a3
{
  self->_deviceScreenScale = a3;
}

@end