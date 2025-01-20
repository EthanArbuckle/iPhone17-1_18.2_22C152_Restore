@interface SFPendingCollaboration
- (SFCollaborationMetadata)collaborationMetadata;
@end

@implementation SFPendingCollaboration

- (SFCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void).cxx_destruct
{
}

@end