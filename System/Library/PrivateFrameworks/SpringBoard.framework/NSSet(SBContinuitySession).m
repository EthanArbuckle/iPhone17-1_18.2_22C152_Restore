@interface NSSet(SBContinuitySession)
- (id)sb_setByRemovingReason:()SBContinuitySession;
@end

@implementation NSSet(SBContinuitySession)

- (id)sb_setByRemovingReason:()SBContinuitySession
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NSSet_SBContinuitySession__sb_setByRemovingReason___block_invoke;
  v8[3] = &unk_1E6AF4A20;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "bs_filter:", v8);

  return v6;
}

@end