@interface UMDProviderSideEffects
+ (id)sideEffects;
- (UMDProviderSideEffects)init;
@end

@implementation UMDProviderSideEffects

+ (id)sideEffects
{
  if (qword_1000E4028 != -1) {
    dispatch_once(&qword_1000E4028, &stru_1000D53A8);
  }
  v2 = (void *)qword_1000E4020;

  return v2;
}

- (UMDProviderSideEffects)init
{
  v14.receiver = self;
  v14.super_class = (Class)UMDProviderSideEffects;
  v2 = [(UMDProviderSideEffects *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)UMAppleKeyStoreProvider);
    sub_1000869F8((uint64_t)v2, v3);

    v4 = objc_alloc_init(UMCommPageProvider);
    sub_100019074((uint64_t)v2, v4);

    v5 = objc_alloc_init(UMDarwinDirectoryProvider);
    sub_100019084((uint64_t)v2, v5);

    id v6 = objc_alloc_init((Class)UMFilesystemProvider);
    sub_100019094((uint64_t)v2, v6);

    v7 = objc_alloc_init(UMMobileKeyBagProvider);
    sub_1000190A4((uint64_t)v2, v7);

    v8 = objc_alloc_init(UMKPersonaProvider);
    sub_1000190B4((uint64_t)v2, v8);

    v9 = objc_alloc_init(UMLibNotifyProvider);
    sub_1000190C4((uint64_t)v2, v9);

    v10 = objc_alloc_init(UMProcessProvider);
    sub_1000190D4((uint64_t)v2, v10);

    v11 = objc_alloc_init(UMSecurityProvider);
    sub_1000190E4((uint64_t)v2, v11);

    v12 = v2;
  }

  return v2;
}

@end