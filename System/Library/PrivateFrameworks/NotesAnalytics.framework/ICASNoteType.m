@interface ICASNoteType
- (ICASNoteType)initWithNoteType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)noteType;
@end

@implementation ICASNoteType

- (ICASNoteType)initWithNoteType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASNoteType;
  result = [(ICASNoteType *)&v5 init];
  if (result) {
    result->_noteType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASNoteType *)self noteType];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"modern";
  }
  if (v3 == 2) {
    return @"html";
  }
  else {
    return v4;
  }
}

- (int64_t)noteType
{
  return self->_noteType;
}

@end