@interface UIViewDeferredAnimation
@end

@implementation UIViewDeferredAnimation

void __95___UIViewDeferredAnimation_calculateFrameValues_frameTimes_withFrameInterval_valueTransformer___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9 = a2;
  uint64_t v10 = *(void *)(a1 + 48);
  id v18 = v9;
  if (v10)
  {
    (*(void (**)(void))(v10 + 16))();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v9;
  }
  v12 = v11;
  if (v11)
  {
    double v13 = a3 + a4 >= a5 ? a5 : a3 + a4;
    [*(id *)(a1 + 32) addObject:v11];
    v14 = *(void **)(a1 + 40);
    v15 = [NSNumber numberWithDouble:v13];
    [v14 addObject:v15];

    if (a5 - v13 - *(double *)(a1 + 56) > 0.00000011920929)
    {
      [*(id *)(a1 + 32) addObject:v12];
      v16 = *(void **)(a1 + 40);
      v17 = [NSNumber numberWithDouble:a5];
      [v16 addObject:v17];
    }
  }
}

@end