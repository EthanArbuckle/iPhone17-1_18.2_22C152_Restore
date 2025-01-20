@interface ICASAccountType
- (ICASAccountType)initWithAccountType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)accountType;
@end

@implementation ICASAccountType

- (ICASAccountType)initWithAccountType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASAccountType;
  result = [(ICASAccountType *)&v5 init];
  if (result) {
    result->_accountType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASAccountType *)self accountType];
  if ((unint64_t)(v3 - 1) > 0xC) {
    return @"unknown";
  }
  else {
    return off_1E64B9300[v3 - 1];
  }
}

- (int64_t)accountType
{
  return self->_accountType;
}

@end