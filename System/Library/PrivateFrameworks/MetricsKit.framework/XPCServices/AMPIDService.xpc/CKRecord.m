@interface CKRecord
- (BOOL)mt_isSynchronized;
- (NSString)mt_secretValue;
- (void)mt_setSecretValue:(id)a3;
- (void)mt_setSynchronized:(BOOL)a3;
@end

@implementation CKRecord

- (BOOL)mt_isSynchronized
{
  v2 = objc_getAssociatedObject(self, "mt_isSynchronized");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)mt_setSynchronized:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, "mt_isSynchronized", v4, (void *)3);
}

- (NSString)mt_secretValue
{
  unsigned __int8 v3 = objc_getAssociatedObject(self, "mt_secretValue");
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(CKRecord *)self encryptedValuesByKey];
    id v5 = [v6 objectForKeyedSubscript:@"secretValue"];
  }

  return (NSString *)v5;
}

- (void)mt_setSecretValue:(id)a3
{
  id value = a3;
  id v4 = [(CKRecord *)self encryptedValuesByKey];
  [v4 setObject:value forKeyedSubscript:@"secretValue"];

  objc_setAssociatedObject(self, "mt_secretValue", value, (void *)3);
}

@end