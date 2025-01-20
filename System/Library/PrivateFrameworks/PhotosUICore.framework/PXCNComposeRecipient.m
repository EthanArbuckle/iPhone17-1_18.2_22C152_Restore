@interface PXCNComposeRecipient
- (CNComposeRecipient)recipient;
- (PXCNComposeRecipient)initWithContact:(id)a3 address:(id)a4 nameComponents:(id)a5 recipientKind:(int64_t)a6;
- (PXCNComposeRecipient)initWithRecipient:(id)a3;
- (id)description;
@end

@implementation PXCNComposeRecipient

- (void).cxx_destruct
{
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ recipient: %@>", objc_opt_class(), self->_recipient];
}

- (PXCNComposeRecipient)initWithRecipient:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 kind];
  if (v6) {
    uint64_t v7 = 2 * (v6 == 1);
  }
  else {
    uint64_t v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = v6;
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Unsupported address kind: %lu", buf, 0xCu);
    }
  }
  v10 = [v5 contact];
  v11 = [v5 address];
  v14.receiver = self;
  v14.super_class = (Class)PXCNComposeRecipient;
  v12 = [(PXRecipient *)&v14 initWithContact:v10 address:v11 nameComponents:0 recipientKind:v7];

  if (v12) {
    objc_storeStrong((id *)&v12->_recipient, a3);
  }

  return v12;
}

- (PXCNComposeRecipient)initWithContact:(id)a3 address:(id)a4 nameComponents:(id)a5 recipientKind:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCNComposeRecipient.m", 22, @"%s is not available as initializer", "-[PXCNComposeRecipient initWithContact:address:nameComponents:recipientKind:]");

  abort();
}

@end