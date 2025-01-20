@interface MusicSubscriptionStatusHacks
+ (void)setupSubscriptionStatusHacks;
@end

@implementation MusicSubscriptionStatusHacks

+ (void)setupSubscriptionStatusHacks
{
  if (setupSubscriptionStatusHacks_sOnceToken != -1) {
    dispatch_once(&setupSubscriptionStatusHacks_sOnceToken, &__block_literal_global_2);
  }
}

void __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke(id a1)
{
  v1 = (objc_class *)objc_opt_class();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_2;
  v17[3] = &unk_CCB5B8;
  v17[4] = &v18;
  v17[5] = "getStatusWithOptions:statusBlock:";
  v2 = objc_retainBlock(v17);
  v3 = imp_implementationWithBlock(v2);
  InstanceMethod = class_getInstanceMethod(v1, "getStatusWithOptions:statusBlock:");
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  IMP v6 = class_replaceMethod(v1, "getStatusWithOptions:statusBlock:", v3, TypeEncoding);

  v19[3] = (uint64_t)v6;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_4;
  v12[3] = &unk_CCB600;
  v12[4] = &v13;
  v12[5] = "modifyLastKnownStatusUsingBlock:";
  v7 = objc_retainBlock(v12);
  v8 = imp_implementationWithBlock(v7);
  v9 = class_getInstanceMethod(v1, "modifyLastKnownStatusUsingBlock:");
  v10 = method_getTypeEncoding(v9);
  IMP v11 = class_replaceMethod(v1, "modifyLastKnownStatusUsingBlock:", v8, v10);

  v14[3] = (uint64_t)v11;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v18, 8);
}

void __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 objectForKey:SSVSubscriptionStatusOptionIgnoreCache];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    IMP v11 = +[ICMusicSubscriptionStatusController sharedStatusController];
    [v11 invalidateCachedSubscriptionStatusWithCompletionHandler:&__block_literal_global_4];
  }
  v12 = *(void (**)(id, void, id, id))(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v12) {
    v12(v13, *(void *)(a1 + 40), v7, v8);
  }
}

void __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void (**)(uint64_t, void))(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2) {
    v2(a2, *(void *)(a1 + 40));
  }
  id v3 = +[ICMusicSubscriptionStatusController sharedStatusController];
  [v3 invalidateCachedSubscriptionStatusWithCompletionHandler:&__block_literal_global_9];
}

@end