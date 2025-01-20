@interface ICASActionMenuUsageType
- (ICASActionMenuUsageType)initWithActionMenuUsageType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)actionMenuUsageType;
@end

@implementation ICASActionMenuUsageType

- (ICASActionMenuUsageType)initWithActionMenuUsageType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASActionMenuUsageType;
  result = [(ICASActionMenuUsageType *)&v5 init];
  if (result) {
    result->_actionMenuUsageType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASActionMenuUsageType *)self actionMenuUsageType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B93A8[v3 - 1];
  }
}

- (int64_t)actionMenuUsageType
{
  return self->_actionMenuUsageType;
}

@end