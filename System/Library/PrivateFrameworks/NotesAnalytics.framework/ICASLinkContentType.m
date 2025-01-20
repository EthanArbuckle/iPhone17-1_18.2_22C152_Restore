@interface ICASLinkContentType
- (ICASLinkContentType)initWithLinkContentType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)linkContentType;
@end

@implementation ICASLinkContentType

- (ICASLinkContentType)initWithLinkContentType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASLinkContentType;
  result = [(ICASLinkContentType *)&v5 init];
  if (result) {
    result->_linkContentType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASLinkContentType *)self linkContentType];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_1E64B89E0[v3 - 1];
  }
}

- (int64_t)linkContentType
{
  return self->_linkContentType;
}

@end