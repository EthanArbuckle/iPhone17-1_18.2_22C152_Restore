@interface TLKRoundedCornerLabels
- (NSMutableArray)roundedLabels;
- (TLKRoundedCornerLabels)init;
- (unint64_t)prominence;
- (unint64_t)sizeConfiguration;
- (void)setProminence:(unint64_t)a3;
- (void)setRoundedLabels:(id)a3;
- (void)setSizeConfiguration:(unint64_t)a3;
- (void)updateRoundedText:(id)a3;
@end

@implementation TLKRoundedCornerLabels

- (TLKRoundedCornerLabels)init
{
  v5.receiver = self;
  v5.super_class = (Class)TLKRoundedCornerLabels;
  v2 = [(TLKRoundedCornerLabels *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TLKRoundedCornerLabels *)v2 setRoundedLabels:v3];

    +[TLKLayoutUtilities deviceScaledRoundedValue:v2 forView:5.0];
    -[NUIContainerStackView setSpacing:](v2, "setSpacing:");
  }
  return v2;
}

- (void)setProminence:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_prominence = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(TLKRoundedCornerLabels *)self roundedLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) label];
        [v9 setProminence:a3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setSizeConfiguration:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_sizeConfiguration = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(TLKRoundedCornerLabels *)self roundedLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setSizeConfiguration:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)updateRoundedText:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__TLKRoundedCornerLabels_updateRoundedText___block_invoke;
  v6[3] = &unk_1E5FD3020;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(TLKRoundedCornerLabels *)self performBatchUpdates:v6];
}

void __44__TLKRoundedCornerLabels_updateRoundedText___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  v3 = [*(id *)(a1 + 40) roundedLabels];
  unint64_t v4 = [v3 count];

  if (v2 > v4)
  {
    do
    {
      id v5 = -[TLKRoundedCornerLabel initWithProminence:]([TLKRoundedCornerLabel alloc], "initWithProminence:", [*(id *)(a1 + 40) prominence]);
      -[TLKRoundedCornerLabel setSizeConfiguration:](v5, "setSizeConfiguration:", [*(id *)(a1 + 40) sizeConfiguration]);
      +[TLKLayoutUtilities requireIntrinsicSizeForView:v5];
      uint64_t v6 = [*(id *)(a1 + 40) roundedLabels];
      [v6 addObject:v5];

      [*(id *)(a1 + 40) addArrangedSubview:v5];
      unint64_t v7 = [*(id *)(a1 + 32) count];
      uint64_t v8 = [*(id *)(a1 + 40) roundedLabels];
      unint64_t v9 = [v8 count];
    }
    while (v7 > v9);
  }
  long long v10 = [*(id *)(a1 + 40) roundedLabels];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      unint64_t v13 = [*(id *)(a1 + 32) count];
      uint64_t v14 = [*(id *)(a1 + 40) roundedLabels];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v12];
      v16 = v15;
      if (v12 >= v13)
      {
        [v15 setHidden:1];
      }
      else
      {
        [v15 setHidden:0];

        uint64_t v14 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v12];
        v16 = [v14 string];
        v17 = [*(id *)(a1 + 40) roundedLabels];
        v18 = [v17 objectAtIndexedSubscript:v12];
        v19 = [v18 label];
        [v19 setText:v16];
      }
      ++v12;
      v20 = [*(id *)(a1 + 40) roundedLabels];
      unint64_t v21 = [v20 count];
    }
    while (v12 < v21);
  }
}

- (NSMutableArray)roundedLabels
{
  return self->_roundedLabels;
}

- (void)setRoundedLabels:(id)a3
{
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (unint64_t)sizeConfiguration
{
  return self->_sizeConfiguration;
}

- (void).cxx_destruct
{
}

@end