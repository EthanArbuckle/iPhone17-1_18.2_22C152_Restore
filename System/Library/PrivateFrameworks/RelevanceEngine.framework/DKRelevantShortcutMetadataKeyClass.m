@interface DKRelevantShortcutMetadataKeyClass
@end

@implementation DKRelevantShortcutMetadataKeyClass

Class __get_DKRelevantShortcutMetadataKeyClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKRelevantShortcutMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKRelevantShortcutMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_DKRelevantShortcutMetadataKeyClass_block_invoke_cold_1();
    return (Class)RERelevanceEqualToRelevance(v3, v4);
  }
  return result;
}

uint64_t __get_DKRelevantShortcutMetadataKeyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[REDonatedActionFilteredCache _queue_removeDonation:](v0);
}

@end