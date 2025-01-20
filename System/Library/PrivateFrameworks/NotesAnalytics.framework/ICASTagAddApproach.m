@interface ICASTagAddApproach
- (ICASTagAddApproach)initWithTagAddApproach:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)tagAddApproach;
@end

@implementation ICASTagAddApproach

- (ICASTagAddApproach)initWithTagAddApproach:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASTagAddApproach;
  result = [(ICASTagAddApproach *)&v5 init];
  if (result) {
    result->_tagAddApproach = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASTagAddApproach *)self tagAddApproach];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8FF8[v3 - 1];
  }
}

- (int64_t)tagAddApproach
{
  return self->_tagAddApproach;
}

@end