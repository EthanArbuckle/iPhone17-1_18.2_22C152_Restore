@interface PDPassTileDescriptorDescriptorStatePair
- (PDPassTileDescriptorDescriptorStatePair)init;
@end

@implementation PDPassTileDescriptorDescriptorStatePair

- (PDPassTileDescriptorDescriptorStatePair)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childPairs, 0);
  objc_storeStrong((id *)&self->_stateDescriptor, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end