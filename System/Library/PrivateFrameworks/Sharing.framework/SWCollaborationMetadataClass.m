@interface SWCollaborationMetadataClass
@end

@implementation SWCollaborationMetadataClass

Class __get_SWCollaborationMetadataClass_block_invoke(uint64_t a1)
{
  SharedWithYouCoreLibrary();
  Class result = objc_getClass("_SWCollaborationMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_SWCollaborationMetadataClass_block_invoke_cold_1();
  }
  get_SWCollaborationMetadataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SWCollaborationMetadataClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_SWCollaborationMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFCollaborationUtilities.m", 120, @"Unable to find class %s", "_SWCollaborationMetadata");

  __break(1u);
}

@end