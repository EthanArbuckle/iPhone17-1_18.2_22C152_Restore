@interface ICCreateContainerResponse
- (BOOL)updateRequired;
- (unsigned)containerID;
- (void)setContainerID:(unsigned int)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCreateContainerResponse

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setContainerID:(unsigned int)a3
{
  self->_containerID = a3;
}

- (unsigned)containerID
{
  return self->_containerID;
}

@end