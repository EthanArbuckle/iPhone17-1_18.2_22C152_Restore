@interface ICCreateGeniusContainerResponse
- (unsigned)containerID;
- (void)setContainerID:(unsigned int)a3;
@end

@implementation ICCreateGeniusContainerResponse

- (void)setContainerID:(unsigned int)a3
{
  self->_containerID = a3;
}

- (unsigned)containerID
{
  return self->_containerID;
}

@end