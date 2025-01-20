@interface ICASDocScanStage
- (ICASDocScanStage)initWithDocScanStage:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)docScanStage;
@end

@implementation ICASDocScanStage

- (ICASDocScanStage)initWithDocScanStage:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASDocScanStage;
  result = [(ICASDocScanStage *)&v5 init];
  if (result) {
    result->_docScanStage = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASDocScanStage *)self docScanStage];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"initiate";
  }
  if (v3 == 2) {
    return @"complete";
  }
  else {
    return v4;
  }
}

- (int64_t)docScanStage
{
  return self->_docScanStage;
}

@end