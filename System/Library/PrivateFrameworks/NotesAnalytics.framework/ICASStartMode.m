@interface ICASStartMode
- (ICASStartMode)initWithStartMode:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)startMode;
@end

@implementation ICASStartMode

- (ICASStartMode)initWithStartMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASStartMode;
  result = [(ICASStartMode *)&v5 init];
  if (result) {
    result->_startMode = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASStartMode *)self startMode];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"v1";
  }
  if (v3 == 2) {
    return @"v2";
  }
  else {
    return v4;
  }
}

- (int64_t)startMode
{
  return self->_startMode;
}

@end