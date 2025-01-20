@interface PXErrorRecoveryAttempter
- (NSArray)recoveryOptions;
- (int64_t)_alertActionStyleForRecoveryOptionAtIndex:(unint64_t)a3;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7;
- (void)setRecoveryOptions:(id)a3;
@end

@implementation PXErrorRecoveryAttempter

- (void).cxx_destruct
{
}

- (void)setRecoveryOptions:(id)a3
{
}

- (NSArray)recoveryOptions
{
  return self->_recoveryOptions;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7
{
  id v12 = a5;
  id v13 = a3;
  v14 = [(PXErrorRecoveryAttempter *)self recoveryOptions];
  v15 = [v14 objectAtIndexedSubscript:a4];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__PXErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke;
  v17[3] = &unk_1E5DB9C88;
  id v18 = v12;
  SEL v19 = a6;
  v20 = a7;
  id v16 = v12;
  [v15 _attemptRecoveryFromError:v13 completionHandler:v17];
}

id __105__PXErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke(void *a1, uint64_t a2)
{
  id result = (id)a1[4];
  if (result)
  {
    v5 = (const char *)a1[5];
    if (v5) {
      return objc_msgSend(result, v5, a2, a1[6]);
    }
  }
  return result;
}

- (int64_t)_alertActionStyleForRecoveryOptionAtIndex:(unint64_t)a3
{
  v4 = [(PXErrorRecoveryAttempter *)self recoveryOptions];
  v5 = [v4 objectAtIndex:a3];

  uint64_t v6 = [v5 style];
  if (v6 == 2) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = v6 == 1;
  }

  return v7;
}

@end