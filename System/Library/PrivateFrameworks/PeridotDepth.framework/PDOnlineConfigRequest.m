@interface PDOnlineConfigRequest
- (BOOL)newConfigIDAvailable;
- (unint64_t)newConfigID;
- (void)updateWithConfigID:(unint64_t)a3;
@end

@implementation PDOnlineConfigRequest

- (unint64_t)newConfigID
{
  return self->_newConfigID;
}

- (BOOL)newConfigIDAvailable
{
  return self->_newConfigIDAvailable;
}

- (void)updateWithConfigID:(unint64_t)a3
{
  self->_newConfigID = a3;
  self->_newConfigIDAvailable = 1;
}

@end