@interface VFXTransaction
+ (BOOL)disableActions;
+ (BOOL)immediateMode;
+ (BOOL)setImmediateMode:(BOOL)a3;
+ (VFXTimingFunction)timingFunction;
+ (__CFXWorld)immediateModeRestrictedContext;
+ (double)animationDuration;
+ (id)animationTimingFunction;
+ (id)valueForKey:(id)a3;
+ (uint64_t)completionBlock;
+ (uint64_t)lock;
+ (uint64_t)unlock;
+ (unsigned)currentState;
+ (void)begin;
+ (void)checkUncommittedTransactions;
+ (void)commit;
+ (void)commitImmediate;
+ (void)enqueueCommandForObject:(id)a3 immediateTransactionBlock:(id)a4;
+ (void)flush;
+ (void)performPresentationObjectQueriesInWorld:(id)a3 usingBlock:(id)a4;
+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 applyBlock:(id)a5;
+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 key:(id)a5 subscriptIndex:(unint64_t)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8;
+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 key:(id)a5 subscriptKey:(id)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8;
+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 keyPath:(id)a5 applyBlock:(id)a6;
+ (void)setAnimationDuration:(double)a1;
+ (void)setAnimationTimingFunction:(id)a3;
+ (void)setCompletionBlock:(id)a3;
+ (void)setCurrentThreadImmediateMode:(BOOL)a3;
+ (void)setDisableActions:(BOOL)a3;
+ (void)setImmediateModeRestrictedContext:(__CFXWorld *)a3;
+ (void)setTimingFunction:(id)a3;
+ (void)setValue:(id)a3 forKey:(id)a4;
- (BOOL)disableActions;
- (double)animationDuration;
- (id)animationTimingFunction;
- (void)begin;
- (void)commit;
- (void)flush;
- (void)lock;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationTimingFunction:(id)a3;
- (void)setDisableActions:(BOOL)a3;
- (void)unlock;
@end

@implementation VFXTransaction

+ (uint64_t)lock
{
  return pthread_mutex_lock(&stru_1EB97D908);
}

+ (uint64_t)unlock
{
  return pthread_mutex_unlock(&stru_1EB97D908);
}

+ (void)checkUncommittedTransactions
{
  v0 = (CFArrayRef *)sub_1B638F554();
  CFIndex Count = CFArrayGetCount(v0[2]);
  CFIndex v8 = Count;
  if (Count < 2)
  {
    if (Count == 1) {
      return;
    }
  }
  else
  {
    sub_1B63F2F54(16, @"Error: Unflushed transaction present.", v2, v3, v4, v5, v6, v7, v9);
    if (*((double *)CFArrayGetValueAtIndex(v0[2], v8 - 1) + 5) == 0.0) {
      sub_1B63F2F54(16, @"Error: Transaction stack contains an uncommited transaction.", v2, v3, v4, v5, v6, v7, v10);
    }
  }
  sub_1B63F2F54(17, @"Assertion '%s' failed. Unflushed transaction present.", v2, v3, v4, v5, v6, v7, (uint64_t)"(count == 1)");
}

+ (void)begin
{
}

+ (void)flush
{
}

+ (uint64_t)completionBlock
{
  return *((void *)sub_1B65C2494() + 10);
}

+ (void)setAnimationDuration:(double)a1
{
  CFIndex v8 = (double *)sub_1B65C2494();
  if ((*((unsigned char *)v8 + 60) & 2) != 0) {
    sub_1B63F2F54(16, @"Error: modifying duration of implicit transaction. Missing transaction begin?", v2, v3, v4, v5, v6, v7, v9);
  }
  v8[4] = a1;
}

+ (BOOL)disableActions
{
  return *((double *)sub_1B65C2494() + 4) == 0.0;
}

+ (double)animationDuration
{
  return *((double *)sub_1B65C2494() + 4);
}

+ (void)commit
{
}

+ (void)commitImmediate
{
}

