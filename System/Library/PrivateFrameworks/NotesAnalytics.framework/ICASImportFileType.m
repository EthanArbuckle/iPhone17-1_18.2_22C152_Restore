@interface ICASImportFileType
- (ICASImportFileType)initWithImportFileType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)importFileType;
@end

@implementation ICASImportFileType

- (ICASImportFileType)initWithImportFileType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASImportFileType;
  result = [(ICASImportFileType *)&v5 init];
  if (result) {
    result->_importFileType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASImportFileType *)self importFileType];
  if ((unint64_t)(v3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E64B8E48[v3 - 1];
  }
}

- (int64_t)importFileType
{
  return self->_importFileType;
}

@end