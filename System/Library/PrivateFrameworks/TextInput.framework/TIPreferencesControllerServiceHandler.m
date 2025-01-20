@interface TIPreferencesControllerServiceHandler
- (BOOL)respondsToSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation TIPreferencesControllerServiceHandler

- (BOOL)respondsToSelector:(SEL)a3
{
  v5 = &unk_1EDC4A120;
  BOOL v6 = 1;
  if (!(unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIPreferencesControllerServiceHandler;
    BOOL v6 = [(TIPreferencesControllerServiceHandler *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = &unk_1EDC4A120;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    BOOL v6 = +[TIPreferencesController sharedPreferencesController];
    v7 = [v6 methodSignatureForSelector:a3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIPreferencesControllerServiceHandler;
    v7 = [(TIPreferencesControllerServiceHandler *)&v9 methodSignatureForSelector:a3];
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = &unk_1EDC4A120;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, (SEL)[v4 selector], 1, 1).name)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__TIPreferencesControllerServiceHandler_forwardInvocation___block_invoke;
    v6[3] = &unk_1E555A428;
    id v7 = v4;
    TIDispatchSync(MEMORY[0x1E4F14428], v6);
  }
  else
  {
    [v4 invokeWithTarget:self];
  }
}

void __59__TIPreferencesControllerServiceHandler_forwardInvocation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[TIPreferencesController sharedPreferencesController];
  [v1 invokeWithTarget:v2];
}

@end