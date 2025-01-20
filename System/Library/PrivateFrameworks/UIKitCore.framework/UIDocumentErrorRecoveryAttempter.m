@interface UIDocumentErrorRecoveryAttempter
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (BOOL)attemptSilentRecoveryFromError:(id)a3 error:(id *)a4;
- (UIDocumentErrorRecoveryAttempter)initWithDocument:(id)a3 silentRecoveryOptionIndex:(unint64_t)a4 appModalRecoveryAttempter:(id)a5 recoveryCanceler:(id)a6;
- (UIDocumentErrorRecoveryAttempter)initWithDocument:(id)a3 wrappedRecoveryAttempter:(id)a4;
- (void)cancelRecovery;
- (void)dealloc;
@end

@implementation UIDocumentErrorRecoveryAttempter

- (UIDocumentErrorRecoveryAttempter)initWithDocument:(id)a3 wrappedRecoveryAttempter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIDocumentErrorRecoveryAttempter;
  v9 = [(UIDocumentErrorRecoveryAttempter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong(&v10->_wrappedRecoveryAttempter, a4);
  }

  return v10;
}

- (UIDocumentErrorRecoveryAttempter)initWithDocument:(id)a3 silentRecoveryOptionIndex:(unint64_t)a4 appModalRecoveryAttempter:(id)a5 recoveryCanceler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UIDocumentErrorRecoveryAttempter;
  v14 = [(UIDocumentErrorRecoveryAttempter *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_document, a3);
    v15->_silentRecoveryOptionIndex = a4;
    uint64_t v16 = [v12 copy];
    id appModalRecoveryAttempter = v15->_appModalRecoveryAttempter;
    v15->_id appModalRecoveryAttempter = (id)v16;

    uint64_t v18 = [v13 copy];
    id recoveryCancelerOrNil = v15->_recoveryCancelerOrNil;
    v15->_id recoveryCancelerOrNil = (id)v18;
  }
  return v15;
}

- (void)dealloc
{
  if ((*(unsigned char *)&self->_errorRecoveryAttempterFlags & 1) == 0) {
    [(UIDocumentErrorRecoveryAttempter *)self cancelRecovery];
  }
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentErrorRecoveryAttempter;
  [(UIDocumentErrorRecoveryAttempter *)&v3 dealloc];
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v6 = a3;
  *(unsigned char *)&self->_errorRecoveryAttempterFlags |= 1u;
  id wrappedRecoveryAttempter = self->_wrappedRecoveryAttempter;
  if (wrappedRecoveryAttempter)
  {
    if ([wrappedRecoveryAttempter attemptRecoveryFromError:v6 optionIndex:a4])
    {
      continuerOrNil = (void (**)(void))self->_continuerOrNil;
      if (continuerOrNil) {
        continuerOrNil[2]();
      }
      char v9 = 1;
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = (*((uint64_t (**)(void))self->_appModalRecoveryAttempter + 2))();
  }

  return v9;
}

- (BOOL)attemptSilentRecoveryFromError:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  *(unsigned char *)&self->_errorRecoveryAttempterFlags |= 1u;
  if (self->_wrappedRecoveryAttempter)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [self->_wrappedRecoveryAttempter attemptSilentRecoveryFromError:v7 error:a4];
LABEL_9:
      BOOL v9 = v8;
      goto LABEL_10;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if (self->_silentRecoveryOptionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = (*((uint64_t (**)(void))self->_appModalRecoveryAttempter + 2))();
    goto LABEL_9;
  }
  if (!a4) {
    goto LABEL_7;
  }
  BOOL v9 = 0;
  *a4 = v6;
LABEL_10:

  return v9;
}

- (void)cancelRecovery
{
  if (self->_wrappedRecoveryAttempter)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id wrappedRecoveryAttempter = self->_wrappedRecoveryAttempter;
      [wrappedRecoveryAttempter cancelRecovery];
    }
  }
  else
  {
    id recoveryCancelerOrNil = self->_recoveryCancelerOrNil;
    if (recoveryCancelerOrNil)
    {
      v5 = (void (*)(void))*((void *)recoveryCancelerOrNil + 2);
      v5();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recoveryCancelerOrNil, 0);
  objc_storeStrong(&self->_appModalRecoveryAttempter, 0);
  objc_storeStrong(&self->_continuerOrNil, 0);
  objc_storeStrong(&self->_wrappedRecoveryAttempter, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end