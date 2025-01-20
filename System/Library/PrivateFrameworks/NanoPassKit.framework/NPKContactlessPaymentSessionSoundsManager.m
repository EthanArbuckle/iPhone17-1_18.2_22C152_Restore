@interface NPKContactlessPaymentSessionSoundsManager
- (void)contactlessPaymentSessionManager:(id)a3 didChangeSessionState:(id)a4;
- (void)didSelectPassFromField;
@end

@implementation NPKContactlessPaymentSessionSoundsManager

- (void)didSelectPassFromField
{
}

- (void)contactlessPaymentSessionManager:(id)a3 didChangeSessionState:(id)a4
{
  id v29 = a4;
  if (NPKDoesSessionStateRepresentAuthorizationTimeoutForPassRequiringAuthorization(v29))
  {
    v4 = (void (**)(void *))&__block_literal_global_28;
LABEL_6:
    v6 = v29;
    goto LABEL_7;
  }
  unint64_t v5 = [v29 completionReason];
  if (v5 <= 0xA)
  {
    if (((1 << v5) & 0x770) != 0)
    {
      v4 = (void (**)(void *))&__block_literal_global_48;
      goto LABEL_6;
    }
    if (v5 == 3)
    {
      kdebug_trace();
      v7 = [v29 currentPass];
      v8 = [v7 paymentPass];
      char v9 = [v8 isAccessPass];

      if (v9)
      {
        v4 = (void (**)(void *))&__block_literal_global_50;
        goto LABEL_6;
      }
      v13 = [v29 currentPass];
      v14 = [v13 paymentPass];
      int v15 = [v14 isIdentityPass];

      v16 = (void (**)(void *))&__block_literal_global_54;
      v17 = (void (**)(void *))&__block_literal_global_52;
LABEL_21:
      if (v15) {
        v4 = v17;
      }
      else {
        v4 = v16;
      }
      goto LABEL_6;
    }
  }
  unint64_t v10 = [v29 failureType];
  if (v10 <= 0xB && ((1 << v10) & 0xFBE) != 0 && ![v29 userRejectedReleaseData])
  {
    v4 = (void (**)(void *))&__block_literal_global_56;
    goto LABEL_6;
  }
  v11 = [v29 transactionContext];
  char v12 = [v11 authenticationRequested];

  if (v12)
  {
    v4 = (void (**)(void *))&__block_literal_global_58_0;
    goto LABEL_6;
  }
  v18 = [v29 transactionContext];
  if ([v18 transactionType] != 5) {
    goto LABEL_30;
  }
  v19 = [v29 transactionContext];
  if ([v19 transactionStatus] != 1)
  {

LABEL_30:
    v6 = v29;
    goto LABEL_31;
  }
  v20 = [v29 transactionContext];
  uint64_t v21 = [v20 releaseDataStatus];

  v6 = v29;
  if (v21 != 1)
  {
LABEL_31:
    v22 = [v6 transactionContext];
    uint64_t v23 = [v22 transactionStatus];

    if (v23 != 2)
    {
      [v29 expressTransactionStatus];
      goto LABEL_9;
    }
    v24 = [v29 currentPass];
    v25 = [v24 paymentPass];
    char v26 = [v25 isAccessPass];

    if (v26)
    {
      v4 = (void (**)(void *))&__block_literal_global_62;
      goto LABEL_6;
    }
    v27 = [v29 currentPass];
    v28 = [v27 paymentPass];
    int v15 = [v28 isIdentityPass];

    v16 = (void (**)(void *))&__block_literal_global_66;
    v17 = (void (**)(void *))&__block_literal_global_64_1;
    goto LABEL_21;
  }
  v4 = (void (**)(void *))&__block_literal_global_60_0;
LABEL_7:
  if ([v6 expressTransactionStatus] != 5) {
    v4[2](v4);
  }
LABEL_9:
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke()
{
  return +[NPKAudioPlayer playSessionTimeoutHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_2()
{
  return +[NPKAudioPlayer playTransactionFailureHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_3()
{
  return +[NPKAudioPlayer playAccessScanCompleteHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_4()
{
  return +[NPKAudioPlayer playIdentityReaderConnectionCompleteHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_5()
{
  return +[NPKAudioPlayer playTransactionSuccessHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_6()
{
  return +[NPKAudioPlayer playTransactionFailureHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_7()
{
  return +[NPKAudioPlayer playTransactionAuthenticationHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_8()
{
  return +[NPKAudioPlayer playIdentityReaderConnectionStartHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_9()
{
  return +[NPKAudioPlayer playAccessScanCompleteHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_10()
{
  return +[NPKAudioPlayer playIdentityReaderConnectionCompleteHaptic];
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_11()
{
  return +[NPKAudioPlayer playTransactionSuccessHaptic];
}

@end