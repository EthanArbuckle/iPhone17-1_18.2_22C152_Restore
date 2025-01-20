@interface DKApplicationActivityMetadataKeyClass
@end

@implementation DKApplicationActivityMetadataKeyClass

void __get_DKApplicationActivityMetadataKeyClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_1();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_DKApplicationActivityMetadataKey");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKApplicationActivityMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (_RECrossedFeature *)__get_DKApplicationActivityMetadataKeyClass_block_invoke_cold_1();
    [(_RECrossedFeature *)v2 _replaceDependentFeature:v4 withFeature:v5];
  }
}

Class __get_DKApplicationActivityMetadataKeyClass_block_invoke_0(uint64_t a1)
{
  CoreDuetLibrary_2();
  Class result = objc_getClass("_DKApplicationActivityMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKApplicationActivityMetadataKeyClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_DKApplicationActivityMetadataKeyClass_block_invoke_cold_1();
    return (Class)__get_DKIntentMetadataKeyClass_block_invoke_1(v3);
  }
  return result;
}

uint64_t __get_DKApplicationActivityMetadataKeyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[REPipedLocationDonor _locationFromDefaults](v0);
}

@end