@interface ICASStyleType
- (ICASStyleType)initWithStyleType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)styleType;
@end

@implementation ICASStyleType

- (ICASStyleType)initWithStyleType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASStyleType;
  result = [(ICASStyleType *)&v5 init];
  if (result) {
    result->_styleType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASStyleType *)self styleType];
  if ((unint64_t)(v3 - 1) > 0xF) {
    return @"unknown";
  }
  else {
    return off_1E64B8EB8[v3 - 1];
  }
}

- (int64_t)styleType
{
  return self->_styleType;
}

@end