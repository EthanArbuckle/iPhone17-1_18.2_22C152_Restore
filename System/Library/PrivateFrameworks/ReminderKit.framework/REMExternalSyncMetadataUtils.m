@interface REMExternalSyncMetadataUtils
+ (BOOL)shouldUseExternalIdentifierAsDeletionKeyWithAccountType:(int64_t)a3;
+ (id)decodeExternalIdentifierForMarkedForDeletionObject:(id)a3;
+ (id)encodeExternalIdentifierForMarkedForDeletionObject:(id)a3;
@end

@implementation REMExternalSyncMetadataUtils

+ (id)encodeExternalIdentifierForMarkedForDeletionObject:(id)a3
{
  if (a3)
  {
    v3 = NSString;
    v4 = (void *)MEMORY[0x1E4F29128];
    id v5 = a3;
    v6 = [v4 UUID];
    v7 = [v6 UUIDString];
    v8 = [v3 stringWithFormat:@"%@%@%@", v5, @"-REMCDOBJECT_DELETED-", v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)decodeExternalIdentifierForMarkedForDeletionObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"-REMCDOBJECT_DELETED-"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 substringToIndex:v4];
  }
  v6 = v5;

  return v6;
}

+ (BOOL)shouldUseExternalIdentifierAsDeletionKeyWithAccountType:(int64_t)a3
{
  if (a3) {
    BOOL v3 = (unint64_t)(a3 - 3) >= 2;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

@end