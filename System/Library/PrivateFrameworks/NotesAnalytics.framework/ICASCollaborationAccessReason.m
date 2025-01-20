@interface ICASCollaborationAccessReason
- (ICASCollaborationAccessReason)initWithCollaborationAccessReason:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)collaborationAccessReason;
@end

@implementation ICASCollaborationAccessReason

- (ICASCollaborationAccessReason)initWithCollaborationAccessReason:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationAccessReason;
  result = [(ICASCollaborationAccessReason *)&v5 init];
  if (result) {
    result->_collaborationAccessReason = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCollaborationAccessReason *)self collaborationAccessReason];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8E70[v3 - 1];
  }
}

- (int64_t)collaborationAccessReason
{
  return self->_collaborationAccessReason;
}

@end