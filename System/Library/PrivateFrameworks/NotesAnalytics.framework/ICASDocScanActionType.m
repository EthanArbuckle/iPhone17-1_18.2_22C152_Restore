@interface ICASDocScanActionType
- (ICASDocScanActionType)initWithDocScanActionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)docScanActionType;
@end

@implementation ICASDocScanActionType

- (ICASDocScanActionType)initWithDocScanActionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASDocScanActionType;
  result = [(ICASDocScanActionType *)&v5 init];
  if (result) {
    result->_docScanActionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASDocScanActionType *)self docScanActionType];
  if ((unint64_t)(v3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E64B9368[v3 - 1];
  }
}

- (int64_t)docScanActionType
{
  return self->_docScanActionType;
}

@end