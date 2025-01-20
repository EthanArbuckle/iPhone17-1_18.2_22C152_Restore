@interface RDAccountPersonIDSaltObserver.AccountInfo
- (REMObjectID)objectID;
- (int64_t)type;
@end

@implementation RDAccountPersonIDSaltObserver.AccountInfo

- (REMObjectID)objectID
{
  return (REMObjectID *)*(id *)self->objectID;
}

- (int64_t)type
{
  return *(void *)self->type;
}

@end