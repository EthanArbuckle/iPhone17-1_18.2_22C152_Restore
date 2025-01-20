@interface NSObject
@end

@implementation NSObject

id __127__NSObject_MusicKit_SoftLinking_MPCPlayerResponseTracklist__musicKit_responseTracklist_underlyingSectionObjectAtIndexPathBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)(a1 + 32);
  v4 = [v3 structuredIndexPathForDisplayIndexPath:a2];
  v5 = [v3 items];

  v6 = objc_msgSend(v5, "sectionAtIndex:", objc_msgSend(v4, "section"));

  v7 = [v6 metadataObject];

  return v7;
}

@end