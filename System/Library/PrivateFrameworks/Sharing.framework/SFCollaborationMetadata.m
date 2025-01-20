@interface SFCollaborationMetadata
- (NSArray)defaultOptions;
- (_SWCollaborationShareOptions)defaultShareOptions;
@end

@implementation SFCollaborationMetadata

- (_SWCollaborationShareOptions)defaultShareOptions
{
  return self->_defaultShareOptions;
}

- (NSArray)defaultOptions
{
  return self->_defaultOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultOptions, 0);

  objc_storeStrong((id *)&self->_defaultShareOptions, 0);
}

@end