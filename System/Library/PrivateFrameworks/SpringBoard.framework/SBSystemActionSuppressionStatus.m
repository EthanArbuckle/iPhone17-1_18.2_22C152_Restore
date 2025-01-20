@interface SBSystemActionSuppressionStatus
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initWithState:(void *)a3 metrics:;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBSystemActionSuppressionStatus

- (id)initWithState:(void *)a3 metrics:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)SBSystemActionSuppressionStatus;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSystemActionSuppressionStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_state == v5->_state)
  {
    char v6 = BSEqualDictionaries();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBSystemActionSuppressionStatus_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __64__SBSystemActionSuppressionStatus_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSBSystemActionSuppressionState(*(void *)(*(void *)(a1 + 40) + 8));
  id v4 = (id)[v2 appendObject:v3 withName:@"state"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"metrics"];
}

- (void).cxx_destruct
{
}

@end