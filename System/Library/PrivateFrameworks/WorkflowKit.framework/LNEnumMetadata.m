@interface LNEnumMetadata
@end

@implementation LNEnumMetadata

BOOL __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke(uint64_t a1, void *a2, const char *a3, id block)
{
  v7 = imp_implementationWithBlock(block);
  ClassMethod = class_getClassMethod(*(Class *)(a1 + 32), a3);
  TypeEncoding = method_getTypeEncoding(ClassMethod);
  Class = object_getClass(a2);
  return class_addMethod(Class, a3, v7, TypeEncoding);
}

id __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end