@interface UIValidateAccountBasedDelegateRespondsToSelector
@end

@implementation UIValidateAccountBasedDelegateRespondsToSelector

void ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UIKit.accountBasedValidation", v2);
  v1 = (void *)qword_1EB264BD0;
  qword_1EB264BD0 = (uint64_t)v0;
}

void ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke_2(uint64_t a1)
{
  if (qword_1EB264BC0 != -1) {
    dispatch_once(&qword_1EB264BC0, &__block_literal_global_610);
  }
  if (_MergedGlobals_1295)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke_3;
    v4[3] = &unk_1E52D9CD0;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = v2;
    uint64_t v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("EnterpriseUtilities", &_block_invoke___s_category_13) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412802;
    v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "UIKit detected a client bug in an account based app: Delegate <%@: %p> does not respond to -%@", (uint8_t *)&v8, 0x20u);
  }
}

@end