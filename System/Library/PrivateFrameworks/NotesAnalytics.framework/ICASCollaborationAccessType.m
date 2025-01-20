@interface ICASCollaborationAccessType
- (ICASCollaborationAccessType)initWithCollaborationAccessType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)collaborationAccessType;
@end

@implementation ICASCollaborationAccessType

- (ICASCollaborationAccessType)initWithCollaborationAccessType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationAccessType;
  result = [(ICASCollaborationAccessType *)&v5 init];
  if (result) {
    result->_collaborationAccessType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCollaborationAccessType *)self collaborationAccessType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8B50[v3 - 1];
  }
}

- (int64_t)collaborationAccessType
{
  return self->_collaborationAccessType;
}

@end