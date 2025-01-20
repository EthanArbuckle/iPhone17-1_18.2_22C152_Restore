@interface ICASLinkAddApproach
- (ICASLinkAddApproach)initWithLinkAddApproach:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)linkAddApproach;
@end

@implementation ICASLinkAddApproach

- (ICASLinkAddApproach)initWithLinkAddApproach:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASLinkAddApproach;
  result = [(ICASLinkAddApproach *)&v5 init];
  if (result) {
    result->_linkAddApproach = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASLinkAddApproach *)self linkAddApproach];
  if ((unint64_t)(v3 - 1) > 6) {
    return @"unknown";
  }
  else {
    return off_1E64B92C8[v3 - 1];
  }
}

- (int64_t)linkAddApproach
{
  return self->_linkAddApproach;
}

@end