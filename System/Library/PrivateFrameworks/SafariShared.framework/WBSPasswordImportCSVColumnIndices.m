@interface WBSPasswordImportCSVColumnIndices
- (WBSPasswordImportCSVColumnIndices)initWithURLIndex:(unint64_t)a3 usernameIndex:(unint64_t)a4 passwordIndex:(unint64_t)a5;
- (WBSPasswordImportCSVColumnIndices)initWithURLIndex:(unint64_t)a3 usernameIndex:(unint64_t)a4 passwordIndex:(unint64_t)a5 sidecarDataIndices:(id)a6;
- (unint64_t)notesEntryIndex;
- (unint64_t)otpAuthURLIndex;
- (unint64_t)passwordIndex;
- (unint64_t)titleIndex;
- (unint64_t)urlIndex;
- (unint64_t)usernameIndex;
@end

@implementation WBSPasswordImportCSVColumnIndices

- (WBSPasswordImportCSVColumnIndices)initWithURLIndex:(unint64_t)a3 usernameIndex:(unint64_t)a4 passwordIndex:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordImportCSVColumnIndices;
  v8 = [(WBSPasswordImportCSVColumnIndices *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_urlIndex = a3;
    v8->_usernameIndex = a4;
    v8->_passwordIndex = a5;
    *(int64x2_t *)&v8->_otpAuthURLIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v8->_titleIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10 = v8;
  }

  return v9;
}

- (WBSPasswordImportCSVColumnIndices)initWithURLIndex:(unint64_t)a3 usernameIndex:(unint64_t)a4 passwordIndex:(unint64_t)a5 sidecarDataIndices:(id)a6
{
  id v10 = a6;
  v11 = [(WBSPasswordImportCSVColumnIndices *)self initWithURLIndex:a3 usernameIndex:a4 passwordIndex:a5];
  if (v11)
  {
    objc_super v12 = [v10 objectForKeyedSubscript:@"otpAuthURLIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = [v12 unsignedIntegerValue];
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v11->_otpAuthURLIndex = v13;
    v14 = [v10 objectForKeyedSubscript:@"notesEntryIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = [v14 unsignedIntegerValue];
    }
    else {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v11->_notesEntryIndex = v15;
    v16 = [v10 objectForKeyedSubscript:@"titleIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = [v16 unsignedIntegerValue];
    }
    else {
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v11->_titleIndex = v17;
    v18 = v11;
  }
  return v11;
}

- (unint64_t)urlIndex
{
  return self->_urlIndex;
}

- (unint64_t)usernameIndex
{
  return self->_usernameIndex;
}

- (unint64_t)passwordIndex
{
  return self->_passwordIndex;
}

- (unint64_t)otpAuthURLIndex
{
  return self->_otpAuthURLIndex;
}

- (unint64_t)notesEntryIndex
{
  return self->_notesEntryIndex;
}

- (unint64_t)titleIndex
{
  return self->_titleIndex;
}

@end