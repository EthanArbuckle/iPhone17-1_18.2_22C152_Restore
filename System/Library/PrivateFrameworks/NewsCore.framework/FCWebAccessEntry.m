@interface FCWebAccessEntry
- (NSDate)lastRetryAttemptTime;
- (NSString)email;
- (NSString)purchaseID;
- (NSString)purchaseReceipt;
- (void)initWithEntryID:(void *)a3 tagID:(void *)a4 purchaseID:(void *)a5 lastRetryAttemptTime:(void *)a6 email:(void *)a7 purchaseReceipt:;
@end

@implementation FCWebAccessEntry

- (void)initWithEntryID:(void *)a3 tagID:(void *)a4 purchaseID:(void *)a5 lastRetryAttemptTime:(void *)a6 email:(void *)a7 purchaseReceipt:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!a1) {
    goto LABEL_12;
  }
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)[[NSString alloc] initWithFormat:@"web access entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:]";
    __int16 v38 = 2080;
    v39 = "FCPurchaseController.m";
    __int16 v40 = 1024;
    int v41 = 1805;
    __int16 v42 = 2114;
    v43 = v33;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v14)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)[[NSString alloc] initWithFormat:@"web access entry must have an tag ID"];
        *(_DWORD *)buf = 136315906;
        v37 = "-[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:]";
        __int16 v38 = 2080;
        v39 = "FCPurchaseController.m";
        __int16 v40 = 1024;
        int v41 = 1806;
        __int16 v42 = 2114;
        v43 = v34;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v14)
  {
    goto LABEL_5;
  }
  v35.receiver = a1;
  v35.super_class = (Class)FCWebAccessEntry;
  v19 = objc_msgSendSuper2(&v35, sel_init);
  a1 = v19;
  if (v19)
  {
    if (v13)
    {
      uint64_t v20 = [v13 copy];
      v21 = (void *)a1[5];
      a1[5] = v20;

      uint64_t v22 = [v14 copy];
      v23 = (void *)a1[6];
      a1[6] = v22;

      uint64_t v24 = [v15 copy];
      v25 = (void *)a1[2];
      a1[2] = v24;

      uint64_t v26 = [v16 copy];
      v27 = (void *)a1[4];
      a1[4] = v26;

      uint64_t v28 = [v17 copy];
      v29 = (void *)a1[1];
      a1[1] = v28;

      uint64_t v30 = [v18 copy];
      v31 = (void *)a1[3];
      a1[3] = v30;
    }
    else
    {
      v31 = v19;
      a1 = 0;
    }
  }
LABEL_12:

  return a1;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (NSString)purchaseReceipt
{
  return self->_purchaseReceipt;
}

- (NSDate)lastRetryAttemptTime
{
  return self->_lastRetryAttemptTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lastRetryAttemptTime, 0);
  objc_storeStrong((id *)&self->_purchaseReceipt, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end