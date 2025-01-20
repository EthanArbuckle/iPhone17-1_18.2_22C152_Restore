@interface ICASNoteCreateApproach
- (ICASNoteCreateApproach)initWithNoteCreateApproach:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)noteCreateApproach;
@end

@implementation ICASNoteCreateApproach

- (ICASNoteCreateApproach)initWithNoteCreateApproach:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASNoteCreateApproach;
  result = [(ICASNoteCreateApproach *)&v5 init];
  if (result) {
    result->_noteCreateApproach = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASNoteCreateApproach *)self noteCreateApproach];
  if ((unint64_t)(v3 - 1) > 0x15) {
    return @"unknown";
  }
  else {
    return off_1E64B91E8[v3 - 1];
  }
}

- (int64_t)noteCreateApproach
{
  return self->_noteCreateApproach;
}

@end