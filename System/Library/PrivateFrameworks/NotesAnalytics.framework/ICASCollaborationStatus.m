@interface ICASCollaborationStatus
- (ICASCollaborationStatus)initWithCollaborationStatus:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)collaborationStatus;
@end

@implementation ICASCollaborationStatus

- (ICASCollaborationStatus)initWithCollaborationStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationStatus;
  result = [(ICASCollaborationStatus *)&v5 init];
  if (result) {
    result->_collaborationStatus = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCollaborationStatus *)self collaborationStatus];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B9298[v3 - 1];
  }
}

- (int64_t)collaborationStatus
{
  return self->_collaborationStatus;
}

@end