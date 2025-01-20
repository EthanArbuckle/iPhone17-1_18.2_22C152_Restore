@interface MCDeleteInput
- (BOOL)canComposeNew:(id)a3;
- (BOOL)deleteBySyllable;
- (BOOL)shouldDeleteAcceptCandidateInput;
- (MCDeleteInput)init;
- (MCDeleteInput)initWithDeletedText:(id)a3 deleteBySyllable:(BOOL)a4 shouldDeleteAcceptCandidateInput:(BOOL)a5;
- (NSString)deletedText;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MCDeleteInput

- (void).cxx_destruct
{
}

- (BOOL)shouldDeleteAcceptCandidateInput
{
  return self->_shouldDeleteAcceptCandidateInput;
}

- (BOOL)deleteBySyllable
{
  return self->_deleteBySyllable;
}

- (NSString)deletedText
{
  return self->_deletedText;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCDeleteInput;
  v5 = -[MCKeyboardInput copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_deletedText copyWithZone:a3];
    v7 = (void *)v5[5];
    v5[5] = v6;

    *((unsigned char *)v5 + 32) = self->_deleteBySyllable;
    *((unsigned char *)v5 + 33) = self->_shouldDeleteAcceptCandidateInput;
  }
  return v5;
}

- (MCDeleteInput)initWithDeletedText:(id)a3 deleteBySyllable:(BOOL)a4 shouldDeleteAcceptCandidateInput:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCDeleteInput;
  v10 = [(MCKeyboardInput *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_deletedText, a3);
    v11->_deleteBySyllable = a4;
    v11->_shouldDeleteAcceptCandidateInput = a5;
  }

  return v11;
}

- (MCDeleteInput)init
{
  return [(MCDeleteInput *)self initWithDeletedText:0 deleteBySyllable:0 shouldDeleteAcceptCandidateInput:0];
}

@end