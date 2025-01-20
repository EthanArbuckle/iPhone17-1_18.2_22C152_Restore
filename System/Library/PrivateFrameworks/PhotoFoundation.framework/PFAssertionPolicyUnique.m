@interface PFAssertionPolicyUnique
- (PFAssertionPolicyUnique)init;
- (void)notifyAssertion:(id)a3;
@end

@implementation PFAssertionPolicyUnique

- (void).cxx_destruct
{
}

- (void)notifyAssertion:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  v6 = [v4 fileName];
  v7 = [v5 stringWithFormat:@"%@:%lu", v6, objc_msgSend(v4, "lineNumber")];

  v8 = self;
  objc_sync_enter(v8);
  if (([(NSMutableSet *)v8->_signatures containsObject:v7] & 1) == 0)
  {
    [(NSMutableSet *)v8->_signatures addObject:v7];
    v9.receiver = v8;
    v9.super_class = (Class)PFAssertionPolicyUnique;
    [(PFAssertionPolicyComposite *)&v9 notifyAssertion:v4];
  }
  objc_sync_exit(v8);
}

- (PFAssertionPolicyUnique)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFAssertionPolicyUnique;
  v2 = [(PFAssertionPolicyComposite *)&v6 init];
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  signatures = v2->_signatures;
  v2->_signatures = v3;

  return v2;
}

@end