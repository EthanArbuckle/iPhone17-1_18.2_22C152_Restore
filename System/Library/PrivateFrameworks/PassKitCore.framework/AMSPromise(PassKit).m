@interface AMSPromise(PassKit)
- (void)pk_addQueue:()PassKit finishBlock:;
@end

@implementation AMSPromise(PassKit)

- (void)pk_addQueue:()PassKit finishBlock:
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__AMSPromise_PassKit__pk_addQueue_finishBlock___block_invoke;
  v10[3] = &unk_1E56E59F0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 addFinishBlock:v10];
}

@end