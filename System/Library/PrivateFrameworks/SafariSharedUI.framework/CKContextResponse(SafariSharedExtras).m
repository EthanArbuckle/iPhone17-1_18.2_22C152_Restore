@interface CKContextResponse(SafariSharedExtras)
- (id)safari_topQIDsWithMaximumCount:()SafariSharedExtras;
@end

@implementation CKContextResponse(SafariSharedExtras)

- (id)safari_topQIDsWithMaximumCount:()SafariSharedExtras
{
  if (a3)
  {
    unint64_t v3 = a3;
    v4 = [a1 results];
    v5 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_7);

    if ([v5 count])
    {
      if ([v5 count] <= v3) {
        unint64_t v3 = [v5 count];
      }
      v6 = objc_msgSend(v5, "subarrayWithRange:", 0, v3);
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

@end