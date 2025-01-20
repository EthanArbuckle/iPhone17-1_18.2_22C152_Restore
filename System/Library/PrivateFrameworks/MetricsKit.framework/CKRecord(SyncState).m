@interface CKRecord(SyncState)
- (id)mt_secretValue;
- (uint64_t)mt_isSynchronized;
- (void)mt_setSecretValue:()SyncState;
- (void)mt_setSynchronized:()SyncState;
@end

@implementation CKRecord(SyncState)

- (uint64_t)mt_isSynchronized
{
  v1 = objc_getAssociatedObject(a1, sel_mt_isSynchronized);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)mt_setSynchronized:()SyncState
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_mt_isSynchronized, v2, (void *)3);
}

- (id)mt_secretValue
{
  id v2 = objc_getAssociatedObject(a1, sel_mt_secretValue);
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [a1 encryptedValuesByKey];
    id v4 = [v5 objectForKeyedSubscript:@"secretValue"];
  }

  return v4;
}

- (void)mt_setSecretValue:()SyncState
{
  id value = a3;
  id v4 = [a1 encryptedValuesByKey];
  [v4 setObject:value forKeyedSubscript:@"secretValue"];

  objc_setAssociatedObject(a1, sel_mt_secretValue, value, (void *)3);
}

@end