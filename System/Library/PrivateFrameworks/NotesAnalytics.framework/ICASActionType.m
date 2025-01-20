@interface ICASActionType
- (ICASActionType)initWithActionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)actionType;
@end

@implementation ICASActionType

- (ICASActionType)initWithActionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASActionType;
  result = [(ICASActionType *)&v5 init];
  if (result) {
    result->_actionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASActionType *)self actionType];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E64B8F38[v3 - 1];
  }
}

- (int64_t)actionType
{
  return self->_actionType;
}

@end