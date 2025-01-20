@interface UIViewServiceImplicitAnimationDecodingProxy
@end

@implementation UIViewServiceImplicitAnimationDecodingProxy

void __66___UIViewServiceImplicitAnimationDecodingProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __66___UIViewServiceImplicitAnimationDecodingProxy_forwardInvocation___block_invoke_2;
  v9 = &unk_1E52D9F98;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = v2;
  uint64_t v11 = v3;
  v4 = _Block_copy(&v6);
  v5 = v4;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 32)) {
    (*((void (**)(void *))v4 + 2))(v4);
  }
  else {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4, v6, v7, v8, v9);
  }
}

id __66___UIViewServiceImplicitAnimationDecodingProxy_forwardInvocation___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)_UIViewServiceImplicitAnimationDecodingProxy;
  return objc_msgSendSuper2(&v3, sel_forwardInvocation_, v1);
}

@end