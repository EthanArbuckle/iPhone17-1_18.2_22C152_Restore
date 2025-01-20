@interface ICASFolderLabelType
- (ICASFolderLabelType)initWithFolderLabelType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)folderLabelType;
@end

@implementation ICASFolderLabelType

- (ICASFolderLabelType)initWithFolderLabelType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASFolderLabelType;
  result = [(ICASFolderLabelType *)&v5 init];
  if (result) {
    result->_folderLabelType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASFolderLabelType *)self folderLabelType];
  if ((unint64_t)(v3 - 1) > 6) {
    return @"unknown";
  }
  else {
    return *(&off_1E64B90E8 + v3 - 1);
  }
}

- (int64_t)folderLabelType
{
  return self->_folderLabelType;
}

@end