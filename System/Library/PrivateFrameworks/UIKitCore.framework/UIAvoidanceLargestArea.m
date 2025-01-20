@interface UIAvoidanceLargestArea
- (id)avoid:(id)a3 forClient:(id)a4 withCoordinator:(id)a5;
@end

@implementation UIAvoidanceLargestArea

- (id)avoid:(id)a3 forClient:(id)a4 withCoordinator:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v10 = objc_msgSend(v6, "allValues", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 unionSet:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [v7 avoidanceFrame];
  FindRectanglesAroundRectangles(v8, v9, v15, v16, v17, v18);
  [v8 sortUsingComparator:&__block_literal_global_644];
  v19 = [v8 lastObject];

  return v19;
}

uint64_t __58__UIAvoidanceLargestArea_avoid_forClient_withCoordinator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  [v4 CGRectValue];
  double v10 = v9;
  double v12 = v11;

  if (v6 * v8 < v10 * v12) {
    return -1;
  }
  else {
    return v6 * v8 > v10 * v12;
  }
}

@end