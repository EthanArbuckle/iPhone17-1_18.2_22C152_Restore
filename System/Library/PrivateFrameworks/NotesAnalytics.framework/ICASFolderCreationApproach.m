@interface ICASFolderCreationApproach
- (ICASFolderCreationApproach)initWithFolderCreationApproach:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)folderCreationApproach;
@end

@implementation ICASFolderCreationApproach

- (ICASFolderCreationApproach)initWithFolderCreationApproach:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASFolderCreationApproach;
  result = [(ICASFolderCreationApproach *)&v5 init];
  if (result) {
    result->_folderCreationApproach = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASFolderCreationApproach *)self folderCreationApproach];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"folderAffordance";
  }
  if (v3 == 2) {
    return @"tagBrowser";
  }
  else {
    return v4;
  }
}

- (int64_t)folderCreationApproach
{
  return self->_folderCreationApproach;
}

@end