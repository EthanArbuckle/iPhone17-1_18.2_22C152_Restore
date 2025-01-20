@interface NSUserActivity
@end

@implementation NSUserActivity

void __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_2(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_3;
  block[3] = &unk_1E5DD0E78;
  id v5 = *(id *)(a1 + 32);
  id v6 = v2;
  id v7 = *(id *)(a1 + 48);
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_3(void *a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:a1[4]];
  [v2 setTitle:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

void __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photosuicore.user-activity-title", v2);
  v1 = (void *)px_requestActivityWithActivityType_titleProvider_completionBlock__queue;
  px_requestActivityWithActivityType_titleProvider_completionBlock__queue = (uint64_t)v0;
}

@end