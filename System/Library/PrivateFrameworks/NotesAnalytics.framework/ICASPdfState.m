@interface ICASPdfState
- (ICASPdfState)initWithPdfState:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)pdfState;
@end

@implementation ICASPdfState

- (ICASPdfState)initWithPdfState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASPdfState;
  result = [(ICASPdfState *)&v5 init];
  if (result) {
    result->_pdfState = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASPdfState *)self pdfState];
  if ((unint64_t)(v3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return *(&off_1E64B9138 + v3 - 1);
  }
}

- (int64_t)pdfState
{
  return self->_pdfState;
}

@end