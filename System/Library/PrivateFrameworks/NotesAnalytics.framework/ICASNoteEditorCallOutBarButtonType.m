@interface ICASNoteEditorCallOutBarButtonType
- (ICASNoteEditorCallOutBarButtonType)initWithNoteEditorCallOutBarButtonType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)noteEditorCallOutBarButtonType;
@end

@implementation ICASNoteEditorCallOutBarButtonType

- (ICASNoteEditorCallOutBarButtonType)initWithNoteEditorCallOutBarButtonType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASNoteEditorCallOutBarButtonType;
  result = [(ICASNoteEditorCallOutBarButtonType *)&v5 init];
  if (result) {
    result->_noteEditorCallOutBarButtonType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASNoteEditorCallOutBarButtonType *)self noteEditorCallOutBarButtonType];
  if ((unint64_t)(v3 - 1) > 0xD) {
    return @"unknown";
  }
  else {
    return off_1E64B98F8[v3 - 1];
  }
}

- (int64_t)noteEditorCallOutBarButtonType
{
  return self->_noteEditorCallOutBarButtonType;
}

@end