@interface SWCTrackingDomainInfoClass
@end

@implementation SWCTrackingDomainInfoClass

Class __get_SWCTrackingDomainInfoClass_block_invoke(uint64_t a1)
{
  v3 = 0;
  if (!SharedWebCredentialsLibraryCore()) {
    __get_SWCTrackingDomainInfoClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("_SWCTrackingDomainInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_SWCTrackingDomainInfoClass_block_invoke_cold_2();
  }
  get_SWCTrackingDomainInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SWCTrackingDomainInfoClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *SharedWebCredentialsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WBSKnownTrackerFilter.m", 17, @"%s", *a1);

  __break(1u);
}

void __get_SWCTrackingDomainInfoClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_SWCTrackingDomainInfoClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"WBSKnownTrackerFilter.m", 18, @"Unable to find class %s", "_SWCTrackingDomainInfo");

  __break(1u);
}

@end