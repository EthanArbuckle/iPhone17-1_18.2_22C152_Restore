@interface UMUserSyncTask
- (unint64_t)contentSize;
- (void)setContentSize:(unint64_t)a3;
@end

@implementation UMUserSyncTask

- (unint64_t)contentSize
{
  return self->_contentSize;
}

- (void)setContentSize:(unint64_t)a3
{
  self->_contentSize = a3;
}

@end