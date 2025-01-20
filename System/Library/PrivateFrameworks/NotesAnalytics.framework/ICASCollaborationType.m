@interface ICASCollaborationType
- (ICASCollaborationType)initWithCollaborationType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)collaborationType;
@end

@implementation ICASCollaborationType

- (ICASCollaborationType)initWithCollaborationType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationType;
  result = [(ICASCollaborationType *)&v5 init];
  if (result) {
    result->_collaborationType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASCollaborationType *)self collaborationType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8EA0[v3 - 1];
  }
}

- (int64_t)collaborationType
{
  return self->_collaborationType;
}

@end