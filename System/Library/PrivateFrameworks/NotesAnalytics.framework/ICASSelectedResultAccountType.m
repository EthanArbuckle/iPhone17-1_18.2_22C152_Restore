@interface ICASSelectedResultAccountType
- (ICASSelectedResultAccountType)initWithSelectedResultAccountType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)selectedResultAccountType;
@end

@implementation ICASSelectedResultAccountType

- (ICASSelectedResultAccountType)initWithSelectedResultAccountType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASSelectedResultAccountType;
  result = [(ICASSelectedResultAccountType *)&v5 init];
  if (result) {
    result->_selectedResultAccountType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASSelectedResultAccountType *)self selectedResultAccountType];
  if ((unint64_t)(v3 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_1E64B9068[v3 - 1];
  }
}

- (int64_t)selectedResultAccountType
{
  return self->_selectedResultAccountType;
}

@end