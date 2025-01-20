@interface DKApplicationMetadataKeyClass
@end

@implementation DKApplicationMetadataKeyClass

Class __get_DKApplicationMetadataKeyClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKApplicationMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKApplicationMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_DKApplicationMetadataKeyClass_block_invoke_cold_1();
    return __get_DKPredictionQueryClass_block_invoke(v3);
  }
  return result;
}

uint64_t __get_DKApplicationMetadataKeyClass_block_invoke_cold_1()
{
  return __get_DKPredictionQueryClass_block_invoke_cold_1();
}

@end