@interface UILibArchiveStreamingReader
@end

@implementation UILibArchiveStreamingReader

uint64_t __60___UILibArchiveStreamingReader_readAllItemsWithBlock_error___block_invoke()
{
  return 1;
}

uint64_t __64___UILibArchiveStreamingReader_readLogicalItemsWithBlock_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _shouldReportAsLogicalItem:a2 withConfirmedAppleDoubleFiles:a3];
}

void __89___UILibArchiveStreamingReader__shouldReportAsLogicalItem_withConfirmedAppleDoubleFiles___block_invoke()
{
  v0 = (void *)_MergedGlobals_1019;
  _MergedGlobals_1019 = (uint64_t)&unk_1ED3EF980;
}

@end