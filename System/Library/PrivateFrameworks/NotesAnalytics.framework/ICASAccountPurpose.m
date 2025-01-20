@interface ICASAccountPurpose
- (ICASAccountPurpose)initWithAccountPurpose:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)accountPurpose;
@end

@implementation ICASAccountPurpose

- (ICASAccountPurpose)initWithAccountPurpose:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASAccountPurpose;
  result = [(ICASAccountPurpose *)&v5 init];
  if (result) {
    result->_accountPurpose = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASAccountPurpose *)self accountPurpose];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8A28[v3 - 1];
  }
}

- (int64_t)accountPurpose
{
  return self->_accountPurpose;
}

@end