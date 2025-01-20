@interface TVPInterstitialCollection
- (NSArray)interstitials;
- (NSArray)interstitialsWithAdjacentsMerged;
- (TVPInterstitialCollection)initWithInterstitials:(id)a3;
- (double)timeAdjustedByIncludingInterstitials:(double)a3;
- (double)timeAdjustedByRemovingInterstitials:(double)a3;
- (id)backingData;
- (id)interstitialForTime:(double)a3;
- (id)mergedInterstitialForTime:(double)a3;
- (void)setBackingData:(id)a3;
- (void)setInterstitials:(id)a3;
- (void)setInterstitialsWithAdjacentsMerged:(id)a3;
@end

@implementation TVPInterstitialCollection

- (TVPInterstitialCollection)initWithInterstitials:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TVPInterstitialCollection;
  v5 = [(TVPInterstitialCollection *)&v25 init];
  if (v5)
  {
    v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_0];
    objc_storeStrong((id *)&v5->_interstitials, v6);
    v7 = [MEMORY[0x263EFF980] array];
    uint64_t v8 = [(NSArray *)v5->_interstitials count];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    interstitials = v5->_interstitials;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __51__TVPInterstitialCollection_initWithInterstitials___block_invoke_2;
    v19 = &unk_264CC4FB0;
    uint64_t v23 = v8;
    v10 = v5;
    v20 = v10;
    v22 = v24;
    id v11 = v7;
    id v21 = v11;
    [(NSArray *)interstitials enumerateObjectsUsingBlock:&v16];
    id v12 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v13 = objc_msgSend(v12, "initWithArray:", v11, v16, v17, v18, v19);
    interstitialsWithAdjacentsMerged = v10->_interstitialsWithAdjacentsMerged;
    v10->_interstitialsWithAdjacentsMerged = (NSArray *)v13;

    _Block_object_dispose(v24, 8);
  }

  return v5;
}

uint64_t __51__TVPInterstitialCollection_initWithInterstitials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 timeRange];
  [v5 startTime];
  double v7 = v6;

  uint64_t v8 = [v4 timeRange];

  [v8 startTime];
  double v10 = v9;

  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 > v10;
  }
}

void __51__TVPInterstitialCollection_initWithInterstitials___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v22 = a2;
  if (*(void *)(a1 + 56) - 1 <= a3)
  {
    v5 = 0;
    if (!a3) {
      goto LABEL_7;
    }
LABEL_5:
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a3 + 1];
  if (a3) {
    goto LABEL_5;
  }
LABEL_7:
  double v6 = [v22 timeRange];
  [v6 startTime];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;

  if (!v5)
  {
LABEL_9:
    v14 = objc_alloc_init(TVPMutableInterstitial);
    v15 = [TVPTimeRange alloc];
    double v16 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v17 = [v22 timeRange];
    [v17 endTime];
    v19 = [(TVPTimeRange *)v15 initWithStartTime:v16 endTime:v18];

    [(TVPInterstitial *)v14 setTimeRange:v19];
    [*(id *)(a1 + 40) addObject:v14];
    if (v5)
    {
      v20 = [v5 timeRange];
      [v20 startTime];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v21;
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }

    goto LABEL_13;
  }
LABEL_8:
  uint64_t v8 = [v5 timeRange];
  [v8 startTime];
  double v10 = v9;
  id v11 = [v22 timeRange];
  [v11 endTime];
  double v13 = v12;

  if (v10 != v13) {
    goto LABEL_9;
  }
LABEL_13:
}

- (double)timeAdjustedByRemovingInterstitials:(double)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  interstitials = self->_interstitials;
  if (interstitials)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = interstitials;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      double v9 = 0.0;
      double v10 = 0.0;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        double v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        double v13 = objc_msgSend(v12, "timeRange", (void)v25);
        [v13 startTime];
        double v15 = v14 - v10;

        if (a3 <= v15) {
          break;
        }
        double v16 = [v12 timeRange];
        [v16 endTime];
        double v18 = v17;
        v19 = [v12 timeRange];
        [v19 startTime];
        double v21 = a3 - (v18 - v20);

        if (v21 - v15 >= 0.0) {
          a3 = v21 - v15;
        }
        else {
          a3 = 0.0;
        }
        double v9 = v9 + v15;
        id v22 = [v12 timeRange];
        [v22 endTime];
        double v10 = v23;

        if (v7 == ++v11)
        {
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      double v9 = 0.0;
    }

    return v9 + a3;
  }
  return a3;
}

- (double)timeAdjustedByIncludingInterstitials:(double)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_interstitials;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    double v8 = 0.0;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      double v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v10, "timeRange", (void)v19);
      [v11 startTime];
      double v13 = v12;

      if (v8 + a3 <= v13) {
        break;
      }
      double v14 = [v10 timeRange];
      [v14 startTime];
      a3 = a3 - (v15 - v8);

      double v16 = [v10 timeRange];
      [v16 endTime];
      double v8 = v17;

      if (v6 == ++v9)
      {
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8 + a3;
}

- (id)interstitialForTime:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(TVPInterstitialCollection *)self interstitials];
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 timeRange];
        int v10 = [v9 containsTime:a3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)mergedInterstitialForTime:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(TVPInterstitialCollection *)self interstitialsWithAdjacentsMerged];
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 timeRange];
        int v10 = [v9 containsTime:a3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (NSArray)interstitials
{
  return self->_interstitials;
}

- (void)setInterstitials:(id)a3
{
}

- (NSArray)interstitialsWithAdjacentsMerged
{
  return self->_interstitialsWithAdjacentsMerged;
}

- (void)setInterstitialsWithAdjacentsMerged:(id)a3
{
}

- (id)backingData
{
  return self->_backingData;
}

- (void)setBackingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backingData, 0);
  objc_storeStrong((id *)&self->_interstitialsWithAdjacentsMerged, 0);
  objc_storeStrong((id *)&self->_interstitials, 0);
}

@end