@interface UISmallerThanLargeContentSizeCategories
@end

@implementation UISmallerThanLargeContentSizeCategories

uint64_t ____UISmallerThanLargeContentSizeCategories_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)qword_1EB25B9D0;
  qword_1EB25B9D0 = (uint64_t)v0;

  [(id)qword_1EB25B9D0 addObject:@"UICTContentSizeCategoryXS"];
  [(id)qword_1EB25B9D0 addObject:@"UICTContentSizeCategoryS"];
  v2 = (void *)qword_1EB25B9D0;
  return [v2 addObject:@"UICTContentSizeCategoryM"];
}

@end