@interface _SBModalViewControllerStackTransition
+ (_SBModalViewControllerStackTransition)transitionForViewController:(unint64_t)a3 operation:(BOOL)a4 animated:(void *)a5 completion:;
- (id)description;
- (uint64_t)setAnimated:(uint64_t)result;
- (uint64_t)setOperation:(uint64_t)result;
- (void)invokeCompletionIfNecessaryWithResult:(uint64_t)a1;
- (void)setCompletion:(void *)a1;
@end

@implementation _SBModalViewControllerStackTransition

+ (_SBModalViewControllerStackTransition)transitionForViewController:(unint64_t)a3 operation:(BOOL)a4 animated:(void *)a5 completion:
{
  id v8 = a5;
  id v9 = a2;
  self;
  v10 = objc_alloc_init(_SBModalViewControllerStackTransition);
  -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v10, v9);

  if (v10)
  {
    v10->_operation = a3;
    v10->_animated = a4;
    objc_setProperty_nonatomic_copy(v10, v11, v8, 32);
  }

  return v10;
}

- (uint64_t)setOperation:(uint64_t)result
{
  if (result) {
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setAnimated:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 24) = a2;
  }
  return result;
}

- (void)setCompletion:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_SBModalViewControllerStackTransition:%p - viewController: %@>", self, self->_viewController];
}

- (void)invokeCompletionIfNecessaryWithResult:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      (*(void (**)(void))(v2 + 16))();
      v3 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end