@interface ICASCollabNotificationAction
- (ICASCollabNotificationAction)initWithCollabNotificationAction:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)collabNotificationAction;
@end

@implementation ICASCollabNotificationAction

- (ICASCollabNotificationAction)initWithCollabNotificationAction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCollabNotificationAction;
  result = [(ICASCollabNotificationAction *)&v5 init];
  if (result) {
    result->_collabNotificationAction = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCollabNotificationAction *)self collabNotificationAction];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8FE0[v3 - 1];
  }
}

- (int64_t)collabNotificationAction
{
  return self->_collabNotificationAction;
}

@end