+ (VFXTimingFunction)timingFunction
{
  result = (VFXTimingFunction *)sub_1B65C33B0();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [VFXTimingFunction alloc];
    uint64_t v7 = objc_msgSend_initWithTimingFunctionRef_(v4, v5, (uint64_t)v3, v6);
    return (VFXTimingFunction *)v7;
  }
  return result;
}

+ (void)setTimingFunction:(id)a3
{
  uint64_t v4 = (const void *)objc_msgSend_cfxTimingFunction(a3, a2, (uint64_t)a3, v3);

  sub_1B65C3340(v4);
}

+ (id)animationTimingFunction
{
  id result = (id)sub_1B65C33B0();
  if (result)
  {
    return (id)sub_1B64BA118((uint64_t)result, v3, v4, v5, v6, v7, v8, v9);
  }
  return result;
}

+ (void)setAnimationTimingFunction:(id)a3
{
  id v3 = sub_1B64BA090(a3, a2);

  sub_1B65C3340(v3);
}

+ (void)setDisableActions:(BOOL)a3
{
}

+ (void)setCompletionBlock:(id)a3
{
}

+ (id)valueForKey:(id)a3
{
  return sub_1B65C3204(a3);
}

+ (void)setValue:(id)a3 forKey:(id)a4
{
}

+ (BOOL)setImmediateMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = sub_1B65C2494();
  char v5 = sub_1B65C3488((uint64_t)v4);
  sub_1B65C3410(v3);
  return v5;
}

+ (BOOL)immediateMode
{
  uint64_t v2 = sub_1B65C2494();
  if (sub_1B65C3488((uint64_t)v2)) {
    return 1;
  }

  return sub_1B65C33F4();
}

+ (void)setImmediateModeRestrictedContext:(__CFXWorld *)a3
{
}

+ (__CFXWorld)immediateModeRestrictedContext
{
  uint64_t v2 = sub_1B65C2494();

  return (__CFXWorld *)sub_1B63C4588((uint64_t)v2);
}

