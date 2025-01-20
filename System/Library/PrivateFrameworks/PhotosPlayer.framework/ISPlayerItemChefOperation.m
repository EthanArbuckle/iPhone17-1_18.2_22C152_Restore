@interface ISPlayerItemChefOperation
@end

@implementation ISPlayerItemChefOperation

void __48___ISPlayerItemChefOperation__preparePlayerItem__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  v7 = v6;
  if (v6)
  {
    [v6 preferredTransform];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  [v5 setPreferredTransform:v8];
}

void __48___ISPlayerItemChefOperation__preparePlayerItem__block_invoke_59()
{
  v0 = (void *)_preparePlayerItem_InterpolationCurveControlPoints;
  _preparePlayerItem_InterpolationCurveControlPoints = (uint64_t)&unk_1F3554A98;
}

uint64_t __50___ISPlayerItemChefOperation__handleValuesDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preparePlayerItem];
}

void __34___ISPlayerItemChefOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleValuesDidLoad];
}

@end