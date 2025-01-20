@interface UMLProviderSideEffects
- (UMLProviderSideEffects)init;
@end

@implementation UMLProviderSideEffects

- (UMLProviderSideEffects)init
{
  v7.receiver = self;
  v7.super_class = (Class)UMLProviderSideEffects;
  v2 = [(UMLProviderSideEffects *)&v7 init];
  if (!v2) {
    sub_2608D4DD0();
  }
  v3 = v2;
  v4 = objc_alloc_init(UMAppleKeyStoreProvider);
  sub_2608CA9E0((uint64_t)v3, v4);

  v5 = objc_alloc_init(UMFilesystemProvider);
  sub_2608CA9FC((uint64_t)v3, v5);

  return v3;
}

@end