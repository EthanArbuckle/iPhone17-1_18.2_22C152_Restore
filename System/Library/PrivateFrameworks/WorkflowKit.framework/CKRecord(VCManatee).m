@interface CKRecord(VCManatee)
- (id)wf_decryptedStringForKey:()VCManatee;
@end

@implementation CKRecord(VCManatee)

- (id)wf_decryptedStringForKey:()VCManatee
{
  id v4 = a3;
  if (v4
    && ([a1 encryptedValuesByKey],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v4],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end