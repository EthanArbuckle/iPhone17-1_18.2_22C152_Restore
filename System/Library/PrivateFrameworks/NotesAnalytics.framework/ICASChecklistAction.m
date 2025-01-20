@interface ICASChecklistAction
- (ICASChecklistAction)initWithChecklistAction:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)checklistAction;
@end

@implementation ICASChecklistAction

- (ICASChecklistAction)initWithChecklistAction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASChecklistAction;
  result = [(ICASChecklistAction *)&v5 init];
  if (result) {
    result->_checklistAction = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASChecklistAction *)self checklistAction];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E64B8F70[v3 - 1];
  }
}

- (int64_t)checklistAction
{
  return self->_checklistAction;
}

@end