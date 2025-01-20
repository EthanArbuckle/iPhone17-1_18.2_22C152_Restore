@interface ICASNotesToPagesContextPath
- (ICASNotesToPagesContextPath)initWithNotesToPagesContextPath:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)notesToPagesContextPath;
@end

@implementation ICASNotesToPagesContextPath

- (ICASNotesToPagesContextPath)initWithNotesToPagesContextPath:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASNotesToPagesContextPath;
  result = [(ICASNotesToPagesContextPath *)&v5 init];
  if (result) {
    result->_notesToPagesContextPath = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASNotesToPagesContextPath *)self notesToPagesContextPath];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B98E0[v3 - 1];
  }
}

- (int64_t)notesToPagesContextPath
{
  return self->_notesToPagesContextPath;
}

@end