@interface PXStoryConcreteCompanionTimelineSegment
@end

@implementation PXStoryConcreteCompanionTimelineSegment

void __50___PXStoryConcreteCompanionTimelineSegment_assets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    v7 = (double *)(a4 + 16);
    v8 = (void *)(a5 + 8);
    do
    {
      if (*v8 == 1)
      {
        v9 = [*(id *)(a1 + 32) clipWithIdentifier:*(v8 - 1)];
        v10 = *(void **)(a1 + 40);
        v11 = -[_PXStoryConcreteCompanionTimelineAsset initWithFrame:clip:]([_PXStoryConcreteCompanionTimelineAsset alloc], "initWithFrame:clip:", v9, *(v7 - 2), *(v7 - 1), *v7, v7[1]);
        [v10 addObject:v11];
      }
      v7 += 4;
      v8 += 96;
      --v5;
    }
    while (v5);
  }
}

@end