+ (void)setCurrentThreadImmediateMode:(BOOL)a3
{
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 applyBlock:(id)a5
{
  uint64_t v8 = sub_1B65C2494();
  if (a3)
  {
LABEL_4:
    if (sub_1B65C3494((uint64_t)v8, (id *)a3))
    {
      if (a3)
      {
        sub_1B64B0C28((uint64_t)a3, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
        (*((void (**)(id, double))a5 + 2))(a5, 0.0);
        sub_1B64B0CB4((uint64_t)a3, v24, v25, v26, v27, v28, v29, v30);
        return;
      }
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  if (sub_1B6583B18(a4))
  {
    a3 = (__CFXWorld *)sub_1B63F4F54(a4, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_4;
  }
  a3 = 0;
  if (sub_1B65C3494((uint64_t)v8, 0))
  {
LABEL_10:
    v31 = (void (*)(id, __n128))*((void *)a5 + 2);
    v23.n128_u64[0] = 0;
    v31(a5, v23);
    return;
  }
LABEL_13:
  uint64_t v32 = objc_msgSend___CFObject(a4, v16, v17, v18);

  sub_1B65C3794(v8, a3, a4, v32, 0, a5, v33, v34);
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 keyPath:(id)a5 applyBlock:(id)a6
{
  uint64_t v10 = sub_1B65C2494();
  if (!a3)
  {
    if (sub_1B6583B18(a4)) {
      a3 = (__CFXWorld *)sub_1B63F4F54(a4, v11, v12, v13, v14, v15, v16, v17);
    }
    else {
      a3 = 0;
    }
  }
  int v18 = sub_1B65C3494((uint64_t)v10, (id *)a3);
  uint64_t v22 = objc_msgSend___CFObject(a4, v19, v20, v21);
  if (v18)
  {
    sub_1B65C2B8C((uint64_t)a3, v22, (const __CFString *)a5, (uint64_t)v10, (uint64_t)a6, v25);
  }
  else
  {
    sub_1B65C3794(v10, a3, a4, (uint64_t)v22, a5, a6, v23, v24);
  }
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 key:(id)a5 subscriptIndex:(unint64_t)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  uint64_t v14 = sub_1B65C2494();
  if (!a3)
  {
    if (sub_1B6583B18(a4)) {
      a3 = (__CFXWorld *)sub_1B63F4F54(a4, v15, v16, v17, v18, v19, v20, v21);
    }
    else {
      a3 = 0;
    }
  }
  int v22 = sub_1B65C3494((uint64_t)v14, (id *)a3);
  uint64_t v26 = objc_msgSend___CFObject(a4, v23, v24, v25);
  if (v22)
  {
    sub_1B65C2C78((uint64_t)a3, v26, (const __CFString *)a5, a6, (uint64_t)v14, (uint64_t)a8, v29);
  }
  else
  {
    sub_1B65C3794(v14, a3, a4, (uint64_t)v26, a7, a8, v27, v28);
  }
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 key:(id)a5 subscriptKey:(id)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  uint64_t v14 = sub_1B65C2494();
  if (!a3)
  {
    if (sub_1B6583B18(a4)) {
      a3 = (__CFXWorld *)sub_1B63F4F54(a4, v15, v16, v17, v18, v19, v20, v21);
    }
    else {
      a3 = 0;
    }
  }
  int v22 = sub_1B65C3494((uint64_t)v14, (id *)a3);
  uint64_t v26 = objc_msgSend___CFObject(a4, v23, v24, v25);
  if (v22)
  {
    sub_1B65C2D7C((uint64_t)a3, v26, (const __CFString *)a5, a6, (uint64_t)v14, (uint64_t)a8, v29);
  }
  else
  {
    sub_1B65C3794(v14, a3, a4, (uint64_t)v26, a7, a8, v27, v28);
  }
}

+ (void)enqueueCommandForObject:(id)a3 immediateTransactionBlock:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a3 = (id)objc_msgSend_world(a3, v8, v9, v10);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v21 = objc_msgSend_worldRef(a3, v11, v12, v13);
    if (!v21) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v15, v16, v17, v18, v19, v20, (uint64_t)"worldRef");
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1B65C4950;
    v30[3] = &unk_1E6144E88;
    v30[4] = a4;
    v30[5] = a2;
    objc_msgSend_postCommandWithContext_object_applyBlock_(a1, v14, v21, (uint64_t)a3, v30);
  }
  else
  {
    int v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    sub_1B63F2F54(16, @"Unreachable code: Unsupported class %@", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
  }
}

+ (void)performPresentationObjectQueriesInWorld:(id)a3 usingBlock:(id)a4
{
  uint64_t v5 = objc_msgSend_worldRef(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v21 = v5;
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v21);
    sub_1B64B0CB4(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v21);
  }
}

+ (unsigned)currentState
{
  return sub_1B65C3540();
}

- (void)begin
{
  objc_msgSend_begin(VFXTransaction, a2, v2, v3);
}

- (void)commit
{
  objc_msgSend_commit(VFXTransaction, a2, v2, v3);
}

- (void)flush
{
  objc_msgSend_flush(VFXTransaction, a2, v2, v3);
}

- (void)lock
{
  objc_msgSend_lock(VFXTransaction, a2, v2, v3);
}

- (void)unlock
{
  objc_msgSend_unlock(VFXTransaction, a2, v2, v3);
}

- (void)setAnimationDuration:(double)a3
{
  objc_msgSend_setAnimationDuration_(VFXTransaction, a2, v3, v4, a3);
}

- (double)animationDuration
{
  objc_msgSend_animationDuration(VFXTransaction, a2, v2, v3);
  return result;
}

- (void)setDisableActions:(BOOL)a3
{
}

- (BOOL)disableActions
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(VFXTransaction, sel_disableActions);
}

- (void)setAnimationTimingFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a3 = (id)objc_msgSend_functionWithName_(MEMORY[0x1E4F39C10], v4, (uint64_t)a3, v5);
  }

  MEMORY[0x1F4181798](VFXTransaction, sel_setAnimationTimingFunction_, a3, v5);
}

- (id)animationTimingFunction
{
  return 0;
}

@end