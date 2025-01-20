@interface ICASCollaborationInviteStep
- (ICASCollaborationInviteStep)initWithCollaborationInviteStep:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)collaborationInviteStep;
@end

@implementation ICASCollaborationInviteStep

- (ICASCollaborationInviteStep)initWithCollaborationInviteStep:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationInviteStep;
  result = [(ICASCollaborationInviteStep *)&v5 init];
  if (result) {
    result->_collaborationInviteStep = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCollaborationInviteStep *)self collaborationInviteStep];
  if ((unint64_t)(v3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E64B8A00[v3 - 1];
  }
}

- (int64_t)collaborationInviteStep
{
  return self->_collaborationInviteStep;
}

@end