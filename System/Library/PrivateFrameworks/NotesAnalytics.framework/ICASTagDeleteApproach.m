@interface ICASTagDeleteApproach
- (ICASTagDeleteApproach)initWithTagDeleteApproach:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)tagDeleteApproach;
@end

@implementation ICASTagDeleteApproach

- (ICASTagDeleteApproach)initWithTagDeleteApproach:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASTagDeleteApproach;
  result = [(ICASTagDeleteApproach *)&v5 init];
  if (result) {
    result->_tagDeleteApproach = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASTagDeleteApproach *)self tagDeleteApproach];
  if ((unint64_t)(v3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return *(&off_1E64B90C0 + v3 - 1);
  }
}

- (int64_t)tagDeleteApproach
{
  return self->_tagDeleteApproach;
}

@end