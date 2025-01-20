@interface ICASTagRenameApproach
- (ICASTagRenameApproach)initWithTagRenameApproach:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)tagRenameApproach;
@end

@implementation ICASTagRenameApproach

- (ICASTagRenameApproach)initWithTagRenameApproach:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASTagRenameApproach;
  result = [(ICASTagRenameApproach *)&v5 init];
  if (result) {
    result->_tagRenameApproach = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASTagRenameApproach *)self tagRenameApproach];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"inlineEdit";
  }
  if (v3 == 2) {
    return @"tagBrowserPressAndHold";
  }
  else {
    return v4;
  }
}

- (int64_t)tagRenameApproach
{
  return self->_tagRenameApproach;
}

@end